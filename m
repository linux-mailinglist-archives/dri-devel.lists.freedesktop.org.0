Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 099604DE0D1
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 19:12:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8437410E221;
	Fri, 18 Mar 2022 18:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D47910E172
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 18:12:24 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id o83so9639254oif.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 11:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NuUvMOcmVhOy9t3C5CpEov7/quTtIQ6IiXfXDllkM74=;
 b=NVQV6+mm2IMDgwE3eOUdwXfbG0w072duUtTGE5sY3d+WMHiyFquab8Bb6WMkxQjsAJ
 n91bg0CSdBfXb1eERxOwhbQvv0Se6s/WuXurF5GFADUHN8q2VcICSjc2P3Tll1G82hJn
 1dryNyWxiwRBwrjJPRSPN887Hs9mtvyIvBgVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NuUvMOcmVhOy9t3C5CpEov7/quTtIQ6IiXfXDllkM74=;
 b=FnH2AOUPxW2hiPTSkIZpNthhLHi9+vvDpsqaiz/jJ9gY+njHuYlg6EexqRXExMBFfe
 LNL5Xx/CyRkh+inI6E5ZcgEi19wba482FhSmvMt3jMAqM/hjMNe8JhB0tbGQaNu/2wDE
 VIszeF0fCaetylmAWsOrpIr4lARKPhre/wsW9vVpzSL3VMqMxB9E+2TBczr6NSs2hmNp
 OEFx3LDa6wdBkAhwZkHyqaoRYOPZKQ4SlGcB+y0q4/1r3vV2/UZOAaL/DiK/VVqL+5wQ
 nnDqhJzoM64yL+1UtJr8T/LY+Bmi6oX8F7wXstVTvG0ULpWvUSyeY/HX73hO0rF6p9pR
 kkBg==
X-Gm-Message-State: AOAM532KwkmWWKZkQBViPm0iOVh5CZV3+60rgdQ1TY33Kcs8dbONf32I
 W1CJ69WlYIXy4ad8EH8OgTqIjVz50kvrFEC1HpjqFA==
X-Google-Smtp-Source: ABdhPJzXcqv5gwxEkLVOplOdMD8vR3HAapsJab/n4UdEXNlf98bfnG3yF6j9wIYVTpZy8KGSDt9i9AIdh7LKuKZSbOc=
X-Received: by 2002:a54:4099:0:b0:2ec:d31c:481d with SMTP id
 i25-20020a544099000000b002ecd31c481dmr4823864oii.7.1647627143492; Fri, 18 Mar
 2022 11:12:23 -0700 (PDT)
MIME-Version: 1.0
References: <162c1566-87c6-072f-d340-1693f6a71aea@linux.intel.com>
 <164750662822.7267.9355161518284202141@jlahtine-mobl.ger.corp.intel.com>
 <9eb06b576948707f9a0527b07b58b9640821bf19.camel@linux.intel.com>
 <d874ba08a65e4468baae737d826a85a5@intel.com>
 <ddd7af8f57320a7e2a84b3fdb94e3050eae81857.camel@linux.intel.com>
 <f80dc6ccf38343beb819e1584a9017f7@intel.com>
In-Reply-To: <f80dc6ccf38343beb819e1584a9017f7@intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 18 Mar 2022 19:12:12 +0100
Message-ID: <CAKMK7uGsCFJR2d-m0TsVjEy36bN1Z38fuoME6gezA9xY_MkSeA@mail.gmail.com>
Subject: Re: [Intel-gfx] Small bar recovery vs compressed content on DG2
To: "Bloomfield, Jon" <jon.bloomfield@intel.com>, 
 Kenneth W Graunke <kenneth.w.graunke@intel.com>, 
 Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>, "Vetter, Daniel" <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maybe also good to add dri-devel to these discussions.

I'm not sure where exactly we landed with dgpu error capture (maybe I
should check the code but it's really w/e here), but I think we can
also toss in "you need a non-recoverable context for error capture to
work on dgpu". Since that simplifies things even more. Maybe Thomas
forgot to add that to the list of restrictions.

Anyway on the "we can't capture lmem-only compressed buffers", I think
that's totally fine. Those are for render targets, and we don't
capture those. Adding Lionel and Ken to confirm.
-Daniel

On Fri, 18 Mar 2022 at 17:26, Bloomfield, Jon <jon.bloomfield@intel.com> wr=
ote:
>
> @Thomas Hellstr=C3=B6m - I agree :-)
>
> My question was really to @Joonas Lahtinen, who was saying we could alway=
s migrate in the CPU fault handler. I am pushing back on that unless we hav=
e no choice. It's the very complication we were trying to avoid with the cu=
rrent SAS. If that's what's needed, then so be it. But I'm asking whether w=
e can instead handle this specially, instead of adding generic complexity t=
o the primary code paths.
>
> Jon
>
> > -----Original Message-----
> > From: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Sent: Friday, March 18, 2022 2:48 AM
> > To: Bloomfield, Jon <jon.bloomfield@intel.com>; Joonas Lahtinen
> > <joonas.lahtinen@linux.intel.com>; Intel Graphics Development <intel-
> > gfx@lists.freedesktop.org>; Auld, Matthew <matthew.auld@intel.com>; C,
> > Ramalingam <ramalingam.c@intel.com>; Vetter, Daniel
> > <daniel.vetter@intel.com>
> > Subject: Re: Small bar recovery vs compressed content on DG2
> >
> > Hi,
> >
> > On Thu, 2022-03-17 at 18:21 +0000, Bloomfield, Jon wrote:
> > > +@Vetter, Daniel
> > >
> > > Let's not start re-inventing this on the fly again. That's how we got
> > > into trouble in the past. The SAS/Whitepaper does currently require
> > > the SMEM+LMEM placement for mappable, for good reasons.
> >
> > Just to avoid any misunderstandings here:
> >
> > We have two hard requirements from Arch that clash, main problem is
> > compressed bos can't be captured on error with current designs.
> >
> > From an engineering point of view we can do little more than list
> > options available to resolve this and whether they are hard or not so
> > hard to implemement. But IMHO Arch needs to agree on what's got to
> > give.
> >
> > Thanks,
> > Thomas
> >
> >
> > >
> > > We cannot 'always migrate to mappable in the fault handler'. Or at
> > > least, this is not as trivial as it is to write in a sentence due to
> > > the need to spill out other active objects, and all the usual
> > > challenges with context synchronization etc. It is possible, perhaps
> > > with a lot of care, but it is challenging to guarantee, easy to
> > > break, and not needed for 99.9% of software. We are trying to
> > > simplify our driver stack.
> > >
> > > If we need a special mechanism for debug, we should devise a special
> > > mechanism, not throw out the general LMEM+SMEM requirement. Are
> > there
> > > any identified first-class clients that require such access, or is it
> > > only debugging tools?
> > >
> > > If only debug, then why can't the tool use a copy engine submission
> > > to access the data in place? Or perhaps a bespoke ioctl to access
> > > this via the KMD (and kmd submitted copy-engine BB)?
> > >
> > > Thanks,
> > >
> > > Jon
> > >
> > > > -----Original Message-----
> > > > From: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > > Sent: Thursday, March 17, 2022 2:35 AM
> > > > To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>; Bloomfield,
> > > > Jon
> > > > <jon.bloomfield@intel.com>; Intel Graphics Development <intel-
> > > > gfx@lists.freedesktop.org>; Auld, Matthew <matthew.auld@intel.com>;
> > > > C,
> > > > Ramalingam <ramalingam.c@intel.com>
> > > > Subject: Re: Small bar recovery vs compressed content on DG2
> > > >
> > > > On Thu, 2022-03-17 at 10:43 +0200, Joonas Lahtinen wrote:
> > > > > Quoting Thomas Hellstr=C3=B6m (2022-03-16 09:25:16)
> > > > > > Hi!
> > > > > >
> > > > > > Do we somehow need to clarify in the headers the semantics for
> > > > > > this?
> > > > > >
> > > > > >  From my understanding when discussing the CCS migration series
> > > > > > with
> > > > > > Ram, the kernel will never do any resolving (compressing /
> > > > > > decompressing) migrations or evictions which basically implies
> > > > > > the
> > > > > > following:
> > > > > >
> > > > > > *) Compressed data must have LMEM only placement, otherwise the
> > > > GPU
> > > > > > would read garbage if accessing from SMEM.
> > > > >
> > > > > This has always been the case, so it should be documented in the
> > > > > uAPI
> > > > > headers and kerneldocs.
> > > > >
> > > > > > *) Compressed data can't be assumed to be mappable by the CPU,
> > > > > > because
> > > > > > in order to ensure that on small BAR, the placement needs to be
> > > > > > LMEM+SMEM.
> > > > >
> > > > > Not strictly true, as we could always migrate to the mappable
> > > > > region
> > > > > in
> > > > > the CPU fault handler. Will need the same set of tricks as with
> > > > > limited
> > > > > mappable GGTT in past.
> > > >
> > > > In addition to Matt's reply:
> > > >
> > > > Yes, if there is sufficient space. I'm not sure we want to
> > > > complicate
> > > > this to migrate only part of the buffer to mappable on a fault
> > > > basis?
> > > > Otherwise this is likely to fail.
> > > >
> > > > One option is to allow cpu-mapping from SYSTEM like TTM is doing
> > > > for
> > > > evicted buffers, even if SYSTEM is not in the placement list, and
> > > > then
> > > > migrate back to LMEM for gpu access.
> > > >
> > > > But can user-space even interpret the compressed data when CPU-
> > > > mapping?
> > > > without access to the CCS metadata?
> > > >
> > > > >
> > > > > > *) Neither can compressed data be part of a CAPTURE buffer,
> > > > > > because
> > > > > > that
> > > > > > requires the data to be CPU-mappable.
> > > > >
> > > > > Especially this will be too big of a limitation which we can't
> > > > > really
> > > > > afford
> > > > > when it comes to debugging.
> > > >
> > > > Same here WRT user-space interpretation.
> > > >
> > > > This will become especially tricky on small BAR, because either we
> > > > need
> > > > to fit all compressed buffers in the mappable portion, or be able
> > > > to
> > > > blit the contents of the capture buffers from within the fence
> > > > signalling critical section, which will require a lot of work I
> > > > guess.
> > > >
> > > > /Thomas
> > > >
> > > >
> > > > >
> > > > > Regards, Joonas
> > > > >
> > > > > > Are we (and user-mode drivers) OK with these restrictions, or
> > > > > > do we
> > > > > > need
> > > > > > to rethink?
> > > > > >
> > > > > > Thanks,
> > > > > >
> > > > > > Thomas
> > > > > >
> > > > > >
> > > >
> > >
> >
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
