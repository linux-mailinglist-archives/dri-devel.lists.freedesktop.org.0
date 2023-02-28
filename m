Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE43F6A52F8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 07:28:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D668510E4A1;
	Tue, 28 Feb 2023 06:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A403310E49D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 06:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677565695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iFyJ4pdf0AOcSeP1Ng1BKT/ZjTRTFBASYA1oXOLwdZw=;
 b=OP4Vzpw4ki39Ri6qjfXsfoM0qUvp4pght9hM0IbjQBeN4KjfuL/u5wo6P3WBIoQd2Hldc6
 VDFlqvkF7NsUpc+445JP9LnfEDbcuxOUyQvcBlkVXuZlbNY2XZt+Fe+VgO5lGL4qTTLsMw
 6TbrQGnSL1TnSwcZhXiBICUuXiNrhuM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-CQ2WxJ70ONW4n0-8EN7DVw-1; Tue, 28 Feb 2023 01:28:11 -0500
X-MC-Unique: CQ2WxJ70ONW4n0-8EN7DVw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0914B101A521;
 Tue, 28 Feb 2023 06:28:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A4716492B12;
 Tue, 28 Feb 2023 06:28:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 477C6180099A; Tue, 28 Feb 2023 07:28:09 +0100 (CET)
Date: Tue, 28 Feb 2023 07:28:09 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/virtio: Add option to disable KMS support
Message-ID: <20230228062809.ccyzgnvizh6jidn4@sirius.home.kraxel.org>
References: <20230224180225.2477641-1-robdclark@gmail.com>
 <20230227063821.dg2gbjjwcekbxyzw@sirius.home.kraxel.org>
 <CAF6AEGsv1G7CPSkCPe3iHGB9JEO4iy+bTbkFLoitmx64U78RJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGsv1G7CPSkCPe3iHGB9JEO4iy+bTbkFLoitmx64U78RJw@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
Cc: Rob Clark <robdclark@chromium.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Ryan Neph <ryanneph@chromium.org>, David Airlie <airlied@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 27, 2023 at 07:40:11AM -0800, Rob Clark wrote:
> On Sun, Feb 26, 2023 at 10:38 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > On Fri, Feb 24, 2023 at 10:02:24AM -0800, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Add a build option to disable modesetting support.  This is useful in
> > > cases where the guest only needs to use the GPU in a headless mode, or
> > > (such as in the CrOS usage) window surfaces are proxied to a host
> > > compositor.
> >
> > Why make that a compile time option?  There is a config option for the
> > number of scanouts (aka virtual displays) a device has.  Just set that
> > to zero (and fix the driver to not consider that configuration an
> > error).
> 
> The goal is to not advertise DRIVER_MODESET (and DRIVER_ATOMIC).. I
> guess that could be done based on whether there are any scanouts, but
> it would mean making the drm_driver struct non-const.

Apparently there is a drm_device->driver_features override,
(amdgpu uses that).  The driver could simply drop the DRIVER_MODESET and
DRIVER_ATOMIC bits in case no scanout is present instead of throwing an
error.

> And I think it is legitimate to allow the guest to make this choice,
> regardless of what the host decides to expose, since it is about the
> ioctl surface area that the guest kernel exposes to guest userspace.

I think it is a bad idea to make that a compile time option, I'd suggest
a runtime switch instead, for example a module parameter to ask the
driver to ignore any scanouts.

take care,
  Gerd

