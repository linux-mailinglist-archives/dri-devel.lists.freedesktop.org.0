Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E356E4A2C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 15:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA9310E4EB;
	Mon, 17 Apr 2023 13:43:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729FB10E4EB;
 Mon, 17 Apr 2023 13:43:01 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id a7so3075728oiw.7;
 Mon, 17 Apr 2023 06:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681738980; x=1684330980;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n1AboqRVWhxplnRX9xmGZ+3x7052CTP+9TiYfyhoHXg=;
 b=ohPPr+vPNReALlZf3AM1ln/5JqsYayv5WB/dJHTDy7h8gZOm2JiiHhkHExsuy0K/vb
 QxcTvrYjHVQLdh2MTccx5TflioxpArtJZq6eH7/ntDby2mtDq3bAfi238Z2t6ZfYyU4z
 FSa52wbkSms2TfgZ76cHxXCTk1FlCJz6VFqvlE5BdEMY4rB2cRO/kVKn8Jf1ZRDJmjmp
 ORF949qIofG9JH/5nMpP5yt3qEuSU6SOnochhwmvcyIlfq2/rvD82bKywSe+wGjBmr3U
 CNlFpX32BQ0AypmST7uzdIbp356z1fbUKLssI6bMhpFWxPpdSy5xIJHvvNgiP5vJEb7K
 Zl+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681738980; x=1684330980;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n1AboqRVWhxplnRX9xmGZ+3x7052CTP+9TiYfyhoHXg=;
 b=JcO9LH0eeYqS1Peyl25T2CcdO6XeCU00Ii2u3tApTojhTmhPzWCn89Lvi1F2otqxTp
 EBSP4FOJdvQcYQeoG9wx8YaSMSmu7XHXdgL2vcphx4W6un3Z0VMmi+BLZkOL1eHEUbVQ
 r9tcUJldiDot96Y3C+sH2UqJgYh60UoRF7VMmIfeUhFRvd3qvyZU8Vp44ogJmYGI90G5
 9p1A1+V5P8JSFoEE9tRdjZLypxyYEomsD6BSuW7bAut8b6KPN7JhmkNEvqgDeRR9CBC4
 W2cn73E05+rRZdxlXDWB5HtlktWAWL/qeTXjMlHLuGtqW09mcfsrFU6HE/K6KSRRBkTE
 1pNQ==
X-Gm-Message-State: AAQBX9etu8snKT4J0zo9V20Hhm0eJX/yWnrFymOq5D/AQ5tVsObnRuD5
 YPEhP01S3f6HhZyx7EVJu+NKgijvhTQZAJ1O2mw=
X-Google-Smtp-Source: AKy350b7dkndI2KxsBcOxqmecazSD1tapB/+6WpxXKRQdaHEuyziGzteX4PkhjMQ/BH8T7AjZ9jIVDvrBkKIzR0O9jk=
X-Received: by 2002:aca:de87:0:b0:38e:30:121b with SMTP id
 v129-20020acade87000000b0038e0030121bmr1054181oig.5.1681738979969; 
 Mon, 17 Apr 2023 06:42:59 -0700 (PDT)
MIME-Version: 1.0
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
 <ZDuoWC7TlvNa1OOm@phenom.ffwll.local>
 <09c8d794-bb64-f7ba-f854-f14ac30600a6@linux.intel.com>
In-Reply-To: <09c8d794-bb64-f7ba-f854-f14ac30600a6@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 17 Apr 2023 06:42:48 -0700
Message-ID: <CAF6AEGsvCBoS+uKyBESk_ZHm-H_nyMbVi0K4ND1Cfbw97QcYfQ@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 17, 2023 at 4:10=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 16/04/2023 08:48, Daniel Vetter wrote:
> > On Fri, Apr 14, 2023 at 06:40:27AM -0700, Rob Clark wrote:
> >> On Fri, Apr 14, 2023 at 1:57=E2=80=AFAM Tvrtko Ursulin
> >> <tvrtko.ursulin@linux.intel.com> wrote:
> >>>
> >>>
> >>> On 13/04/2023 21:05, Daniel Vetter wrote:
> >>>> On Thu, Apr 13, 2023 at 05:40:21PM +0100, Tvrtko Ursulin wrote:
> >>>>>
> >>>>> On 13/04/2023 14:27, Daniel Vetter wrote:
> >>>>>> On Thu, Apr 13, 2023 at 01:58:34PM +0100, Tvrtko Ursulin wrote:
> >>>>>>>
> >>>>>>> On 12/04/2023 20:18, Daniel Vetter wrote:
> >>>>>>>> On Wed, Apr 12, 2023 at 11:42:07AM -0700, Rob Clark wrote:
> >>>>>>>>> On Wed, Apr 12, 2023 at 11:17=E2=80=AFAM Daniel Vetter <daniel@=
ffwll.ch> wrote:
> >>>>>>>>>>
> >>>>>>>>>> On Wed, Apr 12, 2023 at 10:59:54AM -0700, Rob Clark wrote:
> >>>>>>>>>>> On Wed, Apr 12, 2023 at 7:42=E2=80=AFAM Tvrtko Ursulin
> >>>>>>>>>>> <tvrtko.ursulin@linux.intel.com> wrote:
> >>>>>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>>> On 11/04/2023 23:56, Rob Clark wrote:
> >>>>>>>>>>>>> From: Rob Clark <robdclark@chromium.org>
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Add support to dump GEM stats to fdinfo.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> v2: Fix typos, change size units to match docs, use div_u64
> >>>>>>>>>>>>> v3: Do it in core
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>>>>>>>>>>>> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> >>>>>>>>>>>>> ---
> >>>>>>>>>>>>>       Documentation/gpu/drm-usage-stats.rst | 21 ++++++++
> >>>>>>>>>>>>>       drivers/gpu/drm/drm_file.c            | 76 ++++++++++=
+++++++++++++++++
> >>>>>>>>>>>>>       include/drm/drm_file.h                |  1 +
> >>>>>>>>>>>>>       include/drm/drm_gem.h                 | 19 +++++++
> >>>>>>>>>>>>>       4 files changed, 117 insertions(+)
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Docume=
ntation/gpu/drm-usage-stats.rst
> >>>>>>>>>>>>> index b46327356e80..b5e7802532ed 100644
> >>>>>>>>>>>>> --- a/Documentation/gpu/drm-usage-stats.rst
> >>>>>>>>>>>>> +++ b/Documentation/gpu/drm-usage-stats.rst
> >>>>>>>>>>>>> @@ -105,6 +105,27 @@ object belong to this client, in the r=
espective memory region.
> >>>>>>>>>>>>>       Default unit shall be bytes with optional unit specif=
iers of 'KiB' or 'MiB'
> >>>>>>>>>>>>>       indicating kibi- or mebi-bytes.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> +- drm-shared-memory: <uint> [KiB|MiB]
> >>>>>>>>>>>>> +
> >>>>>>>>>>>>> +The total size of buffers that are shared with another fil=
e (ie. have more
> >>>>>>>>>>>>> +than a single handle).
> >>>>>>>>>>>>> +
> >>>>>>>>>>>>> +- drm-private-memory: <uint> [KiB|MiB]
> >>>>>>>>>>>>> +
> >>>>>>>>>>>>> +The total size of buffers that are not shared with another=
 file.
> >>>>>>>>>>>>> +
> >>>>>>>>>>>>> +- drm-resident-memory: <uint> [KiB|MiB]
> >>>>>>>>>>>>> +
> >>>>>>>>>>>>> +The total size of buffers that are resident in system memo=
ry.
> >>>>>>>>>>>>
> >>>>>>>>>>>> I think this naming maybe does not work best with the existi=
ng
> >>>>>>>>>>>> drm-memory-<region> keys.
> >>>>>>>>>>>
> >>>>>>>>>>> Actually, it was very deliberate not to conflict with the exi=
sting
> >>>>>>>>>>> drm-memory-<region> keys ;-)
> >>>>>>>>>>>
> >>>>>>>>>>> I wouldn't have preferred drm-memory-{active,resident,...} bu=
t it
> >>>>>>>>>>> could be mis-parsed by existing userspace so my hands were a =
bit tied.
> >>>>>>>>>>>
> >>>>>>>>>>>> How about introduce the concept of a memory region from the =
start and
> >>>>>>>>>>>> use naming similar like we do for engines?
> >>>>>>>>>>>>
> >>>>>>>>>>>> drm-memory-$CATEGORY-$REGION: ...
> >>>>>>>>>>>>
> >>>>>>>>>>>> Then we document a bunch of categories and their semantics, =
for instance:
> >>>>>>>>>>>>
> >>>>>>>>>>>> 'size' - All reachable objects
> >>>>>>>>>>>> 'shared' - Subset of 'size' with handle_count > 1
> >>>>>>>>>>>> 'resident' - Objects with backing store
> >>>>>>>>>>>> 'active' - Objects in use, subset of resident
> >>>>>>>>>>>> 'purgeable' - Or inactive? Subset of resident.
> >>>>>>>>>>>>
> >>>>>>>>>>>> We keep the same semantics as with process memory accounting=
 (if I got
> >>>>>>>>>>>> it right) which could be desirable for a simplified mental m=
odel.
> >>>>>>>>>>>>
> >>>>>>>>>>>> (AMD needs to remind me of their 'drm-memory-...' keys seman=
tics. If we
> >>>>>>>>>>>> correctly captured this in the first round it should be equi=
valent to
> >>>>>>>>>>>> 'resident' above. In any case we can document no category is=
 equal to
> >>>>>>>>>>>> which category, and at most one of the two must be output.)
> >>>>>>>>>>>>
> >>>>>>>>>>>> Region names we at most partially standardize. Like we could=
 say
> >>>>>>>>>>>> 'system' is to be used where backing store is system RAM and=
 others are
> >>>>>>>>>>>> driver defined.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Then discrete GPUs could emit N sets of key-values, one for =
each memory
> >>>>>>>>>>>> region they support.
> >>>>>>>>>>>>
> >>>>>>>>>>>> I think this all also works for objects which can be migrate=
d between
> >>>>>>>>>>>> memory regions. 'Size' accounts them against all regions whi=
le for
> >>>>>>>>>>>> 'resident' they only appear in the region of their current p=
lacement, etc.
> >>>>>>>>>>>
> >>>>>>>>>>> I'm not too sure how to rectify different memory regions with=
 this,
> >>>>>>>>>>> since drm core doesn't really know about the driver's memory =
regions.
> >>>>>>>>>>> Perhaps we can go back to this being a helper and drivers wit=
h vram
> >>>>>>>>>>> just don't use the helper?  Or??
> >>>>>>>>>>
> >>>>>>>>>> I think if you flip it around to drm-$CATEGORY-memory{-$REGION=
}: then it
> >>>>>>>>>> all works out reasonably consistently?
> >>>>>>>>>
> >>>>>>>>> That is basically what we have now.  I could append -system to =
each to
> >>>>>>>>> make things easier to add vram/etc (from a uabi standpoint)..
> >>>>>>>>
> >>>>>>>> What you have isn't really -system, but everything. So doesn't r=
eally make
> >>>>>>>> sense to me to mark this -system, it's only really true for inte=
grated (if
> >>>>>>>> they don't have stolen or something like that).
> >>>>>>>>
> >>>>>>>> Also my comment was more in reply to Tvrtko's suggestion.
> >>>>>>>
> >>>>>>> Right so my proposal was drm-memory-$CATEGORY-$REGION which I thi=
nk aligns
> >>>>>>> with the current drm-memory-$REGION by extending, rather than cre=
ating
> >>>>>>> confusion with different order of key name components.
> >>>>>>
> >>>>>> Oh my comment was pretty much just bikeshed, in case someone creat=
es a
> >>>>>> $REGION that other drivers use for $CATEGORY. Kinda Rob's parsing =
point.
> >>>>>> So $CATEGORY before the -memory.
> >>>>>>
> >>>>>> Otoh I don't think that'll happen, so I guess we can go with whate=
ver more
> >>>>>> folks like :-) I don't really care much personally.
> >>>>>
> >>>>> Okay I missed the parsing problem.
> >>>>>
> >>>>>>> AMD currently has (among others) drm-memory-vram, which we could =
define in
> >>>>>>> the spec maps to category X, if category component is not present=
.
> >>>>>>>
> >>>>>>> Some examples:
> >>>>>>>
> >>>>>>> drm-memory-resident-system:
> >>>>>>> drm-memory-size-lmem0:
> >>>>>>> drm-memory-active-vram:
> >>>>>>>
> >>>>>>> Etc.. I think it creates a consistent story.
> >>>>>>>
> >>>>>>> Other than this, my two I think significant opens which haven't b=
een
> >>>>>>> addressed yet are:
> >>>>>>>
> >>>>>>> 1)
> >>>>>>>
> >>>>>>> Why do we want totals (not per region) when userspace can trivial=
ly
> >>>>>>> aggregate if they want. What is the use case?
> >>>>>>>
> >>>>>>> 2)
> >>>>>>>
> >>>>>>> Current proposal limits the value to whole objects and fixates th=
at by
> >>>>>>> having it in the common code. If/when some driver is able to supp=
ort sub-BO
> >>>>>>> granularity they will need to opt out of the common printer at wh=
ich point
> >>>>>>> it may be less churn to start with a helper rather than mid-layer=
. Or maybe
> >>>>>>> some drivers already support this, I don't know. Given how import=
ant VM BIND
> >>>>>>> is I wouldn't be surprised.
> >>>>>>
> >>>>>> I feel like for drivers using ttm we want a ttm helper which takes=
 care of
> >>>>>> the region printing in hopefully a standard way. And that could th=
en also
> >>>>>> take care of all kinds of of partial binding and funny rules (like=
 maybe
> >>>>>> we want a standard vram region that addds up all the lmem regions =
on
> >>>>>> intel, so that all dgpu have a common vram bucket that generic too=
ls
> >>>>>> understand?).
> >>>>>
> >>>>> First part yes, but for the second I would think we want to avoid a=
ny
> >>>>> aggregation in the kernel which can be done in userspace just as we=
ll. Such
> >>>>> total vram bucket would be pretty useless on Intel even since users=
pace
> >>>>> needs to be region aware to make use of all resources. It could eve=
n be
> >>>>> counter productive I think - "why am I getting out of memory when h=
alf of my
> >>>>> vram is unused!?".
> >>>>
> >>>> This is not for intel-aware userspace. This is for fairly generic "g=
putop"
> >>>> style userspace, which might simply have no clue or interest in what=
 lmemX
> >>>> means, but would understand vram.
> >>>>
> >>>> Aggregating makes sense.
> >>>
> >>> Lmem vs vram is now an argument not about aggregation but about
> >>> standardizing regions names.
> >>>
> >>> One detail also is a change in philosophy compared to engine stats wh=
ere
> >>> engine names are not centrally prescribed and it was expected userspa=
ce
> >>> will have to handle things generically and with some vendor specific
> >>> knowledge.
> >>>
> >>> Like in my gputop patches. It doesn't need to understand what is what=
,
> >>> it just finds what's there and presents it to the user.
> >>>
> >>> Come some accel driver with local memory it wouldn't be vram any more=
.
> >>> Or even a headless data center GPU. So I really don't think it is goo=
d
> >>> to hardcode 'vram' in the spec, or midlayer, or helpers.
> >>>
> >>> And for aggregation.. again, userspace can do it just as well. If we =
do
> >>> it in kernel then immediately we have multiple sets of keys to output
> >>> for any driver which wants to show the region view. IMO it is just
> >>> pointless work in the kernel and more code in the kernel, when usersp=
ace
> >>> can do it.
> >>>
> >>> Proposal A (one a discrete gpu, one category only):
> >>>
> >>> drm-resident-memory: x KiB
> >>> drm-resident-memory-system: x KiB
> >>> drm-resident-memory-vram: x KiB
> >>>
> >>> Two loops in the kernel, more parsing in userspace.
> >>
> >> why would it be more than one loop, ie.
> >>
> >>      mem.resident +=3D size;
> >>      mem.category[cat].resident +=3D size;
> >>
> >> At the end of the day, there is limited real-estate to show a million
> >> different columns of information.  Even the gputop patches I posted
> >> don't show everything of what is currently there.  And nvtop only
> >> shows toplevel resident stat.  So I think the "everything" stat is
> >> going to be what most tools use.
> >
> > Yeah with enough finesse the double-loop isn't needed, it's just the
> > simplest possible approach.
> >
> > Also this is fdinfo, I _really_ want perf data showing that it's a
> > real-world problem when we conjecture about algorithmic complexity.
> > procutils have been algorithmically garbage since decades after all :-)
>
> Just run it. :)
>
> Algorithmic complexity is quite obvious and not a conjecture - to find
> DRM clients you have to walk _all_ pids and _all_ fds under them. So
> amount of work can scale very quickly and even _not_ with the number of
> DRM clients.
>
> It's not too bad on my desktop setup but it is significantly more CPU
> intensive than top(1).
>
> It would be possible to optimise the current code some more by not
> parsing full fdinfo (may become more important as number of keys grow),
> but that's only relevant when number of drm fds is large. It doesn't
> solve the basic pids * open fds search for which we'd need a way to walk
> the list of pids with drm fds directly.

All of which has (almost[1]) nothing to do with one loop or two
(ignoring for a moment that I already pointed out a single loop is all
that is needed).  If CPU overhead is a problem, we could perhaps come
up some sysfs which has one file per drm_file and side-step crawling
of all of the proc * fd.  I'll play around with it some but I'm pretty
sure you are trying to optimize the wrong thing.

BR,
-R

[1] generally a single process using drm has multiple fd's pointing at
the same drm_file.. which makes the current approach of having to read
fdinfo to find the client-id sub-optimal.  But still the total # of
proc * fd is much larger
