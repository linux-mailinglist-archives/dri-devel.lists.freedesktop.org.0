Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9F0B21DA9
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 07:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A283310E592;
	Tue, 12 Aug 2025 05:56:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eiG/uEgG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9267D10E592
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 05:56:36 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C4gP1h029255
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 05:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iO3FGVGfT/Y62Gvgar24D6JfUYtCte/97RHmCrhAXvc=; b=eiG/uEgGVyrbsO3+
 Cv1XZ9Mer3nCiMBO/p61JD6OuBveJMJ4+tj09BN98MHk7OvIHz74bVLWgv5tjNMs
 O5mgMe00qPMNNvVxFvilcWxg5/XThXGzlcfP+DCKRF87Ec+Rtnv72479019NeY5V
 +x3vUhob012fGcMD5ucywKYf2X4smkpgWPC0XlNQO7BuFxc++DrysRWXnU93Hg1x
 Mboc7E1YoDLlGKqr2iQkE5f92WFOyuRwQ1+b/+bxFdNK8FFv4PhQRqkzVztsnyr9
 RaISbD+Enz2ytDG9IKRmWL/KFcBImLVPiGz92y5SToTOjTIKvoEq1hSH2QlYp9FA
 GXw48Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sq4yk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 05:56:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-32147620790so5477899a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 22:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754978195; x=1755582995;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iO3FGVGfT/Y62Gvgar24D6JfUYtCte/97RHmCrhAXvc=;
 b=jUyZINu6U9JFDwRd7gpSfnzA27v1THGX7XVuFdQJiaWszCWUMiGcaYtvmjotIuLFtS
 JDKSZtWZWIzx9+qDcQ3I6oVnYl/FeK+tC68o7sRC/NwSFVQ/2eIe9m5ShPAOlWKq5dZD
 iqgF9Us191GYIVRhkGvTni3X695kZAI6JTkL9z1l+Z7LEtGwZEEhc6BY0K5FNb29Hy7G
 ucXxYMtqLkFwc+WvhU5oI2pCOxmrFMyQKuPzY7EkTbocA9MOlMDHd5QxX1edyyHQzS9F
 dpUiWQikiwnWRw153fj6bAwXGtR7NFVKSeyoXtL2fcPUldhdf77WYVF30tDtZzyt4s+7
 JINw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfIg+3wDByasLh0xuT8JCmCCjOlvFuUng04V5YuQtM1iirxDCmI7qtzYEBrKJ3G5Gwx25IpIAKTEM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEWAMxfe4Vt6+zvPwrWV6swDDqki/Kl8emwwEL9o7eXYz3rpoc
 W4l2wU1vAk9/7iNjbUYPQdYzNy2JKH/j1TTP5N3BXGcO3QP5guxb026BuvDtL0zGNhlgmkXQFJC
 pUVyETRoCNQEN4Wko5gA531/4qmjXIQ9os2xlNNNld1r2gMw+Fo65I6bxWKwW+R4XNsEb4Cc=
X-Gm-Gg: ASbGnctFHxUm67+/jKfAxpEVD4b89T362v6IaeP7k4kgcbM5vKdKD4mCFsIBp165Kr8
 ncCDKGKlTJ+LYGCrDzxqdCZazOtxQZNgXqVcbUy48EHUqIsINhdmnnINQklDvE/8DnO+wcRN9Uc
 PHXGk9U5/HmDGEoq0qma1qjOABbtFMdKOMJiN+NCw/MCAPCP2rdHuxD2kEqr/U4HZYts4/joPgW
 Hpr7WDodHVlMwNjLNJNiquZqfkxVEFDSmOcpoECupRDTsfpgxRvQPir6HJXwRRd+Bw2vySb3Hju
 bGAea+IbRPR/cRQ7G9oxF4Ae7NnBbzX/G+DzWiJQT5+qnAsJjswxolwVYU88IAtEo/RsOwg=
X-Received: by 2002:a17:903:1c2:b0:236:6fbb:a5f3 with SMTP id
 d9443c01a7336-242fc390846mr36339005ad.40.1754978195081; 
 Mon, 11 Aug 2025 22:56:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvQs0243cIKK62HPDyRoRpP+MCHl59jbXme4sVvLLXF1a/UdtW7iKiK6yuH3frFPHTDJLThw==
X-Received: by 2002:a17:903:1c2:b0:236:6fbb:a5f3 with SMTP id
 d9443c01a7336-242fc390846mr36338665ad.40.1754978194654; 
 Mon, 11 Aug 2025 22:56:34 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8975cf9sm292027175ad.110.2025.08.11.22.56.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 22:56:34 -0700 (PDT)
Message-ID: <881fe12b-b2b1-4135-b0e8-f8222293871d@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 11:26:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/5] arm64: dts: qcom: sa8775p: add GDSP
 fastrpc-compute-cb nodes
To: Ling Xu <quic_lxu5@quicinc.com>, srini@kernel.org,
 amahesh@qti.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250716132836.1008119-1-quic_lxu5@quicinc.com>
 <20250716132836.1008119-3-quic_lxu5@quicinc.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20250716132836.1008119-3-quic_lxu5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689ad794 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=2Ucg9gNHWiGhv-ArepgA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: MgfZdMkJmDqXdHZG1egJ60YTsJfJbKkU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX8ozsxjc2FDLs
 hzcDJLozojHdomlu9ec63yNjFzDlPg/r2hzz5zEZqOt8PuLPAGxPSOzE+baFpfbTJJqOhadlXDK
 gu8RV7didH/q1D2Ycs0VMVmrzPtJmWGTYlkV1lXW9YyhSl0XQiFXFw+bnd3is65ftkx4WihlU/o
 KQAhi0tMDPurH+FPzkzH/r4ca2KMougy0E2zWjKviDfJDJSLscIoh89ZOcGmIyC+2q1gBEdrREH
 aG+EH+o6VnzABTQXAr2I1oin7TLaZmQbSxNqWbUpWRNRU5CnjjZ2s2gW/ttXKctNdoIb7bK/W67
 SL3S4psAj0O3Br96IdRORfMME5Lpw0Kha1laQYrW5/dz3JwFF653iwJsP4sD/Lg6W4QE9UEI3Vw
 n6EtkRe6
X-Proofpoint-GUID: MgfZdMkJmDqXdHZG1egJ60YTsJfJbKkU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015
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



On 7/16/2025 6:58 PM, Ling Xu wrote:
> Add GDSP0 and GDSP1 fastrpc compute-cb nodes for sa8775p SoC.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 57 +++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index fed34717460f..5ebc058931ad 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -6080,6 +6080,34 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
>  
>  				label = "gpdsp0";
>  				qcom,remote-pid = <17>;
> +
> +				fastrpc {
> +					compatible = "qcom,fastrpc";
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +					label = "gdsp0";
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					compute-cb@1 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <1>;
> +						iommus = <&apps_smmu 0x38a1 0x0>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@2 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <2>;
> +						iommus = <&apps_smmu 0x38a2 0x0>;
> +						dma-coherent;
> +					};
> +					compute-cb@3 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <3>;
> +						iommus = <&apps_smmu 0x38a3 0x0>;
> +						dma-coherent;
> +					};
> +				};
>  			};
>  		};
>  
> @@ -6123,6 +6151,35 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
>  
>  				label = "gpdsp1";
>  				qcom,remote-pid = <18>;
> +
> +				fastrpc {
> +					compatible = "qcom,fastrpc";
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +					label = "gdsp1";
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					compute-cb@1 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <1>;
> +						iommus = <&apps_smmu 0x38c1 0x0>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@2 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <2>;
> +						iommus = <&apps_smmu 0x38c2 0x0>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@3 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <3>;
> +						iommus = <&apps_smmu 0x38c3 0x0>;
> +						dma-coherent;
> +					};
> +				};
>  			};

You might have to rebase this change onto lemans.dtsi

>  		};
>  

