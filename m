Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39980C63FFE
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 13:10:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9022610E36B;
	Mon, 17 Nov 2025 12:10:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NgExG8mv";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fogqungQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7FE10E395
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 12:10:06 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AHB2KYw3916357
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 12:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4iYwG9oA1iME99ev4F64MEe7+HABQKRNZKdKfPqrzJY=; b=NgExG8mvhfViX3ZJ
 MdUNTLo1DrHc0SNn5ONL8SAh4PgSH7q5EIv4V/GhXogLZZk2aizP8sN2YaLLU7s0
 Fj+BfXIEQb3Ron61xpPL/3JdXnGZ0bZW1whWnvLboNyQrm5MhSTQgh7O0HXzjtAs
 b+TBpap7q6/qHZEXvxBephuhYr7fLwaOsPXsjWxOrAxjqUEu40JnBPsgCyptld2Y
 nabhC6kB1Da8Z5egpJeTAu8PlfUSxqz+QxY7WVxUDhaGWiC2R9S2S669WKau8oiy
 bF6By+WCswahBIMMe6udTwX+RiiOvKZAEIUl2c1c+0Wr1Wr3wggRVZXXkY21MfC3
 CVwd8A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2fx86fh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 12:10:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ee05927183so1439001cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 04:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763381404; x=1763986204;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4iYwG9oA1iME99ev4F64MEe7+HABQKRNZKdKfPqrzJY=;
 b=fogqungQw/iqoAxp2xR76BNvnIlwcQcU5QnmWmxaPB4Kr5Q1JIq/AOiEgWbaDL2dhU
 CJz+bu3gIc9PcJCI7YeXPBxzQ7SqYeZZpTO79UDE+2AHUp1PFTcf2KBvy6/wc+o8lSxZ
 jGrlBAYBpfnxgieL0Q/BsF5Iyhdv8Pc0M2bFSRmbBNu5JMSaeYGchjIgLXZRHWJz54I4
 vvfCUmHtw08HUzYnf3Z9ibCcmckuLQ6eMa2qsovrhh+aMZ6YO8FK6D+JYY/WK+tfm2jZ
 lS5h6C12NwG5ht9Ggqg+Im9HtSZ6dr9vqiW90yaaHp/Uqr7SmEYGdcFc0hlcbfwQvsHS
 ALlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763381404; x=1763986204;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4iYwG9oA1iME99ev4F64MEe7+HABQKRNZKdKfPqrzJY=;
 b=b17R6oZ9Yqor/riR61PEHQGFYfJxYp/2LpHzgs8hW9wdImetrmDmpU19+tR3Hzsn4p
 G2BHFYRD39SgDv0FxFwgUjPV7IXUh43MbHn9o9uPFV7J8xdvjqq4xLNaA0JC6qffqGO3
 P20qHZ+x84b+83MRIGegf9oT488MHWiJsIAJhDQAKz5G74bzdPftZPMMEstNWcYHM2Zl
 MvZ1O3/I9qz00ZUJVb8AEBdPxlyQB8X9AlCOOU0xEfstDO9kP/vFbjUtELU5BzslITF2
 8zy54G+X45rvVqeJUD2SIKbftNBy7b/BEPr4UyKysHa2TcikcVLfA6qBQZ2hOqTXkx+K
 c5Zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWerMgzfTI7x3/q7q3mNv47YzBCWuD40XOHGIEq/TfT1Diajz1HTEP9dkly+ppsbul18fhRFoqdwJI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAOzZ0NZShkgU9EfTMmFttdzllqke7yus17Xiyv9UKgIXqnTV8
 t2RfyhVAJcurTJNM0piYqY6FhGp7WztHG4x8WycU6X77P4ii8xuOxttuTG4K+dBjTi6i3N0sm5r
 WONSPGKKp72Pi69oMRnnd+F5Qv2u8Ry5bQ+MdAebkfmQvarcgTC+x+WQeIW3lGtzh77S6x2c=
X-Gm-Gg: ASbGnctGFLEzKZJqrj2Rrb1SN/hqEJeKQeq5p1uAaH4JLvPMV5iTOOKFACSel1qzFZZ
 12+HJtxp3FkOy9D1n+/fv2cptAGITFraUSys9vH9d6FXaBEu7tms3V8zkSd7jBq+LsLW4Y2PU3Z
 WDKh+bwIPEfpLEkS2aW5pBhe5xwFagPgVPvFlyqUjJ2EHjGOBkdc+dp0TBNmOanPiQ31d6vl4JH
 CKpBUkl38Gm8ptltozWoE3l/vobBdIKQvquvVbATJRCyT0ww6Iewx1fLenz3KwpEbhTLcNxflpn
 uOJc9bWx7K/llnJMAVtwB2d6OLQuX1Q37N6mqskK8SLt3vXC8MjJZckQCE4ivK6PUylpEP9Pj6/
 hSDuiw61viMI7rvuR7eaJOVM8HlGSuwHCHhH4/9alXUy9hcjvba3Uzb8g
X-Received: by 2002:a05:622a:f:b0:4ee:1db1:a61d with SMTP id
 d75a77b69052e-4ee1db1b80cmr34880221cf.3.1763381403034; 
 Mon, 17 Nov 2025 04:10:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+lM4RiA/uszIq5rz0kJglCgk2Y5+U6FHrUBKDfiMzHtGedL2M5TFrbseUbsKOh6X51HXKUg==
X-Received: by 2002:a05:622a:f:b0:4ee:1db1:a61d with SMTP id
 d75a77b69052e-4ee1db1b80cmr34879781cf.3.1763381402354; 
 Mon, 17 Nov 2025 04:10:02 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fb12c87sm1059268066b.31.2025.11.17.04.09.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 04:10:01 -0800 (PST)
Message-ID: <8541a10d-99ca-43d2-bafa-8e33bba01382@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:09:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: disable gamma correction unit on SC7180
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Federico Amedeo Izzo <federico@izzo.pro>
References: <20251115-dpu-fix-gc-v1-1-0a4fd718208d@oss.qualcomm.com>
 <6457c60a-2ede-4df8-ad82-d974690eba89@oss.qualcomm.com>
 <CAO9ioeUfZQVy7VFUp8FEVHN2_uL0ZB9jbkuexWY4D12YN_O3Jw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAO9ioeUfZQVy7VFUp8FEVHN2_uL0ZB9jbkuexWY4D12YN_O3Jw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bKzq2ARUm6CbG1s7lkabm03mVlHNrzAx
X-Authority-Analysis: v=2.4 cv=EIELElZC c=1 sm=1 tr=0 ts=691b109d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=H1CbSrp5QckA0GuTRH0A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: bKzq2ARUm6CbG1s7lkabm03mVlHNrzAx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEwMiBTYWx0ZWRfXyoC6nynNjQbv
 DaxQwysDcuSz31mZd3tm0ZyRab6sqwi9bXjhems6R9qelAqT1IJoIEmqhA4eBnMrwfSMaivmXoc
 YF3+Tm7mIu+HrhtSyZPWWzmYiUYwZmHP9GcLQPtTWXKq8SZpYXTpfT++TrpHes8U6av5F8VIS++
 np7VG6xohNG+pSV8DFiD/mHMcyn9eqTl/cKxOdRplRRw7e9gwHmcZpYdzWzmMT6e515QEfG1EFr
 rHd4ua+4StMJ5ixSu6w7L/Cs9xC0eBd5r9sfOnWl8ol+6msNGq8HtDRgj1vBmUWJ9G9duo3PsEU
 X+Hc7fydvc9SDDoGWzh7F4x6KpJrXiASAZGqfayIFjSPWVP5Pdyg4pGsAFriHq10n9XvdS7Yh2R
 DRjsdsys+fZ3tvWcJ2r+7YbCepR2aQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170102
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

On 11/17/25 12:51 PM, Dmitry Baryshkov wrote:
> On Mon, 17 Nov 2025 at 13:25, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 11/15/25 4:08 AM, Dmitry Baryshkov wrote:
>>> IGT reported test failures with Gamma correction block on SC7180.
>>> Disable GC subblock on SC7180 until we trage the issue.
>>>
>>> Cc: Federico Amedeo Izzo <federico@izzo.pro>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>> Most likely I will squash this into the GC patch
>>> ---
>>
>> Peeking at downstream, 7180 and 845 should have the exact same GC
>> (v1.8).. it seems like there's an attempt to program it through
>> REGDMA instead of regular reg access. Not sure if it's actually
>> necessary or just an optimization
> 
> I think it's mostly an optimization.
> 
>> What tests are exactly failing? I couldn't track it down on FDO GL
> 
> See [1] and other failed SC7180 jobs from the same pipeline. I haven't
> triaged it yet, but I assume this might be related to platform
> resources (it has only 2 LM blocks and only 1 DSPP).
> Another possibility is that maybe we need higher CFG bus bandwidth
> when writing LUT registers.
> 
> [1] https://gitlab.freedesktop.org/drm/msm/-/jobs/87878393

igt.kms_color@gamma.log fails, we get an ENAVAIL (-119) (which doesn't
seem like a good return value for this error but anyway..), dmesg says

05:42:13.199: [   75.472174] [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu error]failed to get dspp on lm 0
05:42:13.199: [   75.481487] [drm:_dpu_rm_make_reservation] [dpu error]unable to find appropriate mixers
05:42:13.199: [   75.490235] [drm:dpu_rm_reserve] [dpu error]failed to reserve hw resources: -119

which comes from:

idx = lm_cfg->dspp - DSPP_0;
if (idx < 0 || idx >= ARRAY_SIZE(rm->dspp_blks)) {
	// misleading error message, it's not LM%d, but DSPP%d
	DPU_ERROR("failed to get dspp on lm %d\n", lm_cfg->dspp);
	return false;
}

which comes from:

static const struct dpu_lm_cfg sc7180_lm[] = {
        {
                .name = "lm_0", .id = LM_0,
                .base = 0x44000, .len = 0x320,
                .features = MIXER_MSM8998_MASK,
                .sblk = &sc7180_lm_sblk,
                .lm_pair = LM_1,
                .pingpong = PINGPONG_0,
                .dspp = DSPP_0,
        }, {
                .name = "lm_1", .id = LM_1,
                .base = 0x45000, .len = 0x320,
                .features = MIXER_MSM8998_MASK,
                .sblk = &sc7180_lm_sblk,
                .lm_pair = LM_0,
                .pingpong = PINGPONG_1,
		// no dspp here, errors out
        },
};

would simply binding .dspp = DSPP_0 to the other one just work here?

Also, would that mean we can only have gamma control on a single active
LM at a time?

Konrad
