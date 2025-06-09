Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5EBAD295D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 00:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C238010E422;
	Mon,  9 Jun 2025 22:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ZG2PW5Uo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBF3810E422
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 22:29:48 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-742c73f82dfso3859005b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 15:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1749508185; x=1750112985;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RCHI8hBSZbe7jWpVWG5E6iUU6NcGTN8I1nvVgCwantQ=;
 b=ZG2PW5Uo3PZuRTzTqm+IiRQbZ7S9nRJ3OkwYiYoqZ+nvOWQvoYhSr23dkJq49VD8Jx
 bKf917L4LNe0hsIMAsAKRXWc1YQv8PHbi14U8Q/dskBVqd2ZutCFBKyN9X9o2pNQ3S3q
 U/liawqXF3gwo6MHu5KAcukzPlGYdneBM+wsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749508185; x=1750112985;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RCHI8hBSZbe7jWpVWG5E6iUU6NcGTN8I1nvVgCwantQ=;
 b=QxcIJEXGau0bnCkECjp76xZ17u0wAMV5+3D672IN5K6zDBUO1jgpvCDHgrkhPC1D3e
 QD9lUE++sN4QrG1Hc1g7Ps0w37q73RToeWKEEMvNFE8zpBqFSeFQgnePQdWxjee2nsqC
 2LdE6H7wv/r+G3Fz/kT+5LWHkKGR8iUncpIZLnO5veoyz04TaQ0Zn7AsBgZ4DG6YpowN
 8TNAIS0dsOogWgg22T8bsezTXq9NJPE6LTmHJLJ18OtuD0s2p5Qh3PXIGFEd3ROkvIk8
 OV31IluIsT5UsU1aHsWGV0BhKj/vDRUSxRzIh/HhMZt6X7/b9LCTDhmvA3pDWnstRGhO
 QOqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCXlq3vhZzjNBMuxM5+3CzIRQL4LfJVNK79R5MrNC+jPgBC2EsZN2A9cWb7JUlWGMr/BIiMzc88jE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4xopmm2jiScqcb12ThxLkz5IOMB8U34xmpSUNlq2F1D2fKsGo
 unvX6jO8zXUJcTQ09K9/MeI/c3hThDVzriZOJPuBHaDn21RcwIqSGMxNQSvkBRKN6ayStWC8Oth
 5l17WcA==
X-Gm-Gg: ASbGncvgR9GJ7H/wPMQtBc/OWB0cHRvzRSatxJRIAohJ1Of0N+2wLg33960oF2wnv7E
 1sUKp/bADEf5SV5eY362irJMHgy3j8bdq3wb9E4pbcctrG4yJzjyp51pdRetByBMgZsI8sy16b/
 NOn0+YR/R09vLkWQ0U7yBrPc0K5InWz+oWc+8/1I9A/SBcSCbd+rLNXEy30OIT0px5TTs2TYsw8
 cyeUYJtazOYmVv3tx0N2VrUkK5bXaRq2qIaAfxvouaGvHXPSDgUc1ntP25xw4pqoMYUJwyPNTkq
 gXDzFg3o9lDIqoXdrBadpwf8yqvhfnZCq2Xur1DXYD5vmxwS1/F6sHpiIIljWk1lfD9J5r9ZWua
 FuHbHPbTXk9qQrXDUD8QUZbc8iU55lA==
X-Google-Smtp-Source: AGHT+IFp1ZjC3UO2rade6LUby2Sl8Q1HgFSJUgl+v04+MpVtN6rWszlOnVYKlnqFZ/ikSlX3jzq/KA==
X-Received: by 2002:a05:6a21:6e41:b0:21f:62e7:cd08 with SMTP id
 adf61e73a8af0-21f62e7ce8dmr8680707637.8.1749508184852; 
 Mon, 09 Jun 2025 15:29:44 -0700 (PDT)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com.
 [209.85.210.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2f5f668ca1sm5772855a12.36.2025.06.09.15.29.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jun 2025 15:29:41 -0700 (PDT)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-73bf5aa95e7so3604248b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 15:29:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUTDCvlLDmg5bVHbXQGFZF0N9JzdvFkkQyTtrUNcunxOodkG7a2yHcyveKLDTAAYWcEnI3CqbSdQ80=@lists.freedesktop.org
X-Received: by 2002:a17:90b:38cc:b0:311:af8c:51cd with SMTP id
 98e67ed59e1d1-3134740bc52mr24180504a91.18.1749508180316; Mon, 09 Jun 2025
 15:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250528132148.1087890-1-mwalle@kernel.org>
In-Reply-To: <20250528132148.1087890-1-mwalle@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Jun 2025 15:29:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WfV1Kr5hFSqf=t0OS3qFSGfQ3_+LQ-57nMKHXRSYvZ-w@mail.gmail.com>
X-Gm-Features: AX0GCFt2omRlNA1zSC_GcQLoAaXlrYVa5kPcv0qbGu9sC3O4EQDw4Pp-3x8Mhmc
Message-ID: <CAD=FV=WfV1Kr5hFSqf=t0OS3qFSGfQ3_+LQ-57nMKHXRSYvZ-w@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: fix REFCLK setting
To: Michael Walle <mwalle@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jayesh Choudhary <j-choudhary@ti.com>
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

On Wed, May 28, 2025 at 6:21=E2=80=AFAM Michael Walle <mwalle@kernel.org> w=
rote:
>
> The bridge has three bootstrap pins which are sampled to determine the
> frequency of the external reference clock. The driver will also
> (over)write that setting. But it seems this is racy after the bridge is
> enabled. It was observed that although the driver write the correct
> value (by sniffing on the I2C bus), the register has the wrong value.
> The datasheet states that the GPIO lines have to be stable for at least
> 5us after asserting the EN signal. Thus, there seems to be some logic
> which samples the GPIO lines and this logic appears to overwrite the
> register value which was set by the driver. Waiting 20us after
> asserting the EN line resolves this issue.

+Jayesh might have some insight?



> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
> I couldn't find a good commit for a Fixes: tag and I'm not sure how
> fixes are handled in drm.
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index 60224f476e1d..fcef43154558 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -386,6 +386,17 @@ static int __maybe_unused ti_sn65dsi86_resume(struct=
 device *dev)
>
>         gpiod_set_value_cansleep(pdata->enable_gpio, 1);
>
> +       /*
> +        * After EN is deasserted and an external clock is detected, the =
bridge
> +        * will sample GPIO3:1 to determine its frequency. The driver wil=
l
> +        * overwrite this setting. But this is racy. Thus we have to wait=
 a
> +        * couple of us. According to the datasheet the GPIO lines has to=
 be
> +        * stable at least 5 us (td5) but it seems that is not enough and=
 the
> +        * refclk frequency value is lost/overwritten by the bridge itsel=
f.
> +        * Waiting for 20us seems to work.
> +        */
> +       usleep_range(20, 30);

It might be worth pointing at _where_ the driver overwrites this
setting, or maybe at least pointing to something that makes it easy to
find which exact bits you're talking about.

This looks reasonable to me, though.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
