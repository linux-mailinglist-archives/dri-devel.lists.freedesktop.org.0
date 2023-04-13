Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 749A36E0E93
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 15:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B822A10EAF9;
	Thu, 13 Apr 2023 13:27:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BFE010EAF4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 13:27:38 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f04eb5d1a7so7040155e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 06:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681392454; x=1683984454;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=i+E9NsuYGFtDze59BVKJOEvHYy/5++4XsWsMmoJ6GJI=;
 b=W5OAvjDzLiQ6drDXOw0z1t03f+0qmDOVB6QlkoKfFslqD21QY//WUH7m3pcNno3sKb
 OT2lFiVvN1m4pw2NMz6QM6Qbem9ra2hll9sAP0yP2dmU1J07kJ86YTTfkSHep4goeFgO
 caC5P7p9ZM4yAp2gA3Iw3VO3hr9ul4utmMy98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681392454; x=1683984454;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i+E9NsuYGFtDze59BVKJOEvHYy/5++4XsWsMmoJ6GJI=;
 b=a+PxjHLfp6Ap0D7RwRR0T0RauUWRuqPRTpFhnJyjR7diThgcbHPLTSIuRzmYJ9qL5b
 NGQY0+HhZEt17TWweFV56ircYaALvYFLj3nZeLYSIIscdb6dqos3Zvm6sACB4uLN7Vcx
 3eWxLtjggbW+3yjNrpZaiLPtWQgnpPhIXxjHHtckM2PmAECPFWMCpncrKEoiVYrqp84r
 vzestfc7tfSXZmaYv3kxy7jSthMmt3x/ljEkAzaII6bMwCIRZGT/dSgdaJGFBhwnhHCi
 FtfvzrnKuddEgX1DiRJMGGL8F2b4um8ZQfLDTrNLkjppPfRgv8uQcKp7O9Wk9i1VeTwY
 yqLA==
X-Gm-Message-State: AAQBX9cboG3mHMUulK/n6AUzYYfQr8SyuqQEydTpofFp8Xz3FH6lWLPd
 pv91LO+YvE7Ov262tHKr8Ot6Mw==
X-Google-Smtp-Source: AKy350ZXwkokURnf5v8+OhRVl+Qois7VYoneoAYjrSJkyFEWB0p5NQXCGKcFaXrawfI/+61JQeoBwg==
X-Received: by 2002:a05:600c:1c99:b0:3f0:9df8:81e1 with SMTP id
 k25-20020a05600c1c9900b003f09df881e1mr2004496wms.2.1681392454021; 
 Thu, 13 Apr 2023 06:27:34 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c1d0700b003ee443bf0c7sm5498788wms.16.2023.04.13.06.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 06:27:33 -0700 (PDT)
Date: Thu, 13 Apr 2023 15:27:31 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v3 6/7] drm: Add fdinfo memory stats
Message-ID: <ZDgDQ1PqtXwu8zqA@phenom.ffwll.local>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c82fd8fa-9f4b-f62f-83be-25853f9ecf5e@linux.intel.com>
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

On Thu, Apr 13, 2023 at 01:58:34PM +0100, Tvrtko Ursulin wrote:
> 
> On 12/04/2023 20:18, Daniel Vetter wrote:
> > On Wed, Apr 12, 2023 at 11:42:07AM -0700, Rob Clark wrote:
> > > On Wed, Apr 12, 2023 at 11:17 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > 
> > > > On Wed, Apr 12, 2023 at 10:59:54AM -0700, Rob Clark wrote:
> > > > > On Wed, Apr 12, 2023 at 7:42 AM Tvrtko Ursulin
> > > > > <tvrtko.ursulin@linux.intel.com> wrote:
> > > > > > 
> > > > > > 
> > > > > > On 11/04/2023 23:56, Rob Clark wrote:
> > > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > > > 
> > > > > > > Add support to dump GEM stats to fdinfo.
> > > > > > > 
> > > > > > > v2: Fix typos, change size units to match docs, use div_u64
> > > > > > > v3: Do it in core
> > > > > > > 
> > > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > > > Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> > > > > > > ---
> > > > > > >    Documentation/gpu/drm-usage-stats.rst | 21 ++++++++
> > > > > > >    drivers/gpu/drm/drm_file.c            | 76 +++++++++++++++++++++++++++
> > > > > > >    include/drm/drm_file.h                |  1 +
> > > > > > >    include/drm/drm_gem.h                 | 19 +++++++
> > > > > > >    4 files changed, 117 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> > > > > > > index b46327356e80..b5e7802532ed 100644
> > > > > > > --- a/Documentation/gpu/drm-usage-stats.rst
> > > > > > > +++ b/Documentation/gpu/drm-usage-stats.rst
> > > > > > > @@ -105,6 +105,27 @@ object belong to this client, in the respective memory region.
> > > > > > >    Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
> > > > > > >    indicating kibi- or mebi-bytes.
> > > > > > > 
> > > > > > > +- drm-shared-memory: <uint> [KiB|MiB]
> > > > > > > +
> > > > > > > +The total size of buffers that are shared with another file (ie. have more
> > > > > > > +than a single handle).
> > > > > > > +
> > > > > > > +- drm-private-memory: <uint> [KiB|MiB]
> > > > > > > +
> > > > > > > +The total size of buffers that are not shared with another file.
> > > > > > > +
> > > > > > > +- drm-resident-memory: <uint> [KiB|MiB]
> > > > > > > +
> > > > > > > +The total size of buffers that are resident in system memory.
> > > > > > 
> > > > > > I think this naming maybe does not work best with the existing
> > > > > > drm-memory-<region> keys.
> > > > > 
> > > > > Actually, it was very deliberate not to conflict with the existing
> > > > > drm-memory-<region> keys ;-)
> > > > > 
> > > > > I wouldn't have preferred drm-memory-{active,resident,...} but it
> > > > > could be mis-parsed by existing userspace so my hands were a bit tied.
> > > > > 
> > > > > > How about introduce the concept of a memory region from the start and
> > > > > > use naming similar like we do for engines?
> > > > > > 
> > > > > > drm-memory-$CATEGORY-$REGION: ...
> > > > > > 
> > > > > > Then we document a bunch of categories and their semantics, for instance:
> > > > > > 
> > > > > > 'size' - All reachable objects
> > > > > > 'shared' - Subset of 'size' with handle_count > 1
> > > > > > 'resident' - Objects with backing store
> > > > > > 'active' - Objects in use, subset of resident
> > > > > > 'purgeable' - Or inactive? Subset of resident.
> > > > > > 
> > > > > > We keep the same semantics as with process memory accounting (if I got
> > > > > > it right) which could be desirable for a simplified mental model.
> > > > > > 
> > > > > > (AMD needs to remind me of their 'drm-memory-...' keys semantics. If we
> > > > > > correctly captured this in the first round it should be equivalent to
> > > > > > 'resident' above. In any case we can document no category is equal to
> > > > > > which category, and at most one of the two must be output.)
> > > > > > 
> > > > > > Region names we at most partially standardize. Like we could say
> > > > > > 'system' is to be used where backing store is system RAM and others are
> > > > > > driver defined.
> > > > > > 
> > > > > > Then discrete GPUs could emit N sets of key-values, one for each memory
> > > > > > region they support.
> > > > > > 
> > > > > > I think this all also works for objects which can be migrated between
> > > > > > memory regions. 'Size' accounts them against all regions while for
> > > > > > 'resident' they only appear in the region of their current placement, etc.
> > > > > 
> > > > > I'm not too sure how to rectify different memory regions with this,
> > > > > since drm core doesn't really know about the driver's memory regions.
> > > > > Perhaps we can go back to this being a helper and drivers with vram
> > > > > just don't use the helper?  Or??
> > > > 
> > > > I think if you flip it around to drm-$CATEGORY-memory{-$REGION}: then it
> > > > all works out reasonably consistently?
> > > 
> > > That is basically what we have now.  I could append -system to each to
> > > make things easier to add vram/etc (from a uabi standpoint)..
> > 
> > What you have isn't really -system, but everything. So doesn't really make
> > sense to me to mark this -system, it's only really true for integrated (if
> > they don't have stolen or something like that).
> > 
> > Also my comment was more in reply to Tvrtko's suggestion.
> 
> Right so my proposal was drm-memory-$CATEGORY-$REGION which I think aligns
> with the current drm-memory-$REGION by extending, rather than creating
> confusion with different order of key name components.

Oh my comment was pretty much just bikeshed, in case someone creates a
$REGION that other drivers use for $CATEGORY. Kinda Rob's parsing point.
So $CATEGORY before the -memory.

Otoh I don't think that'll happen, so I guess we can go with whatever more
folks like :-) I don't really care much personally.

> AMD currently has (among others) drm-memory-vram, which we could define in
> the spec maps to category X, if category component is not present.
> 
> Some examples:
> 
> drm-memory-resident-system:
> drm-memory-size-lmem0:
> drm-memory-active-vram:
> 
> Etc.. I think it creates a consistent story.
> 
> Other than this, my two I think significant opens which haven't been
> addressed yet are:
> 
> 1)
> 
> Why do we want totals (not per region) when userspace can trivially
> aggregate if they want. What is the use case?
> 
> 2)
> 
> Current proposal limits the value to whole objects and fixates that by
> having it in the common code. If/when some driver is able to support sub-BO
> granularity they will need to opt out of the common printer at which point
> it may be less churn to start with a helper rather than mid-layer. Or maybe
> some drivers already support this, I don't know. Given how important VM BIND
> is I wouldn't be surprised.

I feel like for drivers using ttm we want a ttm helper which takes care of
the region printing in hopefully a standard way. And that could then also
take care of all kinds of of partial binding and funny rules (like maybe
we want a standard vram region that addds up all the lmem regions on
intel, so that all dgpu have a common vram bucket that generic tools
understand?).

It does mean we walk the bo list twice, but *shrug*. People have been
complaining about procutils for decades, they're still horrible, I think
walking bo lists twice internally in the ttm case is going to be ok. If
not, it's internals, we can change them again.

Also I'd lean a lot more towards making ttm a helper and not putting that
into core, exactly because it's pretty clear we'll need more flexibility
when it comes to accurate stats for multi-region drivers.

But for a first "how much gpu space does this app use" across everything I
think this is a good enough starting point.
-Daniel

> 
> Regards,
> 
> Tvrtko
> 
> > > > And ttm could/should perhaps provide a helper to dump the region specific
> > > > version of this. Or we lift the concept of regions out of ttm a bit
> > > > higher, that's kinda needed for cgroups eventually anyway I think.
> > > > -Daniel
> > > > 
> > > > > 
> > > > > BR,
> > > > > -R
> > > > > 
> > > > > > Userspace can aggregate if it wishes to do so but kernel side should not.
> > > > > > 
> > > > > > > +
> > > > > > > +- drm-purgeable-memory: <uint> [KiB|MiB]
> > > > > > > +
> > > > > > > +The total size of buffers that are purgeable.
> > > > > > > +
> > > > > > > +- drm-active-memory: <uint> [KiB|MiB]
> > > > > > > +
> > > > > > > +The total size of buffers that are active on one or more rings.
> > > > > > > +
> > > > > > >    - drm-cycles-<str> <uint>
> > > > > > > 
> > > > > > >    Engine identifier string must be the same as the one specified in the
> > > > > > > diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> > > > > > > index 37dfaa6be560..46fdd843bb3a 100644
> > > > > > > --- a/drivers/gpu/drm/drm_file.c
> > > > > > > +++ b/drivers/gpu/drm/drm_file.c
> > > > > > > @@ -42,6 +42,7 @@
> > > > > > >    #include <drm/drm_client.h>
> > > > > > >    #include <drm/drm_drv.h>
> > > > > > >    #include <drm/drm_file.h>
> > > > > > > +#include <drm/drm_gem.h>
> > > > > > >    #include <drm/drm_print.h>
> > > > > > > 
> > > > > > >    #include "drm_crtc_internal.h"
> > > > > > > @@ -871,6 +872,79 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
> > > > > > >    }
> > > > > > >    EXPORT_SYMBOL(drm_send_event);
> > > > > > > 
> > > > > > > +static void print_size(struct drm_printer *p, const char *stat, size_t sz)
> > > > > > > +{
> > > > > > > +     const char *units[] = {"", " KiB", " MiB"};
> > > > > > > +     unsigned u;
> > > > > > > +
> > > > > > > +     for (u = 0; u < ARRAY_SIZE(units) - 1; u++) {
> > > > > > > +             if (sz < SZ_1K)
> > > > > > > +                     break;
> > > > > > > +             sz = div_u64(sz, SZ_1K);
> > > > > > > +     }
> > > > > > > +
> > > > > > > +     drm_printf(p, "%s:\t%zu%s\n", stat, sz, units[u]);
> > > > > > > +}
> > > > > > > +
> > > > > > > +static void print_memory_stats(struct drm_printer *p, struct drm_file *file)
> > > > > > > +{
> > > > > > > +     struct drm_gem_object *obj;
> > > > > > > +     struct {
> > > > > > > +             size_t shared;
> > > > > > > +             size_t private;
> > > > > > > +             size_t resident;
> > > > > > > +             size_t purgeable;
> > > > > > > +             size_t active;
> > > > > > > +     } size = {0};
> > > > > > > +     bool has_status = false;
> > > > > > > +     int id;
> > > > > > > +
> > > > > > > +     spin_lock(&file->table_lock);
> > > > > > > +     idr_for_each_entry (&file->object_idr, obj, id) {
> > > > > > > +             enum drm_gem_object_status s = 0;
> > > > > > > +
> > > > > > > +             if (obj->funcs && obj->funcs->status) {
> > > > > > > +                     s = obj->funcs->status(obj);
> > > > > > > +                     has_status = true;
> > > > > > > +             }
> > > > > > > +
> > > > > > > +             if (obj->handle_count > 1) {
> > > > > > > +                     size.shared += obj->size;
> > > > > > > +             } else {
> > > > > > > +                     size.private += obj->size;
> > > > > > > +             }
> > > > > > > +
> > > > > > > +             if (s & DRM_GEM_OBJECT_RESIDENT) {
> > > > > > > +                     size.resident += obj->size;
> > > > > > > +             } else {
> > > > > > > +                     /* If already purged or not yet backed by pages, don't
> > > > > > > +                      * count it as purgeable:
> > > > > > > +                      */
> > > > > > > +                     s &= ~DRM_GEM_OBJECT_PURGEABLE;
> > > > > > 
> > > > > > Side question - why couldn't resident buffers be purgeable? Did you mean
> > > > > > for the if branch check to be active here? But then it wouldn't make
> > > > > > sense for a driver to report active _and_ purgeable..
> > > > > > 
> > > > > > > +             }
> > > > > > > +
> > > > > > > +             if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true))) {
> > > > > > > +                     size.active += obj->size;
> > > > > > > +
> > > > > > > +                     /* If still active, don't count as purgeable: */
> > > > > > > +                     s &= ~DRM_GEM_OBJECT_PURGEABLE;
> > > > > > 
> > > > > > Another side question - I guess this tidies a race in reporting? If so
> > > > > > not sure it matters given the stats are all rather approximate.
> > > > > > 
> > > > > > > +             }
> > > > > > > +
> > > > > > > +             if (s & DRM_GEM_OBJECT_PURGEABLE)
> > > > > > > +                     size.purgeable += obj->size;
> > > > > > > +     }
> > > > > > 
> > > > > > One concern I have here is that it is all based on obj->size. That is,
> > > > > > there is no provision for drivers to implement page level granularity.
> > > > > > So correct reporting in use cases such as VM BIND in the future wouldn't
> > > > > > work unless it was a driver hook to get almost all of the info above. At
> > > > > > which point common code is just a loop. TBF I don't know if any drivers
> > > > > > do sub obj->size backing store granularity today, but I think it is
> > > > > > sometimes to be sure of before proceeding.
> > > > > > 
> > > > > > Second concern is what I touched upon in the first reply block - if the
> > > > > > common code blindly loops over all objects then on discrete GPUs it
> > > > > > seems we get an 'aggregate' value here which is not what I think we
> > > > > > want. We rather want to have the ability for drivers to list stats per
> > > > > > individual memory region.
> > > > > > 
> > > > > > > +     spin_unlock(&file->table_lock);
> > > > > > > +
> > > > > > > +     print_size(p, "drm-shared-memory", size.shared);
> > > > > > > +     print_size(p, "drm-private-memory", size.private);
> > > > > > > +     print_size(p, "drm-active-memory", size.active);
> > > > > > > +
> > > > > > > +     if (has_status) {
> > > > > > > +             print_size(p, "drm-resident-memory", size.resident);
> > > > > > > +             print_size(p, "drm-purgeable-memory", size.purgeable);
> > > > > > > +     }
> > > > > > > +}
> > > > > > > +
> > > > > > >    /**
> > > > > > >     * drm_fop_show_fdinfo - helper for drm file fops
> > > > > > >     * @seq_file: output stream
> > > > > > > @@ -904,6 +978,8 @@ void drm_fop_show_fdinfo(struct seq_file *m, struct file *f)
> > > > > > > 
> > > > > > >        if (dev->driver->show_fdinfo)
> > > > > > >                dev->driver->show_fdinfo(&p, file);
> > > > > > > +
> > > > > > > +     print_memory_stats(&p, file);
> > > > > > >    }
> > > > > > >    EXPORT_SYMBOL(drm_fop_show_fdinfo);
> > > > > > > 
> > > > > > > diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> > > > > > > index dfa995b787e1..e5b40084538f 100644
> > > > > > > --- a/include/drm/drm_file.h
> > > > > > > +++ b/include/drm/drm_file.h
> > > > > > > @@ -41,6 +41,7 @@
> > > > > > >    struct dma_fence;
> > > > > > >    struct drm_file;
> > > > > > >    struct drm_device;
> > > > > > > +struct drm_printer;
> > > > > > >    struct device;
> > > > > > >    struct file;
> > > > > > > 
> > > > > > > diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> > > > > > > index 189fd618ca65..213917bb6b11 100644
> > > > > > > --- a/include/drm/drm_gem.h
> > > > > > > +++ b/include/drm/drm_gem.h
> > > > > > > @@ -42,6 +42,14 @@
> > > > > > >    struct iosys_map;
> > > > > > >    struct drm_gem_object;
> > > > > > > 
> > > > > > > +/**
> > > > > > > + * enum drm_gem_object_status - bitmask of object state for fdinfo reporting
> > > > > > > + */
> > > > > > > +enum drm_gem_object_status {
> > > > > > > +     DRM_GEM_OBJECT_RESIDENT  = BIT(0),
> > > > > > > +     DRM_GEM_OBJECT_PURGEABLE = BIT(1),
> > > > > > > +};
> > > > > > > +
> > > > > > >    /**
> > > > > > >     * struct drm_gem_object_funcs - GEM object functions
> > > > > > >     */
> > > > > > > @@ -174,6 +182,17 @@ struct drm_gem_object_funcs {
> > > > > > >         */
> > > > > > >        int (*evict)(struct drm_gem_object *obj);
> > > > > > > 
> > > > > > > +     /**
> > > > > > > +      * @status:
> > > > > > > +      *
> > > > > > > +      * The optional status callback can return additional object state
> > > > > > > +      * which determines which stats the object is counted against.  The
> > > > > > > +      * callback is called under table_lock.  Racing against object status
> > > > > > > +      * change is "harmless", and the callback can expect to not race
> > > > > > > +      * against object destruction.
> > > > > > > +      */
> > > > > > > +     enum drm_gem_object_status (*status)(struct drm_gem_object *obj);
> > > > > > 
> > > > > > Does this needs to be in object funcs and couldn't be consolidated to
> > > > > > driver level?
> > > > > > 
> > > > > > Regards,
> > > > > > 
> > > > > > Tvrtko
> > > > > > 
> > > > > > > +
> > > > > > >        /**
> > > > > > >         * @vm_ops:
> > > > > > >         *
> > > > 
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
