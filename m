Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB35C2B896
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 12:55:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7918E10E3C2;
	Mon,  3 Nov 2025 11:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LPUQZ8sW";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ONmXQHxO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FAB10E3C2
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 11:54:56 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A383LKe694040
 for <dri-devel@lists.freedesktop.org>; Mon, 3 Nov 2025 11:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dEVyFu+6bmZTYlafiA3YdKMFFRK2WLWXWR9I9stKUZA=; b=LPUQZ8sWqOiyTluv
 YCLmfyLYcLyPYJ/m8b9jvJF9GvfzefAZYZNx2oN5QxqjNMopkNS4nCsGOFix6KWT
 cG63U01NJ0MEwNLMEi+u/rzf4EYrKTKj8JSXxIskmfkJtw3rdMcH/HTFR/FbvyEw
 GxIqK9se5Y1IM/bBO/OZqsYpsvjkf48kRPlyD4T5AzzHV4rHG1MoIU9evzXqUi84
 8SxCZuyUOXex35AAkuBJFgOdmWDMgXyP1pYZ276BPfakRdGBrVDh56JHEJe/UG2N
 kvrm0+aNLW6R2VdYx6hL2M4W0xC3lFNImNt+gMa1DwbmQob5jTjdjjgE1wvz2ycb
 9FwiXw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5ak8mh3v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 11:54:56 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88044b68809so4769076d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 03:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762170895; x=1762775695;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dEVyFu+6bmZTYlafiA3YdKMFFRK2WLWXWR9I9stKUZA=;
 b=ONmXQHxO84RpD9gBgL1fRpKp7ZOslkURXK9Inbwfr3CPklJlGB6a9hvsi7PqCmA2zK
 JSAr13KxfvztRzzv61l1gmN9sOsFQY9tIPWd6+rspRj/ZzvePUqTjDuSTuzFCVp+8aQJ
 9Fw0Y+JP2DoLIuUwnbj3zqfUshlnbjGfmBnKKwk55YvRTVbcewwz1jxdkeZ+kd5dVM/3
 MYvjPjQHlDr2ejG7BgPc8QKqzkfPcUpaT3u2KzLk95ixq/rrSgQ1m/kiZzIpmzaBmW5A
 wGVqH2Q3Qa5/QyQ5KmxwRjIFk/0yRMC3z3rn93w1UCh8U+J9zNHCMbwkosab6IvA86FP
 dn9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762170895; x=1762775695;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dEVyFu+6bmZTYlafiA3YdKMFFRK2WLWXWR9I9stKUZA=;
 b=cEE6QVAWWpXI4Meulk+rSWyxGa3MPuBi98Q/NcPB1maPYC83etRfwceXi+9sATpfH4
 pCVFO/K9hDSvjX7SshwjxBmXTJUIS8vTbGlFso8dBLGPlniDeNkk9av9f5Vepk9zKld4
 w06xZka7FXCQYiEfnJijgC+5lfWjQCGCJ1enm4ghIW15YliwSILnaXkTVcliY8CubI0R
 gICp5+Cijv1R9DHPuDFJ+pb0+f0521gw54nJMaL+Bk7O26Pp6fRaFgQz7JuG9QyY72Gz
 KXJI0jia7q+NnVjxUyGi0AAhvELA8QiWBgmQ//g+9znUWHdx7NKdFhFVMsuq8MqVw3VO
 mLAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLveJDOlzLUhiGYEOaEGM3TqD9ZwDdyZiKTuM66iKwwl346SOK+VoXqoiQ7DNnYxRlp3PJGo7CMpQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXHz2S5lPClKehOvqw1mhwrxUM/0bkFFyTb1e8/QvXcYzJEDhu
 xJ2esB+ABk74EEdO6dZRJ+KirIUNwP47KG9/8xNgJnYdm3byG3VD/ZUGAGltEYDf2pHwbMaSuoj
 LkjtG4Bb/rJZR4Sxcgps07JFBgRYgHrHLOMFitue4a66Xmqx4VGkduEMv0WBELtcLxyWrG7U=
X-Gm-Gg: ASbGnct7alsc2P1t+PKf3ZpZmV7aNCiT97M0QnvvDGbRRyXWULa56MT/toNKw5RL7Il
 7C3scHXyEYeuRQjFkbK856VxHHeO+VVW6p4917Ui46dyYM4jFx2PnX8T6qyO7Z+tob6bZikA0mX
 1LFxskiEkdqNBqJgGogD4O6Zz3VaSsXjHMswiSF0VjGuLmSdcix8ou8cvdu5vRMn73A8H8iquZq
 EYvgwriLCRWdKZPfdK8zwHuvDm5V03V36KYiH2GKijE4g0NAt+flwMCg1kfT8QquvXDUDi4wnT7
 G96NCs4W4ft09WUXJ6oX8KDuIG45r4ItnzFeAA/iEEV0Vawcy4ufnDmQHF+hFVdZUOhHPlYcDpS
 CejBNm/DwGphdDxhy7AOqz8eXABm106uFi0lHQBlOM66yOLWJFGsZfsZ0
X-Received: by 2002:a05:6214:19c9:b0:880:51f0:5b92 with SMTP id
 6a1803df08f44-88051f062e8mr39427546d6.1.1762170895466; 
 Mon, 03 Nov 2025 03:54:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMiDz+lDCli9dZFeqHisvcD0Vrq2kRQUKbIV6KqRS7V1M4g3Nb4MKb8S5qdZwNotx5iYmXow==
X-Received: by 2002:a05:6214:19c9:b0:880:51f0:5b92 with SMTP id
 6a1803df08f44-88051f062e8mr39427096d6.1.1762170894821; 
 Mon, 03 Nov 2025 03:54:54 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b70b8191679sm376641866b.39.2025.11.03.03.54.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Nov 2025 03:54:54 -0800 (PST)
Message-ID: <c58dd9d3-2689-4a73-a854-04cff5b44216@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 12:54:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: qcs615: add the GPU SMMU node
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Qingqing Zhou <quic_qqzhou@quicinc.com>,
 Jie Zhang <quic_jiezh@quicinc.com>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
 <20251017-qcs615-spin-2-v1-4-0baa44f80905@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251017-qcs615-spin-2-v1-4-0baa44f80905@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: w690_laRXWMOUm35EoPSmD12WzIYDEJE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEwOCBTYWx0ZWRfX/cOQeGShf3Js
 Dmz/iM6aGCqMUfm0rAnT8uXE9OhfYJZBKNIVZbST4k6qzZHMV3euIfXUyMTsUIHKhyonpsvB501
 ADL7JAtZiSY36SrsBtuerQeSY/QMuPxvzFnxoALrF7Q3ewJ9wnmvXtXM40bIOiXjg/G4tpGYB9K
 zEdwReBQq5i4dNxp50CF4vtBadRauNG2cAmJ7ex5txdrOdTcpZ7lX70qoo+xUD8CGxf00vaInwL
 XoYI/MLZsriB8f82HR8i4le6cipunfBGpiz1JzJKCyqvFK7WCVDs9ZYmcjVSNZmactbEPRQj4Rq
 c9oM1Thvn7u7ibajRT5NrBE0bZSZru0ywTKVVxCxLdJItrwJZ4Ktpt7gMyyMsgAya6OWUGTcy9X
 +6RmiWhoB0FAqPav7B0lnhiOBZocyA==
X-Authority-Analysis: v=2.4 cv=ZZEQ98VA c=1 sm=1 tr=0 ts=69089810 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=iFl-POHFLS5oe-sZTncA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: w690_laRXWMOUm35EoPSmD12WzIYDEJE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-11-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030108
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

On 10/17/25 7:08 PM, Akhil P Oommen wrote:
> From: Qingqing Zhou <quic_qqzhou@quicinc.com>
> 
> Add the Adreno GPU SMMU node for QCS615 platform.
> 
> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6150.dtsi | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
> index 3d2a1cb02b628a5db7ca14bea784429be5a020f9..e62b062c543657b6fd8f9aba7ad595855d8134d6 100644
> --- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
> @@ -1700,6 +1700,33 @@ gpucc: clock-controller@5090000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		adreno_smmu: iommu@50a0000 {
> +			compatible = "qcom,qcs615-smmu-500", "qcom,adreno-smmu",
> +				     "qcom,smmu-500", "arm,mmu-500";
> +			reg = <0x0 0x50a0000 0x0 0x10000>;

sz = 0x40000> +			#iommu-cells = <2>;
> +			#global-interrupts = <1>;
> +			dma-coherent;

please adjust the property order to match x1e80100/hamoa.dtsi

the values look OK

Konrad
