Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DB36EBF19
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 13:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB2F10E11B;
	Sun, 23 Apr 2023 11:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89EA10E11B
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Apr 2023 11:10:44 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-b992ed878ebso8443330276.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Apr 2023 04:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1682248243; x=1684840243;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2eFW5efwwBqXN+63TX0MOdAdwsQC1SDauQx5WufFwsY=;
 b=ibonDWRzoHd5of/pidIDGmBtkuh43qLSABHuGV6Et1rFWHgY0BJQfgBvMZQEYA/sGM
 w663weSmacR6YYJhN7YUzg5z9OTdzYVNtChPUF17XNhtKArPfpT6528bHyIXdErwpY4V
 CJKmMgNNMp3Ku0VWUmZjKm3aIiNOafGmjmUDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682248243; x=1684840243;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2eFW5efwwBqXN+63TX0MOdAdwsQC1SDauQx5WufFwsY=;
 b=RDHOkw5iCEduRhQriHV1Irm3cPrwSxYGpibi97ziijGWQ8/VPsoLnzsoi3RtWIHIPu
 eaWZmCsxvEjfPZKrAsxWrvaYJ2T90WfrHL2hR7FgT5D6eonILBeuXJ4YqrU9S9K+wfMU
 O+D9a5LKKvqdhx0wbcmyca9iTXOItpzElLMn8WEntwhQafpXOlOVVA7Jhqa6KFrJcnIa
 kStUeFGY3HB7KyqRgPIRKUF1mvWr2XBcSFHOe2k7ANr7qiusaDwURRuuZ3Rp4bdSKtdV
 HZeIuTe37kWT0a5L7liRAuYomgGvZafmUgvcBL39qIT+bwhQGLk+YoF6i/S2a59rahEi
 xdVw==
X-Gm-Message-State: AAQBX9f7jkoHDwetHiOkALZ4fgJegnfKKgv/iBn/UG90BTbsXA0w0oKB
 GK8WFEk7Ur2Czi+elEaVFeFt+tXcQhao5PsHTDwrwA==
X-Google-Smtp-Source: AKy350aEHy74GgpT4oILD+SYYTtrv/Lox7Si1kSBSYwnbpKqp+rYnuSGSsAYN2ceN29nEV2VAg9+A0cC7U2u6ePURwc=
X-Received: by 2002:a81:9a58:0:b0:52e:e90b:5e2 with SMTP id
 r85-20020a819a58000000b0052ee90b05e2mr6572538ywg.1.1682248243212; Sun, 23 Apr
 2023 04:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230414181641.8868-1-hymmsx.yu@gmail.com>
 <CAMty3ZD=SVZg=EQO9-mxPp9TZzu2hOpZ8qDP5asE276zbTJ7Zg@mail.gmail.com>
 <CAMpKc0mZ-0tyQTssCpdfByhq1b2uX8WOa=D-CuLrHHooKgz4Nw@mail.gmail.com>
In-Reply-To: <CAMpKc0mZ-0tyQTssCpdfByhq1b2uX8WOa=D-CuLrHHooKgz4Nw@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Sun, 23 Apr 2023 16:40:31 +0530
Message-ID: <CAMty3ZAcg6BXywmQZfk2PMSWyi8-+3i-oFnNETw3fRepDaG0Pw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge:Fix the panic problem caused by
 bridge->funcs->attach
To: =?UTF-8?B?5L2Z5rK75Zu9?= <hymmsx.yu@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ Bridge Maintainers

On Wed, Apr 19, 2023 at 8:35=E2=80=AFAM =E4=BD=99=E6=B2=BB=E5=9B=BD <hymmsx=
.yu@gmail.com> wrote:
>
> The log looks like this:
> [ 31.723823] Internal error: Oops: 96000004 [#1] SMP\013 \010
> [ 31.729030] Modules linked in:\013 \010
> [ 31.733395] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.10.59+2.0.0 #250=
\013
> \010
> [ 31.745167] pstate: 60c00005 (nZCv daif +PAN +UAO -TCO BTYPE=3D--)\013 \=
010
> [ 31.752785] pc : drm_bridge_attach+0xdc/0x1a4\013 \010
> [ 31.757518] lr : drm_bridge_attach+0x40/0x1a4\013 \010
> [ 31.762104] sp : ffff0000000678f0\013 \010
> [ 31.765726] x29: ffff0000000678f0 x28: ffff00000031c880 \013 \010
> [ 31.771599] x27: 0000000000000060 x26: ffff800010539e90 \013 \010
> [ 31.777340] x25: ffff0000000a6000 x24: ffff000000129c10 \013 \010
> [ 31.783060] x23: 0000000000000000 x22: ffff0000000131c0 \013 \010
> [ 31.788770] x21: ffff80001052a5b8 x20: ffff0000003e2c80 \013 \010
> [ 31.794506] x19: ffff000000017080 x18: 0000000000000010 \013 \010
> [ 31.800210] x17: 000000005fcfcd6c x16: 00000000d27b105e \013 \010
> [ 31.805907] x15: 00000000000000c7 x14: ffff0000000675d0 \013 \010
> [ 31.811599] x13: 00000000ffffffea x12: ffff8000114158c0 \013 \010
> [ 31.817282] x11: 0000000000000003 x10: ffff800011295880 \013 \010
> [ 31.823000] x9 : ffff8000112958d8 x8 : 000000000017ffe8 \013 \010
> [ 31.828731] x7 : c0000000fffeffff x6 : 0000000000000001 \013 \010
> [ 31.834425] x5 : 000000000057ffa8 x4 : 0000000000000000 \013 \010
> [ 31.840101] x3 : 0000000000000000 x2 : ffff000000013218 \013 \010
> [ 31.845787] x1 : ffff0000003e2cf8 x0 : 0000000000000000 \013 \010
> [ 31.851594] Call trace:\013 \010
> [ 31.854603] drm_bridge_attach+0xdc/0x1a4\013 \010
> [ 31.859079] dw_mipi_dsi_bridge_attach+0x98/0xa8\013 \010
> [ 31.864035] drm_bridge_attach+0x104/0x1a4\013 \010
> [ 31.869211] dw_mipi_dsi_bind+0x24/0x58\013 \010
> drm_bridge_attach will call bridge->funcs in many cases, so I think it is=
 necessary to check=E3=80=82

I don't think the bridge pointer or bridge->funcs pointer is NULL
here. It looks like the controlling is attaching the bridge prior to
registering it. If I remember correctly, I got a similar issue with
rockchip-drm pipeline. Would you please share your pipeline as well?

Thanks,
Jagan.
