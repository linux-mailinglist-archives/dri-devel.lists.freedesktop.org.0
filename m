Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8359C788916
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 15:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11A7710E69A;
	Fri, 25 Aug 2023 13:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF8F510E69A;
 Fri, 25 Aug 2023 13:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692971733; x=1724507733;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=B/MVCtUzVUVkQwUauEcEPMmRFg3PLeNwAyGmuLCQQdA=;
 b=Y6uGh1HCmU3SLxEcSBRxF2L7nyV/72a0bXXNKc5LYoBAqvAZmbntQ7rA
 baIhklZatEfteBazEPsD6++aR8U1WdK/Y0ouODFP/1Huo6V0fD56IQK13
 Twe5oyDqxoRD0zsm6Nmjght/fUTR8z316Zb5IslPW+hymB+YEMR9fv6dW
 +Gzagir+8dVLWrscjZK0P4glz3Q5pMND8HQrS784LXLBLqxEAOgptTtjS
 aj9CX1pYEWT1a62KWuhqvewN6WxD1OLrFLKXppfpriFQAEZ5jnrTmle6C
 KsDN+GYvjQiIDrJmlHzol+cWh1j/Ydkpmnog1Q4cCXZLqCNYahdscUn6T w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="364911086"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="364911086"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 06:55:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="737488353"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="737488353"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 06:55:30 -0700
Date: Fri, 25 Aug 2023 16:55:46 +0300
From: Imre Deak <imre.deak@intel.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>
Subject: Re: [PATCH 3/3] drm/mst: adjust the function
 drm_dp_remove_payload_part2()
Message-ID: <ZOiywboCeFxJwCCP@ideak-desk.fi.intel.com>
References: <20230804062029.5686-1-Wayne.Lin@amd.com>
 <20230804062029.5686-4-Wayne.Lin@amd.com>
 <ZM0Z3sZEYMcMTnuP@ideak-desk.fi.intel.com>
 <CO6PR12MB5489306FA44F5F107180E57DFC0CA@CO6PR12MB5489.namprd12.prod.outlook.com>
 <ZNEU8j6OR3KirIcS@ideak-desk.fi.intel.com>
 <CO6PR12MB548978FEE8BE8300F43D4486FC0DA@CO6PR12MB5489.namprd12.prod.outlook.com>
 <ZN+uWC1fDKZUmDdL@ideak-desk.fi.intel.com>
 <CO6PR12MB5489E92E7A29CA7285602B20FC1CA@CO6PR12MB5489.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO6PR12MB5489E92E7A29CA7285602B20FC1CA@CO6PR12MB5489.namprd12.prod.outlook.com>
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

On Wed, Aug 23, 2023 at 03:16:44AM +0000, Lin, Wayne wrote:
> [AMD Official Use Only - General]
> 
> > -----Original Message-----
> > From: Imre Deak <imre.deak@intel.com>
> > Sent: Saturday, August 19, 2023 1:46 AM
> > To: Lin, Wayne <Wayne.Lin@amd.com>
> > Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org;
> > lyude@redhat.com; jani.nikula@intel.com; ville.syrjala@linux.intel.com;
> > Wentland, Harry <Harry.Wentland@amd.com>; Zuo, Jerry
> > <Jerry.Zuo@amd.com>
> > Subject: Re: [PATCH 3/3] drm/mst: adjust the function
> > drm_dp_remove_payload_part2()
> >
> > On Tue, Aug 08, 2023 at 03:47:47AM +0000, Lin, Wayne wrote:
> > > [AMD Official Use Only - General]
> > >
> > > > -----Original Message-----
> > > > From: Imre Deak <imre.deak@intel.com>
> > > > Sent: Tuesday, August 8, 2023 12:00 AM
> > > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > > Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org;
> > > > lyude@redhat.com; jani.nikula@intel.com;
> > > > ville.syrjala@linux.intel.com; Wentland, Harry
> > > > <Harry.Wentland@amd.com>; Zuo, Jerry <Jerry.Zuo@amd.com>
> > > > Subject: Re: [PATCH 3/3] drm/mst: adjust the function
> > > > drm_dp_remove_payload_part2()
> > > >
> > > > On Mon, Aug 07, 2023 at 02:43:02AM +0000, Lin, Wayne wrote:
> > > > > [AMD Official Use Only - General]
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Imre Deak <imre.deak@intel.com>
> > > > > > Sent: Friday, August 4, 2023 11:32 PM
> > > > > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > > > > Cc: dri-devel@lists.freedesktop.org;
> > > > > > amd-gfx@lists.freedesktop.org; lyude@redhat.com;
> > > > > > jani.nikula@intel.com; ville.syrjala@linux.intel.com; Wentland,
> > > > > > Harry <Harry.Wentland@amd.com>; Zuo, Jerry <Jerry.Zuo@amd.com>
> > > > > > Subject: Re: [PATCH 3/3] drm/mst: adjust the function
> > > > > > drm_dp_remove_payload_part2()
> > > > > >
> > > > > > On Fri, Aug 04, 2023 at 02:20:29PM +0800, Wayne Lin wrote:
> > > > > > > [...]
> > > > > > > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > > > b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > > > index e04f87ff755a..4270178f95f6 100644
> > > > > > > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > > > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > > > @@ -3382,8 +3382,7 @@
> > > > > > EXPORT_SYMBOL(drm_dp_remove_payload_part1);
> > > > > > >   * drm_dp_remove_payload_part2() - Remove an MST payload
> > locally
> > > > > > >   * @mgr: Manager to use.
> > > > > > >   * @mst_state: The MST atomic state
> > > > > > > - * @old_payload: The payload with its old state
> > > > > > > - * @new_payload: The payload with its latest state
> > > > > > > + * @payload: The payload with its latest state
> > > > > > >   *
> > > > > > >   * Updates the starting time slots of all other payloads
> > > > > > > which would have
> > > > > > been shifted towards
> > > > > > >   * the start of the payload ID table as a result of removing
> > > > > > > a payload. Driver should call this @@ -3392,25 +3391,36 @@
> > > > > > EXPORT_SYMBOL(drm_dp_remove_payload_part1);
> > > > > > >   */
> > > > > > >  void drm_dp_remove_payload_part2(struct
> > > > drm_dp_mst_topology_mgr
> > > > > > *mgr,
> > > > > > >                              struct drm_dp_mst_topology_state
> > > > > > *mst_state,
> > > > > > > -                            const struct drm_dp_mst_atomic_payload
> > > > > > *old_payload,
> > > > > > > -                            struct drm_dp_mst_atomic_payload
> > > > > > *new_payload)
> > > > > > > +                            struct drm_dp_mst_atomic_payload
> > > > > > *payload)
> > > > > > >  {
> > > > > > >     struct drm_dp_mst_atomic_payload *pos;
> > > > > > > +   u8 time_slots_to_remove;
> > > > > > > +   u8 next_payload_vc_start = mgr->next_start_slot;
> > > > > > > +
> > > > > > > +   /* Find the current allocated time slot number of the payload */
> > > > > > > +   list_for_each_entry(pos, &mst_state->payloads, next) {
> > > > > > > +           if (pos != payload &&
> > > > > > > +               pos->vc_start_slot > payload->vc_start_slot &&
> > > > > > > +               pos->vc_start_slot < next_payload_vc_start)
> > > > > > > +                   next_payload_vc_start = pos->vc_start_slot;
> > > > > > > +   }
> > > > > > > +
> > > > > > > +   time_slots_to_remove = next_payload_vc_start -
> > > > > > > +payload->vc_start_slot;
> > > > > >
> > > > > > Imo, the intuitive way would be to pass the old payload state to
> > > > > > this function - which already contains the required time_slots
> > > > > > param
> > > > > > - and refactor things instead moving vc_start_slot from the
> > > > > > payload state to mgr suggested by Ville earlier.
> > > > > >
> > > > > > --Imre
> > > > >
> > > > > Hi Imre,
> > > > > Thanks for your feedback!
> > > > >
> > > > > I understand it's functionally correct. But IMHO, it's still a bit
> > > > > conceptually different between the time slot in old state and the
> > > > > time slot in current payload table. My thought is the time slot at
> > > > > the moment when we are removing the payload would be a better
> > choice.
> > > >
> > > > Yes, they are different. The old state contains the time slot the
> > > > payload was added with in a preceding commit and so the time slot
> > > > value which should be used when removing the same payload in the
> > current commit.
> > > >
> > > > The new state contains a time slot value with which the payload will
> > > > be added in the current commit and can be different than the one in
> > > > the old state if the current commit has changed the payload size
> > > > (meaning that the same atomic commit will first remove the payload
> > > > using the time slot value in the old state and afterwards will add
> > > > back the same payload using the time slot value in the new state).
> > > >
> > > Appreciate your time, Imre!
> > >
> > > Yes I understand, so I'm not using the number of the time slot in the new
> > state.
> > > I'm referring to the start slot instead which is updated during every
> > > allocation and removement at current commit.
> > >
> > > Like what you said, current commit manipulation could be a mix of
> > > allocations and removements for the payload. My thought is,
> > > conceptually, looking up the latest number of time slot is a better choice
> > rather than the one in old state.
> > > It's relatively intuitive to me since we are removing payload from
> > > current payload table and which changes since last preceding commit
> > > till the moment we're deleting the payload. Although it's unreasonable
> > > that these values are different.
> > >
> > > > > And with this, we can also simplify some codes. Especially remove
> > > > > workaround in amd driver. In fact, DRM mst code maintains the
> > > > > payload table and all the time slot info is in it already. We
> > > > > don't really have to pass a new parameter.
> > > >
> > > > I agree that drm_dp_remove_payload() could be simplified, but this
> > > > should be done so that the drivers can pass the old payload state to
> > > > it (without having to pass the new state). This would be possible if
> > > > vc_start_slot was not tracked in the payload state (which is really
> > > > not an atomic state that can be precomputed as all other atomic
> > > > state), rather it would be tracked in struct drm_dp_mst_topology_mgr.
> > > >
> > >
> > > So the reason I chose to pass the new state is like what I mentioned
> > > above. I would prefer to carry the latest updated payload table
> > > instead which is in the new state. And I agree with the explanation
> > > for the vc_start_slot and that's also my thought at the beginning. It
> > > could be a refactor later, but no matter the start slot is put into
> > > payload state or the topology manager I would prefer to refer to the latest
> > payload table rather than the number of time slot in the old state.
> > >
> > > > It looks like AMD has to reconstruct the old state in
> > > > dm_helpers_construct_old_payload(). Could you explain why it
> > > > couldn't instead just pass old_payload acquired by
> > > >
> > > > old_mst_state = drm_atomic_get_old_mst_topology_state();
> > > > old_payload = drm_atomic_get_mst_payload_state(old_mst_state);
> > > >
> > > > ?
> > >
> > > AMD doesn't pass the drm old state to the stage while HW is deleting
> > > the payload.  The reason is that HW payload table is known during HW
> > > programming procedure, so the payload removement is based on the table
> > > at the moment.
> > >
> > > AMD expected the current number of time slot is also already
> > > maintained in drm layer.
> >
> > Yes, both of the above are maintained by the drm layer, but it also means it
> > doesn't really need to recalculate time_slots_to_remove as done in this patch,
> > since that info is already available in the old payload state.
> >
> > Afaics the AMD driver calls properly
> >
> > drm_atomic_helper_commit() -> drm_atomic_helper_swap_state()
> >
> > after a commit, so that all the payloads it added should be tracked now as the
> > old payload state.
> >
> > So could you confirm what is the old_payload->time_slots value (which you
> > get with the above functions) at the point of removing this payload and if it's
> > not the time_slots value this same payload was actually added with previously,
> > why this is so (via some example sequence)?
> >
> > Thanks.
> 
> Hi Imre,
> I'm not saying that the time_slots carried in the old state is wrong within amd driver.
> But just amd driver doesn't carry the drm state to the step when it's removing the
> payload, since the info is already in its hardware and drm used to maintain the info
> in the drm layer.

Hm, in 

dm_helpers_dp_mst_write_payload_allocation_table()

the

mst_state = to_drm_dp_mst_topology_state(mst_mgr->base.state);

used as the new state doesn't look ok to me. The above is the MST
object's current SW state after an atomic commit/swap, but this isn't
the new state a driver should program to the HW or pass to the drm
helper functions. The object's current state could be ahead of what the
driver should program to the HW, if the driver properly implements
commit pipelining (so at the point you're programming a state you'd have
already future commits computed and queued up, each queued-up commit
with its own state).

So instead of the above mst_state the driver should pass down the
drm_atomic_state to dm_helpers_dp_mst_write_payload_allocation_table()
which should use that instead to get the MST state it should program or
pass to the drm layer.

> So the patch is trying to get the behavior of this helper function
> back to what it used to be.

The behavior before was actually broken and one reason for that was a
confusion about what's stored in the new payload state. It's a mixture of
old/current state (vc_start_slot) and new state (time_slots). So I don't
think it's a good idea to add even more dependency on this semantic.

I think the right solution for what this patch is about - remove the
need for dm_helpers_construct_old_payload(), would be to pass down
drm_atomic_state to
dm_helpers_dp_mst_write_payload_allocation_table()
based on the above.

> And the main reason that I want to change the pass in parameter is
> like what I mentioned previously. The commit manipulation could be a
> mix of allocations and removements for the payload. And in the spec,
> it also introduces examples to reduce or increase the payload
> allocation. Although we're not using reduction/increment today, it
> implicitly imposes the limitation to use them before calling the
> removement helper function with the old state as the passed in
> parameter. So I also want to remove the dependency by this patch.
> Would like to know your thoughts about this.

It's not clear what would be the benefit of changing a payload without
removing it first. In any case, I think the right direction for the
driver would be to meet the requirement to use the proper atomic state
with the drm helper functions (not the object's current SW state) as
described above.

> Thanks, Imre!
> 
> >
> > > Again, thanks for your feedback Imre!
> > >
> > > >
> > > > > > >     /* Remove local payload allocation */
> > > > > > >     list_for_each_entry(pos, &mst_state->payloads, next) {
> > > > > > > -           if (pos != new_payload && pos->vc_start_slot > new_payload-
> > > > > > >vc_start_slot)
> > > > > > > -                   pos->vc_start_slot -= old_payload->time_slots;
> > > > > > > +           if (pos != payload && pos->vc_start_slot >
> > > > > > > + payload-
> > > > > > >vc_start_slot)
> > > > > > > +                   pos->vc_start_slot -=
> > > > > > > + time_slots_to_remove;
> > > > > > >     }
> > > > > > > -   new_payload->vc_start_slot = -1;
> > > > > > > +   payload->vc_start_slot = -1;
> > > > > > >
> > > > > > >     mgr->payload_count--;
> > > > > > > -   mgr->next_start_slot -= old_payload->time_slots;
> > > > > > > +   mgr->next_start_slot -= time_slots_to_remove;
> > > > > > >
> > > > > > > -   if (new_payload->delete)
> > > > > > > -           drm_dp_mst_put_port_malloc(new_payload->port);
> > > > > > > +   if (payload->delete)
> > > > > > > +           drm_dp_mst_put_port_malloc(payload->port);
> > > > > > >
> > > > > > > -   new_payload->payload_allocation_status =
> > > > > > DRM_DP_MST_PAYLOAD_ALLOCATION_NONE;
> > > > > > > +   payload->payload_allocation_status =
> > > > > > > +DRM_DP_MST_PAYLOAD_ALLOCATION_NONE;
> > > > > > >  }
> > > > >
> > > > > --
> > > > > Regards,
> > > > > Wayne
> > >
> > > --
> > > Regards,
> > > Wayne
> --
> Regards,
> Wayne
