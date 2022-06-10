Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2640546658
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 14:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C88AB10EF8B;
	Fri, 10 Jun 2022 12:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B9510EF86
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 12:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654863247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WR1K58LGW8UUBKQRHKfvZsRKVXPRYZxOj4nAVmRS2ho=;
 b=fp+EB6QbQsXY3BAdNHMUtbI1zAklHIeNJMTXjJKpYZRQ0Y1Tbr3fhyqNOUskVZy/eVN2a3
 YOc6GpbHT7w2j2vbTK8I+x6LXt5YkqJwG31tssTS2hRsjOrAPsMsMxrIjNlHfFSfiWG4Vt
 BX9L/ZK5HmzByqXAja5UYPvXiQpvbL8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-98c7Ka81OvCo50J8hSI7aQ-1; Fri, 10 Jun 2022 08:14:03 -0400
X-MC-Unique: 98c7Ka81OvCo50J8hSI7aQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECDEA1C05AB9;
 Fri, 10 Jun 2022 12:14:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A2A22492C3B;
 Fri, 10 Jun 2022 12:14:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D180F18000AA; Fri, 10 Jun 2022 14:03:54 +0200 (CEST)
Date: Fri, 10 Jun 2022 14:03:54 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Message-ID: <20220610120354.ey2puw53eb4hzww7@sirius.home.kraxel.org>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <YqMDoSMOL2rsfJj/@phenom.ffwll.local>
 <YqMH14MEqGZtujfk@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <YqMH14MEqGZtujfk@phenom.ffwll.local>
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
Cc: Hans de Goede <hdegoede@redhat.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 krastevm@vmware.com, Pekka Paalanen <ppaalanen@gmail.com>,
 mombasawalam@vmware.com, Thomas Zimmermann <tzimmermann@suse.de>,
 wayland-devel <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> >   4. make sure the hotspot property is only set on VIRTUAL_CURSOR planes
> >   and nothing else in the rebased patch series
> 
> Simon also mentioned on irc that these special planes must not expose the
> CRTC_X/Y property, since that doesn't really do much at all. Or is our
> understanding of how this all works for commandeered cursors wrong?

Depends.  In some cases the pointer position is a one-way host->guest
ticket (via tablet device).  In some cases the other direction works too
and the guest can warp the mouse pointer to another place on the host
display.  The guest can't easily figure whenever warp works or not
because that depends on host-side configuration the guest has no insight
to.

take care,
  Gerd

