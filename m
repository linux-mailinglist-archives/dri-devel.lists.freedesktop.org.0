Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC326B0CCA5
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 23:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8204C10E2BB;
	Mon, 21 Jul 2025 21:32:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NeaqjCTB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA91810E2BB
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 21:32:11 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-b26f5f47ba1so3817974a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 14:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753133529; x=1753738329;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PTuqv5W1Us8MwatktgHES96DPtPaN3TVJ69w/425bso=;
 b=NeaqjCTBAb6Gfei9NDbA3ZIjHgPcSCYEqe1QlNDjRxlTXOZ13OLcYIMmVPdSTQagxV
 ftdzv1L6hnnUQXUu5nxaxMQ3j73gLejGvSqIlctJoQZOAj/Cr2Th0iSAzPfBl0OfVgoU
 K7c69TW9F6UUqgf6eAU4VwazqlBA2jJp+JXRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753133529; x=1753738329;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PTuqv5W1Us8MwatktgHES96DPtPaN3TVJ69w/425bso=;
 b=TF9MCBpXUfw+SVwiv61vRT7AdrvSBUicxqQOhxmgu0Uex9A+uYjhRD51hxSzfH7gMW
 17Y0MPVUkDTSJyQ3Vg8odBnp5FlxfFEQLj+UhPgonNn/PzXf3xpGfEdIMP6AwHAm83oP
 wBpjTUS2hyZLEs5XZRLZoUG+pk/SFy6tw3vW1U0n2pbguYTU6p6HNh4PB/GBuwlEFbMa
 LTTlmZeWzUJkhuJBm5YD3Ex2SE7RR4pJCKgXQ/Gt5/D7j9ILzY1ixZzQj0wnkadTi7GL
 sVHcm/bJ8fBFS1Wy1elbW0XUV+uAjwxCmP1U7WLesWwpaNhZ7AMr6EjIzh2GNYr02UlP
 FQFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpv1B7qHMbgLq5SCnBaXL+5QiqS+lY3wlJNVRUjaPBWm34vBhJ8yqmFJyNZKMSgFxmy03qnYGIvEs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGWncmJlmDs2ForBKfapMZ0NjlCIOkOilbVXU6zNoSyjPrpV6y
 V92C509OLU3ueVndhBVARJbstgHvQSI0qErbRbuKvZwxOhUO2y5mG8c2pB7Rx0/VvoehBg4yDQQ
 CaDs=
X-Gm-Gg: ASbGncvF+ny86xMPCNdjWpvhK1YOmyAnGyZ4uOQTYYRLOEA6y5n4herUZJzTszWpttc
 BALCuSaC5iLzqPXIalTkQ5rERtI9OFLdzlmoCPuUR2eYMXWZsQuXATIKXBNZFII4zYnAd1USWVP
 2oPY2eUM0o2Ln2wrDbLmW7pwxy5xpc8fmA/6DFlSsKmVHxDWY3+WMgAeqg2tr34QC6wPvyeLoDz
 QftIuO/nfgCdsEPRAe30tqgEq7iLtSEr8XeS+UIfHgLceP8waq2INTt5eOEZLM8MMyCTYZTk3xF
 Ih2WEg0HuZjLS1qxqTzWIzfxMcq379EbqkTTvwAK98RZEt23PnTTfqg1e66B8w3BqhnMSLZ7nSy
 svb8Atlr/HpKayx+LE6xOMTo8PJDm0J4U+2X/ExS8EBG4aDCsP6UCQPMgwoA1pQ==
X-Google-Smtp-Source: AGHT+IEslKCNM5T3IY3L466ZlI7tWeJcYbu95f37chuCMIQQT6gBSPRvo1l0GKjym36uJeOIO7H6Pw==
X-Received: by 2002:a17:90b:544f:b0:312:26d9:d5b2 with SMTP id
 98e67ed59e1d1-31c9f2b5292mr34410299a91.0.1753133529483; 
 Mon, 21 Jul 2025 14:32:09 -0700 (PDT)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com.
 [209.85.216.51]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e3f6eb900sm110298a91.0.2025.07.21.14.32.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jul 2025 14:32:08 -0700 (PDT)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-311d5fdf1f0so3845439a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 14:32:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUiljIQUhqU+5Lrw1k1yYsSMvcr/1L4/oscUwt6lf1JvF558fzCTMvJ7JPAg5gKZspR0uxwUaWZRog=@lists.freedesktop.org
X-Received: by 2002:a17:90b:4985:b0:313:2e69:8002 with SMTP id
 98e67ed59e1d1-31c9f42eb2dmr31809815a91.20.1753133527556; Mon, 21 Jul 2025
 14:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250721061627.3816612-1-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20250721061627.3816612-1-yelangyan@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 21 Jul 2025 14:31:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W6+QDHUsddpqu0CRkZx9nKrDJJDLpW3=yYg5dNB9v_Eg@mail.gmail.com>
X-Gm-Features: Ac12FXwwI3u6culzX5cwj_QNkl2DfHMaC1fyguJBg3p2p64B2i9L5-xwj2ZevQ0
Message-ID: <CAD=FV=W6+QDHUsddpqu0CRkZx9nKrDJJDLpW3=yYg5dNB9v_Eg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add disable to 100ms for MNB601LS1-4
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
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

On Sun, Jul 20, 2025 at 11:16=E2=80=AFPM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> For the MNB601LS1-4 panel, the T9+T10 timing does not meet the
> requirements of the specification, so disable is set to 100ms.
>
> Fixes: 9d8e91439fc3 ("drm/panel-edp: Add CSW MNB601LS1-4")
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 9a56e208cbdd..09170470b3ef 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1828,6 +1828,13 @@ static const struct panel_delay delay_50_500_e200_=
d200_po2e335 =3D {
>         .powered_on_to_enable =3D 335,
>  };
>
> +static const struct panel_delay delay_200_500_e50_d100 =3D {
> +       .hpd_absent =3D 200,
> +       .unprepare =3D 500,
> +       .enable =3D 50,
> +       .disable =3D 100,
> +};
> +

Bleh, we really need to find a better way to sort these structures
instead of just jamming them onto the end. ...or find some C
compiler/preprocessor magic to define them automatically without
wasting tons of space. In any case, not new to your patch...


>  #define EDP_PANEL_ENTRY(vend_chr_0, vend_chr_1, vend_chr_2, product_id, =
_delay, _name) \
>  { \
>         .ident =3D { \
> @@ -1984,7 +1991,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>
>         EDP_PANEL_ENTRY('C', 'S', 'W', 0x1100, &delay_200_500_e80_d50, "M=
NB601LS1-1"),
>         EDP_PANEL_ENTRY('C', 'S', 'W', 0x1103, &delay_200_500_e80_d50, "M=
NB601LS1-3"),
> -       EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50, "MNB60=
1LS1-4"),
> +       EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50_d100, "=
MNB601LS1-4"),

Reviewed-by: Douglas Anderson <dianders@chromium.org>

...and pushed to drm-misc-next:

[1/1] drm/panel-edp: Add disable to 100ms for MNB601LS1-4
      commit: 9b3700b15cb581d748c3d46e7eb30ffced1642e8
