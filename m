Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB19AFFD61
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 11:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82D510E1FA;
	Thu, 10 Jul 2025 09:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="hTK6sBr1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CE310E1E0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 09:01:40 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4535fbe0299so3949525e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 02:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752138099; x=1752742899; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=K2/LznSCmYVKwKFNuU0Z0iiLvpUCMy311oeOJBZ75MM=;
 b=hTK6sBr1PLt/8ITPbPZcjXQE517YgZ8npm7gd8AKT16KAOWckCAR7fyXzdc8MAbUrt
 Y4grwfOxh6uTbBdjaj9c3hSZ0O5zq33QX+9Ad3PDFyx41NroFjcPj+jTNunvckxJNMRs
 0uLQq/L5VIQgHSySsYwsyXki+2jNZoeaowW0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752138099; x=1752742899;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K2/LznSCmYVKwKFNuU0Z0iiLvpUCMy311oeOJBZ75MM=;
 b=otawNVozr74UN1StPiuNOOkr449TrQNz44KwcVMJqhjsOGykT8xyHYuxHRJ7Cw0uNP
 NyfWZW5LZtVSrzfj8XMVfYat/oq6BSOPx6QHtRJOuXMQ1HEM/3LB90X0yHzsm2XkhsQf
 hPitw9dAPoqUaflweCnjsVUuLucXLdnNVoOpZ5olOxyvbQR1KznGRdpq1+qctuVaqZ0Q
 fKaTJMqukDS3sPf5AkuzxqUWeQnZvxMnwjUpK1FwC5JBIiqJnpqYElbo0RCkbV1YiGKk
 OoLpjBJBlPdtLiGC3SDqvXdTmEtBJnWAQIBS8f49HYr3Sz6LQvwDRFTrGvjMlJClcC6Y
 Tj5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4qHF+EKbWA0evtuiv0+V8CKUoRHsahkxoZOPnjP+6C8UPrQInfL/INiRSgeQ8bI+w7eozJK1CovE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVTX7h8tte50OiTj1EoJImKq3RW+Qgj84s21n0bU0M9k/PxEVJ
 0rxD5JVhgrOq6HQoadhk4nqO9Jwfw4Fl/xaQXPEhjvo00Hgb1jI1bKAHvFCEsPT5VXk=
X-Gm-Gg: ASbGncueuCzXHevcviTNXhBVE8TPRO2KZJ5n+MBi+8K4g30KNZZs/Wjk4y+t9zd7SkB
 YfEYYz2tqkeOvYB8HcI0Glgd14Ncf881ruzVVnXaCgoIcpjwNHPCYpg41gIzzBPzB9Z8CXCnT7J
 jpt9hbOoTKpOU2IP2JLyzHTRK1E4IkCL46t6DTJ+ucSMau8Snk+w24tA/PxX9SSsMgrzEqYoPKJ
 SLOQx/55feSfsKwAvjh6zLXeGi664IPBPIr2pX+L/pm7Xz7bpqukfVVGv9SKM0CSs1a0w9pkUUm
 5tyNfLytCBDQ4f61O7Bun7xlqtc/sLvtOQj7X7HFrHq7D3+qxV45sjI/BtdMEoh8ad+As1FbSQ=
 =
X-Google-Smtp-Source: AGHT+IEeKdDkI23eJxkDuU4LaL9IUbHesRxl7t/mo8aCHd5NIFbIwZzT0l3xl7kc9kueJtXyHlhE+g==
X-Received: by 2002:a05:600c:37c8:b0:442:ccfa:18c with SMTP id
 5b1f17b1804b1-454dedec50dmr10947315e9.32.1752138098825; 
 Thu, 10 Jul 2025 02:01:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d5easm1276143f8f.48.2025.07.10.02.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 02:01:38 -0700 (PDT)
Date: Thu, 10 Jul 2025 11:01:36 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org,
 anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 1/9] drm: Add a vendor-specific recovery method to
 device wedged uevent
Message-ID: <aG-BcFN6M9BtjB2j@phenom.ffwll.local>
References: <20250709112024.1053710-1-riana.tauro@intel.com>
 <20250709112024.1053710-2-riana.tauro@intel.com>
 <aG5xglf8BeGzleWM@phenom.ffwll.local>
 <d42e17ef-30ce-4bf1-9948-7f08fd6f3bac@amd.com>
 <aG56Trd1h5WbWYJt@black.fi.intel.com> <aG6eNcygPshsSlC8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aG6eNcygPshsSlC8@intel.com>
X-Operating-System: Linux phenom 6.12.30-amd64 
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

On Wed, Jul 09, 2025 at 12:52:05PM -0400, Rodrigo Vivi wrote:
> On Wed, Jul 09, 2025 at 05:18:54PM +0300, Raag Jadav wrote:
> > On Wed, Jul 09, 2025 at 04:09:20PM +0200, Christian König wrote:
> > > On 09.07.25 15:41, Simona Vetter wrote:
> > > > On Wed, Jul 09, 2025 at 04:50:13PM +0530, Riana Tauro wrote:
> > > >> Certain errors can cause the device to be wedged and may
> > > >> require a vendor specific recovery method to restore normal
> > > >> operation.
> > > >>
> > > >> Add a recovery method 'WEDGED=vendor-specific' for such errors. Vendors
> > > >> must provide additional recovery documentation if this method
> > > >> is used.
> > > >>
> > > >> v2: fix documentation (Raag)
> > > >>
> > > >> Cc: André Almeida <andrealmeid@igalia.com>
> > > >> Cc: Christian König <christian.koenig@amd.com>
> > > >> Cc: David Airlie <airlied@gmail.com>
> > > >> Cc: <dri-devel@lists.freedesktop.org>
> > > >> Suggested-by: Raag Jadav <raag.jadav@intel.com>
> > > >> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > > > 
> > > > I'm not really understanding what this is useful for, maybe concrete
> > > > example in the form of driver code that uses this, and some tool or
> > > > documentation steps that should be taken for recovery?
> 
> The case here is when FW underneath identified something badly corrupted on
> FW land and decided that only a firmware-flashing could solve the day and
> raise interrupt to the driver. At that point we want to wedge, but immediately
> hint the admin the recommended action.
> 
> > > 
> > > The recovery method for this particular case is to flash in a new firmware.
> > > 
> > > > The issues I'm seeing here is that eventually we'll get different
> > > > vendor-specific recovery steps, and maybe even on the same device, and
> > > > that leads us to an enumeration issue. Since it's just a string and an
> > > > enum I think it'd be better to just allocate a new one every time there's
> > > > a new strange recovery method instead of this opaque approach.
> > > 
> > > That is exactly the opposite of what we discussed so far.

Sorry, I missed that context.

> > > The original idea was to add a firmware-flush recovery method which
> > > looked a bit wage since it didn't give any information on what to do
> > > exactly.
> > > 
> > > That's why I suggested to add a more generic vendor-specific event
> > > with refers to the documentation and system log to see what actually
> > > needs to be done.
> > > 
> > > Otherwise we would end up with events like firmware-flash, update FW
> > > image A, update FW image B, FW version mismatch etc....

Yeah, that's kinda what I expect to happen, and we have enough numbers for
this all to not be an issue.

> > Agree. Any newly allocated method that is specific to a vendor is going to
> > be opaque anyway, since it can't be generic for all drivers. This just helps
> > reduce the noise in DRM core.
> > 
> > And yes, there could be different vendor-specific cases for the same driver
> > and the driver should be able to provide the means to distinguish between
> > them.
> 
> Sim, what's your take on this then?
> 
> Should we get back to the original idea of firmware-flash?

Maybe intel-firmware-flash or something, meaning prefix with the vendor?

The reason I think it should be specific is because I'm assuming you want
to script this. And if you have a big fleet with different vendors, then
"vendor-specific" doesn't tell you enough. But if it's something like
$vendor-$magic_step then it does become scriptable, and we do have have a
place to put some documentation on what you should do instead.

If the point of this interface isn't that it's scriptable, then I'm not
sure why it needs to be an uevent?

I guess if you all want to stick with vendor-specific then I think that's
ok with me too, but the docs should at least explain how to figure out
from the uevent which vendor you're on with a small example. What I'm
worried is that if we have this on multiple drivers userspace will
otherwise make a complete mess and might want to run the wrong recovery
steps.

I think ideally, no matter what, we'd have a concrete driver patch which
then also comes with the documentation for what exactly you're supposed to
do as something you can script. And not just this stand-alone patch here.

Cheers, Sima
> 
> > 
> > Raag
> > 
> > > >> ---
> > > >>  Documentation/gpu/drm-uapi.rst | 9 +++++----
> > > >>  drivers/gpu/drm/drm_drv.c      | 2 ++
> > > >>  include/drm/drm_device.h       | 4 ++++
> > > >>  3 files changed, 11 insertions(+), 4 deletions(-)
> > > >>
> > > >> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> > > >> index 263e5a97c080..c33070bdb347 100644
> > > >> --- a/Documentation/gpu/drm-uapi.rst
> > > >> +++ b/Documentation/gpu/drm-uapi.rst
> > > >> @@ -421,10 +421,10 @@ Recovery
> > > >>  Current implementation defines three recovery methods, out of which, drivers
> > > >>  can use any one, multiple or none. Method(s) of choice will be sent in the
> > > >>  uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
> > > >> -more side-effects. If driver is unsure about recovery or method is unknown
> > > >> -(like soft/hard system reboot, firmware flashing, physical device replacement
> > > >> -or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
> > > >> -will be sent instead.
> > > >> +more side-effects. If recovery method is specific to vendor
> > > >> +``WEDGED=vendor-specific`` will be sent and userspace should refer to vendor
> > > >> +specific documentation for further recovery steps. If driver is unsure about
> > > >> +recovery or method is unknown, ``WEDGED=unknown`` will be sent instead
> > > >>  
> > > >>  Userspace consumers can parse this event and attempt recovery as per the
> > > >>  following expectations.
> > > >> @@ -435,6 +435,7 @@ following expectations.
> > > >>      none            optional telemetry collection
> > > >>      rebind          unbind + bind driver
> > > >>      bus-reset       unbind + bus reset/re-enumeration + bind
> > > >> +    vendor-specific vendor specific recovery method
> > > >>      unknown         consumer policy
> > > >>      =============== ========================================
> > > >>  
> > > >> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > > >> index cdd591b11488..0ac723a46a91 100644
> > > >> --- a/drivers/gpu/drm/drm_drv.c
> > > >> +++ b/drivers/gpu/drm/drm_drv.c
> > > >> @@ -532,6 +532,8 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
> > > >>  		return "rebind";
> > > >>  	case DRM_WEDGE_RECOVERY_BUS_RESET:
> > > >>  		return "bus-reset";
> > > >> +	case DRM_WEDGE_RECOVERY_VENDOR:
> > > >> +		return "vendor-specific";
> > > >>  	default:
> > > >>  		return NULL;
> > > >>  	}
> > > >> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> > > >> index 08b3b2467c4c..08a087f149ff 100644
> > > >> --- a/include/drm/drm_device.h
> > > >> +++ b/include/drm/drm_device.h
> > > >> @@ -26,10 +26,14 @@ struct pci_controller;
> > > >>   * Recovery methods for wedged device in order of less to more side-effects.
> > > >>   * To be used with drm_dev_wedged_event() as recovery @method. Callers can
> > > >>   * use any one, multiple (or'd) or none depending on their needs.
> > > >> + *
> > > >> + * Refer to "Device Wedging" chapter in Documentation/gpu/drm-uapi.rst for more
> > > >> + * details.
> > > >>   */
> > > >>  #define DRM_WEDGE_RECOVERY_NONE		BIT(0)	/* optional telemetry collection */
> > > >>  #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
> > > >>  #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
> > > >> +#define DRM_WEDGE_RECOVERY_VENDOR	BIT(3)	/* vendor specific recovery method */
> > > >>  
> > > >>  /**
> > > >>   * struct drm_wedge_task_info - information about the guilty task of a wedge dev
> > > >> -- 
> > > >> 2.47.1
> > > >>
> > > > 
> > > 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
