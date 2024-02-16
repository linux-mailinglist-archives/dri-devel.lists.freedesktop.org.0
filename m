Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80675857A4C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 11:30:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A7B10E352;
	Fri, 16 Feb 2024 10:30:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q03FHTlq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC0810E352;
 Fri, 16 Feb 2024 10:30:00 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-33d152a34c7so455193f8f.3; 
 Fri, 16 Feb 2024 02:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708079399; x=1708684199; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GKevrJOYIycMmtJhAGuLF6g1H2Kc16hvAKk7YFtZO5A=;
 b=Q03FHTlqT/I8PZ+V/322yFF83U2gjj5xVd2HQjJMm2V1BeVsu/ioW3bMbiyGXQuRxy
 UAdUpL2ezfQ4p/wwBUDpeH58Hguyyf5dzVT1RaIAIu56safCUMttk96TLmDrVR51WENb
 a8SYiFZYtvpnPHluG5z2RknTVbEyCaF58u69K/2B9H5lt0BIp7cD9aksGQsVh6bhIu5w
 R1Dd3E31E5urmP+EBX1RZL2G+JGijY5kIABL3xgPhh2ITKhD5eVYCGzCSw5fQtGK18g9
 FNZKIx8FPdZWAu9f3xC7ZcWTm8CGeWwkhX+Pf+rgHEdtZWoDe+ba7FXy2nCycqdm0lek
 FPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708079399; x=1708684199;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GKevrJOYIycMmtJhAGuLF6g1H2Kc16hvAKk7YFtZO5A=;
 b=n6mTrBRsz+hBvIyP/XJ1ZsF0oOoSwkvf+qg8YtHfOKj3gRda+alFsKUPP4E2NN+Z66
 y00OdaMJLJak36sh6+qQlbrxflbdOGvtqh5fJvHAHWpy2ZkKuzH9Szx31nVAkerwyfCd
 lJyls+r0PJXMey9Yc3P20NWc/X47lCw/b5fSn7tpXHl22r0afAbPRwExTGybsfwUCa6F
 6S90RcR+/ikNdYUX4jrSYW1f6yPbv7K2PBHh2j8zslzPNW9Ggq3/u5ZYjsQ1gcTnprnf
 3rIgF017WXP06Z4n+2dFkWG4CUBnZo7iEsf1l+/2dkj1TMInZLWv2C75VGbYzfnjxEBt
 nrIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7lDtM1Peo4eNUzD8iJJsuD/5ExgZB7Q7C1rk6xn5bWNH0w6ir8j2P0QO6vSu3Kf5jhy7rcQgOwPR4FBCahNsKO75k6Qogj/bONAUExFirJLigswIoJDQEZpIBMKT2JR1LEvM6AKvty1Pckwxx+Q==
X-Gm-Message-State: AOJu0YzdXZ5zHnZ4FuyX3MmJd3lqMxd760CLas+DseyXDqcXueB1LF1Q
 RAHd3HHfL4dSacf0U5Sh0rlanaN1nPmUOJsgMr41mmxEZ+tF4uWJ
X-Google-Smtp-Source: AGHT+IGX25jBo8lBEAOfpYHIMUzW49tCJpni1AVlTfEoZVCupl+SQQH/VCfYoINBpYmPXgMDyXyBFg==
X-Received: by 2002:a5d:6190:0:b0:33c:e206:3517 with SMTP id
 j16-20020a5d6190000000b0033ce2063517mr3800297wru.43.1708079398403; 
 Fri, 16 Feb 2024 02:29:58 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 x11-20020adff64b000000b0033d157bb26esm1800611wrp.32.2024.02.16.02.29.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Feb 2024 02:29:57 -0800 (PST)
Message-ID: <446bb875-7849-43b0-bb8e-be706aa3c666@gmail.com>
Date: Fri, 16 Feb 2024 11:29:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amd/display: add panel_power_savings sysfs entry
 to eDP connectors
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Hung <alex.hung@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240202152837.7388-1-hamza.mahfooz@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20240202152837.7388-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.02.24 um 16:28 schrieb Hamza Mahfooz:
> We want programs besides the compositor to be able to enable or disable
> panel power saving features.

Well I don't know the full background, but that is usually a no-go.

> However, since they are currently only
> configurable through DRM properties, that isn't possible.

Maybe I'm repeating others, but I wanted to point it out explicitly: 
This is intentional and not that easily changeable.

If it's a common DRM property, e.g. something standardized among all 
drivers, then amdgpu is not allowed to circumvent that.

Regards,
Christian.

>   So, to remedy
> that issue introduce a new "panel_power_savings" sysfs attribute.
>
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
> v2: hide ABM_LEVEL_IMMEDIATE_DISABLE in the read case, force an atomic
>      commit when setting the value, call sysfs_remove_group() in
>      amdgpu_dm_connector_unregister() and add some documentation.
> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 76 +++++++++++++++++++
>   1 file changed, 76 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 8590c9f1dda6..3c62489d03dc 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6436,10 +6436,79 @@ int amdgpu_dm_connector_atomic_get_property(struct drm_connector *connector,
>   	return ret;
>   }
>   
> +/**
> + * DOC: panel power savings
> + *
> + * The display manager allows you to set your desired **panel power savings**
> + * level (between 0-4, with 0 representing off), e.g. using the following::
> + *
> + *   # echo 3 > /sys/class/drm/card0-eDP-1/amdgpu/panel_power_savings
> + *
> + * Modifying this value can have implications on color accuracy, so tread
> + * carefully.
> + */
> +
> +static ssize_t panel_power_savings_show(struct device *device,
> +					struct device_attribute *attr,
> +					char *buf)
> +{
> +	struct drm_connector *connector = dev_get_drvdata(device);
> +	struct drm_device *dev = connector->dev;
> +	u8 val;
> +
> +	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
> +	val = to_dm_connector_state(connector->state)->abm_level ==
> +		ABM_LEVEL_IMMEDIATE_DISABLE ? 0 :
> +		to_dm_connector_state(connector->state)->abm_level;
> +	drm_modeset_unlock(&dev->mode_config.connection_mutex);
> +
> +	return sysfs_emit(buf, "%u\n", val);
> +}
> +
> +static ssize_t panel_power_savings_store(struct device *device,
> +					 struct device_attribute *attr,
> +					 const char *buf, size_t count)
> +{
> +	struct drm_connector *connector = dev_get_drvdata(device);
> +	struct drm_device *dev = connector->dev;
> +	long val;
> +	int ret;
> +
> +	ret = kstrtol(buf, 0, &val);
> +
> +	if (ret)
> +		return ret;
> +
> +	if (val < 0 || val > 4)
> +		return -EINVAL;
> +
> +	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
> +	to_dm_connector_state(connector->state)->abm_level = val ?:
> +		ABM_LEVEL_IMMEDIATE_DISABLE;
> +	drm_modeset_unlock(&dev->mode_config.connection_mutex);
> +
> +	drm_kms_helper_hotplug_event(dev);
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(panel_power_savings);
> +
> +static struct attribute *amdgpu_attrs[] = {
> +	&dev_attr_panel_power_savings.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group amdgpu_group = {
> +	.name = "amdgpu",
> +	.attrs = amdgpu_attrs
> +};
> +
>   static void amdgpu_dm_connector_unregister(struct drm_connector *connector)
>   {
>   	struct amdgpu_dm_connector *amdgpu_dm_connector = to_amdgpu_dm_connector(connector);
>   
> +	sysfs_remove_group(&connector->kdev->kobj, &amdgpu_group);
>   	drm_dp_aux_unregister(&amdgpu_dm_connector->dm_dp_aux.aux);
>   }
>   
> @@ -6541,6 +6610,13 @@ amdgpu_dm_connector_late_register(struct drm_connector *connector)
>   		to_amdgpu_dm_connector(connector);
>   	int r;
>   
> +	if (connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
> +		r = sysfs_create_group(&connector->kdev->kobj,
> +				       &amdgpu_group);
> +		if (r)
> +			return r;
> +	}
> +
>   	amdgpu_dm_register_backlight_device(amdgpu_dm_connector);
>   
>   	if ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) ||

