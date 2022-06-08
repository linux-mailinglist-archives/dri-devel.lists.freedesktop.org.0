Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1EA543566
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 16:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E538E10E0E9;
	Wed,  8 Jun 2022 14:52:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D369C10E0E9
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 14:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654699969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1nJCzBw/VDPevDgRlvZ9FGPiJg9YtdUDpNJg0CnjsS0=;
 b=VCgqIT3nlDPNec4DVbGqa4bfSyWci0tEOj1wZghFTCGslLRwQ6otV0qp5bQNqHJlf9jaO9
 HhO5+h0X2IFGv1A4P1DLnWGz9vTckISzIEtUR4FgL6nqiaWFTZqK6G02yBMUZ11nBwRcG+
 +U9MzmTHzEBCeTKJGq7iX9vu/hYcxPk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-ENdgiIqNMQ2-fhyEHpjnFQ-1; Wed, 08 Jun 2022 10:52:46 -0400
X-MC-Unique: ENdgiIqNMQ2-fhyEHpjnFQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CB3529DD9A4;
 Wed,  8 Jun 2022 14:52:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AF45492C3B;
 Wed,  8 Jun 2022 14:52:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1851B18003AA; Wed,  8 Jun 2022 16:52:43 +0200 (CEST)
Date: Wed, 8 Jun 2022 16:52:43 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Message-ID: <20220608145243.gyna5kb7f2epsr7r@sirius.home.kraxel.org>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <20220607110707.02eccda5@eldfell>
 <20220607143023.jz5qt2jktusstb5t@sirius.home.kraxel.org>
 <20220608105354.6bf881d0@eldfell>
MIME-Version: 1.0
In-Reply-To: <20220608105354.6bf881d0@eldfell>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
Cc: krastevm@vmware.com, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, mombasawalam@vmware.com,
 Thomas Zimmermann <tzimmermann@suse.de>,
 wayland-devel <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> > Typically there is a communication path from guest to host for pointer
> > movements (i.e. crtc_x + crtc_y updates), so the host knows where the
> > guest wants the cursor plane being placed.  So in case the pointer is
> > moved by other means (different input device, some application warping
> > the pointer, ...) the host can adapt.
> 
> Would it not be better to be explicit about it? To avoid fragile
> heuristics.

Explicit about what exactly?  Whenever pointer warps via crtc_x + crtc_y
update work or not?  Not so easy ...

> > Nevertheless behavior is not consistent here because in some cases the
> > feedback loop is not wired up end-to-end.  The spice protocol has a
> > message type for that, so pointer warps work.  The vnc protocol has not,
> > so they don't.

... for example qemu allows to enable both spice and vnc protocols.

> > It actually is a problem for multihead configurations though.  Having
> > some way to map input devices to scanouts would actually be helpful.
> > Years ago I checked how this works for touchscreens to see whenever it
> > is possible to leverage that for VMs somehow.  There wasn't some obvious
> > way, and I forgot the details meanwhile ...
> 
> Ah, that's the other way around, right? To tell guest OS which output
> an absolute input device is relative to?

Yes.

> Having a standard for naming outputs is hard it seems, and there is
> also the connector vs. monitor dilemma. I guess absolute input devices
> would usually want to be associated with the (real or virtual) monitor
> regardless of which (real or virtual) connector it is connected to.

Yes, this should be linked to the monitor not the connector.  qemu
learned to generate edid blobs a while back, so we actually have
virtual monitors and can create virtual monitor properties for them.

take care,
  Gerd

