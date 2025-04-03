Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47987A7A8D6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 19:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8987F10EA4F;
	Thu,  3 Apr 2025 17:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="2DQrMMUN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3614 seconds by postgrey-1.36 at gabe;
 Thu, 03 Apr 2025 17:48:46 UTC
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BBDC10EA4F
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 17:48:44 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533DFYG7020998;
 Thu, 3 Apr 2025 18:48:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 s35/hd6j/oze5BQkwpCnAuHUmsOym+Ak7W6YaAEdPvY=; b=2DQrMMUNOkxT30fy
 csV/MW1O1HBkGFvgMXIvytqri6PCwBuv/VZyYZgZLkOXV2AAgHVpmzMtv0e2sa3b
 ASJA7VTKezVWW5TTjBJSYMFf8hUCHOib1YclyTV9ShF09oGqaIkZ5ADVKtwrMwym
 avPUCbfxINEnVP9q3GiZWGh53DyDrL+mmBcRAzmHP8i0x3pL0jyZKpmZcfr7LHcX
 48XefNcuzjCAJPY4U3TKj7BE4SRUReFdS+MViRgQENtIJQTig9YHxc0UeX80l7vl
 hZwrO943fqfPK7oaJe5Lw19X8BZmkB/zol8UJEO/EuoV310EbjzcO7Lmc7ExS5DT
 XajjAg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45spura89a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Apr 2025 18:48:11 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 91CE54004D;
 Thu,  3 Apr 2025 18:47:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D2AAF8FB462;
 Thu,  3 Apr 2025 18:46:34 +0200 (CEST)
Received: from [10.130.77.153] (10.130.77.153) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 18:46:34 +0200
Message-ID: <49ca9518-ca05-44d8-8f63-53bb1d0d177a@foss.st.com>
Date: Thu, 3 Apr 2025 18:46:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sti: remove duplicate object names
To: Rolf Eike Beer <eb@emlix.com>, Alain Volmat <alain.volmat@foss.st.com>,
 David Airlie <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Thierry Reding <treding@nvidia.com>
References: <1920148.tdWV9SEqCh@devpool47.emlix.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <1920148.tdWV9SEqCh@devpool47.emlix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.130.77.153]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_07,2025-04-03_03,2024-11-22_01
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



On 1/15/25 09:58, Rolf Eike Beer wrote:
> When merging 2 drivers common object files were not deduplicated.
>
> Fixes: dcec16efd677 ("drm/sti: Build monolithic driver")
> Cc: stable@kernel.org
> Signed-off-by: Rolf Eike Beer <eb@emlix.com>
> ---
>
Hi Rolf,

This patch predates my time as the STi maintainer, so I had not seen it.

Applied on drm-misc-fixes.

Thanks,
Raphaël



