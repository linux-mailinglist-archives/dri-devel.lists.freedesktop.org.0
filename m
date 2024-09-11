Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C83D97505C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 13:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E3E10E07C;
	Wed, 11 Sep 2024 11:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="ahcHBkSa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CEBE10E99B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 11:03:32 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-e1a9e4fa5aaso6439906276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 04:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1726052612;
 x=1726657412; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AxDPM9JMquUGtRkhciAkGUBMtgFCHGxBT/7mvWlerhM=;
 b=ahcHBkSaJwfkYVCXpA1UlI+yPPX2t9pKb2fSigOxaXhXaHuPDq6mDl1oFVaD8APaCK
 aYlWezzcneTOev66/nxoWZgYk/T3LKKpS6swI3/jGP+EK7N5fBJHmbNg0wa6lSPbzQxN
 ng6mOgCsoGpAHaq5QobsdgeVYUYNHcQLTi+qKBndLHBmBBsfxxQrMyOoIbSh8ls/8TfR
 biMdIj3YWt9eVuB/SLUbltv8gRgcrEA5VqYgL8px2v5xTa8OeQ3c39YeVk9mrJTU4jSo
 t0jGKIexfwrJ6U9cBQS1DVi3ovQYuSG72ekoBCSJOAKv2lTUX2v9uHeIW3NzDtjHXKOB
 4+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726052612; x=1726657412;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AxDPM9JMquUGtRkhciAkGUBMtgFCHGxBT/7mvWlerhM=;
 b=xD0StTbyRsIJviOT22I3mYCBzu6Bo0HtsoqdYAtWsSesSg3pZYdGuybozbXXqHbMoU
 18dqY0TtgRPUI4WVHjubt1NVyi7zlTnhTN4KfuEUGfNwkryCUxPTEPPR81sOCwlE3lND
 QDAtmj/ZZeelACfqIbnRZWSvjFt/ahL+90gk7YyGoWfM/xm/2U+FWdzWy12GAHv9RHXb
 Suojw7TZ4GehrCKm8KsRYAbf0GohnRPkoF/5baIAkJ4yhaRrR4OObrxjy9iHBQLjXYxD
 et7geV6ygkrBqbfZifyxlWassg8rQk1/8OAXKgXa2vvEdjoXw6fcwrwYDzhYDwfDzu3E
 wI3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNfGXfgclAYtbUWq5xE+9KNU3wCZeC7ASwWLhZ7eHZJ493lsdigtgUXkAU+44hfpyZE0DNHr5SBKU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1ySisXHDU7bIJwDCT8cOKctFSQMcjSTHkDTCGlSbnaOcdwKl2
 Zzl/JvQ4pe5ES7Bify6GqeQfI+BuD6G7S2WZVU2IcwLPW5tVKNrop5na4+BP1XxyC8T0+5gOVuG
 80uulXA==
X-Google-Smtp-Source: AGHT+IEl8o0PMd+ZplALNdWmo6HCGz7pZdL4Fp63QNtkn8AQu6lINsARLn0C/XYTBUhYz64QEhE09A==
X-Received: by 2002:a05:6902:2406:b0:e1a:a580:e1d7 with SMTP id
 3f1490d57ef6-e1d34882d74mr13408548276.22.1726052611637; 
 Wed, 11 Sep 2024 04:03:31 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e1d7bb9ba7asm651097276.47.2024.09.11.04.03.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 04:03:31 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-e1a9e4fa5aaso6439876276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 04:03:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU6h/fuIHZNdtiWNV3bvhVTfxdxeRaz/tcMa1wL+LieVymjPgMyR6QK6V1gvfcCVRB0pNZYTskMsi8=@lists.freedesktop.org
X-Received: by 2002:a05:6902:2e11:b0:e11:698f:8843 with SMTP id
 3f1490d57ef6-e1d349cf097mr17492302276.44.1726052610124; Wed, 11 Sep 2024
 04:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
 <20240612-6-10-rocket-v1-2-060e48eea250@tomeuvizoso.net>
 <ffviz6ak6qsn2reg5y35aerzy7wxfx6fzix6xjyminbhfcguus@clszdjakdcjd>
 <CAAObsKCx+r5UuESnrPem1Rb1-BF4i8FVwu6uozWhABOWoq+M4Q@mail.gmail.com>
 <CAAObsKChaBZ2C5ezWsiZ_LoN6R2HFhFA9=UNSRYB6cyeo-jreg@mail.gmail.com>
 <vmgk4wmlxbsb7lphq2ep3xnxx3mbv6e6lecihtftxoyp5lidvy@mectcwirrlek>
In-Reply-To: <vmgk4wmlxbsb7lphq2ep3xnxx3mbv6e6lecihtftxoyp5lidvy@mectcwirrlek>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 11 Sep 2024 13:03:18 +0200
X-Gmail-Original-Message-ID: <CAAObsKAigVVFWuoATTBWbCEfwg0RRHXa=Ehw2OQJyug6EdCDnA@mail.gmail.com>
Message-ID: <CAAObsKAigVVFWuoATTBWbCEfwg0RRHXa=Ehw2OQJyug6EdCDnA@mail.gmail.com>
Subject: Re: [PATCH 2/9] iommu/rockchip: Attach multiple power domains
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Heiko Stuebner <heiko@sntech.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Oded Gabbay <ogabbay@kernel.org>, Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
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

On Thu, Jun 13, 2024 at 11:38=E2=80=AFPM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Thu, Jun 13, 2024 at 11:34:02AM GMT, Tomeu Vizoso wrote:
> > On Thu, Jun 13, 2024 at 11:24=E2=80=AFAM Tomeu Vizoso <tomeu@tomeuvizos=
o.net> wrote:
> > > On Thu, Jun 13, 2024 at 2:05=E2=80=AFAM Sebastian Reichel
> > > <sebastian.reichel@collabora.com> wrote:
> > > > On Wed, Jun 12, 2024 at 03:52:55PM GMT, Tomeu Vizoso wrote:
> > > > > IOMMUs with multiple base addresses can also have multiple power
> > > > > domains.
> > > > >
> > > > > The base framework only takes care of a single power domain, as s=
ome
> > > > > devices will need for these power domains to be powered on in a s=
pecific
> > > > > order.
> > > > >
> > > > > Use a helper function to stablish links in the order in which the=
y are
> > > > > in the DT.
> > > > >
> > > > > This is needed by the IOMMU used by the NPU in the RK3588.
> > > > >
> > > > > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > > > > ---
> > > >
> > > > To me it looks like this is multiple IOMMUs, which should each get
> > > > their own node. I don't see a good reason for merging these
> > > > together.
> > >
> > > I have made quite a few attempts at splitting the IOMMUs and also the
> > > cores, but I wasn't able to get things working stably. The TRM is
> > > really scant about how the 4 IOMMU instances relate to each other, an=
d
> > > what the fourth one is for.
> > >
> > > Given that the vendor driver treats them as a single IOMMU with four
> > > instances and we don't have any information on them, I resigned mysel=
f
> > > to just have them as a single device.
> > >
> > > I would love to be proved wrong though and find a way fo getting
> > > things stably as different devices so they can be powered on and off
> > > as needed. We could save quite some code as well.
> >
> > FWIW, here a few ways how I tried to structure the DT nodes, none of
> > these worked reliably:
> >
> > https://gitlab.freedesktop.org/tomeu/linux/-/blob/6.10-rocket-multiple-=
devices-power/arch/arm64/boot/dts/rockchip/rk3588s.dtsi?ref_type=3Dheads#L1=
163
> > https://gitlab.freedesktop.org/tomeu/linux/-/blob/6.10-rocket-schema-su=
bnodes//arch/arm64/boot/dts/rockchip/rk3588s.dtsi?ref_type=3Dheads#L1162
> > https://gitlab.freedesktop.org/tomeu/linux/-/blob/6.10-rocket-multiple-=
devices//arch/arm64/boot/dts/rockchip/rk3588s.dtsi?ref_type=3Dheads#L1163
> > https://gitlab.freedesktop.org/tomeu/linux/-/blob/6.10-rocket-multiple-=
iommus//arch/arm64/boot/dts/rockchip/rk3588s.dtsi?ref_type=3Dheads#L2669
> >
> > I can very well imagine I missed some way of getting this to work, but
> > for every attempt, the domains, iommus and cores were resumed in
> > different orders that presumably caused problems during concurrent
> > execution fo workloads.
> >
> > So I fell back to what the vendor driver does, which works reliably
> > (but all cores have to be powered on at the same time).
>
> Mh. The "6.10-rocket-multiple-iommus" branch seems wrong. There is
> only one iommu node in that. I would have expected a test with
>
> rknn {
>     // combined device
>
>     iommus =3D <&iommu1>, <&iommu2>, ...;
> };

You are right, I'm afraid I lost those changes...

> Otherwise I think I would go with the schema-subnodes variant. The
> driver can initially walk through the sub-nodes and collect the
> resources into the main device, so on the driver side nothing would
> really change. But that has a couple of advantages:
>
> 1. DT and DT binding are easier to read
> 2. It's similar to e.g. CPU cores each having their own node
> 3. Easy to extend to more cores in the future
> 4. The kernel can easily switch to proper per-core device model when
>    the problem has been identified

You mean having subnodes containing the different resources that a
core uses such as clocks, memory resources, power domain, etc? The
problem with that is that the existing code in the kernel assumes that
those resources are directly within a device node. Or do you suggest
something else?

Thanks,

Tomeu
