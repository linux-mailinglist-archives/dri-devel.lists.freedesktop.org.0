Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCB16E35DE
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 09:48:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9318510E298;
	Sun, 16 Apr 2023 07:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19E910E298
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 07:48:45 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5067716f9e7so284285a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 00:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681631324; x=1684223324;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=43y07G1E6fBR498lLFNHKYWyM0qI1udqjCQAy8Cu75k=;
 b=ilt5i4mOZqVVeLhQb+/O26qmioJdaklEVl6AHABZWEQOICuDD6aC6HhaOhAN2S0JgK
 ccREjKPRSWjVABb8gXO6d6xkOUjVP/tLCFjndOP9BKRFIWQZYGy5/udg+zpxW0g6eg2L
 YQityX0UY8Mzj/fUEqQ6hAasK9WBsleITSTao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681631324; x=1684223324;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=43y07G1E6fBR498lLFNHKYWyM0qI1udqjCQAy8Cu75k=;
 b=UBnk2/46CMk5vI4ubN2ZetY4C9a/5S8M6ZNrwXlrDl6oI+Ajor11Q+eYNeIkuh1cnM
 k1srHQfoJ1/NHmIjlzbb/Un5gQPvSPWwbFl6L8Xr1/Ydmm3r4owiimugN3uf9fxK/2kw
 /DaklrHc5LHOnuJMOzKC3HvMLqeb0WLL2AmCmrBERN1J/PUCQ6jmH5lvkA8038NByFbX
 9jo3Hu4mb8Ubyf9K1A+OUQYqWcctbgkniGs70NsmYoUXj4D3mE+ul1lL81Mj3y4/oM7k
 Ldjm9Ss2Focdb9OOnyDJShtgRlqSV3pjFYTn/S49sPksh76U0lHFwN6Y0LDWHgRkorji
 gpFg==
X-Gm-Message-State: AAQBX9d1UgxwZCAmhINWvD4ZT0Yv2kfX9TNBSNjh+JZTmqkJ8QS6gLbh
 BVxD3KEf3C+iLWK1pKEKocmsjg==
X-Google-Smtp-Source: AKy350ai2aICCecMEx/7tuk+YPzIlN0GVLGGy6olO/Qoxg78TNiQXADErdrjwSPJOPur/xIEUV7svQ==
X-Received: by 2002:a17:906:24f:b0:931:4285:ea1d with SMTP id
 15-20020a170906024f00b009314285ea1dmr6533206ejl.5.1681631323878; 
 Sun, 16 Apr 2023 00:48:43 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 gq13-20020a170906e24d00b0094f17b7c4b0sm1870286ejb.134.2023.04.16.00.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 00:48:42 -0700 (PDT)
Date: Sun, 16 Apr 2023 09:48:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v3 6/7] drm: Add fdinfo memory stats
Message-ID: <ZDuoWC7TlvNa1OOm@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 freedreno@lists.freedesktop.org
References: <CAF6AEGsZsMx+Vy+4UQSx3X7w_QNvvjLqWxx=PnCLAOC9f-X2CQ@mail.gmail.com>
 <ZDb1phnddSne79iN@phenom.ffwll.local>
 <CAF6AEGvBeDVM12ac0j_PKSdcY83hNDhyrQs9-=h=dx_7AoMXLw@mail.gmail.com>
 <ZDcEGoSPGr/oRLas@phenom.ffwll.local>
 <c82fd8fa-9f4b-f62f-83be-25853f9ecf5e@linux.intel.com>
 <ZDgDQ1PqtXwu8zqA@phenom.ffwll.local>
 <ad8f2793-c1b3-a505-e93f-6cc52fded86d@linux.intel.com>
 <ZDhgcqiOtJi6//TS@phenom.ffwll.local>
 <8893ad56-8807-eb69-2185-b338725f0b18@linux.intel.com>
 <CAF6AEGtaiKMWsGxTSUHM7_s_Wqiw3=ta+g=arUxknJ0dxbYvFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGtaiKMWsGxTSUHM7_s_Wqiw3=ta+g=arUxknJ0dxbYvFQ@mail.gmail.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 14, 2023 at 06:40:27AM -0700, Rob Clark wrote:
> On Fri, Apr 14, 2023 at 1:57 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
> >
> >
> > On 13/04/2023 21:05, Daniel Vetter wrote:
> > > On Thu, Apr 13, 2023 at 05:40:21PM +0100, Tvrtko Ursulin wrote:
> > >>
> > >> On 13/04/2023 14:27, Daniel Vetter wrote:
> > >>> On Thu, Apr 13, 2023 at 01:58:34PM +0100, Tvrtko Ursulin wrote:
> > >>>>
> > >>>> On 12/04/2023 20:18, Daniel Vetter wrote:
> > >>>>> On Wed, Apr 12, 2023 at 11:42:07AM -0700, Rob Clark wrote:
> > >>>>>> On Wed, Apr 12, 2023 at 11:17 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >>>>>>>
> > >>>>>>> On Wed, Apr 12, 2023 at 10:59:54AM -0700, Rob Clark wrote:
> > >>>>>>>> On Wed, Apr 12, 2023 at 7:42 AM Tvrtko Ursulin
> > >>>>>>>> <tvrtko.ursulin@linux.intel.com> wrote:
> > >>>>>>>>>
> > >>>>>>>>>
> > >>>>>>>>> On 11/04/2023 23:56, Rob Clark wrote:
> > >>>>>>>>>> From: Rob Clark <robdclark@chromium.org>
> > >>>>>>>>>>
> > >>>>>>>>>> Add support to dump GEM stats to fdinfo.
> > >>>>>>>>>>
> > >>>>>>>>>> v2: Fix typos, change size units to match docs, use div_u64
> > >>>>>>>>>> v3: Do it in core
> > >>>>>>>>>>
> > >>>>>>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> > >>>>>>>>>> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> > >>>>>>>>>> ---
> > >>>>>>>>>>      Documentation/gpu/drm-usage-stats.rst | 21 ++++++++
> > >>>>>>>>>>      drivers/gpu/drm/drm_file.c            | 76 +++++++++++++++++++++++++++
> > >>>>>>>>>>      include/drm/drm_file.h                |  1 +
> > >>>>>>>>>>      include/drm/drm_gem.h                 | 19 +++++++
> > >>>>>>>>>>      4 files changed, 117 insertions(+)
> > >>>>>>>>>>
> > >>>>>>>>>> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> > >>>>>>>>>> index b46327356e80..b5e7802532ed 100644
> > >>>>>>>>>> --- a/Documentation/gpu/drm-usage-stats.rst
> > >>>>>>>>>> +++ b/Documentation/gpu/drm-usage-stats.rst
> > >>>>>>>>>> @@ -105,6 +105,27 @@ object belong to this client, in the respective memory region.
> > >>>>>>>>>>      Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
> > >>>>>>>>>>      indicating kibi- or mebi-bytes.
> > >>>>>>>>>>
> > >>>>>>>>>> +- drm-shared-memory: <uint> [KiB|MiB]
> > >>>>>>>>>> +
> > >>>>>>>>>> +The total size of buffers that are shared with another file (ie. have more
> > >>>>>>>>>> +than a single handle).
> > >>>>>>>>>> +
> > >>>>>>>>>> +- drm-private-memory: <uint> [KiB|MiB]
> > >>>>>>>>>> +
> > >>>>>>>>>> +The total size of buffers that are not shared with another file.
> > >>>>>>>>>> +
> > >>>>>>>>>> +- drm-resident-memory: <uint> [KiB|MiB]
> > >>>>>>>>>> +
> > >>>>>>>>>> +The total size of buffers that are resident in system memory.
> > >>>>>>>>>
> > >>>>>>>>> I think this naming maybe does not work best with the existing
> > >>>>>>>>> drm-memory-<region> keys.
> > >>>>>>>>
> > >>>>>>>> Actually, it was very deliberate not to conflict with the existing
> > >>>>>>>> drm-memory-<region> keys ;-)
> > >>>>>>>>
> > >>>>>>>> I wouldn't have preferred drm-memory-{active,resident,...} but it
> > >>>>>>>> could be mis-parsed by existing userspace so my hands were a bit tied.
> > >>>>>>>>
> > >>>>>>>>> How about introduce the concept of a memory region from the start and
> > >>>>>>>>> use naming similar like we do for engines?
> > >>>>>>>>>
> > >>>>>>>>> drm-memory-$CATEGORY-$REGION: ...
> > >>>>>>>>>
> > >>>>>>>>> Then we document a bunch of categories and their semantics, for instance:
> > >>>>>>>>>
> > >>>>>>>>> 'size' - All reachable objects
> > >>>>>>>>> 'shared' - Subset of 'size' with handle_count > 1
> > >>>>>>>>> 'resident' - Objects with backing store
> > >>>>>>>>> 'active' - Objects in use, subset of resident
> > >>>>>>>>> 'purgeable' - Or inactive? Subset of resident.
> > >>>>>>>>>
> > >>>>>>>>> We keep the same semantics as with process memory accounting (if I got
> > >>>>>>>>> it right) which could be desirable for a simplified mental model.
> > >>>>>>>>>
> > >>>>>>>>> (AMD needs to remind me of their 'drm-memory-...' keys semantics. If we
> > >>>>>>>>> correctly captured this in the first round it should be equivalent to
> > >>>>>>>>> 'resident' above. In any case we can document no category is equal to
> > >>>>>>>>> which category, and at most one of the two must be output.)
> > >>>>>>>>>
> > >>>>>>>>> Region names we at most partially standardize. Like we could say
> > >>>>>>>>> 'system' is to be used where backing store is system RAM and others are
> > >>>>>>>>> driver defined.
> > >>>>>>>>>
> > >>>>>>>>> Then discrete GPUs could emit N sets of key-values, one for each memory
> > >>>>>>>>> region they support.
> > >>>>>>>>>
> > >>>>>>>>> I think this all also works for objects which can be migrated between
> > >>>>>>>>> memory regions. 'Size' accounts them against all regions while for
> > >>>>>>>>> 'resident' they only appear in the region of their current placement, etc.
> > >>>>>>>>
> > >>>>>>>> I'm not too sure how to rectify different memory regions with this,
> > >>>>>>>> since drm core doesn't really know about the driver's memory regions.
> > >>>>>>>> Perhaps we can go back to this being a helper and drivers with vram
> > >>>>>>>> just don't use the helper?  Or??
> > >>>>>>>
> > >>>>>>> I think if you flip it around to drm-$CATEGORY-memory{-$REGION}: then it
> > >>>>>>> all works out reasonably consistently?
> > >>>>>>
> > >>>>>> That is basically what we have now.  I could append -system to each to
> > >>>>>> make things easier to add vram/etc (from a uabi standpoint)..
> > >>>>>
> > >>>>> What you have isn't really -system, but everything. So doesn't really make
> > >>>>> sense to me to mark this -system, it's only really true for integrated (if
> > >>>>> they don't have stolen or something like that).
> > >>>>>
> > >>>>> Also my comment was more in reply to Tvrtko's suggestion.
> > >>>>
> > >>>> Right so my proposal was drm-memory-$CATEGORY-$REGION which I think aligns
> > >>>> with the current drm-memory-$REGION by extending, rather than creating
> > >>>> confusion with different order of key name components.
> > >>>
> > >>> Oh my comment was pretty much just bikeshed, in case someone creates a
> > >>> $REGION that other drivers use for $CATEGORY. Kinda Rob's parsing point.
> > >>> So $CATEGORY before the -memory.
> > >>>
> > >>> Otoh I don't think that'll happen, so I guess we can go with whatever more
> > >>> folks like :-) I don't really care much personally.
> > >>
> > >> Okay I missed the parsing problem.
> > >>
> > >>>> AMD currently has (among others) drm-memory-vram, which we could define in
> > >>>> the spec maps to category X, if category component is not present.
> > >>>>
> > >>>> Some examples:
> > >>>>
> > >>>> drm-memory-resident-system:
> > >>>> drm-memory-size-lmem0:
> > >>>> drm-memory-active-vram:
> > >>>>
> > >>>> Etc.. I think it creates a consistent story.
> > >>>>
> > >>>> Other than this, my two I think significant opens which haven't been
> > >>>> addressed yet are:
> > >>>>
> > >>>> 1)
> > >>>>
> > >>>> Why do we want totals (not per region) when userspace can trivially
> > >>>> aggregate if they want. What is the use case?
> > >>>>
> > >>>> 2)
> > >>>>
> > >>>> Current proposal limits the value to whole objects and fixates that by
> > >>>> having it in the common code. If/when some driver is able to support sub-BO
> > >>>> granularity they will need to opt out of the common printer at which point
> > >>>> it may be less churn to start with a helper rather than mid-layer. Or maybe
> > >>>> some drivers already support this, I don't know. Given how important VM BIND
> > >>>> is I wouldn't be surprised.
> > >>>
> > >>> I feel like for drivers using ttm we want a ttm helper which takes care of
> > >>> the region printing in hopefully a standard way. And that could then also
> > >>> take care of all kinds of of partial binding and funny rules (like maybe
> > >>> we want a standard vram region that addds up all the lmem regions on
> > >>> intel, so that all dgpu have a common vram bucket that generic tools
> > >>> understand?).
> > >>
> > >> First part yes, but for the second I would think we want to avoid any
> > >> aggregation in the kernel which can be done in userspace just as well. Such
> > >> total vram bucket would be pretty useless on Intel even since userspace
> > >> needs to be region aware to make use of all resources. It could even be
> > >> counter productive I think - "why am I getting out of memory when half of my
> > >> vram is unused!?".
> > >
> > > This is not for intel-aware userspace. This is for fairly generic "gputop"
> > > style userspace, which might simply have no clue or interest in what lmemX
> > > means, but would understand vram.
> > >
> > > Aggregating makes sense.
> >
> > Lmem vs vram is now an argument not about aggregation but about
> > standardizing regions names.
> >
> > One detail also is a change in philosophy compared to engine stats where
> > engine names are not centrally prescribed and it was expected userspace
> > will have to handle things generically and with some vendor specific
> > knowledge.
> >
> > Like in my gputop patches. It doesn't need to understand what is what,
> > it just finds what's there and presents it to the user.
> >
> > Come some accel driver with local memory it wouldn't be vram any more.
> > Or even a headless data center GPU. So I really don't think it is good
> > to hardcode 'vram' in the spec, or midlayer, or helpers.
> >
> > And for aggregation.. again, userspace can do it just as well. If we do
> > it in kernel then immediately we have multiple sets of keys to output
> > for any driver which wants to show the region view. IMO it is just
> > pointless work in the kernel and more code in the kernel, when userspace
> > can do it.
> >
> > Proposal A (one a discrete gpu, one category only):
> >
> > drm-resident-memory: x KiB
> > drm-resident-memory-system: x KiB
> > drm-resident-memory-vram: x KiB
> >
> > Two loops in the kernel, more parsing in userspace.
> 
> why would it be more than one loop, ie.
> 
>     mem.resident += size;
>     mem.category[cat].resident += size;
> 
> At the end of the day, there is limited real-estate to show a million
> different columns of information.  Even the gputop patches I posted
> don't show everything of what is currently there.  And nvtop only
> shows toplevel resident stat.  So I think the "everything" stat is
> going to be what most tools use.

Yeah with enough finesse the double-loop isn't needed, it's just the
simplest possible approach.

Also this is fdinfo, I _really_ want perf data showing that it's a
real-world problem when we conjecture about algorithmic complexity.
procutils have been algorithmically garbage since decades after all :-)

Cheers, Daniel

> 
> BR,
> -R
> 
> > Proposal B:
> >
> > drm-resident-memory-system: x KiB
> > drm-resident-memory-vram: x KiB
> >
> > Can be one loop, one helper, less text for userspace to parse and it can
> > still trivially show the total if so desired.
> >
> > For instance a helper (or two) with a common struct containing region
> > names and totals, where a callback into the driver tallies under each
> > region, as the drm helper is walking objects.
> >
> > >>> It does mean we walk the bo list twice, but *shrug*. People have been
> > >>> complaining about procutils for decades, they're still horrible, I think
> > >>> walking bo lists twice internally in the ttm case is going to be ok. If
> > >>> not, it's internals, we can change them again.
> > >>>
> > >>> Also I'd lean a lot more towards making ttm a helper and not putting that
> > >>> into core, exactly because it's pretty clear we'll need more flexibility
> > >>> when it comes to accurate stats for multi-region drivers.
> > >>
> > >> Exactly.
> > >>
> > >>> But for a first "how much gpu space does this app use" across everything I
> > >>> think this is a good enough starting point.
> > >>
> > >> Okay so we agree this would be better as a helper and not in the core.
> > >
> > > Nope, if you mean with this = Rob's patch. I was talking about a
> > > hypothetical region-aware extension for ttm-using drivers.
> > >
> > >> On the point are keys/semantics good enough as a starting point I am still
> > >> not convinced kernel should aggregate and that instead we should start from
> > >> day one by appending -system (or something) to Rob's proposed keys.
> > >
> > > It should imo. Inflicting driver knowledge on generic userspace makes not
> > > much sense, we should start with the more generally useful stuff imo.
> > > That's why there's the drm fdinfo spec and all that so it's not a
> > > free-for-all.
> > >
> > > Also Rob's stuff is _not_ system. Check on a i915 dgpu if you want :-)
> >
> > I am well aware it adds up everything, that is beside the point.
> >
> > Drm-usage-stats.rst text needs to be more precise across all keys at least:
> >
> > +- drm-resident-memory: <uint> [KiB|MiB]
> > +
> > +The total size of buffers that are resident in system memory.
> >
> > But as said, I don't see the point in providing aggregated values.
> >
> > Regards,
> >
> > Tvrtko

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
