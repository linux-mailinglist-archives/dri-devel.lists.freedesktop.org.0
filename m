Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB92D6A3387
	for <lists+dri-devel@lfdr.de>; Sun, 26 Feb 2023 19:57:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A53510E0BC;
	Sun, 26 Feb 2023 18:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2888D10E00B;
 Sun, 26 Feb 2023 18:57:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E067C60B46;
 Sun, 26 Feb 2023 18:57:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C25C4339E;
 Sun, 26 Feb 2023 18:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677437843;
 bh=VrM/iUWrSUVsEBLjOk5R2KtxW7pSXQzOM1d9MIHKhLw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=E9Rv5D2GuI/uIhmQm7yWu5vBGjUdq6v3mb5pYHwKqwt8gRdTRNCrN2zend0KBFtXp
 1dgQVU6zbcnd6PKq8b+qQvwyGYF92NUFl7XeamPuR2015PQDNX46WqaE6Am565lBpa
 D6mDNjMLSyetfZkc+/ofsToEOZUYo8EZG52pdkmOEA4CRW9ILZKxBRuD6C+HmvW2Aq
 7qH/muroS/OUeyEUd7DrkmtnOh2/LjnF+kpMBX67/Vgh+mfXB9AnK1GGkCPYmYQyl5
 uxiDwtB1UPCq0kym2hkkCdbHFIkH08x8gqRigTEm6oEF1FY7UMEA2KLhH+6W6I1d7E
 pgYf+uHEIAZtQ==
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-536cb25982eso119180757b3.13; 
 Sun, 26 Feb 2023 10:57:23 -0800 (PST)
X-Gm-Message-State: AO0yUKU6KGq6JMDCkPblxLAcQF2++wBfIuvNFlukkznPlcfYDT8DtlOd
 yPACsmPnZ3Jfoc4xpn6WR5xBiO5uYJf8SAL6bOM=
X-Google-Smtp-Source: AK7set/7Ym4hYJ+ZWVCt8v/agr4SwOIVp84Xp8FoLfBFL/Mb1rf/L/2l99rg5eVLV9NdbBqq2x8qVHbM9U/XLxXESSQ=
X-Received: by 2002:a05:6902:145:b0:a17:c06d:60d2 with SMTP id
 p5-20020a056902014500b00a17c06d60d2mr7155585ybh.1.1677437842304; Sun, 26 Feb
 2023 10:57:22 -0800 (PST)
MIME-Version: 1.0
References: <20230216162729.219979-1-thomas.hellstrom@linux.intel.com>
 <Y+6PqOdRf+vu8rZc@phenom.ffwll.local>
 <699c33d7-6788-99ab-6787-1cebff0bf70e@linux.intel.com>
 <CADnq5_Mfp4pCnVcsWn_vMO-hWcMhH_yb8MHccyp_jEL=XxgZNg@mail.gmail.com>
In-Reply-To: <CADnq5_Mfp4pCnVcsWn_vMO-hWcMhH_yb8MHccyp_jEL=XxgZNg@mail.gmail.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Sun, 26 Feb 2023 20:56:55 +0200
X-Gmail-Original-Message-ID: <CAFCwf12vw56v64Pa=5VhAiVBf=Km9_sOWxOczSFNvLi0eL_VeQ@mail.gmail.com>
Message-ID: <CAFCwf12vw56v64Pa=5VhAiVBf=Km9_sOWxOczSFNvLi0eL_VeQ@mail.gmail.com>
Subject: Re: [PATCH 0/1] drm: Add a gpu page-table walker
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 23, 2023 at 8:50=E2=80=AFPM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> On Thu, Feb 23, 2023 at 10:03 AM Thomas Hellstr=C3=B6m
> <thomas.hellstrom@linux.intel.com> wrote:
> >
> > Hi, Daniel,
> >
> > On 2/16/23 21:18, Daniel Vetter wrote:
> > > On Thu, Feb 16, 2023 at 05:27:28PM +0100, Thomas Hellstr=C3=B6m wrote=
:
> > >> A slightly unusual cover letter for a single patch.
> > >>
> > >> The page table walker is currently used by the xe driver only,
> > >> but the code is generic so we can be good citizens and add it to drm
> > >> as a helper, for possible use by other drivers,
> > >> If so we can merge the commit when we merge the xe driver.
> > >>
> > >> The question raised here is
> > >> *) Should it be a generic drm helper or xe-specific with changed
> > >>     prefixes?
> > > I think if there's some other drivers interested in using this, then =
this
> > > sounds like a good idea. Maybe more useful if it's also integrated in=
to
> > > the vm/vma helpers that are being discussed as an optional part?
> > >
> > > Maybe some good old sales pitching here to convince people would be g=
ood.
> > >
> > > Maybe one of the new accel drivers is interested in this too?
Hi,
As the habanalabs driver is not really a new driver, I currently don't
see the benefit of moving
to this code. Our pgt code is quite mature and was tested extensively
in deployment in the
past couple of years.

Nevertheless, I'll try to offer this code for any new/future driver
that will want to join accel.

Stanislaw, I'm adding you here in case you missed this. Might be of an
interest to you.

Thanks,
Oded

- Oded



> >
> > Thanks for your thoughts on this. Yeah, I think it's a bit awkward to
> > push for having code generic when there is only one user, and the
> > prospect of having other drivers rewrite their page-table building code
> > based on this helper in the near future is probably small. Perhaps more
> > of interest to new drivers. I think what will happen otherwise is that
> > during some future cleanup this will be pushed down to xe claiming it's
> > the only user.
> >
> > I wonder whether it might be an idea to maintain a small document where
> > driver writers can list suggestions for code that could be lifted to
> > core drm and be reused by others. That way both reviewers and writers o=
f
> > other drivers can keep an eye on that document and use it to avoid
> > duplicating code. The procedure would then be to lift it to core drm an=
d
> > fix up prefixes as soon as we have two or more users.
> >
> > Thoughts?
>
> FWIW, when we originally wrote the GPU scheduler it was part of
> amdgpu, but we consciously kept any AMD-isms out of it so it could be
> lifted up to a core component when another user came along.  Maybe
> some comments in the top of those files to that effect to maintain the
> separation.
>
> Alex
>
>
> >
> > Thomas
> >
> >
> > >
> > >> *) If a drm helper, should we use a config option?
> > > I am no fan of Kconfig things tbh. Maybe just include it in the vma
> > > helpers, or perhaps we want to do a drm-accel-helpers with gem helper=
s,
> > > drm/sched, this one here, vm/vma helpers or whatever they will be and=
 so
> > > on? Kinda like we have modeset helpers.
> > >
> > > I'd definitely not go for a Kconfig per individual file, that's just
> > > excessive.
> > > -Daniel
> > >
> > >> For usage examples, see xe_pt.c
> > >> https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/driv=
ers/gpu/drm/xe/xe_pt.c
> > >>
> > >> Thanks,
> > >> Thomas
> > >>
> > >> Thomas Hellstr=C3=B6m (1):
> > >>    drm: Add a gpu page-table walker helper
> > >>
> > >>   drivers/gpu/drm/Makefile      |   1 +
> > >>   drivers/gpu/drm/drm_pt_walk.c | 159 ++++++++++++++++++++++++++++++=
+++
> > >>   include/drm/drm_pt_walk.h     | 161 ++++++++++++++++++++++++++++++=
++++
> > >>   3 files changed, 321 insertions(+)
> > >>   create mode 100644 drivers/gpu/drm/drm_pt_walk.c
> > >>   create mode 100644 include/drm/drm_pt_walk.h
> > >>
> > >> --
> > >> 2.34.1
> > >>
