Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 993336E159A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 22:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D041C10EC26;
	Thu, 13 Apr 2023 20:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6558610EC29
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 20:05:11 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-2f4b604e234so187662f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 13:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681416309; x=1684008309;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Sx7M/dCw9kSVzl4hqHZ0qK7wQeSJm9Xfsz/Z8FKSRXg=;
 b=A3LNy352SNFfvTEclo7tcl1r8jvgwbFDaiPgELrhbtIVvtAXZ3gnJA/+JlC0IOyoqN
 rHtmDoTs12RBrUec8JlTUxTJYQISXmqasf1GOZGp/n/v1AaPGhra5L/VYyoTB998+NUH
 k25KxL4GhP6Xw1W7aPpdbIHaPKt4UT5G/Fbhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681416309; x=1684008309;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sx7M/dCw9kSVzl4hqHZ0qK7wQeSJm9Xfsz/Z8FKSRXg=;
 b=YmOtdEgFJsPv/KoJVqFeRGcIgyXCi/ozeyYPgDMUQXVBTKEipnGhpjtI3C8GPvHcUV
 84XWce2gjTR24tjthyLrT3GngiLEbCAvzRZQTOBJGJohv1v+kuKIFl1NGWZRWHfUwTsA
 kW6EnBPnW/tjCBQvry1VbMAn0yKi+qLddXqxeaJSXSbepUN+3xmkavQH0ATSt/qbOVhh
 +kOg/iPmhftTHML9b1j8RwxCle5WnpAQ5zLzBmrynbzSCppVnSKkIcq5CxelkKYBEB85
 QARMvzooydXHN4/jxKhIMyka6/2yVPTDzscbTuiOfWGZ1TOtVgd0cMB3cVL/4VLzVwGI
 8UIQ==
X-Gm-Message-State: AAQBX9esIK724c4sHEmCCH0hyBfA+wIZT+jBHZDBloLFHpmIHZd2Lw5S
 2bAKWS8ilOL94vaaIdxKga8+9A==
X-Google-Smtp-Source: AKy350YlAqx4IZDCLGGN1h1jo7oaknBfUJNPqqxT2zPBFNDl5ItU7eTUiwSQnKuc123KWeJrppapcQ==
X-Received: by 2002:adf:ffcf:0:b0:2c7:1755:30ad with SMTP id
 x15-20020adfffcf000000b002c7175530admr58159wrs.2.1681416309116; 
 Thu, 13 Apr 2023 13:05:09 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 g2-20020adffc82000000b002cff0e213ddsm1961268wrr.14.2023.04.13.13.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 13:05:08 -0700 (PDT)
Date: Thu, 13 Apr 2023 22:05:06 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v3 6/7] drm: Add fdinfo memory stats
Message-ID: <ZDhgcqiOtJi6//TS@phenom.ffwll.local>
Mail-Followup-To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Christopher Healy <healych@amazon.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad8f2793-c1b3-a505-e93f-6cc52fded86d@linux.intel.com>
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

On Thu, Apr 13, 2023 at 05:40:21PM +0100, Tvrtko Ursulin wrote:
> 
> On 13/04/2023 14:27, Daniel Vetter wrote:
> > On Thu, Apr 13, 2023 at 01:58:34PM +0100, Tvrtko Ursulin wrote:
> > > 
> > > On 12/04/2023 20:18, Daniel Vetter wrote:
> > > > On Wed, Apr 12, 2023 at 11:42:07AM -0700, Rob Clark wrote:
> > > > > On Wed, Apr 12, 2023 at 11:17 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > > 
> > > > > > On Wed, Apr 12, 2023 at 10:59:54AM -0700, Rob Clark wrote:
> > > > > > > On Wed, Apr 12, 2023 at 7:42 AM Tvrtko Ursulin
> > > > > > > <tvrtko.ursulin@linux.intel.com> wrote:
> > > > > > > > 
> > > > > > > > 
> > > > > > > > On 11/04/2023 23:56, Rob Clark wrote:
> > > > > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > > > > > 
> > > > > > > > > Add support to dump GEM stats to fdinfo.
> > > > > > > > > 
> > > > > > > > > v2: Fix typos, change size units to match docs, use div_u64
> > > > > > > > > v3: Do it in core
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > > > > > Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> > > > > > > > > ---
> > > > > > > > >     Documentation/gpu/drm-usage-stats.rst | 21 ++++++++
> > > > > > > > >     drivers/gpu/drm/drm_file.c            | 76 +++++++++++++++++++++++++++
> > > > > > > > >     include/drm/drm_file.h                |  1 +
> > > > > > > > >     include/drm/drm_gem.h                 | 19 +++++++
> > > > > > > > >     4 files changed, 117 insertions(+)
> > > > > > > > > 
> > > > > > > > > diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> > > > > > > > > index b46327356e80..b5e7802532ed 100644
> > > > > > > > > --- a/Documentation/gpu/drm-usage-stats.rst
> > > > > > > > > +++ b/Documentation/gpu/drm-usage-stats.rst
> > > > > > > > > @@ -105,6 +105,27 @@ object belong to this client, in the respective memory region.
> > > > > > > > >     Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
> > > > > > > > >     indicating kibi- or mebi-bytes.
> > > > > > > > > 
> > > > > > > > > +- drm-shared-memory: <uint> [KiB|MiB]
> > > > > > > > > +
> > > > > > > > > +The total size of buffers that are shared with another file (ie. have more
> > > > > > > > > +than a single handle).
> > > > > > > > > +
> > > > > > > > > +- drm-private-memory: <uint> [KiB|MiB]
> > > > > > > > > +
> > > > > > > > > +The total size of buffers that are not shared with another file.
> > > > > > > > > +
> > > > > > > > > +- drm-resident-memory: <uint> [KiB|MiB]
> > > > > > > > > +
> > > > > > > > > +The total size of buffers that are resident in system memory.
> > > > > > > > 
> > > > > > > > I think this naming maybe does not work best with the existing
> > > > > > > > drm-memory-<region> keys.
> > > > > > > 
> > > > > > > Actually, it was very deliberate not to conflict with the existing
> > > > > > > drm-memory-<region> keys ;-)
> > > > > > > 
> > > > > > > I wouldn't have preferred drm-memory-{active,resident,...} but it
> > > > > > > could be mis-parsed by existing userspace so my hands were a bit tied.
> > > > > > > 
> > > > > > > > How about introduce the concept of a memory region from the start and
> > > > > > > > use naming similar like we do for engines?
> > > > > > > > 
> > > > > > > > drm-memory-$CATEGORY-$REGION: ...
> > > > > > > > 
> > > > > > > > Then we document a bunch of categories and their semantics, for instance:
> > > > > > > > 
> > > > > > > > 'size' - All reachable objects
> > > > > > > > 'shared' - Subset of 'size' with handle_count > 1
> > > > > > > > 'resident' - Objects with backing store
> > > > > > > > 'active' - Objects in use, subset of resident
> > > > > > > > 'purgeable' - Or inactive? Subset of resident.
> > > > > > > > 
> > > > > > > > We keep the same semantics as with process memory accounting (if I got
> > > > > > > > it right) which could be desirable for a simplified mental model.
> > > > > > > > 
> > > > > > > > (AMD needs to remind me of their 'drm-memory-...' keys semantics. If we
> > > > > > > > correctly captured this in the first round it should be equivalent to
> > > > > > > > 'resident' above. In any case we can document no category is equal to
> > > > > > > > which category, and at most one of the two must be output.)
> > > > > > > > 
> > > > > > > > Region names we at most partially standardize. Like we could say
> > > > > > > > 'system' is to be used where backing store is system RAM and others are
> > > > > > > > driver defined.
> > > > > > > > 
> > > > > > > > Then discrete GPUs could emit N sets of key-values, one for each memory
> > > > > > > > region they support.
> > > > > > > > 
> > > > > > > > I think this all also works for objects which can be migrated between
> > > > > > > > memory regions. 'Size' accounts them against all regions while for
> > > > > > > > 'resident' they only appear in the region of their current placement, etc.
> > > > > > > 
> > > > > > > I'm not too sure how to rectify different memory regions with this,
> > > > > > > since drm core doesn't really know about the driver's memory regions.
> > > > > > > Perhaps we can go back to this being a helper and drivers with vram
> > > > > > > just don't use the helper?  Or??
> > > > > > 
> > > > > > I think if you flip it around to drm-$CATEGORY-memory{-$REGION}: then it
> > > > > > all works out reasonably consistently?
> > > > > 
> > > > > That is basically what we have now.  I could append -system to each to
> > > > > make things easier to add vram/etc (from a uabi standpoint)..
> > > > 
> > > > What you have isn't really -system, but everything. So doesn't really make
> > > > sense to me to mark this -system, it's only really true for integrated (if
> > > > they don't have stolen or something like that).
> > > > 
> > > > Also my comment was more in reply to Tvrtko's suggestion.
> > > 
> > > Right so my proposal was drm-memory-$CATEGORY-$REGION which I think aligns
> > > with the current drm-memory-$REGION by extending, rather than creating
> > > confusion with different order of key name components.
> > 
> > Oh my comment was pretty much just bikeshed, in case someone creates a
> > $REGION that other drivers use for $CATEGORY. Kinda Rob's parsing point.
> > So $CATEGORY before the -memory.
> > 
> > Otoh I don't think that'll happen, so I guess we can go with whatever more
> > folks like :-) I don't really care much personally.
> 
> Okay I missed the parsing problem.
> 
> > > AMD currently has (among others) drm-memory-vram, which we could define in
> > > the spec maps to category X, if category component is not present.
> > > 
> > > Some examples:
> > > 
> > > drm-memory-resident-system:
> > > drm-memory-size-lmem0:
> > > drm-memory-active-vram:
> > > 
> > > Etc.. I think it creates a consistent story.
> > > 
> > > Other than this, my two I think significant opens which haven't been
> > > addressed yet are:
> > > 
> > > 1)
> > > 
> > > Why do we want totals (not per region) when userspace can trivially
> > > aggregate if they want. What is the use case?
> > > 
> > > 2)
> > > 
> > > Current proposal limits the value to whole objects and fixates that by
> > > having it in the common code. If/when some driver is able to support sub-BO
> > > granularity they will need to opt out of the common printer at which point
> > > it may be less churn to start with a helper rather than mid-layer. Or maybe
> > > some drivers already support this, I don't know. Given how important VM BIND
> > > is I wouldn't be surprised.
> > 
> > I feel like for drivers using ttm we want a ttm helper which takes care of
> > the region printing in hopefully a standard way. And that could then also
> > take care of all kinds of of partial binding and funny rules (like maybe
> > we want a standard vram region that addds up all the lmem regions on
> > intel, so that all dgpu have a common vram bucket that generic tools
> > understand?).
> 
> First part yes, but for the second I would think we want to avoid any
> aggregation in the kernel which can be done in userspace just as well. Such
> total vram bucket would be pretty useless on Intel even since userspace
> needs to be region aware to make use of all resources. It could even be
> counter productive I think - "why am I getting out of memory when half of my
> vram is unused!?".

This is not for intel-aware userspace. This is for fairly generic "gputop"
style userspace, which might simply have no clue or interest in what lmemX
means, but would understand vram.

Aggregating makes sense.

> > It does mean we walk the bo list twice, but *shrug*. People have been
> > complaining about procutils for decades, they're still horrible, I think
> > walking bo lists twice internally in the ttm case is going to be ok. If
> > not, it's internals, we can change them again.
> > 
> > Also I'd lean a lot more towards making ttm a helper and not putting that
> > into core, exactly because it's pretty clear we'll need more flexibility
> > when it comes to accurate stats for multi-region drivers.
> 
> Exactly.
> 
> > But for a first "how much gpu space does this app use" across everything I
> > think this is a good enough starting point.
> 
> Okay so we agree this would be better as a helper and not in the core.

Nope, if you mean with this = Rob's patch. I was talking about a
hypothetical region-aware extension for ttm-using drivers.

> On the point are keys/semantics good enough as a starting point I am still
> not convinced kernel should aggregate and that instead we should start from
> day one by appending -system (or something) to Rob's proposed keys.

It should imo. Inflicting driver knowledge on generic userspace makes not
much sense, we should start with the more generally useful stuff imo.
That's why there's the drm fdinfo spec and all that so it's not a
free-for-all.

Also Rob's stuff is _not_ system. Check on a i915 dgpu if you want :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
