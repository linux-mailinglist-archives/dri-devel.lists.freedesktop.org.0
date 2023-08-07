Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B94247729F5
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 17:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D4910E1F2;
	Mon,  7 Aug 2023 15:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFBD910E18C;
 Mon,  7 Aug 2023 15:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691423977; x=1722959977;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=i6dTcUgaWIywgs9j44XtoWP56Hj1AfSyrA8dFT0O45k=;
 b=B8CESpmV0oJqEx1+qy55e2Jc42NK+D0B8md1iFpodBFE/nOItqqpq8LS
 nJ24ZxKJeMMc+5L2J6HXtXfB6eDR3FV2ACYJNlp5vI2dIqd5jkJ5qzs0v
 20Z7vf0ny11foR5FpL6NQ8TX3xfq++WzIz4UImWI8KSZNsYRUlgjLppSZ
 AJtNcD0WH4CLshKq63vaCiR4uh9w8+5an5fKp1Y5az5DR4DeE+zLvTV02
 W5/nZdURHtmR3cbo6trnt4YFvSjU9s3OreJNe0mXAKhTTU8DM99ZqR3Yf
 hejx9mAKy5FZTnDqdmhbhSMbiuunKb3Pq0kkDi6hw8OXsPmadZEU6wW6n w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="370581171"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="370581171"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 08:59:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="766044424"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="766044424"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 08:59:34 -0700
Date: Mon, 7 Aug 2023 18:59:46 +0300
From: Imre Deak <imre.deak@intel.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>
Subject: Re: [PATCH 3/3] drm/mst: adjust the function
 drm_dp_remove_payload_part2()
Message-ID: <ZNEU8j6OR3KirIcS@ideak-desk.fi.intel.com>
References: <20230804062029.5686-1-Wayne.Lin@amd.com>
 <20230804062029.5686-4-Wayne.Lin@amd.com>
 <ZM0Z3sZEYMcMTnuP@ideak-desk.fi.intel.com>
 <CO6PR12MB5489306FA44F5F107180E57DFC0CA@CO6PR12MB5489.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO6PR12MB5489306FA44F5F107180E57DFC0CA@CO6PR12MB5489.namprd12.prod.outlook.com>
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

On Mon, Aug 07, 2023 at 02:43:02AM +0000, Lin, Wayne wrote:
> [AMD Official Use Only - General]
> 
> > -----Original Message-----
> > From: Imre Deak <imre.deak@intel.com>
> > Sent: Friday, August 4, 2023 11:32 PM
> > To: Lin, Wayne <Wayne.Lin@amd.com>
> > Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org;
> > lyude@redhat.com; jani.nikula@intel.com; ville.syrjala@linux.intel.com;
> > Wentland, Harry <Harry.Wentland@amd.com>; Zuo, Jerry
> > <Jerry.Zuo@amd.com>
> > Subject: Re: [PATCH 3/3] drm/mst: adjust the function
> > drm_dp_remove_payload_part2()
> >
> > On Fri, Aug 04, 2023 at 02:20:29PM +0800, Wayne Lin wrote:
> > > [...]
> > > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > index e04f87ff755a..4270178f95f6 100644
> > > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > @@ -3382,8 +3382,7 @@
> > EXPORT_SYMBOL(drm_dp_remove_payload_part1);
> > >   * drm_dp_remove_payload_part2() - Remove an MST payload locally
> > >   * @mgr: Manager to use.
> > >   * @mst_state: The MST atomic state
> > > - * @old_payload: The payload with its old state
> > > - * @new_payload: The payload with its latest state
> > > + * @payload: The payload with its latest state
> > >   *
> > >   * Updates the starting time slots of all other payloads which would have
> > been shifted towards
> > >   * the start of the payload ID table as a result of removing a
> > > payload. Driver should call this @@ -3392,25 +3391,36 @@
> > EXPORT_SYMBOL(drm_dp_remove_payload_part1);
> > >   */
> > >  void drm_dp_remove_payload_part2(struct drm_dp_mst_topology_mgr
> > *mgr,
> > >                              struct drm_dp_mst_topology_state
> > *mst_state,
> > > -                            const struct drm_dp_mst_atomic_payload
> > *old_payload,
> > > -                            struct drm_dp_mst_atomic_payload
> > *new_payload)
> > > +                            struct drm_dp_mst_atomic_payload
> > *payload)
> > >  {
> > >     struct drm_dp_mst_atomic_payload *pos;
> > > +   u8 time_slots_to_remove;
> > > +   u8 next_payload_vc_start = mgr->next_start_slot;
> > > +
> > > +   /* Find the current allocated time slot number of the payload */
> > > +   list_for_each_entry(pos, &mst_state->payloads, next) {
> > > +           if (pos != payload &&
> > > +               pos->vc_start_slot > payload->vc_start_slot &&
> > > +               pos->vc_start_slot < next_payload_vc_start)
> > > +                   next_payload_vc_start = pos->vc_start_slot;
> > > +   }
> > > +
> > > +   time_slots_to_remove = next_payload_vc_start -
> > > +payload->vc_start_slot;
> >
> > Imo, the intuitive way would be to pass the old payload state to this function -
> > which already contains the required time_slots param - and refactor things
> > instead moving vc_start_slot from the payload state to mgr suggested by Ville
> > earlier.
> >
> > --Imre
> 
> Hi Imre,
> Thanks for your feedback!
>
> I understand it's functionally correct. But IMHO, it's still a bit
> conceptually different between the time slot in old state and the time
> slot in current payload table. My thought is the time slot at the
> moment when we are removing the payload would be a better choice.

Yes, they are different. The old state contains the time slot the
payload was added with in a preceding commit and so the time slot value
which should be used when removing the same payload in the current
commit.

The new state contains a time slot value with which the payload will be
added in the current commit and can be different than the one in the old
state if the current commit has changed the payload size (meaning that
the same atomic commit will first remove the payload using the time slot
value in the old state and afterwards will add back the same payload
using the time slot value in the new state).

> And with this, we can also simplify some codes. Especially remove
> workaround in amd driver. In fact, DRM mst code maintains the payload
> table and all the time slot info is in it already. We don't really
> have to pass a new parameter.

I agree that drm_dp_remove_payload() could be simplified, but this
should be done so that the drivers can pass the old payload state to it
(without having to pass the new state). This would be possible if
vc_start_slot was not tracked in the payload state (which is really not
an atomic state that can be precomputed as all other atomic state),
rather it would be tracked in struct drm_dp_mst_topology_mgr.

It looks like AMD has to reconstruct the old state in
dm_helpers_construct_old_payload(). Could you explain why it couldn't
instead just pass old_payload acquired by

old_mst_state = drm_atomic_get_old_mst_topology_state();
old_payload = drm_atomic_get_mst_payload_state(old_mst_state);

?

> > >     /* Remove local payload allocation */
> > >     list_for_each_entry(pos, &mst_state->payloads, next) {
> > > -           if (pos != new_payload && pos->vc_start_slot > new_payload-
> > >vc_start_slot)
> > > -                   pos->vc_start_slot -= old_payload->time_slots;
> > > +           if (pos != payload && pos->vc_start_slot > payload-
> > >vc_start_slot)
> > > +                   pos->vc_start_slot -= time_slots_to_remove;
> > >     }
> > > -   new_payload->vc_start_slot = -1;
> > > +   payload->vc_start_slot = -1;
> > >
> > >     mgr->payload_count--;
> > > -   mgr->next_start_slot -= old_payload->time_slots;
> > > +   mgr->next_start_slot -= time_slots_to_remove;
> > >
> > > -   if (new_payload->delete)
> > > -           drm_dp_mst_put_port_malloc(new_payload->port);
> > > +   if (payload->delete)
> > > +           drm_dp_mst_put_port_malloc(payload->port);
> > >
> > > -   new_payload->payload_allocation_status =
> > DRM_DP_MST_PAYLOAD_ALLOCATION_NONE;
> > > +   payload->payload_allocation_status =
> > > +DRM_DP_MST_PAYLOAD_ALLOCATION_NONE;
> > >  }
> 
> --
> Regards,
> Wayne
