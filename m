Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0FAABB1EB
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 00:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E0510E2B6;
	Sun, 18 May 2025 21:54:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VTnnvjtw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7454C10E2B6
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 21:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747605246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uIaIOnVIIar3oPXWrnvC7B8zNsFcZdASTSy76IqR298=;
 b=VTnnvjtwe2u2xdP0F7+DZ6n8k95lYaxxXZZLiJm2L+lpWzFGnIjRVwBUKe/HhDq0x5LWyH
 QNk3rkEvEP1GlML1MzLM/0vz2t7F2ekV0Ios06sxQkESmVw6n2lWyXo2Xphrsjaj/iplva
 3MNAWwq/3ds3SGKnlA4WMn16jOUX99U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-IGBXB3fDNFGx8DijDKuq1Q-1; Sun, 18 May 2025 17:54:05 -0400
X-MC-Unique: IGBXB3fDNFGx8DijDKuq1Q-1
X-Mimecast-MFC-AGG-ID: IGBXB3fDNFGx8DijDKuq1Q_1747605244
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43d734da1a3so20299245e9.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 14:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747605244; x=1748210044;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uIaIOnVIIar3oPXWrnvC7B8zNsFcZdASTSy76IqR298=;
 b=uC49hCQmp3IntRVVFcL1A8Npv7I635IumxXvE4TF92WTUi6hMOs72LGHPTQRaGqIeP
 ZlVnCyzE3yx62YNgMdknD7LpXPevkyIlkXWb/ei0GFX75zFwnwCygPykCd2z///BmyO0
 tloO/uoKfjhP+FigsmMhvrbsf7yqDWn0xqrJA7pi2D6p5v9ynWRH97FzUFciLaBySZei
 X4ta1b/vQzeK9fMlcCyS9ViF6HPSB8v9sZWPtyioB6Wiyo9B5HLlbMEQYgZam4GI4mmo
 XS8dnznIaXR/Nu8vZvc1o98e0En7BwRVTnebt+tn0HNhkhcDjfWAyHuZdgAWJ7PTRbSg
 WgKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUL9KccEiOVlJEuvBIQxo7yk5clS373qBdh1iuv+Ir+lLYKipHGfMxWWU8iq4yz4m1sVwMFOGi9pr4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsuDstFisExjvFDAQKJGRghxQZYWHk+HQuoJTXe+ZeV8oX8n+X
 eX9ySx3KHBU4d/QhFJa3V6rVYnxwyo4Ajx0gT7ExrvRv0HdVt1IsxcYUP2Kw+rivLPDBosZFku4
 wuoPgHkobKZvLT1xEowveRH6f6yRQ7IElk7PM7k2V8F2IE9Y04WxWTXLPYsaIpNhLmPVgCQ==
X-Gm-Gg: ASbGncsM9NqCQ5MlqQRVAKxnCIDMCnr/uAxM/s/DRvTxygm0K/qGD1BWPFb95tlrJoK
 UXIgTT3rlo4s1HWxbW3IGa7yESE37GS1wGU/ImtbJVpQu8FI91oOocAYHapaWw8fRbpK4vyyvNo
 NpUU+QEYV5YG3Zg9nurLYHlutm3i7uJv71Q06QKWXY9fVKyzd5+ipvajTlftODoUdzYZfxS1VXi
 BFtQ5Hkc953ANa+qlaiXkOdy0emkOkjTFfKvKTsc0XPIdYz7QiNnnvDsuI81ufKLxu5ZNGiBZj5
 2/JcdQ==
X-Received: by 2002:a05:600c:3ca0:b0:441:d438:4ea5 with SMTP id
 5b1f17b1804b1-442ff0328b8mr73538005e9.20.1747605244355; 
 Sun, 18 May 2025 14:54:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvqrHVss6NuJi0HAtzkEcNBJlsY/d82el2/IApsycphIjM1sMh75zLHZaVQnejymivmh22FQ==
X-Received: by 2002:a05:600c:3ca0:b0:441:d438:4ea5 with SMTP id
 5b1f17b1804b1-442ff0328b8mr73537855e9.20.1747605244018; 
 Sun, 18 May 2025 14:54:04 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35e49262fsm10020425f8f.44.2025.05.18.14.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 14:54:02 -0700 (PDT)
Date: Sun, 18 May 2025 17:53:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Eric Auger <eric.auger@redhat.com>, David Airlie <airlied@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/virtio: implement virtio_gpu_shutdown
Message-ID: <20250518175332-mutt-send-email-mst@kernel.org>
References: <20250507082821.2710706-1-kraxel@redhat.com>
 <urpxto3fgvwoe4hob2aukggeop4bcsyb7m5wflgru4c3otd6rq@aktopqufgxom>
 <iptz2uxajkl3l62piqu6tq5pembbmqho667otbaj7nneh5vk3r@sxdvm7e57nae>
MIME-Version: 1.0
In-Reply-To: <iptz2uxajkl3l62piqu6tq5pembbmqho667otbaj7nneh5vk3r@sxdvm7e57nae>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0mt-MMw3OF5aFFHBYtYnSim0-asBG4ZzbzvlaTM9tM0_1747605244
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

On Tue, May 13, 2025 at 12:18:44PM +0200, Gerd Hoffmann wrote:
> > > diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
> > > index e32e680c7197..71c6ccad4b99 100644
> > > --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> > > +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> > > @@ -130,10 +130,10 @@ static void virtio_gpu_remove(struct virtio_device *vdev)
> > >  
> > >  static void virtio_gpu_shutdown(struct virtio_device *vdev)
> > >  {
> > > -	/*
> > > -	 * drm does its own synchronization on shutdown.
> > > -	 * Do nothing here, opt out of device reset.
> > > -	 */
> > > +	struct drm_device *dev = vdev->priv;
> > > +
> > > +	/* stop talking to the device */
> > > +	drm_dev_unplug(dev);
> > 
> > I'm not necessarily opposed to using drm_dev_unplug() here, but it's
> > still pretty surprising to me. It's typically used in remove, not
> > shutdown. The typical helper to use at shutdown is
> > drm_atomic_helper_shutdown.
> > 
> > So if the latter isn't enough or wrong, we should at least document why.
> 
> The intention of this is to make sure the driver stops talking to the
> device (as the comment already says).
> 
> There are checks in place in the virt queue functions which will make
> sure the driver will not try place new requests in the queues after
> drm_dev_unplug() has been called.  Which why I decided to implement it
> that way.
> 
> drm_atomic_helper_shutdown() tears down all outputs according to the
> documentation.  Which is something different.  I don't think calling
> drm_atomic_helper_shutdown() will do what I need here.  Calling it in
> addition to drm_dev_unplug() might make sense, not sure.
> 
> Suggestions are welcome.
> 
> take care,
>   Gerd


I suggest adding comments in code explaining why it's approriate here.
Want to try?

-- 
MST

