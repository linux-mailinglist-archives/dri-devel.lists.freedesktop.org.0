Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75185ADAB86
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 11:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E173910E300;
	Mon, 16 Jun 2025 09:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CtsgUhcy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37AE310E2F8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 09:10:45 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-55394ee39dfso4144328e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 02:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750065043; x=1750669843;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dmDMMMFI5G4DNwFWGn674MZ5D9eFoURbFcL3QvAF4Ig=;
 b=CtsgUhcyhd7coFRg1iTnoy3lRrNKFFb/PhLwA6KgPtXfZmMqQqTnU0GEhurd0EX2wz
 aW/cGv23foiCbXS3V76I6/25fXFLTnywluiMFYxu2aQLdbec0C4SMb8ekEPfma4uXSGz
 OCn7UcUcY8VDwe7LYGxtxoB3ozEy250rkz36thcBbfyru3SFDv90hHXX57h86bnFmalS
 R62Chf/Qcd2r093oSJ9IfZa1lTIyqREOvp2HOyB6R+6mlOUFo/Fh75oo4GU2ROsEcgh4
 /CIcGr8SzkbXbi69aCtbnohI3uRh76mLPx1dh3Ye6W8+Unx5z2k9udiVXrpWnlak/DiN
 3t1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750065043; x=1750669843;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dmDMMMFI5G4DNwFWGn674MZ5D9eFoURbFcL3QvAF4Ig=;
 b=eRqnb501Vd13VmqB7cALcrq7G5fldagx6gmW4VshYAZyp+OiJY+K4ooPg8ejvhE7Rb
 gw4uXOgBS8hXbD4hgDFK0M08WKcz8WfnZAVgSOBUA2KntxpEQrkhYrxQMl+qJ3qjrXwU
 3em8lWx+j3CllBLSlmGvT0vmI7/vKdsufrVyg2CjvkZxEAQzPV94xiUizSdcfbWqKUqI
 ev6IWaFsD+mKXbxa2Wk+CSZ7QKqAzvSlnvAI+Qhyud2F+9Cek3xphfXSmzAdJRzoHH5+
 IzP2rrEhhys9ChTFVjkqJlHkF0BkXvyEyX92PayCAG/XhNRdYiWvUCZzWaDUOaGzJ85C
 BJeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLUQDZATsY02w/7JVvWISLJ7G+6jMK7b0GxIKtlaXRocu06arODY0BnjI2hFrLHgaMhQwTK1M2JWY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/y3ynkkZM4fT47MNV4UUxKYvKt58BQCYPCbfrP3DZBIJgsn8R
 5r9xRup2L5tAqroIxWOhmvFwPFz7yAHQHJLaHhdRbdRvcxSN1WxLNWNaT7jJPDbbWjFCuhsCdVE
 nUbPNIlBB5Sc4HDpB7Kxj9GQq5RQmlz+vW5w+ebPcug==
X-Gm-Gg: ASbGnctb3dIfg9nUxgIwsGRyj4k0b6uxUQB5EE3dal9X0CXyeInp3dANKzVZ0FNJ/Fi
 XAzJQ0JHVPIAfWiCel21DQ/F/Pbb+geXU8eHPi45GlvQWBPEmtdxAg9tNYhXMcBjHIWmDE2eKr9
 tWt12A+QDknZB/nsm4jl2fUxvGDslmM0b+ELv5Hg1tyfEN5uSYKSu1bbyhEuvlT2VWctiJhfwBn
 GI=
X-Google-Smtp-Source: AGHT+IHuGL7ppu54TT/M3Hxiz/E57PX/ijwwJDHxeHuWrcclls/KmfWg30WiaNhrMMlcrNDHFrl4pCAUL311IM7bJx0=
X-Received: by 2002:a05:6512:1053:b0:553:29cc:c49c with SMTP id
 2adb3069b0e04-553b6810d6bmr2008050e87.7.1750065043405; Mon, 16 Jun 2025
 02:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250614180909eucas1p2a34e3242fb42f7fd25e4038c291276ff@eucas1p2.samsung.com>
 <20250614-apr_14_for_sending-v4-0-8e3945c819cd@samsung.com>
 <20250614-apr_14_for_sending-v4-3-8e3945c819cd@samsung.com>
In-Reply-To: <20250614-apr_14_for_sending-v4-3-8e3945c819cd@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 11:10:31 +0200
X-Gm-Features: AX0GCFundfu1_DbYfr4amG4ZmgyhqyYCcYsn5RbDrpDylY7Och28dfv5wtCxrQQ
Message-ID: <CAMRc=MdrvZ0_3aWcmhYZP4CxOVbuYjL66iLPHKkDt=vCP7VN-Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] pmdomain: thead: Instantiate GPU power sequencer
 via auxiliary bus
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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

On Sat, Jun 14, 2025 at 8:09=E2=80=AFPM Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> In order to support the complex power sequencing required by the TH1520
> GPU, the AON power domain driver must be responsible for initiating the
> corresponding sequencer driver. This functionality is specific to
> platforms where the GPU power sequencing hardware is controlled by the
> AON block.
>
> Extend the AON power domain driver to check for the presence of the
> "gpu-clkgen" reset in its own device tree node.
>
> If the property is found, create and register a new auxiliary device.
> This device acts as a proxy that allows the dedicated `pwrseq-thead-gpu`
> auxiliary driver to bind and take control of the sequencing logic.
>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---

[snip]

> +
> +static int th1520_pd_pwrseq_gpu_init(struct device *dev)
> +{
> +       struct auxiliary_device *adev;
> +       int ret;
> +
> +       /*
> +        * Correctly check only for the property's existence in the DT no=
de.
> +        * We don't need to get/claim the reset here; that is the job of
> +        * the auxiliary driver that we are about to spawn.
> +        */
> +       if (of_property_match_string(dev->of_node, "reset-names",
> +                                    "gpu-clkgen") < 0)

If you use device_property_match_string() here, you don't need to pull
in of.h. It's typically preferred to use the top-level abstraction
unless not possible.

[snip]

Thanks,
Bartosz
