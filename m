Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 889F0798EF9
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 21:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9096710E0F5;
	Fri,  8 Sep 2023 19:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F361A10E008;
 Fri,  8 Sep 2023 19:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694200693; x=1725736693;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=KE97TSck3P4gobneKrsZ3v+m0ruU7BTaRzO8VbPaQp8=;
 b=fxGCw02LcqPmAfQsZz5hchXesQjqIfqdodX8oTtiW0I9Wsy7RJHB9Gu2
 nZfXL0+C1GtYnK4I+EfXR5KKe9bJzifkuH2iQ/ONbdpltKd/4SmVK0qoy
 Hkr+/2uCCjeOfAdqEuaScLW2PNc0oXxup28Ya9D4+cShIT6pKYQq2KcHl
 MnhcIX7LWiLakDE1W4bZWEL7MeBE4qqmxQRKjQ9WS58IfkLQBNldtpg1i
 eJkYtqCvhCry9dZHSYXv3/CKt1jdIqnQdx1d6YR4Kz9XX/aDIPh1y+KL9
 vxfHK079QgMX0sHVrjKT/0x/9M5xz4OWOLXWiGUqlU7OhBncbhyHr7sJB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="381546885"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="381546885"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 12:18:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="885767070"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="885767070"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 12:17:53 -0700
Date: Fri, 8 Sep 2023 22:18:29 +0300
From: Imre Deak <imre.deak@intel.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>
Subject: Re: [PATCH 3/3] drm/mst: adjust the function
 drm_dp_remove_payload_part2()
Message-ID: <ZPtzhcxqWPB07vfw@ideak-desk.fi.intel.com>
References: <20230804062029.5686-1-Wayne.Lin@amd.com>
 <20230804062029.5686-4-Wayne.Lin@amd.com>
 <ZM0Z3sZEYMcMTnuP@ideak-desk.fi.intel.com>
 <CO6PR12MB5489306FA44F5F107180E57DFC0CA@CO6PR12MB5489.namprd12.prod.outlook.com>
 <ZNEU8j6OR3KirIcS@ideak-desk.fi.intel.com>
 <CO6PR12MB548978FEE8BE8300F43D4486FC0DA@CO6PR12MB5489.namprd12.prod.outlook.com>
 <ZN+uWC1fDKZUmDdL@ideak-desk.fi.intel.com>
 <CO6PR12MB5489E92E7A29CA7285602B20FC1CA@CO6PR12MB5489.namprd12.prod.outlook.com>
 <ZOiywboCeFxJwCCP@ideak-desk.fi.intel.com>
 <CO6PR12MB5489FC7230B9D400EEF5735CFCEEA@CO6PR12MB5489.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO6PR12MB5489FC7230B9D400EEF5735CFCEEA@CO6PR12MB5489.namprd12.prod.outlook.com>
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

On Thu, Sep 07, 2023 at 03:44:39AM +0000, Lin, Wayne wrote:
> [AMD Official Use Only - General]
> 
> > -----Original Message-----
> > From: Imre Deak <imre.deak@intel.com>
> > Sent: Friday, August 25, 2023 9:56 PM
> > To: Lin, Wayne <Wayne.Lin@amd.com>
> > Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org;
> > lyude@redhat.com; jani.nikula@intel.com; ville.syrjala@linux.intel.com;
> > Wentland, Harry <Harry.Wentland@amd.com>; Zuo, Jerry
> > <Jerry.Zuo@amd.com>
> > Subject: Re: [PATCH 3/3] drm/mst: adjust the function
> > drm_dp_remove_payload_part2()
> >
> > On Wed, Aug 23, 2023 at 03:16:44AM +0000, Lin, Wayne wrote:
> > > [AMD Official Use Only - General]
> > >
> > > > -----Original Message-----
> > > > From: Imre Deak <imre.deak@intel.com>
> > > > Sent: Saturday, August 19, 2023 1:46 AM
> > > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > > Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org;
> > > > lyude@redhat.com; jani.nikula@intel.com;
> > > > ville.syrjala@linux.intel.com; Wentland, Harry
> > > > <Harry.Wentland@amd.com>; Zuo, Jerry <Jerry.Zuo@amd.com>
> > > > Subject: Re: [PATCH 3/3] drm/mst: adjust the function
> > > > drm_dp_remove_payload_part2()
> > > >
> > > > On Tue, Aug 08, 2023 at 03:47:47AM +0000, Lin, Wayne wrote:
> > > > > [AMD Official Use Only - General]
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Imre Deak <imre.deak@intel.com>
> > > > > > Sent: Tuesday, August 8, 2023 12:00 AM
> > > > > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > > > > Cc: dri-devel@lists.freedesktop.org;
> > > > > > amd-gfx@lists.freedesktop.org; lyude@redhat.com;
> > > > > > jani.nikula@intel.com; ville.syrjala@linux.intel.com; Wentland,
> > > > > > Harry <Harry.Wentland@amd.com>; Zuo, Jerry <Jerry.Zuo@amd.com>
> > > > > > Subject: Re: [PATCH 3/3] drm/mst: adjust the function
> > > > > > drm_dp_remove_payload_part2()
> > > > > >
> > > > > > On Mon, Aug 07, 2023 at 02:43:02AM +0000, Lin, Wayne wrote:
> > > > > > > [AMD Official Use Only - General]
> > > > > > >
> > > > > > > > -----Original Message-----
> > > > > > > > From: Imre Deak <imre.deak@intel.com>
> > > > > > > > Sent: Friday, August 4, 2023 11:32 PM
> > > > > > > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > > > > > > Cc: dri-devel@lists.freedesktop.org;
> > > > > > > > amd-gfx@lists.freedesktop.org; lyude@redhat.com;
> > > > > > > > jani.nikula@intel.com; ville.syrjala@linux.intel.com;
> > > > > > > > Wentland, Harry <Harry.Wentland@amd.com>; Zuo, Jerry
> > > > > > > > <Jerry.Zuo@amd.com>
> > > > > > > > Subject: Re: [PATCH 3/3] drm/mst: adjust the function
> > > > > > > > drm_dp_remove_payload_part2()
> > > > > > > >
> > > > > > > > On Fri, Aug 04, 2023 at 02:20:29PM +0800, Wayne Lin wrote:
> > > > > > > > > [...]
> > > > > > > > > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > > > > > b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > > > > > index e04f87ff755a..4270178f95f6 100644
> > > > > > > > > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > > > > > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > > > > > @@ -3382,8 +3382,7 @@
> > > > > > > > EXPORT_SYMBOL(drm_dp_remove_payload_part1);
> > > > > > > > >   * drm_dp_remove_payload_part2() - Remove an MST payload
> > > > locally
> > > > > > > > >   * @mgr: Manager to use.
> > > > > > > > >   * @mst_state: The MST atomic state
> > > > > > > > > - * @old_payload: The payload with its old state
> > > > > > > > > - * @new_payload: The payload with its latest state
> > > > > > > > > + * @payload: The payload with its latest state
> > > > > > > > >   *
> > > > > > > > >   * Updates the starting time slots of all other payloads
> > > > > > > > > which would have
> > > > > > > > been shifted towards
> > > > > > > > >   * the start of the payload ID table as a result of
> > > > > > > > > removing a payload. Driver should call this @@ -3392,25
> > > > > > > > > +3391,36 @@
> > > > > > > > EXPORT_SYMBOL(drm_dp_remove_payload_part1);
> > > > > > > > >   */
> > > > > > > > >  void drm_dp_remove_payload_part2(struct
> > > > > > drm_dp_mst_topology_mgr
> > > > > > > > *mgr,
> > > > > > > > >                              struct
> > > > > > > > > drm_dp_mst_topology_state
> > > > > > > > *mst_state,
> > > > > > > > > -                            const struct drm_dp_mst_atomic_payload
> > > > > > > > *old_payload,
> > > > > > > > > -                            struct drm_dp_mst_atomic_payload
> > > > > > > > *new_payload)
> > > > > > > > > +                            struct
> > > > > > > > > + drm_dp_mst_atomic_payload
> > > > > > > > *payload)
> > > > > > > > >  {
> > > > > > > > >     struct drm_dp_mst_atomic_payload *pos;
> > > > > > > > > +   u8 time_slots_to_remove;
> > > > > > > > > +   u8 next_payload_vc_start = mgr->next_start_slot;
> > > > > > > > > +
> > > > > > > > > +   /* Find the current allocated time slot number of the payload */
> > > > > > > > > +   list_for_each_entry(pos, &mst_state->payloads, next) {
> > > > > > > > > +           if (pos != payload &&
> > > > > > > > > +               pos->vc_start_slot > payload->vc_start_slot &&
> > > > > > > > > +               pos->vc_start_slot < next_payload_vc_start)
> > > > > > > > > +                   next_payload_vc_start = pos->vc_start_slot;
> > > > > > > > > +   }
> > > > > > > > > +
> > > > > > > > > +   time_slots_to_remove = next_payload_vc_start -
> > > > > > > > > +payload->vc_start_slot;
> > > > > > > >
> > > > > > > > Imo, the intuitive way would be to pass the old payload
> > > > > > > > state to this function - which already contains the required
> > > > > > > > time_slots param
> > > > > > > > - and refactor things instead moving vc_start_slot from the
> > > > > > > > payload state to mgr suggested by Ville earlier.
> > > > > > > >
> > > > > > > > --Imre
> > > > > > >
> > > > > > > Hi Imre,
> > > > > > > Thanks for your feedback!
> > > > > > >
> > > > > > > I understand it's functionally correct. But IMHO, it's still a
> > > > > > > bit conceptually different between the time slot in old state
> > > > > > > and the time slot in current payload table. My thought is the
> > > > > > > time slot at the moment when we are removing the payload would
> > > > > > > be a better
> > > > choice.
> > > > > >
> > > > > > Yes, they are different. The old state contains the time slot
> > > > > > the payload was added with in a preceding commit and so the time
> > > > > > slot value which should be used when removing the same payload
> > > > > > in the
> > > > current commit.
> > > > > >
> > > > > > The new state contains a time slot value with which the payload
> > > > > > will be added in the current commit and can be different than
> > > > > > the one in the old state if the current commit has changed the
> > > > > > payload size (meaning that the same atomic commit will first
> > > > > > remove the payload using the time slot value in the old state
> > > > > > and afterwards will add back the same payload using the time slot value
> > in the new state).
> > > > > >
> > > > > Appreciate your time, Imre!
> > > > >
> > > > > Yes I understand, so I'm not using the number of the time slot in
> > > > > the new
> > > > state.
> > > > > I'm referring to the start slot instead which is updated during
> > > > > every allocation and removement at current commit.
> > > > >
> > > > > Like what you said, current commit manipulation could be a mix of
> > > > > allocations and removements for the payload. My thought is,
> > > > > conceptually, looking up the latest number of time slot is a
> > > > > better choice
> > > > rather than the one in old state.
> > > > > It's relatively intuitive to me since we are removing payload from
> > > > > current payload table and which changes since last preceding
> > > > > commit till the moment we're deleting the payload. Although it's
> > > > > unreasonable that these values are different.
> > > > >
> > > > > > > And with this, we can also simplify some codes. Especially
> > > > > > > remove workaround in amd driver. In fact, DRM mst code
> > > > > > > maintains the payload table and all the time slot info is in
> > > > > > > it already. We don't really have to pass a new parameter.
> > > > > >
> > > > > > I agree that drm_dp_remove_payload() could be simplified, but
> > > > > > this should be done so that the drivers can pass the old payload
> > > > > > state to it (without having to pass the new state). This would
> > > > > > be possible if vc_start_slot was not tracked in the payload
> > > > > > state (which is really not an atomic state that can be
> > > > > > precomputed as all other atomic state), rather it would be tracked in
> > struct drm_dp_mst_topology_mgr.
> > > > > >
> > > > >
> > > > > So the reason I chose to pass the new state is like what I
> > > > > mentioned above. I would prefer to carry the latest updated
> > > > > payload table instead which is in the new state. And I agree with
> > > > > the explanation for the vc_start_slot and that's also my thought
> > > > > at the beginning. It could be a refactor later, but no matter the
> > > > > start slot is put into payload state or the topology manager I
> > > > > would prefer to refer to the latest
> > > > payload table rather than the number of time slot in the old state.
> > > > >
> > > > > > It looks like AMD has to reconstruct the old state in
> > > > > > dm_helpers_construct_old_payload(). Could you explain why it
> > > > > > couldn't instead just pass old_payload acquired by
> > > > > >
> > > > > > old_mst_state = drm_atomic_get_old_mst_topology_state();
> > > > > > old_payload = drm_atomic_get_mst_payload_state(old_mst_state);
> > > > > >
> > > > > > ?
> > > > >
> > > > > AMD doesn't pass the drm old state to the stage while HW is
> > > > > deleting the payload.  The reason is that HW payload table is
> > > > > known during HW programming procedure, so the payload removement
> > > > > is based on the table at the moment.
> > > > >
> > > > > AMD expected the current number of time slot is also already
> > > > > maintained in drm layer.
> > > >
> > > > Yes, both of the above are maintained by the drm layer, but it also
> > > > means it doesn't really need to recalculate time_slots_to_remove as
> > > > done in this patch, since that info is already available in the old payload
> > state.
> > > >
> > > > Afaics the AMD driver calls properly
> > > >
> > > > drm_atomic_helper_commit() -> drm_atomic_helper_swap_state()
> > > >
> > > > after a commit, so that all the payloads it added should be tracked
> > > > now as the old payload state.
> > > >
> > > > So could you confirm what is the old_payload->time_slots value
> > > > (which you get with the above functions) at the point of removing
> > > > this payload and if it's not the time_slots value this same payload
> > > > was actually added with previously, why this is so (via some example
> > sequence)?
> > > >
> > > > Thanks.
> > >
> > > Hi Imre,
> > > I'm not saying that the time_slots carried in the old state is wrong within
> > amd driver.
> > > But just amd driver doesn't carry the drm state to the step when it's
> > > removing the payload, since the info is already in its hardware and
> > > drm used to maintain the info in the drm layer.
> >
> > Hm, in
> >
> > dm_helpers_dp_mst_write_payload_allocation_table()
> >
> > the
> >
> > mst_state = to_drm_dp_mst_topology_state(mst_mgr->base.state);
> >
> > used as the new state doesn't look ok to me. The above is the MST object's
> > current SW state after an atomic commit/swap, but this isn't the new state a
> > driver should program to the HW or pass to the drm helper functions. The
> > object's current state could be ahead of what the driver should program to the
> > HW, if the driver properly implements commit pipelining (so at the point
> > you're programming a state you'd have already future commits computed and
> > queued up, each queued-up commit with its own state).
> >
> > So instead of the above mst_state the driver should pass down the
> > drm_atomic_state to dm_helpers_dp_mst_write_payload_allocation_table()
> > which should use that instead to get the MST state it should program or pass
> > to the drm layer.
> >
> > > So the patch is trying to get the behavior of this helper function
> > > back to what it used to be.
> >
> > The behavior before was actually broken and one reason for that was a
> > confusion about what's stored in the new payload state. It's a mixture of
> > old/current state (vc_start_slot) and new state (time_slots). So I don't think
> > it's a good idea to add even more dependency on this semantic.
> >
> > I think the right solution for what this patch is about - remove the need for
> > dm_helpers_construct_old_payload(), would be to pass down
> > drm_atomic_state to
> > dm_helpers_dp_mst_write_payload_allocation_table()
> > based on the above.
> >
> > > And the main reason that I want to change the pass in parameter is
> > > like what I mentioned previously. The commit manipulation could be a
> > > mix of allocations and removements for the payload. And in the spec,
> > > it also introduces examples to reduce or increase the payload
> > > allocation. Although we're not using reduction/increment today, it
> > > implicitly imposes the limitation to use them before calling the
> > > removement helper function with the old state as the passed in
> > > parameter. So I also want to remove the dependency by this patch.
> > > Would like to know your thoughts about this.
> >
> > It's not clear what would be the benefit of changing a payload without
> > removing it first. In any case, I think the right direction for the driver would be
> > to meet the requirement to use the proper atomic state with the drm helper
> > functions (not the object's current SW state) as described above.
> 
> Hi Imre,
> 
> Thanks for pointing that out and that was also one of my plan to refactor! But I
> would take that as another patch to follow up and would like to align with you
> the idea for this helper function itself more.
> 
> My concern is referring to the old state to remove the time slot is just not generic
> right for what the helper function shall accomplish. Even it doesn't bring benefit
> as you see, having old state as the input imposes limitation to drivers using it which
> is the downside that it brought. The limitation is like what I tried to explain before.
> For an instance, if one driver has compressed streams allocated in the previous
> commit and wants to disable these streams at the current commit. It handles and
> accomplishes the commit into two steps that firstly to disable dsc engine only
> (which increases the time slot), and next disable the streams. Under this design,
> the old state can't represent the exact number of time slot that it want's to remove
> at the moment. For this case, I don't think drm_dp_remove_payload_part2 should
> block the driver to use it since the driver doesn't do things wrong.  Conversely, it's
> due to the helper function constrains the driver to use an inappropriate input.
> 
> And with or without my patch, the current payload allocation table (i.e. vc_start_slot
> In new state) and the time slot that this new state is going to set (i.e. time_slots in
> new state) are already both in the new state. I think the patch doesn't add irrelevant
> input for removing a payload as this helper function should do, because the time slot
> it should remove is the exact one in the payload table now, not the one captured in
> previous commit.  So in contrast, refer to old state time slot is a bit confusing to me
> because it's not generic right. Would like to know your thought on this point.
> Appreciate your time!

I'd like to be sure that the payload is removed with the size it was
added with in the previous commit and as I wrote above not depend for
this on the new payload state with a mixture of old/current/new states.
Based on that I'd be ok for instance with a new

int drm_dp_remove_port_payload(mgr, mst_state, port)

function which looks up / removes the payload with the time_slots calculated
based on the payload table as in your patch and returns the calculated
time_slots.

The AMD driver could call the above function and the current
drm_dp_remove_payload(mgr, mst_state, old_payload) function would be

	time_slots = drm_dp_remove_port_payload(mgr, mst_state, old_payload->port);
	WARN_ON(time_slots != old_payload->time_slots);

--Imre
