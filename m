Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8BEBAB230
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 05:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F9C810E269;
	Tue, 30 Sep 2025 03:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="OVr2RIWU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B486710E269
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 03:14:35 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-33255011eafso5362999a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 20:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1759202071; x=1759806871;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=psH8ce2EGDVOVWJJv98yedDgFcZ/vr9lSF0MkEmVn80=;
 b=OVr2RIWUsQIafZRnDsENKD3wJ9QWV1IfRftVNogSsroukMf9N9sJ61UdCOo93qQv5F
 uTv16Rrkt3RO3D6OoFXGHNczbF+dzxVedXI8SqAQK77Zds/kUbv1lB1JSM/eTwCexmD4
 sgMHV/CBe5lTz/3hHScb/38wC/vQnP1nQ0LS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759202071; x=1759806871;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=psH8ce2EGDVOVWJJv98yedDgFcZ/vr9lSF0MkEmVn80=;
 b=Amb1rnUp+RgAGU5raq/GvogpUZfpJiQL6CNtu2UiDS2dHMgwa8Okgjo89+Rw576ZSW
 zDUKi5BHcftCBVzpYr0zjQ+vvFnQzJjrRG3+MFa6I4LZxz9RBavmXN3WGDFUkSxxS7C8
 Ws1WF7pn6elB/TxfqoiSMdiTpg/WBEeejC+jSTk0Ytj4s0Mwy2zs5AWhHQTsWp+xWu3f
 hcDKzUgPFTMKV0kRsCl7uB5hRdm6O/YAGqTUS583l4fsKd2uPxjWQSYO1XzanCv38rmG
 Cn2eZNgmyK3VtktkUnO83TdBDgw86fD6zI6YYFyuABeUrE5vtAIVPDgJgva0k3kq2wOm
 iPgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4u+OdHZ71lkI7DJmL4I+rhgiwYxo3DbOG34gzSlIlnHQIu+MVEo9ex3flnYCH5PGj2E3ZqxTHUog=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaqbQQy8/KxVTL6Qe9Dw0gohuXwx8ZMJsIe2zUrXgBzQSN7sB/
 lQ3J0lNBcUS7+cDPOA+ygaZP/wCxWM1tZWgqjqVQW0NZYcaCs3K+pnoMmwizNMUYPoQeYHrobry
 tQ/g=
X-Gm-Gg: ASbGncuF0oslKZpj5RmGrLFR6FSi99XCYfXrtbet8Jji43aOdpY392iB6h5btL4L8s2
 LFsJNY6QYW09OobPo4r0heYN9JWPrxXxkK4ChyG5C2YZnEd6yjUpYxVuwXFeZhabI3N8oXaeQjW
 cAs18vqtNSx/lSykhMbWUMoeZY20B0LpxNCjM0ImuEQeLPe0LmNxHkjzhyStK4by1G8uwwDMl+6
 oqLM61JY3E5z7XXumI/pkoujMj3HJrAv/wKYPykjcpaJtKA/xkOOOA3a8PXiXHBSDxqWCEX4Dll
 dlzQw3c0/qjbHPnIFg1C6WvOvabxW9bsGU0bhoNlV/BEdcrknOJn6U+PoHKeFlD2WukqOEjLMw9
 gFuKNoKsooppuyCFdD7FHinzqCMv6wwZPbGYgIc6CoAqNUDLXbrVOMEIUgQZUuSsl0cUaTT71KM
 /pjdhUg1RQbsQw5c4zRGI/Otc7
X-Google-Smtp-Source: AGHT+IElovKfEm+q4aBjKShUPJcDFzgBEvdw4x9XkcXc6nj4KgHcYot18fERX1aBV5vPJBVgfSlOUg==
X-Received: by 2002:a17:90b:4a03:b0:327:9e88:7714 with SMTP id
 98e67ed59e1d1-3342a2dce52mr20055536a91.37.1759202071428; 
 Mon, 29 Sep 2025 20:14:31 -0700 (PDT)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com.
 [209.85.215.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-338387351ccsm2815649a91.23.2025.09.29.20.14.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 20:14:29 -0700 (PDT)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-b554bb615dcso4238752a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 20:14:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXDWz/ExYt1JlIDAv/lhLtjDtG5SdZhURvir78sWvM1WQr/NJOMB/BM8Wy+w9PbqqZ5w7nL/KkZZMc=@lists.freedesktop.org
X-Received: by 2002:a17:903:1209:b0:27c:56af:88ea with SMTP id
 d9443c01a7336-27ed4a60a90mr164034935ad.60.1759202068865; Mon, 29 Sep 2025
 20:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250929142455.24883-1-clamor95@gmail.com>
 <20250929142455.24883-3-clamor95@gmail.com>
In-Reply-To: <20250929142455.24883-3-clamor95@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 29 Sep 2025 20:14:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WH5rsQR0vnsdZqfA-K-4AWSyOOfbe3g1H7pYCG0AigZw@mail.gmail.com>
X-Gm-Features: AS18NWAj5Q6YXwI8UEKn83gnNL36khKZ6enBt8j4y4L77Jpu4EeJviWpKmgJt1I
Message-ID: <CAD=FV=WH5rsQR0vnsdZqfA-K-4AWSyOOfbe3g1H7pYCG0AigZw@mail.gmail.com>
Subject: Re: [PATCH v1 2/8] gpu/drm: panel: add support for LG LD070WX3-SL01
 MIPI DSI panel
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org
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

On Mon, Sep 29, 2025 at 7:25=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.co=
m> wrote:
>
> +static int lg_ld070wx3_prepare(struct drm_panel *panel)
> +{
> +       struct lg_ld070wx3 *priv =3D to_lg_ld070wx3(panel);
> +       struct mipi_dsi_multi_context ctx =3D { .dsi =3D priv->dsi };
> +       struct device *dev =3D panel->dev;
> +       int ret;
> +
> +       ret =3D regulator_bulk_enable(ARRAY_SIZE(priv->supplies), priv->s=
upplies);
> +       if (ret < 0) {
> +               dev_err(dev, "failed to enable power supplies: %d\n", ret=
);
> +               return ret;
> +       }
> +
> +       /*
> +        * According to spec delay between enabling supply is 0,
> +        * for regulators to reach required voltage ~5ms needed.
> +        * MIPI interface signal for setup requires additional
> +        * 110ms which in total results in 115ms.
> +        */
> +       mdelay(115);
> +
> +       mipi_dsi_dcs_soft_reset_multi(&ctx);
> +       mipi_dsi_msleep(&ctx, 20);
> +
> +       /* Differential input impedance selection */
> +       mipi_dsi_dcs_write_seq_multi(&ctx, 0xae, 0x0b);
> +
> +       /* Enter test mode 1 and 2*/
> +       mipi_dsi_dcs_write_seq_multi(&ctx, 0xee, 0xea);
> +       mipi_dsi_dcs_write_seq_multi(&ctx, 0xef, 0x5f);
> +
> +       /* Increased MIPI CLK driving ability */
> +       mipi_dsi_dcs_write_seq_multi(&ctx, 0xf2, 0x68);
> +
> +       /* Exit test mode 1 and 2 */
> +       mipi_dsi_dcs_write_seq_multi(&ctx, 0xee, 0x00);
> +       mipi_dsi_dcs_write_seq_multi(&ctx, 0xef, 0x00);
> +
> +       return 0;

Shouldn't this return the accumulated error?


> +static int lg_ld070wx3_unprepare(struct drm_panel *panel)
> +{
> +       struct lg_ld070wx3 *priv =3D to_lg_ld070wx3(panel);
> +       struct mipi_dsi_multi_context ctx =3D { .dsi =3D priv->dsi };
> +
> +       mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
> +

Maybe add some comment about ignoring the accumulated error in the
context and still doing the sleeps?


> +       msleep(50);
> +
> +       regulator_bulk_disable(ARRAY_SIZE(priv->supplies), priv->supplies=
);
> +
> +       /* power supply must be off for at least 1s after panel disable *=
/
> +       msleep(1000);

Presumably it would be better to keep track of the time you turned it
off and then make sure you don't turn it on again before that time?
Otherwise you've got a pretty wasteful delay here.


> +static int lg_ld070wx3_probe(struct mipi_dsi_device *dsi)
> +{
> +       struct device *dev =3D &dsi->dev;
> +       struct lg_ld070wx3 *priv;
> +       int ret;
> +
> +       priv =3D devm_drm_panel_alloc(dev, struct lg_ld070wx3, panel,
> +                                   &lg_ld070wx3_panel_funcs,
> +                                   DRM_MODE_CONNECTOR_DSI);
> +       if (IS_ERR(priv))
> +               return PTR_ERR(priv);
> +
> +       priv->supplies[0].supply =3D "vcc";
> +       priv->supplies[1].supply =3D "vdd";
> +
> +       ret =3D devm_regulator_bulk_get(dev, ARRAY_SIZE(priv->supplies), =
priv->supplies);
> +       if (ret < 0)
> +               return dev_err_probe(dev, ret, "failed to get regulators\=
n");

Better to use devm_regulator_bulk_get_const() so you don't need to
manually init the supplies?
