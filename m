Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDF091BF59
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 15:15:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF6410E07B;
	Fri, 28 Jun 2024 13:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="2Pd9qWSs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1699 seconds by postgrey-1.36 at gabe;
 Fri, 28 Jun 2024 13:15:05 UTC
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20AC410EC4D
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 13:15:04 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45S958Kt022997;
 Fri, 28 Jun 2024 14:46:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 ZAPW0T4mk6+g9RGuq3Ms922nET7aswPOyugOIngcHKU=; b=2Pd9qWSsIfkL0qEw
 +CjoWW7KavAWCHIpnaFU6LkIKt6De71CvzkU3m7Y28k4TqSs5FR7/LWHRL+EWTRq
 lrD88aB4Sc7RByWtbwnzKGBDPPmhUbhN8EkIe5YHhlnuZAmGVXzH43NcGHkfACEW
 GeoE/b1aLOVnXtL7/XYnexWBUwGWf9EQcziidRafZKmBwBwdaG1ECHCgjLXXQXOK
 LV/0WWmsxAO1JHOLKTXcmYRpKhdyC0uEeYuXjboOV8s+BT3pYeY+UA3anR09+awV
 pC/r4CAoVMHooouVSg0xrYiIqT2XoiIEtWwr1LmVmTTGcNxkW7PJWSrOoGwzi3Bn
 PVbEfQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yx9jjqgfe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jun 2024 14:46:33 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9E1C740048;
 Fri, 28 Jun 2024 14:46:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CA7A02258A2;
 Fri, 28 Jun 2024 14:45:45 +0200 (CEST)
Received: from [10.48.86.145] (10.48.86.145) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 28 Jun
 2024 14:45:45 +0200
Message-ID: <21f4d43d-4abd-4aca-7abb-7321bcfa0f1d@foss.st.com>
Date: Fri, 28 Jun 2024 14:45:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RESEND v3 0/3] Update STM DSI PHY driver
Content-Language: en-US
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240129104106.43141-1-raphael.gallais-pou@foss.st.com>
From: Philippe CORNU <philippe.cornu@foss.st.com>
In-Reply-To: <20240129104106.43141-1-raphael.gallais-pou@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.145]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_08,2024-06-28_01,2024-05-17_01
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



On 1/29/24 11:41, Raphael Gallais-Pou wrote:
> 
> This patch series aims to add several features of the dw-mipi-dsi phy
> driver that are missing or need to be updated.
> 
> First patch update a PM macro.
> 
> Second patch adds runtime PM functionality to the driver.
> 
> Third patch adds a clock provider generated by the PHY itself.  As
> explained in the commit log of the second patch, a clock declaration is
> missing.  Since this clock is parent of 'dsi_k', it leads to an orphan
> clock.  Most importantly this patch is an anticipation for future
> versions of the DSI PHY, and its inclusion within the display subsystem
> and the DRM framework.
> 
> Last patch fixes a corner effect introduced previously.  Since 'dsi' and
> 'dsi_k' are gated by the same bit on the same register, both reference
> work as peripheral clock in the device-tree.
> 
> ---
> Changes in v3-resend:
> 	- Removed last patch as it has been merged
> https://lore.kernel.org/lkml/bf49f4c9-9e81-4c91-972d-13782d996aaa@foss.st.com/
> 
> Changes in v3:
> 	- Fix smatch warning (disable dsi->pclk when clk_register fails)
> 
> Changes in v2:
> 	- Added patch 1/4 to use SYSTEM_SLEEP_PM_OPS instead of old macro
> 	  and removed __maybe_used for accordingly
> 	- Changed SET_RUNTIME_PM_OPS to RUNTIME_PM_OPS
> 
> Raphael Gallais-Pou (3):
>    drm/stm: dsi: use new SYSTEM_SLEEP_PM_OPS() macro
>    drm/stm: dsi: expose DSI PHY internal clock
> 
> Yannick Fertre (1):
>    drm/stm: dsi: add pm runtime ops
> 
>   drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 279 ++++++++++++++++++++++----
>   1 file changed, 238 insertions(+), 41 deletions(-)
> 

Hi Raphaël & Yannick,
Applied on drm-misc-next.
Many thanks,
Philippe :-)
