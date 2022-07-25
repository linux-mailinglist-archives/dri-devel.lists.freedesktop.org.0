Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 006EB57FF78
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 15:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98DE8B1256;
	Mon, 25 Jul 2022 13:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11FEFB1253;
 Mon, 25 Jul 2022 13:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N7Synj+43Lb9XGAY2lPlsCW5JSyfYxg69C5766rFdTU=; b=pp15XohnvO0H0/QJ0VRAOyfWPQ
 mss2IkH2e/etdFzrRCH4ODhT9iYr3voBLDtcnqk/D5pGsQ+hEuEErYiq3ORxh9+G75Nns1GQuoDi2
 huper1UCCLzUPfWDXUr3PIkVqZqNjO8PGDw8K2v7bq6ZyZ/HTU/L/xpeYlJDnDm/CRIcPZyp6ehHL
 Ync5uhvqLeAkg10UKv60642yiNA0ucl4/6nbRkyI3Wum53L03Ap8WmYF7Ty3NKlzzAVnX3oNfJDxs
 GNZo+FNeN7eFloDFYD4y/RJlHvnB1VL16j8kOyYzRqYhR6oEIeJjBrzz3nxHJ4+65VMMw1NsjWZWP
 qxwZnIyQ==;
Received: from 201-13-50-220.dsl.telesp.net.br ([201.13.50.220]
 helo=[192.168.15.109]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1oFxl9-005tVi-8y; Mon, 25 Jul 2022 15:04:31 +0200
Message-ID: <3349b8b2-1475-e1c3-b3e8-8504e49783e4@igalia.com>
Date: Mon, 25 Jul 2022 10:04:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/4] drm/amd: Add detailed GFXOFF stats to debugfs
Content-Language: en-US
To: "Quan, Evan" <Evan.Quan@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>, "Xiao, Jack" <Jack.Xiao@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "StDenis, Tom" <Tom.StDenis@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>
References: <20220722203347.70176-1-andrealmeid@igalia.com>
 <20220722203347.70176-2-andrealmeid@igalia.com>
 <DM6PR12MB26194D127DE749D0E8A37629E4959@DM6PR12MB2619.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <DM6PR12MB26194D127DE749D0E8A37629E4959@DM6PR12MB2619.namprd12.prod.outlook.com>
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
Cc: "kernel-dev@igalia.com" <kernel-dev@igalia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Às 07:27 de 25/07/22, Quan, Evan escreveu:
> [AMD Official Use Only - General]
> 
> Using "uint64_t" instead of "uint32_t" for entry counter may be better.
> 

Indeed, it's a good idea. I'll send a v2 with that change, thanks.

> BR
> Evan
>> -----Original Message-----
>> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
>> André Almeida
>> Sent: Saturday, July 23, 2022 4:34 AM
>> To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
>> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David
>> Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Zhang, Hawking
>> <Hawking.Zhang@amd.com>; Zhou1, Tao <Tao.Zhou1@amd.com>; Kuehling,
>> Felix <Felix.Kuehling@amd.com>; Xiao, Jack <Jack.Xiao@amd.com>; amd-
>> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
>> kernel@vger.kernel.org; StDenis, Tom <Tom.StDenis@amd.com>; Siqueira,
>> Rodrigo <Rodrigo.Siqueira@amd.com>
>> Cc: André Almeida <andrealmeid@igalia.com>; kernel-dev@igalia.com
>> Subject: [PATCH 1/4] drm/amd: Add detailed GFXOFF stats to debugfs
>>
>> Add debugfs interface to log GFXOFF statistics:
>>
>> - Read amdgpu_gfxoff_count to get the total GFXOFF entry count at the
>>   time of query since system power-up
>>
>> - Write 1 to amdgpu_gfxoff_residency to start logging, and 0 to stop.
>>   Read it to get average GFXOFF residency % multiplied by 100
>>   during the last logging interval.
>>
>> Both features are designed to be keep the values persistent between
>> suspends.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   | 168
>> ++++++++++++++++++
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   2 +
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c       |  39 ++++
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h       |   6 +
>>  drivers/gpu/drm/amd/pm/amdgpu_dpm.c           |  45 +++++
>>  drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h       |   3 +
>>  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     |  34 +++-
>>  drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  22 +++
>>  drivers/gpu/drm/amd/pm/swsmu/smu_internal.h   |   3 +
>>  9 files changed, 321 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>> index e2eec985adb3..edf90a9ba980 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>> @@ -1042,6 +1042,157 @@ static ssize_t amdgpu_debugfs_gpr_read(struct
>> file *f, char __user *buf,
>>  	return r;
>>  }
>>
>> +/**
>> + * amdgpu_debugfs_gfxoff_residency_read - Read GFXOFF residency
>> + *
>> + * @f: open file handle
>> + * @buf: User buffer to store read data in
>> + * @size: Number of bytes to read
>> + * @pos:  Offset to seek to
>> + *
>> + * Read the last residency value logged. It doesn't auto update, one needs
>> to
>> + * stop logging before getting the current value.
>> + */
>> +static ssize_t amdgpu_debugfs_gfxoff_residency_read(struct file *f, char
>> __user *buf,
>> +						    size_t size, loff_t *pos)
>> +{
>> +	struct amdgpu_device *adev = file_inode(f)->i_private;
>> +	ssize_t result = 0;
>> +	int r;
>> +
>> +	if (size & 0x3 || *pos & 0x3)
>> +		return -EINVAL;
>> +
>> +	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
>> +	if (r < 0) {
>> +		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>> +		return r;
>> +	}
>> +
>> +	while (size) {
>> +		uint32_t value;
>> +
>> +		r = amdgpu_get_gfx_off_residency(adev, &value);
>> +		if (r)
>> +			goto out;
>> +
>> +		r = put_user(value, (uint32_t *)buf);
>> +		if (r)
>> +			goto out;
>> +
>> +		result += 4;
>> +		buf += 4;
>> +		*pos += 4;
>> +		size -= 4;
>> +	}
>> +
>> +	r = result;
>> +out:
>> +	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>> +	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>> +
>> +	return r;
>> +}
>> +
>> +/**
>> + * amdgpu_debugfs_gfxoff_residency_write - Log GFXOFF Residency
>> + *
>> + * @f: open file handle
>> + * @buf: User buffer to write data from
>> + * @size: Number of bytes to write
>> + * @pos:  Offset to seek to
>> + *
>> + * Write a 32-bit non-zero to start logging; write a 32-bit zero to stop
>> + */
>> +static ssize_t amdgpu_debugfs_gfxoff_residency_write(struct file *f, const
>> char __user *buf,
>> +						     size_t size, loff_t *pos)
>> +{
>> +	struct amdgpu_device *adev = file_inode(f)->i_private;
>> +	ssize_t result = 0;
>> +	int r;
>> +
>> +	if (size & 0x3 || *pos & 0x3)
>> +		return -EINVAL;
>> +
>> +	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
>> +	if (r < 0) {
>> +		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>> +		return r;
>> +	}
>> +
>> +	while (size) {
>> +		u32 value;
>> +
>> +		r = get_user(value, (uint32_t *)buf);
>> +		if (r)
>> +			goto out;
>> +
>> +		amdgpu_set_gfx_off_residency(adev, value ? true : false);
>> +
>> +		result += 4;
>> +		buf += 4;
>> +		*pos += 4;
>> +		size -= 4;
>> +	}
>> +
>> +	r = result;
>> +out:
>> +	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>> +	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>> +
>> +	return r;
>> +}
>> +
>> +
>> +/**
>> + * amdgpu_debugfs_gfxoff_count_read - Read GFXOFF entry count
>> + *
>> + * @f: open file handle
>> + * @buf: User buffer to store read data in
>> + * @size: Number of bytes to read
>> + * @pos:  Offset to seek to
>> + */
>> +static ssize_t amdgpu_debugfs_gfxoff_count_read(struct file *f, char
>> __user *buf,
>> +						size_t size, loff_t *pos)
>> +{
>> +	struct amdgpu_device *adev = file_inode(f)->i_private;
>> +	ssize_t result = 0;
>> +	int r;
>> +
>> +	if (size & 0x3 || *pos & 0x3)
>> +		return -EINVAL;
>> +
>> +	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
>> +	if (r < 0) {
>> +		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>> +		return r;
>> +	}
>> +
>> +	while (size) {
>> +		u32 value;
>> +
>> +		r = amdgpu_get_gfx_off_entrycount(adev, &value);
>> +		if (r)
>> +			goto out;
>> +
>> +		r = put_user(value, (uint32_t *)buf);
>> +		if (r)
>> +			goto out;
>> +
>> +		result += 4;
>> +		buf += 4;
>> +		*pos += 4;
>> +		size -= 4;
>> +	}
>> +
>> +	r = result;
>> +out:
>> +	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>> +	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>> +
>> +	return r;
>> +}
>> +
>>  /**
>>   * amdgpu_debugfs_gfxoff_write - Enable/disable GFXOFF
>>   *
>> @@ -1249,6 +1400,19 @@ static const struct file_operations
>> amdgpu_debugfs_gfxoff_status_fops = {
>>  	.llseek = default_llseek
>>  };
>>
>> +static const struct file_operations amdgpu_debugfs_gfxoff_count_fops = {
>> +	.owner = THIS_MODULE,
>> +	.read = amdgpu_debugfs_gfxoff_count_read,
>> +	.llseek = default_llseek
>> +};
>> +
>> +static const struct file_operations amdgpu_debugfs_gfxoff_residency_fops
>> = {
>> +	.owner = THIS_MODULE,
>> +	.read = amdgpu_debugfs_gfxoff_residency_read,
>> +	.write = amdgpu_debugfs_gfxoff_residency_write,
>> +	.llseek = default_llseek
>> +};
>> +
>>  static const struct file_operations *debugfs_regs[] = {
>>  	&amdgpu_debugfs_regs_fops,
>>  	&amdgpu_debugfs_regs2_fops,
>> @@ -1261,6 +1425,8 @@ static const struct file_operations *debugfs_regs[]
>> = {
>>  	&amdgpu_debugfs_gpr_fops,
>>  	&amdgpu_debugfs_gfxoff_fops,
>>  	&amdgpu_debugfs_gfxoff_status_fops,
>> +	&amdgpu_debugfs_gfxoff_count_fops,
>> +	&amdgpu_debugfs_gfxoff_residency_fops,
>>  };
>>
>>  static const char *debugfs_regs_names[] = {
>> @@ -1275,6 +1441,8 @@ static const char *debugfs_regs_names[] = {
>>  	"amdgpu_gpr",
>>  	"amdgpu_gfxoff",
>>  	"amdgpu_gfxoff_status",
>> +	"amdgpu_gfxoff_count",
>> +	"amdgpu_gfxoff_residency",
>>  };
>>
>>  /**
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index b79ee4ffb879..15a95bc2c211 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -3576,6 +3576,8 @@ int amdgpu_device_init(struct amdgpu_device
>> *adev,
>>  	INIT_WORK(&adev->xgmi_reset_work,
>> amdgpu_device_xgmi_reset_func);
>>
>>  	adev->gfx.gfx_off_req_count = 1;
>> +	adev->gfx.gfx_off_residency = 0;
>> +	adev->gfx.gfx_off_entrycount = 0;
>>  	adev->pm.ac_power = power_supply_is_system_supplied() > 0;
>>
>>  	atomic_set(&adev->throttling_logging_enabled, 1);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>> index 222d3d7ea076..3675c1b899db 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>> @@ -610,6 +610,45 @@ void amdgpu_gfx_off_ctrl(struct amdgpu_device
>> *adev, bool enable)
>>  	mutex_unlock(&adev->gfx.gfx_off_mutex);
>>  }
>>
>> +int amdgpu_set_gfx_off_residency(struct amdgpu_device *adev, bool
>> value)
>> +{
>> +	int r = 0;
>> +
>> +	mutex_lock(&adev->gfx.gfx_off_mutex);
>> +
>> +	r = amdgpu_dpm_set_residency_gfxoff(adev, value);
>> +
>> +	mutex_unlock(&adev->gfx.gfx_off_mutex);
>> +
>> +	return r;
>> +}
>> +
>> +int amdgpu_get_gfx_off_residency(struct amdgpu_device *adev, u32
>> *value)
>> +{
>> +	int r = 0;
>> +
>> +	mutex_lock(&adev->gfx.gfx_off_mutex);
>> +
>> +	r = amdgpu_dpm_get_residency_gfxoff(adev, value);
>> +
>> +	mutex_unlock(&adev->gfx.gfx_off_mutex);
>> +
>> +	return r;
>> +}
>> +
>> +int amdgpu_get_gfx_off_entrycount(struct amdgpu_device *adev, u32
>> *value)
>> +{
>> +	int r = 0;
>> +
>> +	mutex_lock(&adev->gfx.gfx_off_mutex);
>> +
>> +	r = amdgpu_dpm_get_entrycount_gfxoff(adev, value);
>> +
>> +	mutex_unlock(&adev->gfx.gfx_off_mutex);
>> +
>> +	return r;
>> +}
>> +
>>  int amdgpu_get_gfx_off_status(struct amdgpu_device *adev, uint32_t
>> *value)
>>  {
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
>> index 23a696d38390..f06e979e2565 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
>> @@ -336,6 +336,8 @@ struct amdgpu_gfx {
>>  	struct mutex                    gfx_off_mutex;
>>  	uint32_t                        gfx_off_req_count; /* default 1, enable gfx off:
>> dec 1, disable gfx off: add 1 */
>>  	struct delayed_work             gfx_off_delay_work;
>> +	uint32_t                        gfx_off_residency;
>> +	uint32_t                        gfx_off_entrycount;
>>
>>  	/* pipe reservation */
>>  	struct mutex			pipe_reserve_mutex;
>> @@ -407,6 +409,10 @@ bool amdgpu_gfx_is_me_queue_enabled(struct
>> amdgpu_device *adev, int me,
>>  void amdgpu_gfx_off_ctrl(struct amdgpu_device *adev, bool enable);
>>  int amdgpu_get_gfx_off_status(struct amdgpu_device *adev, uint32_t
>> *value);
>>  int amdgpu_gfx_ras_late_init(struct amdgpu_device *adev, struct
>> ras_common_if *ras_block);
>> +void amdgpu_gfx_ras_fini(struct amdgpu_device *adev);
>> +int amdgpu_get_gfx_off_entrycount(struct amdgpu_device *adev, u32
>> *value);
>> +int amdgpu_get_gfx_off_residency(struct amdgpu_device *adev, u32
>> *residency);
>> +int amdgpu_set_gfx_off_residency(struct amdgpu_device *adev, bool
>> value);
>>  int amdgpu_gfx_process_ras_data_cb(struct amdgpu_device *adev,
>>  		void *err_data,
>>  		struct amdgpu_iv_entry *entry);
>> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
>> b/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
>> index 956b6ce81c84..df87d0768fd7 100644
>> --- a/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
>> +++ b/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
>> @@ -668,6 +668,51 @@ int amdgpu_dpm_wait_for_event(struct
>> amdgpu_device *adev,
>>  	return ret;
>>  }
>>
>> +int amdgpu_dpm_set_residency_gfxoff(struct amdgpu_device *adev, bool
>> value)
>> +{
>> +	struct smu_context *smu = adev->powerplay.pp_handle;
>> +	int ret = 0;
>> +
>> +	if (!is_support_sw_smu(adev))
>> +		return -EOPNOTSUPP;
>> +
>> +	mutex_lock(&adev->pm.mutex);
>> +	ret = smu_set_residency_gfxoff(smu, value);
>> +	mutex_unlock(&adev->pm.mutex);
>> +
>> +	return ret;
>> +}
>> +
>> +int amdgpu_dpm_get_residency_gfxoff(struct amdgpu_device *adev, u32
>> *value)
>> +{
>> +	struct smu_context *smu = adev->powerplay.pp_handle;
>> +	int ret = 0;
>> +
>> +	if (!is_support_sw_smu(adev))
>> +		return -EOPNOTSUPP;
>> +
>> +	mutex_lock(&adev->pm.mutex);
>> +	ret = smu_get_residency_gfxoff(smu, value);
>> +	mutex_unlock(&adev->pm.mutex);
>> +
>> +	return ret;
>> +}
>> +
>> +int amdgpu_dpm_get_entrycount_gfxoff(struct amdgpu_device *adev,
>> u32 *value)
>> +{
>> +	struct smu_context *smu = adev->powerplay.pp_handle;
>> +	int ret = 0;
>> +
>> +	if (!is_support_sw_smu(adev))
>> +		return -EOPNOTSUPP;
>> +
>> +	mutex_lock(&adev->pm.mutex);
>> +	ret = smu_get_entrycount_gfxoff(smu, value);
>> +	mutex_unlock(&adev->pm.mutex);
>> +
>> +	return ret;
>> +}
>> +
>>  int amdgpu_dpm_get_status_gfxoff(struct amdgpu_device *adev, uint32_t
>> *value)
>>  {
>>  	struct smu_context *smu = adev->powerplay.pp_handle;
>> diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
>> b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
>> index 65624d091ed2..83a83e93037c 100644
>> --- a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
>> +++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
>> @@ -435,6 +435,9 @@ int amdgpu_dpm_set_soft_freq_range(struct
>> amdgpu_device *adev,
>>  int amdgpu_dpm_write_watermarks_table(struct amdgpu_device *adev);
>>  int amdgpu_dpm_wait_for_event(struct amdgpu_device *adev, enum
>> smu_event_type event,
>>  		       uint64_t event_arg);
>> +int amdgpu_dpm_get_residency_gfxoff(struct amdgpu_device *adev, u32
>> *value);
>> +int amdgpu_dpm_set_residency_gfxoff(struct amdgpu_device *adev, bool
>> value);
>> +int amdgpu_dpm_get_entrycount_gfxoff(struct amdgpu_device *adev,
>> u32 *value);
>>  int amdgpu_dpm_get_status_gfxoff(struct amdgpu_device *adev, uint32_t
>> *value);
>>  uint64_t amdgpu_dpm_get_thermal_throttling_counter(struct
>> amdgpu_device *adev);
>>  void amdgpu_dpm_gfx_state_change(struct amdgpu_device *adev,
>> diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
>> b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
>> index fd79b213fab4..cfc3b9d749bf 100644
>> --- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
>> +++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
>> @@ -90,6 +90,30 @@ static int smu_sys_set_pp_feature_mask(void *handle,
>>  	return smu_set_pp_feature_mask(smu, new_mask);
>>  }
>>
>> +int smu_set_residency_gfxoff(struct smu_context *smu, bool value)
>> +{
>> +	if (!smu->ppt_funcs->set_gfx_off_residency)
>> +		return -EINVAL;
>> +
>> +	return smu_set_gfx_off_residency(smu, value);
>> +}
>> +
>> +int smu_get_residency_gfxoff(struct smu_context *smu, u32 *value)
>> +{
>> +	if (!smu->ppt_funcs->get_gfx_off_residency)
>> +		return -EINVAL;
>> +
>> +	return smu_get_gfx_off_residency(smu, value);
>> +}
>> +
>> +int smu_get_entrycount_gfxoff(struct smu_context *smu, u32 *value)
>> +{
>> +	if (!smu->ppt_funcs->get_gfx_off_entrycount)
>> +		return -EINVAL;
>> +
>> +	return smu_get_gfx_off_entrycount(smu, value);
>> +}
>> +
>>  int smu_get_status_gfxoff(struct smu_context *smu, uint32_t *value)
>>  {
>>  	if (!smu->ppt_funcs->get_gfx_off_status)
>> @@ -1573,7 +1597,7 @@ static int smu_suspend(void *handle)
>>  {
>>  	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>  	struct smu_context *smu = adev->powerplay.pp_handle;
>> -	int ret;
>> +	int ret, count;
>>
>>  	if (amdgpu_sriov_vf(adev)&& !amdgpu_sriov_is_pp_one_vf(adev))
>>  		return 0;
>> @@ -1591,6 +1615,14 @@ static int smu_suspend(void *handle)
>>
>>  	smu_set_gfx_cgpg(smu, false);
>>
>> +	/*
>> +	 * pwfw resets entrycount when device is suspended, so we save
>> the
>> +	 * last value to be used when we resume to keep it consistent
>> +	 */
>> +	ret = smu_get_entrycount_gfxoff(smu, &count);
>> +	if (!ret)
>> +		adev->gfx.gfx_off_entrycount = count;
>> +
>>  	return 0;
>>  }
>>
>> diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
>> b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
>> index b81c657c7386..9827075b768e 100644
>> --- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
>> +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
>> @@ -1111,6 +1111,22 @@ struct pptable_funcs {
>>  	 */
>>  	uint32_t (*get_gfx_off_status)(struct smu_context *smu);
>>
>> +	/**
>> +	 * @gfx_off_entrycount: total GFXOFF entry count at the time of
>> +	 * query since system power-up
>> +	 */
>> +	u32 (*get_gfx_off_entrycount)(struct smu_context *smu, uint32_t
>> *entrycount);
>> +
>> +	/**
>> +	 * @set_gfx_off_residency: set 1 to start logging, 0 to stop logging
>> +	 */
>> +	u32 (*set_gfx_off_residency)(struct smu_context *smu, bool start);
>> +
>> +	/**
>> +	 * @get_gfx_off_residency: Average GFXOFF residency % during the
>> logging interval
>> +	 */
>> +	u32 (*get_gfx_off_residency)(struct smu_context *smu, uint32_t
>> *residency);
>> +
>>  	/**
>>  	 * @register_irq_handler: Register interupt request handlers.
>>  	 */
>> @@ -1454,6 +1470,12 @@ int smu_set_ac_dc(struct smu_context *smu);
>>
>>  int smu_allow_xgmi_power_down(struct smu_context *smu, bool en);
>>
>> +int smu_get_entrycount_gfxoff(struct smu_context *smu, u32 *value);
>> +
>> +int smu_get_residency_gfxoff(struct smu_context *smu, u32 *value);
>> +
>> +int smu_set_residency_gfxoff(struct smu_context *smu, bool value);
>> +
>>  int smu_get_status_gfxoff(struct smu_context *smu, uint32_t *value);
>>
>>  int smu_handle_passthrough_sbr(struct smu_context *smu, bool enable);
>> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h
>> b/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h
>> index 7469bbfce1fb..ceb13c838067 100644
>> --- a/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h
>> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h
>> @@ -47,6 +47,9 @@
>>  #define smu_notify_memory_pool_location(smu)
>> 	smu_ppt_funcs(notify_memory_pool_location, 0, smu)
>>  #define smu_gfx_off_control(smu, enable)
>> 	smu_ppt_funcs(gfx_off_control, 0, smu, enable)
>>  #define smu_get_gfx_off_status(smu)
>> 		smu_ppt_funcs(get_gfx_off_status, 0, smu)
>> +#define smu_get_gfx_off_entrycount(smu, value)
>> 			smu_ppt_funcs(get_gfx_off_entrycount, 0, smu,
>> value)
>> +#define smu_get_gfx_off_residency(smu, value)
>> 			smu_ppt_funcs(get_gfx_off_residency, 0, smu,
>> value)
>> +#define smu_set_gfx_off_residency(smu, value)
>> 			smu_ppt_funcs(set_gfx_off_residency, 0, smu,
>> value)
>>  #define smu_set_last_dcef_min_deep_sleep_clk(smu)
>> 	smu_ppt_funcs(set_last_dcef_min_deep_sleep_clk, 0, smu)
>>  #define smu_system_features_control(smu, en)
>> 	smu_ppt_funcs(system_features_control, 0, smu, en)
>>  #define smu_init_max_sustainable_clocks(smu)
>> 	smu_ppt_funcs(init_max_sustainable_clocks, 0, smu)
>> --
>> 2.37.1
