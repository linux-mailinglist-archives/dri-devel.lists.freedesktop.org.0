Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A94306E1F05
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 11:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86ED210ECA2;
	Fri, 14 Apr 2023 09:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F395E10E16C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 09:08:11 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 c17-20020a4aa4d1000000b005418821052aso3583519oom.6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 02:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681463291; x=1684055291;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nn49dn21uHqj75EW6l2H6XnNrUDFT/Hwv4ZkYL+WMxE=;
 b=VmiExDud8RBg5xPfqIIcpUDk4IBCD9ZK3SIGG8/SaVqmNLukU4g1584P2CE9rusxAe
 qyLTQMbDWHysef1RuyO4Njls/Z+b8B1WQqd59T8O714qMQ2kZoxOsYpO5paWOK3y8R/E
 Par0bDPjhqB1aVwTqNE5g6HQ9SO0UkOw+K+A8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681463291; x=1684055291;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nn49dn21uHqj75EW6l2H6XnNrUDFT/Hwv4ZkYL+WMxE=;
 b=V+3vULT4+sQozEt9W1cZcxw73jqVnzwrtvTyOaJnTXoxm9+2M0/62ACVpkWTYhce3f
 NJjem8znA3AlrnxH4W167tqg4gI/Ma5gtu1gG7jD1pC8pQ59QRdapv3tMT63qEHyjatG
 obEiNYBiMchLFcJI0h9guI6eS+5itm4tgmK8Dq/qbl37h2up2Fp8M4q+UrOJaaoqjg9b
 yjAma40Y7lepSaH3yUQ6CCPv1nrY04n4MN1F/a+EZiX64dZeG1qMXUdSMUHNoKfm3eXz
 cv+zhKWlQQY4UdfpxT6uDgT8OqgUL7e58W5Lm9RFr8kmDo2VyQN6NJxR6865RZcgts0n
 fQ7A==
X-Gm-Message-State: AAQBX9egbRDJ+j8ZA/cL2eY0KMYC17/SXt1vIZPMAUttI6NRVwZqgoOU
 LodzOMErXe27a0Mg1ZVwl8ptKGiVN/Nd7BgwmEoZnw==
X-Google-Smtp-Source: AKy350ZqLRGSqMYBTRPWISQb1lK9i2Sy0uAeSLUnlsdnN2p+/oxaXUqdCXs3oNg7xFD6T9uSk4HI4m91O6DBSHQowe8=
X-Received: by 2002:a05:6820:1791:b0:542:1db6:ed6a with SMTP id
 bs17-20020a056820179100b005421db6ed6amr1706267oob.0.1681463290738; Fri, 14
 Apr 2023 02:08:10 -0700 (PDT)
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
 <ZDhgcqiOtJi6//TS@phenom.ffwll.local>
 <8893ad56-8807-eb69-2185-b338725f0b18@linux.intel.com>
In-Reply-To: <8893ad56-8807-eb69-2185-b338725f0b18@linux.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 14 Apr 2023 11:07:59 +0200
Message-ID: <CAKMK7uE+wxFFezLjZESvO+CyZjc9suptq9V2kC=ra3oB0wtDtA@mail.gmail.com>
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

On Fri, 14 Apr 2023 at 10:57, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
> On 13/04/2023 21:05, Daniel Vetter wrote:
> > On Thu, Apr 13, 2023 at 05:40:21PM +0100, Tvrtko Ursulin wrote:
> >>
> >> On 13/04/2023 14:27, Daniel Vetter wrote:
> >>> On Thu, Apr 13, 2023 at 01:58:34PM +0100, Tvrtko Ursulin wrote:
> >>>>
> >>>> On 12/04/2023 20:18, Daniel Vetter wrote:
> >>>>> On Wed, Apr 12, 2023 at 11:42:07AM -0700, Rob Clark wrote:
> >>>>>> On Wed, Apr 12, 2023 at 11:17=E2=80=AFAM Daniel Vetter <daniel@ffw=
ll.ch> wrote:
> >>>>>>>
> >>>>>>> On Wed, Apr 12, 2023 at 10:59:54AM -0700, Rob Clark wrote:
> >>>>>>>> On Wed, Apr 12, 2023 at 7:42=E2=80=AFAM Tvrtko Ursulin
> >>>>>>>> <tvrtko.ursulin@linux.intel.com> wrote:
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> On 11/04/2023 23:56, Rob Clark wrote:
> >>>>>>>>>> From: Rob Clark <robdclark@chromium.org>
> >>>>>>>>>>
> >>>>>>>>>> Add support to dump GEM stats to fdinfo.
> >>>>>>>>>>
> >>>>>>>>>> v2: Fix typos, change size units to match docs, use div_u64
> >>>>>>>>>> v3: Do it in core
> >>>>>>>>>>
> >>>>>>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>>>>>>>>> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> >>>>>>>>>> ---
> >>>>>>>>>>      Documentation/gpu/drm-usage-stats.rst | 21 ++++++++
> >>>>>>>>>>      drivers/gpu/drm/drm_file.c            | 76 ++++++++++++++=
+++++++++++++
> >>>>>>>>>>      include/drm/drm_file.h                |  1 +
> >>>>>>>>>>      include/drm/drm_gem.h                 | 19 +++++++
> >>>>>>>>>>      4 files changed, 117 insertions(+)
> >>>>>>>>>>
> >>>>>>>>>> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documenta=
tion/gpu/drm-usage-stats.rst
> >>>>>>>>>> index b46327356e80..b5e7802532ed 100644
> >>>>>>>>>> --- a/Documentation/gpu/drm-usage-stats.rst
> >>>>>>>>>> +++ b/Documentation/gpu/drm-usage-stats.rst
> >>>>>>>>>> @@ -105,6 +105,27 @@ object belong to this client, in the resp=
ective memory region.
> >>>>>>>>>>      Default unit shall be bytes with optional unit specifiers=
 of 'KiB' or 'MiB'
> >>>>>>>>>>      indicating kibi- or mebi-bytes.
> >>>>>>>>>>
> >>>>>>>>>> +- drm-shared-memory: <uint> [KiB|MiB]
> >>>>>>>>>> +
> >>>>>>>>>> +The total size of buffers that are shared with another file (=
ie. have more
> >>>>>>>>>> +than a single handle).
> >>>>>>>>>> +
> >>>>>>>>>> +- drm-private-memory: <uint> [KiB|MiB]
> >>>>>>>>>> +
> >>>>>>>>>> +The total size of buffers that are not shared with another fi=
le.
> >>>>>>>>>> +
> >>>>>>>>>> +- drm-resident-memory: <uint> [KiB|MiB]
> >>>>>>>>>> +
> >>>>>>>>>> +The total size of buffers that are resident in system memory.
> >>>>>>>>>
> >>>>>>>>> I think this naming maybe does not work best with the existing
> >>>>>>>>> drm-memory-<region> keys.
> >>>>>>>>
> >>>>>>>> Actually, it was very deliberate not to conflict with the existi=
ng
> >>>>>>>> drm-memory-<region> keys ;-)
> >>>>>>>>
> >>>>>>>> I wouldn't have preferred drm-memory-{active,resident,...} but i=
t
> >>>>>>>> could be mis-parsed by existing userspace so my hands were a bit=
 tied.
> >>>>>>>>
> >>>>>>>>> How about introduce the concept of a memory region from the sta=
rt and
> >>>>>>>>> use naming similar like we do for engines?
> >>>>>>>>>
> >>>>>>>>> drm-memory-$CATEGORY-$REGION: ...
> >>>>>>>>>
> >>>>>>>>> Then we document a bunch of categories and their semantics, for=
 instance:
> >>>>>>>>>
> >>>>>>>>> 'size' - All reachable objects
> >>>>>>>>> 'shared' - Subset of 'size' with handle_count > 1
> >>>>>>>>> 'resident' - Objects with backing store
> >>>>>>>>> 'active' - Objects in use, subset of resident
> >>>>>>>>> 'purgeable' - Or inactive? Subset of resident.
> >>>>>>>>>
> >>>>>>>>> We keep the same semantics as with process memory accounting (i=
f I got
> >>>>>>>>> it right) which could be desirable for a simplified mental mode=
l.
> >>>>>>>>>
> >>>>>>>>> (AMD needs to remind me of their 'drm-memory-...' keys semantic=
s. If we
> >>>>>>>>> correctly captured this in the first round it should be equival=
ent to
> >>>>>>>>> 'resident' above. In any case we can document no category is eq=
ual to
> >>>>>>>>> which category, and at most one of the two must be output.)
> >>>>>>>>>
> >>>>>>>>> Region names we at most partially standardize. Like we could sa=
y
> >>>>>>>>> 'system' is to be used where backing store is system RAM and ot=
hers are
> >>>>>>>>> driver defined.
> >>>>>>>>>
> >>>>>>>>> Then discrete GPUs could emit N sets of key-values, one for eac=
h memory
> >>>>>>>>> region they support.
> >>>>>>>>>
> >>>>>>>>> I think this all also works for objects which can be migrated b=
etween
> >>>>>>>>> memory regions. 'Size' accounts them against all regions while =
for
> >>>>>>>>> 'resident' they only appear in the region of their current plac=
ement, etc.
> >>>>>>>>
> >>>>>>>> I'm not too sure how to rectify different memory regions with th=
is,
> >>>>>>>> since drm core doesn't really know about the driver's memory reg=
ions.
> >>>>>>>> Perhaps we can go back to this being a helper and drivers with v=
ram
> >>>>>>>> just don't use the helper?  Or??
> >>>>>>>
> >>>>>>> I think if you flip it around to drm-$CATEGORY-memory{-$REGION}: =
then it
> >>>>>>> all works out reasonably consistently?
> >>>>>>
> >>>>>> That is basically what we have now.  I could append -system to eac=
h to
> >>>>>> make things easier to add vram/etc (from a uabi standpoint)..
> >>>>>
> >>>>> What you have isn't really -system, but everything. So doesn't real=
ly make
> >>>>> sense to me to mark this -system, it's only really true for integra=
ted (if
> >>>>> they don't have stolen or something like that).
> >>>>>
> >>>>> Also my comment was more in reply to Tvrtko's suggestion.
> >>>>
> >>>> Right so my proposal was drm-memory-$CATEGORY-$REGION which I think =
aligns
> >>>> with the current drm-memory-$REGION by extending, rather than creati=
ng
> >>>> confusion with different order of key name components.
> >>>
> >>> Oh my comment was pretty much just bikeshed, in case someone creates =
a
> >>> $REGION that other drivers use for $CATEGORY. Kinda Rob's parsing poi=
nt.
> >>> So $CATEGORY before the -memory.
> >>>
> >>> Otoh I don't think that'll happen, so I guess we can go with whatever=
 more
> >>> folks like :-) I don't really care much personally.
> >>
> >> Okay I missed the parsing problem.
> >>
> >>>> AMD currently has (among others) drm-memory-vram, which we could def=
ine in
> >>>> the spec maps to category X, if category component is not present.
> >>>>
> >>>> Some examples:
> >>>>
> >>>> drm-memory-resident-system:
> >>>> drm-memory-size-lmem0:
> >>>> drm-memory-active-vram:
> >>>>
> >>>> Etc.. I think it creates a consistent story.
> >>>>
> >>>> Other than this, my two I think significant opens which haven't been
> >>>> addressed yet are:
> >>>>
> >>>> 1)
> >>>>
> >>>> Why do we want totals (not per region) when userspace can trivially
> >>>> aggregate if they want. What is the use case?
> >>>>
> >>>> 2)
> >>>>
> >>>> Current proposal limits the value to whole objects and fixates that =
by
> >>>> having it in the common code. If/when some driver is able to support=
 sub-BO
> >>>> granularity they will need to opt out of the common printer at which=
 point
> >>>> it may be less churn to start with a helper rather than mid-layer. O=
r maybe
> >>>> some drivers already support this, I don't know. Given how important=
 VM BIND
> >>>> is I wouldn't be surprised.
> >>>
> >>> I feel like for drivers using ttm we want a ttm helper which takes ca=
re of
> >>> the region printing in hopefully a standard way. And that could then =
also
> >>> take care of all kinds of of partial binding and funny rules (like ma=
ybe
> >>> we want a standard vram region that addds up all the lmem regions on
> >>> intel, so that all dgpu have a common vram bucket that generic tools
> >>> understand?).
> >>
> >> First part yes, but for the second I would think we want to avoid any
> >> aggregation in the kernel which can be done in userspace just as well.=
 Such
> >> total vram bucket would be pretty useless on Intel even since userspac=
e
> >> needs to be region aware to make use of all resources. It could even b=
e
> >> counter productive I think - "why am I getting out of memory when half=
 of my
> >> vram is unused!?".
> >
> > This is not for intel-aware userspace. This is for fairly generic "gput=
op"
> > style userspace, which might simply have no clue or interest in what lm=
emX
> > means, but would understand vram.
> >
> > Aggregating makes sense.
>
> Lmem vs vram is now an argument not about aggregation but about
> standardizing regions names.
>
> One detail also is a change in philosophy compared to engine stats where
> engine names are not centrally prescribed and it was expected userspace
> will have to handle things generically and with some vendor specific
> knowledge.
>
> Like in my gputop patches. It doesn't need to understand what is what,
> it just finds what's there and presents it to the user.
>
> Come some accel driver with local memory it wouldn't be vram any more.
> Or even a headless data center GPU. So I really don't think it is good
> to hardcode 'vram' in the spec, or midlayer, or helpers.
>
> And for aggregation.. again, userspace can do it just as well. If we do
> it in kernel then immediately we have multiple sets of keys to output
> for any driver which wants to show the region view. IMO it is just
> pointless work in the kernel and more code in the kernel, when userspace
> can do it.
>
> Proposal A (one a discrete gpu, one category only):
>
> drm-resident-memory: x KiB
> drm-resident-memory-system: x KiB
> drm-resident-memory-vram: x KiB
>
> Two loops in the kernel, more parsing in userspace.
>
> Proposal B:
>
> drm-resident-memory-system: x KiB
> drm-resident-memory-vram: x KiB
>
> Can be one loop, one helper, less text for userspace to parse and it can
> still trivially show the total if so desired.
>
> For instance a helper (or two) with a common struct containing region
> names and totals, where a callback into the driver tallies under each
> region, as the drm helper is walking objects.

The difference is that Rob's patches exist, and consistently roll this
out across all drm drivers.

You're patches don't exist, and encourage further fragmentation. And
my take here is that "the good enough, and real" wins above "perfect,
but maybe in a few years and inconsitently across drivers".

No one is stopping you from writing a ton of patches to get towards
the perfect state, and we still want to get there. But I don't see the
point in rejecting the good enough for now for that.

It's kinda the same idea with scheduler stats, but the other way
round: Sure it'd have been great if we could have this consistently
across all drivers, but right now the scheduler situation just isn't
there to support that. I'm pushing a bit, but it's definitely years
away. So the pragmatic option there was to just roll things out
driver-by-driver, to get things going. It's not perfect at all, and it
would have been easy to nuke that entire fdinfo effort on those
grounds.

If you want maybe a todo.rst entry to cover this discussion and make
sure we do record the rough consensus of where we eventually want to
end up at?

> >>> It does mean we walk the bo list twice, but *shrug*. People have been
> >>> complaining about procutils for decades, they're still horrible, I th=
ink
> >>> walking bo lists twice internally in the ttm case is going to be ok. =
If
> >>> not, it's internals, we can change them again.
> >>>
> >>> Also I'd lean a lot more towards making ttm a helper and not putting =
that
> >>> into core, exactly because it's pretty clear we'll need more flexibil=
ity
> >>> when it comes to accurate stats for multi-region drivers.
> >>
> >> Exactly.
> >>
> >>> But for a first "how much gpu space does this app use" across everyth=
ing I
> >>> think this is a good enough starting point.
> >>
> >> Okay so we agree this would be better as a helper and not in the core.
> >
> > Nope, if you mean with this =3D Rob's patch. I was talking about a
> > hypothetical region-aware extension for ttm-using drivers.
> >
> >> On the point are keys/semantics good enough as a starting point I am s=
till
> >> not convinced kernel should aggregate and that instead we should start=
 from
> >> day one by appending -system (or something) to Rob's proposed keys.
> >
> > It should imo. Inflicting driver knowledge on generic userspace makes n=
ot
> > much sense, we should start with the more generally useful stuff imo.
> > That's why there's the drm fdinfo spec and all that so it's not a
> > free-for-all.
> >
> > Also Rob's stuff is _not_ system. Check on a i915 dgpu if you want :-)
>
> I am well aware it adds up everything, that is beside the point.
>
> Drm-usage-stats.rst text needs to be more precise across all keys at leas=
t:
>
> +- drm-resident-memory: <uint> [KiB|MiB]
> +
> +The total size of buffers that are resident in system memory.
>
> But as said, I don't see the point in providing aggregated values.

The choice isn't between aggregated values and split values.

The choice is between no values (for most drivers) and split values on
some drivers, vs aggregated values for everyone (and still split
values for some).
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
