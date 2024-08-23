Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBC695CFFC
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 16:34:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A82310EB59;
	Fri, 23 Aug 2024 14:34:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JhJBq7P9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2A410EB59
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 14:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724423664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+fjNZBRuZGsbkeNaHK2sXWLKAuqcqEXvd1LH3yVahOM=;
 b=JhJBq7P9vGoQJNngnaBNW9c9ChfYgII3x9TCF47HJahqHK7d4pdnff7fAKTJgnlDlBdVfX
 jDgkcjFysUHOWKf6EcfGs9c2rRpvClEvXEssWsMXw3dF1IragwXBWHXz7QMUrcqTm43T8u
 /lpKXiYp9KtNn7Eatcne/eP1ZNZEIHI=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-518-RoAN9ylEMFaYXQhvxhUtyg-1; Fri,
 23 Aug 2024 10:34:19 -0400
X-MC-Unique: RoAN9ylEMFaYXQhvxhUtyg-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BEEA81955D48; Fri, 23 Aug 2024 14:34:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.20])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id F143919560A3; Fri, 23 Aug 2024 14:34:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C66A818003AA; Fri, 23 Aug 2024 16:34:14 +0200 (CEST)
Date: Fri, 23 Aug 2024 16:34:14 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org, 
 maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev
Subject: Re: [PATCH 00/10] rm/bochs: Modernize driver
Message-ID: <sksjddgidfrk4bvcxvb46khevp4a4nfvl2holgdw636wld7oov@vdbcvdf3ch6m>
References: <20240823124422.286989-1-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20240823124422.286989-1-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> Patch 8 replaces GEM VRAM with GEM SHMEM. The new memory manager
> is more reliable and allows for larger resolutions.

Valid point.

> Display updates were so slow that Gnome was unmanageable with a
> flickering cursor and single FPS. The new memory management makes
> Gnome at least useable.

Hmm?  I'm wondering where this huge improvement comes from?

With enough video memory VRAM performance should be ok.

If video memory is tight and ttm is forced to shuffle around
framebuffers between vram and system memory on each page flip (touching
much of vram along the way which causes additional overhead on the qemu
side), that is obviously very bad for performance.  One of the reasons
why cirrus uses SHMEM + shadowing since years.

Shadow buffering comes with some overhead too, so the switch isn't an
obvious win (assuming enough vram).  Hiding the page flips from qemu
might reduce the work qemu has to do though, especially if the shadowing
uses dirty tracking and only touches the vram pages which have actually
changed content.  So there is a fair chance that this outweighs the
shadowing overhead and ends up being a net win.  I don't expect the
difference being very big though.  Also different display usage patterns
might yield different results (fbcon vs. gnome for example).

So this probably makes sense, but I'd like to see a bit more background
information ...

On vram sizes:  The default qemu vram size (16M) should be fine for the
default display resolution (1280x800).  For FullHD vram size should be
doubled (-device VGA,vgamem_mb=32).


Skimmed the other patches, looks sane overall, but I don't follow drm
close enough any more to do an full review.  So I leave this here:

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd

