Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0439781247
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 19:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916B210E0CB;
	Fri, 18 Aug 2023 17:45:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0476510E0B8;
 Fri, 18 Aug 2023 17:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692380751; x=1723916751;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=WghOXtzdwIhDmkdC6LRTnHtn+2CdCi7A4J5OtK3bd80=;
 b=TJ2uspdylP4G2gX5E/N3Mt3YZzFzaSCXUAhoK3dxRL1Xy/TFQp1pRSeP
 jxnsDyJ9htWCHKjdJDv7TfBJAkoyVXKuYAoGQKsPQosVG1sfjJbhVqzHt
 JAB41xoaPfIqLeWB6phuY8AfnE3y3uvl/1G2uz8bVivAcdhMWCEJvdcuK
 4+ZClGqfXbyYJs3xkOdQkq4+YvH7wQnHR/gFI1Wts2AsmfeuYQ4FUbThU
 NCQOCX1zFruN0Av3AV9qzw1k9IS0VlRotpOsaSD8gYeKBJ7WqkEOjaXQU
 rDSZfjh2U4ECplOjfiSXQEGXmePnDjS+zLj6oe887qeACvymtRsYCVenJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="372060672"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="372060672"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 10:45:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="684962593"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="684962593"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 10:45:46 -0700
Date: Fri, 18 Aug 2023 20:46:00 +0300
From: Imre Deak <imre.deak@intel.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>
Subject: Re: [PATCH 3/3] drm/mst: adjust the function
 drm_dp_remove_payload_part2()
Message-ID: <ZN+uWC1fDKZUmDdL@ideak-desk.fi.intel.com>
References: <20230804062029.5686-1-Wayne.Lin@amd.com>
 <20230804062029.5686-4-Wayne.Lin@amd.com>
 <ZM0Z3sZEYMcMTnuP@ideak-desk.fi.intel.com>
 <CO6PR12MB5489306FA44F5F107180E57DFC0CA@CO6PR12MB5489.namprd12.prod.outlook.com>
 <ZNEU8j6OR3KirIcS@ideak-desk.fi.intel.com>
 <CO6PR12MB548978FEE8BE8300F43D4486FC0DA@CO6PR12MB5489.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO6PR12MB548978FEE8BE8300F43D4486FC0DA@CO6PR12MB5489.namprd12.prod.outlook.com>
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
Reply-To: imre.deak@intel.com
Cc: "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zuo,
 Jerry" <Jerry.Zuo@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 08, 2023 at 03:47:47AM +0000, Lin, Wayne wrote:
> [AMD Official Use Only - General]
> 
> > -----Original Message-----
> > From: Imre Deak <imre.deak@intel.com>
> > Sent: Tuesday, August 8, 2023 12:00 AM
> > To: Lin, Wayne <Wayne.Lin@amd.com>
> > Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org;
> > lyude@redhat.com; jani.nikula@intel.com; ville.syrjala@linux.intel.com;
> > Wentland, Harry <Harry.Wentland@amd.com>; Zuo, Jerry
> > <Jerry.Zuo@amd.com>
> > Subject: Re: [PATCH 3/3] drm/mst: adjust the function
> > drm_dp_remove_payload_part2()
> >
> > On Mon, Aug 07, 2023 at 02:43:02AM +0000, Lin, Wayne wrote:
> > > [AMD Official Use Only - General]
> > >
> > > > -----Original Message-----
> > > > From: Imre Deak <imre.deak@intel.com>
> > > > Sent: Friday, August 4, 2023 11:32 PM
> > > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > > Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org;
> > > > lyude@redhat.com; jani.nikula@intel.com;
> > > > ville.syrjala@linux.intel.com; Wentland, Harry
> > > > <Harry.Wentland@amd.com>; Zuo, Jerry <Jerry.Zuo@amd.com>
> > > > Subject: Re: [PATCH 3/3] drm/mst: adjust the function
> > > > drm_dp_remove_payload_part2()
> > > >
> > > > On Fri, Aug 04, 2023 at 02:20:29PM +0800, Wayne Lin wrote:
> > > > > [...]
> > > > > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > index e04f87ff755a..4270178f95f6 100644
> > > > > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > @@ -3382,8 +3382,7 @@
> > > > EXPORT_SYMBOL(drm_dp_remove_payload_part1);
> > > > >   * drm_dp_remove_payload_part2() - Remove an MST payload locally
> > > > >   * @mgr: Manager to use.
> > > > >   * @mst_state: The MST atomic state
> > > > > - * @old_payload: The payload with its old state
> > > > > - * @new_payload: The payload with its latest state
> > > > > + * @payload: The payload with its latest state
> > > > >   *
> > > > >   * Updates the starting time slots of all other payloads which
> > > > > would have
> > > > been shifted towards
> > > > >   * the start of the payload ID table as a result of removing a
> > > > > payload. Driver should call this @@ -3392,25 +3391,36 @@
> > > > EXPORT_SYMBOL(drm_dp_remove_payload_part1);
> > > > >   */
> > > > >  void drm_dp_remove_payload_part2(struct
> > drm_dp_mst_topology_mgr
> > > > *mgr,
> > > > >                              struct drm_dp_mst_topology_state
> > > > *mst_state,
> > > > > -                            const struct drm_dp_mst_atomic_payload
> > > > *old_payload,
> > > > > -                            struct drm_dp_mst_atomic_payload
> > > > *new_payload)
> > > > > +                            struct drm_dp_mst_atomic_payload
> > > > *payload)
> > > > >  {
> > > > >     struct drm_dp_mst_atomic_payload *pos;
> > > > > +   u8 time_slots_to_remove;
> > > > > +   u8 next_payload_vc_start = mgr->next_start_slot;
> > > > > +
> > > > > +   /* Find the current allocated time slot number of the payload */
> > > > > +   list_for_each_entry(pos, &mst_state->payloads, next) {
> > > > > +           if (pos != payload &&
> > > > > +               pos->vc_start_slot > payload->vc_start_slot &&
> > > > > +               pos->vc_start_slot < next_payload_vc_start)
> > > > > +                   next_payload_vc_start = pos->vc_start_slot;
> > > > > +   }
> > > > > +
> > > > > +   time_slots_to_remove = next_payload_vc_start -
> > > > > +payload->vc_start_slot;
> > > >
> > > > Imo, the intuitive way would be to pass the old payload state to
> > > > this function - which already contains the required time_slots param
> > > > - and refactor things instead moving vc_start_slot from the payload
> > > > state to mgr suggested by Ville earlier.
> > > >
> > > > --Imre
> > >
> > > Hi Imre,
> > > Thanks for your feedback!
> > >
> > > I understand it's functionally correct. But IMHO, it's still a bit
> > > conceptually different between the time slot in old state and the time
> > > slot in current payload table. My thought is the time slot at the
> > > moment when we are removing the payload would be a better choice.
> >
> > Yes, they are different. The old state contains the time slot the payload was
> > added with in a preceding commit and so the time slot value which should be
> > used when removing the same payload in the current commit.
> >
> > The new state contains a time slot value with which the payload will be added
> > in the current commit and can be different than the one in the old state if the
> > current commit has changed the payload size (meaning that the same atomic
> > commit will first remove the payload using the time slot value in the old state
> > and afterwards will add back the same payload using the time slot value in the
> > new state).
> >
> Appreciate your time, Imre!
> 
> Yes I understand, so I'm not using the number of the time slot in the new state.
> I'm referring to the start slot instead which is updated during every allocation
> and removement at current commit.
> 
> Like what you said, current commit manipulation could be a mix of allocations
> and removements for the payload. My thought is, conceptually, looking up the
> latest number of time slot is a better choice rather than the one in old state.
> It's relatively intuitive to me since we are removing payload from current
> payload table and which changes since last preceding commit till the moment
> we're deleting the payload. Although it's unreasonable that these values are
> different.
> 
> > > And with this, we can also simplify some codes. Especially remove
> > > workaround in amd driver. In fact, DRM mst code maintains the payload
> > > table and all the time slot info is in it already. We don't really
> > > have to pass a new parameter.
> >
> > I agree that drm_dp_remove_payload() could be simplified, but this should be
> > done so that the drivers can pass the old payload state to it (without having to
> > pass the new state). This would be possible if vc_start_slot was not tracked in
> > the payload state (which is really not an atomic state that can be precomputed
> > as all other atomic state), rather it would be tracked in struct
> > drm_dp_mst_topology_mgr.
> >
> 
> So the reason I chose to pass the new state is like what I mentioned above. I
> would prefer to carry the latest updated payload table instead which is in the new
> state. And I agree with the explanation for the vc_start_slot and that's also my
> thought at the beginning. It could be a refactor later, but no matter the start slot
> is put into payload state or the topology manager I would prefer to refer to the
> latest payload table rather than the number of time slot in the old state.
> 
> > It looks like AMD has to reconstruct the old state in
> > dm_helpers_construct_old_payload(). Could you explain why it couldn't
> > instead just pass old_payload acquired by
> >
> > old_mst_state = drm_atomic_get_old_mst_topology_state();
> > old_payload = drm_atomic_get_mst_payload_state(old_mst_state);
> >
> > ?
> 
> AMD doesn't pass the drm old state to the stage while HW is deleting
> the payload.  The reason is that HW payload table is known during HW
> programming procedure, so the payload removement is based on the table
> at the moment.
>
> AMD expected the current number of time slot is also
> already maintained in drm layer.

Yes, both of the above are maintained by the drm layer, but it also
means it doesn't really need to recalculate time_slots_to_remove as done
in this patch, since that info is already available in the old payload
state.

Afaics the AMD driver calls properly 

drm_atomic_helper_commit() -> drm_atomic_helper_swap_state()

after a commit, so that all the payloads it added should be tracked
now as the old payload state.

So could you confirm what is the old_payload->time_slots value (which
you get with the above functions) at the point of removing this payload
and if it's not the time_slots value this same payload was actually
added with previously, why this is so (via some example sequence)?

Thanks.

> Again, thanks for your feedback Imre!
> 
> >
> > > > >     /* Remove local payload allocation */
> > > > >     list_for_each_entry(pos, &mst_state->payloads, next) {
> > > > > -           if (pos != new_payload && pos->vc_start_slot > new_payload-
> > > > >vc_start_slot)
> > > > > -                   pos->vc_start_slot -= old_payload->time_slots;
> > > > > +           if (pos != payload && pos->vc_start_slot > payload-
> > > > >vc_start_slot)
> > > > > +                   pos->vc_start_slot -= time_slots_to_remove;
> > > > >     }
> > > > > -   new_payload->vc_start_slot = -1;
> > > > > +   payload->vc_start_slot = -1;
> > > > >
> > > > >     mgr->payload_count--;
> > > > > -   mgr->next_start_slot -= old_payload->time_slots;
> > > > > +   mgr->next_start_slot -= time_slots_to_remove;
> > > > >
> > > > > -   if (new_payload->delete)
> > > > > -           drm_dp_mst_put_port_malloc(new_payload->port);
> > > > > +   if (payload->delete)
> > > > > +           drm_dp_mst_put_port_malloc(payload->port);
> > > > >
> > > > > -   new_payload->payload_allocation_status =
> > > > DRM_DP_MST_PAYLOAD_ALLOCATION_NONE;
> > > > > +   payload->payload_allocation_status =
> > > > > +DRM_DP_MST_PAYLOAD_ALLOCATION_NONE;
> > > > >  }
> > >
> > > --
> > > Regards,
> > > Wayne
> 
> --
> Regards,
> Wayne
