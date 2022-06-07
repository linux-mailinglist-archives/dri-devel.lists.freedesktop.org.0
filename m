Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B77540163
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 16:30:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2415D10EF5D;
	Tue,  7 Jun 2022 14:30:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2125910E257
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 14:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654612231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=weYZHvf2Pb55a7XkzVb9Fs0gze+mb7uAQgT1g2Q6xUc=;
 b=Jmkh0v35Zym4o7tF5Nn6JW9TZjOtDaKcXku/c6Qgx+aG6iXcOF08DcOrwjPjsKEPk582/r
 Hy6bqw3o1bK/C/hDZdUhUmk0cfEq7XH4RJPn9/J+BDaC8USyPTAjEBBL7gtc0bpqn/FiwI
 dUL2c8L25snKpOxjt1jEuZrVeG0e0dE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-MIA-mb97P06mINpZ80vtTg-1; Tue, 07 Jun 2022 10:30:28 -0400
X-MC-Unique: MIA-mb97P06mINpZ80vtTg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED432294EDC2;
 Tue,  7 Jun 2022 14:30:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48501492C3B;
 Tue,  7 Jun 2022 14:30:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1BEC91800081; Tue,  7 Jun 2022 16:30:23 +0200 (CEST)
Date: Tue, 7 Jun 2022 16:30:23 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Message-ID: <20220607143023.jz5qt2jktusstb5t@sirius.home.kraxel.org>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <20220607110707.02eccda5@eldfell>
MIME-Version: 1.0
In-Reply-To: <20220607110707.02eccda5@eldfell>
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

> Why are pointer cursors misplaced on paravirtualized drivers?
> 
> It is because the paravirtualized drivers or VM viewers do *not* place
> the cursor plane at the CRTC_X, CRTC_Y position in the guest CRTC area.
> This is obvious: if CRTC_X, CRTC_Y were honoured, there would be no
> misplacement.
> 
> Instead, the VM stack plays clever tricks with cursor planes. I have
> understood only one of those tricks, and it goes something like this.
> To improve hand-eye coordination, that is to reduce the hand-to-eye
> response time a.k.a latency, the VM guest KMS driver relays the cursor
> plane separately to the VM viewer application.

Yes, the cursor is sent separately.

> The VM viewer application presents the cursor plane content by pushing
> them to the host window system as the pointer cursor.

Yes (i.e. gdk_window_set_cursor() on the host).

> This means the host window system will be autonomously moving the
> cursor plane image around, completely disregarding what the guest KMS
> client programmed into CRTC_X, CRTC_Y.

Yes.

That is combined with a virtual input device sending absolute
coordinates (i.e. tablet), so mouse clicks land at the correct place.
And that is the point where having the hotspot information is essential
on the host side.

> Given this UAPI contract, it is very easy for userspace to make the
> conclusion that a cursor plane is just another plane it can use for
> whatever it wants. Weston and wlroots indeed leverage this, putting
> also normal windows and other stuff to the cursor plane when they
> happen to fit.

virtual machine display devices typically offer small (64x64) cursor
planes, so unlike the 512x512 planes I've seen offered by i915 they are
hardly usable for anything but cursors.  Likewise additional overlay
planes typically not offered, so the classic primary+cursor setup is
pretty much the only reasonable option userspace has.

> I believe the solution has two parts:
> 
> - The guest KMS driver needs to know whether the guest userspace is
>   prepared for the cursor plane being commandeered. If userspace does
>   not indicate it is prepared for it, commandeering must not happen.

Yes.  That isn't much of a problem in practice though due to the limited
driver/device offerings outlined above.

> - Cursor hotspot needs new KMS properties, and a KMS client must set
>   them if the KMS client indicates it is prepared for cursor plane
>   commandeering.

Yes, and that is what hurts in practice and thus caused the blacklists
being created.

> There are further problems with cursor plane commandeering. The 2020
> email thread Simon linked to discusses the problem of pointer devices:
> if VM guest userspace takes pointer input from multiple sources, how
> will the VM stack know which virtual input device, if any, should drive
> the cursor plane position?

Typically there is a communication path from guest to host for pointer
movements (i.e. crtc_x + crtc_y updates), so the host knows where the
guest wants the cursor plane being placed.  So in case the pointer is
moved by other means (different input device, some application warping
the pointer, ...) the host can adapt.

Nevertheless behavior is not consistent here because in some cases the
feedback loop is not wired up end-to-end.  The spice protocol has a
message type for that, so pointer warps work.  The vnc protocol has not,
so they don't.

> To me the answer to this question seems it could be intimately tied to
> the first problem: commandeering the cursor plane is allowed only if
> guest userspace tells the guest KMS driver which input device the
> cursor plane shall be related to. If no input device is indicated,
> then commandeering must not happen.

Why require an input device?  I just don't see how that would help.

For allowing the host freely move around the cursor place
("commandeering") I do see the point in enforcing that from a design
point of view, although I doubt it'll buy us much in practice given we
have broken drivers in the wild so userspace will continue to work with
blacklists.

Having some capability to negotiate "commandeering" between kernel and
userspace certainly makes sense, so we can get of the black lists
long-term (although it'll probably takes a few years ...).

> I can understand if people do not want to tackle this question,
> because it probably has not been a problem yet.

On a standard guest this isn't a problem indeed because there is only
one input device and only one crtc.

It actually is a problem for multihead configurations though.  Having
some way to map input devices to scanouts would actually be helpful.
Years ago I checked how this works for touchscreens to see whenever it
is possible to leverage that for VMs somehow.  There wasn't some obvious
way, and I forgot the details meanwhile ...

take care,
  Gerd

