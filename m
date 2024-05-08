Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A29E8BFEC5
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 15:30:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B341112051;
	Wed,  8 May 2024 13:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hhnjk5Z4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F4C1127BF
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 13:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715175048; x=1746711048;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ssUaS9Q5QzaVs+yfxwTC/bTa8sFrWJxk42Ad2LCzV8w=;
 b=Hhnjk5Z4BAS3Sx5ql1obkYltp+YBP21mJc5W61bBYTYYu+xLrkfuHRf0
 ZVwTq2tWtpxt6XJLcm66hj8wv3/L9RkEUyfXl52gqNx6J27CQg/tSMARc
 MHw3rmUeBV1PTuWREjiWpw67VJILZm1EExcLyjtAKlLXGYzWxWTImo8Y1
 Zf1nNC/67PmW0TrQipvhkQrfpKExunF/b8bqQTJZB16WVC+C9RpXR/90O
 69KJqwBsXhIJ7uInRVdo2g3QfqMf35I4ApeUF8QOSGKUsxMMjkL4DKNvT
 LDteaZkQW9R3zIPV5fM9R39lbAFkkXw6Tnm4GXBaZLBUMSqsycU3qGgRT Q==;
X-CSE-ConnectionGUID: Lx1H2enGRH6VL581p+uvTw==
X-CSE-MsgGUID: Of1mtizpTwOp5U/TbMq19w==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="21634709"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="21634709"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:30:47 -0700
X-CSE-ConnectionGUID: FrBsjokHSoavG3B++96vmA==
X-CSE-MsgGUID: xqy8s26UQf23sAqwr7iqZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="29470432"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.245.114.39])
 ([10.245.114.39])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:30:45 -0700
Message-ID: <301ca63c-668b-4f2c-a7a0-c3fe2144658b@linux.intel.com>
Date: Wed, 8 May 2024 15:30:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] accel/ivpu: Configure fw logging using debugfs
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
References: <20240508132557.2388267-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240508132557.2388267-1-jacek.lawrynowicz@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Please ignore this patch. It got here by mistake.
There is another one sent as a part of a patchset.

On 08.05.2024 15:25, Jacek Lawrynowicz wrote:
> From: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
> 
> Add fw_dyndbg file that can be used to control FW logging.
> 
> Signed-off-by: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_debugfs.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
> index 6ff967e595cf..b6c7d6a53c79 100644
> --- a/drivers/accel/ivpu/ivpu_debugfs.c
> +++ b/drivers/accel/ivpu/ivpu_debugfs.c
> @@ -145,6 +145,30 @@ static const struct file_operations dvfs_mode_fops = {
>  	.write = dvfs_mode_fops_write,
>  };
>  
> +static ssize_t
> +fw_dyndbg_fops_write(struct file *file, const char __user *user_buf, size_t size, loff_t *pos)
> +{
> +	struct ivpu_device *vdev = file->private_data;
> +	char buffer[VPU_DYNDBG_CMD_MAX_LEN] = {};
> +	int ret;
> +
> +	if (size >= VPU_DYNDBG_CMD_MAX_LEN)
> +		return -EINVAL;
> +
> +	ret = strncpy_from_user(buffer, user_buf, size);
> +	if (ret < 0)
> +		return ret;
> +
> +	ivpu_jsm_dyndbg_control(vdev, buffer, size);
> +	return size;
> +}
> +
> +static const struct file_operations fw_dyndbg_fops = {
> +	.owner = THIS_MODULE,
> +	.open = simple_open,
> +	.write = fw_dyndbg_fops_write,
> +};
> +
>  static int fw_log_show(struct seq_file *s, void *v)
>  {
>  	struct ivpu_device *vdev = s->private;
> @@ -369,6 +393,8 @@ void ivpu_debugfs_init(struct ivpu_device *vdev)
>  	debugfs_create_file("dvfs_mode", 0200, debugfs_root, vdev,
>  			    &dvfs_mode_fops);
>  
> +	debugfs_create_file("fw_dyndbg", 0200, debugfs_root, vdev,
> +			    &fw_dyndbg_fops);
>  	debugfs_create_file("fw_log", 0644, debugfs_root, vdev,
>  			    &fw_log_fops);
>  	debugfs_create_file("fw_trace_destination_mask", 0200, debugfs_root, vdev,
