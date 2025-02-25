Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F052A4402B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 14:09:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D47410E0E0;
	Tue, 25 Feb 2025 13:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="H65x+jn1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1707010E0E0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 13:09:41 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P86quH013314
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 13:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JXrbx//ujq81B4fzdK64SVgLYo/iHJ8aMUM9T0W/s8w=; b=H65x+jn1hBliDPdj
 VMZE5Dh0TVa72wVR+siWa9hQLAeXnZxWpdn51hKjD4fkkGTqWP3V1hjR/ES07liH
 apMwOKugawG1GL59ioQSavLP2OhL+touePl7kqF+kjAERTYEO9qHEiIbnQhYpHqv
 FSnZfTWXuEL0gToLFevA+MYm6iRgsNmuw0gpY0Z9Ohpb3T09CiNa9wPD63q4D3Y3
 1G1q10FzYJDfHNuUYiudBUH+mtrZaWqNBcLlingxk1A9hoq/b0PCENHKJjdf6XDx
 rArHYMT/GCg6bcfeB6OzxTgb98HKxQvOG2CRaZqyBeAOQUvUgFSCIKucLh1Dedek
 R/ur4w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y5wgs0jq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 13:09:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c0c491f065so129227385a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 05:09:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740488979; x=1741093779;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JXrbx//ujq81B4fzdK64SVgLYo/iHJ8aMUM9T0W/s8w=;
 b=gwfDOlMxRsKF1ICz8SbwLQeoWesBFhHXIZle9ZyGnpF3Ulq1OB2RJdjklaQ2qecAPL
 bZ5PnB7zUELYXkD66k3nZD8duSCtfob8zavnyJlp6vr7KisSYGvnS5C0+hA3Yy7QHE9V
 ftFY1S4vd2HBau8k5ZZm7HfEF6pBsaKfIYdMv+rzEUJj7gIWEyzXa8X31c2uVwyGR0yL
 umPup2PaG6GaWmd9z+ryvgoCwWHzLKQIM16aRDlzY+RbpYvTWPIu3120//9nANa09qXj
 AFtaMZqjeZB/Q1LxGLfCMEm8l7uqC0/bHWvbeCBeYDcSkqIketV0y28dWieMpuOz3nvV
 Bfog==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1v/HBbyAyPHWIN0094PaEUx5Pph+gB5uheywgzmRrw5nPctp2ERPuyeLhcRXjA2Ztxk7X3cwWbWQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhkG0SiE20kzFGZHN59ZbPkmT/bJk2Zz7L9vPFWB92CkJENYPR
 nLOo0HOxewlk4b+MIoc2TntOKpagnmZrmVAo0faVVBd1r81FmJpcrghrUVzlASlCKUiLylvggXQ
 gm965XWl9uLh5tUgWiMHzkS6pb9ZTg1K0Cqf48C0MDF6363Jk39Hln+CdtDWzh6O3xsM=
X-Gm-Gg: ASbGnctdqa9FQDRJBM1ovr+WKjHmv7zNJuVVe0j0o+CRCBj0263hlaQoMmYBrHcjh2h
 mRSXIKEd9FSpiEyP1BScdatLIGwocWEa6gTQMDo1vr5qb48DiLB+Eo5n2wk+qsVzGZpdAr6lAGa
 YRITeNUA407Fd/ZOdLT3Ggl+shnH8SQLaRgRPEefjh1kofDmcLNjtf/gzHE+dpn8phFmbRABwyB
 8CeA8E8KCyzPpy++DP2QIJEQhhYbVhSE4vaiFQj8nqQeiphD1ho9kef/3aVvh6IY1QC3wOStWm/
 CdIxapg3clx4voYGHlClPbHYdJyxWPulUNe/z4JdF7r3/7Hc37UEbHGJBeSKx8TPXU2BDg==
X-Received: by 2002:a05:620a:22ec:b0:7c0:a1ca:93af with SMTP id
 af79cd13be357-7c0cef00e4bmr741969885a.6.1740488978931; 
 Tue, 25 Feb 2025 05:09:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGa0uJOUkscoJFqZcu/UhVHgYJ8ocIz6ucSftAjdSN31RKxhGpmSriOBUPSXTaf+LkELJ1nhg==
X-Received: by 2002:a05:620a:22ec:b0:7c0:a1ca:93af with SMTP id
 af79cd13be357-7c0cef00e4bmr741968385a.6.1740488978416; 
 Tue, 25 Feb 2025 05:09:38 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e461f3e84bsm1208986a12.76.2025.02.25.05.09.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 05:09:37 -0800 (PST)
Message-ID: <7785000b-db32-483f-ba2d-8536e00e10fc@oss.qualcomm.com>
Date: Tue, 25 Feb 2025 14:09:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] arm64: dts: qcom: sa8775p: add Display Serial
 Interface device nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
 <20250225121824.3869719-7-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250225121824.3869719-7-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GKh_DLGqcIK7J3r-9FiKzhtnZ9W26Cr4
X-Proofpoint-ORIG-GUID: GKh_DLGqcIK7J3r-9FiKzhtnZ9W26Cr4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250091
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

On 25.02.2025 1:18 PM, Ayushi Makhija wrote:
> Add device tree nodes for the DSI0 and DSI1 controllers
> with their corresponding PHYs found on Qualcomm SA8775P SoC.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---

[...]

> +				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_CLK_SRC>,
> +						  <&dispcc0 MDSS_DISP_CC_MDSS_PCLK0_CLK_SRC>;
> +				assigned-clock-parents = <&mdss0_dsi0_phy 0>,
> +							 <&mdss0_dsi0_phy 1>;

Please rebase on this patchset:

https://lore.kernel.org/linux-arm-msm/20250127-dts-qcom-dsi-phy-clocks-v1-0-9d8ddbcb1c7f@linaro.org/

Konrad
