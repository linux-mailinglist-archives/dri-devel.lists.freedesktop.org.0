Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DA2A4491C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 18:56:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B9B10E4CE;
	Tue, 25 Feb 2025 17:56:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gjLD2I+f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6264B10E4C9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 17:56:50 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4399deda4bfso40972585e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 09:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740506209; x=1741111009; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gOCUaU/7gnEaJ3IHdehXrJI4tg+whLlR3VL26FFaPrM=;
 b=gjLD2I+fZipMr2zD1jndrdgxakoar21J0eO/Se4i5BM6g8YT9UK9NPEfAGUNlLQh9Z
 ggVOq5l0PmEnZY5LhjnqVRaCiUyG8soHjyFxt3HcOL8uAPkkUvHIshMX1j93zRG66BDv
 QWqp+xWllfxA23HW7lbxJJQ0H2Mnf1Z+TfoRDbERG1p/yCLkTbKiqAC/eoQsyjsT609Q
 fMFVAtAMJYjGOyAbtqyBSe2FM1IOxu5VycC+Dsy4ywCj3JAMw9COexxnC10ld8Og6rTs
 aIC9nxdxLGwU7ZLvO6ugHAvZMz7dSRFHJmcb4SWlt5EtD1PvuONsfeyCqiAhVW4I+qWr
 z4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740506209; x=1741111009;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gOCUaU/7gnEaJ3IHdehXrJI4tg+whLlR3VL26FFaPrM=;
 b=cGC6pEY5IqwLRuVfnLR57GrgXPgejflvCiuIkkO2S6pK77doD+0Q2AF6Z84om8L6mg
 WF+MQyyNeYgW4uFxKPut7eV/J9QDeG2u5jyKDDfoLRAPbt41Z3MBst3Orn7IBdnaTaUC
 Rv84gemN8GUd5kCpeMKB7qMU5NY1X2mDlYItKbsJig7aJJdZwHdDlGn/SEbzJleKheoi
 KLgRJ6LxV3zkBJ/TA6nOg3BtAPhtoXDZcfxh/IOeZKiQS6uIW6w3LuK9LMNPvY11urrP
 RbnBKI9wKwMO+LJj9Uc5IiOzRZMHWr7rli8fMjavYG5Ah/fj4nlAdTkMpwQGEtKF2A0x
 aXkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBHCdoQxPoMeISlSmQ0ykBRSwHNo7GXWs/kRMPd0fb3baFPADF7IvlAezJ3tzrEEM+lRaQq6yJfI8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynV9Jz77zN+eJIIAlWbWgs9x1kGXdsZmeH0qg6jSeL48S7YAEm
 qvgB8grFgIs0C7ZX8Ye40JucRcnx6RmzsP9UGyxUph0of5Aicqou
X-Gm-Gg: ASbGncvwFQ4DEcoEmws9bidnBtdiUBVp4lQ+v9KwbD8UDlMG4WwcA8DgBOpeJcJrDmV
 bvQ3ciYh1sB4UPnT40mEu/XOLgckLupSYuyzgyc/glQHhaeHoGDQSdAYky7iLCESs/9qYpHhd4z
 PXb95f4IqgWdQg7Q4s0zRX0vaffxjhdAGOR2FkD+YI7ooqjloUe34vmAUY4+ezzwg4lXy4JgxqS
 4PiCPmm+JArfJ0IfILUyFCILlVYTHyJgg2bER9uAcVJONTgug3dESjGeJHd8qFQvSE9WOPcIfuo
 BzpmACtgwcNH8dqJY6nzTGcduA==
X-Google-Smtp-Source: AGHT+IExSFlTbctQ0zHvNEtFI4zl9JtgMobqQSi8OH4T7IPG24I3S3Zyhi0/pqqwm+YXvOwqJapctw==
X-Received: by 2002:a05:600c:3c86:b0:439:9d75:9e7d with SMTP id
 5b1f17b1804b1-439ae21d1d0mr136975665e9.22.1740506208497; 
 Tue, 25 Feb 2025 09:56:48 -0800 (PST)
Received: from fedora ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b036756csm148728425e9.31.2025.02.25.09.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 09:56:47 -0800 (PST)
Date: Tue, 25 Feb 2025 18:56:46 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/16] drm/vkms: Add configfs support
Message-ID: <Z74EXo_qL1bZ2uNo@fedora>
References: <20250218170808.9507-1-jose.exposito89@gmail.com>
 <Z72jJtFCMypHpW_K@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z72jJtFCMypHpW_K@louis-chauvet-laptop>
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

Hi Louis,

Thanks a lot for the super fast review, you are the best!

On Tue, Feb 25, 2025 at 12:01:58PM +0100, Louis Chauvet wrote:
> On 18/02/25 - 18:07, José Expósito wrote:
> > Hi everyone,
> > 
> > This series, to be applied on top of [1], allow to configure one or more VKMS
> > instances without having to reload the driver using configfs.
> > 
> > The series is structured in 3 blocks:
> > 
> >   - Patches 1..11: Basic device configuration. For simplicity, I kept the
> >     available options as minimal as possible.
> 
> Thanks for this series, it is really nice!
> 
> I did some review, that can be sumarized in two point:
> - Do we want to use scoped_guard?

Since all mutex locks were unlock at the end of the file, I replaced
mutex_lock/unlock with guard(mutex)(...). The resulting code is now
much cleaner.

Thanks for pointing me to cleanup.h, my Linux kernel books are too
old to include these helpers and I wasn't aware of them.

> - -EPERM, -EINVAL or -EBUSY when attempting to do something while the
>   device is enabled

I replaced all the cases with EBUSY, thanks!

> >   - Patches 12, 13 and 14: Allow to hot-plug and unplug connectors. This is not
> >     part of the minimal set of options, but I included in this series so it can
> >     be used as a template/example of how new configurations can be added.
> > 
> >   - Patches 15 and 16: New option to skip the default device creation and to-do
> >     cleanup.
> 
> For the next iteration, can you move those patch before 12, 13, 14, so
> 1..11 could be merged before 12..14 (I need to think about the connector 
> API to check if it will works with dynamic connector)?

Sure, I moved them to the end in v2.

I experimented with dynamic connectors a little bit and I think that it is
possible to make it backwards compatible:

 - We could add a "enabled" file for connectors
 - At the moment, connectors can only be created while the device is disabled.
   To keep compatibility, if the device is disabled, we need to set
   connector->enabled to 1 by default.
 - If the device is enabled, we'd need to set connector->enabled to 0. This
   would allow the user to configure the connector before it is hot-added.
 - We'd need to store if the connector is static or dynamic to allow hot-remove
   only dynamic connectors.

I believe that, if we implemented it like this, we'd be able to keep compatibility.

> > The process of configuring a VKMS device is documented in "vkms.rst".
> 
> This is a really good documentation!
> 
> > Finally, the code is thoroughly tested by a collection of IGT tests [2].
> 
> I quickly looked on them, it seems nice! Thank you for this huge
> improvment!

If you could comment on that mailing list, I'm sure that a LGTM from the
maintainer will help :)

Thanks a lot for your work Louis.

Sending v2,
Jose

> Louis Chauvet
> 
> > Best wishes,
> > José Expósito
> > 
> > [1] https://lore.kernel.org/all/20250218101214.5790-1-jose.exposito89@gmail.com/
> > [2] It is not in patchwork yet, but it'll appear here eventually:
> >     https://patchwork.freedesktop.org/project/igt/patches/?submitter=19782&state=*&q=&archive=both&delegate=
> > 
> > José Expósito (16):
> >   drm/vkms: Expose device creation and destruction
> >   drm/vkms: Add and remove VKMS instances via configfs
> >   drm/vkms: Allow to configure multiple planes via configfs
> >   drm/vkms: Allow to configure the plane type via configfs
> >   drm/vkms: Allow to configure multiple CRTCs via configfs
> >   drm/vkms: Allow to configure CRTC writeback support via configfs
> >   drm/vkms: Allow to attach planes and CRTCs via configfs
> >   drm/vkms: Allow to configure multiple encoders via configfs
> >   drm/vkms: Allow to attach encoders and CRTCs via configfs
> >   drm/vkms: Allow to configure multiple connectors via configfs
> >   drm/vkms: Allow to attach connectors and encoders via configfs
> >   drm/vkms: Allow to configure connector status
> >   drm/vkms: Allow to update the connector status
> >   drm/vkms: Allow to configure connector status via configfs
> >   drm/vkms: Allow to configure the default device creation
> >   drm/vkms: Remove completed task from the TODO list
> > 
> >  Documentation/gpu/vkms.rst                    |  98 +-
> >  drivers/gpu/drm/vkms/Kconfig                  |   1 +
> >  drivers/gpu/drm/vkms/Makefile                 |   3 +-
> >  drivers/gpu/drm/vkms/tests/vkms_config_test.c |  24 +
> >  drivers/gpu/drm/vkms/vkms_config.c            |   8 +-
> >  drivers/gpu/drm/vkms/vkms_config.h            |  26 +
> >  drivers/gpu/drm/vkms/vkms_configfs.c          | 918 ++++++++++++++++++
> >  drivers/gpu/drm/vkms/vkms_configfs.h          |   8 +
> >  drivers/gpu/drm/vkms/vkms_connector.c         |  26 +-
> >  drivers/gpu/drm/vkms/vkms_connector.h         |  18 +-
> >  drivers/gpu/drm/vkms/vkms_drv.c               |  18 +-
> >  drivers/gpu/drm/vkms/vkms_drv.h               |   4 +
> >  drivers/gpu/drm/vkms/vkms_output.c            |   2 +-
> >  13 files changed, 1138 insertions(+), 16 deletions(-)
> >  create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c
> >  create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.h
> > 
> > 
> > base-commit: 9b6c03cb96b9e19bce2c2764d2c6dd4ccbd06c5d
> > prerequisite-patch-id: 1bff7bbc4ef0e29266265ac3dc009011c046f745
> > prerequisite-patch-id: 74a284d40a426a0038a7054068192238f7658187
> > prerequisite-patch-id: c3e34e88ad6a0acf7d9ded0cdb4745a87cf6fd82
> > prerequisite-patch-id: 9cd0dfaf8e21a811edbe5a2da7185b6f9055d42d
> > prerequisite-patch-id: f50c41578b639370a5d610af6f25c2077321a886
> > prerequisite-patch-id: 5a7219a51e42de002b8dbf94ec8af96320043489
> > prerequisite-patch-id: 67ea5d4e21b4ce4acbd6fc3ce83017f55811c49b
> > prerequisite-patch-id: 37a7fab113a32581f053c09f45efb137afd75a1b
> > prerequisite-patch-id: 475bcdc6267f4b02fb1bb2379145529c33684e4f
> > prerequisite-patch-id: d3114f0b3da3d8b5ad64692df761f1cf42fbdf12
> > prerequisite-patch-id: d1d9280fb056130df2050a09b7ea7e7ddde007c5
> > prerequisite-patch-id: 2c370f3de6d227fa8881212207978cce7bbb18ba
> > prerequisite-patch-id: 938b8fe5437e5f7bc22bffc55ae249a27d399d66
> > prerequisite-patch-id: ab0a510994fbe9985dc46a3d35e6d0574ddbb633
> > -- 
> > 2.48.1
> > 
