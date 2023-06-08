Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3406272836E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 17:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D3510E5CC;
	Thu,  8 Jun 2023 15:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A808410E03D
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 15:16:11 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-33b04c8f3eeso2295205ab.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jun 2023 08:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686237368; x=1688829368;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CJwtygG96EsLUnJEr5SXwbHpM9NJlbjJDKOEG9/I2wc=;
 b=jLRAJDAM1zP/l86YOfAUElwb1YY+B1bfoeDLM24tXf5PfMeRwy/scpuLqQxbnAhAb2
 7voLW0llPtDcxBZpUgwmHEvDuNNi3Bofwyu9pgkYBFtYyvEe2iXn8MNfnBsi1VO7MK4s
 4Ft2n+3qMY814s6FSDFC+PALRvZGjeaBjUwfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686237368; x=1688829368;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CJwtygG96EsLUnJEr5SXwbHpM9NJlbjJDKOEG9/I2wc=;
 b=gGWkKp2qf5hP14QClIo1OGqcERJjoQpSUf0aYBrxSrNlO8Pduc9d2EK//vZSIgBj3I
 pEOmZ6uFFlIilVPQkxBhuRODZ5cOV7Q2WZ3zlMOpgFg/IDmHMxVZ0l7Rm0180RI1Sgb4
 8LIfe71GIxmQZZWhi5zorXl8NZT3YnycEFrRAPBGpatLjdIk2ZzLG4j7Mxvku1IHAra7
 ugJ+zULMa7yog5CoOrWEMMVjNRITj326GnIcaBom7KQv/XciAeJ1TvlcoEpOEaQpF9sf
 URPu/9/9n2ju69hyVp+Ej99vGWj3GKeqC4FDU43wj/ULBjSoFTFRGE51cNxbzIxrOQMS
 +xKw==
X-Gm-Message-State: AC+VfDzXv/9ySuzMZKR44Nhd0/dLoNjESJXUC2gR/XPHweEolIKSS08J
 DSZYB0E4Oc2SitfT7zRp8aL6y6FPMsLYeo2xric=
X-Google-Smtp-Source: ACHHUZ5eBdL/6WRcNQegpS2vQJqJ53T5p/zezX4glxrpGiV/B7RGG16tuwk+BwXmm/wsqy0MR2bgdQ==
X-Received: by 2002:a92:b00f:0:b0:338:1b0f:28ec with SMTP id
 x15-20020a92b00f000000b003381b0f28ecmr7191557ilh.15.1686237368536; 
 Thu, 08 Jun 2023 08:16:08 -0700 (PDT)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com.
 [209.85.166.182]) by smtp.gmail.com with ESMTPSA id
 o16-20020a92c050000000b003339733e374sm430523ilf.86.2023.06.08.08.16.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jun 2023 08:16:07 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-33b7f217dd0so149255ab.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jun 2023 08:16:06 -0700 (PDT)
X-Received: by 2002:a05:6e02:20e1:b0:335:5940:5ca6 with SMTP id
 q1-20020a056e0220e100b0033559405ca6mr212512ilv.13.1686237366240; Thu, 08 Jun
 2023 08:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230608012443.839372-1-suhui@nfschina.com>
In-Reply-To: <20230608012443.839372-1-suhui@nfschina.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 8 Jun 2023 08:15:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WqmqaKXG20MuMwjwyR-8deFF7+chqphN=hiJ05mfC=HA@mail.gmail.com>
Message-ID: <CAD=FV=WqmqaKXG20MuMwjwyR-8deFF7+chqphN=hiJ05mfC=HA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge: ti-sn65dsi86: Avoid possible buffer
 overflow
To: Su Hui <suhui@nfschina.com>
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 andersson@kernel.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, u.kleine-koenig@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jun 7, 2023 at 6:25=E2=80=AFPM Su Hui <suhui@nfschina.com> wrote:
>
> Smatch error:buffer overflow 'ti_sn_bridge_refclk_lut' 5 <=3D 5.
>
> Fixes: cea86c5bb442 ("drm/bridge: ti-sn65dsi86: Implement the pwm_chip")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index 7a748785c545..4676cf2900df 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -298,6 +298,10 @@ static void ti_sn_bridge_set_refclk_freq(struct ti_s=
n65dsi86 *pdata)
>                 if (refclk_lut[i] =3D=3D refclk_rate)
>                         break;
>
> +       /* avoid buffer overflow and "1" is the default rate in the datas=
heet. */
> +       if (i >=3D refclk_lut_size)
> +               i =3D 1;
> +

Looks great now, thanks!

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Unless someone beats me to it or objects, I'll plan to commit this to
drm-misc-fixes early next week.

-Doug
