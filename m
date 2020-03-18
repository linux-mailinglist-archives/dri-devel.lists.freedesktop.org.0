Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 561331895FC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 07:48:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B960C6E1F2;
	Wed, 18 Mar 2020 06:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 346 seconds by postgrey-1.36 at gabe;
 Wed, 18 Mar 2020 06:48:05 UTC
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC596E1F2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 06:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584514084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qs6zHDQ9hWCbXySzkR7QT/fX2FXyJF3dfU4ifK4dT+E=;
 b=DoApgtBCBDMNLbbLGAceAbF2tlIB0KHHGF+f1iC4C3iEVl8ll8vEEiQrn6+yI8XWMBwYv9
 wtBpGnvIiYReIhc47jROUgRGiuyK7BzaNNLit+LyMeQKgY8WOk96tnsy/JnF84BfwyEpoR
 mSx4dD9LOzYXQdml+hyAgSk0WVS4cww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-PRvZKJCcPSKSk28XbCaBmg-1; Wed, 18 Mar 2020 02:41:03 -0400
X-MC-Unique: PRvZKJCcPSKSk28XbCaBmg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD5E8800D50;
 Wed, 18 Mar 2020 06:41:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-49.ams2.redhat.com
 [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89EC27E30C;
 Wed, 18 Mar 2020 06:41:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9BAAD17444; Wed, 18 Mar 2020 07:40:59 +0100 (CET)
Date: Wed, 18 Mar 2020 07:40:59 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [RFC PATCH 0/8] *** Per context fencing ***
Message-ID: <20200318064059.3xdwi2ugdcxw6y4g@sirius.home.kraxel.org>
References: <20200310010818.569-1-gurchetansingh@chromium.org>
 <20200310074302.yx6anlvqvsg37yzs@sirius.home.kraxel.org>
 <CAAfnVB=sw=u80mHnZUPf_+WDW-hGNTDSBWLfV+7y3KFN=s6beQ@mail.gmail.com>
 <20200311103609.ei446gelkvbqrdzm@sirius.home.kraxel.org>
 <CAAfnVBm1eoGZY7yB8eqEC1eLk=v4dq--O2biQOnWDHCkmguOeA@mail.gmail.com>
 <20200312092940.xioyjloil3f25ccv@sirius.home.kraxel.org>
 <CAAfnVBkTWy2pohv5kWWYwAa1yq14fRJrtN4GD7sF-h4inabH6Q@mail.gmail.com>
 <CAPaKu7SgkdBaFcDU1O7T+mMyzqO5iR8qYJxFJmcYGp_Hfe3S0g@mail.gmail.com>
 <20200316074404.z4xbta6qyrm74oxo@sirius.home.kraxel.org>
 <CAPaKu7S=fmsGDY+txgFBcYDaBE9VaBubtEvVMEWj2yQ_UL04bQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPaKu7S=fmsGDY+txgFBcYDaBE9VaBubtEvVMEWj2yQ_UL04bQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Chad Versace <chadversary@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 David Stevens <stevensd@chromium.org>, John Bates <jbates@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> > > I am still catching up, but IIUC, indeed I don't think the host needs
> > > to depend on fence_id.  We should be able to repurpose fence_id.
> >
> > I'd rather ignore it altogether for FENCE_V2 (or whatever we call the
> > feature flag).
> 
> That's fine when one assumes each virtqueue has one host GPU timeline.
> But when there are multiple (e.g., multiplexing multiple contexts over
> one virtqueue, or multiple VkQueues), fence_id can be repurposed as
> the host timeline id.

Why do you need an id for that?  You can simply keep track of the
submit_3d commands instead.

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
