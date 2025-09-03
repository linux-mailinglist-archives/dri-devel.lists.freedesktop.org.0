Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3CAB428FC
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 20:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64D58989C;
	Wed,  3 Sep 2025 18:48:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="M1IEHpys";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D3E8989C
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 18:48:52 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-55f76277413so188811e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 11:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756925331; x=1757530131;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SpKd2275sVbG0K2FZVdjWp6/Z18/FkDT3HL6WWRqaEg=;
 b=M1IEHpysxRlg+Cr0KLlkeRE5tGyMAkUD/qBg+ltSSgVt7fyRh0x2dU9oANI5Hov2RB
 r7iVD54oqntX/cGQQBOlGmUXCBEPI0oXMfRGepQh8ULMhotgQz4lrJSnAbNH/T39uybq
 ojwPDO5IWaoyBV3ZPd3gtAMXtxCehG++qug0dKrh0VtHqyrcLc4x6Z2H6viTBr7efvE4
 QwfEoenrDTTTUzD1e5qSinPtwKKoMT/nCmH/glGVBwkkd3zmGyl3TEx45AXLWGml7509
 AMTFR11kz5KiMGC7YKwKkA181FSwE+zoBpjl0PRyXtmPqi4uEZBjY4vtsV/FpXrGVhge
 ZeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756925331; x=1757530131;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SpKd2275sVbG0K2FZVdjWp6/Z18/FkDT3HL6WWRqaEg=;
 b=B9QZX1F4swJprB+u/YadWH3Z6ucAt7Wpox98aW+Q3TNWWxI/Zke68KTc3tciO3cOLo
 YJ2nsUkkcBTCNRBqK9hs0D/0p3CLN5B96i8nw/xQ+u0DOYHs1I7pR7DYgmf/ToMM2l9Y
 Zj0tWZQeZBofCMBq+RmNMBJ9N1avVLcoCUG2UAKwkmmYr4sdmoRC236UL119QqfiLyTh
 zUdlP67ZOvvMP+DpYxHCQpE/UDMp0hdEz+e2qbqsN5+iGNL1KBo7RP5oSTdhddstS+l1
 gyuhW6kt3/F9gM9fcwHeCv+akHJS9G9J1P+S9QVw7yX0kWNHcHCfPvEGWKxfLlNgZoT7
 M6BA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkpmrPH1u5ul2qcfY6E6kfCchHgQd67FJ9/x6LDFLnAjACpEYQDNQX4s+AwMqy8PmkTdfY2fdab9A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytIHwzO+d26CRFL2qf48Wt9fEAvJcqNJM5hbto/yYDWUwJDkoZ
 LrLG4RD1JeBnewBwk/U0sSRyJV7HY6InKmXGMox97b5Wyf/uRkjHN07saDdbZE2/EbZOOcYOsw4
 fpB7dtSCOfZNoGAeG4CeBmN5GB2BzaOZQ4efZZKg=
X-Gm-Gg: ASbGnctUBumfI4KNPq1iysBTIoTg3nqf4wToMxpmtn4qeldlgmH+gbaT4ipTU8GJNAl
 ArH9PmKX++UG5Rv1CgVWYo78cbR0UZa62hLiBg2kPza9afHWnlJmB+Un77QU0dPuiN5Uijswx0o
 12oZFS7yo6alScW7lwAbZQo/0PvEzjY+SjkMM38BSDeULYn953VL5+c+ErfYam5Qktc63o+17Dd
 d+nIPnaCeiZYxiuj5nv5dC8vHNavMGHFdbZAIRfHUg=
X-Google-Smtp-Source: AGHT+IF5G/J215zB6F+3YqHgBGUMzaMxIb8FdX2l9xOBS14z2EjkTnAnD4URRw2r/tfzfVxdowvkPYNpzRoqDhW7JLg=
X-Received: by 2002:a05:6512:660a:b0:55f:595f:9a31 with SMTP id
 2adb3069b0e04-55f709747b3mr4044420e87.51.1756925330683; Wed, 03 Sep 2025
 11:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250902154630.4032984-1-thierry.reding@gmail.com>
 <20250902154630.4032984-5-thierry.reding@gmail.com>
 <CANDhNCoM4RFX-QccF7xT=+-tduGj9OZ_8SgrTVyRucMwyVc73Q@mail.gmail.com>
 <e6twhwxi55eesb7xirei7wezzb77qjiji2mccgqlziisjzl3q5@3ny5e6lbgebz>
In-Reply-To: <e6twhwxi55eesb7xirei7wezzb77qjiji2mccgqlziisjzl3q5@3ny5e6lbgebz>
From: John Stultz <jstultz@google.com>
Date: Wed, 3 Sep 2025 11:48:38 -0700
X-Gm-Features: Ac12FXyfpojM7sYEH_SV5iPkXzxCBmlghsM38HwpGdBEBMQS7yemN51cEMcgCs0
Message-ID: <CANDhNCrO21O_URa1iHuroOoG-g61DL7uvECTwVxiuitCTi=i4g@mail.gmail.com>
Subject: Re: [PATCH 4/9] dma-buf: heaps: Add debugfs support
To: Thierry Reding <thierry.reding@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org
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

On Wed, Sep 3, 2025 at 8:38=E2=80=AFAM Thierry Reding <thierry.reding@gmail=
.com> wrote:
>
> On Tue, Sep 02, 2025 at 03:37:45PM -0700, John Stultz wrote:
> > On Tue, Sep 2, 2025 at 8:46=E2=80=AFAM Thierry Reding <thierry.reding@g=
mail.com> wrote:
> > >
> > > From: Thierry Reding <treding@nvidia.com>
> > >
> > > Add a callback to struct dma_heap_ops that heap providers can impleme=
nt
> > > to show information about the state of the heap in debugfs. A top-lev=
el
> > > directory named "dma_heap" is created in debugfs and individual files
> > > will be named after the heaps.
> > >
> >
> > I know its debugfs, but this feels a little loosey-goosey as an uAPI.
>
> Well, the whole point of debugfs is that it's not really an ABI. Nothing
> should ever rely on the presence of these files.
>
> > Is there any expected format for the show function?
> >
> > What would other dmabuf heaps ideally export via this interface?
>
> I've thought about this a bit and I'm not sure it makes sense to
> standardize on this. I think on one hand having a list of buffers
> exported by the dma-buf heap is probably the lowest common denominator,
> but then there might be a bunch of other things that are very heap-
> specific that some heap might want to export.
>
> > Is there some consistent dma_heap-ish concept for it to justify it
> > being under a dma_heap directory, and not just an independent debugfs
> > file for the driver implementing the dmabuf heap?
>
> Well, I think just the fact that it's a dma-heap would qualify its
> corresponding debugfs to be in a well-known location. We could of course
> pick some arbitrary location, but that's just a recipe for chaos because
> then everybody puts these whereever they want. There's really no
> standard place for driver-specific debugfs files to go, so putting it
> into some "subsystem"-specific directory seems like the better option.

Ok, I guess I was thinking if the files are organizationally cohesive
to be under the dma-heap directory, they ought to have some
consistency between them.

But I can see your perspective here that organizing the driver
specific debug files in a directory helps with folks finding and
identifying it.

Thanks for clarifying!
-john
