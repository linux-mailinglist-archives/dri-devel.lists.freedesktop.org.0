Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CB5805CDF
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 19:06:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFA510E600;
	Tue,  5 Dec 2023 18:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D22A10E5F9
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 18:06:26 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-54cfb03f1a8so1969686a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 10:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701799583; x=1702404383;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O8H1TVEfqWDVKjsBzidGMR3JoOaMrLGMGY6/yIdEsvY=;
 b=RWxLpBCXQK3ba0ywRSEb0O1CNSu+YcFONs62++2ZPRiwF0fvQ8gkpgz6AoopGKNK0U
 himW9PK10PMCYNYleU6kPFlmgQDwVZCIwA1YU1Mjzdv//5diZD8q7HA7NSEZBQurrqCU
 1RGFv7EeI14Nx0EUI9pe+Edm/bU0CRLiwi2Ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701799583; x=1702404383;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O8H1TVEfqWDVKjsBzidGMR3JoOaMrLGMGY6/yIdEsvY=;
 b=Vt4QnYbYvu2653l0DiMp7PRz7wEnJt45RuRDYMcY/7Av9tI4oGUTRw9w7ZxUXGsZ9z
 dNQzvBVFM5nipwqjD2B4xZHJyywrxImVNjtTUH0CaQsdxSgO7EHLUZ5iN4irEprPAmvR
 id4mLrwEwg5iLe4HMWybD42bjYx+OHa80w7q8fSwkc030MCjbtIhrVw3HZ100QoGqY+O
 nDzhTvHAczJQM7rYAmjIi5ohNg2V9KOrBfxhFC3xElXpgNpXSpkUD8hzZLG9dlijAnj1
 BPVe4pioUl0BBD1u7nNb2o1EEOJNEzw6KBlK5Ae1Yh8ztJLJY8bCANXzFjYg6dn5kFCB
 faCg==
X-Gm-Message-State: AOJu0Yy/9Iw15Tj/GyQ6NXP0SMY+u0KLGzHBFy6/owFhmG2+QKNIDDDu
 L2p2cGlHU5Zn6ArS3wYV41h9eGtGArZ6FY8VREjNZJPr
X-Google-Smtp-Source: AGHT+IHskQxFZA+Kv5Vm8HTLgsgxhSZHoJwII25QcjSP/3CVK7gKysDppT9hLB7dmxwdP+hk2YNGfQ==
X-Received: by 2002:a17:907:9195:b0:a19:a19a:eade with SMTP id
 bp21-20020a170907919500b00a19a19aeademr559711ejb.151.1701799583611; 
 Tue, 05 Dec 2023 10:06:23 -0800 (PST)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41]) by smtp.gmail.com with ESMTPSA id
 l14-20020a170906414e00b0099c53c4407dsm7022106ejk.78.2023.12.05.10.06.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 10:06:23 -0800 (PST)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-40b35199f94so3305e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 10:06:22 -0800 (PST)
X-Received: by 2002:a7b:c4c6:0:b0:40b:3d89:ba70 with SMTP id
 g6-20020a7bc4c6000000b0040b3d89ba70mr550221wmk.7.1701799582662; Tue, 05 Dec
 2023 10:06:22 -0800 (PST)
MIME-Version: 1.0
References: <20231205123630.988663-1-treapking@chromium.org>
 <20231205203536.3.I8fc55a1de13171aa738b14a167bab8df76c2ea2a@changeid>
In-Reply-To: <20231205203536.3.I8fc55a1de13171aa738b14a167bab8df76c2ea2a@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 Dec 2023 10:06:04 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WcrW8pKmTq0fFK6OUoaXxUgAocO=eNd-oGxF7jtbyiGA@mail.gmail.com>
Message-ID: <CAD=FV=WcrW8pKmTq0fFK6OUoaXxUgAocO=eNd-oGxF7jtbyiGA@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/edp-panel: Add panels delay entries
To: Pin-yen Lin <treapking@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Guenter Roeck <groeck@chromium.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Dec 5, 2023 at 4:36=E2=80=AFAM Pin-yen Lin <treapking@chromium.org>=
 wrote:
>
> @@ -1999,10 +2031,17 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('I', 'V', 'O', 0x854b, &delay_200_500_p2e100, "R1=
33NW4K-R0"),
>         EDP_PANEL_ENTRY('I', 'V', 'O', 0x8c4d, &delay_200_150_e200, "R140=
NWFM R1"),
>
> +       EDP_PANEL_ENTRY('K', 'D', 'C', 0x044f, &delay_200_500_e50, "KD116=
N9-30NH-F3"),
> +       EDP_PANEL_ENTRY('K', 'D', 'C', 0x05f1, &delay_200_500_e80_d50, "K=
D116N5-30NV-G7"),
>         EDP_PANEL_ENTRY('K', 'D', 'B', 0x0624, &kingdisplay_kd116n21_30nv=
_a010.delay, "116N21-30NV-A010"),
>         EDP_PANEL_ENTRY('K', 'D', 'C', 0x0809, &delay_200_500_e50, "KD116=
N2930A15"),
> +       EDP_PANEL_ENTRY('K', 'D', 'B', 0x1118, &delay_200_500_e50, "KD116=
N29-30NK-A005"),
>         EDP_PANEL_ENTRY('K', 'D', 'B', 0x1120, &delay_200_500_e80_d50, "1=
16N29-30NK-C007"),

Huh, I apparently missed it when reviewing an earlier patch, but the
above table mixes 'KDB' and 'KDC'. Can you fix that and then base your
patch atop it?



-Doug
