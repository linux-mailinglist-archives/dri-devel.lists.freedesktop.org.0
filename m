Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3147A1DB67
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 18:39:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63BEB10E259;
	Mon, 27 Jan 2025 17:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="FSMY1O3T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5A210E259
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 17:39:15 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5401be44b58so5125521e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 09:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1737999553; x=1738604353;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2q28uO9Sl+8BmaEfGyy+z8Preej4d/ejPXFkJVl2+6s=;
 b=FSMY1O3TANHqyPDVoIyGfOttnQxRQlEZr1eYJNARUjr+fcXxju+cvE6xcYIEjtpGur
 jkIM3NZvNmPxovmxvCeTN6mLabjr85dRqZEDkC17XquHT3fuMg5yJR9TGyB24s3DzpkC
 GP+vmOpQJ/av+dttu4gGGHS3c1dZQcQUupEZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737999553; x=1738604353;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2q28uO9Sl+8BmaEfGyy+z8Preej4d/ejPXFkJVl2+6s=;
 b=WeoiMFEX3Sg//nZfZA6NQ2YZF6dkbBw42VKyMd7Z4hcvYAyde/fh9CUGZ+GShayj6s
 sSxTcC1/EdkBFEglGDpJ531tjjGBx1He5F0Bn1YwwVwuloyjolY6GYdYfSf5XR/cMLCN
 AqWCZThdyh/OVECP9CgyBxktGd3kA8POlCvPkQol/67AIOApT5W74oKyhkc7M1ekZ1Ou
 lmLnJ7+UxlHBHzcHi37mm+Yw8JVEPdqwQlurGhUpFQM7tztxC6OE4JCGOPc48e0no/+0
 Q8zkhqk00eXF+ymXW1ieM9op+p5hasfLQaR5fIQqwiB0wAzHKIxPpYVCzr1cBHoIoLGs
 EubA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWs434zWIk8ZliE5vpYmQgfVj1ULM8zbNpThUf/6fUSH7lCzl8T6RVFSks7jMhZKt2nur8MHK+2pnU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGe7lilU63oH84teAKKPsP3MXlnZsYZGrXNHU8/3SaNNskM0bo
 ihsSyhHvEx8iivUHLiKX2TlWM8i2S+FP3M/xEA5/tufWB52gz/bIFNu1RQeok30jsKuBi53CjMd
 ngw==
X-Gm-Gg: ASbGncusl9rn7HbrrBdBT1QZtFAciQq1imtQwyKcJ5bmt93iGVmuP9VxQD6KXL+5T+U
 9x14/WTVZHK8p3HuVk/M6aDgbwu/Jg3Gy1OayaDAiTlOE/SBSobkzTz5mWq4Jjx7hHaOU6DlyE/
 rVhEgNHuMUzZnkgyA75VWxjllm4mRIxcmH3Mv/H0YcUpxWlC0ecSE2AfOY9UN+fcpO/U0aqozHo
 rK9doqe3XxzrYicEPiHWrhWUPhbE1OensJlZuxecnHHAawSqCIAnIa3X9VfETumGwaYRFAqjGU0
 Cz4woCejRcyJtyWWRbFYCMkW2siPuO+uupR/rMfMH4Qt
X-Google-Smtp-Source: AGHT+IF/klQ9YEeUJbMWIawDDEjkp9IjC1S05/xWPt/Y0wTl2JyuIgiBk3S05D8RW72mLonNuxIRJA==
X-Received: by 2002:ac2:4c56:0:b0:53e:fa8b:8227 with SMTP id
 2adb3069b0e04-5439c27b239mr17170247e87.45.1737999552765; 
 Mon, 27 Jan 2025 09:39:12 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c838157dsm1358072e87.231.2025.01.27.09.39.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 09:39:12 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-53e3c47434eso5123899e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 09:39:12 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXxhh5ex0ceNbqnYdQqHtF1DyfofRAoZiY59hbmaLXwvUjb6F3EUxuUr8reDVWsQzqnIl2yNQlJzKU=@lists.freedesktop.org
X-Received: by 2002:a2e:a4c2:0:b0:302:29a5:6e21 with SMTP id
 38308e7fff4ca-3072ca5bb11mr113388411fa.3.1737999210250; Mon, 27 Jan 2025
 09:33:30 -0800 (PST)
MIME-Version: 1.0
References: <20250127014605.1862287-1-yelangyan@huaqin.corp-partner.google.com>
 <20250127014605.1862287-3-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20250127014605.1862287-3-yelangyan@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 27 Jan 2025 09:33:18 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VBYbY6x0xmDAbXPD7yfyJm5XLqdHBWC-8RcyVCkXasxA@mail.gmail.com>
X-Gm-Features: AWEUYZmx-PxOZI0vw4Etv8fiXebC9FIHrAauGLI-1uDnCcUL38QZHwIOI1ep6VI
Message-ID: <CAD=FV=VBYbY6x0xmDAbXPD7yfyJm5XLqdHBWC-8RcyVCkXasxA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drm/panel: panel-himax-hx83102: support for
 csot-pna957qt1-1 MIPI-DSI panel
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
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

On Sun, Jan 26, 2025 at 5:46=E2=80=AFPM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> The csot-pna957qt1-1 is a 10.95" TFT panel. The MIPI controller on this
> panel is the same as the other panels here, so add this panel to this
> driver. From the datasheet, MIPI needs to keep the LP11 state before
> the lcm_reset pin is pulled high, so increase lp11_before_reset flag.

Drop the part about LP11. You must have copied it from an earlier
panel where that flag still made sense. It doesn't make sense to talk
about given the current state of the driver.


> @@ -396,6 +397,103 @@ static int ivo_t109nw41_init(struct hx83102 *ctx)
>         return dsi_ctx.accum_err;
>  };
>
> +static int csot_pna957qt1_1_init(struct hx83102 *ctx)
> +{

nit: can you keep the functions sorted to match the bindings? So this
function would be in between the BOE init function and the IVO init
function?


> @@ -462,6 +560,28 @@ static const struct hx83102_panel_desc ivo_t109nw41_=
desc =3D {
>         .init =3D ivo_t109nw41_init,
>  };
>
> +static const struct drm_display_mode csot_pna957qt1_1_default_mode =3D {
> +       .clock =3D 177958,

nit: similarly, sort the default_mode / desc between the BOE one and
the IVO one.


Other than small nits, this looks pretty nice to me and I'd expect to
give a Reviewed-by tag on v2 unless something major changes.


-Doug
