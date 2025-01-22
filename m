Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F265A199F5
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 21:41:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7759C10E3CF;
	Wed, 22 Jan 2025 20:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="luaNaTiz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8A510E3CF
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 20:41:45 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5401be44b58so260998e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 12:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1737578502; x=1738183302;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CeKckZXJsx5nLwBr4k5o3e3ESc0QYwyLZenWZndLFfY=;
 b=luaNaTizuVAePmyIii5Q1cnrg8pMWMDPNSPwFcEwKhMTnlX62rA8SMGMvuWcE4x+dE
 btn3cgbaLRmiw4ry4lboX4KZu+cPXYkdfgHniaOOoB+0ShqSSZpTA5xQ0znU+tHfuc6b
 92D/+8zVpkirAxO3jTL+qpaVsQ5CQlT25J+bQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737578502; x=1738183302;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CeKckZXJsx5nLwBr4k5o3e3ESc0QYwyLZenWZndLFfY=;
 b=u7VWXKOFnZAK+WVzMh1UfALI/Iuh4TsoUIPwfLsORluPvTEuRaGm2q5ifZZczuE0YC
 8Z2wvQPb+gKlzGrtYy4g8RfuOMhO6Xr5ty0E0EfWAtt796poYaySS4bANSGRk5JQFSsO
 1RlaenQbXl7yN+Y9nOWuyYwkKa2XZQi758Y13LZNhA52xDoMrj0dhe1sKcq/cshoBTPr
 hxi3cW1ZL8D0Fgy90XnkbiqPbu16kU9/4j7F6/rMbOI/Z64EB/H2tkkZRa2nP8rtc1mg
 MG/wbwSj5L/uoS+K/3iXxQlffhXxKsYj33gPVoyK0dRkX8r32UwC02mEXvgisrGtbSyr
 wEVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWlxuphyK5IU9cBF7GOomisFt+1QnC7sZCgs+TNiNCjPN2xT+w+uu9drTxHEGCF78ILVfZxy1OZ/0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8eigp8BLvLgqHUfnUAgB0Gvdxlgz/TRoGdzERS2Mz5D9+CDZL
 u8abGxjM3Oicv6AYQr7BYr2GFDnPBATarRC1GkRODAXRBf2Gpcf45r4yXv0YJPc6ruoQ6XTMNgl
 Ggw==
X-Gm-Gg: ASbGnctJC8mCuGrr7FuqQlk+mqMnR1P861GIZ5qBhJxDl7tX+DovJTXkT9kLeGZt7TJ
 cf27fxjtISciVFHaaa6OvMQsLkPJyf9X0vQtvZA7U6OppFJjFPcO8rixThNws6963rBnlpIdurf
 DOaGq4tzQMIhj1zRzVhAoykp4w9SS+37bGLxQoOoCKpYkW7n9tifNSe+2MG7dV5etcASEJng5Sz
 Z8Fvf88pHNRyHF3mfK1DXzTWa9W5IId+JxMD3I1yB9CSBwSThjHdkzantz80GC2S7U3JehUkdgp
 93GwGHZO4lIANxxzqEYUe+rwB3KvQ3DYow==
X-Google-Smtp-Source: AGHT+IEy2dewnt6HdC0Uz9HB6etYbWLZWOKPVcZZyCgLNSxbQXyIHJ/LkrLIupk2fILOWYmQYH0OtA==
X-Received: by 2002:a05:6512:1247:b0:542:98e0:7c67 with SMTP id
 2adb3069b0e04-5439c27d401mr8467825e87.51.1737578502497; 
 Wed, 22 Jan 2025 12:41:42 -0800 (PST)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af0630asm2405573e87.41.2025.01.22.12.41.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jan 2025 12:41:41 -0800 (PST)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-53e3c47434eso203263e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 12:41:41 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWkciziO8gONpWr3N+yA/J9cA0X0vTc7y73PNA88npeLeohZseXdv7QMmqs3w6J82QkSiy3Pf/R7AQ=@lists.freedesktop.org
X-Received: by 2002:a05:6512:3ca9:b0:542:9636:2981 with SMTP id
 2adb3069b0e04-5439c2417b3mr6875945e87.29.1737578500958; Wed, 22 Jan 2025
 12:41:40 -0800 (PST)
MIME-Version: 1.0
References: <20250122082340.1603169-1-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20250122082340.1603169-1-yelangyan@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 22 Jan 2025 12:41:29 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WXYUoWxgpktxp=nniq4bzD0GZsZ5i6-G7hbxwb2SpPTg@mail.gmail.com>
X-Gm-Features: AbW1kvbOwXxoew3Zgpq3Ohfz9jIicwLEd69ve_HvWBJej8sWkr74rbAB-K7uaj4
Message-ID: <CAD=FV=WXYUoWxgpktxp=nniq4bzD0GZsZ5i6-G7hbxwb2SpPTg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add STA 116QHD024002
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
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

On Wed, Jan 22, 2025 at 12:23=E2=80=AFAM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> Add support for the STA 116QHD024002, pleace the EDID here for
> subsequent reference.
>
> 00 ff ff ff ff ff ff 00 4e 81 09 00 00 00 00 00
> 26 21 01 04 a5 1a 0e 78 02 1e b5 9a 5f 57 94 26
> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 8e 1c 56 a0 50 00 1e 30 28 20
> 55 00 00 90 10 00 00 18 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 fe 00 20
> 20 20 20 20 20 0a 20 20 20 20 20 20 00 00 00 fe
> 00 31 31 36 51 48 44 30 32 34 30 30 32 0a 00 3b
>
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 1721a3397dbf..73b8938f175b 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1808,6 +1808,13 @@ static const struct panel_delay delay_200_150_e50 =
=3D {
>         .enable =3D 50,
>  };
>
> +static const struct panel_delay delay_200_500_e250_po2e200 =3D {
> +       .hpd_absent =3D 200,
> +       .unprepare =3D 500,
> +       .enable =3D 250,
> +       .powered_on_to_enable =3D 200,
> +};

I don't believe you need "powered_on_to_enable" here. The docs for
"powered_on_to_enable" say:

* This doesn't normally need to be set if timings are already met by
* prepare_to_enable or enable.

In this case "enable" is 250 ms, which subsumes the 200 ms
"powered_on_to_enable".

Can you confirm and then re-post without the "powered_on_to_enable" setting=
?

Thanks!

-Doug
