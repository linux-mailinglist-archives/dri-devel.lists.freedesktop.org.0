Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 666BA74AB9B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 09:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892B910E511;
	Fri,  7 Jul 2023 07:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F8910E50B
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 07:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688713831; x=1720249831;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sa3q5rMpkrDSRTxr4a/vbwrNQJi0BDKB4dQ8vw//x2A=;
 b=kyhwFOXLhqVFyQApfbTWmaUTTz+JBd4iWaxvnBHnD85LVtncupOr2EbM
 VfN1YTr9GXoNiMKoEbPCP84TMb2rrE/DQi0BY+MjR2pr4LNMNdtYWrmVo
 ZS02TM1ipREsd8kRtvb/6am78R2/bex/6isp7HsSWt1u6nf4v6NLoFriF
 t8LpMuO6+Oj7YvQFvTs8+NPTywQVwUYn4d8VfUu2ArrLNwxkElNFd0+N5
 FF6/AWasOmiCC5vHa6SrxT2werOiUmkTb2M32or6GjOXokbj/bLGFcwUX
 0Lt2JwpajsgLdKQMjHBSvHvRI26/K3dSyd8K6nPjGW+olrQ0s9jzXA5PY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="427506838"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="427506838"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 00:10:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="789849132"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="789849132"
Received: from apaszkie-mobl1.ger.corp.intel.com (HELO [10.249.151.57])
 ([10.249.151.57])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 00:10:27 -0700
Message-ID: <a1d2cd0b-57ee-2156-60e8-6978b0aecbe3@linux.intel.com>
Date: Fri, 7 Jul 2023 09:10:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/5] accel/ivpu: Add debugfs files for testing device reset
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230524074847.866711-1-stanislaw.gruszka@linux.intel.com>
 <20230524074847.866711-4-stanislaw.gruszka@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230524074847.866711-4-stanislaw.gruszka@linux.intel.com>
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
> Add new debugfs files to validate device recovery functionality.
> 
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_debugfs.c | 41 +++++++++++++++++++++++++++++++
>  drivers/accel/ivpu/ivpu_pm.c      |  1 +
>  drivers/accel/ivpu/ivpu_pm.h      |  1 +
>  3 files changed, 43 insertions(+)
> 
> diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
> index a9180fae43b6..e2502d2b53c0 100644
> --- a/drivers/accel/ivpu/ivpu_debugfs.c
> +++ b/drivers/accel/ivpu/ivpu_debugfs.c
> @@ -77,11 +77,31 @@ static int last_bootmode_show(struct seq_file *s, void *v)
>  	return 0;
>  }
>  
> +static int reset_counter_show(struct seq_file *s, void *v)
> +{
> +	struct drm_info_node *node = (struct drm_info_node *)s->private;
> +	struct ivpu_device *vdev = to_ivpu_device(node->minor->dev);
> +
> +	seq_printf(s, "%d\n", atomic_read(&vdev->pm->reset_counter));
> +	return 0;
> +}
> +
> +static int reset_pending_show(struct seq_file *s, void *v)
> +{
> +	struct drm_info_node *node = (struct drm_info_node *)s->private;
> +	struct ivpu_device *vdev = to_ivpu_device(node->minor->dev);
> +
> +	seq_printf(s, "%d\n", atomic_read(&vdev->pm->in_reset));
> +	return 0;
> +}
> +
>  static const struct drm_info_list vdev_debugfs_list[] = {
>  	{"bo_list", bo_list_show, 0},
>  	{"fw_trace_capability", fw_trace_capability_show, 0},
>  	{"fw_trace_config", fw_trace_config_show, 0},
>  	{"last_bootmode", last_bootmode_show, 0},
> +	{"reset_counter", reset_counter_show, 0},
> +	{"reset_pending", reset_pending_show, 0},
>  };
>  
>  static int fw_log_show(struct seq_file *s, void *v)
> @@ -216,6 +236,24 @@ ivpu_reset_engine_fn(struct file *file, const char __user *user_buf, size_t size
>  	return size;
>  }
>  
> +static ssize_t
> +ivpu_force_recovery_fn(struct file *file, const char __user *user_buf, size_t size, loff_t *pos)
> +{
> +	struct ivpu_device *vdev = file->private_data;
> +
> +	if (!size)
> +		return -EINVAL;
> +
> +	ivpu_pm_schedule_recovery(vdev);
> +	return size;
> +}
> +
> +static const struct file_operations ivpu_force_recovery_fops = {
> +	.owner = THIS_MODULE,
> +	.open = simple_open,
> +	.write = ivpu_force_recovery_fn,
> +};
> +
>  static const struct file_operations ivpu_reset_engine_fops = {
>  	.owner = THIS_MODULE,
>  	.open = simple_open,
> @@ -229,6 +267,9 @@ void ivpu_debugfs_init(struct drm_minor *minor)
>  	drm_debugfs_create_files(vdev_debugfs_list, ARRAY_SIZE(vdev_debugfs_list),
>  				 minor->debugfs_root, minor);
>  
> +	debugfs_create_file("force_recovery", 0200, minor->debugfs_root, vdev,
> +			    &ivpu_force_recovery_fops);
> +
>  	debugfs_create_file("fw_log", 0644, minor->debugfs_root, vdev,
>  			    &fw_log_fops);
>  	debugfs_create_file("fw_trace_destination_mask", 0200, minor->debugfs_root, vdev,
> diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
> index aa4d56dc52b3..e6f27daf5560 100644
> --- a/drivers/accel/ivpu/ivpu_pm.c
> +++ b/drivers/accel/ivpu/ivpu_pm.c
> @@ -259,6 +259,7 @@ void ivpu_pm_reset_prepare_cb(struct pci_dev *pdev)
>  	pm_runtime_get_sync(vdev->drm.dev);
>  
>  	ivpu_dbg(vdev, PM, "Pre-reset..\n");
> +	atomic_inc(&vdev->pm->reset_counter);
>  	atomic_set(&vdev->pm->in_reset, 1);
>  	ivpu_shutdown(vdev);
>  	ivpu_pm_prepare_cold_boot(vdev);
> diff --git a/drivers/accel/ivpu/ivpu_pm.h b/drivers/accel/ivpu/ivpu_pm.h
> index baca98187255..fd4eada1290f 100644
> --- a/drivers/accel/ivpu/ivpu_pm.h
> +++ b/drivers/accel/ivpu/ivpu_pm.h
> @@ -14,6 +14,7 @@ struct ivpu_pm_info {
>  	struct ivpu_device *vdev;
>  	struct work_struct recovery_work;
>  	atomic_t in_reset;
> +	atomic_t reset_counter;
>  	bool is_warmboot;
>  	u32 suspend_reschedule_counter;
>  };
