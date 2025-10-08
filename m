Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D863EBC49B7
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 13:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7DA810E0C2;
	Wed,  8 Oct 2025 11:46:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UProDiaF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93FCE10E0C2
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 11:46:58 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890ZG2002187
 for <dri-devel@lists.freedesktop.org>; Wed, 8 Oct 2025 11:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zmZqI/hK2QIPAuDXDoC713x1X6hbDw/7hyjWJFFNTE0=; b=UProDiaFd3+bNfr/
 JAMFmeTOf8+SkbvblGKTR06dC1qYCi72cCccPdz1X84A0oBNXWSbJ8NXXh02KB72
 WfE0bPkXgRm49IMMYEmrxBpBP+nVx6z3K2iO45mzz7Wwx+HukjK2twkuu8CIxbxw
 WTBE+B2H7tc839FrzveOhRa4zPiTRyyUbGlBqud1+orHif/6xN8ni/W5G0lZm5KT
 iPJ3GfxERsvCOkLRpg+Sp9XfAasDi0khKs3qMt1RI5Ihf6Oz+xK089HZffFb3er6
 qVOeaokX/617+OZxzQQ4C/tq7XTxpDaE/NiX0t7D/T5oLvwppVw3wlEzzeVVFp/N
 /D25Wg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy728sq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 11:46:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-819d2492a75so339869685a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 04:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759924017; x=1760528817;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zmZqI/hK2QIPAuDXDoC713x1X6hbDw/7hyjWJFFNTE0=;
 b=cF/PEcIIuc/aHAdwHabPLveaDPAauzUXmOAhuunyFCGoyd1p2jpKRzeLIo9vFauFrT
 3d6EbRhmZtqfmImltr/G+/0iQQi+qJTkn49mkn8fgwxTHlL5vds2k/FhpG139Eaz1RQr
 oecRGVarlfF5LVQjZYaqovC8pLF6BBnaIgsHcQjC6buIn72U3H4Za+rYY6doWD53sNmY
 VmvZFumwNHRodAUxwEV8W0w+N2ypBIW54gHTm5RoRcqCtOH59IVGau3dssuHAC+kZgyi
 6hW08M0a/jEXL9Mi1mMDCYd3cOgX5Bf4m/UvpzmncFKKf/D/lJtC748lsYsBFuzMt1SE
 ebOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCURBMAcxKNV+dh0jOk81C3FqXJsvs5Sv7t2sk+6fHXA2T7xjwrR51nuMYw3ZojMGki5Et4+jmfV91k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziGfJzJIAPGagp3/fEuFzepMpB2qfcuwYdaOPVr88DsjGBkm4s
 EElASZMdRnsE9rjXC2DufXvbFZsQEJIqsMzpbKuY8V9+NkGSsb8q4Ky7dELKhF6oh02fQdsTYyZ
 Kz+PfS2UDyvLhPo6SkUh7gmA+O/fcTV17/nG8MXduv49p+VWBASwhupwPZqnNPxsRepUxSLY=
X-Gm-Gg: ASbGncuMKiuJ/z5ZEkxiaxBbDooooWEtIJHF6+rwOal3ajOB/Aa4NnmVJY7s3Ftn0Dm
 DaXLQAKJhgJQs5qe4Zbq2AmuFXcQYC3xnGwD/j8YBVuAVsP3uwiN9jpTV/PnyXFdRGSXxCvc4Le
 gh0A3gidJplvd1VZ9/qPzti1hVbXKEtASybks/jn0MTyVmaUkm/3cIUzv9Uq4LVHKhxcvk59+V3
 4B+JIOsiSQYXI3W7ZhixsJlpdZE8o2R1Mu1ZgNDSyjBtJaPYK80XmtazjSiiEi4Hnp5927nzeg2
 CmrIwCVUKFckzHJok1S62uGaqx21QlI41e52ppr26OBk5/Fr3VcGhlV8VwAsiCFdreAnFpFKlfV
 z+K9gRn1yBI/mT3DBPJe/Y9l4iSM=
X-Received: by 2002:a05:622a:4c6:b0:4db:1bd:c21c with SMTP id
 d75a77b69052e-4e6ead390dcmr28342001cf.12.1759924016846; 
 Wed, 08 Oct 2025 04:46:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhzBijvONPiblMY5efLfCzWLUGbZqk/BjrQ0UR7ejEdPzLuUFe2mN6EtMi9WvZDTQu1j0KPg==
X-Received: by 2002:a05:622a:4c6:b0:4db:1bd:c21c with SMTP id
 d75a77b69052e-4e6ead390dcmr28341691cf.12.1759924016308; 
 Wed, 08 Oct 2025 04:46:56 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4865a83f5fsm1649154166b.32.2025.10.08.04.46.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 04:46:55 -0700 (PDT)
Message-ID: <fd49f3db-560d-4633-ab59-fa80f9baf698@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 13:46:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/17] soc: qcom: ubwc: Add config for Kaanapali
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e64f31 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=WkYBtKvuumTgCfpkg3wA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Wib-VrqRCl6OaWPqL4g7nrzBlcy_8PTP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfX5NkpCFWSUfkE
 8t11uI6kLye/fJKW71aPHKIwsq3Mw72LgMg9S0PeJFE/MbqZqLv2YsrZPx8ggo1BL8Hai7sQFRf
 mVtmt28XrNdfQNVrv4Ki1c9rCkrkFwTlPCAu1IkI3Vjw3lhel64FzhjfmtXyauYSMmh0Wb20ikL
 8reGYY+sf71nOgNCAo6EpgPBHEzwVRAz6S6krhOQWG9DClQugVenWYfqg3ZgcZGSnudAzWpiGhS
 G+0WegayHxfduPpBHSIBuZwR3nTSDuKAuZXWUmCigZSUbRYP6r3/XbI+Zn+WrhvXDFTz5htqpBc
 epI1B6wIdUDosOKBNXErFJ7BYwOmO279eHbubSvwpx0bLdMnRS9jmM8KWe9KwIW7GrEsGq9UWGx
 /I+5p/IIBmsrGoJoVceEq07SR5zPCQ==
X-Proofpoint-ORIG-GUID: Wib-VrqRCl6OaWPqL4g7nrzBlcy_8PTP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029
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

On 9/30/25 7:48 AM, Akhil P Oommen wrote:
> Add the ubwc configuration for Kaanapali chipset. This chipset brings
> support for UBWC v6 version. The rest of the configurations remains
> as usual.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
