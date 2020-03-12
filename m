Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E449182BE1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 10:06:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 427146E09A;
	Thu, 12 Mar 2020 09:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770C36E09A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 09:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584003975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VSFTzKd2uXF18UVZ1m0HzeIesfFwiODN5EoQthAooa8=;
 b=cKVX0VzsHvw8FcQXschllHchk+NN1jNr8wwRc9Kh5Nm7KHnTMifoDiA09IvGNGbNdNXT6i
 W6uf1MbzNK6Ses+0ItPN6Gms6vsM66WeFJL/rwEHqhmfI0SedU3P7go5iSH1y3cUJ2em2E
 6nTvUb5xuEzOjJMXjsm2BuiRlZMwQOI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-YAFfaWFtPPaoXE2f7Fs7Ww-1; Thu, 12 Mar 2020 05:06:08 -0400
X-MC-Unique: YAFfaWFtPPaoXE2f7Fs7Ww-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E697D10838BA;
 Thu, 12 Mar 2020 09:06:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-117.ams2.redhat.com
 [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 926A75C1C3;
 Thu, 12 Mar 2020 09:06:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8591C17449; Thu, 12 Mar 2020 10:06:01 +0100 (CET)
Date: Thu, 12 Mar 2020 10:06:01 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [RFC PATCH 0/8] *** Per context fencing ***
Message-ID: <20200312090601.mt3tc7d3horjd7gj@sirius.home.kraxel.org>
References: <20200310010818.569-1-gurchetansingh@chromium.org>
 <20200310074302.yx6anlvqvsg37yzs@sirius.home.kraxel.org>
 <CAAfnVB=sw=u80mHnZUPf_+WDW-hGNTDSBWLfV+7y3KFN=s6beQ@mail.gmail.com>
 <20200311103609.ei446gelkvbqrdzm@sirius.home.kraxel.org>
 <CAPaKu7SCquWkY3x3EeuvJvjmn1hV-rqeaq4KM5X0tcfVbqNojg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPaKu7SCquWkY3x3EeuvJvjmn1hV-rqeaq4KM5X0tcfVbqNojg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

> Can virtqueues be added dynamically?

No.

> Or can we have
> fixed but enough (e.g., 64) virtqueues?

Well, I wouldn't bet that any specific number is enough.  When gtk
starts rendering using vulkan by default the number of contexts of a
standard gnome desktop will be pretty high I guess ...

We can have a host-configurable number of virtqueues.  Typically the
guest can figure the number of available queues from config space.  One
common usage pattern (seen in block/net devices) is to have the number
of virtqueues equal the number of vcpus, so each vcpu has dedicated
virtqueue.

For virtio-gpu it is probably more useful to bind contexts to
virtqueues.  As long as we have enough virtqueues each context can
have its own.  Once we run out of virtqueues we have to start sharing.

On the host side it probably makes sense to have one process per
virtqueue.

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
