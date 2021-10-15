Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C09DF42FCC3
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 22:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51FEB6E3B2;
	Fri, 15 Oct 2021 20:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4313A6E3B2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 20:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634328268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XQYGQgJLmprZZplQ2mb6rTHEMIyDSsn3oC/c17JJjpY=;
 b=JJJ2Qmsvls2oJehObrD5Nbl6UlBXX4rT/uyoKgj8sZTj9Co7a475aoSKdxw17a+QzFDbp/
 seNc8fZFAZHDr5VAxqDiNUtzVi7SAiYPF34V5pECf8B63x+6bV/p2GlDIDCJSuEPXx2uyx
 jTk0G5SLoH1KngxUc8Wldm09bD96cB4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-nnQEeCMgOs6YJrB67GOvkw-1; Fri, 15 Oct 2021 16:04:26 -0400
X-MC-Unique: nnQEeCMgOs6YJrB67GOvkw-1
Received: by mail-qt1-f197.google.com with SMTP id
 13-20020ac8560d000000b0029f69548889so7442874qtr.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 13:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=XQYGQgJLmprZZplQ2mb6rTHEMIyDSsn3oC/c17JJjpY=;
 b=WehsSowvO4AXjd2yINlunhJbREGh3grT4l/iUJJVHVrBTL52Pxe8z374mTR1AWkdYx
 85sL83O7xVHjbP4prSOshwBn6b+gOg7VpgYyKN7lHP9uY9HLZ9Xq4IWM0iiYb4rBGPza
 a/9NwfT3mJsI8VLaMkYVpfx1YoKJQLfVA5KTpWFHaZMUuO6yEgFQles5sWAr8V7qWfGb
 Tquo16lEef08lJbCHFjcqiKNDDyr1vNn7qplwFzZDR2Oq3ozbISWnMeSbZit8a8/1PNJ
 jOL6sqrT7psFIROjf/v4haUq711wcrGWXjkCvvR6UnWi84LWgY0+Bd5ZzeyxDoW2xFUw
 VxhA==
X-Gm-Message-State: AOAM53371uXOkgBXO8ML59zS+0/1pg5WH3qikbFzcfNcCzu2XfSBC448
 vddE3uqZXykihP2RbeQ1ud7amkQZnP+MA56vcfBLuj6oR7RXGOXAlnddnqXn24NnNg3pPM2pV7/
 ApIciaQGuwvnXyyE4dzFsOgyxH7PF
X-Received: by 2002:a05:622a:1051:: with SMTP id
 f17mr15391278qte.65.1634328266099; 
 Fri, 15 Oct 2021 13:04:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFQkQx4zVujDp0NTBQ//6q9zcAoGdUt8d27Ls3++C2ToSHoEIcZVl29b2dUFT3hd3zG+y+Hw==
X-Received: by 2002:a05:622a:1051:: with SMTP id
 f17mr15391246qte.65.1634328265862; 
 Fri, 15 Oct 2021 13:04:25 -0700 (PDT)
Received: from [192.168.8.206] (pool-96-230-249-157.bstnma.fios.verizon.net.
 [96.230.249.157])
 by smtp.gmail.com with ESMTPSA id l4sm3018663qke.107.2021.10.15.13.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 13:04:25 -0700 (PDT)
Message-ID: <57b116bf5d90459fac4ce605aeab9b25afca92e6.camel@redhat.com>
Subject: Re: [PATCH] drm: Update MST First Link Slot Information Based on
 Encoding Format
From: Lyude Paul <lyude@redhat.com>
To: Bhawanpreet Lakha <Bhawanpreet.lakha@amd.com>, Jerry.Zuo@amd.com, 
 dri-devel@lists.freedesktop.org
Cc: Harry.Wentland@amd.com, Wayne.Lin@amd.com, Nicholas.Kazlauskas@amd.com
Date: Fri, 15 Oct 2021 16:04:24 -0400
In-Reply-To: <d9a43511-3435-0efc-d8a2-24c035b0ec74@amd.com>
References: <5e463fbc3d633eea1078e838ba5be0065ffbeb1e.camel@redhat.com>
 <20211012215848.1507023-1-Bhawanpreet.Lakha@amd.com>
 <3fbf786ee687e57cab02d71c745d01fb39819cba.camel@redhat.com>
 <d9a43511-3435-0efc-d8a2-24c035b0ec74@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[snip]

On Thu, 2021-10-14 at 16:21 -0400, Bhawanpreet Lakha wrote:
> 
> Thanks for the response,
> 
> That function is per port (drm_dp_atomic_find_vcpi_slots) so not sure 
> how that will work, maybe I don't understand what you mean?

Yeah - drm_dp_atomic_find_vcpi_slots() is just one part of the atomic helpers
though, we can always add more. JFYI, the main atomic check function for MST
is drm_dp_mst_atomic_check(). So we'd probably just want to add something into
drm_dp_mst_topology_state that handles making sure we go through
drm_dp_vcpi_allocation struct and recalculates everything in it. We might also
want to add an atomic helper to set the new starting slot and slot count in
the atomic state, then go through the current atomic topology state and ensure
that we add any CRTCs that would need full modesets as a result of that info
changing.

> 
> Also we only need to check this inside 
> drm_dp_mst_atomic_check_vcpi_alloc_limit(), which doesn't have a state, 
> so we still need to have this on the mgr somehow.

It does, we pass drm_dp_mst_topology_state to it. So we could just add these
fields there.

> 
> I was thinking we could add the slots(or some DP version indicator) 
> inside the drm_connector, and add a parameter to 
> drm_dp_mst_atomic_check_vcpi_alloc_limit(int slots) and call it with 
> this info via drm_dp_mst_atomic_check().

So before I continue: I should note that some of the code in MST goes against
what I'm about to say, in particular a lot of the payload updating functions
in MST that keep their payload state outside of drm_dp_mst_topology_state and
friends, but that's because some of this code is old and needs to be updated
anyway (and some of it was actually just being kept around because we were
worried about breaking radeon.ko, the only driver relying on behavior from the
non-atomic paths in our topology helper). Also - I'm not sure what your prior
experience is with modesetting in the linux kernel so my apologies if I'm
explaining anything you already understand here.

Anyway-drm_connector wouldn't be the right place to put it because it's not
part of the atomic state. The reason we have atomic modesetting in the first
place is so that we can come up with a new display state, and then have the
kernel verify the configurations in that new state and potentially reject it
if we tried to program something that wouldn't have worked in hardware. As
well, having it in drm_connector would mean that it wouldn't be safe to access
unless we've somehow locked the drm_connector. drm_connector_state would be
'safe' to have this data in, but considering that we already have a private
atomic state object for MST (drm_dp_mst_topology_state) it doesn't make much
sense to keep MST info elsewhere.

> 
> 
> Bhawan
> 
> > 
> > >                  ret = drm_dp_mst_atomic_check_mstb_bw_limit(mgr-
> > > > mst_primary,
> > >                                                              mst_state);
> > >                  mutex_unlock(&mgr->lock);
> > > @@ -5527,11 +5543,16 @@ int drm_dp_mst_topology_mgr_init(struct
> > > drm_dp_mst_topology_mgr *mgr,
> > >          if (!mgr->proposed_vcpis)
> > >                  return -ENOMEM;
> > >          set_bit(0, &mgr->payload_mask);
> > > +       mgr->total_avail_slots = 63;
> > > +       mgr->start_slot = 1;
> > >   
> > >          mst_state = kzalloc(sizeof(*mst_state), GFP_KERNEL);
> > >          if (mst_state == NULL)
> > >                  return -ENOMEM;
> > >   
> > > +       mst_state->total_avail_slots = 63;
> > > +       mst_state->start_slot = 1;
> > > +
> > >          mst_state->mgr = mgr;
> > >          INIT_LIST_HEAD(&mst_state->vcpis);
> > >   
> > > diff --git a/include/drm/drm_dp_mst_helper.h
> > > b/include/drm/drm_dp_mst_helper.h
> > > index ddb9231d0309..f8152dfb34ed 100644
> > > --- a/include/drm/drm_dp_mst_helper.h
> > > +++ b/include/drm/drm_dp_mst_helper.h
> > > @@ -554,6 +554,8 @@ struct drm_dp_mst_topology_state {
> > >          struct drm_private_state base;
> > >          struct list_head vcpis;
> > >          struct drm_dp_mst_topology_mgr *mgr;
> > > +       u8 total_avail_slots;
> > > +       u8 start_slot;
> > >   };
> > >   
> > >   #define to_dp_mst_topology_mgr(x) container_of(x, struct
> > > drm_dp_mst_topology_mgr, base)
> > > @@ -661,6 +663,16 @@ struct drm_dp_mst_topology_mgr {
> > >           */
> > >          int pbn_div;
> > >   
> > > +       /**
> > > +        * @total_avail_slots: 63 for 8b/10b, 64 for 128/132b
> > > +        */
> > > +       u8 total_avail_slots;
> > > +
> > > +       /**
> > > +        * @start_slot: 1 for 8b/10b, 0 for 128/132b
> > > +        */
> > > +       u8 start_slot;
> > > +
> > >          /**
> > >           * @funcs: Atomic helper callbacks
> > >           */
> > > @@ -806,6 +818,7 @@ int drm_dp_mst_get_vcpi_slots(struct
> > > drm_dp_mst_topology_mgr *mgr, struct drm_dp
> > >   
> > >   void drm_dp_mst_reset_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr,
> > > struct drm_dp_mst_port *port);
> > >   
> > > +void drm_dp_mst_update_coding_cap(struct drm_dp_mst_topology_state
> > > *mst_state, uint8_t link_coding_cap);
> > >   
> > >   void drm_dp_mst_deallocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
> > >                                  struct drm_dp_mst_port *port);
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

