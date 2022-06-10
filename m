Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3865466B9
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 14:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8129710E995;
	Fri, 10 Jun 2022 12:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6332A10E94E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 12:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654864596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wys6hZiO6Dm7u2mX+PNhPSFXIUQyzI+/usnVOGfO2gg=;
 b=b/uiX697HaVuoP/B4MB6c9BNcONtYVB0gPRXJUnz1KubDALq0Mr6y5jRE51vtitcU45t24
 xl3e5q89H4eIXi8NYBHKe0dj2de+vcK/df6p/CPAWCtp0XSncShu2Z+mGXdnLSzwiKY0kr
 IsLMDiquGu0Kz6wBVslNxrrZhw6njUQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-RCzI3wE_MYGD37cMeSZR5Q-1; Fri, 10 Jun 2022 08:36:33 -0400
X-MC-Unique: RCzI3wE_MYGD37cMeSZR5Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D04E51C18272;
 Fri, 10 Jun 2022 12:36:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9234D1121314;
 Fri, 10 Jun 2022 12:36:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 82C8D18000AA; Fri, 10 Jun 2022 14:36:29 +0200 (CEST)
Date: Fri, 10 Jun 2022 14:36:29 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Message-ID: <20220610123629.fgu2em3fto53fpfy@sirius.home.kraxel.org>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <YqMDoSMOL2rsfJj/@phenom.ffwll.local>
 <lcIVipq8mkBAPioQAVQmwsM_Gwo0e9fd2334yGSvIW6uEIEElwUrTe-x9J9h29TB1H3NY3liNCohaXDyjslDFIqxPZNSPbSPJ3vctA2jEAk=@emersion.fr>
 <YqMTk9C8/g1buL+8@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <YqMTk9C8/g1buL+8@phenom.ffwll.local>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
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
Cc: Hans de Goede <hdegoede@redhat.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 krastevm@vmware.com, Pekka Paalanen <ppaalanen@gmail.com>,
 mombasawalam@vmware.com, Thomas Zimmermann <tzimmermann@suse.de>,
 wayland-devel <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> > As Pekka mentionned, I'd also like to have a conversation of how far we want to
> > push virtualized driver features. I think KMS support is a good feature to have
> > to spin up a VM and have all of the basics working. However I don't think it's
> > a good idea to try to plumb an ever-growing list of fancy features
> > (seamless integration of guest windows into the host, HiDPI, multi-monitor,
> > etc) into KMS. You'd just end up re-inventing Wayland or RDP on top of KMS.
> > Instead of re-inventing these, just use RDP or waypipe or X11 forwarding
> > directly.

> > So I think we need to draw a line somewhere, and decide e.g. that virtualized
> > cursors are fine to add in KMS, but HiDPI is not.

What is the problem with HiDPI?  qemu generates standard edid blobs,
there should be no need to special-case virtualized drivers in any way.

What is the problem with multi-monitor?  That isn't much different than
physical multi-monitor either.

One little thing though:  On physical hardware you just don't know which
monitor is left and which is right until the user tells you.  In case of
a virtual multi-monitor setup we know how the two windows for the two
virtual monitors are arranged on the host and can pass that as hint to
the guest (not sure whenever *that* is the purpose of the
suggested_{x,y} properties).

> It's getting a bit far off-topic, but google cros team has an out-of-tree
> (at least I think it's not merged yet) wayland-virtio driver for exactly
> this use-case. Trying to move towards something like that for fancy
> virtualized setups sounds like the better approach indeed, with kms just
> as the bare-bones fallback option.

virtio-gpu got the ability to attach uuids to objects, to allow them
being identified on the host side.  So it could be that wayland-virtio
still uses kms for framebuffers (disclaimer: don't know how
wayland-virtio works in detail).  But, yes, all the scanout + cursor
handling would be out of the way, virtio-gpu would "only" handle fast
buffer sharing.

take care,
  Gerd

