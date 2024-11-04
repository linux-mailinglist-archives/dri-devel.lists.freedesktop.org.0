Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBEA9BAFAB
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 10:30:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55DA310E3C5;
	Mon,  4 Nov 2024 09:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="Xi8Mjm0v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 862 seconds by postgrey-1.36 at gabe;
 Mon, 04 Nov 2024 09:30:45 UTC
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4057A10E3BB
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 09:30:45 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A46iB9t019611;
 Mon, 4 Nov 2024 10:16:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=selector1; bh=LOoFK7uRx+MUt0/YdpS1pL2q
 FeP0ZrautUmPO/QulM0=; b=Xi8Mjm0vASq2twdCP7hYvBbM/vfxe/7dWGfOUKg+
 rk0/wGeEACPRlzYYadULsWEw+cuqcnIEfip6QpBUmRzTj4bLWlf7XAO94WVS72XA
 j4qsMbxT4D5D1lcrJ/FAwF2LOynZb6RVmq5VwyKOWYmq3j0aa74r99c7cPjpfXP3
 wmj6/dzVkxq+HzV6YuZRvrq1BtgWXp3CXMA5esT8ET/wlXHnKFaMmhQn9MvQDZ7p
 GDIvTKfn8zS9EcPXQ04cGunxt8bFv3oUQyhuYp+hq8e/Mc5Bw5Iac3cNNnhe5lJw
 xGYcvxijXA80YlXyKjIGQ/Kf6RNXzQOJA5lIg3wSXpPg/g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42nd00dr26-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Nov 2024 10:16:06 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8EEF340057;
 Mon,  4 Nov 2024 10:14:25 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 935A0251A74;
 Mon,  4 Nov 2024 10:13:51 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 4 Nov
 2024 10:13:51 +0100
Date: Mon, 4 Nov 2024 10:13:45 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
CC: David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] MAINTAINERS: add Raphael Gallais-Pou to DRM/STi
 maintainers
Message-ID: <20241104091345.GA1011015@gnbcxd0016.gnb.st.com>
References: <20241029183041.137414-1-rgallaispou@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241029183041.137414-1-rgallaispou@gmail.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
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

Hi Raphael,

On Tue, Oct 29, 2024 at 07:30:41PM +0100, Raphael Gallais-Pou wrote:
> Add myself as a maintainer for STi driver changes.
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 71b739b40921..0e583aae590a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7477,6 +7477,7 @@ F:	drivers/gpu/drm/rockchip/
>  
>  DRM DRIVERS FOR STI
>  M:	Alain Volmat <alain.volmat@foss.st.com>
> +M:	Raphael Gallais-Pou <rgallaispou@gmail.com>

Acked-by: Alain Volmat <alain.volmat@foss.st.com>

>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> -- 
> 2.45.2
> 

Regards,
Alain
