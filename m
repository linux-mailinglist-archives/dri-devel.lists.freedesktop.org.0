Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B86BD95EA81
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 09:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C1810E12B;
	Mon, 26 Aug 2024 07:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SprSpcW/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BDF10E12A
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 07:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724657586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OGe0vbap31V8Ae80wTyu3pLN9tA4WkQLH/KHylBQkqo=;
 b=SprSpcW/ypmTnpdpFo9gtlKz64hUTVpCj5KHvrvMJ3UOGE1q701tZJ9+2Pk9/t7X2L4NE1
 VQwimveweeXzQKvUFKTgIjpNhUz73cykq+foNyo4dFzCBjVl2kOvlvdBsjZNe6gs1sfgMH
 L63WbfKpmptR/hrquwFfNoT0k6sRsFM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-392-wqz3LUD4M6O_q2d73xZ7_g-1; Mon,
 26 Aug 2024 03:33:02 -0400
X-MC-Unique: wqz3LUD4M6O_q2d73xZ7_g-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1D7A11954B08; Mon, 26 Aug 2024 07:33:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.20])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 688AB196BBF1; Mon, 26 Aug 2024 07:33:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1261A1800631; Mon, 26 Aug 2024 09:32:58 +0200 (CEST)
Date: Mon, 26 Aug 2024 09:32:58 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org, 
 maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev
Subject: Re: [PATCH 00/10] rm/bochs: Modernize driver
Message-ID: <zh63tmpp57ou4y3j54grngvqwqpls7hyw2eb44a6qjcpx6sb24@v5n7ri6aa6ny>
References: <20240823124422.286989-1-tzimmermann@suse.de>
 <sksjddgidfrk4bvcxvb46khevp4a4nfvl2holgdw636wld7oov@vdbcvdf3ch6m>
 <42389f21-1ddb-428d-8471-92eae5a5f45a@suse.de>
MIME-Version: 1.0
In-Reply-To: <42389f21-1ddb-428d-8471-92eae5a5f45a@suse.de>
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

> > So this probably makes sense, but I'd like to see a bit more background
> > information ...
> 
> The difference is in damage handling.
> 
> The old code had two BOs in video memory and flipped between them. IDK the
> details of the old rendering, but from the massive flickering of the cursor,
> I assume that X11's internal either copies a full buffer during each redraw,
> or doesn't really handle damage well. It could also happen that X didn't use
> a shadow buffer for rendering. Bochs didn't request one. Without, drawing to
> I/O memory is really slow. If that applies to virtual I/O memory as well
> IDK.
> 
> The new driver code only copies areas that have been changed from rendering.
> The flickering is gone and the overall update performance is acceptable.

Thanks.

Have you tried wayland and fbcon too?

> > On vram sizes:  The default qemu vram size (16M) should be fine for the
> > default display resolution (1280x800).  For FullHD vram size should be
> > doubled (-device VGA,vgamem_mb=32).
> 
> Right. Bochs never really tested that.  So I saw something like 5k by
> 3k resolutions on my test setup with 16 MiB.

IIRC there used to be a check in the past, limiting resolutions to
buffer sizes which fit into vram twice (to allow for double buffering).

Crude heuristic.  I do not remember when and why it went away.  Also
I've seen wayland use three not two buffers ...

> Now that video-memory requirements for each mode can be calculated
> easily, we can sort out the invalid modes.

Yes.  Also I think trading higher main memory (shmem) usage for lower
vram usage is good overall.  Main memory can be uses for something else
if not needed whereas vram sits around unused.

take care,
  Gerd

