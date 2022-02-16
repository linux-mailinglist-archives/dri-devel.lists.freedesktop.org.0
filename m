Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 716CA4B94AF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 00:46:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC92D10E628;
	Wed, 16 Feb 2022 23:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45CB710E643
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 23:46:45 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 s1-20020a056830148100b005acfdcb1f4bso1796261otq.4
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 15:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Kwpt2sUL3NJ3srh/WboVkkXpszIC4Q/LDD+d6HlrRIY=;
 b=AUTTrQBHC7mixxUEkiAyUTrlGDju362Lne/nNGvQKLuIbcK//xaWuktOnM1G7jEe0r
 fZflm5jVwEUnMm07DDH+FGTzbyAGA3lnCdUkx3Bve7SskIoGdOV5qqbZAjFrm0xrJWZG
 ScOC3Qo1++xQahNQgIO3enbM/sharIUzhMepw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Kwpt2sUL3NJ3srh/WboVkkXpszIC4Q/LDD+d6HlrRIY=;
 b=sU0pJacRmCm9xFSo+UVScdeyyW/0MvJIJE9kGjVOEY1/QL8KLU71LMib8Hx/AbmbTr
 +Ye/dr5g08l52b0W1XKPWHgoJGT7A+Ae2PS/c0kRq7B37G/6uWmEGfWe0ZiBvQTIGp7e
 bN2GL/6tJq/PIxAEeeeQLSPxz2CFo+r7iS97XORvaF0kV1ccoG2g+zYcSIx4LjEftklF
 LPB/jgp0W2UZA+aOx8FaPMZpRF7UTZBFHGN6Fc/a3aw18nIhUaPZ3vt9ZcnU+XbV0t6O
 5JXDNZ6mED5ENIMvL4/uNK/g2wh8yxFE2ed1W6exRWZVH2ViIPrASCxKjh+UiOWD/cLS
 wACg==
X-Gm-Message-State: AOAM533BqBxWydKtltLsfaFQCco1ZBxnz0AHUWwhM4XuyA0Hm3RXR0Px
 eLsaI6sZzwSdECV54QxIvsG5CiIclBLIu3j/Z9y7Tw==
X-Google-Smtp-Source: ABdhPJzvDBotbDuvYSRUTv7F8cbOMwR37rDKbNepWqplPiPt+4QJBmOCl44hw7yykOd5pe0TK555IzBledo4gwXDL1M=
X-Received: by 2002:a9d:7687:0:b0:59e:da8c:5d32 with SMTP id
 j7-20020a9d7687000000b0059eda8c5d32mr114110otl.77.1645055204515; Wed, 16 Feb
 2022 15:46:44 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Feb 2022 15:46:44 -0800
MIME-Version: 1.0
In-Reply-To: <1643828199-8564-4-git-send-email-quic_khsieh@quicinc.com>
References: <1643828199-8564-1-git-send-email-quic_khsieh@quicinc.com>
 <1643828199-8564-4-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 16 Feb 2022 15:46:44 -0800
Message-ID: <CAE-0n534MH7ih4nKbjY5EewcZ0J73Zp_A=Q-CJ0M_z3nWoVaVQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/msm/dp: replace DRM_DEBUG_DP marco with
 drm_dbg_dp
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-02-02 10:56:39)

Please add some commit text

> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_audio.c   |  49 +++++++++++------
>  drivers/gpu/drm/msm/dp/dp_catalog.c |  34 +++++++-----
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 106 +++++++++++++++++++-----------------
>  drivers/gpu/drm/msm/dp/dp_display.c |  68 +++++++++++++----------
>  drivers/gpu/drm/msm/dp/dp_drm.c     |   4 +-
>  drivers/gpu/drm/msm/dp/dp_link.c    |  99 +++++++++++++++++++--------------
>  drivers/gpu/drm/msm/dp/dp_panel.c   |  43 +++++++++------
>  drivers/gpu/drm/msm/dp/dp_parser.c  |   2 +-
>  drivers/gpu/drm/msm/dp/dp_power.c   |  20 ++++---
>  9 files changed, 246 insertions(+), 179 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
> index d7e4a39..4fbbe0a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
> @@ -136,7 +136,8 @@ static void dp_audio_stream_sdp(struct dp_audio_private *audio)
>         parity_byte = dp_audio_calculate_parity(new_value);
>         value |= ((new_value << HEADER_BYTE_1_BIT)
>                         | (parity_byte << PARITY_BYTE_1_BIT));
> -       DRM_DEBUG_DP("Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
> +       drm_dbg_dp((struct drm_device *)NULL,

Why can't we pass the platform device pointer? Surely the cast is not
necessary and in fact harmful.
