Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 067B3975071
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 13:07:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED6BF10E9A6;
	Wed, 11 Sep 2024 11:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="bU5LCWgM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0753510E9A6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 11:07:28 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-6d6e2b2fbc4so63007647b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 04:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1726052847;
 x=1726657647; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BfKqpT6gMHu6yKs0bohCo1aZwLC/RRj8ZGqLiNhs4jw=;
 b=bU5LCWgMV5BkG+sZZYPL/fUBeGN9bKNKXgQH+ETp6wew4saQCJnqDgQSdLZhy3QFYK
 hEFZPfqgypE0ScUnqvzdFTXpICT19twFMOy07mfbh4Xbp23zLxFu2eQFvQXsKzTtFxcF
 4hQRZDxzuqc+tERbfHYP8FOPV96VWm2Y6tYxNiRlxHd0Qw5S9e1yAnaxOIoNU5PY9+gN
 SLNMuF8sMWMgeq2W60APMpogKL3F70rFemOrpX/e6mkaMWG5XMNR6nkuANZA3P5POpX4
 kR/koodHAHbxQmRdcd/kZhbXIM7Bxup+ArQwwPzk0hs0YeQb0kmShqC0Oy6+YWdcY/9T
 D2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726052847; x=1726657647;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BfKqpT6gMHu6yKs0bohCo1aZwLC/RRj8ZGqLiNhs4jw=;
 b=lvyXmo/U7mqVlxjmqv6dNljnAqxZZuqZJaBskY88IeatxDnDRI/VAC82aHRo3eJomb
 cV1qYYZekFgFMiR1MFyeDecUd0xv5rRZeUBzDdiGRu4s+G4wWQKhP9YCOA7I+ti5SRHk
 tEEgz3n19zVQ5X5aBJSvzIcyWaJNIf/eJKhHbXOFwQK6IfrZOV/T6YbKMHc3HxEb51G+
 6/RHHCIsGWdoS67hD+rssWUjUfHkF40TR2HFOwxDLJ6AqacYq/+yAwvEoB1QOI+oHg3M
 NekWcYeebriDQcoMuQM2RqMpCB5G2JjhW0NgXONsMMbER8JVzIC095l6uXKKO9dQg1QV
 WcOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8M62TIYaQ+mHyNBLBkCnyoc7ngwKGUcjNJ5GKqp9HxYAuC7P4S4K51EMr9FzSkcbWARRCQqH1Zcc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrNHJXQ4lIprlbucpMW5rrYTkJhA0CechHLs5M3V6wusVHOJkH
 1l6/bRMoQRum7QScCL4wIXy2izAwg5wKI/dtsgQadNai9RONnZ3GvAj//uI1ShZzJYouFJc/ufw
 c7i4NCg==
X-Google-Smtp-Source: AGHT+IH8Tk4/KUa7FBsTLfpmLSzwGFUbQ6YXCIaT/iEMyD/K5D0CrfXVaKE2KF4X+BwqJ2sYMwctPA==
X-Received: by 2002:a05:690c:4286:b0:6b4:3caa:e842 with SMTP id
 00721157ae682-6db44f2f137mr133309537b3.18.1726052846821; 
 Wed, 11 Sep 2024 04:07:26 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6db96520acdsm6425437b3.116.2024.09.11.04.07.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 04:07:26 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-e1a8e305da0so6794132276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 04:07:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXW38VP3Ga89KW5N6UbjVC7xImhPzwDwNgLoiVLkIXcwzZmP4Zy4dF17GCipw5G2yBA3qz9SNFxIGU=@lists.freedesktop.org
X-Received: by 2002:a05:6902:2004:b0:e1a:4082:e8f2 with SMTP id
 3f1490d57ef6-e1d348a15d7mr19851736276.4.1726052845474; Wed, 11 Sep 2024
 04:07:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
 <20240612-6-10-rocket-v1-2-060e48eea250@tomeuvizoso.net>
 <ffviz6ak6qsn2reg5y35aerzy7wxfx6fzix6xjyminbhfcguus@clszdjakdcjd>
 <CAAObsKCx+r5UuESnrPem1Rb1-BF4i8FVwu6uozWhABOWoq+M4Q@mail.gmail.com>
 <CAAObsKChaBZ2C5ezWsiZ_LoN6R2HFhFA9=UNSRYB6cyeo-jreg@mail.gmail.com>
 <vmgk4wmlxbsb7lphq2ep3xnxx3mbv6e6lecihtftxoyp5lidvy@mectcwirrlek>
 <3516994c-7b06-4409-b9a9-975b9f7a60eb@arm.com>
In-Reply-To: <3516994c-7b06-4409-b9a9-975b9f7a60eb@arm.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 11 Sep 2024 13:07:14 +0200
X-Gmail-Original-Message-ID: <CAAObsKCGr8EUB747RN_w2BpTqLzGee+Bwm7HWB=xRbSBE2huUg@mail.gmail.com>
Message-ID: <CAAObsKCGr8EUB747RN_w2BpTqLzGee+Bwm7HWB=xRbSBE2huUg@mail.gmail.com>
Subject: Re: [PATCH 2/9] iommu/rockchip: Attach multiple power domains
To: Robin Murphy <robin.murphy@arm.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
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

On Fri, Jun 14, 2024 at 2:07=E2=80=AFPM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 2024-06-13 10:38 pm, Sebastian Reichel wrote:
> > Hi,
> >
> > On Thu, Jun 13, 2024 at 11:34:02AM GMT, Tomeu Vizoso wrote:
> >> On Thu, Jun 13, 2024 at 11:24=E2=80=AFAM Tomeu Vizoso <tomeu@tomeuvizo=
so.net> wrote:
> >>> On Thu, Jun 13, 2024 at 2:05=E2=80=AFAM Sebastian Reichel
> >>> <sebastian.reichel@collabora.com> wrote:
> >>>> On Wed, Jun 12, 2024 at 03:52:55PM GMT, Tomeu Vizoso wrote:
> >>>>> IOMMUs with multiple base addresses can also have multiple power
> >>>>> domains.
> >>>>>
> >>>>> The base framework only takes care of a single power domain, as som=
e
> >>>>> devices will need for these power domains to be powered on in a spe=
cific
> >>>>> order.
> >>>>>
> >>>>> Use a helper function to stablish links in the order in which they =
are
> >>>>> in the DT.
> >>>>>
> >>>>> This is needed by the IOMMU used by the NPU in the RK3588.
> >>>>>
> >>>>> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> >>>>> ---
> >>>>
> >>>> To me it looks like this is multiple IOMMUs, which should each get
> >>>> their own node. I don't see a good reason for merging these
> >>>> together.
> >>>
> >>> I have made quite a few attempts at splitting the IOMMUs and also the
> >>> cores, but I wasn't able to get things working stably. The TRM is
> >>> really scant about how the 4 IOMMU instances relate to each other, an=
d
> >>> what the fourth one is for.
> >>>
> >>> Given that the vendor driver treats them as a single IOMMU with four
> >>> instances and we don't have any information on them, I resigned mysel=
f
> >>> to just have them as a single device.
> >>>
> >>> I would love to be proved wrong though and find a way fo getting
> >>> things stably as different devices so they can be powered on and off
> >>> as needed. We could save quite some code as well.
> >>
> >> FWIW, here a few ways how I tried to structure the DT nodes, none of
> >> these worked reliably:
> >>
> >> https://gitlab.freedesktop.org/tomeu/linux/-/blob/6.10-rocket-multiple=
-devices-power/arch/arm64/boot/dts/rockchip/rk3588s.dtsi?ref_type=3Dheads#L=
1163
> >> https://gitlab.freedesktop.org/tomeu/linux/-/blob/6.10-rocket-schema-s=
ubnodes//arch/arm64/boot/dts/rockchip/rk3588s.dtsi?ref_type=3Dheads#L1162
> >> https://gitlab.freedesktop.org/tomeu/linux/-/blob/6.10-rocket-multiple=
-devices//arch/arm64/boot/dts/rockchip/rk3588s.dtsi?ref_type=3Dheads#L1163
> >> https://gitlab.freedesktop.org/tomeu/linux/-/blob/6.10-rocket-multiple=
-iommus//arch/arm64/boot/dts/rockchip/rk3588s.dtsi?ref_type=3Dheads#L2669
> >>
> >> I can very well imagine I missed some way of getting this to work, but
> >> for every attempt, the domains, iommus and cores were resumed in
> >> different orders that presumably caused problems during concurrent
> >> execution fo workloads.
> >>
> >> So I fell back to what the vendor driver does, which works reliably
> >> (but all cores have to be powered on at the same time).
> >
> > Mh. The "6.10-rocket-multiple-iommus" branch seems wrong. There is
> > only one iommu node in that. I would have expected a test with
> >
> > rknn {
> >      // combined device
> >
> >      iommus =3D <&iommu1>, <&iommu2>, ...;
> > };
> >
> > Otherwise I think I would go with the schema-subnodes variant. The
> > driver can initially walk through the sub-nodes and collect the
> > resources into the main device, so on the driver side nothing would
> > really change. But that has a couple of advantages:
> >
> > 1. DT and DT binding are easier to read
> > 2. It's similar to e.g. CPU cores each having their own node
> > 3. Easy to extend to more cores in the future
> > 4. The kernel can easily switch to proper per-core device model when
> >     the problem has been identified
>
> It also would seem to permit describing and associating the per-core
> IOMMUs individually - apart from core 0's apparent coupling to whatever
> shared "uncore" stuff exists for the whole thing, from the distinct
> clocks, interrupts, power domains etc. lining up with each core I'd
> guess those IOMMUs are not interrelated the same way the ISP's
> read/write IOMMUs are (which was the main justification for adopting the
> multiple-reg design originally vs. distinct DT nodes like Exynos does).
> However, practically that would require the driver to at least populate
> per-core child devices to make DMA API or IOMMU API mappings with, since
> we couldn't spread the "collect the resources" trick into those
> subsystems as well.

They seem to be interrelated in some way, because I need to program
the mappings in all three iommus for things to work, which is also
what the downstream driver does. Unfortunately, the TRM has zero
references to the MMU in the NPU section...

Regards,

Tomeu
