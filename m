Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCB58A32D9
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 17:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA18810F718;
	Fri, 12 Apr 2024 15:52:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="LvQV5Pev";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C5F10F718
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 15:52:11 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43CCJlBR025087; Fri, 12 Apr 2024 15:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=d1fpmCXwLq2bRVjY0U0+oCyAU038R/D9yejbAKhF/pA=; b=Lv
 QV5PevzcinGxqFO8j2HMLTzhbCMHG3PW/BWoOKBzuwAZwADEb3TrdzSFfL/FtOx2
 dOoPPf3L0qD+Uf7M2OITTIlv5DKq/ESyV8IBECMSXnaGMa2Iz6ejf05KoOs2VhcM
 EoqEq758QabH7Sov2ZkWzSbWzSHxNWNJE2K8R98ItZZE3jyAXbeds3JUTJ99OD7w
 JzI4vc3QTVs48vm0oTGmUrqI9j4ULfr8PXKDJJ1xpYq0jUgs/RXQfiWsK6LFLB5u
 VxT85YGU3C7jJ6DdSFKeb43tWQP8ZeoaYnQIGPg+Mzv+dXaScWpxpXUC4wzvyPN5
 aIqu4v8vDO4HpqxyTNPw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xeskt1sxm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Apr 2024 15:52:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43CFq35T018481
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Apr 2024 15:52:03 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 12 Apr
 2024 08:52:02 -0700
Message-ID: <bba87a59-d8c0-419e-cc62-dd92bccf901d@quicinc.com>
Date: Fri, 12 Apr 2024 09:52:02 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel/qaic: mark debugfs stub functions as static inline
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, "Jacek
 Lawrynowicz" <jacek.lawrynowicz@linux.intel.com>, "Pranjal Ramajor Asha
 Kanojiya" <quic_pkanojiy@quicinc.com>, Carl Vanderlip
 <quic_carlv@quicinc.com>
CC: Arnd Bergmann <arnd@arndb.de>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240409133945.2976190-1-arnd@kernel.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240409133945.2976190-1-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: pQvByzwBaKuXN2Mlpmr2UkLCOsZcVLj8
X-Proofpoint-ORIG-GUID: pQvByzwBaKuXN2Mlpmr2UkLCOsZcVLj8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-12_12,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 clxscore=1011 spamscore=0 malwarescore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404120113
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

On 4/9/2024 7:39 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The alternative stub functions are listed as global, which produces
> a build failure in some configs:
> 
> In file included from drivers/accel/qaic/qaic_drv.c:31:
> drivers/accel/qaic/qaic_debugfs.h:16:5: error: no previous prototype for 'qaic_bootlog_register' [-Werror=missing-prototypes]
>     16 | int qaic_bootlog_register(void) { return 0; }
>        |     ^~~~~~~~~~~~~~~~~~~~~
> drivers/accel/qaic/qaic_debugfs.h:17:6: error: no previous prototype for 'qaic_bootlog_unregister' [-Werror=missing-prototypes]
>     17 | void qaic_bootlog_unregister(void) {}
>        |      ^~~~~~~~~~~~~~~~~~~~~~~
> drivers/accel/qaic/qaic_debugfs.h:18:6: error: no previous prototype for 'qaic_debugfs_init' [-Werror=missing-prototypes]
>     18 | void qaic_debugfs_init(struct qaic_drm_device *qddev) {}
>        |      ^~~~~~~~~~~~~~~~~
> 
> Make them static inline as intended.
> 
> Fixes: 5f8df5c6def6 ("accel/qaic: Add bootlog debugfs")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Doh.  Thank you for addressing this so quickly.

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
