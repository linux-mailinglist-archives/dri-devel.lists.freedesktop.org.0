Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEE23ACF80
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 17:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D6516EA3C;
	Fri, 18 Jun 2021 15:54:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84EDB6EA3C
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 15:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624031663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pTxeyNpIA2yWa83l1BM9jQJLYRuEXdkId0aXocQ8b1U=;
 b=cEk1MoGFnmKRPgajJ3eQTJoZzqox+9BBIHrv58WHBQM/q4RO+1oK6zw0LhkXmmgxGArRrp
 197Erp7InyMtSTaub656faEczpbOBsvikrLHIIT8aPG6r+qUBTBMYvvXYhX0kyIQREa+9o
 yzxeHAqTYuuV4SyzkACDvyt+2mfUxvo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-PM7P8XarNuezR1Eemrwg6A-1; Fri, 18 Jun 2021 11:54:22 -0400
X-MC-Unique: PM7P8XarNuezR1Eemrwg6A-1
Received: by mail-qt1-f198.google.com with SMTP id
 r17-20020ac842510000b02902456ec03025so759869qtm.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 08:54:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=pTxeyNpIA2yWa83l1BM9jQJLYRuEXdkId0aXocQ8b1U=;
 b=ULeNqopSgoSf9N+ISxwHtNfpdsrFcHS4xAFxwG6UL3bUEp64AN2paDGjnShG4Kf/jB
 umZmueWn56SL4PuyZsxi+M7l+zseEgmK+20f7/D4rc9BwFJiJIrds5cKoKt++CuJJjEp
 UCE1IFu4Fi+BZYDlxWZZAdf8ppHMLxWlqWghqGYdE9K06xV/W8d6O7A2oJVNXXXhJA1X
 01rsKgqjUj2g+B1aMUMmWXS9zCu6wpKZuC8o4wZYKWjKfrlTFC3DVSFAblBW0p+YOTHi
 OKZ/WeYz0yVbcWMiPDamSJ8gMVOySh8cXOdx4pgN2iqo4y6CpYqjzQxODmJ0BZ00l7Ly
 RoZw==
X-Gm-Message-State: AOAM5329/NH78+vltFT5W6Z2Y0lw5aBe+GVRhAlTtRKk1vCntKoI7Qbm
 auX6Qf3VkNf9zzovpK/KIuIhHIN89/bHC3sjwo8mb36yN5ooXDD6wpSWB4Vt28h5BZBojt87/1C
 RQGt2gRDqWNXyF3Nh5bByU0OK5Ckk
X-Received: by 2002:a0c:eb85:: with SMTP id x5mr6350509qvo.1.1624031661844;
 Fri, 18 Jun 2021 08:54:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZ9ggc3AKjIwn7XQloIJoaZ3eTaNDM+vfsDB9bdUhWVkiU/K4XhcFH14Yq54qwSR5AjGFZNg==
X-Received: by 2002:a0c:eb85:: with SMTP id x5mr6350494qvo.1.1624031661632;
 Fri, 18 Jun 2021 08:54:21 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id w133sm4103706qkb.105.2021.06.18.08.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 08:54:21 -0700 (PDT)
Message-ID: <e7c1b92571c4230c7091e4972e4e131fc2902bea.camel@redhat.com>
Subject: Re: [PATCH] drm/dp_mst: Add missing drm parameters to recently
 added call to drm_dbg_kms()
From: Lyude Paul <lyude@redhat.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>, =?ISO-8859-1?Q?Jos=E9?= Roberto de
 Souza <jose.souza@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Date: Fri, 18 Jun 2021 11:54:20 -0400
In-Reply-To: <CO6PR12MB5489B93BAF0D296FDC1BDA79FC0E9@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20210616194415.36926-1-jose.souza@intel.com>
 ,<6b5b8d478b3ecb33858c3f55f432178c0917ffb4.camel@redhat.com>
 <CO6PR12MB5489B93BAF0D296FDC1BDA79FC0E9@CO6PR12MB5489.namprd12.prod.outlook.com>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's no problem! We all make mistakes sometimes :), I should have been more
diligent on compile-checking this myself as well

On Thu, 2021-06-17 at 08:20 +0000, Lin, Wayne wrote:
> [Public]
> 
> Really sorry for the mistake that I made and any inconvenience it brought.
> Thanks José and Lyude.
> 
> Regards,
> Wayne
> 
> ________________________________________
> > From: Lyude Paul <lyude@redhat.com>
> > Sent: Thursday, June 17, 2021 03:47
> > To: José Roberto de Souza; intel-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org; Lin, Wayne
> > Subject: Re: [PATCH] drm/dp_mst: Add missing drm parameters to recently
> > added call to drm_dbg_kms()
> > 
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > 
> > Will go ahead and push this to drm-misc-next-fixes, thanks
> > 
> > On Wed, 2021-06-16 at 12:44 -0700, José Roberto de Souza wrote:
> > > Commit 3769e4c0af5b ("drm/dp_mst: Avoid to mess up payload table by
> > > ports in stale topology") added to calls to drm_dbg_kms() but it
> > > missed the first parameter, the drm device breaking the build.
> > > 
> > > Fixes: 3769e4c0af5b ("drm/dp_mst: Avoid to mess up payload table by
> > > ports in
> > > stale topology")
> > > Cc: Wayne Lin <Wayne.Lin@amd.com>
> > > Cc: Lyude Paul <lyude@redhat.com>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_dp_mst_topology.c | 7 +++++--
> > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > index 9ac148efd9e43..ad0795afc21cf 100644
> > > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > @@ -3389,7 +3389,9 @@ int drm_dp_update_payload_part1(struct
> > > drm_dp_mst_topology_mgr *mgr)
> > >                         mutex_unlock(&mgr->lock);
> > > 
> > >                         if (skip) {
> > > -                               drm_dbg_kms("Virtual channel %d is not
> > > in
> > > current topology\n", i);
> > > +                               drm_dbg_kms(mgr->dev,
> > > +                                           "Virtual channel %d is not
> > > in
> > > current topology\n",
> > > +                                           i);
> > >                                 continue;
> > >                         }
> > >                         /* Validated ports don't matter if we're
> > > releasing
> > > @@ -3404,7 +3406,8 @@ int drm_dp_update_payload_part1(struct
> > > drm_dp_mst_topology_mgr *mgr)
> > >                                                 payload->start_slot =
> > > req_payload.start_slot;
> > >                                                 continue;
> > >                                         } else {
> > > -                                               drm_dbg_kms("Fail:set
> > > payload to invalid sink");
> > > +                                               drm_dbg_kms(mgr->dev,
> > > +                                                           "Fail:set
> > > payload to invalid sink");
> > >                                                 mutex_unlock(&mgr-
> > > > payload_lock);
> > >                                                 return -EINVAL;
> > >                                         }
> > 
> > --
> > Cheers,
> >  Lyude Paul (she/her)
> >  Software Engineer at Red Hat
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

