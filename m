Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EB4AA0B5B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 14:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC3D10E439;
	Tue, 29 Apr 2025 12:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aanI6jYB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03CE10E02E
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 12:18:05 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TASPIt013029
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 12:18:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=e34M8RUkxHX3ws0JPzoX/H5U
 B4Agn3FBLku0jSx4igY=; b=aanI6jYBt8EC9S2b9Rmv4trvbYfnQ8IKgLNvo4ss
 VTNzVOm3WsusRPVDLai/TsjZUbJPZSIAc0lF/d9DRQ6U0pfUWjkWpXw7eyc+lQOs
 A5qg91RLSrvVw77sVsDLMnJjtRDoYMHFPWT2CrsCE5/13hA0o92PhkULEuz9zCs0
 O7TNforikqZe7ogjdpnqzXodDrU6Sbp9NeestSmyOm3FpaJiTUNR/cr5v3CJ5/Fd
 rj0Xup6IgHNSj3b2z3rhbUSo9vF4zeYF/dUtmkgLCRmx5YTN+VXTQp073CDdXHzy
 GdUJFVc+wlop4zVdMu3wVssBKCa7eX3W32i0SYGMiWDqFg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnn3bqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 12:18:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5cd0f8961so1185799185a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 05:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745929082; x=1746533882;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e34M8RUkxHX3ws0JPzoX/H5UB4Agn3FBLku0jSx4igY=;
 b=dUx7lgRpqx24Va4iGT1Ytyn4SnTvS+cWAFjM3PHF5oFMUsKghmvXCeRqRmZoh7IGfk
 mizD1DuCs9t6Pwv8Z8OedpyML7IfvZTfS+WF7KO5aJ7oJIAR0YQYgMzrnEtXlbQ9gSgR
 PisLOFY/wgF/wzUXXUjH342IMOqaOwgKfTrhZh5apynwPTQb359z1IkRVvl2Ii/vnJgl
 3cx/qTRDYuKeO7sNKC1O9qoET8dCFX0ET8xM8vYqNc7PEftR+zyoocFE5GEh2dndOVym
 zwtXJJ6+Bc+nNfE6QcrGNUzIhSa/eQE24YbHFiQHTWwFgPz3ZirS/dwevuWGpZtuDrAZ
 cNUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdXfjTPEdq9WkmK3OedzTZKiU8Xt2g4XfyJ1yVfDyhQy4SRIXBAre37L5aeMCD1gY4GEBW9yvyqi8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyc1inmBIfBrL+RRIiKgjMn+OGAZ6h4foqod2rj147JtXlaewbv
 SFKz1E9ro8GuUMtPEYl0zsy+c69nIiQwlZPAc7UhsPEDe+fYAr/XEfelbzU4Uhkzn4bs8zoa7zK
 zxNoDOhr1vlL8pJFVvTiGPLT65E4r3QCEha2didODaLRIOyVHaoKzK9l9ywMkMN6U8mG3bU6jTA
 Y=
X-Gm-Gg: ASbGncvvq4IgBalhGdMJQTogKQd1KGcAkaP7reZQ1fypaV/7SZGuKJ8xMokH2weyuC8
 600YI1PMrnwTm3l7rqwT1XSS5qrSj1en/b4VCNtYfMJzBxihmDF4VNUjsLBV9l0JKdQrZwg5V0u
 jNMHHvzc6aa69eLTkWeEKK+yPdTmXAdzomY+zI0EJ/YAoOgWp+UxtprtgI2HIPwBWaz/JIX80Kk
 uOZxmxFNYJRowMG/FhL5fbzJNIIcXpJJyJbFXWr4zl+mJkD1BRN2ZXyJfdi8mFhyWiGs0snEOrF
 zYZv32XtFBj+ckKoBx7+AmTXCRx0N4fe/lJ/t22pjo1hGW3tY02a8frMpzBCMS1jE3jIDTacZj8
 =
X-Received: by 2002:a05:620a:439f:b0:7c5:42c8:ac82 with SMTP id
 af79cd13be357-7cabdd88f8dmr580839985a.23.1745929082265; 
 Tue, 29 Apr 2025 05:18:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuKRgwJxnGPEi9AE9oxOgdj1eQEXEoG3oreJuhRujKZK92EugDebdPi02MSh4UZF+o36uxLQ==
X-Received: by 2002:a05:620a:439f:b0:7c5:42c8:ac82 with SMTP id
 af79cd13be357-7cabdd88f8dmr580835285a.23.1745929081954; 
 Tue, 29 Apr 2025 05:18:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-31a0127be7dsm15268801fa.106.2025.04.29.05.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 05:18:01 -0700 (PDT)
Date: Tue, 29 Apr 2025 15:17:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
Message-ID: <hpfqpvkex3dtj6ieosce4phukodnoidh55vxpujyekoehhotqn@l434nae5gzdi>
References: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
 <20250228-a623-gpu-support-v2-5-aea654ecc1d3@quicinc.com>
 <e22daaae-57fc-4523-b594-87d202d255f3@oss.qualcomm.com>
 <aa8ebd50-683b-4043-9494-5675a2d9a01e@quicinc.com>
 <41df5398-79f6-484a-8ad3-f3488eb1b71c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41df5398-79f6-484a-8ad3-f3488eb1b71c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: sd9dHf58kO3ekcMpxwfAWRPnUF2bV-GZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5MSBTYWx0ZWRfX6EalB+85pJL2
 RGoXoMQgB1CHfQnYEeuetov0M8iSPO2k7GxL/c9PlrROxyRo3sK4yDLokv9pWoSYYbHIW2DRe7L
 DeNr1oeB0QSaF1UwbUQhsZetETp8gnWLCWdbM1htlOQ0l20itbSDeJDWs8PpsLiWZu67OZeffva
 lGSFvvju6IdQ+3G6pgpQr39H81CT6/GCBX5bUpL2JkQcesmaOPltKxELggPdXK6vj1xAmmv9gls
 7NO5GdbK4N3wCGLdTVWcGA0KXmXovbGlkMKrsUfnTlzEXLS1SwUr5vZUixMGVuqYYzImb1DIIpk
 Fr/9Am5MYVEwGSLR4WFBdMFsJJp0Jg/jRR9UdfTNrjfiIgoVAJM6Art/ZHOGnaM02ZkRC8Gauvj
 86P2deCJaPre03ED+mxiAsn4me6hWFv6jGGvPoi9KVCPUga6Uxyc6SB+KkdC1deTsrIo6EkP
X-Proofpoint-GUID: sd9dHf58kO3ekcMpxwfAWRPnUF2bV-GZ
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=6810c37b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=AUxwy3R0h1HAuY9YvekA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=694 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290091
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

On Mon, Apr 28, 2025 at 11:19:32PM +0200, Konrad Dybcio wrote:
> On 4/28/25 12:44 PM, Akhil P Oommen wrote:
> > On 4/14/2025 4:31 PM, Konrad Dybcio wrote:
> >> On 2/27/25 9:07 PM, Akhil P Oommen wrote:
> >>> From: Jie Zhang <quic_jiezh@quicinc.com>
> >>>
> >>> Add gpu and gmu nodes for qcs8300 chipset.
> >>>
> >>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> >>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> +		gmu: gmu@3d6a000 {
> >>> +			compatible = "qcom,adreno-gmu-623.0", "qcom,adreno-gmu";
> >>> +			reg = <0x0 0x03d6a000 0x0 0x34000>,
> >>
> >> size = 0x26000 so that it doesn't leak into GPU_CC
> > 
> > We dump GPUCC regs into snapshot!
> 
> Right, that's bad.. the dt heuristics are such that each region
> is mapped by a single device that it belongs to, with some rare
> exceptions..

It has been like this for most (all?) GMU / GPUCC generations.

> 
> Instead, the moderately dirty way would be to expose gpucc as
> syscon & pass it to the GPU device, or the clean way would be
> to implement an API within the clock framework that would dump
> the relevant registers
> 
> Konrad

-- 
With best wishes
Dmitry
