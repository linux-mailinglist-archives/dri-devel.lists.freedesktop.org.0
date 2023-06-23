Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E442F73C4EB
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 01:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 866AD10E6D1;
	Fri, 23 Jun 2023 23:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6870110E6D1;
 Fri, 23 Jun 2023 23:47:45 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35NNbGgC012691; Fri, 23 Jun 2023 23:47:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=NdumVFG0UxTGtv9SjRebHqegowG7qYHciwzHb3gBfsA=;
 b=OOftGYfTx19hwBRU/vu39ot5x26YexLRSnOE6LGmVeV/1E6cTjAisdxPRr6UXXfjfaDJ
 es2VvAx8vncQD/ILghm/ruy44H3NGotyOJrMllyEoj0AwtjtKwew6JBxfFNnyLAKoLWz
 7+UD76uK7zrgO0mFzZK+vM12Qki3Yb616qXYgIVxlWwGYe8aaecndXO5m8xTHY+40rOq
 7b+KFfYZiY4gNIV+1izi4CRxVoZSES6VQrbuaBupoMKtMZax2A/bNYUybL22wa+n7dcp
 Y4AIQPFC+ikvYhiTHcsOXfCVlxtppmnmQx+qGZWj8fhCQGdIUBk6w4RTiTHR7j0UZPJV tQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rdfb18r0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Jun 2023 23:47:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35NNlYI6016643
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Jun 2023 23:47:34 GMT
Received: from [10.110.61.170] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 23 Jun
 2023 16:47:33 -0700
Message-ID: <a0ef6cda-3f84-2294-4b38-0c7e5c08179a@quicinc.com>
Date: Fri, 23 Jun 2023 16:47:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/msm/dsi: Document DSC related pclk_rate and
 hdisplay calculations
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <20230619210647.867630-1-dmitry.baryshkov@linaro.org>
 <e9d5876a-3113-8c79-c2aa-e1ad175f0d84@quicinc.com>
 <b632e52d-7b86-9f5a-913a-aace26d9a039@linaro.org>
 <c2f632e7-8302-a77f-fc61-ccda3b5a8aac@quicinc.com>
 <eqdu44xcd6qdrmxcdr44dfcliydz6q4oombghjg6ptlcbxf22v@uhqnhnlv6gxi>
 <6e2ded6a-63a9-d32a-7a2f-67d3c72b1aa2@quicinc.com>
 <gpxqh6mu5dora7ul4agaflmzqiq7ps6j2dic3zj2ygvp7dsori@lnbnexnbqthg>
 <a3ce94a4-8e5b-427c-28ad-1bfad041d097@linaro.org>
 <gtbpo6o255z3wb5veapjf4z2gasf6sjqdswqxxgpcwtkxaa6qk@dgkopjxs47uz>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <gtbpo6o255z3wb5veapjf4z2gasf6sjqdswqxxgpcwtkxaa6qk@dgkopjxs47uz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 40LnioeA3bV3l3_b4bXlSL1y_r4fSvB8
X-Proofpoint-GUID: 40LnioeA3bV3l3_b4bXlSL1y_r4fSvB8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-23_12,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306230215
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/23/2023 1:18 PM, Marijn Suijten wrote:
> On 2023-06-23 23:10:56, Dmitry Baryshkov wrote:
> <snip>
>>>> There is no confusion between what was said earlier and now.
>>>>
>>>> This line is calculating the number of pclks needed to transmit one line
>>>> of the compressed data:
>>>>
>>>> hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
>>>>
>>>> msm_dsc_get_bytes_per_line() is calculating the number of compressed
>>>> bytes as it uses the target bits_per_pixel
>>>>
>>>> 126 	 * @bits_per_pixel:
>>>> 127 	 * Target bits per pixel with 4 fractional bits, bits_per_pixel << 4
>>>> 128 	 */
>>>> 129 	u16 bits_per_pixel;
>>>>
>>>> (like I have said a few times, hdisplay is perhaps confusing us)
>>>>
>>>> If you calculate the bytes this way you are already accounting for the
>>>> compression, so where is the confusion.
>>>>
>>>> The pclk calculation does the same thing of using the ratio instead.
>>>
>>> This is not answering my question whether the ratio for pclk calculation
>>> should also be adjusted to account for widebus.  And if the ratio is
>>> fixed, why use a fixed factor here but the ratio between
>>> src_bpp:target_bpp here?  It only adds extra confusion.
>>
>> Wide bus is dicussed separately. I think the question you are trying to
>> ask is "why are we not using msm_dsc_get_bytes_per_line() in
>> dsi_adjust_pclk_for_compression()?"
> 
> I have asked that question before, and the answer was something
> incomprehensible.  But indeed, it would look more natural if
> dsi_adjust_pclk_for_compression() replaces:
> 
>      int new_hdisplay = DIV_ROUND_UP(mode->hdisplay * drm_dsc_get_bpp_int(dsc),
>          dsc->bits_per_component * 3)
> 
> With:
> 
>      int new_hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(dsc), 3);
> 
> Which is the same value as we have here.
> 
> And then it becomes more clear how widebus affects this calculation.
> 
> - Marijn

Ok, I finally got your question I think. That "why don't we account for 
widebus in the pixel clock calculation but only for calculating pclk 
cycles for REG_DSI_CMD_MDP_STREAM0_TOTAL"

Even though DPU shall transmit 48 bits worth of data , DSI will be able 
to consume only one uncompressed pixel worth of data. Thats the rule.

Hence even though we are able to account for widebus in the 
stream0_total to indicate DPU's increased data transfer rate with 
widebus, since DSI is still going to consume only one uncompressed pixel 
worth of data, we can only scale the pixel clock with compression ratio.

Hope that clarifies it.
