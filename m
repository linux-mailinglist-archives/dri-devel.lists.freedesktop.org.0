Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DF3A9F9D6
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 21:45:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C1A10E24F;
	Mon, 28 Apr 2025 19:45:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="i6AYAtnE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1952D10E24F
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 19:45:11 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-b13e0471a2dso3839396a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 12:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1745869510; x=1746474310;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aZxk2qDFzusmDUPvRVv1xooykDuhZrrXcD8mPPsnc9s=;
 b=i6AYAtnEi1qf8SB/03ZO38BSAlKrdyvDxDs3J4ZrCh2QxjizWJZ7S0SpUaorI54GyL
 C47+IKwjZMGAhl38lq5w1ftnhGG/9EacOXXsoqFEUFNqFX5hgeNyyyrzEkZ5yJMdImi+
 y58SXFytSEzccbc/W9R1kfAWJP65rlpfcyB8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745869510; x=1746474310;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aZxk2qDFzusmDUPvRVv1xooykDuhZrrXcD8mPPsnc9s=;
 b=vnNQxx5EKTPawWxU9qBgCxAOqPoFfxnzaqZwJ7Ld3mNXZOBX3Hrc02mmb/qJlewPaP
 vKAZ5qJNcRnizNNm88S1MLbPDVPhlQuszxEb+OUhaGSakXS+zoFzdxySaX+fVNh61N1u
 XrxXknqegeFew6um8Fpun6L0wHQ/EdSONhay3kUFphvIT4I3PmINRA0iPo5DHMQaRx3x
 Zh1Tf5fGvniCKn+BfR/lvpbpyswudrPONReG6z8LZIQQ4keYQfCQ3bVVjmVs4UNzswnH
 gYn0p8fahW8N9hrb5qURxtZVsSQXEhnWqAd3mrEQrlLqy5XygcgHi1AD+43dPz1UKoYA
 MFLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqZ+lbP+mDhvvmnMQgc1Z9B9TdnWZgC77I2nS6JPee8WQj5avBsQy15cZgKD+QW0IWdBE+1L1D080=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYr9jOV7vsp2o0Vw60thY/b8mW1dZq5nbkuvNaNpdhikSICTDj
 JDBeFmLwDgGVzYjtmn1GTSv73jzDsNYDpmwmh1p6nfMgzBUqTcULIDBt22iE0i0FPImwHKSXvys
 =
X-Gm-Gg: ASbGncuIqDAKQpx1yZdLjLPGCrXcdIWKyuiRIsz+GXpv2dxCeMwMfr/2h67CCfmQVHz
 /rbEMmjChScKvw3mo32lK2W5Ngx4n8w9soR+6482ICpSlcRhNA318A6IpgsSxosqWZ1yJ98E2fk
 m3w/TA/sMF0y7Mase1ixz94nF4rYgEGDleWhabT0AAC2dSnKQ25Gpe0VoLDZfvQyvn+IbFivEUK
 O4QSvhZfunchxUvRhR44LwWISHhFBo95Qt3SiWlSe+UIv0AXp6d9BmPMj9EP7bNT0+oIyKWbjTs
 pSp0rywNJILAfadqyWN+0nL5wE5arQwiBBpgYZRXjdkn6ZwWgDCtwCO29Ba73PPb4WQHCQoSOR6
 Gn1Vo
X-Google-Smtp-Source: AGHT+IHvAClgnh5cDFNwmvJE8b5czvUsS+1u4egIAb31puzlTxVg+7aREbvAo/d3c5E5gbvdzE6+IQ==
X-Received: by 2002:a17:90b:6c4:b0:2f5:747:cbd with SMTP id
 98e67ed59e1d1-30a0132d6d1mr17283958a91.18.1745869509789; 
 Mon, 28 Apr 2025 12:45:09 -0700 (PDT)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com.
 [209.85.216.42]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-309f77417d6sm7664035a91.4.2025.04.28.12.45.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 12:45:09 -0700 (PDT)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-308702998fbso4432220a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 12:45:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUCmr0LoB9NreGIgrAuxv6UxzAdoEc36vp/xGnNvoPFNGAF44VLBqgT5eA/V6rKUQjaCmFuMow/O5g=@lists.freedesktop.org
X-Received: by 2002:a17:90a:8a88:b0:30a:214e:befc with SMTP id
 98e67ed59e1d1-30a214ebfe5mr1256694a91.27.1745869508777; Mon, 28 Apr 2025
 12:45:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250421113637.27886-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20250421113637.27886-3-xiazhengqiao@huaqin.corp-partner.google.com>
In-Reply-To: <20250421113637.27886-3-xiazhengqiao@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 12:44:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UF7Jz6mtx14dEV0udLti9ssU_rK88DvJmf2x39kr1cWQ@mail.gmail.com>
X-Gm-Features: ATxdqUHz1VL7o00_0SZbd4hPRDtUuNMfZKAxGJksy3VoNmYs7sifB67JMfU74Yc
Message-ID: <CAD=FV=UF7Jz6mtx14dEV0udLti9ssU_rK88DvJmf2x39kr1cWQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/panel-edp: Add support for BOE NE140WUM-N6S
 panel
To: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
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

On Mon, Apr 21, 2025 at 4:37=E2=80=AFAM Zhengqiao Xia
<xiazhengqiao@huaqin.corp-partner.google.com> wrote:
>
> BOE NE140WUM-N6S EDID:
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 09 e5 73 0d 00 00 00 00
> 32 22 01 04 a5 1e 13 78 07 13 45 a6 54 4d a0 27
> 0c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 03 3e 80 a0 70 b0 48 40 30 20
> 36 00 2e bc 10 00 00 1a 00 00 00 fd 00 1e 78 99
> 99 20 01 0a 20 20 20 20 20 20 00 00 00 fc 00 4e
> 45 31 34 30 57 55 4d 2d 4e 36 53 0a 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 45
>
> 70 20 79 02 00 22 00 14 33 d8 04 85 7f 07 9f 00
> 2f 00 1f 00 af 04 47 00 02 00 05 00 81 00 13 72
> 1a 00 00 03 01 1e 78 00 00 5a 4a 5a 4a 78 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ad 90
>
> Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com=
>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 958d260cda8a..92844ab4cb9c 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1757,6 +1757,13 @@ static const struct panel_delay delay_200_500_e80_=
d50 =3D {
>         .disable =3D 50,
>  };
>
> +static const struct panel_delay delay_200_500_e80_p2e80 =3D {
> +       .hpd_absent =3D 200,
> +       .unprepare =3D 500,
> +       .enable =3D 80,
> +       .prepare_to_enable =3D 80,
> +};

Unless I'm mistaken, you don't need to add this timing. See the docs
for `prepare_to_enable`, where the relationship between the `enable`
and `prepare_to_enable` delay is documented. Specifically, see:

* In other words:
*   prepare()
*     ...
*     // do fixed prepare delay
*     // wait for HPD GPIO if applicable
*     // start counting for prepare_to_enable
*
*   enable()
*     // do fixed enable delay
*     // enforce prepare_to_enable min time

Given that the fixed delay is 80 ms in your timings it seems
impossible to ever need the `prepare_to_enable` delay. ...so you can
just leave the `prepare_to_enable` off, which means you can just use
`delay_200_500_e80` like many of the other BOE panels.


> +
>  static const struct panel_delay delay_80_500_e50 =3D {
>         .hpd_absent =3D 80,
>         .unprepare =3D 500,
> @@ -1916,6 +1923,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x09c3, &delay_200_500_e50, "NT116=
WHM-N21,836X2"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x094b, &delay_200_500_e50, "NT116=
WHM-N21"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0951, &delay_200_500_e80, "NV116=
WHM-N47"),
> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0d73, &delay_200_500_e80_p2e80, =
"NE140WUM-N6S"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x095f, &delay_200_500_e50, "NE135=
FBM-N41 v8.1"),

Please sort. 0x0d73 does not come between 0x0951 and 0x095f.
