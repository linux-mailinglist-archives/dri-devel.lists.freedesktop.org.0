Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADC14E6600
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 16:33:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C78510E8D3;
	Thu, 24 Mar 2022 15:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F0D10E8D3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 15:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648136000;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=8QnjcDWT8YHaE2ypxB7fTnVt6WqhkXSObBAZWvhDXe0=;
 b=TLAQLzmvtLKQfPANRl5wlG6COIjWYy4+GgbFsjDZTowanLGnjVCjGLqdVI50xMPenyzvTZ
 4F3XMR7yWv+INPzSbk1L4jvGNSN0WuHaAdYmXC2aYX3tFcBzoiOvjwpm3aWM69vDWSMeRC
 yuA9CzLmQtDbna92I2I+xpA0T0zubtE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-AkdLzR3CP2ant435S_RImw-1; Thu, 24 Mar 2022 11:33:16 -0400
X-MC-Unique: AkdLzR3CP2ant435S_RImw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5771628EC119;
 Thu, 24 Mar 2022 15:33:16 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EB00492D46;
 Thu, 24 Mar 2022 15:33:14 +0000 (UTC)
Date: Thu, 24 Mar 2022 15:33:12 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Spice-devel] =?utf-8?B?5Zue5aSNOiBS?=
 =?utf-8?B?ZTog5Zue5aSNOiBSZTog5Zue5aSNOiBSZTog5Zue5aSNOiBSZTogW1BBVEM=?=
 =?utf-8?Q?H?= v1 1/2] drm/qxl: replace ioremap by ioremap_cache on arm64
Message-ID: <YjyPODaEUKC693sL@redhat.com>
References: <olr8fzd5ad-olr8fzd5ae@nsmail6.0>
 <20220324132109.3ox6k2wif6tkp47n@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20220324132109.3ox6k2wif6tkp47n@sirius.home.kraxel.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, ray.huang@amd.com,
 liucong2@kylinos.cn, airlied@redhat.com, spice-devel@lists.freedesktop.org,
 Robin Murphy <robin.murphy@arm.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 24, 2022 at 02:21:09PM +0100, Gerd Hoffmann wrote:
> On Thu, Mar 24, 2022 at 06:34:02PM +0800, liucong2@kylinos.cn wrote:
> >    ok, thanks, a lot of our customer use qxl on x86 before, so it still need
> >    to supoort qxl on arm64.
> 
> Well, qxl isn't the best choice even on x86.  The main advantage it
> offers (2d acceleration) is basically useless today because pretty much
> everything moved on to use 3d acceleration instead.  So qxl ends up
> being used as dumb framebuffer with software 3d rendering.
> 
> So, I'm still recommending to just use virtio-gpu ...

Also bear in mind that while almost no one uses the 2d acceleration
in QXL, the QEMU device still implements all the 2d functionality.
This exposes an attack surface to the guest VM, from code that is
largely ignored by maintainers today, as attention is focused on
virtio-gpu instead. 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

