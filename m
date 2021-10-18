Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C835432A3E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 01:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A75289FCE;
	Mon, 18 Oct 2021 23:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3632989FCE
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 23:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634599051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r6O201+PGsTj40DOrJ6oamuz7dYbwSAyuMIwOgYDRsk=;
 b=YVgbDueeMO6Omb6JRdPeJUafgBzyqvD7Fh3OrvHi4ciRuZ9XZFTQffLSttWwhuby/+xMoX
 zXjACanC6f8sq69bht8IrirbL9+HWf+xD5MNfiCRYjRTL6Y5iEwrQfxU+osWf7wK8EpbLf
 NIe2lIR5Tb0Zucj8JgjC/e7lpkx52q4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-IEVyTA2FOEeCoykTxgX0YQ-1; Mon, 18 Oct 2021 19:17:29 -0400
X-MC-Unique: IEVyTA2FOEeCoykTxgX0YQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 v14-20020a05620a0f0e00b0043355ed67d1so13410865qkl.7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 16:17:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=r6O201+PGsTj40DOrJ6oamuz7dYbwSAyuMIwOgYDRsk=;
 b=BbGcUDtcn1oiOAZMLHjXZuNPxeFJkgFy/s1US6I0q90DAivXxuZk6dsIeH4K7ELy1u
 /ZnaCfAvmMmqM8qPupQ6DWhVVEVOnvC83eGitpkH21X5jeOrJIMo+L/JGf48zP86cn+i
 JPFNsSmtW6E55do7qNMWNIFNlCHNyCyBMEBmL8uFaJE/VN+IlWOGHFy5YQKPxu/YUrBk
 e7PycIbc/7I+isLxG/8DwQ7qHrR/Xla05TYoaITD/o2GszX3g2pBWTtlhCykV0osR7Uv
 a1U9d3ATOl/1B1bXMPm1zWofmzSPEqzlyi+t8TgLVE2u+G6l7Jl95yrm7wcnzGZrkyBG
 RYgA==
X-Gm-Message-State: AOAM533QNGp3sWpNdqjJXNHp7wTm0AY0i0i3V9Hy6fzSYq9k89m3dBum
 fE34c1d/OwMwJDWYqZOj+2fVQWO90SVpezVD9qWA4+8J8S1df5wbSf7UzLNGu3tM69WUMo+meMV
 XgXK0HpooaVVVN/8hWwsMTazXoQy6
X-Received: by 2002:a05:622a:1911:: with SMTP id
 w17mr21216042qtc.382.1634599049365; 
 Mon, 18 Oct 2021 16:17:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSujWG1YNo00lzzeNj8depgJNO7RhUo2p28NGi1US2f92DiN1vNIzJv04zHcl+SCNhGbzu0A==
X-Received: by 2002:a05:622a:1911:: with SMTP id
 w17mr21216011qtc.382.1634599049038; 
 Mon, 18 Oct 2021 16:17:29 -0700 (PDT)
Received: from [192.168.8.206] (pool-96-230-249-157.bstnma.fios.verizon.net.
 [96.230.249.157])
 by smtp.gmail.com with ESMTPSA id u185sm7138412qkd.48.2021.10.18.16.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 16:17:28 -0700 (PDT)
Message-ID: <71f2b3bd6c43789f9821a6e815b94a3882c3a2c4.camel@redhat.com>
Subject: Re: [PATCH] drm: Update MST First Link Slot Information Based on
 Encoding Format
From: Lyude Paul <lyude@redhat.com>
To: Bhawanpreet Lakha <Bhawanpreet.lakha@amd.com>, Jerry.Zuo@amd.com, 
 dri-devel@lists.freedesktop.org
Cc: Harry.Wentland@amd.com, Wayne.Lin@amd.com, Nicholas.Kazlauskas@amd.com, 
 "Lipski, Mikita" <Mikita.Lipski@amd.com>
Date: Mon, 18 Oct 2021 19:17:26 -0400
In-Reply-To: <7e2abaa7-ca3a-6da9-6e43-772ce287f674@amd.com>
References: <5e463fbc3d633eea1078e838ba5be0065ffbeb1e.camel@redhat.com>
 <20211012215848.1507023-1-Bhawanpreet.Lakha@amd.com>
 <3fbf786ee687e57cab02d71c745d01fb39819cba.camel@redhat.com>
 <8fb410e5-3b47-d0a7-6d73-3b6692429e10@amd.com>
 <2a71120b01c96c942cdaba4ad6c0a0bbbd2d91e2.camel@redhat.com>
 <7e2abaa7-ca3a-6da9-6e43-772ce287f674@amd.com>
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

First off, sidenote: I wonder if we even need total_avail_slots and
could just use start_slot. Anyway, more productive comments below:

On Mon, 2021-10-18 at 15:47 -0400, Bhawanpreet Lakha wrote:
> I understand the mst_state argument its just that most of the mst
> functions are using mst_mgr/port structs and there is no easy way to
> extract the mst_state using mgr/port in these places
> (drm_dp_update_payload_part1, drm_dp_mst_allocate_vcpi, drm_dp_init_vcpi
> etc) where we need the slot info.
>
Ahh, I see why this might be confusing. I think surprisingly though,
this actually should probably be OK. Mostly, two of these functions
don't actually need the slot count and one I think I have a workaround
for:

* drm_dp_init_vcpi() - This function does use the total slot count here:

    if (slots > 63)
            return -ENOSPC;

  However, drm_dp_init_vcpi() assigns the current payload which means
  it's called by the driver at commit time, not atomic check time. Since
  atomic commits are only allowed to happen after we've successfully
  tested the state in question, we aren't allowed to fail them in the
  middle of a commit - which is definitely what we're doing in
  drm_dp_init_vcpi(). So, I'd actually say we should either totally
  ignore this bit of drm_dp_init_vcpi() or preferably, just entirely
  drop it in a prerequisite patch.
  (If you aren't familiar with atomic modesetting, the reason we "can't"
  just fail in the middle of committing a new atomic state is because we
  may very well have already committed that state to hardware partially.
  So, there's no nice way of aborting at that point without seriously
  complicating things - hence the need for having an atomic check before
  commits)

* drm_dp_mst_allocate_vcpi() - this seems to only be an issue because of
  drm_dp_init_vcpi(), and we additionally print the maximum number of
  slots in a drm_dbg_kms() message:

    drm_dbg_kms(mgr->dev, "failed to init vcpi slots=%d max=63 ret=%d\n",
                …

  Since we should have already decided
  all of the new payloads by the time we're in drm_dp_mst_allocate_vcpi
  (again, since we're in atomic commit), that's probably not the best
  place for us to print that anyway. So, I think we'd be fine just
  dropping the "max=63" from that string.

* drm_dp_update_payload_part1() - This one does need the current slot
  count, you're right. I would normally say we should just fix this
  function and move the payload info over to the atomic state, which is
  the eventual plan, but doing that would require dealing with the
  radeon.ko MST mess which is probably too much to ask for with
  something as simple as this patch. I think I know a workaround though:
  Let's keep this new slot info (e.g. num_slots, and possibly
  total_avail_slots if we keep that) in the MST atomic state, _but_ as a
  temporary solution we can instead add a start_slot argument to
  drm_dp_update_payload_part1(). That way we have an easy solution for
  making sure radeon still compiles, and atomic drivers can just extract
  the start_slot info themselves from the topology state and pass it
  into drm_dp_update_payload_part1(). Then I can get rid of that
  start_slots argument at a later date when I've started moving all of
  the payload info for MST into the atomic state.
  If we do this solution though, we should definitely document in the
  patch and in the kdocs for drm_dp_update_payload_part1() that passing
  the start slot is a temporary workaround for non-atomic drivers, and
  will be removed when non-atomic portions of the MST helpers have been
  moved out of helpers and into atomic state.

Does this sound good? There's a lot of moving pieces here so hopefully I
didn't miss anything

> So either we need to keep a copy of the slots in the mgr because that's
> what most of the code is using right now or pass around the atomic state
> to get the mgr->state mapping. (I don't have much experience with the
> mst code so maybe I am missing some key detail here?)

Worst case scenario, if there was something I missed that implies we DO
need access to a mgr->state mapping, I might be OK with us using that in
the interim for these patches. I don't think we need that quite yet as
far as I can tell though.

>
>
> Thanks,
>
> Bhawan
>
>
> On 2021-10-15 4:41 p.m., Lyude Paul wrote:
> > [more snip]
> >
> > On Fri, 2021-10-15 at 15:43 -0400, Bhawanpreet Lakha wrote:
> > > Thanks for the response,
> > >
> > > That function is per port so not sure how that will work. Also we only
> > > need to check this inside drm_dp_mst_atomic_check_vcpi_alloc_limit(),
> > > which doesn't have a state.
> > >
> > > We could add the slots(or some DP version indicator) inside the
> > > drm_connector, and add a parameter to
> > > drm_dp_mst_atomic_check_vcpi_alloc_limit(int slots)? and call it with
> > > this info via drm_dp_mst_atomic_check() and then update the mgr->slot in
> > > commit.
> > TBH - I think we can actually just get away with having all of this info
> > in
> > drm_dp_mst_topology_state
> >
> > >
> > > Bhawan
> > >
> > > > >                   ret = drm_dp_mst_atomic_check_mstb_bw_limit(mgr-
> > > > > > mst_primary,
> > > > >                                                              
> > > > > mst_state);
> > > > >                   mutex_unlock(&mgr->lock);
> > > > > @@ -5527,11 +5543,16 @@ int drm_dp_mst_topology_mgr_init(struct
> > > > > drm_dp_mst_topology_mgr *mgr,
> > > > >           if (!mgr->proposed_vcpis)
> > > > >                   return -ENOMEM;
> > > > >           set_bit(0, &mgr->payload_mask);
> > > > > +       mgr->total_avail_slots = 63;
> > > > > +       mgr->start_slot = 1;
> > > > >   
> > > > >           mst_state = kzalloc(sizeof(*mst_state), GFP_KERNEL);
> > > > >           if (mst_state == NULL)
> > > > >                   return -ENOMEM;
> > > > >   
> > > > > +       mst_state->total_avail_slots = 63;
> > > > > +       mst_state->start_slot = 1;
> > > > > +
> > > > >           mst_state->mgr = mgr;
> > > > >           INIT_LIST_HEAD(&mst_state->vcpis);
> > > > >   
> > > > > diff --git a/include/drm/drm_dp_mst_helper.h
> > > > > b/include/drm/drm_dp_mst_helper.h
> > > > > index ddb9231d0309..f8152dfb34ed 100644
> > > > > --- a/include/drm/drm_dp_mst_helper.h
> > > > > +++ b/include/drm/drm_dp_mst_helper.h
> > > > > @@ -554,6 +554,8 @@ struct drm_dp_mst_topology_state {
> > > > >           struct drm_private_state base;
> > > > >           struct list_head vcpis;
> > > > >           struct drm_dp_mst_topology_mgr *mgr;
> > > > > +       u8 total_avail_slots;
> > > > > +       u8 start_slot;
> > > > >    };
> > > > >   
> > > > >    #define to_dp_mst_topology_mgr(x) container_of(x, struct
> > > > > drm_dp_mst_topology_mgr, base)
> > > > > @@ -661,6 +663,16 @@ struct drm_dp_mst_topology_mgr {
> > > > >            */
> > > > >           int pbn_div;
> > > > >   
> > > > > +       /**
> > > > > +        * @total_avail_slots: 63 for 8b/10b, 64 for 128/132b
> > > > > +        */
> > > > > +       u8 total_avail_slots;
> > > > > +
> > > > > +       /**
> > > > > +        * @start_slot: 1 for 8b/10b, 0 for 128/132b
> > > > > +        */
> > > > > +       u8 start_slot;
> > > > > +
> > > > >           /**
> > > > >            * @funcs: Atomic helper callbacks
> > > > >            */
> > > > > @@ -806,6 +818,7 @@ int drm_dp_mst_get_vcpi_slots(struct
> > > > > drm_dp_mst_topology_mgr *mgr, struct drm_dp
> > > > >   
> > > > >    void drm_dp_mst_reset_vcpi_slots(struct drm_dp_mst_topology_mgr
> > > > > *mgr,
> > > > > struct drm_dp_mst_port *port);
> > > > >   
> > > > > +void drm_dp_mst_update_coding_cap(struct drm_dp_mst_topology_state
> > > > > *mst_state, uint8_t link_coding_cap);
> > > > >   
> > > > >    void drm_dp_mst_deallocate_vcpi(struct drm_dp_mst_topology_mgr
> > > > > *mgr,
> > > > >                                   struct drm_dp_mst_port *port);
>

--
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

