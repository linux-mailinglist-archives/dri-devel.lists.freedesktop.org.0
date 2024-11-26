Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 562339D98D7
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 14:49:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0AB010E88F;
	Tue, 26 Nov 2024 13:49:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="IAy4dB/A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 344DE10E403
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 13:49:22 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQAkC7G030121;
 Tue, 26 Nov 2024 14:49:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 KedC3Z5LX9M+kf2Kz31pt6fO9ebLyhuhZY7jHYfTaKs=; b=IAy4dB/ABkVSrzev
 tslooVYtSHlNNxjrR23jOIp+EUUpR+oNbdFp2B71QszuJyELbyI/e4AAqRRPJO3t
 Nsgtko+n0KyMkyxZyDAJiiktd2oGDT41/5+Mjc2KmPeorbF2C/JZ6c2bSg+hzFPc
 8fXtLYjwsolp49kKUp4ysvUzzAXoa8IMtoP0HDtVJcQ4MAe2rLt5rhYYDkmX1pI1
 zvMAPyMW6RpnvdVCavgYNKl8eJbLqeq3ppMB+Tve98c5C4vKZEGp/MLD+9zF0/VX
 LKhlnNzaPPgHwAMZwRyXxgx6riNp09KQAV7S9JeMI5dV9VGCU7TrTzbqyA6schGq
 lrQtNg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 433791wapk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2024 14:49:05 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2740C4004A;
 Tue, 26 Nov 2024 14:47:49 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 36599288B75;
 Tue, 26 Nov 2024 14:46:11 +0100 (CET)
Received: from [10.129.178.23] (10.129.178.23) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 26 Nov
 2024 14:46:10 +0100
Message-ID: <ed43f2f4-40f5-41c9-80ea-9470a1395195@foss.st.com>
Date: Tue, 26 Nov 2024 14:46:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sti: Add __iomem for mixer_dbg_mxn's parameter
To: Pei Xiao <xiaopei01@kylinos.cn>, <alain.volmat@foss.st.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <--to=lkp@intel.com>
CC: <ville.syrjala@linux.intel.com>, kernel test robot <lkp@intel.com>
References: <202411191809.6V3c826r-lkp@intel.com>
 <c28f0dcb6a4526721d83ba1f659bba30564d3d54.1732087094.git.xiaopei01@kylinos.cn>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <c28f0dcb6a4526721d83ba1f659bba30564d3d54.1732087094.git.xiaopei01@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.129.178.23]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
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


On 11/20/24 08:21, Pei Xiao wrote:
> Sparse complains about incorrect type in argument 1.
> expected void const volatile  __iomem *ptr but got void *.
> so modify mixer_dbg_mxn's addr parameter.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202411191809.6V3c826r-lkp@intel.com/
> Fixes: a5f81078a56c ("drm/sti: add debugfs entries for MIXER crtc")
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>

Hi,

Applied on drm-misc-fixes.

Thanks,

RaphaEl Gallais-Pou

