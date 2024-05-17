Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6A08C89B9
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 18:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123DF10E2B4;
	Fri, 17 May 2024 16:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ZwcyNMyU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37BDD10E1BB
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 16:00:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1DE3B20002;
 Fri, 17 May 2024 16:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715961619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o8wuZGrHo8oZ1E4Q3w9lL6PcFTom5+wZeAEqfnfZ+8c=;
 b=ZwcyNMyUTurutV9v6g/5wKIJfTR6L0Cw8z82E0LpAjKLY310LDtzkC30hHLVfd4UVW4X3L
 byzJ0dCaNS4b2Sp4IbdPcQ9Idw9ymW+U57CAUi1JXVOjP3JIP9Z1zJpDOfnVkVuhZN2D41
 8ldGG/s/oHJLs6bO69vKt9Y9THV3l2pV9qEAaiZi2wc5Mo4ka2Ex4ykgYi5uYhnAZEaZVa
 29f3b7r22UE4uENSFfl73sk1JhreGYkqU6syQqjiKu1tjXllHcYqrAQ8Y7dJty1hyJ6O/G
 7iulO8o3WoQGKmtE6FqysWdNlQnmYtWV5BpJyEGtTfEtihks4VipffKqVFrt/w==
Date: Fri, 17 May 2024 18:00:11 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: Marius Vlad <marius.vlad@collabora.com>,
 Jim Shargo <jshargo@google.com>, daniel@ffwll.ch,
 brpol@chromium.org, corbet@lwn.net, dri-devel@lists.freedesktop.org,
 hamohammed.sa@gmail.com, hirono@chromium.org, jshargo@chromium.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mairacanal@riseup.net, mduggan@chromium.org, melissa.srw@gmail.com,
 mripard@kernel.org, rodrigosiqueiramelo@gmail.com, tzimmermann@suse.de
Subject: Re: [PATCH v6 0/7] Adds support for ConfigFS to VKMS!
Message-ID: <Zkd_C77S-ERpMiqu@localhost.localdomain>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 Marius Vlad <marius.vlad@collabora.com>,
 Jim Shargo <jshargo@google.com>, daniel@ffwll.ch,
 brpol@chromium.org, corbet@lwn.net, dri-devel@lists.freedesktop.org,
 hamohammed.sa@gmail.com, hirono@chromium.org, jshargo@chromium.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mairacanal@riseup.net, mduggan@chromium.org, melissa.srw@gmail.com,
 mripard@kernel.org, rodrigosiqueiramelo@gmail.com,
 tzimmermann@suse.de
References: <ZjCtgSaL50YrS-F-@phenom.ffwll.local>
 <20240508181744.7030-1-jose.exposito89@gmail.com>
 <CACmi3jF6Dp3PE8X=T5kTO2+eYJQi7jWACFdmp9jzKxUtcQphnQ@mail.gmail.com>
 <Zj5JIah0jWnIn2Ix@localhost.localdomain> <ZkHKhtBmyS12i3fH@fedora>
 <ZkHXS6iBLgRoApNl@xpredator> <ZkI-ZjAYCJaMvmQD@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZkI-ZjAYCJaMvmQD@fedora>
X-GND-Sasl: louis.chauvet@bootlin.com
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

> > > Hi Louis,
> > > 
> > > If you could share a RFC/WIP series it would be awesome!

Hi all!

I just uploaded my WIP series to github here [1]. Most of the work is 
extracted from the current ConfigFS series, I just splitted and completed 
what was done. I also tried to take in account the comments from Sima.

All commits should compile and `modprobe/rmmod/kms_plane` should not 
crashing. The commits are not totaly clean, but it should be only cosmetic 
stuff (formatting in the wrong commit for example). The commit messages 
are not written yet, but the title should be sufficient to understand the 
content of each commit.

This is how I plan to split this work in series: (hash may change over 
time, I will force push to clean commits)

Some preparation stuff (no functionnal change):
	256d7045ec70 drm/vkms: Formatting and typo fix
	cc2de5004c42 drm/vkms: Rename index to possible_crtc
	a74cefc87b9c drm/vkms: Add documentation

More preparation to split everything properly (no functionnal change):
	ad2d0b07558f drm/vkms: Properly extract vkms_formats header
	f9639cca2d43 drm/vkms: Extract vkms_writeback header
	7edda8012b44 drm/vkms: Extract vkms_plane header
	ced09ed9d0f7 drm/vkms: Rename macro to avoid confusion
	9f00e4823529 drm/vkms: Extract vkms_crtc header
	b510e480ed92 drm/vkms: Extract vkms_composer header

Switch all the vkms object to managed (this part need a careful review, 
I am new with DRM, so I probably did some error):
	ddef3c09ead6 drm/vkms: Switch to managed for connector
	8859cad0e192 drm/vkms: Switch to managed for encoder
	d2b8d93fb684 drm/vkms: Switch to managed for crtc
	d1ad316b0f0d drm/vkms: Rename all vkms_crtc instance to be consistent

Temporaly remove debugfs entry, I plan to remove this commit:
	079d875c015e drm/vkms: remove debugfs entry about the current vkms configuration

Clean up vkms_device and unlink vkms_config from vkms_device.
	c782dbe9edc3 drm/vkms: Remove vkms_config from vkms_device
	8a27c13634a3 drm/vkms: Remove (useles?) group
	8fb24e1cdf88 drm/vkms: Introduce directly the default device as global/Remove default vkms config

More cleanup:
	2572d90723ac drm/vkms: Remove possible crtc from parameters

Switching to platform driver (same thing, it is my first time, I probably 
messed up things):
	63be09e05760 drm/vkms: Use a real platform driver
	5f4cf18b07d3 drm/vkms: Extract device driver in its own file

The configFS implementation itself. It only allows to create/enable/delete 
a device:
	b34651685f2e drm/vkms: Introduce configfs

Those commits were a POC to confirm that it works. They need to be 
replaced by the "real" configuration (creation&link of crtc/connector/planes...)
	dd55451ccef2 drm/vkms: Make overlay configurable with configfs
	9dca357f1ee3 drm/vkms: Make cursor configurable with configfs
	bd721f41fad9 drm/vkms: Make writeback configurable with configfs

Kind regards,
Louis Chauvet


[1]: https://github.com/Fomys/linux/tree/b4/new-configfs

> > > Since you are already working on the kernel patches (and I guess IGT?),
> > > I'll start working on a libdrm high level API to interact with VKMS from
> > > user-space on top of your patches. I'll share a link as soon as I have a
> > > draft PR.
> > 
> > Just out of curiosity what API would that be? These should fairly
> > simple that they can be configured from a shell script 
> > (mount/mkdir/rm/echo/umount). Believe should be easy enough to test stuff with 
> > bunch scripts like that.
> 
> My plan is to add a very thin C API around mkdir/rmdir/etc.
> 
> It is true that VKMS can be configure easily using a bash script; however,
> compositors with test suites written in C (or with bindings to libdrm) would
> have to write similar wrappers around the mkdir/rmdir/etc calls.
> I think that it could be beneficial for them to have a shared wrapper available
> in libdrm.
>  
> > Perphas landing the I-G-T tests first (assuming we're settled 
> > on how exactly this would work) might be of greated help to get a green lit 
> > the kernel driver side? Skip if vkms/configfs/something else that tells
> > us VKMS doesn't have ConfigFS eneabled, and run it when that is on.
> > 
> > The lastest iteration was shared by Jim at 
> > https://lore.kernel.org/igt-dev/20230901092819.16924-1-marius.vlad@collabora.com/
> > 
> > That way sub-sequent BAT CI would pick up issues, and can also used
> > independently by Louis. Should also divide the work-load evenly with
> > Louis focusing on the just the driver. Happy to review and test it.
> > 
> > > 
> > > > Maybe we can discuss a bit the comment from Daniel (split init between 
> > > > default/configfs, use or not a real platform device...)
> > > > 
> > > > For the split, I think the first solution (struct vkms_config) can be 
> > > > easier to understand and to implement, for two reasons:
> > > > - No need to distinguish between the "default" and the "configfs" devices 
> > > >   in the VKMS "core". All is managed with only one struct vkms_config.
> > > > - Most of the lifetime issue should be gone. The only thing to 
> > > >   synchronize is passing this vkms_config from ConfigFS to VKMS.
> > > 
> > > I agree, this seems like the easiest solution.
> > > 
> > > > The drawback of this is that it can become difficult to do the "runtime" 
> > > > configuration (today only hotplug, but I plan to add more complex stuff 
> > > > like DP emulation, EDID selection, MST support...). Those configuration 
> > > > must be done "at runtime" and will require a strong synchronization with 
> > > > the vkms "core".
> > > > 
> > > > Maybe we can distinguish between the "creation" and the "runtime 
> > > > configuration", in two different configFS directory? Once a device is 
> > > > created, it is moved to the "enabled" directory and will have a different 
> > > > set of attribute (connection status, current EDID...)
> > > 
> > > Once the device is enabled (i.e, `echo 1 > /config/vkms/my-device/enabled`),
> > > would it make sense to use sysfs instead of another configfs directory?
> > > The advantage is that with sysfs the kernel controls the lifetime of the
> > > objects and I think it *might* simplify the code, but I'll need to write a
> > > proof of concept to see if this works.
> > Can indeed sysfs be used similar to ConfigFS? To me it sounds like sysfs is a
> > view into a kernel objects, mostly for viewing and slight modifications
> > but not manipulating, adding/removing, on the fly, various things. Sort
> > of see it the other way around, device enabled with sysfs but
> > configuration happens through ConfigFS. At least from a user-space pov.
> > > 
> > > > For the platform driver part, it seems logic to me to use a "real" 
> > > > platform driver and a platform device for each pipeline, but I don't have 
> > > > the experience to tell if this is a good idea or not.
> > > 
> > > I'm afraid I don't know which approach could work better. Trusting Sima and
> > > Maíra on this one.
> > > 
> > > Jose
> > > 
> > > > [1]: https://lore.kernel.org/dri-devel/20240409-yuv-v6-0-de1c5728fd70@bootlin.com/
> > > > 
> > > > Thanks,
> > > > Louis Chauvet
> > > > 
> > > > -- 
> > > > Louis Chauvet, Bootlin
> > > > Embedded Linux and Kernel engineering
> > > > https://bootlin.com
> 
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
