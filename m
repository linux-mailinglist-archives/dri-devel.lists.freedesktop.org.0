Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A59D8D3A8ED
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:34:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B3C10E423;
	Mon, 19 Jan 2026 12:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o+z2yB8Y";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R/GENOWZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400B210E423
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:34:34 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60JBDL4F1440832
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:34:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=NafDNOWh2Yw0HDpwvNJ6p5kI
 hs263x8t/XdpfBo68qE=; b=o+z2yB8Ys5JwKzfiMysVNipfjtRKrDmyGGrJYSuC
 8cHA44itrDb6H6Aa7hFgB0enljKGzTROb9F5HSH1SILQKzq1QVlP9yVyjDvbI6ri
 ADJRm3kz8jLcWTqFcMjeE2Tu8qB0v1gwqBL52s2geE1ty1F5GuCIgWvME6SNDZZi
 rduk4kPIwE0Mygid/y4A6rwnCRcrT/1I/Fr70khsRZ5GE7lbSky1CShn9wpSmFKH
 8KPCfNaBSNhjL2A+qnpUPcGYM3BQ/VEarPkUEx9e/nH5A7N4mL88B5dJYqf8xqtR
 RIf5YJ7D+uETfWNxdStl91EsXJXpj9PKpxMAiiRezWNCdw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bskj3g6ur-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:34:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c6b4058909so422716985a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 04:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768826073; x=1769430873;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NafDNOWh2Yw0HDpwvNJ6p5kIhs263x8t/XdpfBo68qE=;
 b=R/GENOWZkIlrcvVL/86i+Qt8EsMx2SxpAdFLzbbScitgG8UWYCqz/N43ictTO8aeHI
 9JP3vymya2KHDs3u+An5fu+wfNGsHTQw0KMHQiYTDTWftYDOnNBfInOAl7LNeMIsp+S6
 mUTmH7jG8Pc9ZWl4UnvznqV+Zj7lewrCuLbnapyPWVVje+6qKo7gVyjFjXWgGUAFICA0
 y9KkrtVgUCbZRRywZ8np5TQzTseRLVYJ33goTgvnwUdke6oUf1AXmUYtmv+Oyw5buvZj
 aKLeRTz/Oc1NUkrNRMHK3TMWkZJrE+itFcxkjdo+STdr+0FOEfjvxOUrlh/w0rmZOum+
 XZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768826073; x=1769430873;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NafDNOWh2Yw0HDpwvNJ6p5kIhs263x8t/XdpfBo68qE=;
 b=IRjsOoFmhmVXz36jW48txLOWuusAxGGnFYIYdRcEVLIvWl0kbIOZDwpbVCXqgU2huq
 ZsIIkGaw+mnTfXLLlb9QZaGB8ye0J1KKpXkbLV4Hy/HtlhE88R/cypuM6XT/umyFumW6
 zTjIbl6Ql6y+lIlpkxUc7wE7aHuA36nDKBG4aatK0yjrQv08v5v8GSjnEEC/YLaqw+bi
 9yNB+idywYvyB7KiO2nuebioj+Jb1hxiqMCgTRrn4KfhmvqOG/qSCoM4Za+aRkI4ObM5
 bOPlkWNffbCuTszrCpgw5u2B4DyLMg1FLDW8oJJkc69gjFEuXcDozjIxYV2JrSVl8p/Y
 Jk+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX57EfgntmP/ffibQzhsDhJO3H81pJ1pVLhVEIWitCMmtWoAMEOV2ctdYakdE9jR4z1V3pmpz6mUB4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzv0+gtDm/gG2VJ8n0OyyzpIh9l2HQho56Oomfoe/p2BMeH9dQD
 LlYTN3idkOKToZqdcd8g4ZwjrQRultfz4x6LdMowvhVrfNXLcqsD2uUo/eWLg0ewj+qKMn3Mc7M
 22DK4v3thzwUnlqMPmXVDAorSvtYML5nXYXJFoPHFt26bSdKT+12lb43gPafCPoTCHi7StTY=
X-Gm-Gg: AY/fxX6sOD9TzYuBXDNRpcglYAkoyVNNKAUjR8sum5O56KPJdZsHFyqVNWymT/MYLJP
 CeY5nJmPNZpN8Mj03e8fukZdnGMv/lbwmBvsGIwwhSwhcrPPLW0CXx8X7cIuigbAxb2pTQ8eGSY
 rAKBNubo5IX1C9KYw/jeALY9sDTzS0vNC9QiCqcXJbPoyzR9Xc8krw5f1KMIt/GLibIcBwcJuPx
 gQ78O8cMj7NX3vgO/zcCPtBx9q+C1ceXWA3vM28kiWNPI7jnnp1F/iOKqfYl98dnniiVH3irxOI
 7cypdyTrPR5m3LcJciFEOotuZ7tKozb+slxOU+K/mPsu2KEbZ9ePeupWN4SyKuUDnQ06zrdervS
 GWG40K8SOJvzn1ogz2OtNXhu6CkljBP37buu9ySXvHyv3EGJKaXC3Tx5ASQirdtd0mbX1TWARDm
 F6Cy/kN2NNjeM8J+ciogF0s94=
X-Received: by 2002:a05:620a:4047:b0:8b2:7726:c7cd with SMTP id
 af79cd13be357-8c6a676da9fmr1441157585a.49.1768826072688; 
 Mon, 19 Jan 2026 04:34:32 -0800 (PST)
X-Received: by 2002:a05:620a:4047:b0:8b2:7726:c7cd with SMTP id
 af79cd13be357-8c6a676da9fmr1441153285a.49.1768826072151; 
 Mon, 19 Jan 2026 04:34:32 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3976dbsm3340662e87.66.2026.01.19.04.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 04:34:31 -0800 (PST)
Date: Mon, 19 Jan 2026 14:34:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Val Packett <val@packett.cool>
Subject: Re: [PATCH v4 4/4] drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL
 programming on UBWC 5.x+
Message-ID: <3cvigxba6lkhbolzf4hsdn4a4psvkvqeaztgjkd66ctkuaykyk@jtocgpnugygy>
References: <20260119-msm-ubwc-fixes-v4-0-0987acc0427f@oss.qualcomm.com>
 <20260119-msm-ubwc-fixes-v4-4-0987acc0427f@oss.qualcomm.com>
 <35fababe-11ec-48a8-a6a1-d1aa1ab95dca@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35fababe-11ec-48a8-a6a1-d1aa1ab95dca@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ds7Wylg4 c=1 sm=1 tr=0 ts=696e24d9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=nqBBLIHtStSxbiTUqcoA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwNCBTYWx0ZWRfX+KxHY4evJtVN
 xx+e1ddV+Dp0Z5v1NS3mFWdWYi9F4IubgLzF+8rweF6VCw6Cwm/VqtVpMp9QIsDdj9f0y6Zo9px
 Bv4s34xwzp5qj96WmQ5uW6mKZKRDDOt8mAe7qxWpVuUHV610b96J1dJnpCVYLViYMr3nIH9yN8e
 JBj6BFHwQRA4K1Q7oJGPXR/BWNmvi2IfbKib/3YxFjESlzBk5sL+GWD12Vu0ZpGltfuHraXBuXM
 G2bKNOQYjVMdxy/8sSQ0MydKeLc1zBnTxe1DxrSofExGblCfruQqqTW2lV9ngHl7R498/Idolf3
 AIhcdZEjOh+1bKnAErphTrmww3We5UVwFKIpZnTfY1BuckHAm3HKIAhomAB3UriuYKszXYSnD7o
 K/gb5dCzkdCttfvwB9epLB/AjFGD3Hf9VVXuC1zxJt/vDIiO+ymxjuGCsVhevwluICfbscRS0Ro
 Xdmh7RobhFX8e0yyZFw==
X-Proofpoint-ORIG-GUID: K05YF3OOQlpjzfN2oxCeuGG72hSTuaSf
X-Proofpoint-GUID: K05YF3OOQlpjzfN2oxCeuGG72hSTuaSf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190104
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

On Mon, Jan 19, 2026 at 01:24:58PM +0100, Konrad Dybcio wrote:
> On 1/19/26 1:16 PM, Dmitry Baryshkov wrote:
> > Code in dpu_hw_sspp_setup_format() doesn't handle UBWC versions bigger
> > than 4.0. Replace switch-case with if-else checks, making sure that the
> > register is initialized on UBWC 5.x (and later) hosts.
> > 
> > Fixes: c2577fc1740d ("drm/msm/dpu: Add support for SM8750")
> > Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +		if (ctx->ubwc->ubwc_enc_version == UBWC_1_0) {
> >  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> > -			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > -					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> > -					BIT(8) |
> > -					(hbb << 4));
> > -			break;
> > -		case UBWC_2_0:
> > +			ctrl_val = fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> > +				BIT(8) | (hbb << 4);
> > +		} else if (ctx->ubwc->ubwc_enc_version == UBWC_2_0) {
> >  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> > -			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > -					fast_clear | (ctx->ubwc->ubwc_swizzle) |
> > -					(hbb << 4));
> > -			break;
> > -		case UBWC_3_0:
> > -			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > -					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
> > -					(hbb << 4));
> > -			break;
> > -		case UBWC_4_0:
> > -			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > -					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
> > -			break;
> > +			ctrl_val = fast_clear | ctx->ubwc->ubwc_swizzle | (hbb << 4);
> > +		} else if (ctx->ubwc->ubwc_enc_version == UBWC_3_0) {
> > +			ctrl_val = BIT(30) | (ctx->ubwc->ubwc_swizzle) | (hbb << 4);
> 
> This is pre-existing, but BIT(30) is not unconditional in SDE for v3

When somebody adds inline rotator support for DPU 6.x (SM8250, SM6350,
SM7250 or SM7350), this bit will become conditional.

> 
> For this patch
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
> 

-- 
With best wishes
Dmitry
