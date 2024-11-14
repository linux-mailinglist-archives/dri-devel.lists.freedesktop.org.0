Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE369C93A7
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 22:01:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD0110E371;
	Thu, 14 Nov 2024 21:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="UsDzwPYY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E83510E371
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 21:01:34 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-539e8607c2aso1151091e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 13:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1731618092; x=1732222892;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YnUKVo16ukwoIjQKD09CO7Jp33xMIiEIYirHJ325zac=;
 b=UsDzwPYY7URLOwsTek2TJmLfMvFjrvFTw6c9wRfRg77rWXxGoNu7usN9Ck3ZgHyHb6
 dIZVjcGiOup+SURPHp9x885GJh8lbaEOGJ2lakcBjHOksLpS9jSJoNENE2uRZ/JzB1CO
 r/TYQn7jRUJzl3moIS5QDbydASNzikDGdvn/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731618092; x=1732222892;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YnUKVo16ukwoIjQKD09CO7Jp33xMIiEIYirHJ325zac=;
 b=dbYk9X2BaAkaOUZyDMdMj/IcWfPykq++QJ4CEaDOBwVTVD0K2VqvSk6100caN7Zgv+
 mFUn/LoaJxweJBvnFBawZZNmDI6L2wcvrPIN/wb4m8/PKUfRFxJa1Gu5YB3k1w6dB7ut
 w23Fpw4zqQ6mm1ZEwcUEoTGU1wbmhhBJE9oxvuWukDx87HrS2n77+3yE9XnDY2FuaGPD
 nx51Ds4zdsa8+8/AKmDiktYpbMsNsyYxuFSQdJn8AXCieJ0LS0uV0A9cJFhId/E/P84h
 3i+VKe/+DMLT3iCDzzG/dWqb+tmaki2W9wcJ5ukLV0kLQxFHoulk0Kd6Po9IgfkmEhUc
 YmZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWt9JBYn4eJWs2Zj/fM0JO6LAQVPIvdWXW+lYRwRsnZlndxk0kkimRkziyMykLao2dD0FmQvzi4gpQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywh6U57MtFM/7D7LT/ZTWeLaOqDk2Uti+QxG0JyCpis2hcD59CO
 lSHo3xirgvR3g9B/WQTI5Wy99yitDtqBaG7WEWVc/nHJ8uktyYIMDcS/mzYWwynx8zeZ9uAuw+i
 8jQ==
X-Google-Smtp-Source: AGHT+IFs4tU7wcxSmAMA+X885VS1o+AHoFAefcm51Io8+8TkdALxsJiQxANbgVBH8YsweEr5S4vJPQ==
X-Received: by 2002:a05:6512:3b9e:b0:539:9524:92bc with SMTP id
 2adb3069b0e04-53dab3bbfdbmr68472e87.55.1731618091540; 
 Thu, 14 Nov 2024 13:01:31 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
 [209.85.208.182]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53da64fff90sm307500e87.61.2024.11.14.13.01.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 13:01:30 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2fb6110c8faso10601691fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 13:01:30 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUC1dsWulRgNa0SedYbF2uLkrD6gi06xjIvRCGTeSvsrO30Az2f5BjSlB+h3jZGdGtbExnxlNqksj4=@lists.freedesktop.org
X-Received: by 2002:a05:651c:88a:b0:2fe:fec7:8adf with SMTP id
 38308e7fff4ca-2ff609be35fmr1805451fa.38.1731618089985; Thu, 14 Nov 2024
 13:01:29 -0800 (PST)
MIME-Version: 1.0
References: <20241113090022.332586-1-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20241113090022.332586-1-yelangyan@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Nov 2024 13:01:18 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V_jYygpcCcU0H7UOL2AY5vbg-y0UpJczwWBKyc4+L8kA@mail.gmail.com>
Message-ID: <CAD=FV=V_jYygpcCcU0H7UOL2AY5vbg-y0UpJczwWBKyc4+L8kA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add KDB KD116N2130B12
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: thierry.reding@gmail.com, sam@ravnborg.org, airlied@gmail.com, 
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Hi,

On Wed, Nov 13, 2024 at 1:00=E2=80=AFAM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> Add support for the KDB KD116N2130B12, pleace the EDID here for
> subsequent reference.
> 00 ff ff ff ff ff ff 00 2c 82 07 17 00 00 00 00
> 1c 21 01 04 95 1a 0e 78 0a 63 25 99 5b 5d 96 26
> 18 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 87 1b 56 88 50 00 0e 30 28 20
> 55 00 00 90 10 00 00 18 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fe
> 00 4b 44 31 31 36 4e 32 31 33 30 42 31 32 00 17
>
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 012dfbcb9475..5355acd52f0b 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1978,6 +1978,12 @@ static const struct panel_delay delay_200_500_e50_=
po2e200 =3D {
>         .powered_on_to_enable =3D 200,
>  };
>
> +static const struct panel_delay delay_200_150_e50 =3D {
> +       .hpd_absent =3D 200,
> +       .unprepare =3D 150,
> +       .enable =3D 50,
> +};
> +
>  #define EDP_PANEL_ENTRY(vend_chr_0, vend_chr_1, vend_chr_2, product_id, =
_delay, _name) \
>  { \
>         .ident =3D { \
> @@ -2134,6 +2140,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('K', 'D', 'B', 0x0624, &kingdisplay_kd116n21_30nv=
_a010.delay, "116N21-30NV-A010"),
>         EDP_PANEL_ENTRY('K', 'D', 'B', 0x1118, &delay_200_500_e50, "KD116=
N29-30NK-A005"),
>         EDP_PANEL_ENTRY('K', 'D', 'B', 0x1120, &delay_200_500_e80_d50, "1=
16N29-30NK-C007"),
> +       EDP_PANEL_ENTRY('K', 'D', 'B', 0x1707, &delay_200_150_e50, "KD116=
N2130B12"),

In the future, please post patches against upstream Linux. For
panel-edp.c, you'd ideally want to post against
drm-misc/drm-misc-next. Specifically, in upstream the entry right
before your new one should have been "'K', 'D', 'B', 0x1212", not
"'K', 'D', 'B', 0x1120". That's been upstream for the last 6 months...

In any case, I'll resolve the conflict this time since it's trivial.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] drm/panel-edp: Add KDB KD116N2130B12
      commit: ae4a812a64dad3fd4f7bbcd7af215cb68af8cf8c

-Doug
