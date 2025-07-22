Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDE8B0D3F4
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 09:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22BB010E621;
	Tue, 22 Jul 2025 07:55:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z7E8Ostb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9DD10E626
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753170941; x=1784706941;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=538BX0oOECz/l/2l9Mo1894gIcR3ZyqW32EhlafprQA=;
 b=Z7E8OstbUsnbyCdUyYXHPq1jsElXtLOllfMTNZglL4wEWYbM8/q7EA0u
 XuKlaviB+uuyaGMbgVk9DwHHds9dI9D3LNxRWNBAXVaOiNwI0YKk5XVhV
 P9xISfEjiW+MCrx99DGVAHhlRgbtg1zqdLCOmOj+oG+R+0WaNMU+rR87d
 A3Mp9uDT5TNtSn9sKk9HxVdUpG05hzB/UZMGcmwVHDPgNh3PkDKCnIsIf
 aohyrTIbfOuskacQYMMKrUgd+0cyV92Q8CucBpuH+evihuHtfTFaOTsYj
 Wg4rwthPP6BbeOMpvjcmo/VsNB3z9X4iCWfR8vterekplDZZ8Ub4sk03g Q==;
X-CSE-ConnectionGUID: nQFc69HERq2C6IFtmhHk0w==
X-CSE-MsgGUID: kyngfD80SGqKXIS264VW5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="77947065"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="77947065"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 00:55:40 -0700
X-CSE-ConnectionGUID: tGbBdjeuRN2HT1zmZaohPw==
X-CSE-MsgGUID: /aq+xyXuS/26s2GRvXURew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="158373034"
Received: from wdziedzi-mobl.ger.corp.intel.com (HELO [10.245.113.213])
 ([10.245.113.213])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 00:55:39 -0700
Message-ID: <fc12ee3d-1b76-43e1-98a6-b5b647fbb603@linux.intel.com>
Date: Tue, 22 Jul 2025 09:55:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/amdxdna: Delete pci_free_irq_vectors()
To: Salah Triki <salah.triki@gmail.com>, Min Ma <min.ma@amd.com>,
 Lizhi Hou <lizhi.hou@amd.com>, Oded Gabbay <ogabbay@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <aHs8QAfUlFeNp7qL@pc>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <aHs8QAfUlFeNp7qL@pc>
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

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 7/19/2025 8:33 AM, Salah Triki wrote:
> The device is managed so pci_free_irq_vectors() is called automatically
> no need to do it manually.
> 
> Signed-off-by: Salah Triki <salah.triki@gmail.com>
> ---
>  drivers/accel/amdxdna/aie2_pci.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index c6cf7068d23c..3474a8d4e560 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -520,14 +520,14 @@ static int aie2_init(struct amdxdna_dev *xdna)
>  	if (!ndev->psp_hdl) {
>  		XDNA_ERR(xdna, "failed to create psp");
>  		ret = -ENOMEM;
> -		goto free_irq;
> +		goto release_fw;
>  	}
>  	xdna->dev_handle = ndev;
>  
>  	ret = aie2_hw_start(xdna);
>  	if (ret) {
>  		XDNA_ERR(xdna, "start npu failed, ret %d", ret);
> -		goto free_irq;
> +		goto release_fw;
>  	}
>  
>  	ret = aie2_mgmt_fw_query(ndev);
> @@ -578,8 +578,6 @@ static int aie2_init(struct amdxdna_dev *xdna)
>  	aie2_error_async_events_free(ndev);
>  stop_hw:
>  	aie2_hw_stop(xdna);
> -free_irq:
> -	pci_free_irq_vectors(pdev);
>  release_fw:
>  	release_firmware(fw);
>  
> @@ -588,12 +586,10 @@ static int aie2_init(struct amdxdna_dev *xdna)
>  
>  static void aie2_fini(struct amdxdna_dev *xdna)
>  {
> -	struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
>  	struct amdxdna_dev_hdl *ndev = xdna->dev_handle;
>  
>  	aie2_hw_stop(xdna);
>  	aie2_error_async_events_free(ndev);
> -	pci_free_irq_vectors(pdev);
>  }
>  
>  static int aie2_get_aie_status(struct amdxdna_client *client,

