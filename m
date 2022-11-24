Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C6363776B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 12:18:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8557610E6E3;
	Thu, 24 Nov 2022 11:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E5910E6E3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 11:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669288683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xPrnI3wUzzA5EN1dGSFZgqDRTkuK8RUJQxnTAkxblL0=;
 b=c/slcldYkGpc5u5hAc4Kw5o4XbfL1NqV1MNDsImloANH/m4GlK0UQX3gqNOpYCiYl7Ah1f
 VWe4ikfIW4kfWaom893hF69UwZfpvTx9RNqdxczIofj9/Jx4IJcV/ZfWtXRkb2bUI0mIa3
 ldCRHpJfMzwkDJtjqv6EtYM689R6VU8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-f7iuFoDwNPSvuE7nPRhkhQ-1; Thu, 24 Nov 2022 06:17:58 -0500
X-MC-Unique: f7iuFoDwNPSvuE7nPRhkhQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F40AD858F17;
 Thu, 24 Nov 2022 11:17:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 817292166B26;
 Thu, 24 Nov 2022 11:17:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2A9D91800609; Thu, 24 Nov 2022 12:17:54 +0100 (CET)
Date: Thu, 24 Nov 2022 12:17:54 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH resend v2] drm/fourcc: Add missing big-endian XRGB1555
 and RGB565 formats
Message-ID: <20221124111754.yrfewus6mqismc3b@sirius.home.kraxel.org>
References: <3ee1f8144feb96c28742b22384189f1f83bcfc1a.1669221671.git.geert@linux-m68k.org>
 <Y35RCaEP0icg6San@phenom.ffwll.local>
 <CAMuHMdVgqwHjm8Hxms04rg6YXiQacEwKiaRV80nNA_OM9mvZpA@mail.gmail.com>
 <20221124065148.7v4m3qli2k74mic6@sirius.home.kraxel.org>
 <CAMuHMdUJUUPPxS6VCHV1X9XMqzfACvu8qivUVO2pMbvD7rcQKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUJUUPPxS6VCHV1X9XMqzfACvu8qivUVO2pMbvD7rcQKg@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> > Supporting 16 bpp in the driver wouldn't be that much of a problem, but
> > processing the framebuffer on the host side when emulating a big endian
> > guest on a little endian host is painful.  I think I can't ask pixman to
> > do a conversation from DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN to
> > DRM_FORMAT_XRGB8888 on a little endian machine.
> 
> Indeed. But you can do a quick 16-bit byteswap, and convert from
> DRM_FORMAT_RGB565 to DRM_FORMAT_XRGB8888?

Sure doable, but it's an extra step in a rarely tested code path ...

> BTW, does pixman support converting DRM_FORMAT_RGB565 to
> DRM_FORMAT_XRGB8888 on a big-endian machine?

I don't think so.  When you can get the color bits with shifting and
masking pixman is happy.  For rgb565 (and xrgb1555) that works only on
native byte order.

take care,
  Gerd

