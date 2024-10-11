Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49182999DCE
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 09:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF77710E0DE;
	Fri, 11 Oct 2024 07:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dsxr/1UG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF60110E0DE
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 07:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728631465; x=1760167465;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Z7KbgGb2SEirlGgTeQ4Iv+yWIHuJb37+AkiI8yShLAk=;
 b=dsxr/1UGv5S4LaUd7ioKc75R5AqZ87MwJqzzx8jnLHIYj07a1w00lcH5
 /yN2jEvML/hco4c0iN8MBmR7kkXMJ2KT6b5UhdaLpOWgk8EZjvF+8jHxQ
 XwoIMN7hsNS42rISX50tU0RLUjizwATCXfHepV/wzumjXjh+vNo2i+nq+
 1eRo9FAOsQLLLp+L2LRRegae1x1DTblDj3YWEnzYn3SD1dKPl/TnoEq8l
 6GIvNrwQEoPH7s6hhknpsr9CS2zJppsC8UBXDluou4ayMgOdVMyZIqUwp
 74a1gVH44xSbF64zx+guY/uqVcEvPwFUOu+IdmZ7zLru+EkVwIZ0YV3oH g==;
X-CSE-ConnectionGUID: f5JO41VsRk2ipap6YuTj0A==
X-CSE-MsgGUID: 7k0Lx4Y4RWiAXc0+8msAaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="27490399"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="27490399"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 00:24:25 -0700
X-CSE-ConnectionGUID: ksJIIJowTsevGlWnmBiRHQ==
X-CSE-MsgGUID: hV88kXkyT8mT1BUb4DqhsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="81655409"
Received: from jwbates1-mobl.amr.corp.intel.com (HELO [10.245.100.202])
 ([10.245.100.202])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 00:24:21 -0700
Message-ID: <49b12989-6c9a-4c2f-bc60-8fe2581ded34@linux.intel.com>
Date: Fri, 11 Oct 2024 09:24:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add AIC080 support
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, quic_carlv@quicinc.com
Cc: ogabbay@kernel.org, corbet@lwn.net, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Troy Hanson <quic_thanson@quicinc.com>
References: <20241004195209.3910996-1-quic_jhugo@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241004195209.3910996-1-quic_jhugo@quicinc.com>
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

On 10/4/2024 9:52 PM, Jeffrey Hugo wrote:
> Add basic support for the new AIC080 product. The PCIe Device ID is
> 0xa080. AIC080 is a lower cost, lower performance SKU variant of AIC100.
> From the qaic perspective, it is the same as AIC100.
> 
> Reviewed-by: Troy Hanson <quic_thanson@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  Documentation/accel/qaic/aic080.rst | 14 ++++++++++++++
>  Documentation/accel/qaic/index.rst  |  1 +
>  drivers/accel/qaic/qaic_drv.c       |  4 +++-
>  3 files changed, 18 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/accel/qaic/aic080.rst
> 
> diff --git a/Documentation/accel/qaic/aic080.rst b/Documentation/accel/qaic/aic080.rst
> new file mode 100644
> index 000000000000..d563771ea6ce
> --- /dev/null
> +++ b/Documentation/accel/qaic/aic080.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +===============================
> + Qualcomm Cloud AI 80 (AIC080)
> +===============================
> +
> +Overview
> +========
> +
> +The Qualcomm Cloud AI 80/AIC080 family of products are a derivative of AIC100.
> +The number of NSPs and clock rates are reduced to fit within resource
> +constrained solutions. The PCIe Product ID is 0xa080.
> +
> +As a derivative product, all AIC100 documentation applies.
> diff --git a/Documentation/accel/qaic/index.rst b/Documentation/accel/qaic/index.rst
> index ad19b88d1a66..967b9dd8bace 100644
> --- a/Documentation/accel/qaic/index.rst
> +++ b/Documentation/accel/qaic/index.rst
> @@ -10,4 +10,5 @@ accelerator cards.
>  .. toctree::
>  
>     qaic
> +   aic080
>     aic100
> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
> index bf10156c334e..f139c564eadf 100644
> --- a/drivers/accel/qaic/qaic_drv.c
> +++ b/drivers/accel/qaic/qaic_drv.c
> @@ -34,6 +34,7 @@
>  
>  MODULE_IMPORT_NS(DMA_BUF);
>  
> +#define PCI_DEV_AIC080			0xa080
>  #define PCI_DEV_AIC100			0xa100
>  #define QAIC_NAME			"qaic"
>  #define QAIC_DESC			"Qualcomm Cloud AI Accelerators"
> @@ -365,7 +366,7 @@ static struct qaic_device *create_qdev(struct pci_dev *pdev, const struct pci_de
>  		return NULL;
>  
>  	qdev->dev_state = QAIC_OFFLINE;
> -	if (id->device == PCI_DEV_AIC100) {
> +	if (id->device == PCI_DEV_AIC080 || id->device == PCI_DEV_AIC100) {
>  		qdev->num_dbc = 16;
>  		qdev->dbc = devm_kcalloc(dev, qdev->num_dbc, sizeof(*qdev->dbc), GFP_KERNEL);
>  		if (!qdev->dbc)
> @@ -607,6 +608,7 @@ static struct mhi_driver qaic_mhi_driver = {
>  };
>  
>  static const struct pci_device_id qaic_ids[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, PCI_DEV_AIC080), },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, PCI_DEV_AIC100), },
>  	{ }
>  };

