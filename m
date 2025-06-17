Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB27ADC76F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 12:04:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6009610E5BB;
	Tue, 17 Jun 2025 10:04:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XFZ9z+LD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6B210E5BB
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 10:04:10 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H85Rru010163
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 10:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9qQ6chZxwb0kaN95EAupZIbA55eTV4KovirnoXg/Nr0=; b=XFZ9z+LD0aFsm4Xp
 obIib7tpEfq3obX3cs0RL2FUzgbH9XugZVk8H1XLHdRXvdQlXTlv75B7Zvd5L7NS
 r5qTmdbsm1nK49PNS6ozQfHaLvEOgsAPnEbtfBPYZpbo6LPUMxCZxv9zMeRwI3OQ
 3XAiJJCdgz28UnaCA/GldP5dh5PcMbi8hcJQVX2Hh4frDguuYx9H+hClVyaFTult
 yoNAE+KcB2WWsJkuulW9kJ0ZdBoY8A8kMWENtFhmLFU04oJpYIe/AjYM8HV08IpE
 fo8jSEobGQDnLG8iBtxh56XsizNz3iKer3w7e4AwRgu7g0sWdd6scS+YU4xgWDZQ
 jnAk6w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp5pfn6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 10:04:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7d38f565974so1150150285a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 03:04:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750154649; x=1750759449;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9qQ6chZxwb0kaN95EAupZIbA55eTV4KovirnoXg/Nr0=;
 b=kZxS3tawkFP1+KmlY+5h48LluLQQWYmsbDi9MdlGyXpH2uh5Odjr7Fc3GGqiz+JzZU
 UcvxbB97rGTh5vpNECsrXZFi66W0XtFeOGUZ+NWo3Nq91yUCycICk8kXJHV4XuxLUH3N
 R7mJFGhLQCyDo9i5KZ2bAanfa7zPN8nzJ13L80YSprkwjISvZC9DkSfpxFzGuj+YqjDO
 j2EvS4TAQwPdbqfjQ0Dg1asOAlfemg3cynep1Z1ZYMOMoZkPbSwtoEEpreZp5kdK2c+k
 02AG0dK7GFzUJ5xO9t6LzcyVcc1xVasf16pRDRbDt/6BylcnJx11+o5R+/4qmeCdXooz
 JhYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkZ3dI5VYIOCXCnQrhX8Ntia8fruLUuha3CUecxo/bcqcsbTbXfsCT+Kpz7k6cB1GytiYO7vDfnNI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIf42/11kVPqW7dSZ6GsP2xyMIjTpIel39EUsR8/4frWXj8b9X
 NYqoD+6BJT7JxUxTTpHEzo47BNFqv1gdPX81jQ+s9IMd4Vj7DgBVbTi6FvYmbuekosiisxllyZG
 oYFlOSt/UBMJHeDVVpmbBvnK8fLSOSqSDDWt2oTVNbP5EgoVWE8NEnRhDIIX8rR+TRjQN+7s=
X-Gm-Gg: ASbGncs9MEjuvr0+t/vDf36c2ted9A1bhxMN93tujZ5U7IChcGGf1wbyaZ8AM+iYO7+
 hjqA067WrN4o8eB+MSz3BN505rDQ+Mbt6aumBw/TOIHqvp7KNIMLApqlR5KVt8Tdm7ag6QZ9vgj
 jsDn8QE2Td7UGZv41Q3xSXXR+mQKf5gxwAmq3u/oSPCJcyBDwzZwv2S9+3zljqrSmonuLUjWR1U
 uPlKULMlHFBGU8Q51SDOKZYUeGmWdCeTMFepF7mvMpL8n+tlk2e/Pa72bzyl4oc6mIxqwaz6n3m
 HwE06p16WdjtqUjfnD0UnIHqJ/8IhBoD4tUDnqwTwDPImoxqLnJDp7xSB7deR+9yWLobZLAsU3U
 IDwYLjNPPbLUn42L2/xYVszorWktULy4ODJLvyoAe0i/gqautFUGyR99Ydx3CnzCnC8tyjIhEO5
 4=
X-Received: by 2002:a05:620a:84c5:b0:7d3:904a:30c5 with SMTP id
 af79cd13be357-7d3e03b10c8mr316439985a.4.1750154648466; 
 Tue, 17 Jun 2025 03:04:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvna9IJ6ePvmIjs2uDIO38vWP2NflNsfddbUTeI2csRoT/3ReiocEENEsqlHc9sjbmCU22Tg==
X-Received: by 2002:a05:620a:84c5:b0:7d3:904a:30c5 with SMTP id
 af79cd13be357-7d3e03b10c8mr316434085a.4.1750154647952; 
 Tue, 17 Jun 2025 03:04:07 -0700 (PDT)
Received: from ?IPV6:2001:14bb:c7:3ae3:d1c0:258a:276f:153c?
 (2001-14bb-c7-3ae3-d1c0-258a-276f-153c.rev.dnainternet.fi.
 [2001:14bb:c7:3ae3:d1c0:258a:276f:153c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32b3307ae42sm18230001fa.43.2025.06.17.03.04.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jun 2025 03:04:07 -0700 (PDT)
Message-ID: <4d8c89be-2589-40f9-841e-27cb7b1040de@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 13:04:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 29/38] drm/msm/dp: add connector abstraction for DP MST
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
 <20250609-msm-dp-mst-v2-29-a54d8902a23d@quicinc.com>
 <fcmbo5qhiifo3erfnejgtu6es2nmeo3c5r4plbutj23gdtydng@xy3mqkhbsjia>
 <1c09642b-7a0c-4073-97d3-f6f6cddbde83@quicinc.com>
 <7r7vdbeols4suew7rlvogft4b5lmg22osipydxzkubxsychewi@lpyj6vmoapzb>
 <19895a7d-4f30-44f1-bc5f-45d200666860@quicinc.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <19895a7d-4f30-44f1-bc5f-45d200666860@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NVovmgaWNsP33KgKp-de9xardKFUXDJG
X-Proofpoint-ORIG-GUID: NVovmgaWNsP33KgKp-de9xardKFUXDJG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA4MSBTYWx0ZWRfX+boGGvrI7/KG
 3faSE4YV9/k6VjHhFeaPPqsPnnKCHn0RhpsamvBkeuyepdF6+gcPoR95ygr+6G96hxPHUAKyK79
 G2R+JMk6z4LXSY5wJJR9wogUks83kSU0y+TvS5X9xtzCESbepXQc9HJlnWZFxt5q4nkcfnv3bZv
 8i8Hknrw3moCNxDOuAtW90b54crtF2g7IPVIJofbXyUneRTkSDWIyDF+bwLH+yBhSAyUPrqM4Ub
 ULpmC8zooGjzt/UJvx4Fqy4a+iDtEXGDYSVP9KwyCUTPTA2CsfOBij+uaeo4U02hWIBAWTsZEDE
 QTAJM9Qh0G1SoIJBxhHyea4QHoC0YDK5/WO74m+iPhnWTX0T77j7S+9nj/R12W9mb1jhEFEShPy
 e7k4aG8qrGYHK0Pap4ShZ3t8RiP9lLkaKIvhab1fSERtJnGq+xyHLT5FZmwB5yPkGcyUa95e
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=68513d9a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=WoTifGf_cgNeg6NlKB0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170081
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

On 17/06/2025 10:52, Yongxing Mou wrote:
> 
> 
> On 2025/6/16 21:48, Dmitry Baryshkov wrote:
>> On Mon, Jun 16, 2025 at 08:43:40PM +0800, Yongxing Mou wrote:
>>>
>>>
>>> On 2025/6/9 23:51, Dmitry Baryshkov wrote:
>>>> On Mon, Jun 09, 2025 at 08:21:48PM +0800, Yongxing Mou wrote:
>>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>
>>>>> Add connector abstraction for the DP MST. Each MST encoder
>>>>> is connected through a DRM bridge to a MST connector and each
>>>>> MST connector has a DP panel abstraction attached to it.
>>>>>
>>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>>>>> ---
>>>>>    drivers/gpu/drm/msm/dp/dp_mst_drm.c | 515 ++++++++++++++++++++++ 
>>>>> ++++++++++++++
>>>>>    drivers/gpu/drm/msm/dp/dp_mst_drm.h |   3 +
>>>>>    2 files changed, 518 insertions(+)
>>>>
>>>>> +
>>>>> +static enum drm_mode_status msm_dp_mst_connector_mode_valid(struct 
>>>>> drm_connector *connector,
>>>>> +                                const struct drm_display_mode *mode)
>>>>> +{
>>>>> +    struct msm_dp_mst_connector *mst_conn;
>>>>> +    struct msm_dp *dp_display;
>>>>> +    struct drm_dp_mst_port *mst_port;
>>>>> +    struct msm_dp_panel *dp_panel;
>>>>> +    struct msm_dp_mst *mst;
>>>>> +    u16 full_pbn, required_pbn;
>>>>> +    int available_slots, required_slots;
>>>>> +    struct msm_dp_mst_bridge_state *dp_bridge_state;
>>>>> +    int i, slots_in_use = 0, active_enc_cnt = 0;
>>>>> +    const u32 tot_slots = 63;
>>>>> +
>>>>> +    if (drm_connector_is_unregistered(connector))
>>>>> +        return 0;
>>>>> +
>>>>> +    mst_conn = to_msm_dp_mst_connector(connector);
>>>>> +    dp_display = mst_conn->msm_dp;
>>>>> +    mst = dp_display->msm_dp_mst;
>>>>> +    mst_port = mst_conn->mst_port;
>>>>> +    dp_panel = mst_conn->dp_panel;
>>>>> +
>>>>> +    if (!dp_panel || !mst_port)
>>>>> +        return MODE_ERROR;
>>>>> +
>>>>> +    for (i = 0; i < mst->max_streams; i++) {
>>>>> +        dp_bridge_state = to_msm_dp_mst_bridge_state(&mst- 
>>>>> >mst_bridge[i]);
>>>>> +        if (dp_bridge_state->connector &&
>>>>> +            dp_bridge_state->connector != connector) {
>>>>> +            active_enc_cnt++;
>>>>> +            slots_in_use += dp_bridge_state->num_slots;
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    if (active_enc_cnt < DP_STREAM_MAX) {
>>>>> +        full_pbn = mst_port->full_pbn;
>>>>> +        available_slots = tot_slots - slots_in_use;
>>>>> +    } else {
>>>>> +        DRM_ERROR("all mst streams are active\n");
>>>>> +        return MODE_BAD;
>>>>> +    }
>>>>> +
>>>>> +    required_pbn = drm_dp_calc_pbn_mode(mode->clock, (connector- 
>>>>> >display_info.bpc * 3) << 4);
>>>>> +
>>>>> +    required_slots = msm_dp_mst_find_vcpi_slots(&mst->mst_mgr, 
>>>>> required_pbn);
>>>>> +
>>>>> +    if (required_pbn > full_pbn || required_slots > 
>>>>> available_slots) {
>>>>> +        drm_dbg_dp(dp_display->drm_dev,
>>>>> +               "mode:%s not supported. pbn %d vs %d slots %d vs 
>>>>> %d\n",
>>>>> +               mode->name, required_pbn, full_pbn,
>>>>> +               required_slots, available_slots);
>>>>> +        return MODE_BAD;
>>>>> +    }
>>>>
>>>> I almost missed this. Could you please point me, do other drivers
>>>> perform mode_valid() check based on the current slots available or not?
>>>> Could you please point me to the relevant code in other drivers? 
>>>> Because
>>>> it doesn't look correct to me. The mode on the screen remains valid no
>>>> matter if I plug or unplug other devices. The atomic_check() should 
>>>> fail
>>>> if we don't have enough resources (which includes slots).
>>>>
>>> Currently, I haven't found other drivers checking available slots during
>>> mode_valid(). Intel will check the PBN in here.
>>
>> pointer? Also, what do AMD and nouveau do?
>>
> Hi,here is the link:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/ 
> drivers/gpu/drm/i915/display/intel_dp_mst.c?h=v6.16-rc2#n1504
> 
> nouveau just check the mode_rate and ds_max_dotclock in MST connector 
> mode_valid().
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/ 
> drivers/gpu/drm/nouveau/nouveau_dp.c?h=v6.16-rc2#n527
> 
> The AMD driver seems much more complex, and I can't understand all the 
> logic. It looks like AMD always tries to enable DSC and use the smallest 
> possible bandwidth.
>>> This condition can help us
>>> in the following case:
>>>
>>> Assume two downstream devices both support 4K 60Hz 10-bit. In MST 
>>> mode, when
>>> the first device occupies the 4Kx60Hzx10bit mode, the remaining 
>>> bandwidth is
>>> insufficient to support the same mode for the second device.
>>>
>>> If we check the slots in mode_valid(), the second device will reject the
>>> 4Kx60Hzx10bit mode but accept 4Kx30Hzx10bit. However, if the check is 
>>> done
>>> in atomic_check(), the second device will display a black screen 
>>> (because
>>> 4Kx60Hzx10bit is considered valid in mode_valid() but failed in
>>> atomic_check()).
>>
>> If we filter modes in mode_valid(), then consider the following
>> scenario: we plug monitor A, plug monitor B, then unplug monitor A. At
>> this point we only have monitor B, but it has all modes filtered when A
>> has been plugged. So, it is impossible to select 4k@60x10, even though
>> it is a perfectly valid mode now.
>>
>> Also, with the check happening in the atomic_check() the user will not
>> get the black screen: the commit will get rejected, letting userspace to
>> lower the mode for the second monitor.
>>
> Oh, this scenario is indeed just as you described. So let's remove this 
> part of the logic and let userspace decide the final mode.

Ack. I think all three major drivers don't perform a check against 
currently allocated slots.

>>>>> +
>>>>> +    return msm_dp_display_mode_valid(dp_display, &dp_display- 
>>>>> >connector->display_info, mode);
>>>>> +}
>>>>> +
>>>>
>>>
>>
> 


-- 
With best wishes
Dmitry
