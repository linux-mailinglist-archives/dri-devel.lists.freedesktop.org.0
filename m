Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B41FC28102
	for <lists+dri-devel@lfdr.de>; Sat, 01 Nov 2025 15:27:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA1910E008;
	Sat,  1 Nov 2025 14:27:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="L5Yny+Rq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F169010E008
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Nov 2025 14:27:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E2275601D9
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Nov 2025 14:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A1EC16AAE
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Nov 2025 14:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762007265;
 bh=lV3WbcP4L63VVdKmRFHTW2IFkZA0MqVRd2TKiW7+rwE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=L5Yny+RqR6ejBT6dWjFU5SPnufclvSK/b4ZmkHgMH6VFD/mWp5pBe6NBwWJvKh9WQ
 dsgceBxVUt+AO2fGJ7F7f4vOLZIkAgGFHdATQcvg9q0kcr9iabq4uwwJWy9kUzAwa/
 DoFWq7t+6T2yv6Ptrc+1xMFw9+2PuFR79bBKtT5OVGW5QUlQ4CXg6r4756IW3Qb5v7
 7J0q4ufSMc/E670BHmPOvjV+CV0F5R1Wsu0m4YJP2ZnJbv3BDCkn6uHoqDdpjcqTGE
 GNEOyFEnh+Zc8PEnjyMQkOUWtgLc+S/vNujsiam8gFVG3pcxFUM8cBPBRvB7oe3FfY
 5Cs7n7Dvgpnyw==
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2955623e6faso5346265ad.1
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Nov 2025 07:27:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXXK32r7yE2m+QzQlSG/xdnBrF8tcJz3foW9pKpynwkfZApDnZ5z9VypbsS8ryg0z7qLTMDppqopt4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlIDTJPWDtwpp2ld6qo8+paxhUqG8Sha7xG1XnyD/xYq//f5xD
 iIQSMCbgI2jlRsMbnDvVY5VMlRESuG9S7Tby890QFssg9tnYoO51qOHnv4NrANSReEyZkM/qjx2
 elfCvtob+MjqYa6hBVId01RMbEF18sg==
X-Google-Smtp-Source: AGHT+IGnOFjLL6wAsT9pv5cIhcF/90Mw/1kp/7g3CvXtV1RTTu/pF5hz4dyECsPv9IpJsPMLjLxpTdmcXg7a1NiMbbo=
X-Received: by 2002:a17:903:24f:b0:295:24ab:fb06 with SMTP id
 d9443c01a7336-29524abfc57mr60471485ad.22.1762007265054; Sat, 01 Nov 2025
 07:27:45 -0700 (PDT)
MIME-Version: 1.0
References: <20251024202756.811425-1-ariel.dalessandro@collabora.com>
In-Reply-To: <20251024202756.811425-1-ariel.dalessandro@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 1 Nov 2025 14:27:32 +0000
X-Gmail-Original-Message-ID: <CAAOTY__Ac8S3gnbx6RbVZrNzMcqSkE70xuq5ErbzAWPUh9moAA@mail.gmail.com>
X-Gm-Features: AWmQ_bn-FuEPLjCksrS_ODh-bQvHMz1N_UARyqPo_gbgBDuh1txOjH8bx8rhYo0
Message-ID: <CAAOTY__Ac8S3gnbx6RbVZrNzMcqSkE70xuq5ErbzAWPUh9moAA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Disable AFBC support on Mediatek DRM driver
To: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 simona@ffwll.ch, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, greenjustin@chromium.org, 
 sjoerd@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ariel D'Alessandro <ariel.dalessandro@collabora.com> =E6=96=BC 2025=E5=B9=
=B410=E6=9C=8824=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=888:28=E5=AF=
=AB=E9=81=93=EF=BC=9A
>
> Commit c410fa9b07c32 ("drm/mediatek: Add AFBC support to Mediatek DRM
> driver") added AFBC support to Mediatek DRM and enabled the
> 32x8/split/sparse modifier.
>
> However, this is currently broken on Mediatek MT8188 (Genio 700 EVK
> platform); tested using upstream Kernel and Mesa (v25.2.1), AFBC is used =
by
> default since Mesa v25.0.
>
> Kernel trace reports vblank timeouts constantly, and the render is garble=
d:
>
> ```
> [CRTC:62:crtc-0] vblank wait timed out
> WARNING: CPU: 7 PID: 70 at drivers/gpu/drm/drm_atomic_helper.c:1835 drm_a=
tomic_helper_wait_for_vblanks.part.0+0x24c/0x27c
> [...]
> Hardware name: MediaTek Genio-700 EVK (DT)
> Workqueue: events_unbound commit_work
> pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> pc : drm_atomic_helper_wait_for_vblanks.part.0+0x24c/0x27c
> lr : drm_atomic_helper_wait_for_vblanks.part.0+0x24c/0x27c
> sp : ffff80008337bca0
> x29: ffff80008337bcd0 x28: 0000000000000061 x27: 0000000000000000
> x26: 0000000000000001 x25: 0000000000000000 x24: ffff0000c9dcc000
> x23: 0000000000000001 x22: 0000000000000000 x21: ffff0000c66f2f80
> x20: ffff0000c0d7d880 x19: 0000000000000000 x18: 000000000000000a
> x17: 000000040044ffff x16: 005000f2b5503510 x15: 0000000000000000
> x14: 0000000000000000 x13: 74756f2064656d69 x12: 742074696177206b
> x11: 0000000000000058 x10: 0000000000000018 x9 : ffff800082396a70
> x8 : 0000000000057fa8 x7 : 0000000000000cce x6 : ffff8000823eea70
> x5 : ffff0001fef5f408 x4 : ffff80017ccee000 x3 : ffff0000c12cb480
> x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000c12cb480
> Call trace:
>  drm_atomic_helper_wait_for_vblanks.part.0+0x24c/0x27c (P)
>  drm_atomic_helper_commit_tail_rpm+0x64/0x80
>  commit_tail+0xa4/0x1a4
>  commit_work+0x14/0x20
>  process_one_work+0x150/0x290
>  worker_thread+0x2d0/0x3ec
>  kthread+0x12c/0x210
>  ret_from_fork+0x10/0x20
> ---[ end trace 0000000000000000 ]---
> ```
>
> Until this gets fixed upstream, disable AFBC support on this platform, as
> it's currently broken with upstream Mesa.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
