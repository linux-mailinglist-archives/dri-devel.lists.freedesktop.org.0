Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A35D942FD17
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 22:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD4006EA97;
	Fri, 15 Oct 2021 20:42:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00D36EE0A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 20:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634330567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1C0MDc5av+cQvabfb39WXNpn79BpDPvSVf/ui9cVzNw=;
 b=JxQvqyX5EjahCuSVcP9hQ/sjlVpXJJuSf5T8Xcd2ETSmQEbhfRaoT6BeCiIePf6nmma9A0
 jTWmaEIS7G1V3cz7U/9jTNtHQpPeK7xQY/WStMXVXO8nkdXR6/iWjiO/Ulfzrr4VW2Y54A
 992dqTpTcStpXoE2LJJQI6+HJRu8vJg=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-rc0oDSeGOkqUvMumGiXpJw-1; Fri, 15 Oct 2021 16:41:42 -0400
X-MC-Unique: rc0oDSeGOkqUvMumGiXpJw-1
Received: by mail-qt1-f198.google.com with SMTP id
 d21-20020ac800d5000000b002a7ae3ec644so1969554qtg.7
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 13:41:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=1C0MDc5av+cQvabfb39WXNpn79BpDPvSVf/ui9cVzNw=;
 b=BuptnvZ03os1cOJYvtV/aWEO+RPXBCL9tuQAiOEqnFYH4fNHbn2vUqrawcQf3NdQ1g
 2OgD8OvjdF8nMBFZOAGcNdFTL/U98krsxnkNQ5PRxvv+wCqVluJfWupJBHDCAg/L/BwK
 APUaOfE6c1dbr6Q91RzUf9bpTffQntsQqmUbgboIUQnaPyGABrzvfD4VaoCtm2pQRkVP
 SmKoQuasmQwgc3IHReO51p6P1g/wOYTS8JipFfDWzJOzCBRXXZsS3YTr7BSuK5J906mo
 1hYyW7pzct6rIdRrZ8jvm4CoOcNF1euVOHnujB03tOasLmFdmBR0vm9N00VxjZkKLpBw
 fUyw==
X-Gm-Message-State: AOAM533hK9Qsfbanlf+pRLXbdVF4+bnRPiA+3+Pi++DJxkQM+Wx77ZH0
 EOhxf3o/Wt53TTp22b2dhZCyTQMcPNg9Nd39gi8JddWY9ChWVvYxSbXbn8EkQFTBRtLZZnvkWMS
 LCavsJ0fY29UcTTD0+1srq/VmQHRB
X-Received: by 2002:a0c:b2c2:: with SMTP id d2mr13379477qvf.64.1634330501766; 
 Fri, 15 Oct 2021 13:41:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiHdW3sM1cLqiA37aF508SVkDZ0cKTgK6Qt1tta8RRkXrkWKkvixYFVV5DRndcRZjzxUjwdw==
X-Received: by 2002:a0c:b2c2:: with SMTP id d2mr13379466qvf.64.1634330501564; 
 Fri, 15 Oct 2021 13:41:41 -0700 (PDT)
Received: from [192.168.8.206] (pool-96-230-249-157.bstnma.fios.verizon.net.
 [96.230.249.157])
 by smtp.gmail.com with ESMTPSA id a13sm3239884qtn.4.2021.10.15.13.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 13:41:41 -0700 (PDT)
Message-ID: <2a71120b01c96c942cdaba4ad6c0a0bbbd2d91e2.camel@redhat.com>
Subject: Re: [PATCH] drm: Update MST First Link Slot Information Based on
 Encoding Format
From: Lyude Paul <lyude@redhat.com>
To: Bhawanpreet Lakha <Bhawanpreet.lakha@amd.com>, Jerry.Zuo@amd.com, 
 dri-devel@lists.freedesktop.org
Cc: Harry.Wentland@amd.com, Wayne.Lin@amd.com, Nicholas.Kazlauskas@amd.com, 
 "Lipski, Mikita" <Mikita.Lipski@amd.com>
Date: Fri, 15 Oct 2021 16:41:38 -0400
In-Reply-To: <8fb410e5-3b47-d0a7-6d73-3b6692429e10@amd.com>
References: <5e463fbc3d633eea1078e838ba5be0065ffbeb1e.camel@redhat.com>
 <20211012215848.1507023-1-Bhawanpreet.Lakha@amd.com>
 <3fbf786ee687e57cab02d71c745d01fb39819cba.camel@redhat.com>
 <8fb410e5-3b47-d0a7-6d73-3b6692429e10@amd.com>
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

[more snip]

On Fri, 2021-10-15 at 15:43 -0400, Bhawanpreet Lakha wrote:
> > 
> Thanks for the response,
> 
> That function is per port so not sure how that will work. Also we only 
> need to check this inside drm_dp_mst_atomic_check_vcpi_alloc_limit(), 
> which doesn't have a state.
> 
> We could add the slots(or some DP version indicator) inside the 
> drm_connector, and add a parameter to 
> drm_dp_mst_atomic_check_vcpi_alloc_limit(int slots)? and call it with 
> this info via drm_dp_mst_atomic_check() and then update the mgr->slot in 
> commit.

TBH - I think we can actually just get away with having all of this info in
drm_dp_mst_topology_state

> 
> 
> Bhawan
> 
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

