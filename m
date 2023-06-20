Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E12B57370F4
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 17:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6331710E2F2;
	Tue, 20 Jun 2023 15:51:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E21310E2F2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 15:51:21 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35KDjQ1E006442; Tue, 20 Jun 2023 15:50:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=kZ2NqL15pLYrO+J2ogWPX/nGLLPZ7RbecapIL9S16ZU=;
 b=PmszAFGPxEejbD0JuMYOqTfo1crv5au+F8lEvayQeSb2FxaEaUe4kcIgQvAFwhlUzUtz
 gjRNVGf2O9ankGSBs8Xlu0mKode1SXCns+4Coaq+fOgvQMzKlnNS6Y0F/HoHVwbMNDVf
 34rBcYQEzrZPXrCaJjW0mRddqVrxfPwXJjyjOiTbzAjMOQoIWutM+ZitAaXXX8dHxMgQ
 6lKjjYSi2K6L0eIe4pymsDWPHQqrdD4Hsa+Cn998c6Ru65FHacMLfcmo20+VMd8vk90H
 6YDcVRuap6Ns35cTESakAcyf/3W2O6w+a5yfuoLRCsfG9xe+UQDMPcPi3iEJgGxfCu5+ Xw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rb3xnhnbd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jun 2023 15:50:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35KFoX9o001046
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jun 2023 15:50:33 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 20 Jun
 2023 08:50:32 -0700
Message-ID: <0b25eb4d-aae0-2885-7418-c58503fd2c6a@quicinc.com>
Date: Tue, 20 Jun 2023 09:50:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 1/3] drm: Enable PRIME import/export for all drivers
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, <daniel@ffwll.ch>,
 <airlied@gmail.com>, <mripard@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <zackr@vmware.com>,
 <contact@emersion.fr>, <linux-graphics-maintainer@vmware.com>,
 <alexdeucher@gmail.com>
References: <20230620080252.16368-1-tzimmermann@suse.de>
 <20230620080252.16368-2-tzimmermann@suse.de>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230620080252.16368-2-tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 3zuxbGujoB00cFFV9FcMA_HcFDGTDPGR
X-Proofpoint-GUID: 3zuxbGujoB00cFFV9FcMA_HcFDGTDPGR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-20_11,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=832 adultscore=0
 malwarescore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306200142
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
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/20/2023 1:59 AM, Thomas Zimmermann wrote:
> Call drm_gem_prime_handle_to_fd() and drm_gem_prime_fd_to_handle() by
> default if no PRIME import/export helpers have been set. Both functions
> are the default for almost all drivers.
> 
> DRM drivers implement struct drm_driver.gem_prime_import_sg_table
> to import dma-buf objects from other drivers. Having the function
> drm_gem_prime_fd_to_handle() functions set by default allows each
> driver to import dma-buf objects to itself, even without support for
> other drivers.
> 
> For drm_gem_prime_handle_to_fd() it is similar: using it by default
> allows each driver to export to itself, even without support for other
> drivers.
> 
> This functionality enables userspace to share per-driver buffers
> across process boundaries via PRIME (e.g., wlroots requires this
> functionality). The patch generalizes a pattern that has previously
> been implemented by GEM VRAM helpers [1] to work with any driver.
> For example, gma500 can now run the wlroots-based sway compositor.
> 
> v2:
> 	* clean up docs and TODO comments (Simon, Zack)
> 	* clean up style in drm_getcap()
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://lore.kernel.org/dri-devel/20230302143502.500661-1-contact@emersion.fr/ # 1
> Reviewed-by: Simon Ser <contact@emersion.fr>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
