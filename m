Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 263535287F5
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 17:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C5D10FA84;
	Mon, 16 May 2022 15:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E57810FA84;
 Mon, 16 May 2022 15:06:01 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so20426358fac.7; 
 Mon, 16 May 2022 08:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=p69R1mN7BK7U6xuFApx65kjJrvzrn6WWHMEzp0+QmL0=;
 b=YiSVvNT+Opl6WK8T/Jib4ceqG/OaAx1uhjnZbtQbpQcL38lwigHx2M/ysWwwjUs7Hy
 Bgx7FVMbhWbpe1hpxwE+E/Qh1wU+M7OWmOJgirIOyjbPPC7G8HheaE0J08bNgTdzmV2y
 Rqlr2CZtTuXqwlDomSUl9DOCLZ3cVy6b2R6EAoOqUlnrnuH0t4wVWJvIEFDDZjXBbVER
 bXd/xH9qv8kR5baSBEOmQ4XcB4Xm6iNPIRfqs/N8ZulZ6i4OnLPAqz5ifHGfE8bonq1B
 h8UjOqfR7CFqpCvxWiYN+D08/y6/xXtuBpsV4GY8X5xG+6EM+Pa32+qV0OOG5c8SWOFk
 AfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p69R1mN7BK7U6xuFApx65kjJrvzrn6WWHMEzp0+QmL0=;
 b=XmZwlZdIHKrSz6wT4rhLbtKYaq8gtqUq9tFHli3qWM4AQjv/D/hxquX75k4SxrXT6L
 vSrQa1HEFg41eICeyut9EYu9+snh4nHnlPE7O3ykATHqlU6bQYhBq/La4teGq414vM5T
 pnyc0Al3U9h69P/XS2wYBeWxaT0vxSdaPa3I8yFjZIqXJpIzEzdzwiTLzgUl0W7bfMdF
 aP/X2JI1jgaS6OA0zPtWeX8aLby4/EJHJ2fMMVGxjq0IXcLHlyS2hvhfan2Alf0q0LME
 9VDCwlc3hWJzVkl/0XbI1soNPsY3gGte59rp6ZkSa8nWkzpOw85FzJlGPa+SlAQyatrT
 BVzQ==
X-Gm-Message-State: AOAM533dlCTp+BUShvjhE1p/xxt+GQVMpozaHpGo3uKwh2MzeOBVflCs
 g+SyHLhG70C0Gf1crCM2Cya+QccPSuxCbqef7vw=
X-Google-Smtp-Source: ABdhPJylHZ9Ftf4b1lukHcwUNK8B6JlDxVa2tnccZHKF5/4XPKeINkL+WMJ3h9M12bWRojXkO1ovmLs1S9jAlVStcuc=
X-Received: by 2002:a05:6870:d683:b0:de:eaa2:3550 with SMTP id
 z3-20020a056870d68300b000deeaa23550mr10055030oap.253.1652713560608; Mon, 16
 May 2022 08:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220407054651.3924-1-Arunpravin.PaneerSelvam@amd.com>
 <CAHbf0-H5uE4RtZwY0L8Wz0VG6QnU1+E3yhg3fDFVc3n__=nrNQ@mail.gmail.com>
 <c0facbf4-0e14-fde5-4334-499135a36f0c@amd.com>
 <CAHbf0-FMqAA3vWx_uRDYG_vr=FX+tFoLAL6BZLDe5upv7KJqrg@mail.gmail.com>
 <CAHbf0-En606VT_HYDyeo6TtsfSZmR_+wsZaVgS4XiedLO9ndiA@mail.gmail.com>
 <8b99ca20-f711-ec32-0cd2-16fc52846ce0@amd.com>
 <CAHbf0-EzPP5gAyZQmxeAo3Ep0g-rO4XbDgEB_SdsR84xY+at9A@mail.gmail.com>
 <CAHbf0-G-rnvNXaXxMzkPerW6h=9vkxJyysUUV-oJV5UGD67KqA@mail.gmail.com>
In-Reply-To: <CAHbf0-G-rnvNXaXxMzkPerW6h=9vkxJyysUUV-oJV5UGD67KqA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 May 2022 11:05:49 -0400
Message-ID: <CADnq5_PTRPTsCvGwKFzNA_k7diAVqYEv1xV1yJszRD1K-v2FfQ@mail.gmail.com>
Subject: Re: [PATCH v12] drm/amdgpu: add drm buddy support to amdgpu
To: Mike Lothian <mike@fireburn.co.uk>
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
Cc: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 16, 2022 at 8:40 AM Mike Lothian <mike@fireburn.co.uk> wrote:
>
> Hi
>
> The merge window for 5.19 will probably be opening next week, has
> there been any progress with this bug?

It took a while to find a combination of GPUs that would repro the
issue, but now that we can, it is still being investigated.

Alex

>
> Thanks
>
> Mike
>
> On Mon, 2 May 2022 at 17:31, Mike Lothian <mike@fireburn.co.uk> wrote:
> >
> > On Mon, 2 May 2022 at 16:54, Arunpravin Paneer Selvam
> > <arunpravin.paneerselvam@amd.com> wrote:
> > >
> > >
> > >
> > > On 5/2/2022 8:41 PM, Mike Lothian wrote:
> > > > On Wed, 27 Apr 2022 at 12:55, Mike Lothian <mike@fireburn.co.uk> wr=
ote:
> > > >> On Tue, 26 Apr 2022 at 17:36, Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
> > > >>> Hi Mike,
> > > >>>
> > > >>> sounds like somehow stitching together the SG table for PRIME doe=
sn't
> > > >>> work any more with this patch.
> > > >>>
> > > >>> Can you try with P2P DMA disabled?
> > > >> -CONFIG_PCI_P2PDMA=3Dy
> > > >> +# CONFIG_PCI_P2PDMA is not set
> > > >>
> > > >> If that's what you're meaning, then there's no difference, I'll up=
load
> > > >> my dmesg to the gitlab issue
> > > >>
> > > >>> Apart from that can you take a look Arun?
> > > >>>
> > > >>> Thanks,
> > > >>> Christian.
> > > > Hi
> > > >
> > > > Have you had any success in replicating this?
> > > Hi Mike,
> > > I couldn't replicate on my Raven APU machine. I see you have 2 cards
> > > initialized, one is Renoir
> > > and the other is Navy Flounder. Could you give some more details, are
> > > you running Gravity Mark
> > > on Renoir and what is your system RAM configuration?
> > > >
> > > > Cheers
> > > >
> > > > Mike
> > >
> > Hi
> >
> > It's a PRIME laptop, it failed on the RENOIR too, it caused a lockup,
> > but systemd managed to capture it, I'll attach it to the issue
> >
> > I've got 64GB RAM, the 6800M has 12GB VRAM
> >
> > Cheers
> >
> > Mike
