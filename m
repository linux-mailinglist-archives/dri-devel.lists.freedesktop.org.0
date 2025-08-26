Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AB8B353A8
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 07:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B107B10E373;
	Tue, 26 Aug 2025 05:58:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FLTnPoDB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB06E10E2CF;
 Tue, 26 Aug 2025 05:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756187890; x=1787723890;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=x3YtPmjsh5zhsV0llxHMciG2N5V2S/HyMIBMqLUBq2M=;
 b=FLTnPoDBWnodfdkSwGh3ORvJ5BN54eCV9jQnkxqQ/GxxsoA8A+lEXPEd
 RI/EYFWB2MIsSiY9Qd+J/VUpkqvB98CVLO5iqDJEHYsrrKEflnaCcARwB
 DGwHGe5A7C22yGKHPJTawSyEIrV56hnpuQUFxtoTNzGUY1PxOoe75g41H
 ypiBSHJdNpMB3RD6KrI5e3V7PClCo1lpr9gR0bIT0Fa3KRlPIvTdiTKu9
 H0sSLGVBoDHVO9cLQdzW3HHrsq+I35FC/jZuR+PAl0IuxEa1CMuUKBGOp
 Qa+Q9yfmpb/v0OBuTBQAX3giUfaa3UDJ3UbB4Sxzftvmn2KsXnSuYlj3x A==;
X-CSE-ConnectionGUID: oWl1N0KyT2aeaHaj0bqWBQ==
X-CSE-MsgGUID: 2fVKKxW9RceuqUNndqemjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69785005"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="69785005"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 22:58:09 -0700
X-CSE-ConnectionGUID: nJMzkz34Tg2UTL+a5+7bOw==
X-CSE-MsgGUID: Ppn2MIxgQoyipju43Tfhmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="168990643"
Received: from aiddamse-mobl3.gar.corp.intel.com (HELO [10.247.150.174])
 ([10.247.150.174])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 22:58:05 -0700
Message-ID: <76bfe7d2-e629-4220-a587-fded78a31a8f@linux.intel.com>
Date: Tue, 26 Aug 2025 11:28:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 1/5] drm/netlink: Add netlink infrastructure
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Michael J <michael.j.ruhl@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
References: <20250730064956.1385855-1-aravind.iddamsetty@linux.intel.com>
 <20250730064956.1385855-2-aravind.iddamsetty@linux.intel.com>
 <aJ-rMORMxdhRwc4c@intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <aJ-rMORMxdhRwc4c@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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


On 16-08-2025 03:18, Rodrigo Vivi wrote:
> On Wed, Jul 30, 2025 at 12:19:52PM +0530, Aravind Iddamsetty wrote:
>> Define the netlink registration interface and commands, attributes that
>> can be commonly used across by drm drivers. This patch intends to use
>> the generic netlink family to expose various stats of device. At present
>> it defines some commands that shall be used to expose RAS error counters.
>>
>> v2:
>> define common interfaces to genl netlink subsystem that all drm drivers
>> can leverage.(Tomer Tayar)
>>
>> v3: drop DRIVER_NETLINK flag and use the driver_genl_ops structure to
>> register to netlink subsystem (Daniel Vetter)
>>
>> v4:(Michael J. Ruhl)
>> 1. rename drm_genl_send to drm_genl_reply
>> 2. catch error from xa_store and handle appropriately
>>
>> v5:
>> 1. compile only if CONFIG_NET is enabled
>>
>> V6: Add support for reading an IP block errors
>>
>> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com> #v4
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>> ---
>>  drivers/gpu/drm/Makefile       |   1 +
>>  drivers/gpu/drm/drm_drv.c      |   7 ++
>>  drivers/gpu/drm/drm_netlink.c  | 212 +++++++++++++++++++++++++++++++++
>>  include/drm/drm_device.h       |  10 ++
>>  include/drm/drm_drv.h          |   7 ++
>>  include/drm/drm_netlink.h      |  41 +++++++
>>  include/uapi/drm/drm_netlink.h | 101 ++++++++++++++++
>>  7 files changed, 379 insertions(+)
>>  create mode 100644 drivers/gpu/drm/drm_netlink.c
>>  create mode 100644 include/drm/drm_netlink.h
>>  create mode 100644 include/uapi/drm/drm_netlink.h
>>
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index 4dafbdc8f86a..39d5183ab35c 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -77,6 +77,7 @@ drm-$(CONFIG_DRM_CLIENT) += \
>>  	drm_client.o \
>>  	drm_client_event.o \
>>  	drm_client_modeset.o
>> +drm-$(CONFIG_NET) += drm_netlink.o
>>  drm-$(CONFIG_DRM_LIB_RANDOM) += lib/drm_random.o
>>  drm-$(CONFIG_COMPAT) += drm_ioc32.o
>>  drm-$(CONFIG_DRM_PANEL) += drm_panel.o
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index 02556363e918..cce55423141c 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -1088,6 +1088,12 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
>>  	if (ret)
>>  		goto err_minors;
>>  
>> +	if (driver->genl_ops) {
>> +		ret = drm_genl_register(dev);
>> +		if (ret)
>> +			goto err_minors;
>> +	}
> Even if we don't go with multiple 'groups' I believe that the driver should
> explicitly call the netlink registration.

the check is if the driver is supporting netlink callbacks or not and
only then register the netlink family for the device.

Also, I believe we want drivers to explicitly call drm_ras_register, see
below

>
>> +
>>  	ret = create_compat_control_link(dev);
>>  	if (ret)
>>  		goto err_minors;
>> @@ -1229,6 +1235,7 @@ static void drm_core_exit(void)
>>  	drm_privacy_screen_lookup_exit();
>>  	drm_panic_exit();
>>  	accel_core_exit();
>> +	drm_genl_exit();
>>  	unregister_chrdev(DRM_MAJOR, "drm");
>>  	debugfs_remove(drm_debugfs_root);
>>  	drm_sysfs_destroy();
>> diff --git a/drivers/gpu/drm/drm_netlink.c b/drivers/gpu/drm/drm_netlink.c
>> new file mode 100644
>> index 000000000000..da4bfde32a22
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_netlink.c
> drm_ras.c ?
ok 
>
>> @@ -0,0 +1,212 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
> 2025 here and in any other file
by bad i just respined the old series without checking for this will fix
it.
>
>> + */
>> +
>> +#include <net/genetlink.h>
>> +#include <uapi/drm/drm_netlink.h>
> uapi/drm/drm_ras.h ?!
>
> like we don't have a drm_ioctl.h but drm_mode.h
ok makes sense.
>
>> +
>> +#include <drm/drm_device.h>
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_file.h>
>> +#include <drm/drm_managed.h>
>> +#include <drm/drm_netlink.h>
>> +#include <drm/drm_print.h>
>> +
>> +DEFINE_XARRAY(drm_dev_xarray);
>> +
>> +/**
>> + * drm_genl_reply - response to a request
>> + * @msg: socket buffer
>> + * @info: receiver information
>> + * @usrhdr: pointer to user specific header in the message buffer
>> + *
>> + * RETURNS:
>> + * 0 on success and negative error code on failure
>> + */
>> +int drm_genl_reply(struct sk_buff *msg, struct genl_info *info, void *usrhdr)
> drm_ras_reply so we standardize in a single namespace everywhere ?!
>
> and same for all other functions and structs, except for things
> that are declared outside drm
ok so the way i understood based on your comment in the first patch is
netlink constructs 
should be abstracted out from drm drivers so this interface should not
expect sk_buff or genl
things and handle all that things internally. 
>
>> +{
>> +	int ret;
>> +
>> +	genlmsg_end(msg, usrhdr);
>> +
>> +	ret = genlmsg_reply(msg, info);
>> +	if (ret)
>> +		nlmsg_free(msg);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL(drm_genl_reply);
>> +
>> +/**
>> + * drm_genl_alloc_msg - allocate genl message buffer
>> + * @dev: drm_device for which the message is being allocated
>> + * @info: receiver information
>> + * @msg_size: size of the msg buffer that needs to be allocated
>> + * @usrhdr: pointer to user specific header in the message buffer
>> + *
>> + * RETURNS:
>> + * pointer to new allocated buffer on success, NULL on failure
>> + */
>> +struct sk_buff *
>> +drm_genl_alloc_msg(struct drm_device *dev,
>> +		   struct genl_info *info,
>> +		   size_t msg_size, void **usrhdr)
>> +{
>> +	struct sk_buff *new_msg;
>> +
>> +	new_msg = genlmsg_new(msg_size, GFP_KERNEL);
>> +	if (!new_msg)
>> +		return new_msg;
>> +
>> +	*usrhdr = genlmsg_put_reply(new_msg, info, dev->drm_genl_family, 0, info->genlhdr->cmd);
>> +	if (!*usrhdr) {
>> +		nlmsg_free(new_msg);
>> +		new_msg = NULL;
>> +	}
>> +
>> +	return new_msg;
>> +}
>> +EXPORT_SYMBOL(drm_genl_alloc_msg);
>> +
>> +static struct drm_device *genl_to_dev(struct genl_info *info)
>> +{
>> +	return xa_load(&drm_dev_xarray, info->nlhdr->nlmsg_type);
>> +}
>> +
>> +static int drm_genl_list_errors(struct sk_buff *msg, struct genl_info *info)
>> +{
>> +	struct drm_device *dev = genl_to_dev(info);
>> +
>> +	if (info->genlhdr->cmd == DRM_RAS_CMD_READ_ALL) {
>> +		if (GENL_REQ_ATTR_CHECK(info, DRM_RAS_ATTR_READ_ALL))
>> +			return -EINVAL;
>> +	} else {
>> +		if (GENL_REQ_ATTR_CHECK(info, DRM_RAS_ATTR_QUERY))
>> +			return -EINVAL;
>> +	}
>> +
>> +	if (WARN_ON(!dev->driver->genl_ops[info->genlhdr->cmd].doit))
>> +		return -EOPNOTSUPP;
>> +
>> +	return dev->driver->genl_ops[info->genlhdr->cmd].doit(dev, msg, info);
>> +}
>> +
>> +static int drm_genl_read_error(struct sk_buff *msg, struct genl_info *info)
>> +{
>> +	struct drm_device *dev = genl_to_dev(info);
>> +
>> +	if (GENL_REQ_ATTR_CHECK(info, DRM_RAS_ATTR_ERROR_ID))
>> +		return -EINVAL;
>> +
>> +	if (WARN_ON(!dev->driver->genl_ops[info->genlhdr->cmd].doit))
>> +		return -EOPNOTSUPP;
>> +
>> +	return dev->driver->genl_ops[info->genlhdr->cmd].doit(dev, msg, info);
>> +}
>> +
>> +/* attribute policies */
>> +static const struct nla_policy drm_attr_policy_query[DRM_ATTR_MAX + 1] = {
>> +	[DRM_RAS_ATTR_QUERY] = { .type = NLA_U8 },
>> +};
>> +
>> +static const struct nla_policy drm_attr_policy_read_one[DRM_ATTR_MAX + 1] = {
>> +	[DRM_RAS_ATTR_ERROR_ID] = { .type = NLA_U64 },
>> +};
>> +
>> +static const struct nla_policy drm_attr_policy_read_all[DRM_ATTR_MAX + 1] = {
>> +	[DRM_RAS_ATTR_READ_ALL] = { .type = NLA_U8 },
>> +};
>> +
>> +/* drm genl operations definition */
>> +const struct genl_ops drm_genl_ops[] = {
>> +	{
>> +		.cmd = DRM_RAS_CMD_QUERY,
>> +		.doit = drm_genl_list_errors,
>> +		.policy = drm_attr_policy_query,
>> +	},
>> +	{
>> +		.cmd = DRM_RAS_CMD_READ_ONE,
>> +		.doit = drm_genl_read_error,
>> +		.policy = drm_attr_policy_read_one,
>> +	},
>> +	{
>> +		.cmd = DRM_RAS_CMD_READ_ALL,
>> +		.doit = drm_genl_list_errors,
>> +		.policy = drm_attr_policy_read_all,
>> +	},
>> +	{
>> +		.cmd = DRM_RAS_CMD_READ_BLOCK,
>> +		.doit = drm_genl_read_error,
>> +		.policy = drm_attr_policy_read_one,
>> +	},
>> +
>> +};
>> +
>> +static void drm_genl_family_init(struct drm_device *dev)
>> +{
>> +	dev->drm_genl_family = drmm_kzalloc(dev, sizeof(struct genl_family),
>> +					    GFP_KERNEL);
>> +
>> +	/* Use drm primary node name eg: card0 to name the genl family */
>> +	snprintf(dev->drm_genl_family->name, sizeof(dev->drm_genl_family->name),
>> +		 "%s", dev->primary->kdev->kobj.name);
> for the family name I believe we deserve the 'drmras', then
> the card minor number, then the group name.
>
> For instance, but not necessarily suggesting xe to do it:
>
> drmras-0-gt
> drmras-0-soc
>
> .....
>
> driver can select their own name...
ok the drm_ras_register that we will introduce shall take a name.
As I mentioned earlier we needn't expose IP as group.
>
>
>> +	dev->drm_genl_family->version = DRM_GENL_VERSION;
> I believe driver could control their own version so if something changes in
> the group names for instance or supported commands they can change it.
but the commands itself are common, I'm not sure if we want drivers to
have their private set of commands.
>
>> +	dev->drm_genl_family->parallel_ops = true;
>> +	dev->drm_genl_family->ops = drm_genl_ops;
>> +	dev->drm_genl_family->n_ops = ARRAY_SIZE(drm_genl_ops);
>> +	dev->drm_genl_family->maxattr = DRM_ATTR_MAX;
>> +	dev->drm_genl_family->module = dev->dev->driver->owner;
>> +}
>> +
>> +static void drm_genl_deregister(struct drm_device *dev, void *arg)
>> +{
>> +	drm_dbg_driver(dev, "unregistering genl family %s\n", dev->drm_genl_family->name);
>> +
>> +	xa_erase(&drm_dev_xarray, dev->drm_genl_family->id);
>> +
>> +	genl_unregister_family(dev->drm_genl_family);
>> +}
>> +
>> +/**
>> + * drm_genl_register - Register genl family
>> + * @dev: drm_device for which genl family needs to be registered
>> + *
>> + * RETURNS:
>> + * 0 on success and negative error code on failure
>> + */
>> +int drm_genl_register(struct drm_device *dev)
>> +{
>> +	int ret;
>> +
>> +	drm_genl_family_init(dev);
>> +
>> +	ret = genl_register_family(dev->drm_genl_family);
>> +	if (ret < 0) {
>> +		drm_warn(dev, "genl family registration failed\n");
>> +		return ret;
>> +	}
>> +
>> +	drm_dbg_driver(dev, "genl family id %d and name %s\n", dev->drm_genl_family->id,
>> +		       dev->drm_genl_family->name);
>> +
>> +	ret = xa_err(xa_store(&drm_dev_xarray, dev->drm_genl_family->id, dev, GFP_KERNEL));
>> +	if (ret)
>> +		goto genl_unregister;
>> +
>> +	ret = drmm_add_action_or_reset(dev, drm_genl_deregister, NULL);
>> +
>> +	return ret;
>> +
>> +genl_unregister:
>> +	genl_unregister_family(dev->drm_genl_family);
>> +	return ret;
>> +}
>> +
>> +/**
>> + * drm_genl_exit: destroy drm_dev_xarray
>> + */
>> +void drm_genl_exit(void)
>> +{
>> +	xa_destroy(&drm_dev_xarray);
>> +}
>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>> index 08b3b2467c4c..8b60a17e4156 100644
>> --- a/include/drm/drm_device.h
>> +++ b/include/drm/drm_device.h
>> @@ -8,6 +8,7 @@
>>  #include <linux/sched.h>
>>  
>>  #include <drm/drm_mode_config.h>
>> +#include <drm/drm_netlink.h>
>>  
>>  struct drm_driver;
>>  struct drm_minor;
>> @@ -22,6 +23,8 @@ struct inode;
>>  struct pci_dev;
>>  struct pci_controller;
>>  
>> +struct genl_family;
>> +
>>  /*
>>   * Recovery methods for wedged device in order of less to more side-effects.
>>   * To be used with drm_dev_wedged_event() as recovery @method. Callers can
>> @@ -356,6 +359,13 @@ struct drm_device {
>>  	 * Root directory for debugfs files.
>>  	 */
>>  	struct dentry *debugfs_root;
>> +
>> +	/**
>> +	 * @drm_genl_family:
>> +	 *
>> +	 * Generic netlink family registration structure.
>> +	 */
>> +	struct genl_family *drm_genl_family;
> we should probably have this inside a struct drm_ras and without the 1-1
> tie here
Ok.
>
>
>>  };
>>  
>>  void drm_dev_set_dma_dev(struct drm_device *dev, struct device *dma_dev);
>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>> index 3f76a32d6b84..908888ac0db2 100644
>> --- a/include/drm/drm_drv.h
>> +++ b/include/drm/drm_drv.h
>> @@ -431,6 +431,13 @@ struct drm_driver {
>>  	 * some examples.
>>  	 */
>>  	const struct file_operations *fops;
>> +
>> +	/**
>> +	 * @genl_ops:
>> +	 *
>> +	 * Drivers private callback to genl commands
>> +	 */
>> +	const struct driver_genl_ops *genl_ops;
> as well the ops should be encapsulated in the drm_ras struct
got it.
>
>>  };
>>  
>>  void *__devm_drm_dev_alloc(struct device *parent,
>> diff --git a/include/drm/drm_netlink.h b/include/drm/drm_netlink.h
>> new file mode 100644
>> index 000000000000..4a746222337a
>> --- /dev/null
>> +++ b/include/drm/drm_netlink.h
>> @@ -0,0 +1,41 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef __DRM_NETLINK_H__
>> +#define __DRM_NETLINK_H__
>> +
>> +#include <linux/types.h>
>> +
>> +struct drm_device;
>> +struct genl_info;
>> +struct sk_buff;
>> +
>> +struct driver_genl_ops {
>> +	int		       (*doit)(struct drm_device *dev,
> when I first saw the doit I was going to complain about it,
> until I learned this is part of netlink definition :)
>
>> +				       struct sk_buff *skb,
>> +				       struct genl_info *info);
>> +};
>> +
>> +#if IS_ENABLED(CONFIG_NET)
>> +int drm_genl_register(struct drm_device *dev);
>> +void drm_genl_exit(void);
>> +int drm_genl_reply(struct sk_buff *msg, struct genl_info *info, void *usrhdr);
>> +struct sk_buff *
>> +drm_genl_alloc_msg(struct drm_device *dev,
>> +		   struct genl_info *info,
>> +		   size_t msg_size, void **usrhdr);
>> +#else
>> +static inline int drm_genl_register(struct drm_device *dev) { return 0; }
>> +static inline void drm_genl_exit(void) {}
>> +static inline int drm_genl_reply(struct sk_buff *msg,
>> +				 struct genl_info *info,
>> +				 void *usrhdr) { return 0; }
>> +static inline struct skb_buff *
>> +drm_genl_alloc_msg(struct drm_device *dev,
>> +		   struct genl_info *info,
>> +		   size_t msg_size, void **usrhdr) { return NULL; }
>> +#endif
>> +
>> +#endif
>> diff --git a/include/uapi/drm/drm_netlink.h b/include/uapi/drm/drm_netlink.h
>> new file mode 100644
>> index 000000000000..58afb6e8d84a
>> --- /dev/null
>> +++ b/include/uapi/drm/drm_netlink.h
>> @@ -0,0 +1,101 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright 2023 Intel Corporation
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the "Software"),
>> + * to deal in the Software without restriction, including without limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice (including the next
>> + * paragraph) shall be included in all copies or substantial portions of the
>> + * Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>> + * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + * OTHER DEALINGS IN THE SOFTWARE.
> This header kind of conflicts/overlaps the MIT SPDX above. We should remove it
> and go only with the SPDX imho, unless I'm missing something
My bad may be i clubbed the two taking from some header.
>
>> + */
>> +
>> +#ifndef _DRM_NETLINK_H_
>> +#define _DRM_NETLINK_H_
>> +
>> +#define DRM_GENL_VERSION 1
>> +
>> +#if defined(__cplusplus)
>> +extern "C" {
>> +#endif
>> +
>> +/**
>> + * enum drm_genl_error_cmds - Supported error commands
>> + *
>> + */
>> +enum drm_genl_error_cmds {
>> +	DRM_CMD_UNSPEC,
>> +	/**
>> +	 * @DRM_RAS_CMD_QUERY: Command to list all errors names with config-id in verbose mode.
>> +	 * In normal mode will list IP blocks, total instances available and error types supported
>> +	 */
>> +	DRM_RAS_CMD_QUERY,
> here is the part where naming inconsistency is more visible, file has one
> namespacing, struct has another, and command has even a third one.
>
> drm_ras everywhere to solve this please.
Ok makes sense.
>
>> +	/** @DRM_RAS_CMD_READ_ONE: Command to get a counter for a specific error */
>> +	DRM_RAS_CMD_READ_ONE,
>> +	/** @DRM_RAS_CMD_READ_BLOCK: Command to get a counter of specific error type from an IP
>> +	 * block
>> +	 */
>> +	DRM_RAS_CMD_READ_BLOCK,
> here is the part that I believe this API already shows how it is not
> expansible. you had to create an argument to filter the type of errors
> instead of declaring the errors per ip block like AMD folks had asked for.
Based on the comment  here
https://lore.kernel.org/all/aa23f0ef-a4ab-ca73-5ab3-ef23d6e36e89@amd.com/
they want to extract the details from a command itself using bitmask.
Let me know if you think i misunderstood.
>
>> +	/** @DRM_RAS_CMD_READ_ALL: Command to get counters of all errors */
>> +	DRM_RAS_CMD_READ_ALL,
>> +
>> +	__DRM_CMD_MAX,
>> +	DRM_CMD_MAX = __DRM_CMD_MAX - 1,
>> +};
>> +
>> +enum drm_cmd_request_type {
>> +	DRM_RAS_CMD_QUERY_VERBOSE = 1,
>> +	DRM_RAS_CMD_QUERY_NORMAL = 2,
>> +};
> I don't understand why we need verbose vs normal. Perhaps this should
> be a separate path or explain with examples?
>
> it took me a while to realize that the drm_ras igt tool would only
> list my available errors if I was using --verbose, otherwise we would
> return in the begin of the list_error functions in xe...
The VERBOSE is to support the current error model in Xe where each error is
enumerated separately and NORMAL for reporting groups for AMDs model.

By default drm_ras tool uses normal that is why it doesn't work with xe
unless --verbose is passed.

>
>> +
>> +/**
>> + * enum drm_error_attr - Attributes to use with drm_genl_error_cmds
>> + *
>> + */
>> +enum drm_error_attr {
>> +	DRM_ATTR_UNSPEC,
>> +	DRM_ATTR_PAD = DRM_ATTR_UNSPEC,
>> +	/**
>> +	 * @DRM_RAS_ATTR_QUERY: Should be used with DRM_RAS_CMD_QUERY,
>> +	 * DRM_RAS_CMD_READ_ALL
>> +	 */
>> +	DRM_RAS_ATTR_QUERY, /* NLA_U8 */
>> +	/**
>> +	 * @DRM_RAS_ATTR_READ_ALL: Should be used with DRM_RAS_CMD_READ_ALL
>> +	 */
>> +	DRM_RAS_ATTR_READ_ALL, /* NLA_U8 */
>> +	/**
>> +	 * @DRM_RAS_ATTR_QUERY_REPLY: First Nested attributed sent as a
>> +	 * response to DRM_RAS_CMD_QUERY, DRM_RAS_CMD_READ_ALL commands.
>> +	 */
>> +	DRM_RAS_ATTR_QUERY_REPLY, /* NLA_NESTED */
>> +	/** @DRM_RAS_ATTR_ERROR_NAME: Used to pass error name */
>> +	DRM_RAS_ATTR_ERROR_NAME, /* NLA_NUL_STRING */
>> +	/** @DRM_RAS_ATTR_ERROR_ID: Used to pass error id, should be used with
>> +	 * DRM_RAS_CMD_READ_ONE, DRM_RAS_CMD_READ_BLOCK
>> +	 */
>> +	DRM_RAS_ATTR_ERROR_ID, /* NLA_U64 */
>> +	/** @DRM_RAS_ATTR_ERROR_VALUE: Used to pass error value */
>> +	DRM_RAS_ATTR_ERROR_VALUE, /* NLA_U64 */
>
> I'm also confused on all of the errors here and why we would need them
> and it also looks not expansible...
Netlink commands have attributes which enforce a policy and type
checking the command can accept.
and attributes can be specific to the command.

These attributes are used in request and response commands as mentioned
in the comments.

/* attribute policies */
static const struct nla_policy drm_attr_policy_query[DRM_ATTR_MAX + 1] = {
        [DRM_RAS_ATTR_QUERY] = { .type = NLA_U8 },
};

static const struct nla_policy drm_attr_policy_read_one[DRM_ATTR_MAX +
1] = {
        [DRM_RAS_ATTR_ERROR_ID] = { .type = NLA_U64 },
};

static const struct nla_policy drm_attr_policy_read_all[DRM_ATTR_MAX +
1] = {
        [DRM_RAS_ATTR_READ_ALL] = { .type = NLA_U8 },
};

Please let me know if it is unclear.

Thanks,
Aravind.
>
>> +
>> +	__DRM_ATTR_MAX,
>> +	DRM_ATTR_MAX = __DRM_ATTR_MAX - 1,
>> +};
>> +
>> +#if defined(__cplusplus)
>> +}
>> +#endif
>> +
>> +#endif
>> -- 
>> 2.25.1
>>
