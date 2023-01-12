Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42043666B81
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 08:17:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B466B10E0D1;
	Thu, 12 Jan 2023 07:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C21110E0D1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 07:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673507845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BXxs8a+ZexQg95P2Cy0B2hC++ss3BbBLVMYZoPL1Yy4=;
 b=YA2ppSLqmjtRjc+7SgPuUY4KiRzquWyO2aPW3G60iaIElLzqGnmRoysQP+sN5iutJH9EXR
 oXGKxpIGYC20r7e/vLq350itZ6UxjTqIKQGXur8+EtH0A5S7Z490DsDkq3/nDNabn7/yuJ
 xZKY+Nv0QQy2TFpEQR4pdn6dxxX0TF8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-HSTiDWoCNpGFPMzkxok8vw-1; Thu, 12 Jan 2023 02:17:21 -0500
X-MC-Unique: HSTiDWoCNpGFPMzkxok8vw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39BF73806647;
 Thu, 12 Jan 2023 07:17:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.238])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D2D12026D68;
 Thu, 12 Jan 2023 07:17:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AEB101800606; Thu, 12 Jan 2023 08:17:19 +0100 (CET)
Date: Thu, 12 Jan 2023 08:17:19 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 2/2] drm/virtio: Add the hotplug_mode_update property
 for rescanning of modes
Message-ID: <20230112071719.syjcv7hn6qekatog@sirius.home.kraxel.org>
References: <20221118013054.182304-1-vivek.kasireddy@intel.com>
 <20221118013054.182304-3-vivek.kasireddy@intel.com>
 <20230106085640.54hvmhblmh4o2jxb@sirius.home.kraxel.org>
 <Y7frUw39xU70WQkD@phenom.ffwll.local>
 <IA0PR11MB718594D9F06FC52B5CC07279F8FF9@IA0PR11MB7185.namprd11.prod.outlook.com>
 <Y780QKVL6uRx3ZYp@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <Y780QKVL6uRx3ZYp@phenom.ffwll.local>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Kim,
 Dongwon" <dongwon.kim@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> > > I think we need to do a bit of refactoring/documenting here first.
> > [Kasireddy, Vivek] Just for reference, here is Dave's commit that added this
> > property for qxl:
> > commit 4695b03970df378dcb93fe3e7158381f1e980fa2
> > Author: Dave Airlie <airlied@redhat.com>
> > Date:   Fri Oct 11 11:05:00 2013 +1000
> > 
> >     qxl: add a connector property to denote hotplug should rescan modes.
> > 
> >     So GNOME userspace has an issue with when it rescans for modes on hotplug
> >     events, if the monitor has no EDID it assumes that nothing has changed on
> >     EDID as with real hw we'd never have new modes without a new EDID, and they
> >     kind off rely on the behaviour now, however with virtual GPUs we would
> >     like to rescan the modes and get a new preferred mode on hotplug events
> >     to handle dynamic guest resizing (where you resize the host window and the
> >     guest resizes with it).
> 
> Ok this is just terrible. Because _anything_ without an EDID is impacted,
> and we're certainly not going to sprinkle this property all over gpu
> drivers just so Gnome takes the right path.

Oh, and (newer) virtio-gpu actually has EDIDs ...

take care,
  Gerd

