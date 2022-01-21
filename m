Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD894495B4C
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 08:56:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3FB010E94B;
	Fri, 21 Jan 2022 07:56:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A099A10E952
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 07:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642751798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m2Ho/lCZKO10EzmqqcIcm9qmBssIoEL4oIglAIQFltM=;
 b=AYP3dDNawDbDI3FbuZ1GmE2sPEYXgv4SXk+bCnl+avm0bT0SsqOj/W+TQpdb+4Jp5R0NUi
 OlUHPRHTvmY4mMGyicNKUhUo/JYite9sxI5DmcIxh28faVns1h5xMoGOxaSYdIN9LnFNw0
 B5T3OCGBhD3OlGqZOKONRFFkwzWHxtc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-308-qmajEbmeOGKJKS2Wspa7_w-1; Fri, 21 Jan 2022 02:56:30 -0500
X-MC-Unique: qmajEbmeOGKJKS2Wspa7_w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 088D084DA42;
 Fri, 21 Jan 2022 07:56:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 22F6970D21;
 Fri, 21 Jan 2022 07:56:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A8B8F180060F; Fri, 21 Jan 2022 08:20:06 +0100 (CET)
Date: Fri, 21 Jan 2022 08:20:06 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 2/2] Revert "fbcon: Disable accelerated scrolling"
Message-ID: <20220121072006.ylw2hdl7jbkbwnre@sirius.home.kraxel.org>
References: <20220119110839.33187-1-deller@gmx.de>
 <20220119110839.33187-3-deller@gmx.de>
 <YelyGDNDTn1Aq/hm@phenom.ffwll.local>
 <6c000477-002b-d125-b945-2c4831bad8a5@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c000477-002b-d125-b945-2c4831bad8a5@gmx.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: linux-fbdev@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 Sam Ravnborg <sam@ravnborg.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sven Schnelle <svens@stackframe.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Claudio Suarez <cssk@net-c.es>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> > So if this really has to come back then I think the pragmatic approach is
> > to do it behind a CONFIG_FBCON_ACCEL, default n, and with a huge warning
> > that enabling that shouldn't be done for any distro which only enables
> > firmware and drm fbdev drivers.
> 
> Thanks for coming back on this, but quite frankly I don't understand
> that request. How should that warning look like, something along:
> "BE WARNED: The framebuffer text console on your non-DRM supported
> graphic card will then run faster and smoother if you enable this option."
> That doesn't make sense. People and distros would want to enable that.

Nope.  Most distros want disable fbdev drivers rather sooner than later.
The fbdev drivers enabled in the fedora kernel today:

	CONFIG_FB_VGA16=m
	CONFIG_FB_VESA=y
	CONFIG_FB_EFI=y
	CONFIG_FB_SSD1307=m

CONFIG_FB_VESA + CONFIG_FB_EFI will go away soon, with simpledrm taking
over their role.

> And if a distro *just* has firmware and drm fbdev drivers enabled,
> none of the non-DRM graphic cards would be loaded anyway and this code
> wouldn't be executed anyway.

Yes, exactly.  That's why there is no point in compiling that code.

take care,
  Gerd

