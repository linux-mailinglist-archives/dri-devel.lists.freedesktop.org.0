Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3DF6E0A52
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 11:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13ACE10EA9D;
	Thu, 13 Apr 2023 09:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF7D10EAA1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 09:34:50 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id z9so8828896ejx.11
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 02:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681378488; x=1683970488;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bXeV6M74gtU38K4amTpPRnR3TOlQ2//EVPMkHrtwUxE=;
 b=WIW3CNq1ewAgZjQhtlWaLTJiNXRYLAODjyujgCAQK3Q5wTMqKyG1uxVPrJ/klkiXYX
 XTJ4WBghCpYCw7BRmTe7JIRuTT/iuDYAsQ8htmejRBrRdLPGMWRdkPEZ+tDZfpIijcAe
 RpmZqzMLTbyB9OZHiKHE7adjc3CznUXI0ckM+2YpuVXW2DXEyfh9F08P2PIYm3bhpZJ3
 e5jXZeRHaFsdv2N1cd8Yrb2s3gyBHfly/lKzcXSitOTIlGTf3hYVcIxuw9NQ8TxH/kxX
 tybF3H7OeXHfVm/jVNd3PkGIgjzINunV/nSpZE+ETUm3d6X9YDCNz4tmfY7RrUX90kdM
 bC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681378488; x=1683970488;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bXeV6M74gtU38K4amTpPRnR3TOlQ2//EVPMkHrtwUxE=;
 b=c66tFuOeptx9CGi5qPCzVzHMitvyVG5zbjFxihrkORm8eF+IqAsJsLjlzCkC8oniPt
 e5LGH+nkuw4v8MDnjO5+F/Qi3lf7/Tv2fp0NmFG7P0dumdyAr4wU/eXoG5dPDtP9QDvE
 uN6KomUNG6TjBXNP6opUJvq+PfDHnqmOVGCSqAszDgBDJoWNhklcpsdyGKAZRdPfENbv
 zEcgClojMvii0MK1/hOK/XGKovgERworxs47UD7tSx5SEPZjVSPocwLWKGzS499ywVLu
 npNvt9ZWFiOX0GH3hTTqz2mymqxCXvxLJEuszlzqBM+kuzQzskm2ac7r0WlNAKYZCM6s
 ZYjw==
X-Gm-Message-State: AAQBX9dJcQ54FkAazW5NqKO/dJgWx4+cJOU9MRTNCZqQNiob8yMsTygp
 p+sWc/Ec9cag08ydnwLvqmw=
X-Google-Smtp-Source: AKy350aeZzspAMRlsmMTnRLDAkEwLN+oyFzlx9dQzRiEsOXfge3CJwbaYCPDc2kTE7+O+he9xmMuDg==
X-Received: by 2002:a17:906:4813:b0:94e:bede:6d2a with SMTP id
 w19-20020a170906481300b0094ebede6d2amr116031ejq.24.1681378487985; 
 Thu, 13 Apr 2023 02:34:47 -0700 (PDT)
Received: from [192.168.178.21] (p4fc2092b.dip0.t-ipconnect.de. [79.194.9.43])
 by smtp.gmail.com with ESMTPSA id
 v17-20020aa7d651000000b00504ecbd5ae2sm586076edr.42.2023.04.13.02.34.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Apr 2023 02:34:47 -0700 (PDT)
Message-ID: <b9a30452-8f3a-ce58-348c-cef32b27bb8a@gmail.com>
Date: Thu, 13 Apr 2023 11:34:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/5] drm/debugfs: remove dev->debugfs_list and
 debugfs_mutex v2
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20230412145206.2483-1-christian.koenig@amd.com>
 <20230412145206.2483-4-christian.koenig@amd.com>
 <ZDbKKq6wlxhhrFyy@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <ZDbKKq6wlxhhrFyy@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org, ogabbay@kernel.org,
 mcanal@igalia.com, mwen@igalia.com, stanislaw.gruszka@linux.intel.com,
 maxime@cerno.tech, wambui.karugax@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.04.23 um 17:11 schrieb Daniel Vetter:
> On Wed, Apr 12, 2023 at 04:52:04PM +0200, Christian König wrote:
>> The mutex was completely pointless in the first place since any
>> parallel adding of files to this list would result in random
>> behavior since the list is filled and consumed multiple times.
>>
>> Completely drop that approach and just create the files directly but
>> return -ENODEV while opening the file when the minors are not
>> registered yet.
> This part seems to be missing?

I wanted to move this into a separate patch and then forgot to add it. 
Going to fix that.

> The other issue is that partial driver load cleanup now goes boom I think,
> you need to both remove them all in _unregister but also in final drm_dev
> cleanup. Or I'm missing how this works. Maybe you could also use drmm_ for
> that to make sure it's always done.

Good point. Should we call the cleanup function from both the unregister 
and the final drm_dev cleanup or just the later?

Thanks,
Christian.

>
> There shouldn't be a race as long as the "are we registered yet" check is
> there, since in that case the driver never registered. So no problems
> trying to access the files when they could try to access things which are
> already cleaned up.
>
> I think with those details ironed out this makes some sense to me,
> assuming I understood it correctly.
>
>> v2: rebase on debugfs directory rework, limit access before minors are
>>      registered.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/drm_debugfs.c     | 27 ++-------------------------
>>   drivers/gpu/drm/drm_drv.c         |  3 ---
>>   drivers/gpu/drm/drm_internal.h    |  5 -----
>>   drivers/gpu/drm/drm_mode_config.c |  2 --
>>   include/drm/drm_device.h          | 15 ---------------
>>   5 files changed, 2 insertions(+), 50 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
>> index 59c3d76d28f4..427c5eb4eca0 100644
>> --- a/drivers/gpu/drm/drm_debugfs.c
>> +++ b/drivers/gpu/drm/drm_debugfs.c
>> @@ -245,7 +245,6 @@ int drm_debugfs_register(struct drm_minor *minor, int minor_id,
>>   			 struct dentry *root)
>>   {
>>   	struct drm_device *dev = minor->dev;
>> -	struct drm_debugfs_entry *entry, *tmp;
>>   	char name[64];
>>   
>>   	INIT_LIST_HEAD(&minor->debugfs_list);
>> @@ -260,30 +259,9 @@ int drm_debugfs_register(struct drm_minor *minor, int minor_id,
>>   	if (dev->driver->debugfs_init && dev->render != minor)
>>   		dev->driver->debugfs_init(minor);
>>   
>> -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
>> -		debugfs_create_file(entry->file.name, 0444,
>> -				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
>> -		list_del(&entry->list);
>> -	}
>> -
>>   	return 0;
>>   }
>>   
>> -void drm_debugfs_late_register(struct drm_device *dev)
>> -{
>> -	struct drm_minor *minor = dev->primary;
>> -	struct drm_debugfs_entry *entry, *tmp;
>> -
>> -	if (!minor)
>> -		return;
>> -
>> -	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
>> -		debugfs_create_file(entry->file.name, 0444,
>> -				    minor->debugfs_root, entry, &drm_debugfs_entry_fops);
>> -		list_del(&entry->list);
>> -	}
>> -}
>> -
>>   int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
>>   			     struct drm_minor *minor)
>>   {
>> @@ -353,9 +331,8 @@ void drm_debugfs_add_file(struct drm_device *dev, const char *name,
>>   	entry->file.data = data;
>>   	entry->dev = dev;
>>   
>> -	mutex_lock(&dev->debugfs_mutex);
>> -	list_add(&entry->list, &dev->debugfs_list);
>> -	mutex_unlock(&dev->debugfs_mutex);
>> +	debugfs_create_file(name, 0444, dev->debugfs_root, entry,
>> +			    &drm_debugfs_entry_fops);
>>   }
>>   EXPORT_SYMBOL(drm_debugfs_add_file);
>>   
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index 05b831f9fe71..f928b4490ece 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -597,7 +597,6 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
>>   	mutex_destroy(&dev->clientlist_mutex);
>>   	mutex_destroy(&dev->filelist_mutex);
>>   	mutex_destroy(&dev->struct_mutex);
>> -	mutex_destroy(&dev->debugfs_mutex);
>>   	drm_legacy_destroy_members(dev);
>>   }
>>   
>> @@ -638,14 +637,12 @@ static int drm_dev_init(struct drm_device *dev,
>>   	INIT_LIST_HEAD(&dev->filelist_internal);
>>   	INIT_LIST_HEAD(&dev->clientlist);
>>   	INIT_LIST_HEAD(&dev->vblank_event_list);
>> -	INIT_LIST_HEAD(&dev->debugfs_list);
>>   
>>   	spin_lock_init(&dev->event_lock);
>>   	mutex_init(&dev->struct_mutex);
>>   	mutex_init(&dev->filelist_mutex);
>>   	mutex_init(&dev->clientlist_mutex);
>>   	mutex_init(&dev->master_mutex);
>> -	mutex_init(&dev->debugfs_mutex);
>>   
>>   	ret = drmm_add_action_or_reset(dev, drm_dev_init_release, NULL);
>>   	if (ret)
>> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
>> index 5c6e1cadf09b..c5fadbd3fd7d 100644
>> --- a/drivers/gpu/drm/drm_internal.h
>> +++ b/drivers/gpu/drm/drm_internal.h
>> @@ -185,7 +185,6 @@ void drm_debugfs_dev_register(struct drm_device *dev);
>>   int drm_debugfs_register(struct drm_minor *minor, int minor_id,
>>   			 struct dentry *root);
>>   void drm_debugfs_cleanup(struct drm_minor *minor);
>> -void drm_debugfs_late_register(struct drm_device *dev);
>>   void drm_debugfs_connector_add(struct drm_connector *connector);
>>   void drm_debugfs_connector_remove(struct drm_connector *connector);
>>   void drm_debugfs_crtc_add(struct drm_crtc *crtc);
>> @@ -206,10 +205,6 @@ static inline void drm_debugfs_cleanup(struct drm_minor *minor)
>>   {
>>   }
>>   
>> -static inline void drm_debugfs_late_register(struct drm_device *dev)
>> -{
>> -}
>> -
>>   static inline void drm_debugfs_connector_add(struct drm_connector *connector)
>>   {
>>   }
>> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
>> index 87eb591fe9b5..8525ef851540 100644
>> --- a/drivers/gpu/drm/drm_mode_config.c
>> +++ b/drivers/gpu/drm/drm_mode_config.c
>> @@ -54,8 +54,6 @@ int drm_modeset_register_all(struct drm_device *dev)
>>   	if (ret)
>>   		goto err_connector;
>>   
>> -	drm_debugfs_late_register(dev);
>> -
>>   	return 0;
>>   
>>   err_connector:
>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>> index 3cf12b14232d..c490977ee250 100644
>> --- a/include/drm/drm_device.h
>> +++ b/include/drm/drm_device.h
>> @@ -318,21 +318,6 @@ struct drm_device {
>>   	 */
>>   	struct dentry *debugfs_root;
>>   
>> -	/**
>> -	 * @debugfs_mutex:
>> -	 *
>> -	 * Protects &debugfs_list access.
>> -	 */
>> -	struct mutex debugfs_mutex;
>> -
>> -	/**
>> -	 * @debugfs_list:
>> -	 *
>> -	 * List of debugfs files to be created by the DRM device. The files
>> -	 * must be added during drm_dev_register().
>> -	 */
>> -	struct list_head debugfs_list;
>> -
>>   	/* Everything below here is for legacy driver, never use! */
>>   	/* private: */
>>   #if IS_ENABLED(CONFIG_DRM_LEGACY)
>> -- 
>> 2.34.1
>>

