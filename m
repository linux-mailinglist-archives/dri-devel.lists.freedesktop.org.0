Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A5874AB9F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 09:11:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DD910E50B;
	Fri,  7 Jul 2023 07:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEECA10E50B
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 07:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688713900; x=1720249900;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=d6ggIXwITiqY7HTbBGGZ+pYRmSceATHqodYjbC3p9JY=;
 b=TOrOtwtdX/OCvMrhbNoBzagNAtYGjuoWOVKiM9x/2cPAsVvRkV7HDeEj
 JwSl5JBWT2Y67ohnFwGq4DqTb55YG11jGIF5xwffseUd/72Hy7h1zFVO9
 r5TBqkLuUfwHy186fpGLPFMDOaY1+zKbnh3hyENemNZwesywGuLA0kQmv
 f5dJ4fIXSKIX1pVMQZeBDf89z86YeXUfKatoMDh817JAoWMcgyFCyYvVp
 SZ2AZBg+RmhCW6y/AL19/uX6kEY7GJZ6mt7W9Lh2wKPb+uNUp9MmKN9Se
 lRdSRznkB9tyr1f9F6xNhekacF+OtdLg6Z7Tv4YwDZgWuinwSvrvBuoSz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="344155441"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="344155441"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 00:11:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="755051550"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="755051550"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.151.57])
 ([10.249.151.57])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 00:11:36 -0700
Message-ID: <1e20d490-ff0a-25db-214c-b4e98b620286@linux.intel.com>
Date: Fri, 7 Jul 2023 09:11:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/5] accel/ivpu: Initial debugfs support
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230524074847.866711-1-stanislaw.gruszka@linux.intel.com>
 <20230524074847.866711-2-stanislaw.gruszka@linux.intel.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230524074847.866711-2-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 24.05.2023 09:48, Stanislaw Gruszka wrote:
> Add initial debugfs support. Provide below functionality:
> 
> - print buffer objects
> - print latest boot mode
> - trigger vpu engine reset
> 
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
>  drivers/accel/ivpu/Makefile       |  1 +
>  drivers/accel/ivpu/ivpu_debugfs.c | 74 +++++++++++++++++++++++++++++++
>  drivers/accel/ivpu/ivpu_debugfs.h | 13 ++++++
>  drivers/accel/ivpu/ivpu_drv.c     |  5 +++
>  4 files changed, 93 insertions(+)
>  create mode 100644 drivers/accel/ivpu/ivpu_debugfs.c
>  create mode 100644 drivers/accel/ivpu/ivpu_debugfs.h
> 
> diff --git a/drivers/accel/ivpu/Makefile b/drivers/accel/ivpu/Makefile
> index 80f1fb3548ae..3ca2fb3936f6 100644
> --- a/drivers/accel/ivpu/Makefile
> +++ b/drivers/accel/ivpu/Makefile
> @@ -2,6 +2,7 @@
>  # Copyright (C) 2023 Intel Corporation
>  
>  intel_vpu-y := \
> +	ivpu_debugfs.o \
>  	ivpu_drv.o \
>  	ivpu_fw.o \
>  	ivpu_gem.o \
> diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
> new file mode 100644
> index 000000000000..df51ec008fb5
> --- /dev/null
> +++ b/drivers/accel/ivpu/ivpu_debugfs.c
> @@ -0,0 +1,74 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2020-2023 Intel Corporation
> + */
> +
> +#include <drm/drm_debugfs.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_print.h>
> +
> +#include <uapi/drm/ivpu_accel.h>
> +
> +#include "ivpu_debugfs.h"
> +#include "ivpu_drv.h"
> +#include "ivpu_gem.h"
> +#include "ivpu_jsm_msg.h"
> +#include "ivpu_pm.h"
> +
> +static int bo_list_show(struct seq_file *s, void *v)
> +{
> +	struct drm_info_node *node = (struct drm_info_node *)s->private;
> +	struct drm_printer p = drm_seq_file_printer(s);
> +
> +	ivpu_bo_list(node->minor->dev, &p);
> +
> +	return 0;
> +}
> +
> +static int last_bootmode_show(struct seq_file *s, void *v)
> +{
> +	struct drm_info_node *node = (struct drm_info_node *)s->private;
> +	struct ivpu_device *vdev = to_ivpu_device(node->minor->dev);
> +
> +	seq_printf(s, "%s\n", (vdev->pm->is_warmboot) ? "warmboot" : "coldboot");
> +
> +	return 0;
> +}
> +
> +static const struct drm_info_list vdev_debugfs_list[] = {
> +	{"bo_list", bo_list_show, 0},
> +	{"last_bootmode", last_bootmode_show, 0},
> +};
> +
> +static ssize_t
> +ivpu_reset_engine_fn(struct file *file, const char __user *user_buf, size_t size, loff_t *pos)
> +{
> +	struct ivpu_device *vdev = file->private_data;
> +
> +	if (!size)
> +		return -EINVAL;
> +
> +	if (ivpu_jsm_reset_engine(vdev, DRM_IVPU_ENGINE_COMPUTE))
> +		return -ENODEV;
> +	if (ivpu_jsm_reset_engine(vdev, DRM_IVPU_ENGINE_COPY))
> +		return -ENODEV;
> +
> +	return size;
> +}
> +
> +static const struct file_operations ivpu_reset_engine_fops = {
> +	.owner = THIS_MODULE,
> +	.open = simple_open,
> +	.write = ivpu_reset_engine_fn,
> +};
> +
> +void ivpu_debugfs_init(struct drm_minor *minor)
> +{
> +	struct ivpu_device *vdev = to_ivpu_device(minor->dev);
> +
> +	drm_debugfs_create_files(vdev_debugfs_list, ARRAY_SIZE(vdev_debugfs_list),
> +				 minor->debugfs_root, minor);
> +
> +	debugfs_create_file("reset_engine", 0200, minor->debugfs_root, vdev,
> +			    &ivpu_reset_engine_fops);
> +}
> diff --git a/drivers/accel/ivpu/ivpu_debugfs.h b/drivers/accel/ivpu/ivpu_debugfs.h
> new file mode 100644
> index 000000000000..78f80c1e00e4
> --- /dev/null
> +++ b/drivers/accel/ivpu/ivpu_debugfs.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2020-2023 Intel Corporation
> + */
> +
> +#ifndef __IVPU_DEBUGFS_H__
> +#define __IVPU_DEBUGFS_H__
> +
> +struct drm_minor;
> +
> +void ivpu_debugfs_init(struct drm_minor *minor);
> +
> +#endif /* __IVPU_DEBUGFS_H__ */
> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> index 2df7643b843d..4c0345417c14 100644
> --- a/drivers/accel/ivpu/ivpu_drv.c
> +++ b/drivers/accel/ivpu/ivpu_drv.c
> @@ -14,6 +14,7 @@
>  #include <drm/drm_prime.h>
>  
>  #include "vpu_boot_api.h"
> +#include "ivpu_debugfs.h"
>  #include "ivpu_drv.h"
>  #include "ivpu_fw.h"
>  #include "ivpu_gem.h"
> @@ -378,6 +379,10 @@ static const struct drm_driver driver = {
>  	.gem_prime_import = ivpu_gem_prime_import,
>  	.gem_prime_mmap = drm_gem_prime_mmap,
>  
> +#if defined(CONFIG_DEBUG_FS)
> +	.debugfs_init = ivpu_debugfs_init,
> +#endif
> +
>  	.ioctls = ivpu_drm_ioctls,
>  	.num_ioctls = ARRAY_SIZE(ivpu_drm_ioctls),
>  	.fops = &ivpu_fops,
