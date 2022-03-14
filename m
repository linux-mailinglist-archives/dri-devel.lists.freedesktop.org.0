Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD8F4D8F65
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 23:16:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4742510E2D7;
	Mon, 14 Mar 2022 22:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 569DA10E2D7
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 22:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647296205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mZEGeLo0wjvGmlLJzlT4x9Gp9DQ81yCzD6AJ2J48U+A=;
 b=L8SG2pFqFvDSskn369509nXmSM8e+Gb2mzViqTuEzILvsToi1Pbm5Wv1dJxLdfFv29Vbx1
 1cyVCuaN1w5wRYjOvRvQ6qL99hofBIAhm+kNj//FE/xeFJVDoDC7fTQxFouPHik6Q8jx01
 44aAagXgfDoy9zANtXvCI/VN62uup0o=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-4He5uiAHO9qyIZtNHw0XkQ-1; Mon, 14 Mar 2022 18:16:39 -0400
X-MC-Unique: 4He5uiAHO9qyIZtNHw0XkQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 k11-20020ac8604b000000b002e1a4109edeso11847589qtm.15
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 15:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:organization
 :user-agent:mime-version:content-transfer-encoding;
 bh=mZEGeLo0wjvGmlLJzlT4x9Gp9DQ81yCzD6AJ2J48U+A=;
 b=DKiVRJZLMRMPg2yJzyGZs4uYFt5naSOkaNbyzsuqFsAt5XJvNlHnODRtw/W59ZotZd
 o4xi6PoX75llgwVf2X3y/GhC+saJaXddrmxBZWCWsHm9OY1WrNy3uoz8U5WenTK94O3c
 UO9K+dvFvU54Ms5oAtw6ubxzSE7BqMCyAvYyTyyqJjT8kgtWRztKHb56/UM9ruRDTDT1
 i6ezH+lhMI1shCqR5P9PIEuMxx6hv+mr4xGFC+O7eVUKm08EFYmMVYx8VrHyMla3PXEQ
 y1G2aQsuT9AM3Cg29xWl7313iKL+pBpufsQhC59EpmWuSY14+abotGXYrHM+sSlzsVZ6
 uCpQ==
X-Gm-Message-State: AOAM533rciU0a7q1okchbAOOo38VfR1+vOLq0Z8pTbMXJV6ZtJ3pg65I
 HENYKGFRoEOSw948Zrqob2RDLwbdv+1VxnrWvqbP1l2SLaA/weAw7AbrHcle34FvN4nLecM82c0
 cfkwCo/ZnO+XNM2ygqfP1TOVgOBVY
X-Received: by 2002:a05:620a:1724:b0:67d:a9db:f38a with SMTP id
 az36-20020a05620a172400b0067da9dbf38amr7711091qkb.411.1647296199139; 
 Mon, 14 Mar 2022 15:16:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0x1UqgT7yGPY3o/AzS0iq6iCGCxi76DszN+0W5u10J56NEHjw+Rbk7lPAh6wOsWRta0UzPg==
X-Received: by 2002:a05:620a:1724:b0:67d:a9db:f38a with SMTP id
 az36-20020a05620a172400b0067da9dbf38amr7711072qkb.411.1647296198775; 
 Mon, 14 Mar 2022 15:16:38 -0700 (PDT)
Received: from [192.168.8.138] (pool-96-230-100-15.bstnma.fios.verizon.net.
 [96.230.100.15]) by smtp.gmail.com with ESMTPSA id
 e14-20020ac85dce000000b002e1ce48c189sm3612192qtx.76.2022.03.14.15.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 15:16:38 -0700 (PDT)
Message-ID: <3c8a7bec021ba663cc0a55bdedb7030a555457dd.camel@redhat.com>
Subject: Parallel modesets and private state objects broken, where to go
 with MST?
From: Lyude Paul <lyude@redhat.com>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel.vetter@intel.com>
Date: Mon, 14 Mar 2022 18:16:36 -0400
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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

Hi! First a little bit of background: I've recently been trying to get rid of
all of the non-atomic payload bandwidth management code in the MST helpers in
order to make it easier to implement DSC and fallback link rate retraining
support down the line. Currently bandwidth information is stored in two
places, partially in the MST atomic state and partially in the mst manager's
payload table (which exists outside of the atomic state and has its own
locking). The portions in the atomic state are used to try to determine if a
given display configuration can fit within the given bandwidth limitations
during the atomic check phase, and are implemented through the use of private
state objects.

My current goal has been to move as much of this as possible over to the
atomic state and entirely get rid of the payload table along with it's locks.
My main reason for doing this is that it both decomplicates things quite a
bit, and I'm really also hoping that getting rid of that payload code will
make it clearer to others how it works - and stop the influx of bandaid
patches (e.g. adding more and more special cases to MST to fix poorly
understood issues being hit in one specific driver and nowhere else) that I've
had to spend way more time then I'd like trying to investigate and review.

So, the actual problem: following a conversation with Daniel Vetter today I've
gotten the impression that private modesetting objects are basically just
broken with parallel modesets? I'm still wrapping my head around all of this
honestly, but from what I've gathered: CRTC atomic infra knows how to do waits
in the proper places for when other CRTCs need to be waited on to continue a
modeset, but there's no such tracking with private objects. If I understand
this correctly, that means that even if two CRTC modesets require pulling in
the same private object state for the MST mgr: we're only provided a guarantee
that the atomic checks pulling in that private object state won't
concurrently. But when it comes to commits, it doesn't sound like there's any
actual tracking for this and as such - two CRTC modesets which have both
pulled in the MST private state object are not prevented from running
concurrently.

This unfortunately throws an enormous wrench into the MST atomic conversion
I've been working on - as I was under the understanding while writing the code
for this that all objects in an atomic state are blocked from being used in
any new atomic commits (not checks, as parallel checks should be fine in my
case) until there's no commits active with said object pulled into the atomic
state. I certainly am not aware of any way parallel modesetting could actually
be supported on MST, so it's not really a feature we want to deal with at all
besides stopping it from happening. This also unfortunately means that the
current atomic modesetting code we have for MST is potentially broken,
although I assume we've never hit any real world issues with it because of the
non-atomic locking we currently have for the payload table.

So, Daniel had mentioned that supposedly you've been dealing with similar
issues with VC4 and might have already made progress on coming up with ways to
deal with it. If this is all correct, I'd definitely appreciate being able to
take a look at your work on this to see how I can help move things forward.
I've got a WIP of my atomic only MST branch as well:

https://gitlab.freedesktop.org/lyudess/linux/-/commits/wip/mst-atomic-only-v1

However it's very certainly broken right now (it compiles and I had thought it
worked already, but I realized I totally forgot to come up with a way of doing
bookkeeping for VC start slots atomically - which is what led me down this
current rabbit hole), but it should at least give a general idea of what I'm
trying to do.

Anyway, let me know what you think.
-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

