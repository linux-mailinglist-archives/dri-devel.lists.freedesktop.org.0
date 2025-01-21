Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED67A18656
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 22:01:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11A110E212;
	Tue, 21 Jan 2025 21:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NqF4yzZu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62AA910E212
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 21:01:08 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5439e331cceso4719592e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 13:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1737493205; x=1738098005;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1qu0VShP+39Rg0KSSM32mhfLwk6R0E9J77uJAS9eN1I=;
 b=NqF4yzZujFX/4Od9V532ppTGub5Fh9VDiWpba/1S0QPRG4PVHBVbxXa0fnYNU0RpNZ
 LcXmh2P4kkraXU0KUei1uqB2rpDyh2M4Z34W9Ye4cJXiXYs2QOfLuc8xUQ6DtcSYdby4
 9MC1VOvScdGmTEmiMHitoP256Z13YXseajFtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737493205; x=1738098005;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1qu0VShP+39Rg0KSSM32mhfLwk6R0E9J77uJAS9eN1I=;
 b=kSCrUjp3c8tUZzYOsnXMd4rxVpPrPlNdIWEKqNl3qhu9FAn7DumTyv1NfdSBaquNZe
 INm2wj3VGPzyoz9PAJTfCFgYkqCGdonTzzf1s1ylf+r6PpoHdpk1UigMjj4o3eMTXnwl
 FjN5B7Xf9LLCNLo2n3RRsq4TGw31pmv/MEOmMgHc6r2aSqWEWSTX92y+GufNZme6Qha1
 /bn7YxdOfm4RGA/OqM0WVNcb50vgL9fl5uUBl0uXA4R/KYSXIxqeRjUtBe2DaRdMbfkR
 zr6MTCpSz6MmZMAgskfIYHdNg03eG8JkMSgMWyu7BaZKx3+ar/abktuu9n8Nn3K5VQDU
 D4pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZ4GwuQcbWiBam6rovdWX0NlRYcUdfM1P2rDCqv2Jp0+zwgUWvYkyv1scNzF0Yue/J+Y59q95sc3M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIF9PngswM7SyZQ5fdXPlguaQJAnzKE1NuoXfG7yERuhq67uwb
 QUlQfsbsDz9gTJAYvDDKI2CdKhQ9OC3uLsVdwOl+wJhUSuIemCsdxIh6gH8ewD2ix74uBVeXJ5C
 o0A==
X-Gm-Gg: ASbGnctFXL6a+1qz/TwV58Vkkhsh2UJIUfFmVGcOQy/TQTmartvoAvoO64hK34WGV8P
 ijeY26P4dooxPpr2kSHqYBdQhC25MI8HMFSKC/hrUULpAuvYdX91aJOiTmsZXGPEw4mvHF6mm1h
 +afRJfb2nSWMqL0gNYGN7CFs/O+WRl98DwcpcM5HOXIZfAjS5dk/gUnymrxqvVxxpVC2WuTYu1t
 ff7F+93bLix8pLPgnu53fvudJVOGT6Wf0uOwM/iglcV/beYdRFtELyAhIvYcoI7cq4ORRg/V33m
 93O9vY2ZTcyIgD9rE4dsXHMmjl29vVJKBTdVQw==
X-Google-Smtp-Source: AGHT+IHiI1tvyVkVvWJdr/+XRX7OZZh1lnUVWBzmIVfzh5sG1LYjd4RVPZp6upbuHcDFsTxo3w/hZQ==
X-Received: by 2002:a05:6512:b99:b0:540:357a:5d85 with SMTP id
 2adb3069b0e04-5439c2675d9mr6996129e87.38.1737493205186; 
 Tue, 21 Jan 2025 13:00:05 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com.
 [209.85.208.171]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af77c70sm1970282e87.223.2025.01.21.13.00.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2025 13:00:03 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-3043e84c687so49586891fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 13:00:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVnt9Rf+jiRp8YvokDoT/K2o6CoZGuEu2VICVJQdy0Ipn0y+cjUwBJ83qwuBQBbWZ5MiZ9emOK7RpU=@lists.freedesktop.org
X-Received: by 2002:a05:651c:b0c:b0:307:2aea:5594 with SMTP id
 38308e7fff4ca-3072ca97f69mr87629591fa.18.1737493202560; Tue, 21 Jan 2025
 13:00:02 -0800 (PST)
MIME-Version: 1.0
References: <20250121134819.251718-1-tejasvipin76@gmail.com>
In-Reply-To: <20250121134819.251718-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 21 Jan 2025 12:59:51 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Ver0_CFH=pvHH4DO7aN5wsdPbFmo-42Q44z6MA9O8nzA@mail.gmail.com>
X-Gm-Features: AbW1kvYRfOw-cYVYPISPvoMP-hZmQ2K9jrDCPrAsorKnZuICFxTESMMOnLWEeQk
Message-ID: <CAD=FV=Ver0_CFH=pvHH4DO7aN5wsdPbFmo-42Q44z6MA9O8nzA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: samsung-s6e88a0-ams452ef01: transition to
 mipi_dsi wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org, 
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

On Tue, Jan 21, 2025 at 5:48=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.com=
> wrote:
>
> @@ -136,12 +113,8 @@ static int s6e88a0_ams452ef01_prepare(struct drm_pan=
el *panel)
>  static int s6e88a0_ams452ef01_unprepare(struct drm_panel *panel)
>  {
>         struct s6e88a0_ams452ef01 *ctx =3D to_s6e88a0_ams452ef01(panel);
> -       struct device *dev =3D &ctx->dsi->dev;
> -       int ret;
>
> -       ret =3D s6e88a0_ams452ef01_off(ctx);
> -       if (ret < 0)
> -               dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
> +       s6e88a0_ams452ef01_off(ctx);

Can you change s6e88a0_ams452ef01_off() to return "void" instead of
"int" since the caller (correctly) doesn't check the error code here
now?

With that:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
