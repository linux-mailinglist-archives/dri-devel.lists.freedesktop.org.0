Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0960E903E3A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 15:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9861710E666;
	Tue, 11 Jun 2024 13:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="nLbjP9f3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E2310E166;
 Tue, 11 Jun 2024 13:59:33 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BA7qdB016879;
 Tue, 11 Jun 2024 13:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dxaROFs1iF2+cQLuAxUw+KpjAAlVxc/tDaPar/eQXwk=; b=nLbjP9f3CWn3vI5m
 0wuRdFX98e2vjfXxaCRBeGfQNalun3BH49257azkIRLfjKKe1ug/p7m5bgtGmriL
 +7YizvDHhPAyDwfTW6PZ0dts4GAxQCB5Usl/pGvsOEB8kDegWLEtbzDWu/RiXfY7
 rTt8yrm4WY70yhMGjkcXwb2maMoYtkw7UdjgQRJgtR5lZwPyn12lbL0qI7IczIAj
 C89MJHSwWMFVKiZHEmzKUbw3zDUPJL4k1hmMUFGYc2UEmEX/YQn953BzNSuth5X2
 lO76t54vSY6yaOyLvnx5uY9Ul/GR8so2/ALKo7cukRTefr5NO8QO4YBuVD7rwQTB
 GQE7Lg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ypmjarm8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jun 2024 13:59:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45BDxP9i010242
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jun 2024 13:59:25 GMT
Received: from [10.48.243.20] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Jun
 2024 06:59:24 -0700
Message-ID: <3f796712-4ab8-47d6-bb68-1a3f2d3d0ffd@quicinc.com>
Date: Tue, 11 Jun 2024 06:59:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm: add missing MODULE_DESCRIPTION() macros
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <intel-gvt-dev@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <kernel-janitors@vger.kernel.org>
References: <20240611-md-drivers-gpu-drm-v2-1-0b7d9347b159@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240611-md-drivers-gpu-drm-v2-1-0b7d9347b159@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: kyISZegIPP9aK6hGzjx20Sn3FHfPn_k4
X-Proofpoint-ORIG-GUID: kyISZegIPP9aK6hGzjx20Sn3FHfPn_k4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_07,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110101
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

On 6/11/2024 6:56 AM, Jeff Johnson wrote:
> On x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/gud/gud.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/drm_panel_orientation_quirks.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/i915/kvmgt.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/udl/udl.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro to all
> files which have a MODULE_LICENSE().
> 
> For consistency this includes drivers/gpu/drm/drm_simple_kms_helper.c
> since it contains a MODULE_LICENSE() even though it isn't built as a
> separate module -- it is always built as part of drm_kms_helper and
> drm_kms_helper_common.c already provides a MODULE_DESCRIPTION for that
> module.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
> This is the last in a set of patches to drivers/gpu/drm. The
> preceeding patches cleaned up subdirectiries that had more than one
> issue. This patch cleans up the stragglers. Let me know if any of
> these modifications need to segregated into separate patches.
> ---
> Changes in v2:
> - Removed all references to drivers/gpu/drm/drm_mipi_dbi.c since it is already
>   being handled by:
>   https://lore.kernel.org/all/20240425125627.2275559-1-andriy.shevchenko@linux.intel.com/
> - Link to v1: https://lore.kernel.org/r/20240609-md-drivers-gpu-drm-v1-1-89e9a316d513@quicinc.com

Nevermind, as Andy pointed out my v1 has already been applied.


