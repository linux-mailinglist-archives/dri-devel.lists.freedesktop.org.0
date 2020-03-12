Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 096F4182C08
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 10:10:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4993C6E0CF;
	Thu, 12 Mar 2020 09:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0956E0CF
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 09:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584004221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mFIadcbKRZ/irp2MSvAK1LiqlQwfpdHU9Rw7etvgfrA=;
 b=CRKzsvTMPUTaCrHVqB/2sGU76UoR3yrZ0hSuVnL48vjkBPsn4ljfVDkSDgDyY8jU+BPa0O
 82S10FRpErIPbhwmi9URGpr84BgzQDumGAJCSfNrS0e9RDHzPUxirh37RjuS6xe1lVmX6Q
 ae2iaqhzNRsw1tELuL4rXGhl+fkJ+r0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-Z-CPLOdDN1qHn-CBWviXNw-1; Thu, 12 Mar 2020 05:10:18 -0400
X-MC-Unique: Z-CPLOdDN1qHn-CBWviXNw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB7188017DF;
 Thu, 12 Mar 2020 09:10:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-117.ams2.redhat.com
 [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B51760BF1;
 Thu, 12 Mar 2020 09:10:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 74E6717449; Thu, 12 Mar 2020 10:10:11 +0100 (CET)
Date: Thu, 12 Mar 2020 10:10:11 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [RFC PATCH 0/8] *** Per context fencing ***
Message-ID: <20200312091011.74gmdzljjbjmrhoa@sirius.home.kraxel.org>
References: <20200310010818.569-1-gurchetansingh@chromium.org>
 <20200310074302.yx6anlvqvsg37yzs@sirius.home.kraxel.org>
 <CAAfnVB=sw=u80mHnZUPf_+WDW-hGNTDSBWLfV+7y3KFN=s6beQ@mail.gmail.com>
 <20200311103609.ei446gelkvbqrdzm@sirius.home.kraxel.org>
 <CAAfnVBm1eoGZY7yB8eqEC1eLk=v4dq--O2biQOnWDHCkmguOeA@mail.gmail.com>
 <CAPaKu7SjeN+8Grr_hopG=pDcigV52YQeUnAYmumTVY0=RBR5Ng@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPaKu7SjeN+8Grr_hopG=pDcigV52YQeUnAYmumTVY0=RBR5Ng@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Chad Versace <chadversary@chromium.org>, John Bates <jbates@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> I will start with... how many timelines do we want to expose per
> context?  In my mind, it goes like
> 
> V1: 1 timeline per virtqueue (there is one timeline for ctrlq right now)
> V2: 1 timeline per context (VK and GL on different timelines)
> V3: N timelines per context (each VkQueue in a VK context gets a timeline?)
> V4: N+M timelines per context (each CPU thread also gets a timeline?!?!)
> 
> I certainly don't know if V4 is a good idea or not...

I'd expect apps use one VkQueue per thread, so v3 makes sense but v4 not
so much I think ...

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
