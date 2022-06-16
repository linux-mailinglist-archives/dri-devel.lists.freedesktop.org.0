Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B22B54E65D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 17:48:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11B510EB85;
	Thu, 16 Jun 2022 15:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8209610EC2B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 15:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=J4jPWp33wI6h8Ur/ZqXqPougpPgiQTbckyhfVsNptl0=; b=ibHuKqDYB9Y71kakQ/FkADzCCy
 Vu++A1coFokOEZ4BYtplTPzg7JBfHXccVca4Eqi0+rsNpXzuJ0WSDGlPGVe1mgGs8zEG8WlNgs96e
 JIKvdbGuQCOqPpgZeo8QLfAfRMZ6jFdZawMYzwQ+Psx8U0AU6ikbg5CR0YVNzuIlZEFFEHzcZBhsL
 1e1o9XfGsJXRFcASEl7jVr1TUOEQLs/Pb/ztPrO4W8v/wU7t0Pt1znpVo6jAVXbZMjYG/28S7qIiH
 5lbdIu2kNS7oHpk8Q+Z/uNsUEUAYw6df2IjROYlUksdkZuKWY4MlNqxc9Cf3SNUVmd3kwJ3gAfyw7
 SA0bKfsQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o1rjB-008Rpl-69; Thu, 16 Jun 2022 15:48:14 +0000
Message-ID: <b844d2f5-3187-1d53-da14-1d1cf99d0f4e@infradead.org>
Date: Thu, 16 Jun 2022 08:48:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH V2 2/2] drm: xlnx: dsi: Add Xilinx MIPI DSI-Tx subsystem
 driver
Content-Language: en-US
To: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>,
 laurent.pinchart@ideasonboard.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org
References: <1655389056-37044-1-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
 <1655389056-37044-3-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <1655389056-37044-3-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
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
Cc: airlied@linux.ie, vgannava@xilinx.com, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/16/22 07:17, Venkateshwar Rao Gannavarapu wrote:
> diff --git a/drivers/gpu/drm/xlnx/Kconfig b/drivers/gpu/drm/xlnx/Kconfig
> index f9cf93c..a75bd76 100644
> --- a/drivers/gpu/drm/xlnx/Kconfig
> +++ b/drivers/gpu/drm/xlnx/Kconfig
> @@ -1,3 +1,15 @@
> +config DRM_XLNX_DSI
> +	tristate "Xilinx DRM DSI Subsystem Driver"
> +	depends on ARCH_ZYNQMP || COMPILE_TEST
> +	depends on DRM && OF
> +	select DRM_KMS_HELPER
> +	select DRM_MIPI_DSI
> +	select DRM_PANEL_BRIDGE
> +	help
> +	  DRM bridge driver for Xilinx programmable DSI subsystem controller.
> +	  choose this option if you hava a Xilinx MIPI-DSI Tx subsytem in

	  Choose

> +	  video pipeline.

-- 
~Randy
