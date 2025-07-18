Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B78B09F02
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 11:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6717410E15F;
	Fri, 18 Jul 2025 09:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mAdpektt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A69610E15F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:18:08 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-454f428038eso15752735e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 02:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752830286; x=1753435086; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=txHiNEgzLT/qSl4OZgY8NqRe0t4qidcOPq+VdRZOPkE=;
 b=mAdpekttzhSrUakCmp89SQakz6RT/Bxuvp7gsvUbEvPFvPYO5JRQHtO5yb1eg/Z/RE
 0C7q1QPH52e/FaX+iCw/1NuYEgGDF97YhyX7ASwn5K6CfEATNNVi0YQFLmkz0UJ81G9X
 2KOaWuqU+69Yi5f+46U9cQkh8COTbVuw48E3JSqWYmBIgzTPVeWl9ejdwBOSaZCWDt8y
 hTLWT6aQ2C9hF5TCcBOs4xbNsLKTpBuNSf9NmgLeW2C93coQWMJGZj3qgmJdmZj46+gN
 aV0siAXtrNnthFLxvVlL2MoKS0/Eg9z3Lg/jNY4IpQfDl3tZDpk4dESc+5xRjj1dtQpe
 hzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752830286; x=1753435086;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=txHiNEgzLT/qSl4OZgY8NqRe0t4qidcOPq+VdRZOPkE=;
 b=q183r0mdecjw0YXkpnHCwIhvmcnwAJGbf743qeS+XcC+zdUl/DP4Hwck41P4FPyFlx
 CxYyYpvRFjczgqHmNZ059NGRCbXh04ADbRoewUcFjVAs4X+PlqcYdxou7gIi0Up8veDP
 OymFHZvLqD3irX+B1q6DQKtORl3IP+DnKh442KLF3CXH7HodMxyiMOglC8ugnhs1N88A
 x/vS5Gwa80RvbjoNtkI/yTHVN41W7p6yfAAueTAnKpc+xD55WVzGq6XN1OtDJW+reQli
 eyz+1FR6bvsH6I6kAcsDAN8r7nf7pEt1AQsZpIsNtQDpfzPUuNu4aJXRo9IA5Pg7ipXz
 grzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVipc5Uw91isrrbnHhusv9iWnt/LIZY0XDxyANaBiLyNG7YDPH7JWyntsRAQ4+N0n6mrAopLMl+hQI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5P/b1hu6hi3rpuJwFJcymu06QVwEXDrkAgshOENX/ao72Fyaz
 TgjJ7etklIa18cyyC06bu2J44inal4p3CrvlzEwZit6jtEPQBKMFmEXS+HPdJ8tYLcmZ3atHUEL
 LYMjOcSC8YmFlKf/pubaJb6xDV+pSIwU=
X-Gm-Gg: ASbGncul6S02PNxjaTIDAIhOj9IGVF8QctT9duQoYK4KKvoyaI3oMSMw2iXOfrp0jd/
 rybqvBCDwr6XSbvv7fmk0+u3+zBC3qUdhF7freZ8f43ShYsvL/+T7kMj+8k2YFTrE4cnZ3e0UtL
 VxlUlNB5/yMB7xvVfedtCW31aY4t9KrKAWJwfKbTdMgkQQcmS5ICFm9cAGO1LG5X4WXy6vfbD/9
 QE1iTvf
X-Google-Smtp-Source: AGHT+IFZ8wMKIx/E8isGBLpDzTPqGmr8RwNbZDlMMF40PNFijmWy4bBhyf8VmTn9JDl/xhNB1IGk3vhk8pOYlQo2rAs=
X-Received: by 2002:a05:600c:4f85:b0:44a:b478:1387 with SMTP id
 5b1f17b1804b1-4562e39b996mr115055915e9.17.1752830285977; Fri, 18 Jul 2025
 02:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250717142139.57621-1-clamor95@gmail.com>
 <20250717142139.57621-4-clamor95@gmail.com>
 <5474709.5fSG56mABF@senjougahara>
In-Reply-To: <5474709.5fSG56mABF@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 18 Jul 2025 12:17:54 +0300
X-Gm-Features: Ac12FXwkiKFiGNrvrcZRa65PO2Me53wmAzQtfzYTCB6B1QYpAjOt5b9oveZCdW0
Message-ID: <CAPVz0n1TxOb_hKgKYTdeJ=Ka0STqfiHLtwAv+Ws=vtq=G-MAow@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] gpu/drm: host1x: mipi: add Tegra20/Tegra30 MIPI
 calibration logic
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Osipenko <digetx@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
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

=D0=BF=D1=82, 18 =D0=BB=D0=B8=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 12:11 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thursday, July 17, 2025 11:21=E2=80=AFPM Svyatoslav Ryhel wrote:
> > ...
> > @@ -311,6 +330,43 @@ int tegra_mipi_finish_calibration(struct
> > tegra_mipi_device *device) }
> >  EXPORT_SYMBOL(tegra_mipi_finish_calibration);
> >
> > +static int tegra20_mipi_calibration(struct tegra_mipi_device *device)
> > +{
> > +     struct tegra_mipi *mipi =3D device->mipi;
> > +     const struct tegra_mipi_soc *soc =3D mipi->soc;
> > +     u32 value;
> > +     int err;
> > +
> > +     err =3D clk_enable(mipi->csi_clk);
> > +     if (err < 0)
> > +             return err;
> > +
> > +     mutex_lock(&mipi->lock);
> > +
> > +     value =3D MIPI_CAL_CONFIG_TERMOS(soc->termos);
> > +     tegra_mipi_writel(mipi, value, CSI_CILA_MIPI_CAL_CONFIG);
> > +
> > +     value =3D MIPI_CAL_CONFIG_TERMOS(soc->termos);
> > +     tegra_mipi_writel(mipi, value, CSI_CILB_MIPI_CAL_CONFIG);
> > +
> > +     value =3D MIPI_CAL_CONFIG_HSPDOS(soc->hspdos) |
> > +             MIPI_CAL_CONFIG_HSPUOS(soc->hspuos);
> > +     tegra_mipi_writel(mipi, value, CSI_DSI_MIPI_CAL_CONFIG);
> > +
> > +     value =3D MIPI_CAL_BIAS_PAD_DRV_DN_REF(soc->pad_drive_down_ref) |
> > +             MIPI_CAL_BIAS_PAD_DRV_UP_REF(soc->pad_drive_up_ref);
> > +     tegra_mipi_writel(mipi, value, CSI_MIPIBIAS_PAD_CONFIG);
> > +
> > +     tegra_mipi_writel(mipi, 0x0, CSI_CIL_PAD_CONFIG);
> > +
> > +     mutex_unlock(&mipi->lock);
> > +
> > +     clk_disable(mipi->csi_clk);
> > +     clk_disable(mipi->clk);
> > +
> > +     return 0;
> > +}
> > +
>
> Where does this sequence come from? It looks a bit strange to me, since i=
t
> doesn't trigger calibration at all. It would be useful to mention the sou=
rce
> in the commit message.
>
> Mikko

Downstream nvidia sources, 3.1.10 and 3.4, dsi driver, function
tegra_dsi_pad_calibration

>
>
>
