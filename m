Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35197C0DEE5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 14:14:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BAD810E48D;
	Mon, 27 Oct 2025 13:14:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pjh+2Rii";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC8E10E48A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 13:14:45 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59R8sVP71090823
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 13:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=nFyzKi5bv7XzhZEu4Cpk+WRY
 5dnAaHHoSnvN/ez9mr0=; b=pjh+2RiiyRIkOe3N+YJqN3TwoEj4CEejkjcAuiqg
 eTNuHP0Os9Sz7E6MkyxZ7yPTKOTbVK6TAJMmFrSCsjvC860dongX6tGYnABRWVzS
 wVYrnEqc9vFYFjjDuuYVIAXx3SVif6ZwmvJZwqvxE86/Q+LwSCYANe3T68ptbJrP
 v9lVlF5LWEBQm6lIWoPKAyuai8LKrkTxNuw7UizS7jBGk/ZKo45otfCbUXpxU3Tx
 gUH9KaOaJxEuNcrJ1+4zX1LQ3jHNlREa7Xz7JO3+5YVL/1GoYjbUcLmhYHDcpiBZ
 Eb1JL06WICkHrog0IZHMk4odthMZx6HQNWiniq32TGyhow==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a1ud1t2f2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 13:14:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e8916e8d4aso45558241cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 06:14:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761570884; x=1762175684;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nFyzKi5bv7XzhZEu4Cpk+WRY5dnAaHHoSnvN/ez9mr0=;
 b=fmWTod+Rc47Ylx/zlSuWA4mV19ALuvEpqzfgS+ZIwhhPfdymPl/W2W24YJQwPE1N3b
 1ZLLSZUo43H767iMeIfjbY6jmmgshm1CGcwTN+YF41xzz2Tys/uOVe2KZZ34cMZlxbLp
 coZHoOXgW6npg73WKiMxAvy21bqtCvtFkO8tSpFwiia7Np7mdlwHb0VKIbAGNs2Z2aAL
 jJ02JYd7KIjxVnl62uAzMgsV6sMDnLSoxkUFDyvoxLMzNdidoGEkKU8/qIrBSpHCuo4r
 Uhn7zcu3w6q14lmghoBoy/w7srEV8Mg24e692LcQ+CmaQd3Rtpg3nlctPuH0U29A+2lR
 DBeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNHvADB2IQHuW9qAWWxtzjP4lXmfj8eNEXpH6/qQrrQSZYU9HdLaD5EuAvFgCGUacw8vlFOPGUXzw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIwgG8vRM5jwaStFsi3l3G3DNsZHSeRmZM8l0K6sd0kDpAMOrJ
 0pFawjXoi7t6kVVKhK0zF8FMpdWxg+XYvFKOkquIUN1+kfYKpe8HKyTPkVb2zQ4RyDh4pQp9k0C
 bIJdh1HE7OzqWy8GjoOtyxHlRKvVAjhN3yH3oQlzyoHF8ez7GGQmFcGMEfHHH7hgmXbrtVH4=
X-Gm-Gg: ASbGncvS7YO5agy4AXfKBdA9wNstchNI2oBlmWtFEv53oF38ytdAA25JX3MgNAmf9bx
 D1ZCcq4LIOZAlH6FysGY2B5bqa8BzSLy1GCbeDRXog0In+teBPnr+JfNaWh5vDfalM1XUL/jCUc
 /j96XnyghwzSqaC4birl8umLtcph7i5yUIXZNfoXP5ADBlofH4jVJgGne4z+TdqjH44zbC83MWJ
 fxohzOwe84OZdCK9Xymzx6tSZs/Huu1XiDy16TbaH3ytZRMoR0buwwQpI4+ZLo8F8b1bqcWu8YD
 IaEwB5P2tWQ9xmPfF8jQfxnbliLetNSqCqGhcbfrDCk+tolXarIyes+H7YUq5KJdEM1JROOXClM
 J6HoVD5fUMIOEnG84kEAJqKFrUhtRYTB1gB+ympSaiqvDQV5D6Rs135E7jnULKiclo8uZx0GneH
 v3/Fi/aX9r45te
X-Received: by 2002:a05:622a:1b28:b0:4ec:ef85:cfbd with SMTP id
 d75a77b69052e-4ecef85d368mr61632221cf.80.1761570884068; 
 Mon, 27 Oct 2025 06:14:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvwWHynaMcFsCoJT3Ymx6akKgKGq+AVYZliRWBvt3fl/sJ+nyNZdGM11CdtSCxGsRp/Z4JPA==
X-Received: by 2002:a05:622a:1b28:b0:4ec:ef85:cfbd with SMTP id
 d75a77b69052e-4ecef85d368mr61631541cf.80.1761570883540; 
 Mon, 27 Oct 2025 06:14:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378ee0a5655sm19154971fa.21.2025.10.27.06.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 06:14:42 -0700 (PDT)
Date: Mon, 27 Oct 2025 15:14:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 robin.clark@oss.qualcomm.com, lumag@kernel.org,
 abhinav.kumar@linux.dev, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 01/12] drm/msm/dsi/phy: Add support for Kaanapali
Message-ID: <einog245dsbqtx3by2cojyzmyctk2fffpwndwoe24puwqq4fta@cu6iiidxqgr4>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-2-yuanjie.yang@oss.qualcomm.com>
 <omlhiywjr46ik6bj2aiutgcf4aifen4vsvtlut7b44ayu4g4vl@zn4u3zkf6cqx>
 <ad906eb5-c08f-4b66-9e37-aaba99889ad4@oss.qualcomm.com>
 <aPryORKIuSwtXpon@yuanjiey.ap.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPryORKIuSwtXpon@yuanjiey.ap.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEyMyBTYWx0ZWRfXxso4qSy/rnEo
 EcslWYaJCPg+9+C32Lnmn2QvK0jgh4I9H4e7RG0ZTRO3NttDVwphxFfCET+hwb3VGi3PfMmgxxk
 ne0d3fjgEogkEJV4/kKWOtDLIIoY5Uz0COfbPtTO7GJPKFxlQjPcV5St4vsLQs+x9dWEDPO5c1R
 6CBFiSyV6SO3m5V3JyZCYdSMfBJhNl1dV9D6Ki/IeWsQSqpBdtKthGMfIh+jf5l71B+y71vqcro
 8KjRxpN31+v+TJt85N19CxPm6zuBXb8Yir9xdpQdVJUMJRc2FtVeohBrmdTebqheliRiE+ZW10G
 4vh0eEyFCsy4VZHNcCVxIMMHLDx8aaLD9ZxxMKYXiG34TXqWxJAOmTTOSrpRanZjr4kNfYhyYoe
 Ell7+otSbYtkiG+d76NWnEieMI53iw==
X-Proofpoint-GUID: rl3vTZ36bptu_AbhulX5bx02SXucq__a
X-Proofpoint-ORIG-GUID: rl3vTZ36bptu_AbhulX5bx02SXucq__a
X-Authority-Analysis: v=2.4 cv=UqNu9uwB c=1 sm=1 tr=0 ts=68ff7045 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=ACmnMjwJHZESoQLvWlYA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270123
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

On Fri, Oct 24, 2025 at 11:27:53AM +0800, yuanjiey wrote:
> On Thu, Oct 23, 2025 at 02:02:45PM +0200, Konrad Dybcio wrote:
> > On 10/23/25 1:48 PM, Dmitry Baryshkov wrote:
> > > On Thu, Oct 23, 2025 at 03:53:50PM +0800, yuanjie yang wrote:
> > >> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > >>
> > >> Add DSI PHY support for the Kaanapali platform.
> > >>
> > >> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > >> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > >> ---
> > 
> > [...]
> > 
> > >> +	.io_start = { 0x9ac1000, 0xae97000 },
> > > 
> > > These two addresses are very strange. Would you care to explain? Other
> > > than that there is no difference from SM8750 entry.
> > 
> > They're correct.
> > Although they correspond to DSI_0 and DSI_2..
> > 
> > Yuanjie, none of the DSI patches mention that v2.10.0 is packed with
> > new features. Please provide some more context and how that impacts
> > the hw description.
> 
> Thanks for your reminder.
> 
> Correct here:
> io_start = { 0x9ac1000, 0x9ac4000 }  DSI_Phy0 DSI_phy1
> 
> And v2.10.0 no clearly meaningful changes compared to v2.9.0.
> just some register address change.

Addition of DSI2 is a meaningful change, which needs to be handled both
in the core and in the DSI / DSI PHY drivers.

> 
> Thanks,
> Yuanjie
>  
> > Konrad

-- 
With best wishes
Dmitry
