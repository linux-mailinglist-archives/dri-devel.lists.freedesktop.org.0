Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 967C4B3E3E7
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 15:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 777AE10E457;
	Mon,  1 Sep 2025 13:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="nKP18NCd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A111710E457
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 13:04:37 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 581CFmgh007371;
 Mon, 1 Sep 2025 15:04:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 eKDbTF0rJsPIq16LFXauITfPuABX1GiMtD/9wpmMhxk=; b=nKP18NCdR7MnPsNK
 LYIVJwSlF+zZ1Iibb3GQJxS1cAou41iJMAr6wOKNtk/EYT8y1lnjCFMzdebyzHGE
 dzwPSxFTFZIGWJzC62QTyGOeDte1TGvkDXNTj2d8hj/PLv06cXR1cYo0xefAuqp8
 QU99m+uISxXxWCYriCiCCtiQQJOXSzAicrBgZ33qUNiYKuLIj5Apdhm+KmFNn6Z7
 Rgc8BwXSZ2ACMhAgJpiVXkbEhLsGBFie9sUqq8QUNlmdgmmIpwhlWUSsasxg09gM
 4dnJ5qDw6pJPQYSpYjo6a8l3+RQZ+8Tc0UJd8smBOneW73mrF49y62h7o4m0hpOM
 SD5/xA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48urmx756q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Sep 2025 15:04:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B57054005C;
 Mon,  1 Sep 2025 15:02:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3A14879C6AB;
 Mon,  1 Sep 2025 15:01:57 +0200 (CEST)
Received: from [10.252.4.3] (10.252.4.3) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 1 Sep
 2025 15:01:56 +0200
Message-ID: <c8e91123-e407-4813-8236-1852d44b93d9@foss.st.com>
Date: Mon, 1 Sep 2025 15:01:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: lvds: Remove unused members from main structure
To: Liu Ying <victor.liu@nxp.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250829-panel-lvds-remove-width-height-v1-1-acecf0c84dc4@nxp.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20250829-panel-lvds-remove-width-height-v1-1-acecf0c84dc4@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.4.3]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_05,2025-08-28_01,2025-03-28_01
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



On 8/29/25 09:53, Liu Ying wrote:
> Since commit 03fa454bb666 ("drm/panel: lvds: Simplify mode parsing"),
> the width and height members of struct panel_lvds are no longer used.
> Remove them.  No functional change.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---

Hi,

Reviewed-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

Best regards,
Raphaël
>  drivers/gpu/drm/panel/panel-lvds.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
> index 23fd535d8f479045a87b0f51bec17cd7c66b0f75..46b07f38559f35aa3b0a41662cc29480e53e885f 100644
> --- a/drivers/gpu/drm/panel/panel-lvds.c
> +++ b/drivers/gpu/drm/panel/panel-lvds.c
> @@ -28,8 +28,6 @@ struct panel_lvds {
>  	struct device *dev;
>  
>  	const char *label;
> -	unsigned int width;
> -	unsigned int height;
>  	struct drm_display_mode dmode;
>  	u32 bus_flags;
>  	unsigned int bus_format;
>
> ---
> base-commit: 3cace99d63192a7250461b058279a42d91075d0c
> change-id: 20250829-panel-lvds-remove-width-height-1d063f0bb178
>
> Best regards,

