Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BD3AEB919
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 15:38:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15AB410EA41;
	Fri, 27 Jun 2025 13:38:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cQj35XqU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9B710EA42
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 13:38:02 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCWYhE018787
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 13:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2QtnvQnfluWMwHt5pv65ScEV4CUxIy5BoKzB2wk7FAQ=; b=cQj35XqUQK8xtpDy
 I8pHTQeVJQY2Vx2y2VgUuIR+nA1JnYfaqf++o1KIYpBKe2DvPMXETHXKC4s0LwOj
 q8ak1N7/MYobBNDuH2WZRB859JJ1+GXlxbPbRUSrmPGwWlkwlzPZNuqMfd4X3lNR
 NTw807OvA43MQoyXGbB2+KuubA3Hn23g/swq3BQwWXaaeh3BY9twYoDEwFBID0Ry
 kAU09bA3kPjGadbweSVR4WDvGRKtbNqc6MaWigcVbtsCvbk5CNJ4nDejZPDOPIva
 kIK7jNukqxP0OqoBFnR1IchI1Qq6SXCMDVuNJSoR2POzCc7lhB6aDON3bxR2Kf+M
 VQ89FQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfx5ahp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 13:38:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d446ce0548so90601385a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 06:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751031480; x=1751636280;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2QtnvQnfluWMwHt5pv65ScEV4CUxIy5BoKzB2wk7FAQ=;
 b=F8Gy4ecLkW3qHJpZji3Mb9KQ1X4yqp8FgwmoilVaF2Av+epGnrxzP8yxpS34r6reHO
 VNFIw8XTMMUZ/YU9DkWe40D1uSuoccTu5HUQ46I0VOXYxyYFax77SApKO2+DsrM3YL/h
 FUCzKfk6WjHjyuu7WfxALEAxvwGcIJetSvrmWK5fKbJV+u8MORwF4W6McXTdUEUeqbVm
 VBPZKf52BGQDYBBVS3Z/B378YE63OF5gL2Ms7JuUD8aarjbxJ4PX8S1HhnowVVdkLcGk
 2aZz1FvmfAx4v1RG3tO3dkDeE9oBO1iPQLNRL8jSMDvjaCtukvzN2xxtobDCnGGJgwUp
 NpPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDHesgNRteQvNs3oeuUAaNISznJHr3k7JQH0l6jGTKry8isba+CMio/zDACCKAKQFaPVPArSvs/xA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyseBi5la9KrBjYcuRq7vfGs+o91DGCSaJCo5DBK7abLCiHH54n
 I63Ili7T6FAtfUYUIT7qHLZrRipVQSUpfRD68SleE/uxnt/3EIpVHTPOEWpzPY5zZ9y26i5WbfL
 W8OZzwcEPmaZ7NCJmazeTgJqr49cJlWMsoJTIehBuw5DC6Vis5LKrLE9E8b7jj9+p/K7nUk0=
X-Gm-Gg: ASbGnctTcU3+y5x06yBHTuMFpz1qJ9HE94HChU4p4oGxD9RCtaMQ8ncfgM7OOleplWL
 B0J4lPzJugNXiHCoQfkawiHaxfERuc8TgDflbsNeBzwTlcOujqKw43C0dhn07p+iJBgUjRK+Tfa
 moZLaMnRpwgkLErt/iD19yRP7lxLXdQF5H7hqamVWYswLp/rYE1QlD7T5JW9aspxEcfHk+Gy1jc
 aRkmghf8zCqKaSpSluxych4lV7ddUK6P2uJ7Z0L7p3C21AfgL8WtdrzCaW23Teh2nYgLdaYyP6I
 2lBTyJ2y8U56GBBWDubAQkJxL/DmRKT/OCZ893j3zg==
X-Received: by 2002:a05:620a:1904:b0:7d3:907f:7544 with SMTP id
 af79cd13be357-7d4439a6584mr493459785a.35.1751031480167; 
 Fri, 27 Jun 2025 06:38:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvL73yf4sU/gW3mguJ2q0llUda4VgDpvmnaVGMd6K090C/8Loa8JscxVRP4J8tuzbwVKrCvw==
X-Received: by 2002:a05:620a:1904:b0:7d3:907f:7544 with SMTP id
 af79cd13be357-7d4439a6584mr493455085a.35.1751031479671; 
 Fri, 27 Jun 2025 06:37:59 -0700 (PDT)
Received: from [10.92.240.160] ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae353c0100fsm125509766b.88.2025.06.27.06.37.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jun 2025 06:37:58 -0700 (PDT)
Message-ID: <6dcf88bc-0bdf-4965-b8af-b881a564d762@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 16:37:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/38] drm/msm/dp: remove dp_display's dp_mode and use
 dp_panel's instead
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-2-a54d8902a23d@quicinc.com>
 <kq6tb2wnte6v5z7uxgzc22kjwcevgvcdluzqbelvnbpbxlkotd@ltlv3u2guj4u>
 <1be2238d-7bb2-4ef9-9c7c-81dab0dcb559@quicinc.com>
 <4jrpa7iyygciuy2k4ydk7cpm5isdrddclljf6gbyvkiqc645tx@idyds4tkstkx>
 <9358a017-81ed-4db7-8e35-955922287c76@quicinc.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <9358a017-81ed-4db7-8e35-955922287c76@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Q035QLNWlHNjaiJYu_BlL-0SeaLUcVMb
X-Proofpoint-ORIG-GUID: Q035QLNWlHNjaiJYu_BlL-0SeaLUcVMb
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685e9eb9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=e5mUnYsNAAAA:8 a=COk6AnOGAAAA:8
 a=QLF5U8kL1nvtC7vkCdQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDExMyBTYWx0ZWRfX0AUXZUp0SgeI
 84mdFZ1FgBzukHBV4J0iT5y4rGZNOZhTNueg0AC+aLdS2O2CKEu28jP5Ukd3QLN4q75Bk0nXohh
 zmOs1sK3H4uTE4EsLnIpKyvu36ENxKUJ4JPCSVQ3ZM+0w0Vu3z+50ZgJXX6SFsupjzEW8TzNJiG
 WxBHGxhhAKGbjec99eQcJ8KKpqOJaDZug54tNZo4rC1Wp6qXS/r2zmaIjULk5eklrjy2chiKmSf
 u4aPJsHgJVhGEdsSaMg7CMaW9SWUS6yESYuI963pGRcftfxa2t7cJ/7hMEeGJkNcY0tI03f/AZK
 /Caocy32JjGec6exoujBzHqy3Nr8Vmtns8rbK6ctKNFYNSWEK9QBZQvAeuXWOJQqJTgSNdTaYqF
 ++XKvIGzCVXx1ZE3tjWdH9nneZPZ2rTHIbYtEGvj3/ihzMAjKeo1DDWxgD+WYdoc/0EafPNl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270113
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

On 27/06/2025 11:40, Yongxing Mou wrote:
> 
> 
> On 2025/6/25 22:03, Dmitry Baryshkov wrote:
>> On Wed, Jun 25, 2025 at 08:34:18PM +0800, Yongxing Mou wrote:
>>>
>>>
>>> On 2025/6/9 20:48, Dmitry Baryshkov wrote:
>>>> On Mon, Jun 09, 2025 at 08:21:21PM +0800, Yongxing Mou wrote:
>>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>

>>> Originally, the drm_mode would be passed in
>>> two stages: from msm_dp_display->msm_dp_mode to dp_panel- 
>>> >msm_dp_mode. Since
>>> in MST mode each stream requires its own drm_mode and stored in 
>>> dp_panel, we
>>> simplified the two-stage transfer into a single step (.mode_set() do all
>>> things and store in msm_dp_panel). Meanwhile we modified the
>>> msm_dp_display_set_mode function to accept a msm_dp_panel parameter,
>>> allowing the MST bridge funcs' mode_set() to reuse this part code.
>>>
>>> The following patches:
>>> https://patchwork.freedesktop.org/patch/657573/?series=142207&rev=2 and
>>> https://patchwork.freedesktop.org/patch/657593/?series=142207&rev=2,
>>> introduce msm_dp_display_*_helper functions to help reuse common code 
>>> across
>>> MST/SST/eDP drm_bridge_funcs.
>>>
>>> If we drop msm_dp_mode from dp_panel and use drm_display_mode, it might
>>> introduce a large number of changes that are not directly related to 
>>> MST.
>>> Actually i think the presence of msm_dp_display_mode seems to 
>>> simplify the
>>> work in msm_dp_panel_timing_cfg(), this patch series we want to focus 
>>> on MST
>>> parts, so would we consider optimizing them later?
>>
>> Sure... But then you have to change two places. If you optimize it
>> first, you have to touch only place. And it can be even submitted
>> separately.
>>
> Understood, that’s indeed the case. I just want to prioritize the MST 
> patch and have it merged first, since it involves changes to lots of 
> files. Thanks~~

I'm sorry, I hit enter too quickly. The MST will not be merged until we 
get DP HPD rework in, that's a prerequisite from my side. So, while that 
is getting sorted out, we can fix minor issues and perform minor 
cleanups, like the checksums or drm_mode refactoring.

-- 
With best wishes
Dmitry
