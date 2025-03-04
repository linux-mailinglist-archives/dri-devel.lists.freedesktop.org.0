Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14537A4E1DE
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 15:54:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A6910E60B;
	Tue,  4 Mar 2025 14:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g6ETG95V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F32D10E60B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 14:54:51 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43995b907cfso37151345e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Mar 2025 06:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741100090; x=1741704890; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=i74ylUYul443xP2JQWweLVkWow7t0ukLS/STJNyyPWA=;
 b=g6ETG95VgVqtbLrZkHgGvwxgpwDAzX8Nxy8j2K6E66hNHP5de0GYaonPRUVc9pUNc4
 Q137gjuOfp1XYRS3foaCqQ7YFfn2PUiTCpCeZxckwAUUr3Ks+FUBP2zCUGrLwccXU7Cn
 LZvnvxLNrtiR43o+JyTILb41FyWtZngOXJrnb/V6C2giaMg2NRXK0eM9HpQ3BOEz0nkF
 VdEqRSn3DoFWCHzwhi9fQQ3azFv2iaVLTKnxQS2JSFQeAPTm0mBRh9Fc1lAN4BtC2OBe
 kDWH72PZ/EEuc9xIddxGZOcXiZiniN/arZmf+aDxrxRvorpzREVYHLXj+XBSPfe8NpS8
 /Opg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741100090; x=1741704890;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i74ylUYul443xP2JQWweLVkWow7t0ukLS/STJNyyPWA=;
 b=Gfm2ym7zE6OorZ7JKZDXGvIdWP8bs+xX+z7lUqiDLS9RHmNJ5Nt2Yii90NTbBY6vEG
 UD13U53KSxdsxM5MTSF6i1DDpqsLkQ3qaAPLea0v8m0G7dTDLdBxohrtmyusjaFqDaU3
 o1/yCdvMlD7deqxYiGPQxp+jOjUX3jLV03dVXn5ZHZd3skG8o78CrN8lO7eknG6rzoyg
 selcSLhQKQ4t56bSe+SyBaxWCF7BzsJlNE4iFL2CbLzpC/vtMGVuFreGCzb5liZHnChh
 i0QoRPr1zOKWoxs9GowfUVNxDzcgq1/y1LpxLV84HVTg/wDbAANyEDk0OU3h3OTMHjob
 z7kA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBujrGNEctoRX+3f9QO32UGehkIWtZGz3/ENLVzAtevo30z1x1VH264lb1V5bRVGRtekPW2KppIyw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnBY+mg1SdIC7J2Yztk09OODlXLmh7PAp5qrTcfXLtTjK1/2YV
 cgZlgcHIVufX6yC2qKQ+8fYPdaGl3RG3DFpp/uihTb4Epo2vyH8G
X-Gm-Gg: ASbGncvSfT6zaE3soE6AseQJIwqpvivkDH7plnLEgNxlxq04oeag44faNDnDVBIKTvL
 pd6i9v6KzvxftrDhNl9DPrZdpDEe+BMHdkOnIux6aiwE4a7ruyDJFh1Mmj7tu4G5InPPtX3mew0
 yjiwTkT7BffKCwK42otmpU2UylFKDZZjCJunWlyBhjCJQHY1YTABjkhMYoSeGhj0vzcFgXgkqcD
 L+w7E9Ij9xnuU+KpoaqxEfU+imla+jsLpvAAQjaSAbb1rUKqBIy4G92lgTeFDZMVp+j9mb39D3U
 ZqwyXYubIYWCAW4otiO/feqegvW7HjjaCcXcrBJklBJb
X-Google-Smtp-Source: AGHT+IFAEYC+yD2ohSsBl2DHWVS6qkCmJlXjLiKt8/TekXbuu8bmQNv7syDLOzq0161JH0zj+UkAzw==
X-Received: by 2002:a05:600c:4693:b0:439:a1ad:6851 with SMTP id
 5b1f17b1804b1-43ba675d773mr135841085e9.23.1741100089804; 
 Tue, 04 Mar 2025 06:54:49 -0800 (PST)
Received: from fedora ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e479596dsm17870059f8f.7.2025.03.04.06.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 06:54:49 -0800 (PST)
Date: Tue, 4 Mar 2025 15:54:47 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/16] drm/vkms: Allow to configure multiple planes
 via configfs
Message-ID: <Z8cUN8Q4L0VE-bVm@fedora>
References: <20250225175936.7223-1-jose.exposito89@gmail.com>
 <20250225175936.7223-4-jose.exposito89@gmail.com>
 <52bc3f15-28da-4b40-917f-981f1f10d9b8@bootlin.com>
 <Z8VtPMzuZOYqjraQ@fedora>
 <e813ac5b-298c-4863-b0b6-e9ac7fec1da0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e813ac5b-298c-4863-b0b6-e9ac7fec1da0@bootlin.com>
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

On Mon, Mar 03, 2025 at 11:34:50AM +0100, Louis Chauvet wrote:
> 
> 
> Le 03/03/2025 à 09:50, José Expósito a écrit :
> > Hi Louis,
> > 
> > On Fri, Feb 28, 2025 at 03:43:25PM +0100, Louis Chauvet wrote:
> > > 
> > > 
> > > Le 25/02/2025 à 18:59, José Expósito a écrit :
> > > > Create a default subgroup at /config/vkms/planes to allow to create as
> > > > many planes as required.
> > > > 
> > > > Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > > > [...]
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> > > > index 92512d52ddae..4f9d3341e6c0 100644
> > > > --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> > > > +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> > > > [...]
> > > > +static void plane_release(struct config_item *item)
> > > > +{
> > > > +	struct vkms_configfs_plane *plane;
> > > > +	struct mutex *lock;
> > > > +
> > > > +	plane = plane_item_to_vkms_configfs_plane(item);
> > > > +	lock = &plane->dev->lock;
> > > > +
> > > > +	guard(mutex)(lock);
> > > > +	vkms_config_destroy_plane(plane->config);
> > > > +	kfree(plane);
> > > > +}
> > > 
> > > I just found a flaw in our work: there is currently no way to forbid the
> > > deletion of item/symlinks...
> > > 
> > > If you do:
> > > 
> > > modprobe vkms
> > > cd /sys/kernel/config/vkms/
> > > mkdir DEV
> > > mkdir DEV/connectors/CON
> > > mkdir DEV/planes/PLA
> > > mkdir DEV/crtcs/CRT
> > > mkdir DEV/encoders/ENC
> > > ln -s DEV/crtcs/CRT DEV/planes/PLA/possible_crtcs/
> > > ln -s DEV/crtcs/CRT DEV/encoders/ENC/possible_crtcs
> > > ln -s DEV/encoders/ENC DEV/connectors/CON/possible_encoders
> > > echo 1 > DEV/planes/PLA/type
> > > tree
> > > echo 1 > DEV/enabled
> > > modetest -M vkms
> > > => everything fine
> > > 
> > > rm DEV/connectors/CON/possible_encoders/ENC
> > > rmdir DEV/connectors/CON
> > > modetest -M vkms
> > > => BUG: KASAN: slab-use-after-free

I'm trying to reproduce this issue, but those commands don't show any BUG
in dmesg. This is my Kasan .config:

    CONFIG_HAVE_ARCH_KASAN=y
    CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
    CONFIG_CC_HAS_KASAN_GENERIC=y
    CONFIG_CC_HAS_KASAN_SW_TAGS=y
    CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
    CONFIG_KASAN=y
    CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX=y
    CONFIG_KASAN_GENERIC=y
    # CONFIG_KASAN_OUTLINE is not set
    CONFIG_KASAN_INLINE=y
    CONFIG_KASAN_STACK=y
    CONFIG_KASAN_VMALLOC=y
    # CONFIG_KASAN_KUNIT_TEST is not set
    CONFIG_KASAN_EXTRA_INFO=y

I tryed to delete even more items:

    root@kernel-dev:/sys/kernel/config/vkms# tree
    .
    └── DEV
        ├── connectors
        ├── crtcs
        ├── enabled
        ├── encoders
        └── planes

    root@kernel-dev:/sys/kernel/config/vkms# cat DEV/enabled 
    1

And I still don't see any errors. Is it possible that we are running different
branches? Asking because of the failing IGT tests you reported. There seems to
be a difference in our code or setup that is creating these differences.

Best wishes,
Jose

> > > I see two solutions:
> > > - we don't care and keep as is: if the device is enabled, and you delete
> > > link/groups, it is your fault. As shown above: it can crash the kernel, so
> > > it is a no-go.
> > 
> > I was aware of this limitation and, since the configfs is clear about
> > deleting items: [1]
> > 
> >      Important:
> >      drop_item() is void, and as such cannot fail. When rmdir(2) is called,
> >      configfs WILL remove the item from the filesystem tree (assuming that
> >      it has no children to keep it busy).
> >      The subsystem is responsible for responding to this. [...]
> 
> Thanks for pointing out. I read it and I think you're right, they clearly
> want the user space to be able to delete any item at any time.
> 
> > I decided to follow this approach, i.e., allowing the user to delete the items.
> 
> I think a simple fix would be to have something like that:
> 
> int device_enabled_store(...) {
> 	if enabled == True:
> 		for item in configfs_items:
> 			configfs_get_item(item);
> 		vkms_device_enable(...)
> 	else:
> 		vkms_device_disable(...)
> 		for item in configfs_items:
> 			configfs_put_item(item)
> }
> 
> void device_release(...) {
> 	if enable == True:
> 		vkms_device_disable(...)
> 		for item in configfs_items:
> 			configfs_put_item(item)
> }
> 
> This way:
> - no change in VKMS code
> - no ConfigFS change
> - we never have use-after-free (at least in my head)
> - we never "lose" a DRM device
> 
> I did not test it, there is maybe some issue in this implementation (the
> "for item in configfs_items" may be a bit complex to write for example).
> 
> > However, that use-after-free is a bug I need to fix. I was wondering how I didn't
> > catch it with IGT... Turns out, I didn't enable Kasan in my QEMU .config (ops!).
> > 
> > Do you agree on folowing this solution? If so, I'll send v3 fixing the memory
> > issues.
> 
> Indeed yes! If possible, I would like to avoid "complex" refcount/mutex in
> vkms_config structure, but if my proposition does not work, feel free to add
> whatever you think relevant!
> 
> Thanks a lot,
> Louis Chauvet
> 
> > Best wishes,
> > Jose
> > 
> > [1] https://docs.kernel.org/filesystems/configfs.html
> > 
> > > - we care and we don't want to touch configfs: we need to implement a kind
> > > of refcount for all vkms_config elements. Issue: non-trivial work, may allow
> > > memory leaks/use after free...
> > > 
> > > - we care and we want to touch configfs: see my two patches (they apply on
> > > the v1 of this series). This solution allows adding a check before removing
> > > configfs item/group/link. I found it cleaner and way easier to understand.
> > > 
> > > What do you think about my proposition? Do you have another idea?
> > > 
> > > > +static struct configfs_item_operations plane_item_operations = {
> > > > +	.release	= &plane_release,
> > > > +};
> > > > +
> > > > +static const struct config_item_type plane_item_type = {
> > > > +	.ct_item_ops	= &plane_item_operations,
> > > > +	.ct_owner	= THIS_MODULE,
> > > > +};
> > > > +
> > > > +static struct config_group *make_plane_group(struct config_group *group,
> > > > +					     const char *name)
> > > > +{
> > > > +	struct vkms_configfs_device *dev;
> > > > +	struct vkms_configfs_plane *plane;
> > > > +
> > > > +	dev = child_group_to_vkms_configfs_device(group);
> > > > +
> > > > +	guard(mutex)(&dev->lock);
> > > > +
> > > > +	if (dev->enabled)
> > > > +		return ERR_PTR(-EBUSY);
> > > > +
> > > > +	plane = kzalloc(sizeof(*plane), GFP_KERNEL);
> > > > +	if (!plane)
> > > > +		return ERR_PTR(-ENOMEM);
> > > > +
> > > > +	plane->dev = dev;
> > > > +
> > > > +	plane->config = vkms_config_create_plane(dev->config);
> > > > +	if (IS_ERR(plane->config)) {
> > > > +		kfree(plane);
> > > > +		return ERR_CAST(plane->config);
> > > > +	}
> > > > +
> > > > +	config_group_init_type_name(&plane->group, name, &plane_item_type);
> > > > +
> > > > +	return &plane->group;
> > > > +}
> > > > +
> > > > +static struct configfs_group_operations planes_group_operations = {
> > > > +	.make_group	= &make_plane_group,
> > > > +};
> > > > +
> > > > +static const struct config_item_type plane_group_type = {
> > > > +	.ct_group_ops	= &planes_group_operations,
> > > > +	.ct_owner	= THIS_MODULE,
> > > > +};
> > > > +
> > > >    static ssize_t device_enabled_show(struct config_item *item, char *page)
> > > >    {
> > > >    	struct vkms_configfs_device *dev;
> > > > @@ -125,6 +208,10 @@ static struct config_group *make_device_group(struct config_group *group,
> > > >    	config_group_init_type_name(&dev->group, name, &device_item_type);
> > > >    	mutex_init(&dev->lock);
> > > > +	config_group_init_type_name(&dev->planes_group, "planes",
> > > > +				    &plane_group_type);
> > > > +	configfs_add_default_group(&dev->planes_group, &dev->group);
> > > > +
> > > >    	return &dev->group;
> > > >    }
> > > 
> > > -- 
> > > Louis Chauvet, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
> > > 
> 
> -- 
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
