Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E45C9B3FC11
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 12:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B834410E652;
	Tue,  2 Sep 2025 10:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iJa1aZtN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCBC10E650
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 10:19:20 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822RrMq022018
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 10:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 br24zZfPUMh2y5hphW6eSZrx2KUZEQPgg53oVJYo2X8=; b=iJa1aZtNGpYUsLtH
 m1ASUdi9WGVZUi0Z49LkP+EvwspangHxNaWLIMdnNHvetGnlp4ED/YlZPhZRziSE
 ZwHP2SWGpvO5791IK5bvAGBDV2yr6OPvPIiFQ+mTOaBT7xDmhxLEryuErswaUDGr
 BcZ/QGtbAu8UnRYzUZqwJ71NT66l682265rzx9lPYlkC9aOUvX39Geexba7Z0l/L
 GhzZy02uYiaqenl8frn7LcCDeflWRQtQR602svxMh/JV1ASRE3rNaixMVqsDg4SR
 C6d0yZqMpy2R3wrQXQFyiCcxwYJMZDjP+4BjoTnAmtNhp6Vtye8PaAque6jQ63v3
 xVTv5A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp7kd7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 10:19:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-24afab6d4a7so18271135ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 03:19:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756808358; x=1757413158;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=br24zZfPUMh2y5hphW6eSZrx2KUZEQPgg53oVJYo2X8=;
 b=mfEQfWdqIMKrVIfVd19Vmt1I77FjFTSX/fmzFoWXUoYfYWGXegVotiBtVC6hN+KaA7
 QZULWN8KG6aabPOmhIms4T3Wgpw9ez/oNh/IRoiUgkTAC9UIk/c/APF2QKWFzVpvjG+4
 VhAAHBzsaHdXB1w9/gLM3vOVoRFTlJoO4CkkiYxL51JgNca7N1W1q5zR4L+CxmMjh/aS
 7iFh8otXU+gvH2XCMJRE6h61CcDaVcjsdkH+lN6UW5EPpYie7pXfJ70pFHz2+Hmz/WV8
 u7rNanAKpFgyt/wpmm2XVIQ1Q5OR/YQpQFLEQWHyxJwS/QxjrFTpddrsUAac0MwVpyhr
 ozuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKXjZmpvW/yY5u7I3R+YoeSmF6YPWbDpVP+21nwdLQCc7LerRVY1P+MI7mlyDdbp2pXg4RBVVqvFk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9T2H9RFzCIbq5IiE0bh63+hoWx2BQDpyVZ7n09IS5AZo/5awo
 w9DkTB6x4f5ko0MtWvVE82/SMIqBvgCQvAaBK3QlA5ZAdDvp/kNTWeqyGZYCj5NWyMDAMz8VxzD
 lvPcQPRUn1+8dJLBpGhNKH6PnMEHP1Lor2kbIZIh1znGCiIOjOuuK7CCkHl7o/Ds+OrPO+f8=
X-Gm-Gg: ASbGncvfTq7b0d4ExrFlT+k2YKp5fal5/SovhMiVGN3GR+Ey3OdVlZI9dG1GUYUqVxk
 D2yMuH00P2qOx7crT+4gJT1Br6D3izrIE9v0NMADcVUW6YVNfqcuHDCAsnxvkLWXibaJRuB4sQ6
 D7DJxgy1Ze+xY/UsvuGusWjKmVGA5MOvZIboZhiqCgyAhd7+TNXgY0xxXfXRCfCkr7GlSGq2MJD
 SdrwpUc0VSBANCPwYVoCNbKLu4SjbCvI/fdXvVliaeRzVqkm5DvKZXeOa6X99/nvqDrtCQC8uuj
 oRRu4ZxH0gSzDUPrdTb1IQINeOjcepH558OIEGYxDX4IQ6zw9tDJAVqLB7HuUWcoWY4RiLHD1d0
 6BsVecoFCLOItPSJpv0RmbVuxWg6Z6g==
X-Received: by 2002:a17:903:2ca:b0:246:2afa:4cc with SMTP id
 d9443c01a7336-24944accdccmr125618995ad.42.1756808357945; 
 Tue, 02 Sep 2025 03:19:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExZaQpujI+DBeEgb+OY+oIAOGhyp2Ov4L53Do99REhENCXH8YvVx3wL9zFdzC8VQf9tej07A==
X-Received: by 2002:a17:903:2ca:b0:246:2afa:4cc with SMTP id
 d9443c01a7336-24944accdccmr125618675ad.42.1756808357534; 
 Tue, 02 Sep 2025 03:19:17 -0700 (PDT)
Received: from [10.133.33.25] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-249065899f3sm125975505ad.113.2025.09.02.03.19.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 03:19:17 -0700 (PDT)
Message-ID: <d7141b57-fa3c-49ce-9830-8310a58b9581@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 18:19:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/38] drm/msm/dp: remove cached drm_edid from panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-1-01faacfcdedd@oss.qualcomm.com>
 <otmy4kttxflsxkvacwdsqynck4nqeww7jsxaq2xwjtlooxnhvx@gmpezdliskck>
 <5b142910-81e7-462d-8933-70705334ef0a@oss.qualcomm.com>
 <yarnaujunszlfrbduakodv7n63wjgh6og3t4qowhu3n6tz6fmn@4kb4crd5rqq7>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <yarnaujunszlfrbduakodv7n63wjgh6og3t4qowhu3n6tz6fmn@4kb4crd5rqq7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vtwN1Flea0xaxMHf2DE9AErYYeA4TWS5
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b6c4a7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=PD6ve5_SbK8zx8cgC-cA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: vtwN1Flea0xaxMHf2DE9AErYYeA4TWS5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX+XrRI6Wr+9xw
 EpuWgf5LR7XPXy/PtIUZrx0AwLT/AW4uMPnBNFjf6ALYI/Juib5PfaIa6xButKebAd1Qd+F7XAo
 UcPaHB8FCBRNInFwqj1X3opnd8yXxhXOXM5Jk0YmEaadKUteXGXf1ZaB/69RjCMhvcdq+ODP/HJ
 D6kjYqg9Ym9yLjDc62Yud+HcqtU3SRP2A6jWLDbWjzrbnHcoTB9RbMe9e+LuNwaexST1p6zv1c4
 GBKrNbla+9Y3vVBCAyrqIKPYkC06LzJ3llCn4fgMgv36Bq/lmQFKbmJp1Ib5G1NQMCSoaQh8dgQ
 ewvheCQSuFoy9r68oSXJHzQXg2/ZOF4taReiLEXeXP5eXY7BuCj9vosk8gmyvzQjfu4aWoARCvL
 POKYfxn6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001
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



On 9/2/2025 5:36 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 02, 2025 at 04:42:18PM +0800, Yongxing Mou wrote:
>>
>>
>> On 8/26/2025 12:41 AM, Dmitry Baryshkov wrote:
>>> On Mon, Aug 25, 2025 at 10:15:47PM +0800, Yongxing Mou wrote:
>>>> The cached drm_edid in msm_dp_panel was redundant and led to unnecessary
>>>> state management complexity. This change removes the drm_edid member from
>>>
>>> Please see Documentation/process/submitting-patches.rst on how to write
>>> commit messages. Please use imperative language instead of describing
>>> the changes.
>>>
>>> THe patch LGTM.
>>>
>> Thanks, will update it in next version. Since the HPD refactor series are
>> unlikely to be merged soon. Can I separate out some patches from the MST
>> series that don't have dependencies and send them individually to make it
>> get applied? This would help reduce the number of the MST series.
> 
> Yes, of course. Please keep version number monothonic for those patches
> (e.g. by telling b4 that it should start from v4).
> 
Sure. Thanks,  I want to confirm whether the patches should be sent 
individually or grouped into a series? They seem to be logically 
unrelated. I was originally planning to send each one separately.>>
>>>> the panel structure and refactors related functions to use locally read
>>>> EDID data instead.
>>>>
>>>> - Replaces msm_dp_panel_read_sink_caps() with msm_dp_panel_read_link_caps()
>>>> - Updates msm_dp_panel_handle_sink_request() to accept drm_edid as input
>>>> - Removes msm_dp_panel_get_modes() and drm_edid caching logic
>>>> - Cleans up unused drm_edid_free() calls
>>>>
>>>> This simplifies EDID handling and avoids stale data issues.
>>>>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_display.c | 28 +++++++++++++++-------
>>>>    drivers/gpu/drm/msm/dp/dp_panel.c   | 47 ++++---------------------------------
>>>>    drivers/gpu/drm/msm/dp/dp_panel.h   |  9 +++----
>>>>    3 files changed, 26 insertions(+), 58 deletions(-)
>>>>
>>>
>>
>>
> 

