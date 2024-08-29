Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 850DE964940
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 16:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0057110E6F2;
	Thu, 29 Aug 2024 14:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UfUr/3gG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF1510E6F2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 14:56:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BCDD2A44110
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 14:55:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6103CC4CEC3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 14:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724943364;
 bh=Wa7GEC+jmKeo4NSPW1Bo0oimfIIbKS9WMiWx2F1YMMI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UfUr/3gGVA3aySXOeeNVdUpeDbxqN2i9g3FvtooXpWy7a9+AV2Z+AUhvZFTDtW0cj
 ijUnF16/ekARaheHS783rlUwngZn6F2zbJ88dZobL/0wP03OCCUwgS2FcQpGCvEe/0
 sRfEI90qWQOHfc3QeoHfbQPY7+b5zdufsBuldxJHjnLQ6EHLjnwKID9TFHo5bx2tka
 FepC0lHnUF7xk/c810ydVnCXD7Ta9+hmc6brQ8N7JjCY1IsgTlxMyUmp6uh/5vm+es
 3F3iS5J/aaNHYHnidDhAK7KCWRkJf8jsoLlDcu4fUeLpqNYqI/9hHjvngUCHny5Y3w
 +eL76R5jhPR1g==
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-714262f1bb4so612468b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 07:56:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWU2QqBFfmA/DFPP/z/emnfx6i5uiMLa54OfSSKivTBhiVYVVxhfblv0ptSX81OXgUagPwksD7GKCg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEGdpKkr1NgsNXErTutFZFzNZWZ15VYgw2oDUoMqMrKO+V3Zk0
 xcZbY/i35VNsHJ3XhiJytg6cHuW4154+zxRQCHO2vTaSPG1td0SahWAxUEsngdObmCTbueN5MbQ
 LDmfx3a90BIr5G09yBHISqhJY0g==
X-Google-Smtp-Source: AGHT+IHOHmvJGn9XBz6AncThotzVydHX29A8RmV2+ScX8Y16nl8lRqvlZcttdvPWazADk9wtRFMpp2To9vbVhRKrL9g=
X-Received: by 2002:a05:6a00:21c4:b0:70d:2583:7227 with SMTP id
 d2e1a72fcca58-715dfb6917bmr3828262b3a.6.1724943363419; Thu, 29 Aug 2024
 07:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240827-drm-fixup-0819-v3-0-4761005211ec@mediatek.com>
In-Reply-To: <20240827-drm-fixup-0819-v3-0-4761005211ec@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 29 Aug 2024 22:56:17 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-LX_aLLJpquJSYMu1uQ4v0nbEToVOBnV7Qr4vwBtoauA@mail.gmail.com>
Message-ID: <CAAOTY_-LX_aLLJpquJSYMu1uQ4v0nbEToVOBnV7Qr4vwBtoauA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Fix missing configuration flags in
 mtk_crtc_ddp_config
To: jason-jh.lin@mediatek.com
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Singo Chang <singo.chang@mediatek.com>, 
 Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 CK Hu <ck.hu@mediatek.com>
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

Hi, Jason:

I squash this series into one patch and apply to mediatek-drm-next [1], tha=
nks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

Jason-JH.Lin via B4 Relay
<devnull+jason-jh.lin.mediatek.com@kernel.org> =E6=96=BC 2024=E5=B9=B48=E6=
=9C=8827=E6=97=A5 =E9=80=B1=E4=BA=8C
=E4=B8=8B=E5=8D=8810:56=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
> Change in v3:
> Change config_lock from spin_lock to spin_lock_irqsave
>
> Change in v2:
> Add spin_lock protection for config_updating flag.
>
> ---
> Jason-JH.Lin (2):
>       drm/mediatek: Fix missing configuration flags in mtk_crtc_ddp_confi=
g()
>       drm/mediatek: change config_lock from spin_lock to spin_lock_irqsav=
e
>
>  drivers/gpu/drm/mediatek/mtk_crtc.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> ---
> base-commit: 469f1bad3c1c6e268059f78c0eec7e9552b3894c
> change-id: 20240819-drm-fixup-0819-f51e2d37fcd7
>
> Best regards,
> --
> Jason-JH.Lin <jason-jh.lin@mediatek.com>
>
>
