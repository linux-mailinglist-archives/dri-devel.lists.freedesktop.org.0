Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85595C644FF
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 14:17:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DEF10E09B;
	Mon, 17 Nov 2025 13:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yo1HwbgP";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d1zpsqCL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A254110E0BB
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 13:16:50 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AHB2K013916356
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 13:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Vj5ZcMOs3KsLHT8Zdi03abv/
 VC07dPRnuxMbrQ23NEE=; b=Yo1HwbgPT0K1lIgI7/ws2S/Gme5GT3BE70Jy/BbL
 L3qHAHm2tdmv6m2qTWF+uJgwegqXkQlrj4nozq9+0uraKnQrXvRjMrjBSq/kqMTz
 yfwRAb2/qKHAxT/aHn8sKP8Ge19exTAr6Xt9PUvkKqkFtNDgVKcyWCAqjFYDG/Nh
 bPIg68DqOi9TbF3wHcxTyxfY9ZKj6+NQCdaeuTZt35UDEPcGAKydX0dG+6Ui/8eP
 I1D9ZF1eZvQVkdZ25JbQ2pqH7L9lVpkGTgTN/yrlFQDopeM6pcmMdSHye7u3yTyy
 V1WNuC73hFqzLRbY4gm+CjeSRHT5nwX/956V0NVKzaCPHw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2fx8c0w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 13:16:49 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-bc2a04abc5aso3480905a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 05:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763385409; x=1763990209;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Vj5ZcMOs3KsLHT8Zdi03abv/VC07dPRnuxMbrQ23NEE=;
 b=d1zpsqCLWjzKdUr0DeGPb6oikLxZQuYSSO/Yh35vr+GPphys2wckd7xVS2uze8B8oi
 +fCieSzDjwNOKToZMXjVVwzw3ZU4Fx4ORPWOO+OUXcGnzllPn8gmxDx5QEluESzzIAaK
 RD1nB0zQiC0VMb2xOSy20SlI5eWzRxDmyMzPF89wwzkJDAxZRE4qOGPMMrZj+QuJv0wN
 lKSwFe43gV3ZTZ9YieOJXmykkiqLNmeosEQqJj5PHoLup8H8Nz+TJbf3sDFPUZH+jNtc
 X5KDn2mSuQF+TnucPOSTsFd1mSLpdrVYNM6cYrQc/w43GlnqIaUC4ZugZvgjaaXU8MBF
 WImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763385409; x=1763990209;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vj5ZcMOs3KsLHT8Zdi03abv/VC07dPRnuxMbrQ23NEE=;
 b=Cex02uExIwjtnR96A6200Ee9nsui1dS0UrpUHQlR/H2xqrDZyzfY3LE0CcjNRAL6f6
 sEpOjM5t+ytWnQqRqKw+YvlZZvy0efeDzlmC4MSP5BsYvBnWDeJ3+X1DXLhirmwrYUzy
 l2Maebk3wEhMg5g7hUZflXeeN0otfHcxMZ4htiQ/lj8xc0k1J65yg/01yr6kIk/3x3Dg
 dF8+ydcCRY1jW+N8TdwHCNxXWtlMuT83Vwzcb4bG1Ul4db5ogISybFBWsTk58wb0KxzJ
 S5uTSV6k5cKcqkmgXut8zjWRccu+OQF9NTfctd7QzBqi6UGO2GS6256F2ZfAX1rGZceI
 f0Iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqHCRcg+j6eqP/LFSYFPhvnOpt1lugR+npJZntwdLSGYwPgc3p0TcHQnTyAqrTZZ0tqLCCTzypQTo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHv5SYQdTTQX4+EJwW3AHpe8/wgN19W/v1qTMPE7YMh0MnCteT
 lTd1OO7X6yRbpdp8Adfa2w9Ivl/HXoWEWYrOjs6lkVSppSVbV0uiVrj7NlSliTFpnEaVxAsbOzR
 0bugGDXqDkJwKrbOQrerJVGosKrltq9soctRM9zyzp2YbTmK7yhWRtCsprHKB5Al7kNm0Sk5Goy
 RFoja1JP3uwSNFoEzinmAtp2lUrIDD+pDdZEsdUoUwmhchuQ==
X-Gm-Gg: ASbGncsIg/9h/gu5OPZgZ+0s1OQ8TJpKlp6ombK7peK1Mi1DyCoqz0C2OV69jMKuoPs
 xKxPxn+X2iEqwqL5FEk7/hfcPTa+a4TzbtmveIlMT/eEGytSzXeZbDb4KEzx3MXOSPiUNtHkDxU
 BzdgIXtOO7lEYKu3BBaqi+klg7jvN7g0p55qIy/Jbap9+Q3k0NUu52XFTgIlAScJl1uMaBiIJmv
 o3fsZ/vcAOmQxA=
X-Received: by 2002:a17:90b:1647:b0:33e:30e8:81cb with SMTP id
 98e67ed59e1d1-343f9eb3971mr13201769a91.13.1763385408499; 
 Mon, 17 Nov 2025 05:16:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFihb7teyupjKqIBCMh+TDYSyILYGMrEp4gWjInkFX5Zos5pwMEb0Fz1Uc0Vjzvg2oHO3cVkntD3anF1J/+5y8=
X-Received: by 2002:a17:90b:1647:b0:33e:30e8:81cb with SMTP id
 98e67ed59e1d1-343f9eb3971mr13201713a91.13.1763385407848; Mon, 17 Nov 2025
 05:16:47 -0800 (PST)
MIME-Version: 1.0
References: <20251115-dpu-fix-gc-v1-1-0a4fd718208d@oss.qualcomm.com>
 <6457c60a-2ede-4df8-ad82-d974690eba89@oss.qualcomm.com>
 <CAO9ioeUfZQVy7VFUp8FEVHN2_uL0ZB9jbkuexWY4D12YN_O3Jw@mail.gmail.com>
 <8541a10d-99ca-43d2-bafa-8e33bba01382@oss.qualcomm.com>
In-Reply-To: <8541a10d-99ca-43d2-bafa-8e33bba01382@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 15:16:36 +0200
X-Gm-Features: AWmQ_bldWn3qGJhpGBYv-2oYFmnlXXeCyzixQ_jXnUrblALzLNWv8mieP4Sa1iM
Message-ID: <CAO9ioeVT_1qGedvdACkE4pqbsP8VReeArbe=-zaH-SHfhi3pkQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: disable gamma correction unit on SC7180
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Federico Amedeo Izzo <federico@izzo.pro>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: H5I6SdkDrCxQDjEKyOhTuhAPg5GDZRbv
X-Authority-Analysis: v=2.4 cv=EIELElZC c=1 sm=1 tr=0 ts=691b2041 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=srVbb6NRTgbgkvQ9qfIA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: H5I6SdkDrCxQDjEKyOhTuhAPg5GDZRbv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDExMyBTYWx0ZWRfXwiqh443ddSI+
 CEO38QfDeei4BjIlKYsYKyIxO1YTtCcwyucHpudXrK4rApWvFJXnbOp1z2fva9IW2Q5Xl0bNzlb
 oME69dnldgeLDUH7bIfw7GDXUzQcOSSqgXfdyFpentraFtV9cLfsPQrorZ9CnGDl9k9CdzlCsJl
 4A2xeM1JjUJYLWh4G2Jut1yFb+MUHrq83HKZgwadrauEPugdybiCSWpU4tqeY5+bW3v2F45k/ir
 CrVhuuKDl7EnIk3vi6vpRigQVyJOuzuex9IHMSVSEwBBvbSztW3q7D+7CQSi649NRGS6MzMUFdd
 6QCDklogTmoT5Z8daTu3lxDtlWj/oAPJKBgzjGNhTD0eODBSprNwl+OghQt3p/2MCYu9UUTAyVz
 ukuvBjlzj8TA2NTx8zKtHh7bcPWehw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170113
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

On Mon, 17 Nov 2025 at 14:10, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/17/25 12:51 PM, Dmitry Baryshkov wrote:
> > On Mon, 17 Nov 2025 at 13:25, Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 11/15/25 4:08 AM, Dmitry Baryshkov wrote:
> >>> IGT reported test failures with Gamma correction block on SC7180.
> >>> Disable GC subblock on SC7180 until we trage the issue.
> >>>
> >>> Cc: Federico Amedeo Izzo <federico@izzo.pro>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>> ---
> >>> Most likely I will squash this into the GC patch
> >>> ---
> >>
> >> Peeking at downstream, 7180 and 845 should have the exact same GC
> >> (v1.8).. it seems like there's an attempt to program it through
> >> REGDMA instead of regular reg access. Not sure if it's actually
> >> necessary or just an optimization
> >
> > I think it's mostly an optimization.
> >
> >> What tests are exactly failing? I couldn't track it down on FDO GL
> >
> > See [1] and other failed SC7180 jobs from the same pipeline. I haven't
> > triaged it yet, but I assume this might be related to platform
> > resources (it has only 2 LM blocks and only 1 DSPP).
> > Another possibility is that maybe we need higher CFG bus bandwidth
> > when writing LUT registers.
> >
> > [1] https://gitlab.freedesktop.org/drm/msm/-/jobs/87878393
>
> igt.kms_color@gamma.log fails, we get an ENAVAIL (-119) (which doesn't
> seem like a good return value for this error but anyway..), dmesg says
>
> 05:42:13.199: [   75.472174] [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu error]failed to get dspp on lm 0
> 05:42:13.199: [   75.481487] [drm:_dpu_rm_make_reservation] [dpu error]unable to find appropriate mixers
> 05:42:13.199: [   75.490235] [drm:dpu_rm_reserve] [dpu error]failed to reserve hw resources: -119
>
> which comes from:
>
> idx = lm_cfg->dspp - DSPP_0;
> if (idx < 0 || idx >= ARRAY_SIZE(rm->dspp_blks)) {
>         // misleading error message, it's not LM%d, but DSPP%d
>         DPU_ERROR("failed to get dspp on lm %d\n", lm_cfg->dspp);
>         return false;
> }
>
> which comes from:
>
> static const struct dpu_lm_cfg sc7180_lm[] = {
>         {
>                 .name = "lm_0", .id = LM_0,
>                 .base = 0x44000, .len = 0x320,
>                 .features = MIXER_MSM8998_MASK,
>                 .sblk = &sc7180_lm_sblk,
>                 .lm_pair = LM_1,
>                 .pingpong = PINGPONG_0,
>                 .dspp = DSPP_0,
>         }, {
>                 .name = "lm_1", .id = LM_1,
>                 .base = 0x45000, .len = 0x320,
>                 .features = MIXER_MSM8998_MASK,
>                 .sblk = &sc7180_lm_sblk,
>                 .lm_pair = LM_0,
>                 .pingpong = PINGPONG_1,
>                 // no dspp here, errors out
>         },
> };
>
> would simply binding .dspp = DSPP_0 to the other one just work here?

Only LM_0 can use DSPP_0, that part is not flexible.

> Also, would that mean we can only have gamma control on a single active
> LM at a time?

We can only control gamma on LM_0 on this platform.

BTW, the other log is more interesting:

[3] https://gitlab.freedesktop.org/drm/msm/-/jobs/87895515/viewer


-- 
With best wishes
Dmitry
