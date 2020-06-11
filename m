Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 009401F6AAB
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 17:14:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0B96E926;
	Thu, 11 Jun 2020 15:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E746E922;
 Thu, 11 Jun 2020 15:14:38 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id n24so6879556ejd.0;
 Thu, 11 Jun 2020 08:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RhhbWkTa6xWV0deLfaJXoyvtvAs5iTNkvkhb8jfaq6Y=;
 b=V6b+DZohDm/hDfiEq33KTHTOYZKmKHXtH9CXlUKI9J3Rmnfq8hF9vsaZiV3GZbZkGN
 vQo1l0toScYIZhA50AZUN6pllNtCM51xVgBnmrqUjL46cPreHZNGj36MFoo9RLQxERso
 unyu1r2ieWrdTIfvdYZO6czJqKoHdr6E74rsBCHi08GzN+oE/ZMpMAHObv3HAhKkKhpP
 NHWyLSLgjxp6TJOJz4yiymx/S/ioV6GL8rV3K5magWDu9N3zM981N56CRWruTNB3DRcv
 bbTEZoirL61WiBzk51psQ6/RkDol54ZOnrpJvw5c3ollGbbxs027E5BLALrMLQjZaFBZ
 3ozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RhhbWkTa6xWV0deLfaJXoyvtvAs5iTNkvkhb8jfaq6Y=;
 b=RbjjRNbHdXBm2lz9gkGEiRwO2qpdpf1Wz/IZZw88NRNQLzKhm7EYhrDsOcKc/8opJ6
 WFv7tdzoY4HXzVjwoxwna/VeXeJwKbPebHR0wZXJ3bILDB4E7Pnw+Lfjwac79A2CnByC
 8sMqJZ0WVmUB3aquBYt0Ab9waLnWD++sYlES/lpmNSApg0GJu3CpRttgL74agJBy1XtD
 U+TVxUpUBd68KVCLSOyakxDRtAETDOudTDd8WihonCvK7euDtbV5pgf//JMKLJc0lpgX
 y0g6WcbbOBgEDfGFKlEWJuDFZRankTATXmw5rLRinvSaULEh7EgJmNrSEFM+kGoDxmp0
 8j5Q==
X-Gm-Message-State: AOAM530ZSvc2001TPCdRS8uJWgy4d67Y7eT3d0YV6QKOvPve8+/F0AwA
 a5n4BAFeWHNVcq5x2ekvdaCqQdnz1QesnB+0hZk=
X-Google-Smtp-Source: ABdhPJytx7mXiKtufAO92EdC9cVGt6I9RCacutPRVjzVuRfL1EdBtKdRZC45eZpis81SCNqGUNS/sYXxiSkjls/4Ke8=
X-Received: by 2002:a17:906:aac8:: with SMTP id
 kt8mr9063624ejb.460.1591888477088; 
 Thu, 11 Jun 2020 08:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <1591880115-12721-1-git-send-email-mkrishn@codeaurora.org>
In-Reply-To: <1591880115-12721-1-git-send-email-mkrishn@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 11 Jun 2020 08:15:03 -0700
Message-ID: <CAF6AEGtczybJU=_MUnGK3uzfnbgh-PDgAZmp7Fod=9Fc0T=fjg@mail.gmail.com>
Subject: Re: [v1] drm/msm/dpu: request for display color blocks based on hw
 catalog entry
To: Krishna Manikandan <mkrishn@codeaurora.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 11, 2020 at 5:55 AM Krishna Manikandan
<mkrishn@codeaurora.org> wrote:
>
> From: Kalyan Thota <kalyan_t@codeaurora.org>
>
> Request for color processing blocks only if they are
> available in the display hw catalog and they are
> sufficient in number for the selection.
>

I believe this should have:

Fixes: e47616df008b ("drm/msm/dpu: add support for color processing
blocks in dpu driver")

> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 63976dc..9f8de77 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -521,7 +521,7 @@ static struct msm_display_topology dpu_encoder_get_topology(
>                         struct dpu_kms *dpu_kms,
>                         struct drm_display_mode *mode)
>  {
> -       struct msm_display_topology topology;
> +       struct msm_display_topology topology = {0};
>         int i, intf_count = 0;
>
>         for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
> @@ -537,7 +537,8 @@ static struct msm_display_topology dpu_encoder_get_topology(
>          * 1 LM, 1 INTF
>          * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
>          *
> -        * Adding color blocks only to primary interface
> +        * Adding color blocks only to primary interface if available in
> +        * sufficient number
>          */
>         if (intf_count == 2)
>                 topology.num_lm = 2;
> @@ -546,8 +547,11 @@ static struct msm_display_topology dpu_encoder_get_topology(
>         else
>                 topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
>
> -       if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI)
> -               topology.num_dspp = topology.num_lm;
> +       if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
> +               if (dpu_kms->catalog->dspp &&
> +                       (dpu_kms->catalog->dspp_count >= topology.num_lm))
> +                       topology.num_dspp = topology.num_lm;
> +       }
>
>         topology.num_enc = 0;
>         topology.num_intf = intf_count;
> --
> 1.9.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
