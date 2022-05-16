Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC7A528456
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 14:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B38B10E1AD;
	Mon, 16 May 2022 12:40:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6932110E1AD
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 12:40:43 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id i24so13910733pfa.7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 05:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=R1YUMQxCDcM35RTFnHhCw25BZ+U5YZ8RA6iC/sZIXQM=;
 b=RTFJlIvbLnDxPz2Cq8usHeaB7CDO/wxB7cGoo9eaKQNeDgzBlVJfgNkPlYwQfAr2GR
 iyMmLq7wntvMvijdTetEiExGCiDyVYsHHzpAjMAlS/Ts+UbhXPSlfCEMkyvIA+5CXeA2
 e146eXUmFSwH8sj+wO217P3mwAiyTfVDbk1Swm86w9WywfUcCTbeSevwniOimUWS/+yd
 E5cFtECswCHLtGA5hnl1DaH8RafYGi9hc9FcGxP1Wut9/xdUoY/tYBrmPemmdtdm95Am
 KRmi2o70bUWHT3veqp+X9TX4SpZVt4QY+fZpfRtH9yZmwX0qRErmAlDvT/moEZo88iJ6
 AUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=R1YUMQxCDcM35RTFnHhCw25BZ+U5YZ8RA6iC/sZIXQM=;
 b=caP6/+Pdnvldq4VMknIAUodX46ZsKimf3lOatMLHUcvWUtNexDX8HtGUEsBraNbJU0
 wAvEfgCbV/xUiLdv8cmjW+xClEoIi4SwiZlPIp2/D/fAHK+LseuFUIYMO4brkvjVRkkm
 1QPw0thDqQoXQWltMbz01k2r6w/98TEef7mIHFZ1EHPujl76hb5ViyDPBmahXfR/mOIo
 hAzZuAIrzcCkKyC2gJL1h0GvVa/1Qe8VTolpOPPgfuyZ6WzHOFSIQ4ef2VCHnv+KF+m2
 hD7JrI9qZG2dTzDoBkEUyljolnozUOSojGcYUuh+Gfsdf1yN5oy2oScccL4ER2gcKr44
 ZMCg==
X-Gm-Message-State: AOAM530QW0Zp6BYZ3rLx+Hr6DKYADE9m0jyya6um6vh20gRhu2EMB0yv
 YXvgau5I/HE+fWIZuUZBprA4rLn+3eBrNHfrylo36A==
X-Google-Smtp-Source: ABdhPJwW/iMB4UKOH4RWN2ux9AWoZwCRIbMPHlHBLUJR5X2zjnmPqWybWNvc5+rNyDOOBG0FFiF0jvW2IHRHMA4LMdw=
X-Received: by 2002:a63:7d04:0:b0:378:fb34:5162 with SMTP id
 y4-20020a637d04000000b00378fb345162mr15228776pgc.487.1652704842822; Mon, 16
 May 2022 05:40:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220407054651.3924-1-Arunpravin.PaneerSelvam@amd.com>
 <CAHbf0-H5uE4RtZwY0L8Wz0VG6QnU1+E3yhg3fDFVc3n__=nrNQ@mail.gmail.com>
 <c0facbf4-0e14-fde5-4334-499135a36f0c@amd.com>
 <CAHbf0-FMqAA3vWx_uRDYG_vr=FX+tFoLAL6BZLDe5upv7KJqrg@mail.gmail.com>
 <CAHbf0-En606VT_HYDyeo6TtsfSZmR_+wsZaVgS4XiedLO9ndiA@mail.gmail.com>
 <8b99ca20-f711-ec32-0cd2-16fc52846ce0@amd.com>
 <CAHbf0-EzPP5gAyZQmxeAo3Ep0g-rO4XbDgEB_SdsR84xY+at9A@mail.gmail.com>
In-Reply-To: <CAHbf0-EzPP5gAyZQmxeAo3Ep0g-rO4XbDgEB_SdsR84xY+at9A@mail.gmail.com>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Mon, 16 May 2022 13:40:31 +0100
Message-ID: <CAHbf0-G-rnvNXaXxMzkPerW6h=9vkxJyysUUV-oJV5UGD67KqA@mail.gmail.com>
Subject: Re: [PATCH v12] drm/amdgpu: add drm buddy support to amdgpu
To: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
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
Cc: intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

The merge window for 5.19 will probably be opening next week, has
there been any progress with this bug?

Thanks

Mike

On Mon, 2 May 2022 at 17:31, Mike Lothian <mike@fireburn.co.uk> wrote:
>
> On Mon, 2 May 2022 at 16:54, Arunpravin Paneer Selvam
> <arunpravin.paneerselvam@amd.com> wrote:
> >
> >
> >
> > On 5/2/2022 8:41 PM, Mike Lothian wrote:
> > > On Wed, 27 Apr 2022 at 12:55, Mike Lothian <mike@fireburn.co.uk> wrot=
e:
> > >> On Tue, 26 Apr 2022 at 17:36, Christian K=C3=B6nig <christian.koenig=
@amd.com> wrote:
> > >>> Hi Mike,
> > >>>
> > >>> sounds like somehow stitching together the SG table for PRIME doesn=
't
> > >>> work any more with this patch.
> > >>>
> > >>> Can you try with P2P DMA disabled?
> > >> -CONFIG_PCI_P2PDMA=3Dy
> > >> +# CONFIG_PCI_P2PDMA is not set
> > >>
> > >> If that's what you're meaning, then there's no difference, I'll uplo=
ad
> > >> my dmesg to the gitlab issue
> > >>
> > >>> Apart from that can you take a look Arun?
> > >>>
> > >>> Thanks,
> > >>> Christian.
> > > Hi
> > >
> > > Have you had any success in replicating this?
> > Hi Mike,
> > I couldn't replicate on my Raven APU machine. I see you have 2 cards
> > initialized, one is Renoir
> > and the other is Navy Flounder. Could you give some more details, are
> > you running Gravity Mark
> > on Renoir and what is your system RAM configuration?
> > >
> > > Cheers
> > >
> > > Mike
> >
> Hi
>
> It's a PRIME laptop, it failed on the RENOIR too, it caused a lockup,
> but systemd managed to capture it, I'll attach it to the issue
>
> I've got 64GB RAM, the 6800M has 12GB VRAM
>
> Cheers
>
> Mike
