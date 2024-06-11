Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C005A903DCC
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 15:42:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EFFC10E65D;
	Tue, 11 Jun 2024 13:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="LTGqxHyC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4C810E65D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 13:42:52 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B5kNqo014980;
 Tue, 11 Jun 2024 13:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EGv3QeMPBoLjpiRzl1DcqZgPJZpLuI3J01GLec8uR20=; b=LTGqxHyCdGU8Gh83
 P1fyq9Yv6AJ88wq5Kc+0QyFcUAi37SqNnU1Y4GnqZROWJttfWlIG8t8QU8WF81zJ
 EGWyQ5Jql8SqcAct2toRDZ5yFre//gnLQb1+SKDVyXO1G3L//y66AsB99WK6ZSgs
 lPEfvi5vlvXqk0TiVT1Py4IE9VU94TIi1EDQo6swgjIVyPiHxQ3j194heI8/Bk1K
 oZS5Q47NcNMUtNzHYFU25Ycoe/5KvFN/O0/0N/AZ5oGPTVqYb2UbUpw/6FakMOHb
 kf5T92SbJF0UFvTxSs+v22/nyDlz7hobqz6zet7TyiSbFTlxFf8fnCSP0JG+7K6q
 zpLpTA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymfp7e8as-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jun 2024 13:42:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45BDgikT024959
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jun 2024 13:42:44 GMT
Received: from [10.48.243.20] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Jun
 2024 06:42:43 -0700
Message-ID: <a9d73ecb-1ad3-4f3f-8a32-2aff3713f023@quicinc.com>
Date: Tue, 11 Jun 2024 06:42:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] drm/mipi-dbi: Add missing MODULE_DESCRIPTION()
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20240425125627.2275559-1-andriy.shevchenko@linux.intel.com>
 <ZmDMxtDz5aq0xom6@smile.fi.intel.com> <ZmhSSvT0pxp3Sz8s@smile.fi.intel.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <ZmhSSvT0pxp3Sz8s@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: hWV5l01UdnHhVkmgY0gXF86h_lciRO00
X-Proofpoint-ORIG-GUID: hWV5l01UdnHhVkmgY0gXF86h_lciRO00
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_07,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=791 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110100
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

On 6/11/2024 6:34 AM, Andy Shevchenko wrote:
> On Wed, Jun 05, 2024 at 11:38:31PM +0300, Andy Shevchenko wrote:
>> On Thu, Apr 25, 2024 at 03:56:26PM +0300, Andy Shevchenko wrote:
>>> The modpost script is not happy
>>>
>>>   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/drm_mipi_dbi.o
>>>
>>> because there is a missing module description.
>>>
>>> Add it to the module.
>>
>> Any comments on this?
> 
> +Cc: Jeff, FYI
> 
I'm handling this plus others in:

https://lore.kernel.org/all/20240609-md-drivers-gpu-drm-v1-1-89e9a316d513@quicinc.com/
