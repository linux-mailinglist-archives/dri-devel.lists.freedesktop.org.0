Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C66E37F48F4
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 15:30:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5DC10E135;
	Wed, 22 Nov 2023 14:30:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A84910E135;
 Wed, 22 Nov 2023 14:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700663414; x=1732199414;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Ffwp2PpIzs99x+TtC29vYvfsvyJur89MuvLVm4h7PQg=;
 b=eMaS++e6omz23cgKvZNd/QqVWO365rFdQ/6YXBPOTgaekxmkrVFiqO+2
 HMRXCY3byyg1W+n5JdPkZ0DiL5Wi4s7AwK0PpBEihifIq/i6BwuaFOAGi
 UovcYMKkWa4yhIT01CyQDfsLwHJ+zUAgLBeaTMVCO7uTb7iJ5I+YpRvR3
 qqAzfCYE3vs4AjLVMnzVAxrb7+P/lAHt49HGLUUnlqRV/YG4lfyi63LnY
 87FScbDlsUSu4R+juRGO+zI1VYaO4WYP4reeMvuI+p8/z6AFTZNR5DKnn
 l/7abETnMaehfU0++KkmGZwHNgloXqQgLj7FlE8A2pi8p3YCA+zin7uRh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="382459614"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="382459614"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 06:30:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="15277892"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 06:30:08 -0800
Message-ID: <a5e3f5bd-006e-4beb-8b29-95809881b11b@linux.intel.com>
Date: Wed, 22 Nov 2023 20:02:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 1/5] drm/netlink: Add netlink infrastructure
Content-Language: en-US
To: Tomer Tayar <ttayar@habana.ai>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 "Hawking.Zhang@amd.com" <Hawking.Zhang@amd.com>,
 "Harish.Kasiviswanathan@amd.com" <Harish.Kasiviswanathan@amd.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "Luben.Tuikov@amd.com" <Luben.Tuikov@amd.com>,
 "Ruhl, Michael J" <michael.j.ruhl@intel.com>
References: <20231020155835.1295524-1-aravind.iddamsetty@linux.intel.com>
 <20231020155835.1295524-2-aravind.iddamsetty@linux.intel.com>
 <d37f4dd5-5eb6-46e8-941e-b25f9934ec1a@habana.ai>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <d37f4dd5-5eb6-46e8-941e-b25f9934ec1a@habana.ai>
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


On 11/10/23 17:54, Tomer Tayar wrote:
> On 20/10/2023 18:58, Aravind Iddamsetty wrote:
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
>> Cc: Tomer Tayar<ttayar@habana.ai>
>> Cc: Daniel Vetter<daniel@ffwll.ch>
>> Cc: Michael J. Ruhl<michael.j.ruhl@intel.com>
>>
>> Signed-off-by: Aravind Iddamsetty<aravind.iddamsetty@linux.intel.com>
>> ---
>>   drivers/gpu/drm/Makefile       |   1 +
>>   drivers/gpu/drm/drm_drv.c      |   7 ++
>>   drivers/gpu/drm/drm_netlink.c  | 188 +++++++++++++++++++++++++++++++++
>>   include/drm/drm_device.h       |   8 ++
>>   include/drm/drm_drv.h          |   7 ++
>>   include/drm/drm_netlink.h      |  30 ++++++
>>   include/uapi/drm/drm_netlink.h |  83 +++++++++++++++
>>   7 files changed, 324 insertions(+)
>>   create mode 100644 drivers/gpu/drm/drm_netlink.c
>>   create mode 100644 include/drm/drm_netlink.h
>>   create mode 100644 include/uapi/drm/drm_netlink.h
>>
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index ee64c51274ad..60864369adaa 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -35,6 +35,7 @@ drm-y := \
>>   	drm_mode_object.o \
>>   	drm_modes.o \
>>   	drm_modeset_lock.o \
>> +	drm_netlink.o \
>>   	drm_plane.o \
>>   	drm_prime.o \
>>   	drm_print.o \
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index 535f16e7882e..31f55c1c7524 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -937,6 +937,12 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
>>   	if (ret)
>>   		goto err_minors;
>>   
>> +	if (driver->genl_ops) {
>> +		ret = drm_genl_register(dev);
>> +		if (ret)
>> +			goto err_minors;
>> +	}
>> +
>>   	ret = create_compat_control_link(dev);
>>   	if (ret)
>>   		goto err_minors;
>> @@ -1074,6 +1080,7 @@ static void drm_core_exit(void)
>>   {
>>   	drm_privacy_screen_lookup_exit();
>>   	accel_core_exit();
>> +	drm_genl_exit();
>>   	unregister_chrdev(DRM_MAJOR, "drm");
>>   	debugfs_remove(drm_debugfs_root);
>>   	drm_sysfs_destroy();
>> diff --git a/drivers/gpu/drm/drm_netlink.c b/drivers/gpu/drm/drm_netlink.c
>> new file mode 100644
>> index 000000000000..8add249c1da3
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_netlink.c
>> @@ -0,0 +1,188 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
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
> a description for msg_size is missing
Thanks for catching it will add.
>
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
>> +	*usrhdr = genlmsg_put_reply(new_msg, info, &dev->drm_genl_family, 0, info->genlhdr->cmd);
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
>> +	if (GENL_REQ_ATTR_CHECK(info, DRM_RAS_ATTR_REQUEST))
>> +		return -EINVAL;
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
>> +	[DRM_RAS_ATTR_REQUEST] = { .type = NLA_U8 },
>> +};
>> +
>> +static const struct nla_policy drm_attr_policy_read_one[DRM_ATTR_MAX + 1] = {
>> +	[DRM_RAS_ATTR_ERROR_ID] = { .type = NLA_U64 },
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
>> +		.policy = drm_attr_policy_query,
>> +	},
>> +};
>> +
>> +static void drm_genl_family_init(struct drm_device *dev)
>> +{
>> +	/* Use drm primary node name eg: card0 to name the genl family */
>> +	snprintf(dev->drm_genl_family.name, sizeof(dev->drm_genl_family.name), "%s", dev->primary->kdev->kobj.name);
> dev_name() can be used.
> Also, what about accel? Maybe check dev->primary and use primary/accel 
> accordingly?
the present series is adding this feature for primary device only and has
no knowledge how it will be used for accel device, so when accel device
start using this infra should make that particular change or do you think
it should be added as part of this series only?
>
>> +	dev->drm_genl_family.version = DRM_GENL_VERSION;
>> +	dev->drm_genl_family.parallel_ops = true;
>> +	dev->drm_genl_family.ops = drm_genl_ops;
>> +	dev->drm_genl_family.n_ops = ARRAY_SIZE(drm_genl_ops);
>> +	dev->drm_genl_family.maxattr = DRM_ATTR_MAX;
>> +	dev->drm_genl_family.module = dev->dev->driver->owner;
>> +}
>> +
>> +static void drm_genl_deregister(struct drm_device *dev,  void *arg)
> Redundant space before "void *arg"
will clean it.
>
>> +{
>> +	drm_dbg_driver(dev, "unregistering genl family %s\n", dev->drm_genl_family.name);
>> +
>> +	xa_erase(&drm_dev_xarray, dev->drm_genl_family.id);
>> +
>> +	genl_unregister_family(&dev->drm_genl_family);
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
>> +	ret = genl_register_family(&dev->drm_genl_family);
>> +	if (ret < 0) {
>> +		drm_warn(dev, "genl family registration failed\n");
>> +		return ret;
>> +	}
>> +
>> +	drm_dbg_driver(dev, "genl family id %d and name %s\n", dev->drm_genl_family.id, dev->drm_genl_family.name);
>> +
>> +	ret = xa_err(xa_store(&drm_dev_xarray, dev->drm_genl_family.id, dev, GFP_KERNEL));
>> +	if (ret)
>> +		goto genl_unregister;
>> +
>> +	ret = drmm_add_action_or_reset(dev, drm_genl_deregister, NULL);
>> +
>> +	return ret;
>> +
>> +genl_unregister:
>> +	genl_unregister_family(&dev->drm_genl_family);
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
>> index c490977ee250..d3ae91b7714d 100644
>> --- a/include/drm/drm_device.h
>> +++ b/include/drm/drm_device.h
>> @@ -8,6 +8,7 @@
>>   
>>   #include <drm/drm_legacy.h>
>>   #include <drm/drm_mode_config.h>
>> +#include <drm/drm_netlink.h>
>>   
>>   struct drm_driver;
>>   struct drm_minor;
>> @@ -318,6 +319,13 @@ struct drm_device {
>>   	 */
>>   	struct dentry *debugfs_root;
>>   
>> +	/**
>> +	 * @drm_genl_family:
>> +	 *
>> +	 * Generic netlink family registration structure.
>> +	 */
>> +	struct genl_family drm_genl_family;
>> +
>>   	/* Everything below here is for legacy driver, never use! */
>>   	/* private: */
>>   #if IS_ENABLED(CONFIG_DRM_LEGACY)
>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>> index e2640dc64e08..ebdb7850d235 100644
>> --- a/include/drm/drm_drv.h
>> +++ b/include/drm/drm_drv.h
>> @@ -434,6 +434,13 @@ struct drm_driver {
>>   	 */
>>   	const struct file_operations *fops;
>>   
>> +	/**
>> +	 * @genl_ops:
>> +	 *
>> +	 * Drivers private callback to genl commands
>> +	 */
>> +	const struct driver_genl_ops *genl_ops;
>> +
>>   #ifdef CONFIG_DRM_LEGACY
>>   	/* Everything below here is for legacy driver, never use! */
>>   	/* private: */
>> diff --git a/include/drm/drm_netlink.h b/include/drm/drm_netlink.h
>> new file mode 100644
>> index 000000000000..54527dae7847
>> --- /dev/null
>> +++ b/include/drm/drm_netlink.h
>> @@ -0,0 +1,30 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef __DRM_NETLINK_H__
>> +#define __DRM_NETLINK_H__
>> +
>> +#include <linux/netdevice.h>
>> +#include <net/genetlink.h>
>> +#include <net/sock.h>
>> +#include <uapi/drm/drm_netlink.h>
>> +
>> +struct drm_device;
>> +
>> +struct driver_genl_ops {
>> +	int		       (*doit)(struct drm_device *dev,
>> +				       struct sk_buff *skb,
> The skb parameter is currently not used (both xe_genl_list_errors() and 
> xe_genl_read_error() allocate a new skb).
> Did you add because it might be needed for future ops?
well I wanted to pass on the details the netlink subsystem sends and leave it to the driver
if it wants to use it anyway.
>
>> +				       struct genl_info *info);
>> +};
>> +
>> +int drm_genl_register(struct drm_device *dev);
>> +void drm_genl_exit(void);
>> +int drm_genl_reply(struct sk_buff *msg, struct genl_info *info, void *usrhdr);
>> +struct sk_buff *
>> +drm_genl_alloc_msg(struct drm_device *dev,
>> +		   struct genl_info *info,
>> +		   size_t msg_size, void **usrhdr);
>> +#endif
>> +
>> diff --git a/include/uapi/drm/drm_netlink.h b/include/uapi/drm/drm_netlink.h
>> new file mode 100644
>> index 000000000000..aab42147a20e
>> --- /dev/null
>> +++ b/include/uapi/drm/drm_netlink.h
>> @@ -0,0 +1,83 @@
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
>> +	/** @DRM_RAS_CMD_QUERY: Command to list all errors names with config-id */
>> +	DRM_RAS_CMD_QUERY,
>> +	/** @DRM_RAS_CMD_READ_ONE: Command to get a counter for a specific error */
>> +	DRM_RAS_CMD_READ_ONE,
>> +	/** @DRM_RAS_CMD_READ_ALL: Command to get counters of all errors */
>> +	DRM_RAS_CMD_READ_ALL,
>> +
>> +	__DRM_CMD_MAX,
>> +	DRM_CMD_MAX = __DRM_CMD_MAX - 1,
>> +};
>> +
>> +/**
>> + * enum drm_error_attr - Attributes to use with drm_genl_error_cmds
>> + *
>> + */
>> +enum drm_error_attr {
>> +	DRM_ATTR_UNSPEC,
>> +	DRM_ATTR_PAD = DRM_ATTR_UNSPEC,
>> +	/**
>> +	 * @DRM_RAS_ATTR_REQUEST: Should be used with DRM_RAS_CMD_QUERY,
>> +	 * DRM_RAS_CMD_READ_ALL
>> +	 */
>> +	DRM_RAS_ATTR_REQUEST, /* NLA_U8 */
>> +	/**
>> +	 * @DRM_RAS_ATTR_QUERY_REPLY: First Nested attributed sent as a
>> +	 * response to DRM_RAS_CMD_QUERY, DRM_RAS_CMD_READ_ALL commands.
>> +	 */
>> +	DRM_RAS_ATTR_QUERY_REPLY, /*NLA_NESTED*/
> Maybe a space before and after NLA_NESTED?

right missed that.

Thanks,
Aravind.
>
> Thanks,
> Tomer
>
>> +	/** @DRM_RAS_ATTR_ERROR_NAME: Used to pass error name */
>> +	DRM_RAS_ATTR_ERROR_NAME, /* NLA_NUL_STRING */
>> +	/** @DRM_RAS_ATTR_ERROR_ID: Used to pass error id */
>> +	DRM_RAS_ATTR_ERROR_ID, /* NLA_U64 */
>> +	/** @DRM_RAS_ATTR_ERROR_VALUE: Used to pass error value */
>> +	DRM_RAS_ATTR_ERROR_VALUE, /* NLA_U64 */
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
>
