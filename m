Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F8D9EFA6A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 19:10:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7838C10E3E3;
	Thu, 12 Dec 2024 18:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="WqiYTPB8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA8110E3E3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 18:10:47 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCGvbVE029911;
 Thu, 12 Dec 2024 18:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 s2oXJFUSdO4b3N0K1tz9zIWqIb8TBGZozHuxtL/NG40=; b=WqiYTPB8dqHWp8Um
 e1m2JHTUlzjbjeqNfGLgBho6B/UjQG5T5S0+HzdoEDn3wBFhNBG9TDkZL9mDzt4W
 gLg3G5oMtxIgKFzUrNDJkwKCjd9cR0eaJTjK8M5yPFTYV0A4GHM2xQ/c1nwHmV7c
 vYu2BfkttXiuJLYDBX29mdQShOuXm1rjYrBWMu0sRHikTizkZRVDCcxF0ak5CkWs
 fCyY7VKRmXokF6rDWYnmsjS9umeVZC83zoNf+Q8+gnoqxmlf9WKtpbFE7EC+W7iq
 tONGNvTNoxWH413KN7OWw6zSaWQkQ1WbfInTZLRyFbF989VWAfVOVvqRai7FiM3h
 DOkoWg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fd4xuujk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Dec 2024 18:10:32 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BCIAVvV015187
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Dec 2024 18:10:31 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Dec
 2024 10:10:31 -0800
Message-ID: <7fa714e0-b9db-45a4-a7c4-118cf21dc590@quicinc.com>
Date: Thu, 12 Dec 2024 10:10:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] drm/panel: add Raydium RM67200 panel driver
To: Sebastian Reichel <sebastian.reichel@collabora.com>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andy Yan <andyshrk@163.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <kernel@collabora.com>
References: <20241210164333.121253-1-sebastian.reichel@collabora.com>
 <20241210164333.121253-3-sebastian.reichel@collabora.com>
 <2cbbc5d6-2d6b-4afe-a0ef-7f59d28724dc@quicinc.com>
 <2kfapf6iolb65g3kss2hulwpqiczyyk6vvv37pqthm7o625umf@vuo7saus5kcy>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <2kfapf6iolb65g3kss2hulwpqiczyyk6vvv37pqthm7o625umf@vuo7saus5kcy>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Wa0Ju1jR_y0qDp3vsQHUignnVGZZ_BJG
X-Proofpoint-GUID: Wa0Ju1jR_y0qDp3vsQHUignnVGZZ_BJG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=925 phishscore=0 adultscore=0
 suspectscore=0 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120129
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



On 12/10/2024 2:41 PM, Sebastian Reichel wrote:
> Hello Jessica,
> 
> On Tue, Dec 10, 2024 at 09:45:09AM -0800, Jessica Zhang wrote:
>> [...]
>>> +static const struct raydium_rm67200_panel_info w552793baa_info = {
>>> +	.mode = {
>>> +		.clock = 132000,
>>> +		.hdisplay = 1080,
>>> +		.hsync_start = 1095,
>>> +		.hsync_end = 1125,
>>> +		.htotal = 1129,
>>> +		.vdisplay = 1920,
>>> +		.vsync_start = 1935,
>>> +		.vsync_end = 1950,
>>> +		.vtotal = 1952,
>>> +		.width_mm = 68, /* 68.04mm */
>>> +		.height_mm = 121, /* 120.96mm */
>>> +		.type = DRM_MODE_TYPE_DRIVER,
>>> +	},
>>> +	.regulators = w552793baa_regulators,
>>> +	.num_regulators = ARRAY_SIZE(w552793baa_regulators),
>>> +	.panel_setup = w552793baa_setup,
>>
>> Just curious, will there be other panels with different regulators and init
>> commands added for this driver in the future?
> 
> I don't know any other RM67200 based panels. But the init sequence
> contains lots of vendor specific registers and I'm pretty sure it
> is specific to the W552793BAA. I put the regulators into the panel
> specific section, because the datasheet for the RM67200 specifies
> slightly different ones than the w552793baa datasheet. Thus I expect
> that other displays might have slight differences.

Ack, thanks for clarifying.

In that case,

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> 
> Greetings,
> 
> -- Sebastian

