Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D15C7AB459C
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 22:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B18610E4A8;
	Mon, 12 May 2025 20:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NmdosR2w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C937410E4A7
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 20:48:15 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CIXemt016839
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 20:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kMEGDGWDes2oQel40VYHijcONjInO+gIQOaXNYTja7g=; b=NmdosR2wzeX82hjX
 R7xfQNChr9s2zZRwEvXdMAMePnYf+JdmCSvMKpmtM5pHAPB4WbzC6UqF0byemHgR
 na4kT9knRJBd7KBRH+oezlf+aLo2y57Zunnb1BalfmDQyzkc7FYiIQcxwUbep/gP
 Wk1B9DC2Lp2f2elSVqOc+XwWzF/D3Nn1U8hCQkxXEIPOHQGt3ht9PMPbdUXq3S2c
 A181Ik3scTCZwoGH8aDUvACinXDjr6UcxqJZp395tB9PG+DG5dBn9DC1LAltrbcK
 eQIaPFbJqQK4v411v6qFvUGzyg30gbwDaTMMPz0H0iLw//4NwUUV5nI1jiSfI5gt
 aKUpSQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hyynwemu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 20:48:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5466ca3e9so60938285a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 13:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747082893; x=1747687693;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kMEGDGWDes2oQel40VYHijcONjInO+gIQOaXNYTja7g=;
 b=T6OGXq6zTb+Vrnb/gcv3iz/nDNX22VfWkoVTu6X3TAVcIu44bYd1FFSSV8gT9ogxTd
 UhRgEKGsUcdRf2KfHUfWY54whIyiGz/zWAvXK/YyWT7rwCDFZXK+1bbIfCb+paPQeCQy
 Bw4fzarj70VlpXwj1Zjo03TwbJylPzbyv5x2/Z0X/6HjU36tKVEp+LVYAtN1x7oeTNPD
 gF9rRWdUenE5qTJLuL06Rn9v5pJ93jW7Xv0WwQ+MFlK/DtWI+ns/UMJ6Bz33kS1ciYi+
 mEZS3XT6ikL9q5NeXcputXtwyv213opWBZjHJRTSijssMwXTMEpGg2LzCPIkt/FdgLHE
 ekew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWL1PiF5tyqH2B4IT7QwHzWbjvvUnc04oOz13a6XvalpK2H7E/cv8S/RI7whbCDj2hZRTrBb6ryQKE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvnHrDn6o9nHwv7koxb5VxRV1mDWgUExidVV32tqKLkDSwtMWC
 0nWUrGE8S5Pghg1o2+HD4ECKc8Tu2qrXaggqqD/ym8KHW6nUXqGj3cHJBGNA22T+AJlNkhoanwe
 fBMRUnAOxKghKMCcp+GMMGZ6y0aRB+/OLBkdfb+mouawDJq4+ieciKooyMj/jJprtey8=
X-Gm-Gg: ASbGnctw35vXVFBlmItkI4eBPIIN4Pz+Qrcg18j6ZADlvhAitvfaHFZ94qTEZLT/eq1
 FWugS7iJrADcToQNrMmH5TjQHVfdRZVPpZY5xHOw0CoCq5LB/wyDtAOhNT3CIMYVpT0pG9190OT
 6mS/DpRQfA7RrMigQM/HqDVwpsqtEA3Qt/gVNUk9L40Z/5V1cP3q0Zy1d6qNnG2eZuWRBV4t5WL
 WzRTPx1EpDYBXRHnpcrLCVD4LTm40ZnC56nujtqRVFflC6QZEN75r+zfVqAJAwgbFf2gx1eQiBR
 oIVITfbaXD45CCIIDAxbPWXdx5X4ubRGxToy2TPkAfiZ+la+VolErAVI56/swpcqLMI=
X-Received: by 2002:a05:620a:2723:b0:7ca:d38c:5d8b with SMTP id
 af79cd13be357-7cd01044e2amr926155285a.0.1747082892966; 
 Mon, 12 May 2025 13:48:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1PFEnie7QK9hvQDnRlsXVbaR2Eq3M0V2Jui8DCrhPHVSNfmueMAmpx3G3g/iNJeK6Yme+lA==
X-Received: by 2002:a05:620a:2723:b0:7ca:d38c:5d8b with SMTP id
 af79cd13be357-7cd01044e2amr926151285a.0.1747082892344; 
 Mon, 12 May 2025 13:48:12 -0700 (PDT)
Received: from [192.168.65.222] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad23eafca8bsm428846266b.87.2025.05.12.13.48.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 13:48:11 -0700 (PDT)
Message-ID: <24173d3b-272d-4cfd-8519-ad5c9cf7c555@oss.qualcomm.com>
Date: Mon, 12 May 2025 22:48:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20250509-a623-gpu-support-v4-0-d4da14600501@quicinc.com>
 <20250509-a623-gpu-support-v4-2-d4da14600501@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250509-a623-gpu-support-v4-2-d4da14600501@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDIxNCBTYWx0ZWRfX19HpHjOXM2b7
 Z1PVA9joN48TT8KO4erX26eEDAZ6awZ3BXn/y37C/upcz6naR2zZUv9mfgi7vnWJmApGW/e+8x5
 F06XhkUjJnrppOBRA2yS2oOKCIapR5Dz2KJDSh7BlrXifsoJF2vOQknmYvXTCOzlQM0703FptZF
 R3paT767J+DWc863v6LD8pTIsZDahdl9BYhWp7UWDvOiMDXPXigxyIPlJDLPGQ1SU4ab0D4FsQv
 a4L3skYXQPKmUcEiYbsG/apqS3uVhsiJsdJmEnTKu8SVMusAjqvj1DzDbmytMMi7h6Fp2dYSR9u
 2DiIXIQJAWoDG1MXRXMkNibDyInttXtAeEAKVHZH3xjVHz0/rJ43/1T7/TMPrsKLLXM6vbXnv1h
 2OzF8tB0765Njtodb3mWyvGeIVugdtTA2DW8PGLBE3sdHXA2HT/MrHAptqz8M/ZwT6a5CK+a
X-Proofpoint-ORIG-GUID: vssLhVeLEMbmQobHVQnC18sIGyDB2jbR
X-Authority-Analysis: v=2.4 cv=Uo9jN/wB c=1 sm=1 tr=0 ts=68225e8f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=NWoSzSQ9CBVd_tIZLS8A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: vssLhVeLEMbmQobHVQnC18sIGyDB2jbR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 mlxscore=0 adultscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505120214
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

On 5/9/25 9:21 AM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add gpu and gmu nodes for qcs8300 chipset.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---


>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 91 +++++++++++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index 40771b062e8d7010dd93d7cc7b3db73cfa16bfdb..1dbccb9a0c75366aa6986b6adb4feb6164ee8845 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -2660,6 +2660,97 @@ serdes0: phy@8909000 {
>  			status = "disabled";
>  		};
>  
> +		gpu: gpu@3d00000 {
> +			compatible = "qcom,adreno-623.0", "qcom,adreno";
> +			reg = <0x0 0x03d00000 0x0 0x40000>,

I haven't noticed it up until now.. this should be moved up in the file
to sort the nodes by unit address (the serdes node above is 0x089.., gpu
is 0x03d..)

Otherwise, please check if there are freq fuses on this platform, if not,
feel free to add:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
