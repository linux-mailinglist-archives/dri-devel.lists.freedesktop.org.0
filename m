Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D176080AD
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 23:19:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 006AF10E2A3;
	Fri, 21 Oct 2022 21:18:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB0310E25D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 21:18:52 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29LIiS0M031107;
 Fri, 21 Oct 2022 21:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=iSfB6CFrLnDJogdTTq89EiJJa3m0+y1c9gv1TDJFjvg=;
 b=JHDyZb31TRFwJzdoXbQXrP1FzKU9SGL3XasmDj1LWEohW/gxyx8D9GhpTMN6zp/a+BS4
 qiUnClpQR2mGie5UHapHJPnRu6OgapmswPbm5WFYVXAqV9hRLwDqL+qEO+4LLMXuP1RT
 l0lrJp3wlW64mkZF0stWOCe8A6lMxNPxpeOUnJ04j1j+2L+ujeTf7QxwI9zBxHoA0HD6
 yL4/pcytlnd0RsweU1HnV9w7LXoqg/jh1xcLqqESWa4ZJITfvN2RgCN1jteMWjgsYjt9
 HpFXb2Kv3TuHZ1PqI8sNpCnFDVscPvriW8VBYg15Jh0YqNQoe0iar0J3QpmTw9/zBN2j bA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kb2c653y8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Oct 2022 21:18:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29LLIKKt012378
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Oct 2022 21:18:20 GMT
Received: from [10.111.175.17] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Fri, 21 Oct
 2022 14:18:18 -0700
Message-ID: <e6bc800b-2d3b-aac9-c1cb-7c08d618fc8e@quicinc.com>
Date: Fri, 21 Oct 2022 14:18:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/edid: Dump the EDID when drm_edid_get_panel_id() has
 an error
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>, <dri-devel@lists.freedesktop.org>
References: <20221021130637.1.I8c2de0954a4e54e0c59a72938268e2ead91daa98@changeid>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221021130637.1.I8c2de0954a4e54e0c59a72938268e2ead91daa98@changeid>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: sHNLh55rX_DR4gs-fYbux6RV15qG-tpi
X-Proofpoint-ORIG-GUID: sHNLh55rX_DR4gs-fYbux6RV15qG-tpi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-21_04,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 clxscore=1011 impostorscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 mlxlogscore=729
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210210124
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug

On 10/21/2022 1:07 PM, Douglas Anderson wrote:
> If we fail to get a valid panel ID in drm_edid_get_panel_id() we'd
> like to see the EDID that was read so we have a chance of
> understanding what's wrong. There's already a function for that, so
> let's call it in the error case.
> 
> NOTE: edid_block_read() has a retry loop in it, so actually we'll only
> print the block read back from the final attempt. This still seems
> better than nothing.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Instead of checkinf for edid_block_status_valid() on the base_block, do 
you want to use drm_edid_block_valid() instead?

That way you get the edid_block_dump() for free if it was invalid.

> ---
> 
>   drivers/gpu/drm/drm_edid.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 47465b9765f1..d63e26ec88b1 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2721,6 +2721,8 @@ u32 drm_edid_get_panel_id(struct i2c_adapter *adapter)
>   
>   	if (edid_block_status_valid(status, edid_block_tag(base_block)))
>   		panel_id = edid_extract_panel_id(base_block);
> +	else
> +		edid_block_dump(KERN_NOTICE, base_block, 0);
>   
>   	kfree(base_block);
>   
