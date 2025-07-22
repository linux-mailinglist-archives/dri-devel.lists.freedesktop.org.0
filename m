Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8EAB0E45E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 21:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2058110E6F9;
	Tue, 22 Jul 2025 19:47:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hCA7xZXi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B177010E6F9
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 19:47:53 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MF2OnM010113
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 19:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EEzrFntqUpXwmzhEbd6zxsSsOyDtSlkzdmerHqu6YxE=; b=hCA7xZXiYFhwYDKW
 tpltNKSTlmbynKdXCm9Cms+9Wvjo3RSWdQb87B5oNmAVIdJa2k2TPl86UQyhNww7
 JKu66usKv+bpAcrQOi4rhN1xGsnNNV2YGg6PB5/kcs6dMEts5f5WUGIahGWD5b9h
 n9GGNqUT3L4O7wqXQuVszdzA8KwrnGsnNEf3tT5raA0oGqN892TwGQ6mNCD5MzwJ
 4egw2x2BrDZLxomnpL/rxrkjeiAOjn/c59mBVjc688algM4UcKsOiBlzeYyUDPIU
 2dZ9CQfKc60eMSrRxeQ5eCUbeSXe2H9G9GllYR7Yf9P0DVFbYC0U9wQYWCRStsnQ
 Cn57vg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t1a25e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 19:47:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b3928ad6176so5189846a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 12:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753213671; x=1753818471;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EEzrFntqUpXwmzhEbd6zxsSsOyDtSlkzdmerHqu6YxE=;
 b=PvIsspGWmtCN9Cb1YLcOtRhNf39sncpF3u8rEyRiRgIYtMq/oM99n4brvv3FmkQMue
 hSGA1Z6XHMCSpIJK0OJVSom7gHx1sO7dV+CM1zb7PdXFs4spIqA87U2KQ2X9qgpkW96X
 YdN03X0o8ipYE95SigMi5jmp9EkZQWCmz71Izs57jDonPs8Fk7mPj4BAXftjHeVETmat
 my54lvsad9u3VHfdsFHecm2ZoDfa2oBccKCm0VhEkuQzEvUmZpjn0EaTAiZ8thn8B/tL
 b4hrV/ueBSXSf9yDY3AIpMq3ztM1Kjj5yfvYAKPTT6VDd9EH3CyMHVqFADF7syer4AB4
 6Bqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXa5ZMa/mtGXNVgipdAUmIgl1BeXQMMVBRJLkol/hD2e6eoyjAq28/JgUlsH1qYlQMwIoxL29jiP+Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEcAi0QKCa6a5Ql0fH89Fp4WmhuyWY3q5TPDCI/DSR+vrFqRku
 ke2YW7c3TbLlPwEOF8F6aDgwh5RTO2nD56aoz7UHQpsOCaNMHo60tUTZghu4/u8C9xynkvlBwUS
 /g4q8cRyh5F91L5Ogbxh+sFVJ2CzmhLngOR3SZNKsnz+vdh8s+8fv0ByKSLLE9HCAqLDxV0E=
X-Gm-Gg: ASbGnctGTPcYiZmTjbr/7LA35r3kdmVsD0cHtqscbgKqklv+8arQqvBPw/srZ9o0PIU
 Hjmupr0e68mSDPnxKANdUuMmwY3Iu9M8nKeNzd2ppfsF4cuw2enorr6nwdKXGEpv//CmTcgxcC0
 kOD1IIQe5EJ0u3yheK9fj9JFgqhaUP7Vf2fLP9NSENv+LjEGv52GLkQIpm2+H9QPJombXbFKrmY
 mmT/kXMS+p2AjtPk5+XV95RsPjCiytPxh3RTXVf4zBe3OSAO4p6mAGfY9CAQeSbf9OI1YTW8tLB
 Sxvs6EVuzYp41ZHwakE4eLNzPWbfntDBlOaPTgOaK3OGpgoiZOxQv0dlFTmiYshx
X-Received: by 2002:a17:902:ce8e:b0:23e:3164:2bef with SMTP id
 d9443c01a7336-23f98172240mr3021215ad.13.1753213671275; 
 Tue, 22 Jul 2025 12:47:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFU1qOtwmPdcPsJGIhheRiktlJaDiPc1l+Av8pvaEKyMToOna2BedvGFYD8Q4SL4rfvukJv/Q==
X-Received: by 2002:a17:902:ce8e:b0:23e:3164:2bef with SMTP id
 d9443c01a7336-23f98172240mr3020925ad.13.1753213670851; 
 Tue, 22 Jul 2025 12:47:50 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6cfbaesm82160665ad.151.2025.07.22.12.47.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 12:47:50 -0700 (PDT)
Message-ID: <4832a160-344a-4140-a115-d4742f95825b@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 01:17:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/17] drm/msm: a6xx: Refactor a6xx_sptprac_enable()
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-2-9347aa5bcbd6@oss.qualcomm.com>
 <d4b46652-c4d0-44b4-aef5-e8bcf606de06@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d4b46652-c4d0-44b4-aef5-e8bcf606de06@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ghFYNrZHf2sEixgJicvCoGj-hTFerCVh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE3MCBTYWx0ZWRfX/Hr3m0Rn1rIx
 Wgk0QyJNh/JXNqWBU7psI/vW+JDs93Wiuv/HlyboABzzjoy+ThnWcZFRtZLa6cbbjH9GjDInADd
 yjDIvcHx32D/hBSW7OS6weQdLIaKgRtTZgaJ0n78vTEiNsXLmr8rK9Sfrux57YoJOVTnGPgjwGP
 S/6bPYiMvPLC0qX3xF9cvxjTsJJF9q6bnEvPVRBmE0icNQm+FXSvSVZ3pw9z2LboeNpot1v3axt
 01w7eoBOgVtMVjfot6lkwA+boKbZXh88zjyGM+5llQoKf4NyD8+oCroUQKxGuMegQTK+JLBDX+z
 FWD8BcRI3xk5UsDIcYW9wlETryEYqTtKbGRLKbUi3lZFYi+BMB+4kv1OFVfcIWR2YpqvHo7ift5
 YEtFTh4fvNkwJKFRn5F3D8PawrntSzHf03gpWkL8hgxde8yFhE5mxy69GHFcCpNfaD6ny2e7
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=687feae8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=1Zk-24FEoXaHOanE9kEA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: ghFYNrZHf2sEixgJicvCoGj-hTFerCVh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220170
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

On 7/22/2025 8:00 PM, Konrad Dybcio wrote:
> On 7/20/25 2:16 PM, Akhil P Oommen wrote:
>> A minor refactor to combine the subroutines for legacy a6xx GMUs under
>> a single check. This helps to avoid an unnecessary check and return
>> early from the subroutine for majority of a6xx gpus.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 38c0f8ef85c3d260864541d83abe43e49c772c52..41129692d127b70e9293b82bea5ccb6b911b0bfb 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -403,7 +403,10 @@ int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
>>  	int ret;
>>  	u32 val;
>>  
>> -	if (!gmu->legacy)
>> +	WARN_ON(!gmu->legacy);
>> +
>> +	/* Nothing to do if GMU does the power management */
>> +	if (gmu->idle_level > GMU_IDLE_STATE_ACTIVE)
> 
> This isn't quite a no-op, but I can't seem to find what the '1' value
> would map to, even in 845 kernel sources. Do we have to worry about it?

This is fine. '1' seems to be a low power state that was removed very
early in the gmu firmware development stage. We can ignore that.

-Akhil.

> 
> Konrad

