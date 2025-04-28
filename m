Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CE0A9F9E6
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 21:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1A010E225;
	Mon, 28 Apr 2025 19:48:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="jlsZi3qw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7FEE10E225
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 19:48:14 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-7398d65476eso4215451b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 12:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1745869690; x=1746474490;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G0adi9DhX8MYHy7k1qpIqlgCc21eraVmwDj/uOvVW9U=;
 b=jlsZi3qw4vCSuhum2AOWy8gw5tf+48KtdsTPNQc4PFOxTTarX5jK+fAFb1L3ftyYj0
 bh95PnracFaELFmEwaZCTiNJJ77mEwoiiOILmcYna4FVFxXh/2FxjfIIpooe2GBgE7cb
 jNKQRaOVg/anJyGfqNI9s+xNIt/90fNyPPC6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745869690; x=1746474490;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G0adi9DhX8MYHy7k1qpIqlgCc21eraVmwDj/uOvVW9U=;
 b=uLlxmo+mWPju3e3c5Jv9JX3pK35wNZMv7uhkRJeAod1AJIwug45eo/6haJ0hGEkg19
 lxQjY3xvcEZ0vhqfXf+P97Wx4xJz4zyvYIyIb5rNEwRuD50lCiXKRB4zINo0dNT/hZJ7
 LlEsyFxHCp0LsnGGD2iY26qLqngyTY+H+OowvmpbXhW+kKilOZJ3h0s9JU+thozQW+sA
 QynltsqUZwqyr1k8zgyeKAP0XNndAYwfpq+KhHiRihksn76Gfe/FBmsWZ7ZP/g98ooKT
 P+xbYzEjg79kZIzwEbnVr2/N5OeUQjbuiE3sUkpiu7PmcT3G/xCTn5ykojHKadRborXI
 nnDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7iJ2YA4VQsanxxMpWY6JQzzZ4J3iESgYwiCIDdTdtxAHOL0R1MXQ2/yj7y4VqsbOHZw0LglZtIsc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjGrhIy3Hdls+4o2JoitS/N8Ao3UDhVs+RvgMEjr5fFrjulnZC
 /r4nHpifWKdDynGBunk7sq6g3UOJOewaBQHd6DWE9gtVv4XrOQ1TryJofUsUC3DChiVHiYQj4hE
 =
X-Gm-Gg: ASbGncsykJjbFktideF7A4qjzQNT8Xga3uc987lpSvsMLIJ62hgqh3c0nchalldQk/h
 TLN4nO8uso7/SC+O/V9t1t26ghIjsezpUKCfFJYqcLwXoecLi+cVPl+CcT7qvRwFd+Wl3YB2sVT
 YkTDfahCI2rFKxm7vyYq0TITuvMhqK4E9LWssmezM6pWIXd+Jznx04KVLitllAYJqlZ49/DprSe
 mEkL5DE8Pip2xEh0PFcGQ3E2fplcvXwMcWwA3Nnxps0JaYBz8tNDKhsuJ/bASSpyhHu+X1B2A0C
 NmwHanwF/n6A4/5+5WPtDmUwD9ZB55vSyEgCrs3x5Qpt15EtzdMLbYBUVdqng9QYyAeQs+DPQn9
 twGlTHgfU
X-Google-Smtp-Source: AGHT+IH0Hi9XzaJOrzqlhd5ldD/Tv0bZLeyw00GgAiptaY2ADiIujLLGfg4hjaYi9y2soLNd+mmo5w==
X-Received: by 2002:a05:6a00:2e94:b0:737:cd8:2484 with SMTP id
 d2e1a72fcca58-74028a23104mr662359b3a.6.1745869690622; 
 Mon, 28 Apr 2025 12:48:10 -0700 (PDT)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com.
 [209.85.214.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25a9a64esm8375334b3a.127.2025.04.28.12.48.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 12:48:08 -0700 (PDT)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-223f4c06e9fso45562615ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 12:48:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXCL80d77sDqLucMw42X2ghtP/HapiFhaPqEXHWDUWnZNhnDQk6nt+GcclDo00OFJr980DHcGOMKEc=@lists.freedesktop.org
X-Received: by 2002:a17:903:2c7:b0:215:9eac:1857 with SMTP id
 d9443c01a7336-22de6bddc30mr6153485ad.5.1745869688108; Mon, 28 Apr 2025
 12:48:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250421113637.27886-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20250421113637.27886-4-xiazhengqiao@huaqin.corp-partner.google.com>
In-Reply-To: <20250421113637.27886-4-xiazhengqiao@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 12:47:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VFpj4_E7hMxZ3nAUaaeCuAua7Ec=_OKAPd2_cHAubb+w@mail.gmail.com>
X-Gm-Features: ATxdqUHAO79ku73pvAr653QK-OO192MFas7YBMOJaHFC7MJZORQDF9XAijlkLRQ
Message-ID: <CAD=FV=VFpj4_E7hMxZ3nAUaaeCuAua7Ec=_OKAPd2_cHAubb+w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/panel-edp: Add support for CSW MNE007QS3-8
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
> CSW MNE007QS3-8 EDID:
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 0e 77 57 14 00 00 00 00
> 34 22 01 04 a5 1e 13 78 07 ee 95 a3 54 4c 99 26
> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 cd 7c 80 a0 70 b0 50 40 30 20
> 26 04 2e bc 10 00 00 1a cd 7c 80 a0 70 b0 50 45
> 30 20 26 04 2e bc 10 00 00 1a 00 00 00 fd 00 1e
> 78 9a 9a 20 01 0a 20 20 20 20 20 20 00 00 00 fc
> 00 4d 4e 45 30 30 37 51 53 33 2d 38 0a 20 01 3f
>
> 70 20 79 02 00 21 00 1d c8 0b 5d 07 80 07 b0 04
> 80 3d 8a 54 cd a4 99 66 62 0f 02 45 54 7c 5d 7c
> 5d 00 43 12 78 2b 00 0c 27 00 1e 77 00 00 27 00
> 1e 3b 00 00 2e 00 06 00 43 7c 5d 7c 5d 81 00 20
> 74 1a 00 00 03 01 1e 78 00 00 5a ff 5a ff 78 00
> 00 00 00 8d 00 e3 05 04 00 e6 06 01 01 5a 5a ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 76 90
>
> Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com=
>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 92844ab4cb9c..71cbee86fe81 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1770,6 +1770,13 @@ static const struct panel_delay delay_80_500_e50 =
=3D {
>         .enable =3D 50,
>  };
>
> +static const struct panel_delay delay_80_500_e80_p2e200 =3D {
> +       .hpd_absent =3D 80,
> +       .unprepare =3D 500,
> +       .enable =3D 80,
> +       .prepare_to_enable =3D 200,
> +};
> +
>  static const struct panel_delay delay_100_500_e200 =3D {
>         .hpd_absent =3D 100,
>         .unprepare =3D 500,
> @@ -1982,6 +1989,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('C', 'S', 'W', 0x1103, &delay_200_500_e80_d50, "M=
NB601LS1-3"),
>         EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50, "MNB60=
1LS1-4"),
>         EDP_PANEL_ENTRY('C', 'S', 'W', 0x1448, &delay_200_500_e50, "MNE00=
7QS3-7"),
> +       EDP_PANEL_ENTRY('C', 'S', 'W', 0x1457, &delay_80_500_e80_p2e200, =
"MNE007QS3-8"),

I always get a little nervous when I see a low `hpd_absent` delay, but
this isn't the first one that's 80ms. As long as you're sure these
numbers are all correct then this looks fine to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
