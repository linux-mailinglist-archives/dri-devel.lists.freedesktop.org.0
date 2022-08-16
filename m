Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F96C5A00C2
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 19:53:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD479BE85E;
	Wed, 24 Aug 2022 17:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFCC10FAB2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 14:50:57 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27GB0Hus032057;
 Tue, 16 Aug 2022 14:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=FVmxu4Kpgh/PEz4lvaHtDQ+ONJaDkADmoBabIh6f9Xk=;
 b=BdoAvu97dstuMW5cD0MVOuainuxwZRkcrjwxk2G8xHhjYD8eTqRmwlWB5vhe+CzZppVr
 cxY6+dPSGhm/iq9GzOwBiIaAuIfiT/vFxk3CPzaVVIIWkgJOtc8wBcosVpJUzTmg1ecn
 3KJdK9PjF+U3xhks7mVDTdeIbeG9giMd6m3s+CyjJ1YG1eFl2theSKBwFVHIkDfveX58
 hxAMTRP/YrOPbyouwI2LuJsCBa9e09A0MdYAbke2kJfRHpSf0udtog6GsTDpjXMAGPyM
 Ytt1maBYO5IPWadsiiLYRGPkhki2iqijVTeia+DU3y+UgtXHHEu7jJ1PD0dhMxHWCPPM 6A== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j05ev1mb7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Aug 2022 14:50:52 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.47.97.222])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27GEoqL9019177
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Aug 2022 14:50:52 GMT
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 16 Aug 2022 07:50:51 -0700
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 16 Aug
 2022 07:50:50 -0700
Message-ID: <3981919c-1e48-8249-c09d-1c8ded3f3fc7@quicinc.com>
Date: Tue, 16 Aug 2022 08:50:49 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [RFC PATCH 01/14] drm/qaic: Add documentation for AIC100
 accelerator driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, <airlied@linux.ie>, 
 <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
References: <1660588956-24027-1-git-send-email-quic_jhugo@quicinc.com>
 <1660588956-24027-2-git-send-email-quic_jhugo@quicinc.com>
 <a9c71f3b-0c7b-ee8f-d350-0ab453018558@linaro.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <a9c71f3b-0c7b-ee8f-d350-0ab453018558@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: E3qxsNLRgCkD31k514xqDxc7I7dpqr1p
X-Proofpoint-GUID: E3qxsNLRgCkD31k514xqDxc7I7dpqr1p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-16_08,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0
 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxlogscore=563
 adultscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208160056
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_ajitpals@quicinc.com,
 quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/16/2022 4:55 AM, Krzysztof Kozlowski wrote:
> On 15/08/2022 21:42, Jeffrey Hugo wrote:
>> Add documentation covering both the QAIC driver, and the device that it
>> drives.
> 
> Thank you for your patch. There is something to discuss/improve.
> 
> 
>>
>> Change-Id: Iee519cc0a276249c4e8684507d27ae2c33e29aeb
> 
> You need to drop all such non-standard tags. 

Noted.

