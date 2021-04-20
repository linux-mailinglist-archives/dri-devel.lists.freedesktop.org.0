Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD72F36552E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 11:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 330916E4EC;
	Tue, 20 Apr 2021 09:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142286E4EC
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 09:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618910530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fM2Zxq/BIV5zt5mY21HecYUb6ZEHdd7//7NEB7VTkj0=;
 b=g2qeczaLn/mvXnN2kkD2Ay09o02EliH/UDJRWb3gX5x3EDAVV9jXWkMvQ8+w3Gs/ZWR8DA
 f4lr2GaSl/ZcjvP15nyIPG67t9qLhFC13hcZ/HHwXhFsl5GwhnMvo0dlZtt0oi/EYuGZIm
 4/NQHrwG4jm+m3Qy/SIqJVYHGEbCQ70=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-pjywwDiHPSCeF_KBFKw-Sw-1; Tue, 20 Apr 2021 05:22:08 -0400
X-MC-Unique: pjywwDiHPSCeF_KBFKw-Sw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E42391020C27;
 Tue, 20 Apr 2021 09:22:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-178.ams2.redhat.com
 [10.36.112.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7751B5C23E;
 Tue, 20 Apr 2021 09:22:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 82A7D1800382; Tue, 20 Apr 2021 11:22:04 +0200 (CEST)
Date: Tue, 20 Apr 2021 11:22:04 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v4 0/9] drm: Support simple-framebuffer devices and
 firmware fbs
Message-ID: <20210420092204.7azdb7nxgofegjht@sirius.home.kraxel.org>
References: <20210416090048.11492-1-tzimmermann@suse.de>
 <CAMuHMdWcC8O+UzQDQj7Bm4uK_myjFT5D2ccTmneTJYi4SMfCRQ@mail.gmail.com>
 <YH6U92Q71ntU6Z1R@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YH6U92Q71ntU6Z1R@phenom.ffwll.local>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: bluescreen_avenger@verizon.net, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, virtualization@lists.linux-foundation.org,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Greg KH <gregkh@linuxfoundation.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> > > Patches 4 to 8 add the simpledrm driver. It's build on simple DRM helpers
> > > and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers. During
> > 
> > .... if support for 8-bit frame buffers would be added?
> 
> Is that 8-bit greyscale or 8-bit indexed with 256 entry palette? Former
> shouldn't be a big thing, but the latter is only really supported by the
> overall drm ecosystem in theory. Most userspace assumes that xrgb8888
> works, and we keep that illusion up by emulating it in kernel for hw which
> just doesn't support it. But reformatting xrgb8888 to c8 is tricky at
> best.

Well.  cirrus converts xrgb8888 on the fly to rgb888 or rgb565
(depending on display resolution).  We could pull off the same trick
here and convert to rgb332 (assuming we can program the palette with the
color cube needed for that).  Wouldn't look pretty, but would probably
work better than expecting userspace know what color palettes are in
2021 ...

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
