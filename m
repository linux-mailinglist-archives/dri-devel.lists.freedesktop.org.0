Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 049FA6480A5
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 11:10:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60FEE10E515;
	Fri,  9 Dec 2022 10:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D32710E514
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 10:09:58 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id j16so3212459qtv.4
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Dec 2022 02:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MET+kFCxdRFSOqLhj+cqUkWiO2GHijv7TD+TrYs2J6g=;
 b=kFdKU6KSVYPDZISxGfROglkB3ZJTj3dRX1Du6W30RJq8g0X0WSQjCEmBOvtNMNocY2
 zHyRz6BEiFAiLB9C6n3ReZ8+ic9XG62DtNyAxLnOd9TLr1OfCY8ZbgfxLd1XVCySUf6t
 rTQ3s/vX1ifn6/0cqR4oRPHiDpik8s6XOOlBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MET+kFCxdRFSOqLhj+cqUkWiO2GHijv7TD+TrYs2J6g=;
 b=p8j8TJA8ZO5dtQZ0Oca42EO7xPmBVidHUlaMlZNMeksNOh3eAOamDrY5wsxL2NHepJ
 fTF5M2Dl7Xn4c2VidSUDySEkJOWvcre1uzUcPz1skfLnImx/fqH0EF/d5G4d+bpVUbG1
 ONVLjpWZIV8Lmn7vEgVnRNjVWLtTp5TXpgXkds5+u5uIOkP47acCnBsimDmNquldGZND
 CnaGWCYF/v/g1+1EbRfsHqXtFTyb3buu+QwRaAbmF+j4H4UwxqxJ6byfOSmBcBKdMBjb
 NQEQRxAiv2LKmp5MY+Us+Zzl1vpMahJNBjsjb+aszxNohj4GJHAsyDDCgGdvSv9nqw84
 PdPg==
X-Gm-Message-State: ANoB5pmkjVqbYLVWHmudVpPVHlbVXAQehUGmM1o1eGGkE2IdxiHbMVo/
 A/k6Gr7zclkAdg12nMCUxoBdPvjPqzIPI48/yuJPOg==
X-Google-Smtp-Source: AA0mqf6fKRu84ern+dyhkt1nbBBrIimUzYhW8E7dwHUKYjkvzXRubt0s00UaPIfc5fUgi7GXtsXAHLl3cD81X/21SDs=
X-Received: by 2002:ac8:6798:0:b0:3a7:fda5:1a89 with SMTP id
 b24-20020ac86798000000b003a7fda51a89mr1146949qtp.108.1670580597239; Fri, 09
 Dec 2022 02:09:57 -0800 (PST)
MIME-Version: 1.0
References: <20221209030418.713935-1-xji@analogixsemi.com>
In-Reply-To: <20221209030418.713935-1-xji@analogixsemi.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 9 Dec 2022 18:09:31 +0800
Message-ID: <CAJMQK-hTDv9FwQboeV2v9KwrNKAdYDjsEqCHcOqxqc2tkJEavA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: keep last configure timing
To: Xin Ji <xji@analogixsemi.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 bliang@analogixsemi.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 9, 2022 at 11:05 AM Xin Ji <xji@analogixsemi.com> wrote:
>
> Sometimes kernel may resume back quickly after suspend,
> and DRM not call .mode_set() to re-config
> display timing before calling .atomic_enable(), bridge
> driver with this patch to keep last configure timing.
>
> Signed-off-by: Xin Ji <xji@analogixsemi.com>

Acked-by: Hsin-Yi Wang <hsinyi@chromium.org>

> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index b0ff1ecb80a5..eb9116503b63 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1403,7 +1403,6 @@ static void anx7625_stop_dp_work(struct anx7625_data *ctx)
>  {
>         ctx->hpd_status = 0;
>         ctx->hpd_high_cnt = 0;
> -       ctx->display_timing_valid = 0;
>  }
>
>  static void anx7625_start_dp_work(struct anx7625_data *ctx)
> --
> 2.25.1
>
