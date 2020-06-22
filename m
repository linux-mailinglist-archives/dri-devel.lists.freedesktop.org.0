Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C12042037C4
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 15:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3FE6E5BF;
	Mon, 22 Jun 2020 13:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2210C6E15F;
 Mon, 22 Jun 2020 13:19:31 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id l17so14864243wmj.0;
 Mon, 22 Jun 2020 06:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=GR9In794dpMUFsIS0W8erPBiSWB7ML3vjNvGRCcaD7o=;
 b=H3XzAUhlekk2pvgm5mFe41OFgjeY51eizHqMqTs/QLZBVSOkEhnkalIRUIRWrwlXDv
 g6KFHgyACLluZZ3Qo70dTFSQ3lhiSX+hSSxC6ioO1eYFKUaWhB0UMZdykDE/q2Xwpm1p
 7yi71elmV+mtYrkZmI6m3zTuYyaA2HV9BeN+5wo5+W+FvNlxxbbMkKeGP+h95cnGrcgy
 977pYkLv1Tapy1nUXRAoDrrGnYTexYnD0drGPoiplSNQKh/hwl8uFFCFM5nYZuQSM6Lp
 Y36vmRf/CTzdHsLBW1nBpWVHxdVwIvbfNakIRy4+lGlw0+LPQfUTBxLl+4WmFxl+EhE8
 G0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=GR9In794dpMUFsIS0W8erPBiSWB7ML3vjNvGRCcaD7o=;
 b=MKSzrCTYw5czPJIRpME4qVW2ShUKHrmxaT7kusQOjanMjfhKGWpYbtjkV2oP4xIaHp
 wsQud/onsPB5cE9TCzYcubJ3LY0eC3DOfXpBr6Za4c+D0/v1UkNdyTnvoZpC/DzJ0y8R
 Wu6HIRZO8izeNA+auX7HhsqzUWfAJsW3IoM8kGczQUDhLUqjUBd27iTY/130IzQbRyE6
 cucCzj8xEsBIG7x0H3holpIGC2CmlaC3HKnPc82EerzBRdZ5/tic8Ud1BrqzXyqVEOCb
 KX5KjlDLqNvZV60Kiaa0yFGLuP6yAL9Nh8M5Y4YdbSb/MlTT74IOwFLB1F7rJHVFVy9m
 CLqQ==
X-Gm-Message-State: AOAM531AU2CXo8BOSRuup8A/eRAMYEalgRxaBlrqL+6fZ5h9r3hOnrbL
 FaBvJ7m61gHL4EZ1HIJMU3E=
X-Google-Smtp-Source: ABdhPJxnKTluPunX7zFGqRpf+QSiGMUKlYLviUfJ6dnr2Ovrjrtag1YLnvmCDLuIYL+BT4Amb3zR/w==
X-Received: by 2002:a1c:a1c3:: with SMTP id k186mr2531366wme.15.1592831969682; 
 Mon, 22 Jun 2020 06:19:29 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id c20sm11605053wrb.65.2020.06.22.06.19.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jun 2020 06:19:29 -0700 (PDT)
Subject: Re: [PATCH v2 5/8] drm/amdgpu: Refactor sysfs removal
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-6-git-send-email-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <6b544ca0-278d-d464-f1da-2e23879a27d4@gmail.com>
Date: Mon, 22 Jun 2020 15:19:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1592719388-13819-6-git-send-email-andrey.grodzovsky@amd.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.06.20 um 08:03 schrieb Andrey Grodzovsky:
> Track sysfs files in a list so they all can be removed during pci remove
> since otherwise their removal after that causes crash because parent
> folder was already removed during pci remove.

That looks extremely fishy to me.

It sounds like we just don't remove stuff in the right order.

Christian.

>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h          | 13 +++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c |  7 +++++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   | 35 ++++++++++++++++++++++++----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  | 12 ++++++----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c      |  8 ++++++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 17 ++++++++++++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c     | 13 ++++++++++-
>   drivers/gpu/drm/amd/amdgpu/df_v3_6.c         | 10 +++++---
>   8 files changed, 99 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 604a681..ba3775f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -726,6 +726,15 @@ struct amd_powerplay {
>   
>   #define AMDGPU_RESET_MAGIC_NUM 64
>   #define AMDGPU_MAX_DF_PERFMONS 4
> +
> +struct amdgpu_sysfs_list_node {
> +	struct list_head head;
> +	struct device_attribute *attr;
> +};
> +
> +#define AMDGPU_DEVICE_ATTR_LIST_NODE(_attr) \
> +	struct amdgpu_sysfs_list_node dev_attr_handle_##_attr = {.attr = &dev_attr_##_attr}
> +
>   struct amdgpu_device {
>   	struct device			*dev;
>   	struct drm_device		*ddev;
> @@ -992,6 +1001,10 @@ struct amdgpu_device {
>   	char				product_number[16];
>   	char				product_name[32];
>   	char				serial[16];
> +
> +	struct list_head sysfs_files_list;
> +	struct mutex	 sysfs_files_list_lock;
> +
>   };
>   
>   static inline struct amdgpu_device *amdgpu_ttm_adev(struct ttm_bo_device *bdev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
> index fdd52d8..c1549ee 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
> @@ -1950,8 +1950,10 @@ static ssize_t amdgpu_atombios_get_vbios_version(struct device *dev,
>   	return snprintf(buf, PAGE_SIZE, "%s\n", ctx->vbios_version);
>   }
>   
> +
>   static DEVICE_ATTR(vbios_version, 0444, amdgpu_atombios_get_vbios_version,
>   		   NULL);
> +static AMDGPU_DEVICE_ATTR_LIST_NODE(vbios_version);
>   
>   /**
>    * amdgpu_atombios_fini - free the driver info and callbacks for atombios
> @@ -1972,7 +1974,6 @@ void amdgpu_atombios_fini(struct amdgpu_device *adev)
>   	adev->mode_info.atom_context = NULL;
>   	kfree(adev->mode_info.atom_card_info);
>   	adev->mode_info.atom_card_info = NULL;
> -	device_remove_file(adev->dev, &dev_attr_vbios_version);
>   }
>   
>   /**
> @@ -2038,6 +2039,10 @@ int amdgpu_atombios_init(struct amdgpu_device *adev)
>   		return ret;
>   	}
>   
> +	mutex_lock(&adev->sysfs_files_list_lock);
> +	list_add_tail(&dev_attr_handle_vbios_version.head, &adev->sysfs_files_list);
> +	mutex_unlock(&adev->sysfs_files_list_lock);
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index e7b9065..3173046 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2928,6 +2928,12 @@ static const struct attribute *amdgpu_dev_attributes[] = {
>   	NULL
>   };
>   
> +static AMDGPU_DEVICE_ATTR_LIST_NODE(product_name);
> +static AMDGPU_DEVICE_ATTR_LIST_NODE(product_number);
> +static AMDGPU_DEVICE_ATTR_LIST_NODE(serial_number);
> +static AMDGPU_DEVICE_ATTR_LIST_NODE(pcie_replay_count);
> +
> +
>   /**
>    * amdgpu_device_init - initialize the driver
>    *
> @@ -3029,6 +3035,9 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>   	INIT_LIST_HEAD(&adev->shadow_list);
>   	mutex_init(&adev->shadow_list_lock);
>   
> +	INIT_LIST_HEAD(&adev->sysfs_files_list);
> +	mutex_init(&adev->sysfs_files_list_lock);
> +
>   	INIT_DELAYED_WORK(&adev->delayed_init_work,
>   			  amdgpu_device_delayed_init_work_handler);
>   	INIT_DELAYED_WORK(&adev->gfx.gfx_off_delay_work,
> @@ -3281,6 +3290,13 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>   	if (r) {
>   		dev_err(adev->dev, "Could not create amdgpu device attr\n");
>   		return r;
> +	} else {
> +		mutex_lock(&adev->sysfs_files_list_lock);
> +		list_add_tail(&dev_attr_handle_product_name.head, &adev->sysfs_files_list);
> +		list_add_tail(&dev_attr_handle_product_number.head, &adev->sysfs_files_list);
> +		list_add_tail(&dev_attr_handle_serial_number.head, &adev->sysfs_files_list);
> +		list_add_tail(&dev_attr_handle_pcie_replay_count.head, &adev->sysfs_files_list);
> +		mutex_unlock(&adev->sysfs_files_list_lock);
>   	}
>   
>   	if (IS_ENABLED(CONFIG_PERF_EVENTS))
> @@ -3298,6 +3314,16 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>   	return r;
>   }
>   
> +static void amdgpu_sysfs_remove_files(struct amdgpu_device *adev)
> +{
> +	struct amdgpu_sysfs_list_node *node;
> +
> +	mutex_lock(&adev->sysfs_files_list_lock);
> +	list_for_each_entry(node, &adev->sysfs_files_list, head)
> +		device_remove_file(adev->dev, node->attr);
> +	mutex_unlock(&adev->sysfs_files_list_lock);
> +}
> +
>   /**
>    * amdgpu_device_fini - tear down the driver
>    *
> @@ -3332,6 +3358,11 @@ void amdgpu_device_fini_early(struct amdgpu_device *adev)
>   	amdgpu_fbdev_fini(adev);
>   
>   	amdgpu_irq_fini_early(adev);
> +
> +	amdgpu_sysfs_remove_files(adev);
> +
> +	if (adev->ucode_sysfs_en)
> +		amdgpu_ucode_sysfs_fini(adev);
>   }
>   
>   void amdgpu_device_fini_late(struct amdgpu_device *adev)
> @@ -3366,10 +3397,6 @@ void amdgpu_device_fini_late(struct amdgpu_device *adev)
>   	adev->rmmio = NULL;
>   	amdgpu_device_doorbell_fini(adev);
>   
> -	if (adev->ucode_sysfs_en)
> -		amdgpu_ucode_sysfs_fini(adev);
> -
> -	sysfs_remove_files(&adev->dev->kobj, amdgpu_dev_attributes);
>   	if (IS_ENABLED(CONFIG_PERF_EVENTS))
>   		amdgpu_pmu_fini(adev);
>   	if (amdgpu_discovery && adev->asic_type >= CHIP_NAVI10)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> index 6271044..e7b6c4a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@ -76,6 +76,9 @@ static DEVICE_ATTR(mem_info_gtt_total, S_IRUGO,
>   static DEVICE_ATTR(mem_info_gtt_used, S_IRUGO,
>   	           amdgpu_mem_info_gtt_used_show, NULL);
>   
> +static AMDGPU_DEVICE_ATTR_LIST_NODE(mem_info_gtt_total);
> +static AMDGPU_DEVICE_ATTR_LIST_NODE(mem_info_gtt_used);
> +
>   /**
>    * amdgpu_gtt_mgr_init - init GTT manager and DRM MM
>    *
> @@ -114,6 +117,11 @@ static int amdgpu_gtt_mgr_init(struct ttm_mem_type_manager *man,
>   		return ret;
>   	}
>   
> +	mutex_lock(&adev->sysfs_files_list_lock);
> +	list_add_tail(&dev_attr_handle_mem_info_gtt_total.head, &adev->sysfs_files_list);
> +	list_add_tail(&dev_attr_handle_mem_info_gtt_used.head, &adev->sysfs_files_list);
> +	mutex_unlock(&adev->sysfs_files_list_lock);
> +
>   	return 0;
>   }
>   
> @@ -127,7 +135,6 @@ static int amdgpu_gtt_mgr_init(struct ttm_mem_type_manager *man,
>    */
>   static int amdgpu_gtt_mgr_fini(struct ttm_mem_type_manager *man)
>   {
> -	struct amdgpu_device *adev = amdgpu_ttm_adev(man->bdev);
>   	struct amdgpu_gtt_mgr *mgr = man->priv;
>   	spin_lock(&mgr->lock);
>   	drm_mm_takedown(&mgr->mm);
> @@ -135,9 +142,6 @@ static int amdgpu_gtt_mgr_fini(struct ttm_mem_type_manager *man)
>   	kfree(mgr);
>   	man->priv = NULL;
>   
> -	device_remove_file(adev->dev, &dev_attr_mem_info_gtt_total);
> -	device_remove_file(adev->dev, &dev_attr_mem_info_gtt_used);
> -
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> index ddb4af0c..554fec0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> @@ -2216,6 +2216,8 @@ static DEVICE_ATTR(usbc_pd_fw, S_IRUGO | S_IWUSR,
>   		   psp_usbc_pd_fw_sysfs_read,
>   		   psp_usbc_pd_fw_sysfs_write);
>   
> +static AMDGPU_DEVICE_ATTR_LIST_NODE(usbc_pd_fw);
> +
>   
>   
>   const struct amd_ip_funcs psp_ip_funcs = {
> @@ -2242,13 +2244,17 @@ static int psp_sysfs_init(struct amdgpu_device *adev)
>   
>   	if (ret)
>   		DRM_ERROR("Failed to create USBC PD FW control file!");
> +	else {
> +		mutex_lock(&adev->sysfs_files_list_lock);
> +		list_add_tail(&dev_attr_handle_usbc_pd_fw.head, &adev->sysfs_files_list);
> +		mutex_unlock(&adev->sysfs_files_list_lock);
> +	}
>   
>   	return ret;
>   }
>   
>   static void psp_sysfs_fini(struct amdgpu_device *adev)
>   {
> -	device_remove_file(adev->dev, &dev_attr_usbc_pd_fw);
>   }
>   
>   const struct amdgpu_ip_block_version psp_v3_1_ip_block =
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index 7723937..39c400c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -148,6 +148,12 @@ static DEVICE_ATTR(mem_info_vis_vram_used, S_IRUGO,
>   static DEVICE_ATTR(mem_info_vram_vendor, S_IRUGO,
>   		   amdgpu_mem_info_vram_vendor, NULL);
>   
> +static AMDGPU_DEVICE_ATTR_LIST_NODE(mem_info_vram_total);
> +static AMDGPU_DEVICE_ATTR_LIST_NODE(mem_info_vis_vram_total);
> +static AMDGPU_DEVICE_ATTR_LIST_NODE(mem_info_vram_used);
> +static AMDGPU_DEVICE_ATTR_LIST_NODE(mem_info_vis_vram_used);
> +static AMDGPU_DEVICE_ATTR_LIST_NODE(mem_info_vram_vendor);
> +
>   static const struct attribute *amdgpu_vram_mgr_attributes[] = {
>   	&dev_attr_mem_info_vram_total.attr,
>   	&dev_attr_mem_info_vis_vram_total.attr,
> @@ -184,6 +190,15 @@ static int amdgpu_vram_mgr_init(struct ttm_mem_type_manager *man,
>   	ret = sysfs_create_files(&adev->dev->kobj, amdgpu_vram_mgr_attributes);
>   	if (ret)
>   		DRM_ERROR("Failed to register sysfs\n");
> +	else {
> +		mutex_lock(&adev->sysfs_files_list_lock);
> +		list_add_tail(&dev_attr_handle_mem_info_vram_total.head, &adev->sysfs_files_list);
> +		list_add_tail(&dev_attr_handle_mem_info_vis_vram_total.head, &adev->sysfs_files_list);
> +		list_add_tail(&dev_attr_handle_mem_info_vram_used.head, &adev->sysfs_files_list);
> +		list_add_tail(&dev_attr_handle_mem_info_vis_vram_used.head, &adev->sysfs_files_list);
> +		list_add_tail(&dev_attr_handle_mem_info_vram_vendor.head, &adev->sysfs_files_list);
> +		mutex_unlock(&adev->sysfs_files_list_lock);
> +	}
>   
>   	return 0;
>   }
> @@ -198,7 +213,6 @@ static int amdgpu_vram_mgr_init(struct ttm_mem_type_manager *man,
>    */
>   static int amdgpu_vram_mgr_fini(struct ttm_mem_type_manager *man)
>   {
> -	struct amdgpu_device *adev = amdgpu_ttm_adev(man->bdev);
>   	struct amdgpu_vram_mgr *mgr = man->priv;
>   
>   	spin_lock(&mgr->lock);
> @@ -206,7 +220,6 @@ static int amdgpu_vram_mgr_fini(struct ttm_mem_type_manager *man)
>   	spin_unlock(&mgr->lock);
>   	kfree(mgr);
>   	man->priv = NULL;
> -	sysfs_remove_files(&adev->dev->kobj, amdgpu_vram_mgr_attributes);
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> index 90610b4..455eaa4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> @@ -272,6 +272,9 @@ static ssize_t amdgpu_xgmi_show_error(struct device *dev,
>   static DEVICE_ATTR(xgmi_device_id, S_IRUGO, amdgpu_xgmi_show_device_id, NULL);
>   static DEVICE_ATTR(xgmi_error, S_IRUGO, amdgpu_xgmi_show_error, NULL);
>   
> +static AMDGPU_DEVICE_ATTR_LIST_NODE(xgmi_device_id);
> +static AMDGPU_DEVICE_ATTR_LIST_NODE(xgmi_error);
> +
>   static int amdgpu_xgmi_sysfs_add_dev_info(struct amdgpu_device *adev,
>   					 struct amdgpu_hive_info *hive)
>   {
> @@ -285,10 +288,19 @@ static int amdgpu_xgmi_sysfs_add_dev_info(struct amdgpu_device *adev,
>   		return ret;
>   	}
>   
> +	mutex_lock(&adev->sysfs_files_list_lock);
> +	list_add_tail(&dev_attr_handle_xgmi_device_id.head, &adev->sysfs_files_list);
> +	mutex_unlock(&adev->sysfs_files_list_lock);
> +
>   	/* Create xgmi error file */
>   	ret = device_create_file(adev->dev, &dev_attr_xgmi_error);
>   	if (ret)
>   		pr_err("failed to create xgmi_error\n");
> +	else {
> +		mutex_lock(&adev->sysfs_files_list_lock);
> +		list_add_tail(&dev_attr_handle_xgmi_error.head, &adev->sysfs_files_list);
> +		mutex_unlock(&adev->sysfs_files_list_lock);
> +	}
>   
>   
>   	/* Create sysfs link to hive info folder on the first device */
> @@ -325,7 +337,6 @@ static int amdgpu_xgmi_sysfs_add_dev_info(struct amdgpu_device *adev,
>   static void amdgpu_xgmi_sysfs_rem_dev_info(struct amdgpu_device *adev,
>   					  struct amdgpu_hive_info *hive)
>   {
> -	device_remove_file(adev->dev, &dev_attr_xgmi_device_id);
>   	sysfs_remove_link(&adev->dev->kobj, adev->ddev->unique);
>   	sysfs_remove_link(hive->kobj, adev->ddev->unique);
>   }
> diff --git a/drivers/gpu/drm/amd/amdgpu/df_v3_6.c b/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
> index a7b8292..f95b0b2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
> +++ b/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
> @@ -265,6 +265,8 @@ static ssize_t df_v3_6_get_df_cntr_avail(struct device *dev,
>   /* device attr for available perfmon counters */
>   static DEVICE_ATTR(df_cntr_avail, S_IRUGO, df_v3_6_get_df_cntr_avail, NULL);
>   
> +static AMDGPU_DEVICE_ATTR_LIST_NODE(df_cntr_avail);
> +
>   static void df_v3_6_query_hashes(struct amdgpu_device *adev)
>   {
>   	u32 tmp;
> @@ -299,6 +301,11 @@ static void df_v3_6_sw_init(struct amdgpu_device *adev)
>   	ret = device_create_file(adev->dev, &dev_attr_df_cntr_avail);
>   	if (ret)
>   		DRM_ERROR("failed to create file for available df counters\n");
> +	else {
> +		mutex_lock(&adev->sysfs_files_list_lock);
> +		list_add_tail(&dev_attr_handle_df_cntr_avail.head, &adev->sysfs_files_list);
> +		mutex_unlock(&adev->sysfs_files_list_lock);
> +	}
>   
>   	for (i = 0; i < AMDGPU_MAX_DF_PERFMONS; i++)
>   		adev->df_perfmon_config_assign_mask[i] = 0;
> @@ -308,9 +315,6 @@ static void df_v3_6_sw_init(struct amdgpu_device *adev)
>   
>   static void df_v3_6_sw_fini(struct amdgpu_device *adev)
>   {
> -
> -	device_remove_file(adev->dev, &dev_attr_df_cntr_avail);
> -
>   }
>   
>   static void df_v3_6_enable_broadcast_mode(struct amdgpu_device *adev,

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
