Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BC448CE00
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 22:47:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19AD10E850;
	Wed, 12 Jan 2022 21:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C1410E850
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 21:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642024055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hl8jQnCPnlaTkYrcR+8Cq4Hf9R9M8oBn7+4+eMi7HN4=;
 b=Y7t0BoUR+gZPPRgN3i0ujB3s09p7We5wG1zszawoo1ObO+MqXKjuZz2KT6ctmDrWu3Jbmy
 POIRy+4gx9btTkD2eBlq5U1Kxo8H1LzE6FLcxjaAD4m1NSLjSOd8GNmECc8PC4+hCEmi8C
 tjGF9H6MNDzRHl5IhjTjSn3wzSpyNXM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-7Aua9NxcNBWxOVO3ViOwqg-1; Wed, 12 Jan 2022 16:47:22 -0500
X-MC-Unique: 7Aua9NxcNBWxOVO3ViOwqg-1
Received: by mail-qv1-f72.google.com with SMTP id
 s7-20020a0562140ca700b0041a83db1071so154379qvs.10
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 13:47:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=hl8jQnCPnlaTkYrcR+8Cq4Hf9R9M8oBn7+4+eMi7HN4=;
 b=ht1IhUBhvjuBXv+uscMAwYFidP8cBQCsYzbtai2l/13BRL2Tipauyzb3fp5KLFLQju
 37twFi/SRKkRfQPKGi3rKcBfeISfl/UELF4c4zyU4mq015VJJWeg4OvJDIVnQUbEA68r
 WPG+8fBCmMCmpSsQ2PKikslv7gYu0fl7InEHu9cPX0NfBdf0hWNsaQZMtefnnkqcrWE+
 LVhPlje0+Dj0qj0oCLS9dmhT5qg2JePO344v+bGaTHbpKqWbViRESS0AfTkvRzWVhjN4
 TXe8lkdzZ+v9rcaWr1wZ4aDwVGiR/7LdF/CFU4ZnZwMLiXcsHTATlWVz0Gv6yf/AmuVU
 GiZw==
X-Gm-Message-State: AOAM533dqJhgXEtD3NGKL/F1603UUr3htiZeVw9v3DpWiAX/RHsrDRgR
 mntSIamMaenWRaopdjKvPAxXwfoP+ZPqWDtCbUr3pF/AjFLtF2P82xHSMlQkEyKFrlVYzyYgQbM
 cW9MraM6TTmMoUSYBIYIBUnlmFO8m
X-Received: by 2002:a05:6214:c2e:: with SMTP id
 a14mr1562956qvd.14.1642024041284; 
 Wed, 12 Jan 2022 13:47:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3mRQ9vVI8vjflxYjR1n/QwQtQX79mTUCQxP1DYsHekjXilqSOQQsfUrC8KDmIgaoDswj0Iw==
X-Received: by 2002:a05:6214:c2e:: with SMTP id
 a14mr1562925qvd.14.1642024040697; 
 Wed, 12 Jan 2022 13:47:20 -0800 (PST)
Received: from [192.168.8.138] (pool-98-118-105-43.bstnma.ftas.verizon.net.
 [98.118.105.43])
 by smtp.gmail.com with ESMTPSA id d15sm705041qtd.70.2022.01.12.13.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 13:47:20 -0800 (PST)
Message-ID: <4074c2ad21ebe692022d4e097209910e9f32383e.camel@redhat.com>
Subject: Re: [PATCH] WIP: drm/dp_mst: Add support for dumping topology ref
 histories from debugfs
From: Lyude Paul <lyude@redhat.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>
Date: Wed, 12 Jan 2022 16:47:19 -0500
In-Reply-To: <CO6PR12MB5489D4C51655B1D8B817A50FFC7B9@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20211102231502.286654-1-lyude@redhat.com>
 <CO6PR12MB54896F2BBF20F6C04D187D1AFC679@CO6PR12MB5489.namprd12.prod.outlook.com>
 <37497a7c6ce031bf4c99decdd4eecfacf95969b5.camel@redhat.com>
 <CO6PR12MB5489E282DA251241843EF4E4FC6F9@CO6PR12MB5489.namprd12.prod.outlook.com>
 <CO6PR12MB5489D4C51655B1D8B817A50FFC7B9@CO6PR12MB5489.namprd12.prod.outlook.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.2 (3.42.2-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(CC'ing this to dri-devel, since this is basically patch review)

Alright - so first off sorry about the broken debugging patch! I thought I had
tested that but I guess I hadn't tested it well enough, I'll get it fixed
asap, but feel free to try getting to it before I do.

As for this patch… (comments below)

On Mon, 2021-12-20 at 02:17 +0000, Lin, Wayne wrote:
> [AMD Official Use Only]
> 
> Hi Lyude,
> 
> No rush and thanks for your time! : )
> Just want to help clarify what I mean that "registering a callback function"
> for CSN of disconnecting
> stream sink device (not mst branch case). Attach below the tentative patch
> that I planned to do. Thanks so much!
> 
> Regards,
> Wayne
> ---
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 53 +++++++++++++++++++
>  drivers/gpu/drm/drm_dp_mst_topology.c         | 16 +++++-
>  include/drm/drm_dp_mst_helper.h               |  1 +
>  3 files changed, 68 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index cc34a35d0bcb..d7343c64908c 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -472,8 +472,61 @@ dm_dp_add_mst_connector(struct drm_dp_mst_topology_mgr
> *mgr,
>         return connector;
>  }
> 
> +void dm_dp_notify_csn_disconnection(struct drm_connector *connector)
> +{
> +       struct amdgpu_dm_connector *aconnector =
> +               to_amdgpu_dm_connector(connector);
> +       struct dc_sink *dc_sink = aconnector->dc_sink;
> +       struct dc_link *dc_link = aconnector->dc_link;
> +       struct amdgpu_device *adev = drm_to_adev(ddev);
> +
> +       ASSERT(dc_link);
> +
> +       if (dc_sink) {
> +               mutex_lock(&adev->dm.dc_lock);
> +
> +               /*clear the remote sink of the link*/
> +               dc_link_remove_remote_sink(dc_link, dc_sink);
> +               dc_sink_release(dc_sink);
> +               aconnector->dc_sink = NULL;
> +
> +               mutex_unlock(&adev->dm.dc_lock);
> +       }
> +}
> +
>  static const struct drm_dp_mst_topology_cbs dm_mst_cbs = {
>         .add_connector = dm_dp_add_mst_connector,
> +       .notify_csn_disconnection = dm_dp_notify_csn_disconnection,
>  };

I still don't really think this is a good idea. This seems like it's just
adding another hotplugging path to the code in order to avoid sending hotplugs
for non-endpoint devices. In addition to the drm_connector issues I mentioned
before, we also really need to stop doing any kind of payload maintence in
hotplugging paths. The reality is any kind of payload maintanence we do
outside of normal modesetting paths is a relic from legacy modesetting that
I'm dropping ASAP (more on this below), and we can't keep adding to it because
it dramatically complicates maintanence as well.

Sorry for repeating this point so often but - the biggest issue too is I'm
still not sure what it is we're even avoiding here. We know resources aren't
released consistently, and that we're able to reproduce the behavior with
repeated hotplugs. We also know that if we skip sending certain hotplug
events, that fixes the issue. And we know we can workaround it by adding a
special case for forcing a payload release in DC. But none of those actually
tell us exactly what piece of code is leaking and why, which means that any
workarounds we're putting in to avoid this mysterious guilty section of code
we don't entirely understand either - which means we're just adding more code
in that no one actually fully understands. This just ends up making maintence
difficult because every change in code nearby workarounds like this has to
strugle to try to figure out said workarounds in order to avoid breaking
things.

I'm actually currently running into these "later" issues right now, as
recently I've (-actively-, finally!!!) been working on trying to remove as
much non-atomic MST as I can because. As it turns out - a huge amount of the
payload maintanence code just isn't needed at all when we stop caring about
non-atomic drivers and stick everything in atomic state structs. Step 1 for
updating updating the payload table, e.g. drm_dp_update_payload_part1(), is a
great example of how messy things have become. Here's a small sample of some
of the stuff I've seen from just that one function so far that either just
don't make sense here or is totally redundant. I should note that a lot of
these things also come from patches I reviwed, but didn't really look at as
closely as I should have because I was swamped at work, some are historical
artifacts, and others are less-than-ideal patches I got wrote myself when I
was first started working on MST and didn't know the code as well as I do now:

 * We try to avoid some sort of userspace issue by using
   drm_dp_mst_port_downstream_of_branch() to avoid releasing payloads for a
   branch if we can't prove it's downstream of the top of the topology. This
   seems to workaround either a userspace bug. This is a redundant, since
   that's what topology refs are already supposed to be doing to the extent is
   reasonably possibly. It's also unfortunately racy solution because we have
   to be able to handle the situation where a connector is removed from under
   us. That can happen at any time, including _immediately_ after we call
   drm_dp_mst_port_downstream_of_branch() - rendering the call not really
   useful.
 * If we fail to validate the sink in drm_dp_update_payload_part, we don't
   update the payload table. I think at best this solution is racy and not
   useful, at worst it leaves us with a payload table that doesn't match what
   we attempted to set in the atomic state - which at worst brings us into
   undefined territory where we're just plain out of sync with the reality in
   hw.
 * Actually fun fact - mgr->payloads and mgr->proposed_vcpis both can and
   definitely should be removed entirely. All of the info for mgr->payloads
   could just be in the atomic state, because that + the magic of atomic state
   duplication means we'll also have an accurate view of the previous state's
   payload allocations: which renders mgr->proposed_vcpis redundant.

Apologies for the long explanation again, but I hope that explains my point
here a bit. I'm going to be trying to get to moving amdgpu's DSC code out of
amdgpu and into DRM helpers as well soon, so I'm really determined to clean
stuff up beforehand as every time I've done so it's become substantially
easier to make changes to this code. Things used to be even worse before I
started cleaning things up 2 or 3 years ago, where simple changes would end up
getting me stuck spending hours trying to dig through lockdep or memory
manegement issues. As well, I would be entirely unsurprised if bugs like this
very payload leak we're working on just disappear once we've gotten rid of all
the extraneous workarounds and state tracking here - especially with how many
special cases we have for maintaining the payload table right now. That's
certainly ended up being the case in the past with a number of other difficult
to track down issues I've dealt with in MST.

Anyhow. I've been way more productive this year then last because I had over a
month off work and am finally not super burnt out from my job, and so far I've
been making progress on the payload state cleanup far faster then I was last
year :). I think if you can't figure out where the leak is coming from even
once I get the debugging patches I mentioned fixed up, it might be a good idea
for us to try again after I've got some of this code cleaned up. I've got a
currently WIP branch here:

https://gitlab.freedesktop.org/lyudess/linux/-/commit/624dd68fa804e64b5b2060e4735d7317090692b5

> 
>  void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 857c5d15e81d..a70e26c5d084 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -2508,6 +2508,7 @@ drm_dp_mst_handle_conn_stat(struct drm_dp_mst_branch
> *mstb,
>         u8 new_pdt;
>         bool new_mcs;
>         bool dowork = false, create_connector = false;
> +       bool notify_unplug_event = false;
> 
>         port = drm_dp_get_port(mstb, conn_stat->port_number);
>         if (!port)
> @@ -2520,6 +2521,9 @@ drm_dp_mst_handle_conn_stat(struct drm_dp_mst_branch
> *mstb,
>                          * port, so just throw the port out and make sure we
>                          * reprobe the link address of it's parent MSTB
>                          */
> +                       /* should also consider notify_unplug_event here.
> +                        * but it's not a normal case for products in the
> market
> +                        */
>                         drm_dp_mst_topology_unlink_port(mgr, port);
>                         mstb->link_address_sent = false;
>                         dowork = true;
> @@ -2541,10 +2545,14 @@ drm_dp_mst_handle_conn_stat(struct drm_dp_mst_branch
> *mstb,
>         port->ddps = conn_stat->displayport_device_plug_status;
> 
>         if (old_ddps != port->ddps) {
> -               if (port->ddps && !port->input)
> +               if (port->ddps && !port->input) {
>                         drm_dp_send_enum_path_resources(mgr, mstb, port);
> -               else
> +               } else {
>                         port->full_pbn = 0;
> +                       if (port->connector &&
> +                               drm_dp_mst_is_end_device(port->pdt, port-
> >mcs))
> +                               notify_unplug_event = true;
> +               }
>         }
> 
>         new_pdt = port->input ? DP_PEER_DEVICE_NONE : conn_stat-
> >peer_device_type;
> @@ -2557,11 +2565,15 @@ drm_dp_mst_handle_conn_stat(struct drm_dp_mst_branch
> *mstb,
>                 dowork = false;
>         }
> 
> +       if (notify_unplug_event && mgr->cbs->notify_csn_disconnection)
> +               mgr->cbs->notify_csn_disconnection(port->connector);
> +
>         if (port->connector)
>                 drm_modeset_unlock(&mgr->base.lock);
>         else if (create_connector)
>                 drm_dp_mst_port_add_connector(mstb, port);
> 
> +
>  out:
>         drm_dp_mst_topology_put_port(port);
>         if (dowork)
> diff --git a/include/drm/drm_dp_mst_helper.h
> b/include/drm/drm_dp_mst_helper.h
> index 78044ac5b59b..ff9e47729841 100644
> --- a/include/drm/drm_dp_mst_helper.h
> +++ b/include/drm/drm_dp_mst_helper.h
> @@ -525,6 +525,7 @@ struct drm_dp_mst_topology_cbs {
>          * IRQ pulse handler.
>          */
>         void (*poll_hpd_irq)(struct drm_dp_mst_topology_mgr *mgr);
> +       void (*notify_csn_disconnection)(struct drm_connector *connector);
>  };
> 
>  #define DP_MAX_PAYLOAD (sizeof(unsigned long) * 8)
> --
> 2.31.0
> 
> > -----Original Message-----
> > From: Lin, Wayne
> > Sent: Wednesday, December 8, 2021 11:39 AM
> > To: 'Lyude Paul' <lyude@redhat.com>
> > Subject: RE: [PATCH] WIP: drm/dp_mst: Add support for dumping topology ref
> > histories from debugfs
> > 
> > No worries Lyude!
> > Thanks for keeping helping on this. Take your time : )
> > 
> > > -----Original Message-----
> > > From: Lyude Paul <lyude@redhat.com>
> > > Sent: Wednesday, December 8, 2021 7:05 AM
> > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > Subject: Re: [PATCH] WIP: drm/dp_mst: Add support for dumping topology
> > > ref histories from debugfs
> > > 
> > > Sorry! I will try to get to this tomorrow, if not then sometime this
> > > week.
> > > 
> > > On Tue, 2021-11-30 at 08:41 +0000, Lin, Wayne wrote:
> > > > [Public]
> > > > 
> > > > Hi Lyude,
> > > > 
> > > > Finally have some bandwidth to get back to this problem!
> > > > I roughly went through this patch and I'm just aware that we already
> > > > have such kind of convenient tool for a while.
> > > > I think it's definitely useful for us to track port/mstb reference
> > > > count issues and I'll start to embrace this feature for cleaning up
> > > > those issues. Thank you Lyude!
> > > > 
> > > > However, I think the issue that I was trying to fix is not related
> > > > to what you suggested:
> > > > " The idea here is that if stream resources aren't being released,
> > > > my guess would be that we're not dropping topology references for
> > > > the port which means the connector never goes away."
> > > > The issue I was trying to fix is about releasing
> > > > dc_link->remote_sinks while receiving a CSN message notifying the
> > > > connection status of a sst connector of a port changed from
> > > > connected to disconnected. Not the connection status changed of a mst
> > > > branch device.
> > > > e.g.
> > > > src - 1st_mstb - 2nd_mstb - sst_monitor => src - 1st_mstb
> > > > (disconnect) 2nd_mstb - sst_monitor
> > > > 
> > > > In above case, after receiving CSN, we will put topology references
> > > > of 2nd mstb and its port which is connected with the sst monitor. As
> > > > the result of that, we can call
> > > > drm_dp_delayed_destroy_port() to unregister and put the drm connector.
> > > > 
> > > > However, in below case:
> > > > e.g.
> > > > src - 1st_mstb - sst_monitor => src - 1st_mstb (disconnect)
> > > > sst_monitor
> > > > 
> > > > In this case, which is the case having problem, it definitely won't
> > > > decrease the topology references count of the port which was
> > > > connected to the sst monitor to zero since the port is still
> > > > existing in the topology. Same as the malloc reference since the
> > > > port can't get destroyed. Hence, the port still exists  and we won't
> > > > call
> > > > drm_dp_delayed_destroy_port() to unregister and put the drm connector.
> > > > I looked up the code and drm_dp_delayed_destroy_port() seems like
> > > > the only place to call drm_connector_put() which means we can't put
> > > > reference count of drm connector under this case and can't release
> > > > dc_sink resource by destroying drm connector.
> > > > 
> > > > I would also like to point out that this resource (remote_sinks) is
> > > > specific to different stream sinks. So if we're trying to release
> > > > this dc_sink resource by destroying the drm connector, it conflicts
> > > > the idea that you suggested before that we should always keep the
> > > > drm connector until it's no longer reachable in the topology.
> > > > Releasing dc_sink should be binding with the disconnection event.
> > > > 
> > > > I understand your concern that we should not just easily change the
> > > > logic here since it's the result after solving tons of bugs before
> > > > and might cause other side effect. So, just my 2 cents, what I'm
> > > > thinking is to register a callback function for our driver to notify
> > > > us that the remote sink is detached. This just aligns our flow
> > > > handling long HPD event of legacy (sst) DP.
> > > > For sst case, once we detect long HPD event indicating the monitor
> > > > is detached, we will immediately try to release the
> > > > dc_link->local_sink and fire hotplug event to upper layer. Same as
> > > > here, once receives a CSN message notifying a drm connector is
> > > > changed from connected to disconnected, trigger the callback
> > > > function and we can try to release the dc_sink resource.
> > > > 
> > > > Would like to know your thought and insight please : )
> > > > 
> > > > Btw, I got some errors and warnings while building and have some
> > > > code adjustments as below : ) Thank you Lyude for your always kindly
> > > > help!!
> > > > 
> > > > Regards,
> > > > Wayne
> > > > > -----Original Message-----
> > > > > From: Lyude Paul <lyude@redhat.com>
> > > > > Sent: Wednesday, November 3, 2021 7:15 AM
> > > > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > > > Subject: [PATCH] WIP: drm/dp_mst: Add support for dumping topology
> > > > > ref histories from debugfs
> > > > > 
> > > > > TODO:
> > > > > * Implement support for i915
> > > > > * Finish writing this commit message
> > > > > * ???
> > > > > * profit
> > > > > 
> > > > > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > > > > ---
> > > > > 
> > > > > Hey wayne! SO-hopefully if I did this correctly then this should
> > > > > just work on amdgpu. What this patch should do is add a debugfs
> > > > > file to amdgpu called "amdgpu_dp_mst_topology_refs", and when you
> > > > > read the file it should print out the topology reference history
> > > > > of every MSTB and Port in memory, along with how many times we've
> > > > > hit the codepath in each backtrace. An example:
> > > > > 
> > > > > Port DP-5 (0000000005c37748) topology ref history:
> > > > >   1 gets (last at    58.468973):
> > > > >      drm_dp_send_link_address+0x6a5/0xa00 [drm_kms_helper]
> > > > >      drm_dp_check_and_send_link_address+0xad/0xd0 [drm_kms_helper]
> > > > >      drm_dp_mst_link_probe_work+0x14e/0x1a0 [drm_kms_helper]
> > > > >      process_one_work+0x1e3/0x390
> > > > >      worker_thread+0x50/0x3a0
> > > > >      kthread+0x124/0x150
> > > > >      ret_from_fork+0x1f/0x30
> > > > >   1 puts (last at    58.469357):
> > > > >      drm_dp_mst_topology_put_port+0x6a/0x210 [drm_kms_helper]
> > > > >      drm_dp_send_link_address+0x39e/0xa00 [drm_kms_helper]
> > > > >      drm_dp_check_and_send_link_address+0xad/0xd0 [drm_kms_helper]
> > > > >      drm_dp_mst_link_probe_work+0x14e/0x1a0 [drm_kms_helper]
> > > > >      process_one_work+0x1e3/0x390
> > > > >      worker_thread+0x50/0x3a0
> > > > >      kthread+0x124/0x150
> > > > >      ret_from_fork+0x1f/0x30
> > > > > 
> > > > > The idea here is that if stream resources aren't being released,
> > > > > my guess would be that we're not dropping topology references for
> > > > > the port which means the connector never goes away. So, if that's
> > > > > really the case then once we unplug the offending connector we
> > > > > should be able to find a pair of gets/puts for the offending
> > > > > leaked connector where the get/put count doesn't match up. Also,
> > > > > if the frame count on the backtrace isn't long enough you can
> > > > > increase the value of STACK_DEPTH in
> > > > > drivers/gpu/drm/drm_dp_mst_topology.c and recompile to get more
> > > > > frames.
> > > > > 
> > > > > To enable this, first enable CONFIG_EXPERT for your kernel which
> > > > > will unhide CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS. Then just
> > > > > enable CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS, recompile, and it
> > > > > should be good to go.
> > > > > 
> > > > > Let me know if this works for you, and hopefully this should tell
> > > > > us exactly what the problem actually is here.
> > > > > 
> > > > >  .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |  35 ++++
> > > > >  drivers/gpu/drm/drm_dp_mst_topology.c         | 173
> > > > > ++++++++++++++----
> > > > >  drivers/gpu/drm/nouveau/nouveau_debugfs.c     |  35 ++++
> > > > >  include/drm/drm_dp_mst_helper.h               |  18 ++
> > > > >  4 files changed, 228 insertions(+), 33 deletions(-)
> > > > > 
> > > > > 
> > > > > diff --git
> > > > > a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> > > > > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> > > > > index 1a68a674913c..1a14732c52b4 100644
> > > > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> > > > > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> > > > > @@ -3063,6 +3063,37 @@ static int mst_topo_show(struct seq_file
> > > > > *m, void
> > > > > *unused)
> > > > >       return 0;
> > > > >  }
> > > > > 
> > > > > +#ifdef CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS
> > > > > +static int mst_topology_ref_dump_show(struct seq_file *m, void
> > > > > +*unused) {
> > > > > +     struct amdgpu_device *adev = (struct amdgpu_device
> > > > > +*)m->private;
> > > > > +     struct drm_device *dev = adev_to_drm(adev);
> > > > > +     struct drm_connector *connector;
> > > > > +     struct drm_connector_list_iter conn_iter;
> > > > > +     struct amdgpu_dm_connector *aconnector;
> > > > > +
> > > > > +     drm_connector_list_iter_begin(dev, &conn_iter);
> > > > > +     drm_for_each_connector_iter(connector, &conn_iter) {
> > > > > +             if (connector->connector_type !=
> > > > > DRM_MODE_CONNECTOR_DisplayPort)
> > > > > +                     continue;
> > > > > +
> > > > > +             aconnector = to_amdgpu_dm_connector(connector);
> > > > > +
> > > > > +             /* Ensure we're only dumping the topology of a root
> > > > > +mst node
> > > > > */
> > > > > +             if (!aconnector->mst_mgr.max_payloads)
> > > > > +                     continue;
> > > > > +
> > > > > +             seq_printf(m, "\nMST topology for connector %d\n",
> > > > > aconnector->connector_id);
> > > > > +             drm_dp_mst_dump_topology_refs(m,
> > > > > +&aconnector->mst_mgr);
> > > > > +     }
> > > > > +     drm_connector_list_iter_end(&conn_iter);
> > > > > +
> > > > > +     return 0;
> > > > > +}
> > > > > +
> > > > > +DEFINE_SHOW_ATTRIBUTE(mst_topology_ref_dump);
> > > > > +#endif
> > > > > +
> > > > >  /*
> > > > >   * Sets trigger hpd for MST topologies.
> > > > >   * All connected connectors will be rediscovered and re started
> > > > > as needed if val of 1 is sent.
> > > > > @@ -3299,6 +3330,10 @@ void dtn_debugfs_init(struct amdgpu_device
> > > > > *adev)
> > > > > 
> > > > >       debugfs_create_file("amdgpu_mst_topology", 0444, root,
> > > > >                           adev, &mst_topo_fops);
> > > > > +#ifdef CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS
> > > > > +     debugfs_create_file("amdgpu_dp_mst_topology_refs", 0444,
> > > > > +root, adev,
> > > > > +                         &mst_topology_ref_dump_fops); #endif
> > > > >       debugfs_create_file("amdgpu_dm_dtn_log", 0644, root, adev,
> > > > >                           &dtn_log_fops);
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > index 1aa8702383d4..0159828c494d 100644
> > > > > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > @@ -1366,23 +1366,6 @@ static int drm_dp_mst_wait_tx_reply(struct
> > > > > drm_dp_mst_branch *mstb,
> > > > >       return ret;
> > > > >  }
> > > > > 
> > > > > -static struct drm_dp_mst_branch *drm_dp_add_mst_branch_device(u8
> > > > > lct, u8
> > > > > *rad) -{
> > > > > -     struct drm_dp_mst_branch *mstb;
> > > > > -
> > > > > -     mstb = kzalloc(sizeof(*mstb), GFP_KERNEL);
> > > > > -     if (!mstb)
> > > > > -             return NULL;
> > > > > -
> > > > > -     mstb->lct = lct;
> > > > > -     if (lct > 1)
> > > > > -             memcpy(mstb->rad, rad, lct / 2);
> > > > > -     INIT_LIST_HEAD(&mstb->ports);
> > > > > -     kref_init(&mstb->topology_kref);
> > > > > -     kref_init(&mstb->malloc_kref);
> > > > > -     return mstb;
> > > > > -}
> > > > > -
> > > > >  static void drm_dp_free_mst_branch_device(struct kref *kref)  {
> > > > >       struct drm_dp_mst_branch *mstb = @@ -1642,12 +1625,20 @@
> > > > > topology_ref_type_to_str(enum drm_dp_mst_topology_ref_type type)
> > > > >               return "put";
> > > > >  }
> > > > > 
> > > > > +static const char *topology_ref_history_type_to_str(enum
> > > > > +drm_dp_mst_topology_history_type type) {
> > > > > +     if (type == DRM_DP_MST_TOPOLOGY_HISTORY_PORT)
> > > > > +             return "Port";
> > > > > +     else
> > > > > +             return "MSTB";
> > > > > +}
> > > > > +
> > > > >  static void
> > > > > -__dump_topology_ref_history(struct
> > > > > drm_dp_mst_topology_ref_history *history,
> > > > > -                         void *ptr, const char *type_str)
> > > > > +dump_topology_ref_history(struct drm_dp_mst_topology_ref_history
> > > > > +*history, struct drm_printer p)
> > > > >  {
> > > > > -     struct drm_printer p = drm_debug_printer(DBG_PREFIX);
> > > > > +     char *connector_name = NULL;
> > > > >       char *buf = kzalloc(PAGE_SIZE, GFP_KERNEL);
> > > > > +     void *ptr;
> > > > >       int i;
> > > > > 
> > > > >       if (!buf)
> > > > > @@ -1656,14 +1647,29 @@ __dump_topology_ref_history(struct
> > > > > drm_dp_mst_topology_ref_history *history,
> > > > >       if (!history->len)
> > > > >               goto out;
> > > > > 
> > > > > +     /* Get a pointer to the actual MSTB/port so we can the
> > > > > +memory
> > > > > address to the kernel log */
> > > > > +     if (history->type == DRM_DP_MST_TOPOLOGY_HISTORY_PORT)
> > > > > +             ptr = container_of(history, struct drm_dp_mst_port,
> > > > > topology_ref_history);
> > > > > +     else
> > > > > +             ptr = container_of(history, struct
> > > > > +drm_dp_mst_branch, topology_ref_history);
> > > > > +
> > > > >       /* First, sort the list so that it goes from oldest to
> > > > > newest
> > > > >        * reference entry
> > > > >        */
> > > > >       sort(history->entries, history->len,
> > > > > sizeof(*history->entries),
> > > > >            topology_ref_history_cmp, NULL);
> > > > > 
> > > > > -     drm_printf(&p, "%s (%p) topology count reached 0, dumping
> > > > > history:\n",
> > > > > -                type_str, ptr);
> > > > > +     if (history->type == DRM_DP_MST_TOPOLOGY_HISTORY_PORT) {
> > > > > +             struct drm_dp_mst_port *port = ptr;
> > > > > +
> > > > > +             if (port->connector)
> > > > > +                     connector_name = port->connector->name;
> > > > > +     }
> > > > > +     if (connector_name)
> > > > > +             drm_printf(&p, "Port %s (%p) topology ref
> > > > > +history:\n",
> > > > > connector_name, ptr);
> > > > > +     else
> > > > > +             drm_printf(&p, "%s (%p) topology ref history:\n",
> > > > > +
> > > > > +topology_ref_history_type_to_str(history->type),
> > > > > ptr);
> > > > > 
> > > > >       for (i = 0; i < history->len; i++) {
> > > > >               const struct drm_dp_mst_topology_ref_entry *entry =
> > > > > @@
> > > > > -
> > > > > 1682,24 +1688,92 @@ __dump_topology_ref_history(struct
> > > > > drm_dp_mst_topology_ref_history *history,
> > > > >                          ts_nsec, rem_nsec / 1000, buf);
> > > > >       }
> > > > > 
> > > > > -     /* Now free the history, since this is the only time we
> > > > > expose it */
> > > > > -     kfree(history->entries);
> > > > >  out:
> > > > >       kfree(buf);
> > > > >  }
> > > > > 
> > > > > +/**
> > > > > + * drm_dp_mst_dump_topology_refs - helper function for dumping
> > > > > +the topology ref history
> > > > > + * @m: File to print to
> > > > > + * @mgr: &struct drm_dp_mst_topology_mgr to use
> > > > > + *
> > > > > + * Prints the topology ref history of all ports and MSTBs on @mgr
> > > > > +that are still in memory,
> > > > > + * regardless of whether they're actually still reachable through
> > > > > +the topology or not. Only enabled
> > > > > + * when %CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is enabled. Can be
> > > > > +implemented by drivers to assist
> > > > > + * with debugging leaks in the DP MST helpers.
> > > > > + */
> > > > > +void drm_dp_mst_dump_topology_refs(struct seq_file *m, struct
> > > > > +drm_dp_mst_topology_mgr *mgr) {
> > > > > +     struct drm_dp_mst_topology_ref_history *history;
> > > > > +     struct drm_printer p = drm_seq_file_printer(m);
> > > > > +
> > > > > +     mutex_lock(&mgr->topology_ref_history_lock);
> > > > > +     list_for_each_entry(history,
> > > > > +&mgr->topology_ref_history_list,
> > > > > +node)
> > > > > +             dump_topology_ref_history(history, p);
> > > > > +     mutex_unlock(&mgr->topology_ref_history_lock);
> > > > > +}
> > > > > +EXPORT_SYMBOL(drm_dp_mst_dump_topology_refs);
> > > > > +
> > > > > +static void
> > > > > +__init_topology_ref_history(struct
> > > > > +drm_dp_mst_topology_ref_history
> > > > > *history,
> > > > > +                         struct drm_dp_mst_topology_mgr *mgr,
> > > > > +                         enum drm_dp_mst_topology_history_type
> > > > > +type) {
> > > > > +     history->type = type;
> > > > > +     INIT_LIST_HEAD(&history->node);
> > > > > +
> > > > > +     mutex_lock(&mgr->topology_ref_history_lock);
> > > > > +     list_add(&history->node, &mgr->topology_ref_history_list);
> > > > > +     mutex_unlock(&mgr->topology_ref_history_lock);
> > > > > +}
> > > > > +
> > > > > +static void
> > > > > +__destroy_topology_ref_history(struct
> > > > > +drm_dp_mst_topology_ref_history
> > > > > *history,
> > > > > +                            struct drm_dp_mst_topology_mgr *mgr)
> > > > > +{
> > > > > +     mutex_lock(&mgr->topology_ref_history_lock);
> > > > > +     list_del(&mgr->topology_ref_history_list);
> > > > > +     mutex_unlock(&mgr->topology_ref_history_lock);
> > > > > +
> > > > > +     kfree(history->entries);
> > > > > +}
> > > > > +
> > > > > +static __always_inline void
> > > > > +init_port_topology_history(struct drm_dp_mst_topology_mgr *mgr,
> > > > > +struct drm_dp_mst_port *port) {
> > > > > +     __init_topology_ref_history(&port->topology_ref_history,
> > > > > +mgr,
> > > > > +
> > > > > +DRM_DP_MST_TOPOLOGY_HISTORY_PORT);
> > > > > +}
> > > > > +
> > > > > +static __always_inline void
> > > > > +init_mstb_topology_history(struct drm_dp_mst_topology_mgr *mgr,
> > > > > +struct drm_dp_mst_branch *mstb) {
> > > > > +     __init_topology_ref_history(&mstb->topology_ref_history,
> > > > > +mgr,
> > > > > +
> > > > > +DRM_DP_MST_TOPOLOGY_HISTORY_MSTB);
> > > > > +}
> > > > > +
> > > > > +static __always_inline void
> > > > > +destroy_port_topology_history(struct drm_dp_mst_port *port) {
> > > > > +     __destroy_topology_ref_history(&port->topology_ref_history,
> > > > > +port->mgr); }
> > > > > +
> > > > > +static __always_inline void
> > > > > +destroy_mstb_topology_history(struct drm_dp_mst_branch *mstb) {
> > > > > +     __destroy_topology_ref_history(&mstb->topology_ref_history,
> > > > > +mstb->mgr); }
> > > > > +
> > > > >  static __always_inline void
> > > > >  dump_mstb_topology_history(struct drm_dp_mst_branch *mstb)  {
> > > > > -     __dump_topology_ref_history(&mstb->topology_ref_history,
> > > > > mstb,
> > > > > -                                 "MSTB");
> > > > > +     dump_topology_ref_history(&mstb->topology_ref_history,
> > > > > +drm_debug_printer(DBG_PREFIX));
> > > > >  }
> > > > > 
> > > > >  static __always_inline void
> > > > >  dump_port_topology_history(struct drm_dp_mst_port *port)  {
> > > > > -     __dump_topology_ref_history(&port->topology_ref_history,
> > > > > port,
> > > > > -                                 "Port");
> > > > > +     dump_topology_ref_history(&port->topology_ref_history,
> > > > > +drm_debug_printer(DBG_PREFIX));
> > > > >  }
> > > > > 
> > > > >  static __always_inline void
> > > > > @@ -1729,6 +1803,14 @@ topology_ref_history_unlock(struct
> > > > > drm_dp_mst_topology_mgr *mgr)  }  #else  static inline void
> > > > > +init_port_topology_history(struct drm_dp_mst_topology_mgr *mgr,
> > > > > +struct drm_dp_mst_port *port); static inline void
> > > > Should also add the bracket, otherwise will get warnings.
> > > > => static inline void init_port_topology_history(struct
> > > > drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_port *port) {};
> > > > 
> > > > > +init_mstb_topology_history(struct drm_dp_mst_topology_mgr *mgr,
> > > > > +struct drm_dp_mst_branch *mstb); static inline void
> > > > Same as above
> > > > => static inline void init_mstb_topology_history(struct
> > > > drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_branch *mstb) {};
> > > > 
> > > > > +destroy_port_topology_history(struct drm_dp_mst_topology_mgr
> > > > > +*mgr, struct drm_dp_mst_port *port); static inline void
> > > > destroy_port_topology_history() takes one parameter only which is
> > > > port.
> > > > => destroy_port_topology_history(struct drm_dp_mst_port *port) {};
> > > > 
> > > > > +destroy_mstb_topology_history(struct drm_dp_mst_topology_mgr
> > > > > +*mgr, struct drm_dp_mst_branch *mstb); static inline void
> > > > destroy_mstb_topology_history() takes one parameter only which is
> > > > mstb => destroy_mstb_topology_history(struct drm_dp_mst_branch
> > > > *mstb) {};
> > > > 
> > > > >  topology_ref_history_lock(struct drm_dp_mst_topology_mgr *mgr) {}
> > > > > static inline void  topology_ref_history_unlock(struct
> > > > > drm_dp_mst_topology_mgr *mgr) {} @@ -1740,6 +1822,25 @@
> > > > > dump_port_topology_history(struct drm_dp_mst_port *port) {}
> > > > > #define save_port_topology_ref(port, type)  #endif
> > > > > 
> > > > > +static struct drm_dp_mst_branch *
> > > > > +drm_dp_add_mst_branch_device(struct drm_dp_mst_topology_mgr *mgr,
> > > > > +u8 lct, u8 *rad) {
> > > > > +     struct drm_dp_mst_branch *mstb;
> > > > > +
> > > > > +     mstb = kzalloc(sizeof(*mstb), GFP_KERNEL);
> > > > > +     if (!mstb)
> > > > > +             return NULL;
> > > > > +
> > > > > +     mstb->lct = lct;
> > > > > +     if (lct > 1)
> > > > > +             memcpy(mstb->rad, rad, lct / 2);
> > > > > +     INIT_LIST_HEAD(&mstb->ports);
> > > > > +     kref_init(&mstb->topology_kref);
> > > > > +     kref_init(&mstb->malloc_kref);
> > > > > +     init_mstb_topology_history(mgr, mstb);
> > > > > +     return mstb;
> > > > > +}
> > > > > +
> > > > >  static void drm_dp_destroy_mst_branch_device(struct kref *kref)
> > > > > {
> > > > >       struct drm_dp_mst_branch *mstb = @@ -1747,6 +1848,7 @@
> > > > > static void drm_dp_destroy_mst_branch_device(struct
> > > > > kref *kref)
> > > > >       struct drm_dp_mst_topology_mgr *mgr = mstb->mgr;
> > > > > 
> > > > >       dump_mstb_topology_history(mstb);
> > > > > +     destroy_mstb_topology_history(mstb);
> > > > > 
> > > > >       INIT_LIST_HEAD(&mstb->destroy_next);
> > > > > 
> > > > > @@ -1856,6 +1958,7 @@ static void drm_dp_destroy_port(struct kref
> > > > > *kref)
> > > > >       struct drm_dp_mst_topology_mgr *mgr = port->mgr;
> > > > > 
> > > > >       dump_port_topology_history(port);
> > > > > +     destroy_port_topology_history(port);
> > > > > 
> > > > >       /* There's nothing that needs locking to destroy an input
> > > > > port yet */
> > > > >       if (port->input) {
> > > > > @@ -2135,7 +2238,7 @@ drm_dp_port_set_pdt(struct drm_dp_mst_port
> > > > > *port, u8 new_pdt,
> > > > >                       ret = drm_dp_mst_register_i2c_bus(port);
> > > > >               } else {
> > > > >                       lct = drm_dp_calculate_rad(port, rad);
> > > > > -                     mstb = drm_dp_add_mst_branch_device(lct,
> > > > > rad);
> > > > > +                     mstb = drm_dp_add_mst_branch_device(mgr,
> > > > > +lct, rad);
> > > > >                       if (!mstb) {
> > > > >                               ret = -ENOMEM;
> > > > >                               drm_err(mgr->dev, "Failed to create
> > > > > MSTB for port %p", port); @@ -2366,6 +2469,8 @@
> > > > > drm_dp_mst_add_port(struct drm_device *dev,
> > > > >        */
> > > > >       drm_dp_mst_get_mstb_malloc(mstb);
> > > > > 
> > > > > +     init_port_topology_history(mgr, port);
> > > > > +
> > > > >       return port;
> > > > >  }
> > > > > 
> > > > > @@ -3745,7 +3850,7 @@ int drm_dp_mst_topology_mgr_set_mst(struct
> > > > > drm_dp_mst_topology_mgr *mgr, bool ms
> > > > >               }
> > > > > 
> > > > >               /* add initial branch device at LCT 1 */
> > > > > -             mstb = drm_dp_add_mst_branch_device(1, NULL);
> > > > > +             mstb = drm_dp_add_mst_branch_device(mgr, 1, NULL);
> > > > >               if (mstb == NULL) {
> > > > >                       ret = -ENOMEM;
> > > > >                       goto out_unlock; @@ -5512,14 +5617,16 @@ int
> > > > > drm_dp_mst_topology_mgr_init(struct
> > > > > drm_dp_mst_topology_mgr *mgr,
> > > > >       mutex_init(&mgr->delayed_destroy_lock);
> > > > >       mutex_init(&mgr->up_req_lock);
> > > > >       mutex_init(&mgr->probe_lock); -#if
> > > > > IS_ENABLED(CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS)
> > > > > -     mutex_init(&mgr->topology_ref_history_lock);
> > > > > -#endif
> > > > >       INIT_LIST_HEAD(&mgr->tx_msg_downq);
> > > > >       INIT_LIST_HEAD(&mgr->destroy_port_list);
> > > > >       INIT_LIST_HEAD(&mgr->destroy_branch_device_list);
> > > > >       INIT_LIST_HEAD(&mgr->up_req_list);
> > > > > 
> > > > > +#if IS_ENABLED(CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS)
> > > > > +     mutex_init(&mgr->topology_ref_history_lock);
> > > > > +     INIT_LIST_HEAD(&mgr->topology_ref_history_list);
> > > > > +#endif
> > > > > +
> > > > >       /*
> > > > >        * delayed_destroy_work will be queued on a dedicated WQ, so
> > > > > that any
> > > > >        * requeuing will be also flushed when deiniting the
> > > > > topology manager.
> > > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> > > > > b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> > > > > index 1cbe01048b93..53ec7c1daada 100644
> > > > > --- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> > > > > +++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> > > > > @@ -29,9 +29,13 @@
> > > > >   */
> > > > > 
> > > > >  #include <linux/debugfs.h>
> > > > > +#include <drm/drm_dp_mst_helper.h> #include <drm/drm_encoder.h>
> > > > >  #include <nvif/class.h>
> > > > >  #include <nvif/if0001.h>
> > > > > +#include <nouveau_encoder.h>
> > > > >  #include "nouveau_debugfs.h"
> > > > > +#include "nouveau_display.h"
> > > > >  #include "nouveau_drv.h"
> > > > > 
> > > > >  static int
> > > > > @@ -68,6 +72,34 @@ nouveau_debugfs_strap_peek(struct seq_file *m,
> > > > > void
> > > > > *data)
> > > > >       return 0;
> > > > >  }
> > > > > 
> > > > > +#ifdef CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS
> > > > > +static int nouveau_debugfs_mst_topology_history(struct seq_file
> > > > > +*m, void *data) {
> > > > > +     struct drm_info_node *node = m->private;
> > > > > +     struct drm_device *dev = node->minor->dev;
> > > > > +     struct drm_encoder *encoder;
> > > > > +     struct nouveau_display *disp = nouveau_display(dev);
> > > > > +
> > > > > +     if (disp->disp.object.oclass < GF110_DISP)
> > > > > +             return -EINVAL;
> > > > > +
> > > > > +     drm_for_each_encoder(encoder, dev) {
> > > > > +             struct nv50_mstm *mstm;
> > > > > +
> > > > > +             /* We need the real encoder for each MST mgr */
> > > > > +             if (encoder->encoder_type != DRM_MODE_ENCODER_TMDS)
> > > > > +                     continue;
> > > > > +             mstm = nouveau_encoder(encoder)->dp.mstm;
> > > > > +             if (!mstm)
> > > > > +                     continue;
> > > > > +
> > > > > +             seq_printf(m, "MSTM on %s:\n", encoder->name);
> > > > > +             drm_dp_mst_dump_topology_refs(m, &mstm->mgr);
> > > > > +     }
> > > > > +     return 0;
> > > > > +}
> > > > > +#endif
> > > > > +
> > > > >  static int
> > > > >  nouveau_debugfs_pstate_get(struct seq_file *m, void *data)  { @@
> > > > > -213,6
> > > > > +245,9 @@ static const struct file_operations
> > > > > nouveau_pstate_fops = {  static struct drm_info_list
> > > > > nouveau_debugfs_list[] = {
> > > > >       { "vbios.rom",  nouveau_debugfs_vbios_image, 0, NULL },
> > > > >       { "strap_peek", nouveau_debugfs_strap_peek, 0, NULL },
> > > > > +#ifdef CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS
> > > > > +     { "dp_mst_topology_refs",
> > > > > +nouveau_debugfs_mst_topology_history, 0, NULL }, #endif
> > > > >  };
> > > > >  #define NOUVEAU_DEBUGFS_ENTRIES ARRAY_SIZE(nouveau_debugfs_list)
> > > > > 
> > > > > diff --git a/include/drm/drm_dp_mst_helper.h
> > > > > b/include/drm/drm_dp_mst_helper.h index 78044ac5b59b..e3a73d8d97c0
> > > > > 100644
> > > > > --- a/include/drm/drm_dp_mst_helper.h
> > > > > +++ b/include/drm/drm_dp_mst_helper.h
> > > > > @@ -35,6 +35,11 @@ enum drm_dp_mst_topology_ref_type {
> > > > >       DRM_DP_MST_TOPOLOGY_REF_PUT,
> > > > >  };
> > > > > 
> > > > > +enum drm_dp_mst_topology_history_type {
> > > > > +     DRM_DP_MST_TOPOLOGY_HISTORY_PORT,
> > > > > +     DRM_DP_MST_TOPOLOGY_HISTORY_MSTB, };
> > > > > +
> > > > >  struct drm_dp_mst_topology_ref_history {
> > > > >       struct drm_dp_mst_topology_ref_entry {
> > > > >               enum drm_dp_mst_topology_ref_type type; @@ -43,6
> > > > > +48,9 @@ struct drm_dp_mst_topology_ref_history {
> > > > >               depot_stack_handle_t backtrace;
> > > > >       } *entries;
> > > > >       int len;
> > > > > +
> > > > > +     enum drm_dp_mst_topology_history_type type;
> > > > > +     struct list_head node;
> > > > >  };
> > > > >  #endif /* IS_ENABLED(CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS) */
> > > > > 
> > > > > @@ -769,6 +777,12 @@ struct drm_dp_mst_topology_mgr {
> > > > >        * &drm_dp_mst_branch.topology_ref_history.
> > > > >        */
> > > > >       struct mutex topology_ref_history_lock;
> > > > > +
> > > > > +     /**
> > > > > +      * @topology_ref_history_list: contains a list of topology
> > > > > +ref
> > > > > histories for any MSTBs or
> > > > > +      * ports that are still in memory
> > > > > +      */
> > > > > +     struct list_head topology_ref_history_list;
> > > > >  #endif
> > > > >  };
> > > > > 
> > > > > @@ -873,6 +887,10 @@ void drm_dp_mst_put_port_malloc(struct
> > > > > drm_dp_mst_port *port);
> > > > > 
> > > > >  struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct
> > > > > drm_dp_mst_port *port);
> > > > > 
> > > > > +#ifdef CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS
> > > > > +void drm_dp_mst_dump_topology_refs(struct seq_file *m, struct
> > > > > +drm_dp_mst_topology_mgr *mgr); #endif
> > > > > +
> > > > >  extern const struct drm_private_state_funcs
> > > > > drm_dp_mst_topology_state_funcs;
> > > > > 
> > > > >  /**
> > > > > --
> > > > > 2.31.1
> > > > 
> > > 
> > > --
> > > Cheers,
> > >  Lyude Paul (she/her)
> > >  Software Engineer at Red Hat
> 

-- 
Cheers, Lyude Paul (she/her) Software Engineer at Red Hat

