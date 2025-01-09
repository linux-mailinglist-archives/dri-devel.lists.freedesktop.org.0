Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96077A07719
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 14:19:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1316910EDCE;
	Thu,  9 Jan 2025 13:19:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YdGSnLKO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00DB10EDCE
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 13:19:37 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5094h2N1018830
 for <dri-devel@lists.freedesktop.org>; Thu, 9 Jan 2025 13:19:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Fcos2SHO3ylh+6v6GhnN1Oisu/ti+XpNhYVMWRKSLHk=; b=YdGSnLKO6VXCIH94
 0ZjB6fK6UEn4Ma4aoX2U2CpiTksmAKD+ufsTRyLezBVcTuLBpTViUziSe/60UVzA
 Gku0n6i2MPLm0BemBkKYA3FIsmPTbmUbeTUYLxDhgrpwdJhFnldyKggUOhRp4NOa
 isUF8so41gZ3isp4fGk+W/7uE8nZ+Q4bZf/8stE7qhBr4NpXYC0fMYXhgQ8yUtNV
 RY3diK/zimLaQL7FsBuCWG2cuLKf24QwkUq5Z/tKfGw+fUd9mFBk/XdhEe/Q9Ajr
 oqeal4vnGqCcEsjTRxkPGsdGiiQKj4rtOWkmmxZzrereH2KThgZVsKboHBez+rV8
 yodguA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4427nws5eb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 13:19:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4678aa83043so2183881cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 05:19:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736428776; x=1737033576;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fcos2SHO3ylh+6v6GhnN1Oisu/ti+XpNhYVMWRKSLHk=;
 b=LKDbPlLmh+Zsttqk2zw2QUMGIAdn7bxbWQnyKeisuapN1LgJE41hajQVEIEC11tnfJ
 qZOSeKwdbBe4Z7Vg+qz+cZfPebfjOr977R3nCqUAPmNH7THl2g6BQPZVkmkT9evuwZoP
 4r19ead2ewh1vB3lDLA+7fvuf4v7WBmnikMq2EKChB6P/RXUnfkp3VHNj+r+c1uqkWqT
 bfeXFCK12mVKrbkNK45L1onkJ3KfFKJ2UuGcw7Fl4ZHOfRIgZjQivupB9VmNObu22Xb3
 WbyyxfWG1DeJKgLRGvgGogoaNx8w09So3PTTVaNMnE3YUccM372atE3iYn4SfXbzx6Nq
 EYDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzhkcjZlSqW1UROy+rI/wJ7F75xcI4JvkdMXdRE6tI0NEYyrHEBR7nk8H1XCZWJxuftZz9E89DFUg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxm3tcc1xBTisasrUq1sYYsGEFMW3LL0BADFCM/YH2rGJWe5zA1
 ZyKN32GheyS2kmUqncrRH5mwfEg2sgi4pI8HQPXWwMLfv8iKwNsoZqMLZcD+8R+b+sWBVCil1Sj
 NK1OPvBryXyNwNTDLqZkjssTCIh6UuQdpKAENx7Bzqz0z+X+acjjc1Qh0IC7Yo49eQXw=
X-Gm-Gg: ASbGncvgjs3iLCTt3HOirw24lZxRy55Fsmji9Az+v7AVOdfGwwzmewKjFg/rWVYYVGO
 XWKpr9QDq0I976XKEiOO71sFc77JQDwaAU9Y6aUPXYYdNf7t0LD0tm3zgeEhLX0NiLyeV9HxED9
 f9PGaCrTN6ITvgzwOsMmM6ayDLGqrnO9LuItBYdFOQRg7hY9YjYGO45wBlco6bqotyQP90cLHx0
 6icnZ9IVUvD0MGccpAJkW7+Ee3Z4BZ0+pcU7/MbM5mUQuzF2wpfXJ08DV3ti+6Hm93wbh8KviTB
 2Qna+mkPAZpgAlgO1zhlQqMZNBQb98i5W5c=
X-Received: by 2002:a05:622a:401a:b0:46c:78cc:e53 with SMTP id
 d75a77b69052e-46c78cc0f32mr24138061cf.0.1736428775813; 
 Thu, 09 Jan 2025 05:19:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHe3uxKGrbYLEc68rCffIx6PrIJfHwygB8OQEV7vN9RWdcNYSGKjSw7IYaLbJUpoBaf4Idqfg==
X-Received: by 2002:a05:622a:401a:b0:46c:78cc:e53 with SMTP id
 d75a77b69052e-46c78cc0f32mr24137781cf.0.1736428775411; 
 Thu, 09 Jan 2025 05:19:35 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c905f0c9sm73056566b.19.2025.01.09.05.19.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 05:19:34 -0800 (PST)
Message-ID: <1c27fada-e283-4058-b944-1b49f7e5d1c2@oss.qualcomm.com>
Date: Thu, 9 Jan 2025 14:19:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] arm64: dts: qcom: x1e80100: Add ACD levels for GPU
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250109-gpu-acd-v4-0-08a5efaf4a23@quicinc.com>
 <20250109-gpu-acd-v4-6-08a5efaf4a23@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250109-gpu-acd-v4-6-08a5efaf4a23@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: j2anep-GeUCNYbxR1PM58Gn8PAN67-Mf
X-Proofpoint-GUID: j2anep-GeUCNYbxR1PM58Gn8PAN67-Mf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 mlxlogscore=731
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090106
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

On 8.01.2025 9:40 PM, Akhil P Oommen wrote:
> Update GPU node to include acd level values.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
