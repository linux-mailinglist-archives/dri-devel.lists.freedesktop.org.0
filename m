Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A28778D685C
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 19:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70DFD10E2C1;
	Fri, 31 May 2024 17:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="MP9wjwLi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB5510E2C1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 17:46:12 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V9eD7k015957;
 Fri, 31 May 2024 17:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zDggzVShflqQw+bpQBvpfshxpqbJqcejeDnhzjwPzK8=; b=MP9wjwLioEOXZgKb
 ep9UN9V7rvQdz4tILrb0vIlIXAMLDefc9rSQkSAGZFopK9aYr6NQBclJVCqHtyVt
 wz+Rtkg6vXlVnzHQcFGmzjm84KdegD+9+bqf+kdl7V5hBAF58OdOlCM8THIFP+Ws
 jVjS87vTnvDDLj+j/aJ3OdjrUUu6sJngQs85pMwH3fFCfvx6iRYxqeO/i7yWhWax
 k4z5VQds9M7q2nLd66GcJJ6k5vifis9z2MoidIzF9cbK1N43Hp0RfVdk7cxTIzEE
 j0Y3H/C8cB33pP58alr2WH14SgfSJMSzJBTNgP6A/H9oO6cB++ohUgfU7S53OWkz
 6VWh4g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yf23stk49-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 May 2024 17:46:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44VHk1iE004296
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 May 2024 17:46:01 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 May
 2024 10:46:00 -0700
Message-ID: <871ef640-c5fe-69d5-2b15-286db6845dc8@quicinc.com>
Date: Fri, 31 May 2024 11:46:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v3 0/3] drm/panel-edp: remove several legacy compatibles
 used by the driver
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Douglas Anderson <dianders@chromium.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 "Sam Ravnborg" <sam@ravnborg.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
References: <20240531-edp-panel-drop-v3-0-4c98b2b95e3a@linaro.org>
 <7428a2f7-befc-6db8-76f4-3ca8dc12d31c@quicinc.com>
 <6kmhrxip4xb44bspptwdaoqsod5gm7ccr27fn3jr4ouh4jszi4@fuxht25n5wki>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <6kmhrxip4xb44bspptwdaoqsod5gm7ccr27fn3jr4ouh4jszi4@fuxht25n5wki>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: durUuZ7aWnVn__pqXTtLIFPO6Bca352L
X-Proofpoint-GUID: durUuZ7aWnVn__pqXTtLIFPO6Bca352L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_12,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310133
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

On 5/31/2024 11:43 AM, Dmitry Baryshkov wrote:
> On Fri, May 31, 2024 at 10:18:07AM -0600, Jeffrey Hugo wrote:
>> On 5/30/2024 5:12 PM, Dmitry Baryshkov wrote:
>>> There are two ways to describe an eDP panel in device tree. The
>>> recommended way is to add a device on the AUX bus, ideally using the
>>> edp-panel compatible. The legacy way is to define a top-level platform
>>> device for the panel.
>>>
>>> Document that adding support for eDP panels in a legacy way is strongly
>>> discouraged (if not forbidden at all).
>>>
>>> While we are at it, also drop legacy compatible strings and bindings for
>>> five panels. These compatible strings were never used by a DT file
>>> present in Linux kernel and most likely were never used with the
>>> upstream Linux kernel.
>>>
>>> The following compatibles were never used by the devices supported by
>>> the upstream kernel and are a subject to possible removal:
>>>
>>> - lg,lp097qx1-spa1
>>> - samsung,lsn122dl01-c01
>>> - sharp,ld-d5116z01b
>>
>> Ok to drop the sharp one I added.  It should be able to be handled by the
>> (newish) edp-panel, but I think the TI bridge driver needs some work for the
>> specific platform (no I2C connection) to verify.
> 
> Thanks. I'm tempted to merge the series as is now and drop
> sharp,ld-d5116z01b once you can confirm that it can be handled by
> edp-panel on your platform.
> 

Sounds good to me.

-Jeff
