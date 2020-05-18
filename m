Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D01E1D72E2
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 10:24:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 765C86E12C;
	Mon, 18 May 2020 08:24:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 553496E12C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 08:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589790242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vi1MWfSX1gmTbxPq7f6vfW3/wyZU7SIZx/TfRTQP8ok=;
 b=dcE2zK93azVarlJKV28QYrfXk7Pqr8gdKtqbPKPB6db1YoWzmYXcg9zCTwA9PpEJuTH2dk
 km4Uu6+lZ759PpV+3IjFl5lW+S5cpT/pi/5Sjqegv0XKdExxzR5Yg8NrwgClKrHs+S/ajy
 TtLTouAFX5WQwW6ttDzHeYd0FPXrMzs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-nOAARt11NpWU16UnjSuxsw-1; Mon, 18 May 2020 04:23:58 -0400
X-MC-Unique: nOAARt11NpWU16UnjSuxsw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82B7880B725;
 Mon, 18 May 2020 08:23:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9C2F1001B2C;
 Mon, 18 May 2020 08:23:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 596FD17444; Mon, 18 May 2020 10:23:54 +0200 (CEST)
Date: Mon, 18 May 2020 10:23:54 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/2] drm/shmem: Use cached mappings by default
Message-ID: <20200518082354.jeuyt7uzek73pjkp@sirius.home.kraxel.org>
References: <20200513150312.21421-1-tzimmermann@suse.de>
 <20200513150312.21421-2-tzimmermann@suse.de>
 <20200514124050.GV206103@phenom.ffwll.local>
 <CAL_JsqK5J78PS_miF8QmfcLJOiESV-f=hXB_CanFqK9yBgJ=6Q@mail.gmail.com>
 <6cec8a8a-d642-cd93-906a-eafab49a12d7@suse.de>
 <20200515141044.GH206103@phenom.ffwll.local>
 <3e09cc7d-c609-e10a-3fe9-f40f3bbfaeaf@suse.de>
MIME-Version: 1.0
In-Reply-To: <3e09cc7d-c609-e10a-3fe9-f40f3bbfaeaf@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > $ git grep drm_gem_shmem_mmap
> > 
> > We also need correct access from userspace, otherwise the gpu is going to
> > be sad.
> 
> I've been thinking about this, and I think it means that we can never
> have cached mappings anywhere. Even if shmem supports it internally for
> most drivers, as soon as the page are exported, the importer could
> expect uncached memory.

The importer should not expect anything but call dma-buf ops so the
exporter has a chance to handle this correctly.

(Yes, we don't get this right everywhere, some drivers take the dma-bufs
list of pages and do their own thing ...).

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
