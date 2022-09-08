Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B6A5B2669
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 21:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C9E110E4E2;
	Thu,  8 Sep 2022 19:05:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D38EF10E661;
 Thu,  8 Sep 2022 19:05:46 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 288IM19P000550;
 Thu, 8 Sep 2022 19:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=gxGsUVrCMGC5Rcb+YWi5QDc9t1O+SYvNmgpTkxcxaI8=;
 b=dKQ/+tMeWv7s7VAu6WJmJCWwi2Fsrub1uVCJwxtiGyxyxymLRWbRw8pCCx8oUV18mqor
 SgfV8qNdZJg4fwXsQ7Sgy68DSGBApkwUBsMFeqc242jyJv9hswhVkpCCfVDg7yzxnwmL
 QUkB0n/pAz4K8nD/N3S5Ve402IBiNHTqRRFINTR/a5eaVanrmhnuNOTcxBbAZ+cNIV/x
 wNsr52rWe7emphwwISWmwiIgrG+1UaUeaW1uA571MCMpqt2/tQggkQ3ulrnkWt6rL7ai
 Y5Q/ZCTA5cGNLJKVi43brA+r9BLQKzuN86kStUGlPx1S4YPRj171/6P72VsK5YkJEoej nA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jfcjkj0vg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Sep 2022 19:05:43 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 288J5g3c015995
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 8 Sep 2022 19:05:42 GMT
Received: from [10.111.169.242] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 8 Sep 2022
 12:05:40 -0700
Message-ID: <03430a35-b72c-3201-72b7-07f7c33138dd@quicinc.com>
Date: Thu, 8 Sep 2022 12:05:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH 2/3] drm/msm: filter out modes for DSI bridge having
 unsupported clock
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <1661830389-22439-1-git-send-email-quic_abhinavk@quicinc.com>
 <1661830389-22439-3-git-send-email-quic_abhinavk@quicinc.com>
 <9fa2fc18-9cbf-6f21-f850-68ce2b0331a4@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <9fa2fc18-9cbf-6f21-f850-68ce2b0331a4@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: xA3X0JEqmudhjdQhn30gCwdg8HW9cwT9
X-Proofpoint-ORIG-GUID: xA3X0JEqmudhjdQhn30gCwdg8HW9cwT9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-08_11,2022-09-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209080068
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
Cc: dianders@chromium.org, dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 seanpaul@chromium.org, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry

On 9/8/2022 7:46 AM, Dmitry Baryshkov wrote:
> On 30/08/2022 06:33, Abhinav Kumar wrote:
>> DSI interface used with a bridge chip connected to an external
>> display is subject to the same pixel clock limits as one
>> which is natively pluggable like DisplayPort.
>>
>> Hence filter out DSI modes having an unsupported pixel clock
>> if its connected to a bridge which is pluggable.
>>
>> Ideally, this can be accommodated into msm_dsi_modeset_init()
>> by passing an extra parameter but this will also affect non-dpu
>> targets. Till we add the same logic for non-dpu chipsets, lets
>> have this as a separate call.
> 
> I think this makes DP/DSI depend too much on the DPU and DPU internals. 
> Can we instead use clk_round_rate() in the .mode_valid in DSI/DP/HDMI 
> drivers in order to check that the requested rate can be achieved?
> 

Just to update here what we discussed offline.
Even if we do implement the clk_round_rate(), for the pixel clk it will 
trickle down to the PLL's limits.

This is within the PLL's limits so it wont effectively filter out the 4k 
mode.
