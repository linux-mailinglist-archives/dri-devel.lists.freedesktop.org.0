Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9907C9D4D16
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 13:46:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C9010E403;
	Thu, 21 Nov 2024 12:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="R25ypJFP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE4910E403
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 12:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732193167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IFClpgALPZSSTKDulZ/u/muYW6GUhkLPXSWL+/+/Pyc=;
 b=R25ypJFPRRM59cRW1lgS2JZvdeysXsu2Aovioxf+0A0v9wzQyppgLRbu1N70vObeqFd+Uh
 EGSZH45XjRXf0Vrrv4ceGKmkgvvga4REUDEC7PFocQwiP86sZAjFWUR7hZq29N3jeTedHp
 q8sxKpMtcYaaXg3Wog9n6Bxb/t8t6WM=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-517-1drq5v3GNiesiVtylc82ew-1; Thu,
 21 Nov 2024 07:46:04 -0500
X-MC-Unique: 1drq5v3GNiesiVtylc82ew-1
X-Mimecast-MFC-AGG-ID: 1drq5v3GNiesiVtylc82ew
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 249901953943; Thu, 21 Nov 2024 12:46:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.164])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9FBD3195E480; Thu, 21 Nov 2024 12:46:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 41A8218010BF; Thu, 21 Nov 2024 13:45:59 +0100 (CET)
Date: Thu, 21 Nov 2024 13:45:59 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org, 
 virtualization@lists.linux.dev
Subject: Re: [PATCH 0/2] drm/cirrus: Don't pretend to operate hardware
Message-ID: <c2x3wtnks5elcieyfydireaadozqx3qojvxb2rdqhgciocakxs@xniq2fao63nj>
References: <20241029143928.208349-1-tzimmermann@suse.de>
 <c7c3d747-c142-446b-95dc-2e25874d2643@suse.de>
MIME-Version: 1.0
In-Reply-To: <c7c3d747-c142-446b-95dc-2e25874d2643@suse.de>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BbsYyv6tKFpx_C2FfB_7mI2BgHSnWRbF9zSr3KrI3Wg_1732193163
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

On Thu, Nov 21, 2024 at 09:25:11AM +0100, Thomas Zimmermann wrote:
> ping ping

> >    drm/cirrus: Use virtual encoder and connector types
> >    drm/cirrus: Rename to cirrus-qemu

Hmm, matter of taste.  I would not have invested that effort, but I have
no objections either.  So:

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd

