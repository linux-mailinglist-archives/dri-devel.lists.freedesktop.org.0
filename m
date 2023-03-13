Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AED8A6B78CF
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 14:25:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C094610E521;
	Mon, 13 Mar 2023 13:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB4710E521
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 13:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678713948; x=1710249948;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=oYZ+iST7+zAfuIyj/tzJql4s9pGYPh5106T+4mW7tT0=;
 b=Em0ljz7hqhtxqOXaE0Yrik/88tUmwMUrGJyb0tp35uWsgzsT63UPClig
 XUSOL/gaoG60cHoDK0sXRM8irS74weE2+E3Gu9wEgmHnhKQ/9yxtQPyhS
 5Ssj117bnY0U8x0s0IuX0vRZWJYGFjIBk0stts3nxxiIf5T0d6RB7/Jjp
 EySH6XhxCNbnYQkYw2sucfdMtdskBGSLEIaTidOYJP/kXroacO6a/13oK
 IUk3AManLpKzPOYuOXNTXojAIRX3ulsk9vNHKMgRbYsXz9h5NBb0z1yWw
 EfgCaJFLGI61u9xDsserSFNxOnc1zz6xhbTaMlbNW3bBKxwksONg3C7RO A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="320993988"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="320993988"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 06:25:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="802442762"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="802442762"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.136.90])
 ([10.249.136.90])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 06:25:44 -0700
Message-ID: <8bb21b27-003d-ca0f-57cc-5379d9d2b799@linux.intel.com>
Date: Mon, 13 Mar 2023 14:25:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 7/8] accel/qaic: Add qaic driver to the build system
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dafna@fastmail.com,
 ogabbay@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 stanislaw.gruszka@linux.intel.com, dri-devel@lists.freedesktop.org
References: <1678138443-2760-1-git-send-email-quic_jhugo@quicinc.com>
 <1678138443-2760-8-git-send-email-quic_jhugo@quicinc.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <1678138443-2760-8-git-send-email-quic_jhugo@quicinc.com>
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
Cc: quic_pkanojiy@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_carlv@quicinc.com, quic_ajitpals@quicinc.com, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 06.03.2023 22:34, Jeffrey Hugo wrote:
> Now that we have all the components of a minimum QAIC which can boot and
> run an AIC100 device, add the infrastructure that allows the QAIC driver
> to be built.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> ---
>  drivers/accel/Kconfig       |  1 +
>  drivers/accel/Makefile      |  1 +
>  drivers/accel/qaic/Kconfig  | 23 +++++++++++++++++++++++
>  drivers/accel/qaic/Makefile | 13 +++++++++++++
>  4 files changed, 38 insertions(+)
>  create mode 100644 drivers/accel/qaic/Kconfig
>  create mode 100644 drivers/accel/qaic/Makefile
> 
> diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
> index c437206..64065fb 100644
> --- a/drivers/accel/Kconfig
> +++ b/drivers/accel/Kconfig
> @@ -26,5 +26,6 @@ menuconfig DRM_ACCEL
>  
>  source "drivers/accel/habanalabs/Kconfig"
>  source "drivers/accel/ivpu/Kconfig"
> +source "drivers/accel/qaic/Kconfig"
>  
>  endif
> diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
> index f22fd44..ab3df93 100644
> --- a/drivers/accel/Makefile
> +++ b/drivers/accel/Makefile
> @@ -2,3 +2,4 @@
>  
>  obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
>  obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
> +obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
> diff --git a/drivers/accel/qaic/Kconfig b/drivers/accel/qaic/Kconfig
> new file mode 100644
> index 0000000..a9f8662
> --- /dev/null
> +++ b/drivers/accel/qaic/Kconfig
> @@ -0,0 +1,23 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Qualcomm Cloud AI accelerators driver
> +#
> +
> +config DRM_ACCEL_QAIC
> +	tristate "Qualcomm Cloud AI accelerators"
> +	depends on DRM_ACCEL
> +	depends on PCI && HAS_IOMEM
> +	depends on MHI_BUS
> +	depends on MMU
> +	select CRC32
> +	help
> +	  Enables driver for Qualcomm's Cloud AI accelerator PCIe cards that are
> +	  designed to accelerate Deep Learning inference workloads.
> +
> +	  The driver manages the PCIe devices and provides an IOCTL interface
> +	  for users to submit workloads to the devices.
> +
> +	  If unsure, say N.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called qaic.
> diff --git a/drivers/accel/qaic/Makefile b/drivers/accel/qaic/Makefile
> new file mode 100644
> index 0000000..d5f4952
> --- /dev/null
> +++ b/drivers/accel/qaic/Makefile
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Makefile for Qualcomm Cloud AI accelerators driver
> +#
> +
> +obj-$(CONFIG_DRM_ACCEL_QAIC)	:= qaic.o
> +
> +qaic-y := \
> +	mhi_controller.o \
> +	mhi_qaic_ctrl.o \
> +	qaic_control.o \
> +	qaic_data.o \
> +	qaic_drv.o
