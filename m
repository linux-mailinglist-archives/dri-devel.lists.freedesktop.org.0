Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA65A5FD90
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 18:20:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C2B10E8FB;
	Thu, 13 Mar 2025 17:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O/BqQBC+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F1F10E8FB
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 17:20:32 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso11690685e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 10:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741886431; x=1742491231; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5n5FOrDMxIl7+CKikAilniGBcZDmRdoDO+HttS3RzGI=;
 b=O/BqQBC++mPnqbTo+vq5XFeCBpjk4Len0SDqqyjWeitJWy8W1Ld7DFbRvKp1Q08GJ+
 1kW9E2PbdVDfoYThB0v49O3ehYNtou8Sl0ul5BdUeXejy0a+te1FRm60AW/oqNPUDa+d
 +edWvdOI3fc4xVQJ/fGSKrlldlcl/n6uZ6RB1Hno4dONESJ9gCkTfR70TUYPyAyspxOw
 QvjlwqCU7ER3BKiuMkzQiHfCZVuXecBEnLPlFa+e8SnQZpJh68XvdsOJmoDMgjI7Wr7I
 kXhwqHrD3uieEdf/+rzflGtMucS5uhRt84kKI+VVrr9lTVxBbgjWw0Q697ivOQ2rhCHy
 3DGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741886431; x=1742491231;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5n5FOrDMxIl7+CKikAilniGBcZDmRdoDO+HttS3RzGI=;
 b=LfuXBTaa4ukARa/YVpcRYtSpNoqSkWTLuZLjXefQcVp/lGBXOpOeM13vz+/VkmwblX
 OC+Zm5ydFYRQclICfa4aNnBmH/pgViCuhMGCLrD97VHOwP0UsvFD6TY1ZP6Ie3ji1xj3
 ObSKm+91TUjwZqdGQKzvyPfQBs9JQGPZcLrsaoj2k8C+Ug9wAhPMvGW3DoRhUNX+TGC9
 y44RMrCEafXWQu1b8MHNSYqryEE6ba5ZInT/4fKsNqntqK9BxvwtR0UzWDRBqq/OSPIO
 87lGCS0dGOo29727muEPSGlpz2xbVEg5Y5+cBbAdYLEmnia8ZRl8i3kZjpXAxG0aacFp
 2xjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwTQqRvk+nGdGmlUhgCiTQXtaxlyKzrfrT+XtmKfzTDkpoG+MnLkAW1Y/G4llQs9saw9rKM4OrHvU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7gblCRgpKvdRZDvjScYmMgUeV4aElSno9rK+wT2fCV5DKFnSj
 Sg5PMX8N5RCNEHWk0yih9Sat36SENTFMrGm1uwreWa/+enDz1FEe
X-Gm-Gg: ASbGnct6/rllhhTRsdyRt/nAPeSt8yeAWQzpDwe4qUtheEnATg6WDV7cs7gyy7QJNOJ
 BZE5MqbGs7yuTYAGDOzpHmgFyNg8b01WWMpBqvPupr1MuiP3VkjPiSL0Vi6TQ8ia790zgK76dw5
 HU4yK0jazNrVZAVN+R5HrUXZg0hTKKk5DCx4MKW/tb5Mobp51p8+r6CPDt7Innf7i0Yoic+FVLB
 S0y7/WsqDfLEy5h7+JlU9GYtjrLocOQrMp5FHsIxH6BViEca+2jghUgPRZEY8KJYQGLksmtLaaK
 RPbqZ4hsfiT+MjCzSO0cNoICRZM9x7P3YfANGrdz7Q==
X-Google-Smtp-Source: AGHT+IGY1dnvqu4GFNk7LQUmWmVG9IqWcp0nb9/axOK/G/ANmQOX6qhs7T+74c8yk2G/jRPLATat1g==
X-Received: by 2002:a05:600c:4f01:b0:43d:683:8cb2 with SMTP id
 5b1f17b1804b1-43d1d8b1477mr5823695e9.14.1741886430553; 
 Thu, 13 Mar 2025 10:20:30 -0700 (PDT)
Received: from fedora ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a73127esm61367695e9.8.2025.03.13.10.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:20:30 -0700 (PDT)
Date: Thu, 13 Mar 2025 18:20:27 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Greg KH <gregkh@linuxfoundation.org>, Jonathan.Cameron@huawei.com,
 airlied@gmail.com, aleksander.lobakin@intel.com,
 andriy.shevchenko@linux.intel.com, bhelgaas@google.com,
 broonie@kernel.org, dakr@kernel.org,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, louis.chauvet@bootlin.com,
 lukas@wunner.de, lyude@redhat.com,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, mripard@kernel.org, quic_zijuhu@quicinc.com,
 rafael@kernel.org, robin.murphy@arm.com,
 rust-for-linux@vger.kernel.org, simona@ffwll.ch, tzimmermann@suse.de
Subject: Re: [PATCH v4 9/9] drm/vkms: convert to use faux_device
Message-ID: <Z9MT23hgX2c21xNA@fedora>
References: <2025022643-scouting-petticoat-492b@gregkh>
 <20250311172054.2903-1-jose.exposito89@gmail.com>
 <2025031218-oxidize-backing-e278@gregkh>
 <Z9LqHcj4n7Dd8A-H@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z9LqHcj4n7Dd8A-H@phenom.ffwll.local>
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

On Thu, Mar 13, 2025 at 03:22:21PM +0100, Simona Vetter wrote:
> On Wed, Mar 12, 2025 at 07:22:07AM +0100, Greg KH wrote:
> > On Tue, Mar 11, 2025 at 06:20:53PM +0100, José Expósito wrote:
> > > Hi everyone,
> > > 
> > > > On Tue, Feb 25, 2025 at 02:51:40PM +0100, Louis Chauvet wrote:
> > > > > 
> > > > > 
> > > > > Le 25/02/2025 à 12:41, Thomas Zimmermann a écrit :
> > > > > > Hi
> > > > > > 
> > > > > > Am 10.02.25 um 15:37 schrieb Louis Chauvet:
> > > > > > > On 10/02/25 - 13:30, Greg Kroah-Hartman wrote:
> > > > > > > > The vkms driver does not need to create a platform device, as there is
> > > > > > > > no real platform resources associated it,  it only did so because it was
> > > > > > > > simple to do that in order to get a device to use for resource
> > > > > > > > management of drm resources.  Change the driver to use the faux device
> > > > > > > > instead as this is NOT a real platform device.
> > > > > > > > 
> > > > > > > > Cc: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > > > > > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > > > > > > > Cc: Simona Vetter <simona@ffwll.ch>
> > > > > > > > Cc: Melissa Wen <melissa.srw@gmail.com>
> > > > > > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > > > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > > > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > > > > Cc: David Airlie <airlied@gmail.com>
> > > > > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > > > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > > > > > > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > > > 
> > > > > > Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > > 
> > > > > > > Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > > > > Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > > > > 
> > > > > > > Thanks for the modification, it seems to work.
> > > > > > 
> > > > > > Should this patch be merged through DRM trees? drm-misc-next is at
> > > > > > v6.14-rc4 and has struct faux_device.
> > > > > 
> > > > > Hi,
> > > > > 
> > > > > I was not aware the faux-device was merged, as it is a new feature, I
> > > > > expected it to reach drm-misc-next on 6.15-rc1.
> > > > 
> > > > I added it to Linus's tree just so that DRM could get these changes into
> > > > their tree now :)
> > > > 
> > > > > I plan to merge [1] today/tomorrow (well tested with platform_device), and
> > > > > then I will submit an updated version of this patch (only trivial conflicts,
> > > > > but never tested with multiple VKMS devices).
> > > > > 
> > > > > [1]:https://lore.kernel.org/all/20250218101214.5790-1-jose.exposito89@gmail.com/
> > > > 
> > > > Great, thanks!
> > > > 
> > > > greg k-h
> > > 
> > > Testing this patch again as part of some IGT tests I'm working on,
> > > I noticed that, applying this patch on top of the latest drm-misc-next
> > > triggers a warning at drivers/gpu/drm/drm_gem.c:571, in
> > > drm_gem_get_pages():
> > > 
> > >     if (WARN_ON(!obj->filp))
> > >             return ERR_PTR(-EINVAL);
> > 
> > I don't see how the faux bus change would have anything to do with a
> > filp as that's not related as far as I can tell.  But I don't know the
> > drm layer at all, where does that filp come from?
> 
> Yeah that filp is the shmem file that backs gem bo. That's very far away
> from anything device/driver related datastrctures. If this is a new
> failure due to the aux bux conversion then it would be really surprising.

Agreed, I find it surprising, but reverting the patch removes the warning.

It's most likely an issue on my side, but I decided to double check just
in case someone else is also seeing this warning.

Jose

> -Sima
> 
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
