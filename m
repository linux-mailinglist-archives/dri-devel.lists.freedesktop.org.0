Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE7451744B
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 18:31:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE1410F01A;
	Mon,  2 May 2022 16:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED4810F01A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 16:31:48 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 w17-20020a17090a529100b001db302efed6so11613849pjh.4
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 09:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5DXG6OzenA4JxtNcAqNdKZ6Lnghc0/nVTmrMktg2yAk=;
 b=LlUW4MSGAJS1SLkyE1EdQEV65iwM7GxuDb2kIuMt4hooqHVfbTsRCpiX597FOdcwh1
 fNGA86LPOwPSszNc0Fc/qJ1ojsIUDlpdUMvNa3PRDJ4XorjGpGnJgplS4mlpAOhguYT0
 wH82H0baFaNP+FBMuq3GAxoRKqaaBvwIGMuFE/0AcPEJ0WLd8iz6wCnGQvHxPmAV6xKn
 QhLnEB4rsrtfTw6/BCcAWaUdSchoaODdFOv1Kr/MNGn3vw9wAUYn1gvzJmOc2Gmi9WGK
 RhHX3CKOOluMCZVXY3uAA1A4/c3tO+7uq3h8RLtUWAuC8scNjhg+8nH7OQ4or2Yv+ax4
 lRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5DXG6OzenA4JxtNcAqNdKZ6Lnghc0/nVTmrMktg2yAk=;
 b=CL3NLSVFA8VniX4Ud9cjFODL1Yp8gBSRWvbYyKeeLt8XW17cYA27zn6/8DEffsFdAZ
 YpRxe17abl9m7sXNcKa5d4rxSU+E7LriGm7sUmeTRR975KA8vmLL/D2eVMotSIPDRW0d
 UNQpvA3OiJX6zcIKfG9HYahwGfw72hh+vHeoyONuNkLXuvAF6kjj4vnXpqv/RqXXM3oW
 2Tn5Vjzaa2G6nLLmIbgGrxtppWjA+9p7Ed8nxNLCPTgr6d3Hnv+oMDkjZgAODMO1TjHG
 BZCtk/jtdmUWK9QfOz12TFJzXafPsSGwH6qBPNsJsRTrbpbHLA1S2yk/C1+tYaRvlIDQ
 Yp+A==
X-Gm-Message-State: AOAM533NkO1JgwVfxI2NhIyOUJluSnpcAYYLs1hbUSnPoDbNwA/pv9h5
 hAvozVAgb0MRCr83ISiWWsodXZ8C5p7lQHD7/z57Vg==
X-Google-Smtp-Source: ABdhPJzP7IBFrgDen677xLa2KBjavhGqOeefQGiz2x7MgXuduTru3h3L+KFwL6GQGbduyB4IEEU4ukYbo6JWa851fUA=
X-Received: by 2002:a17:902:c7d3:b0:15e:b2f1:15f4 with SMTP id
 r19-20020a170902c7d300b0015eb2f115f4mr1154642pla.39.1651509107921; Mon, 02
 May 2022 09:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220407054651.3924-1-Arunpravin.PaneerSelvam@amd.com>
 <CAHbf0-H5uE4RtZwY0L8Wz0VG6QnU1+E3yhg3fDFVc3n__=nrNQ@mail.gmail.com>
 <c0facbf4-0e14-fde5-4334-499135a36f0c@amd.com>
 <CAHbf0-FMqAA3vWx_uRDYG_vr=FX+tFoLAL6BZLDe5upv7KJqrg@mail.gmail.com>
 <CAHbf0-En606VT_HYDyeo6TtsfSZmR_+wsZaVgS4XiedLO9ndiA@mail.gmail.com>
 <8b99ca20-f711-ec32-0cd2-16fc52846ce0@amd.com>
In-Reply-To: <8b99ca20-f711-ec32-0cd2-16fc52846ce0@amd.com>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Mon, 2 May 2022 17:31:36 +0100
Message-ID: <CAHbf0-EzPP5gAyZQmxeAo3Ep0g-rO4XbDgEB_SdsR84xY+at9A@mail.gmail.com>
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

On Mon, 2 May 2022 at 16:54, Arunpravin Paneer Selvam
<arunpravin.paneerselvam@amd.com> wrote:
>
>
>
> On 5/2/2022 8:41 PM, Mike Lothian wrote:
> > On Wed, 27 Apr 2022 at 12:55, Mike Lothian <mike@fireburn.co.uk> wrote:
> >> On Tue, 26 Apr 2022 at 17:36, Christian K=C3=B6nig <christian.koenig@a=
md.com> wrote:
> >>> Hi Mike,
> >>>
> >>> sounds like somehow stitching together the SG table for PRIME doesn't
> >>> work any more with this patch.
> >>>
> >>> Can you try with P2P DMA disabled?
> >> -CONFIG_PCI_P2PDMA=3Dy
> >> +# CONFIG_PCI_P2PDMA is not set
> >>
> >> If that's what you're meaning, then there's no difference, I'll upload
> >> my dmesg to the gitlab issue
> >>
> >>> Apart from that can you take a look Arun?
> >>>
> >>> Thanks,
> >>> Christian.
> > Hi
> >
> > Have you had any success in replicating this?
> Hi Mike,
> I couldn't replicate on my Raven APU machine. I see you have 2 cards
> initialized, one is Renoir
> and the other is Navy Flounder. Could you give some more details, are
> you running Gravity Mark
> on Renoir and what is your system RAM configuration?
> >
> > Cheers
> >
> > Mike
>
Hi

It's a PRIME laptop, it failed on the RENOIR too, it caused a lockup,
but systemd managed to capture it, I'll attach it to the issue

I've got 64GB RAM, the 6800M has 12GB VRAM

Cheers

Mike
