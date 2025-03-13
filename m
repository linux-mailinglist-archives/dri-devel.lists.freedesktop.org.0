Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAB4A5F7E0
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 15:22:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D1A10E8AE;
	Thu, 13 Mar 2025 14:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="NJTtxVA8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 918AB10E8AE
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 14:22:25 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43cf848528aso9369285e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 07:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1741875744; x=1742480544; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pM9ItXxbsRlMEhlDKad/ZxzQCO48bgp8mPNSaz0V580=;
 b=NJTtxVA8CWLPZIQP0UIV/vdXiM6gVPbjmgzAidFe4I4bPuMkuVDwsMNvq5caLHS68O
 YqgpVjgvWa+6tu5zTj9yh/HjwjHHz07IlipGU7EAXZznEeRlGaRDrhC62oPodTrCq1mS
 Qnyg7GgAhYLK16tI8lm2SE6cmsGzQosKSwqcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741875744; x=1742480544;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pM9ItXxbsRlMEhlDKad/ZxzQCO48bgp8mPNSaz0V580=;
 b=ljBFRUpoOgDH5v0+hSN4NRTlMOzBqHgOUGNHNwTGX1GYGIUHPACBGHuy754nCzmqHq
 iGV+Ut9uMs6irZLC0Rc0PAuvKh6xmqislS4mQ94UQICgt3z0zYXyq8GTkeVHGnB44Ygw
 wrj4ZO2S11qHss6S9dGzr+JdRPXEpKk2A6oSPJHuDf8kq3bm32Wi1z7ODaQHpkO9spk1
 +b5tfB3i4XebVCCInPUcF9oIiaGqiklTj5FJLxCY3g/wSPO3Sghk3GgUYDySG5BfHGV9
 ULpIFeBcVzGdATb/IFsHi1ZwLj1Nd+Yygj2BnFVfMSO6H+1qqntDjnn5UeX0UdJcBH/0
 W7oQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQyUGl/MYFRkSePGkOcNRIDQ/QFU+ROY2C+hrfCTrhqEL/Ipcl0RyIAIu5lnn3EDXqCRm13xruV9o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2TlBj7T6/D4JGLn1qMPgqvH0ZMcZeckkCkoHPnBdi9OvDDTTI
 xIs5Am3IpiogxN/3SG50jxwmd0dV0G7317ij42qvRmvcVa88sTqpwk0FSuuERZ8=
X-Gm-Gg: ASbGnct2UhOnP23bXnvg64rGfziW6H4UXDfSP+88lc8yojmXtl1pvYBy/vjrEzLF0oK
 yAveecqznNW4aYt/Rb7HTLgMMF24jAkxrVyvhe+sNwWmo0O4D8XcdYWGn+JzJ2fdNltZhbVUZRY
 bu5jG1vgFMBE0u8DtaSGydjT89zFjvnNLj4/KSxRB7UNMlKH1I+NMXq2/o4o3Yb0x6SFChzcVoE
 Xzl8cWR+1u/o6usBZSLlXfP/ckoOzPYyzCWJkSARRM9Wcu+QaNzhd5VP1ovDaDxYwj/kbjy1kF2
 aq94tQRJtjj/EvvKENHfc4RqQ+OAc4o+agDl9+QsvrGb8yv/fMvjX9F8
X-Google-Smtp-Source: AGHT+IGjO4FsKbB+Ux6992aYb86YlYMAwm8+sVMZZjUkcAqImTiqnQPTNezrkwgHZ00JdE+45W8X8Q==
X-Received: by 2002:a05:600c:4f14:b0:43d:7a:471f with SMTP id
 5b1f17b1804b1-43d01be7e4bmr125481115e9.18.1741875743785; 
 Thu, 13 Mar 2025 07:22:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df385bsm2245584f8f.4.2025.03.13.07.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 07:22:23 -0700 (PDT)
Date: Thu, 13 Mar 2025 15:22:21 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
 Jonathan.Cameron@huawei.com, airlied@gmail.com,
 aleksander.lobakin@intel.com, andriy.shevchenko@linux.intel.com,
 bhelgaas@google.com, broonie@kernel.org, dakr@kernel.org,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, louis.chauvet@bootlin.com,
 lukas@wunner.de, lyude@redhat.com,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, mripard@kernel.org, quic_zijuhu@quicinc.com,
 rafael@kernel.org, robin.murphy@arm.com,
 rust-for-linux@vger.kernel.org, simona.vetter@ffwll.ch,
 simona@ffwll.ch, tzimmermann@suse.de
Subject: Re: [PATCH v4 9/9] drm/vkms: convert to use faux_device
Message-ID: <Z9LqHcj4n7Dd8A-H@phenom.ffwll.local>
Mail-Followup-To: Greg KH <gregkh@linuxfoundation.org>,
 =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
 Jonathan.Cameron@huawei.com, airlied@gmail.com,
 aleksander.lobakin@intel.com, andriy.shevchenko@linux.intel.com,
 bhelgaas@google.com, broonie@kernel.org, dakr@kernel.org,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, louis.chauvet@bootlin.com,
 lukas@wunner.de, lyude@redhat.com,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, mripard@kernel.org, quic_zijuhu@quicinc.com,
 rafael@kernel.org, robin.murphy@arm.com,
 rust-for-linux@vger.kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de
References: <2025022643-scouting-petticoat-492b@gregkh>
 <20250311172054.2903-1-jose.exposito89@gmail.com>
 <2025031218-oxidize-backing-e278@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025031218-oxidize-backing-e278@gregkh>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Wed, Mar 12, 2025 at 07:22:07AM +0100, Greg KH wrote:
> On Tue, Mar 11, 2025 at 06:20:53PM +0100, José Expósito wrote:
> > Hi everyone,
> > 
> > > On Tue, Feb 25, 2025 at 02:51:40PM +0100, Louis Chauvet wrote:
> > > > 
> > > > 
> > > > Le 25/02/2025 à 12:41, Thomas Zimmermann a écrit :
> > > > > Hi
> > > > > 
> > > > > Am 10.02.25 um 15:37 schrieb Louis Chauvet:
> > > > > > On 10/02/25 - 13:30, Greg Kroah-Hartman wrote:
> > > > > > > The vkms driver does not need to create a platform device, as there is
> > > > > > > no real platform resources associated it,  it only did so because it was
> > > > > > > simple to do that in order to get a device to use for resource
> > > > > > > management of drm resources.  Change the driver to use the faux device
> > > > > > > instead as this is NOT a real platform device.
> > > > > > > 
> > > > > > > Cc: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > > > > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > > > > > > Cc: Simona Vetter <simona@ffwll.ch>
> > > > > > > Cc: Melissa Wen <melissa.srw@gmail.com>
> > > > > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > > > Cc: David Airlie <airlied@gmail.com>
> > > > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > > > > > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > > 
> > > > > Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > 
> > > > > > Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > > > Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > > > 
> > > > > > Thanks for the modification, it seems to work.
> > > > > 
> > > > > Should this patch be merged through DRM trees? drm-misc-next is at
> > > > > v6.14-rc4 and has struct faux_device.
> > > > 
> > > > Hi,
> > > > 
> > > > I was not aware the faux-device was merged, as it is a new feature, I
> > > > expected it to reach drm-misc-next on 6.15-rc1.
> > > 
> > > I added it to Linus's tree just so that DRM could get these changes into
> > > their tree now :)
> > > 
> > > > I plan to merge [1] today/tomorrow (well tested with platform_device), and
> > > > then I will submit an updated version of this patch (only trivial conflicts,
> > > > but never tested with multiple VKMS devices).
> > > > 
> > > > [1]:https://lore.kernel.org/all/20250218101214.5790-1-jose.exposito89@gmail.com/
> > > 
> > > Great, thanks!
> > > 
> > > greg k-h
> > 
> > Testing this patch again as part of some IGT tests I'm working on,
> > I noticed that, applying this patch on top of the latest drm-misc-next
> > triggers a warning at drivers/gpu/drm/drm_gem.c:571, in
> > drm_gem_get_pages():
> > 
> >     if (WARN_ON(!obj->filp))
> >             return ERR_PTR(-EINVAL);
> 
> I don't see how the faux bus change would have anything to do with a
> filp as that's not related as far as I can tell.  But I don't know the
> drm layer at all, where does that filp come from?

Yeah that filp is the shmem file that backs gem bo. That's very far away
from anything device/driver related datastrctures. If this is a new
failure due to the aux bux conversion then it would be really surprising.
-Sima

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
