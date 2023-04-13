Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A64C6E1416
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 20:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 467C810EBB9;
	Thu, 13 Apr 2023 18:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83CD110EBB0;
 Thu, 13 Apr 2023 18:25:02 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id z16so10172122oib.9;
 Thu, 13 Apr 2023 11:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681410300; x=1684002300;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IQCnllSH7dJftTfgmLw0TzuSKV0B8nJdoGs2gjaL+i4=;
 b=N6pZLwyscFiPf1D5pZRoS9kQtl4f3jSthuAV/hFZG6acaUdKqRkNFkvrgZTfNfx18r
 J+O0r5kreAQRSZSORRSe/stzKtT3EsIIDjlmmbl/S8771W30VZV8E6jiW1TAfJuldW6a
 59h1TrNtv4rX+0iqkq5m4ovLHEtgkawmYFUDoVFN5jy++vLOPg8/BYthRa2r68AG9dsP
 WPSTWvH/HHBJDR0IS/CLGuvq6oh+lZ5RA7ingTM5oHZ4/lI5M2bBHW/qhxzFxT4e8R6g
 mjMP//s44BQBNez5b88Lq1+WyIUAZxnOuYuAJyxpeYQpalSasoSBRZEqF2T5274JwNNT
 LoMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681410300; x=1684002300;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IQCnllSH7dJftTfgmLw0TzuSKV0B8nJdoGs2gjaL+i4=;
 b=bWqvx5StqAE4MG9d56CCaVvLDinswZ/HBsVmaJf2s1RHI7yr8ObLkO3nzVToehLybg
 PzRR6zzhGvjfe9G5XEkA2NyorZ+d/w4yQF12hy6pX9/ebVQBU5lsfRAeZZFeYCPpDQim
 ZndeBDmYyou9w5MtoCb7JjLlKSI/Y6bCPSR3MDx+ZrHjf2+BkA9HRmWBB+84tK+qmY0z
 NDWyCn1lB8wRCKEo4RBU6iqPBDG0E9Sv7LeLHt5t5ughpjssHJVyaoeC3LsxHslbPEyz
 O2N7Lhm7tXmu/y6rVCe9e+OD72LmOI/Uvp1zjYuj1x6+ltCq5SzB7xs8/CH/ryTz5v55
 iHIw==
X-Gm-Message-State: AAQBX9dgxZIX7KmXpnuOkFe4dYKUnYKacO8utAsi1Q4f/ayybXDk/xgJ
 HNsyY44/1rr+5+Xi7oa2sL6gF0IpX4iuADQxmCc=
X-Google-Smtp-Source: AKy350Z3R1cZpqQ5DUGc7rHLGwOILPl+j/ncSvFrW1UKSFd/144WTOdC049sErW5ynp2FdIklif7/8ljxSaHQE3ErZo=
X-Received: by 2002:a05:6808:14f:b0:36e:f6f7:bb1a with SMTP id
 h15-20020a056808014f00b0036ef6f7bb1amr862590oie.5.1681410300524; Thu, 13 Apr
 2023 11:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230411225725.2032862-1-robdclark@gmail.com>
 <20230411225725.2032862-7-robdclark@gmail.com>
 <29a8d9aa-c6ea-873f-ce0b-fb8199b13068@linux.intel.com>
 <CAF6AEGsZsMx+Vy+4UQSx3X7w_QNvvjLqWxx=PnCLAOC9f-X2CQ@mail.gmail.com>
 <ZDb1phnddSne79iN@phenom.ffwll.local>
 <CAF6AEGvBeDVM12ac0j_PKSdcY83hNDhyrQs9-=h=dx_7AoMXLw@mail.gmail.com>
 <ZDcEGoSPGr/oRLas@phenom.ffwll.local>
 <c82fd8fa-9f4b-f62f-83be-25853f9ecf5e@linux.intel.com>
 <ZDgDQ1PqtXwu8zqA@phenom.ffwll.local>
 <ad8f2793-c1b3-a505-e93f-6cc52fded86d@linux.intel.com>
In-Reply-To: <ad8f2793-c1b3-a505-e93f-6cc52fded86d@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 13 Apr 2023 11:24:49 -0700
Message-ID: <CAF6AEGtTze668idO-ghyN5PHodk-f2eNc7yuhgett-LuaHLWSQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] drm: Add fdinfo memory stats
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-arm-msm@vger.kernel.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 13, 2023 at 9:40=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 13/04/2023 14:27, Daniel Vetter wrote:
> > On Thu, Apr 13, 2023 at 01:58:34PM +0100, Tvrtko Ursulin wrote:
> >>
> >> On 12/04/2023 20:18, Daniel Vetter wrote:
> >>> On Wed, Apr 12, 2023 at 11:42:07AM -0700, Rob Clark wrote:
> >>>> On Wed, Apr 12, 2023 at 11:17=E2=80=AFAM Daniel Vetter <daniel@ffwll=
.ch> wrote:
> >>>>>
> >>>>> On Wed, Apr 12, 2023 at 10:59:54AM -0700, Rob Clark wrote:
> >>>>>> On Wed, Apr 12, 2023 at 7:42=E2=80=AFAM Tvrtko Ursulin
> >>>>>> <tvrtko.ursulin@linux.intel.com> wrote:
> >>>>>>>
> >>>>>>>
> >>>>>>> On 11/04/2023 23:56, Rob Clark wrote:
> >>>>>>>> From: Rob Clark <robdclark@chromium.org>
> >>>>>>>>
> >>>>>>>> Add support to dump GEM stats to fdinfo.
> >>>>>>>>
> >>>>>>>> v2: Fix typos, change size units to match docs, use div_u64
> >>>>>>>> v3: Do it in core
> >>>>>>>>
> >>>>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>>>>>>> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> >>>>>>>> ---
> >>>>>>>>     Documentation/gpu/drm-usage-stats.rst | 21 ++++++++
> >>>>>>>>     drivers/gpu/drm/drm_file.c            | 76 +++++++++++++++++=
++++++++++
> >>>>>>>>     include/drm/drm_file.h                |  1 +
> >>>>>>>>     include/drm/drm_gem.h                 | 19 +++++++
> >>>>>>>>     4 files changed, 117 insertions(+)
> >>>>>>>>
> >>>>>>>> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentati=
on/gpu/drm-usage-stats.rst
> >>>>>>>> index b46327356e80..b5e7802532ed 100644
> >>>>>>>> --- a/Documentation/gpu/drm-usage-stats.rst
> >>>>>>>> +++ b/Documentation/gpu/drm-usage-stats.rst
> >>>>>>>> @@ -105,6 +105,27 @@ object belong to this client, in the respec=
tive memory region.
> >>>>>>>>     Default unit shall be bytes with optional unit specifiers of=
 'KiB' or 'MiB'
> >>>>>>>>     indicating kibi- or mebi-bytes.
> >>>>>>>>
> >>>>>>>> +- drm-shared-memory: <uint> [KiB|MiB]
> >>>>>>>> +
> >>>>>>>> +The total size of buffers that are shared with another file (ie=
. have more
> >>>>>>>> +than a single handle).
> >>>>>>>> +
> >>>>>>>> +- drm-private-memory: <uint> [KiB|MiB]
> >>>>>>>> +
> >>>>>>>> +The total size of buffers that are not shared with another file=
.
> >>>>>>>> +
> >>>>>>>> +- drm-resident-memory: <uint> [KiB|MiB]
> >>>>>>>> +
> >>>>>>>> +The total size of buffers that are resident in system memory.
> >>>>>>>
> >>>>>>> I think this naming maybe does not work best with the existing
> >>>>>>> drm-memory-<region> keys.
> >>>>>>
> >>>>>> Actually, it was very deliberate not to conflict with the existing
> >>>>>> drm-memory-<region> keys ;-)
> >>>>>>
> >>>>>> I wouldn't have preferred drm-memory-{active,resident,...} but it
> >>>>>> could be mis-parsed by existing userspace so my hands were a bit t=
ied.
> >>>>>>
> >>>>>>> How about introduce the concept of a memory region from the start=
 and
> >>>>>>> use naming similar like we do for engines?
> >>>>>>>
> >>>>>>> drm-memory-$CATEGORY-$REGION: ...
> >>>>>>>
> >>>>>>> Then we document a bunch of categories and their semantics, for i=
nstance:
> >>>>>>>
> >>>>>>> 'size' - All reachable objects
> >>>>>>> 'shared' - Subset of 'size' with handle_count > 1
> >>>>>>> 'resident' - Objects with backing store
> >>>>>>> 'active' - Objects in use, subset of resident
> >>>>>>> 'purgeable' - Or inactive? Subset of resident.
> >>>>>>>
> >>>>>>> We keep the same semantics as with process memory accounting (if =
I got
> >>>>>>> it right) which could be desirable for a simplified mental model.
> >>>>>>>
> >>>>>>> (AMD needs to remind me of their 'drm-memory-...' keys semantics.=
 If we
> >>>>>>> correctly captured this in the first round it should be equivalen=
t to
> >>>>>>> 'resident' above. In any case we can document no category is equa=
l to
> >>>>>>> which category, and at most one of the two must be output.)
> >>>>>>>
> >>>>>>> Region names we at most partially standardize. Like we could say
> >>>>>>> 'system' is to be used where backing store is system RAM and othe=
rs are
> >>>>>>> driver defined.
> >>>>>>>
> >>>>>>> Then discrete GPUs could emit N sets of key-values, one for each =
memory
> >>>>>>> region they support.
> >>>>>>>
> >>>>>>> I think this all also works for objects which can be migrated bet=
ween
> >>>>>>> memory regions. 'Size' accounts them against all regions while fo=
r
> >>>>>>> 'resident' they only appear in the region of their current placem=
ent, etc.
> >>>>>>
> >>>>>> I'm not too sure how to rectify different memory regions with this=
,
> >>>>>> since drm core doesn't really know about the driver's memory regio=
ns.
> >>>>>> Perhaps we can go back to this being a helper and drivers with vra=
m
> >>>>>> just don't use the helper?  Or??
> >>>>>
> >>>>> I think if you flip it around to drm-$CATEGORY-memory{-$REGION}: th=
en it
> >>>>> all works out reasonably consistently?
> >>>>
> >>>> That is basically what we have now.  I could append -system to each =
to
> >>>> make things easier to add vram/etc (from a uabi standpoint)..
> >>>
> >>> What you have isn't really -system, but everything. So doesn't really=
 make
> >>> sense to me to mark this -system, it's only really true for integrate=
d (if
> >>> they don't have stolen or something like that).
> >>>
> >>> Also my comment was more in reply to Tvrtko's suggestion.
> >>
> >> Right so my proposal was drm-memory-$CATEGORY-$REGION which I think al=
igns
> >> with the current drm-memory-$REGION by extending, rather than creating
> >> confusion with different order of key name components.
> >
> > Oh my comment was pretty much just bikeshed, in case someone creates a
> > $REGION that other drivers use for $CATEGORY. Kinda Rob's parsing point=
.
> > So $CATEGORY before the -memory.
> >
> > Otoh I don't think that'll happen, so I guess we can go with whatever m=
ore
> > folks like :-) I don't really care much personally.
>
> Okay I missed the parsing problem.
>
> >> AMD currently has (among others) drm-memory-vram, which we could defin=
e in
> >> the spec maps to category X, if category component is not present.
> >>
> >> Some examples:
> >>
> >> drm-memory-resident-system:
> >> drm-memory-size-lmem0:
> >> drm-memory-active-vram:
> >>
> >> Etc.. I think it creates a consistent story.
> >>
> >> Other than this, my two I think significant opens which haven't been
> >> addressed yet are:
> >>
> >> 1)
> >>
> >> Why do we want totals (not per region) when userspace can trivially
> >> aggregate if they want. What is the use case?
> >>
> >> 2)
> >>
> >> Current proposal limits the value to whole objects and fixates that by
> >> having it in the common code. If/when some driver is able to support s=
ub-BO
> >> granularity they will need to opt out of the common printer at which p=
oint
> >> it may be less churn to start with a helper rather than mid-layer. Or =
maybe
> >> some drivers already support this, I don't know. Given how important V=
M BIND
> >> is I wouldn't be surprised.
> >
> > I feel like for drivers using ttm we want a ttm helper which takes care=
 of
> > the region printing in hopefully a standard way. And that could then al=
so
> > take care of all kinds of of partial binding and funny rules (like mayb=
e
> > we want a standard vram region that addds up all the lmem regions on
> > intel, so that all dgpu have a common vram bucket that generic tools
> > understand?).
>
> First part yes, but for the second I would think we want to avoid any
> aggregation in the kernel which can be done in userspace just as well.
> Such total vram bucket would be pretty useless on Intel even since
> userspace needs to be region aware to make use of all resources. It
> could even be counter productive I think - "why am I getting out of
> memory when half of my vram is unused!?".
>
> > It does mean we walk the bo list twice, but *shrug*. People have been
> > complaining about procutils for decades, they're still horrible, I thin=
k
> > walking bo lists twice internally in the ttm case is going to be ok. If
> > not, it's internals, we can change them again.
> >
> > Also I'd lean a lot more towards making ttm a helper and not putting th=
at
> > into core, exactly because it's pretty clear we'll need more flexibilit=
y
> > when it comes to accurate stats for multi-region drivers.
>
> Exactly.

It could also be that the gem->status() fxn is extended to return
_which_ pool that object is in.. but either way, we aren't painting
ourselves into a corner

> > But for a first "how much gpu space does this app use" across everythin=
g I
> > think this is a good enough starting point.
>
> Okay so we agree this would be better as a helper and not in the core.
>
> On the point are keys/semantics good enough as a starting point I am
> still not convinced kernel should aggregate and that instead we should
> start from day one by appending -system (or something) to Rob's proposed
> keys.

I mean, if addition were expensive I might agree about not aggregating ;-)

BR,
-R

> Regards,
>
> Tvrtko
