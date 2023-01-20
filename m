Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA216751C1
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 10:55:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8B610E9FF;
	Fri, 20 Jan 2023 09:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0275B10E9FF
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 09:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674208499; x=1705744499;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+nvvEu/BOUFSCsUyjF17UjmDZnCUyvy9snQzL3mM8lQ=;
 b=V+HWo2icsGfLJZKsv2xmsyxOZgesxKfonzSbKCpMmaWqWKBgJD7hnt+0
 MXg7YOGrDp/TBqJ1AK5ybk4XxkBEpXlVcKOm5fzy2zDP+ZTtx4HtkPw20
 KMI4jA0s1hTX/dzX8KbRr9/XNmRdfS/q+hNW1kiP12C/2XTZ51j4LrFY9
 1Wvr+dX9DxzJSGLJb+ywKL2ZkPfLSXjEERX1Z4F+fV6WG7rHaLnA3O6Yy
 H77WPjVLyhK4hqDnSuzpOP79Eq4qIHU0SJHCJENVe1roS/7PcdOi57tQK
 f1lTFxFQR5Yl/Oi9aRpiX0XoM1pZiIueqfXuGyoeSLOdegR0di7H6SrBL w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="305912521"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="305912521"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 01:54:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="834364601"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="834364601"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 01:54:56 -0800
Date: Fri, 20 Jan 2023 10:54:54 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Colin Ian King <colin.i.king@gmail.com>
Subject: Re: [PATCH][next] accel/ivpu: Fix spelling mistake "tansition" ->
 "transition"
Message-ID: <20230120095454.GA56856@linux.intel.com>
References: <20230120092842.79238-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230120092842.79238-1-colin.i.king@gmail.com>
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
Cc: Oded Gabbay <ogabbay@kernel.org>, kernel-janitors@vger.kernel.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 20, 2023 at 09:28:42AM +0000, Colin Ian King wrote:
> There are spelling mistakes in two ivpu_err error messages. Fix them.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>


> ---
>  drivers/accel/ivpu/ivpu_hw_mtl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_hw_mtl.c b/drivers/accel/ivpu/ivpu_hw_mtl.c
> index b59b1f472b40..62bfaa9081c4 100644
> --- a/drivers/accel/ivpu/ivpu_hw_mtl.c
> +++ b/drivers/accel/ivpu/ivpu_hw_mtl.c
> @@ -608,7 +608,7 @@ static int ivpu_boot_d0i3_drive(struct ivpu_device *vdev, bool enable)
>  
>  	ret = REGB_POLL_FLD(MTL_BUTTRESS_VPU_D0I3_CONTROL, INPROGRESS, 0, TIMEOUT_US);
>  	if (ret) {
> -		ivpu_err(vdev, "Failed to sync before D0i3 tansition: %d\n", ret);
> +		ivpu_err(vdev, "Failed to sync before D0i3 transition: %d\n", ret);
>  		return ret;
>  	}
>  
> @@ -621,7 +621,7 @@ static int ivpu_boot_d0i3_drive(struct ivpu_device *vdev, bool enable)
>  
>  	ret = REGB_POLL_FLD(MTL_BUTTRESS_VPU_D0I3_CONTROL, INPROGRESS, 0, TIMEOUT_US);
>  	if (ret)
> -		ivpu_err(vdev, "Failed to sync after D0i3 tansition: %d\n", ret);
> +		ivpu_err(vdev, "Failed to sync after D0i3 transition: %d\n", ret);
>  
>  	return ret;
>  }
> -- 
> 2.30.2
> 
