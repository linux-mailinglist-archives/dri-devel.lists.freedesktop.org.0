Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5209035F0DC
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 11:30:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD576E903;
	Wed, 14 Apr 2021 09:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA04F6E900
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 09:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618392601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MK9RMLlyM1QiVb9M9XIyS7qidlZqBTHcNWDEWRn/BRs=;
 b=OPBDuY5iJ85FjeZStKA4PEm4/BvPHrxT2f05bqaC+bUAw0I0U+MCc6/SnXZRyeiEq8HQYU
 N9rXTMeccWsybbVf6f8qZ9twHZN2Bjei8m18/P1Meg3kc/t6xstUw0cwFAziQJ6T3XXil6
 Dfvv0e8kBwvpJErQdVvyAJoYEHujR9M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-HjqMeu1LP82ze6cbxWQNYw-1; Wed, 14 Apr 2021 05:29:59 -0400
X-MC-Unique: HjqMeu1LP82ze6cbxWQNYw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFED3A6864;
 Wed, 14 Apr 2021 09:29:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-165.ams2.redhat.com
 [10.36.114.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7411C52791;
 Wed, 14 Apr 2021 09:29:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5AF611800936; Wed, 14 Apr 2021 11:29:52 +0200 (CEST)
Date: Wed, 14 Apr 2021 11:29:52 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Zhang, Tina" <tina.zhang@intel.com>
Subject: Re: [PATCH] drm/virtio: Create Dumb BOs as guest Blobs (v3)
Message-ID: <20210414092952.qsi7y5qi7qxclhdz@sirius.home.kraxel.org>
References: <CAAfnVBmkEHB=j3rJyLPOixFRfPD=WQGVs85PuS0RYmViOgVAQA@mail.gmail.com>
 <20210413052614.2486768-1-vivek.kasireddy@intel.com>
 <BN7PR11MB27863A076DF43A77D6F4384C894E9@BN7PR11MB2786.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BN7PR11MB27863A076DF43A77D6F4384C894E9@BN7PR11MB2786.namprd11.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
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
Cc: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 14, 2021 at 06:36:55AM +0000, Zhang, Tina wrote:
> Hi Gerd,
> 
> Speaking of the modifier, we notice that the virtio-gpu driver's
> mode_config.allow_fb_modifiers = false, which means virtio-gpu doesn't
> support modifier. With mode_config.allow_fb_modifiers=false, the DRM
> Modifier API would fail. 
> 
> So, do you know if there is any concern about letting virito-gpu allow
> modifiers? Thanks.

Well, virtio-gpu must also provide a list of modifiers then.  We need
some way for virtio-gpu to figure which modifiers are supported by the
host and which are not.  Otherwise we could list LINEAR only which
doesn't buy us much ;)

Not sure whenever virglrenderer allows that already (via
VIRGL_CCMD*QUERY* or via virgl caps).  If not we could define a new
modifiers capability for that, which could then be used for both virgl
and non-virgl mode.

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
