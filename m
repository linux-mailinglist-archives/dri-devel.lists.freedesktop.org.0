Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FC8C960E4
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 08:53:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 898D610E2CB;
	Mon,  1 Dec 2025 07:53:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QT5ULolB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B924010E2CB
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 07:53:08 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-297dd95ffe4so33460215ad.3
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Nov 2025 23:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764575588; x=1765180388; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gaVAYubTTHnTVtytpaBYGZFzgOCnLstoEySaefvC3iw=;
 b=QT5ULolB2sRbWWyjKiYyvmorz4jQWhKfIT803yIbdGX7TVLagbPmvgfpDjKlgp3igS
 GDLSpkNcptJjRGuBhCC7xoMWqDSnx0h9M1cfpQh+uh7xrz6yNMZvnCez+R0ytuZvEuyo
 le79PoN/jqnkq/AZjIPgRSs3E1X49Re6rfkDTIfjynj0iTX636E8yTtyLIkm4fiOrT5q
 /BEPyGA+xSkeGPJqjkykNO8wV7oi2eN6C+Gc0g+2UgcrMMXBamvOEnuFfs50PHK9uh9V
 qI7WImo7gT42pG7TXtlsHgHt+ch2MVTitttG1PyRZMqZ7qpuEMOKwxNV6gZbAJvZdZlo
 /b8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764575588; x=1765180388;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gaVAYubTTHnTVtytpaBYGZFzgOCnLstoEySaefvC3iw=;
 b=sD4cxnpdFOeBuNv9UzIg3uUVJ9gNjxMMp/OH0uBDRcSzrx6kFravPUtkQU93yMQMei
 brF+k/xopHmx4/K5zP7e/o9eil0EvlxMXn99owSIrPAosUDKd8rrwIcK1D6rJJ/AfB5L
 usayi/Mj2L+Kzfpgb37HOBKLkaUP8epGfKyxyIk8g1/VewlnQ+cOmRBoEcmbJxNRv3zI
 dbWGPnlgBTXFs0y921dlCPwnlRpQv+MHoMaytw8OE2BihxsMtJf1h9zx67My3z5UMAas
 GAsaKjRAyyp/G3INGObQSa/bBksjCFsBI75MA11cou2eR22Bziyid3mJ9jwnudy2nOmq
 t6zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSFYv9PT4uQsAIabgRh/I0ycvKjMy6ni0PGt2/Y5BMldkTJNB/xAXt9xneEymTotliTjmHr6xPVkE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPbiukeXQRvny5Xdh514cXT/dFIG1192MlF4C4fUort9X3rSfg
 7f3xW03RN7lPy3Hu2xtFCRt1I+NPoSMMRrAXcaxpwkIQ7M44tSOflLaV
X-Gm-Gg: ASbGncsHstxyNvs4nYDjHgistkz8ntzyR+Pg+tNdSxUq/gM5EtwaY9GqOFk8EQ+XEjM
 7Gmxd7qWsNKlUQOfgSe25vGXc24mp7bJqp77xm/d3o6KkTF/3fySs4CKbg6L/V6GneXhlVh0dSY
 JYHjQlmx2vxprwUpFwbFyS9ZUvlBmzMk9u1aRvTYULuWEDxNEoBIqlsQhRPKmgCnPM3KatEyINJ
 jVpPxtEYLgB0+MmjvQDAeNaFo73AQHSsM0RDoJaBllbz/jph+dB5OP3SnaHshd637PL2RPM2tdg
 4knKduf1rTYOnC02Oixd9iziJirMlmXjB/IAXps4uytDYcd1jaz3KBysdDVZAc3rA2srLVWw9SD
 mHSnuLFrqEUzuLTE4rwpy5n3XviTPJ5JI2OKbKvoISRhHGvqWV/hOv3vCFOunAvKxwm2/RHx2cJ
 hYSG+3xPg01k81ENoRSC+T
X-Google-Smtp-Source: AGHT+IGlmCeUIpwU3Ydo+tzqNkpFv3NHVIjiD567+Cj+5rL592Tgy7C6Ht+ABzfU61uvmKPtq3k2Rw==
X-Received: by 2002:a17:902:d583:b0:288:5d07:8a8f with SMTP id
 d9443c01a7336-29baafb7ec1mr273010985ad.24.1764575588133; 
 Sun, 30 Nov 2025 23:53:08 -0800 (PST)
Received: from google.com ([2401:fa00:95:201:2a71:e28f:ae3c:b20c])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29bce44389bsm115488825ad.32.2025.11.30.23.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Nov 2025 23:53:07 -0800 (PST)
Date: Mon, 1 Dec 2025 15:53:03 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, "Tsao, Anson" <anson.tsao@amd.com>,
 "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
Subject: Re: [PATCH v3 4/5] drm/amdgpu: add UMA allocation interfaces to sysfs
Message-ID: <aS1JX1VNNJFb9T60@google.com>
References: <20251126-vram-carveout-tuning-for-upstream-v3-0-cf1729c4cb3c@amd.com>
 <20251126-vram-carveout-tuning-for-upstream-v3-4-cf1729c4cb3c@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-vram-carveout-tuning-for-upstream-v3-4-cf1729c4cb3c@amd.com>
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

Hi Leo and Mario,

On Wed, Nov 26, 2025 at 05:05:15PM +0800, Yo-Jung Leo Lin (AMD) wrote:
> Add a uma/ directory containing two sysfs files as interfaces to
> inspect or change UMA carveout size. These files are:
> 
> - uma/carveout_options: a read-only file listing all the available
>   UMA allocation options and their index.
> 
> - uma/carveout: a file that is both readable and writable. On read,
>   it shows the index of the current setting. Writing a valid index
>   into this file allows users to change the UMA carveout size to that
>   option on the next boot.
> 
> Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 137 +++++++++++++++++++++++++++++++
>  1 file changed, 137 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> index bce9027fa241..c3b7b8c91919 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -30,6 +30,7 @@
>  #include <linux/power_supply.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/suspend.h>
> +#include <linux/device.h>
>  #include <acpi/video.h>
>  #include <acpi/actbl.h>
>  
> @@ -1246,6 +1247,135 @@ int amdgpu_acpi_get_mem_info(struct amdgpu_device *adev, int xcc_id,
>  	return -ENOENT;
>  }
>  
> +static ssize_t carveout_options_show(struct device *dev,
> +				     struct device_attribute *attr,
> +				     char *buf)
> +{
> +	struct amdgpu_uma_carveout_info *uma_info = &amdgpu_acpi_priv.atcs.uma_info;
> +	uint32_t memory_carved;
> +	ssize_t size = 0;
> +
> +	if (!uma_info || !uma_info->num_entries)
> +		return -ENODEV;
> +
> +	for (int i = 0; i < uma_info->num_entries; i++) {
> +		memory_carved = uma_info->entries[i].memory_carved_mb;
> +		if (memory_carved >= SZ_1G/SZ_1M) {
> +			size += sysfs_emit_at(buf, size, "%d: %s (%u GB)\n",
> +					      i,
> +					      uma_info->entries[i].name,
> +					      memory_carved >> 10);
> +		} else {
> +			size += sysfs_emit_at(buf, size, "%d: %s (%u MB)\n",
> +					      i,
> +					      uma_info->entries[i].name,
> +					      memory_carved);
> +		}
> +	}
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RO(carveout_options);
> +
> +static ssize_t carveout_show(struct device *dev,
> +			     struct device_attribute *attr,
> +			     char *buf)
> +{
> +	return sysfs_emit(buf, "%u\n", amdgpu_acpi_priv.atcs.uma_info.uma_option_index);
> +}
> +
> +static ssize_t carveout_store(struct device *dev,
> +			      struct device_attribute *attr,
> +			      const char *buf, size_t count)
> +{
> +	struct amdgpu_uma_carveout_info *uma_info = &amdgpu_acpi_priv.atcs.uma_info;
> +	struct drm_device *ddev = dev_get_drvdata(dev);
> +	struct amdgpu_device *adev = drm_to_adev(ddev);
> +	struct amdgpu_uma_carveout_option *opt;
> +	unsigned long val;
> +	uint8_t flags;
> +	int r;
> +
> +	r = kstrtoul(buf, 10, &val);
> +	if (r)
> +		return r;
> +
> +	if (val >= uma_info->num_entries)
> +		return -EINVAL;
> +
> +	opt = &uma_info->entries[val];
> +
> +	if (!(opt->flags & AMDGPU_UMA_FLAG_AUTO) &&
> +	    !(opt->flags & AMDGPU_UMA_FLAG_CUSTOM)) {
> +		drm_err_once(ddev, "Option %ul not supported due to lack of Custom/Auto flag", r);

I'm not an expert in drm or gpu related stuff.
But r is always 0 here. Also, its type is int, so it doesn't match the
%ul format specifier.

I guess you mean val instead of r here?

Regards,
Kuan-Wei

> +		return -EINVAL;
> +	}
> +
> +	flags = opt->flags;
> +	flags &= ~((flags & AMDGPU_UMA_FLAG_AUTO) >> 1);
> +
> +	guard(mutex)(&uma_info->update_lock);
> +
> +	r = amdgpu_acpi_set_uma_allocation_size(adev, val, flags);
> +	if (r)
> +		return r;
> +
> +	uma_info->uma_option_index = val;
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(carveout);
> +
> +static struct attribute *amdgpu_uma_attrs[] = {
> +	&dev_attr_carveout.attr,
> +	&dev_attr_carveout_options.attr,
> +	NULL
> +};
> +
> +const struct attribute_group amdgpu_uma_attr_group = {
> +	.name = "uma",
> +	.attrs = amdgpu_uma_attrs
> +};
> +
> +static int amdgpu_acpi_uma_option_init(struct amdgpu_device *adev)
> +{
> +	struct amdgpu_atcs *atcs = &amdgpu_acpi_priv.atcs;
> +	int rc;
> +
> +	if (!atcs->functions.set_uma_allocation_size)
> +		return -ENODEV;
> +
> +	rc = amdgpu_atomfirmware_get_uma_carveout_info(adev, &atcs->uma_info);
> +	if (rc) {
> +		drm_dbg(adev_to_drm(adev),
> +			"Failed to parse UMA carveout info from VBIOS: %d\n", rc);
> +		goto out_info;
> +	}
> +
> +	mutex_init(&atcs->uma_info.update_lock);
> +
> +	rc = devm_device_add_group(adev->dev, &amdgpu_uma_attr_group);
> +	if (rc) {
> +		drm_dbg(adev_to_drm(adev), "Failed to add UMA carveout sysfs interfaces %d\n", rc);
> +		goto out_attr;
> +	}
> +
> +	return 0;
> +
> +out_attr:
> +	mutex_destroy(&atcs->uma_info.update_lock);
> +out_info:
> +	return rc;
> +}
> +
> +static void amdgpu_acpi_uma_option_fini(void)
> +{
> +	struct amdgpu_uma_carveout_info *uma_info = &amdgpu_acpi_priv.atcs.uma_info;
> +
> +	mutex_destroy(&uma_info->update_lock);
> +	uma_info->num_entries = 0;
> +}
> +
>  /**
>   * amdgpu_acpi_event - handle notify events
>   *
> @@ -1290,6 +1420,12 @@ static int amdgpu_acpi_event(struct notifier_block *nb,
>  int amdgpu_acpi_init(struct amdgpu_device *adev)
>  {
>  	struct amdgpu_atif *atif = &amdgpu_acpi_priv.atif;
> +	int rc;
> +
> +	rc = amdgpu_acpi_uma_option_init(adev);
> +
> +	if (rc)
> +		drm_dbg(adev_to_drm(adev), "Not creating uma carveout interfaces: %d", rc);
>  
>  	if (atif->notifications.brightness_change) {
>  		if (adev->dc_enabled) {
> @@ -1342,6 +1478,7 @@ void amdgpu_acpi_get_backlight_caps(struct amdgpu_dm_backlight_caps *caps)
>  void amdgpu_acpi_fini(struct amdgpu_device *adev)
>  {
>  	unregister_acpi_notifier(&adev->acpi_nb);
> +	amdgpu_acpi_uma_option_fini();
>  }
>  
>  /**
> 
> -- 
> 2.43.0
> 
> 
