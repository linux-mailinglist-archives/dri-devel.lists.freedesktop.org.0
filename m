Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F041C7D203
	for <lists+dri-devel@lfdr.de>; Sat, 22 Nov 2025 14:59:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B130010E092;
	Sat, 22 Nov 2025 13:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CkHHBHDF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E2WMIECj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7AB410E092
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 13:59:47 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AMCbkaf2444169
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 13:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UPiNAw1Tt7RvkHyG8Y7Sk3PFLPISpHRMaZn89Q+0vA0=; b=CkHHBHDFmKRJetWF
 BTF5P9rQP8repvG6d0gkqwZWg0dTXYONHjh1vx3a4x0EqrffPCCl3Z91MoVbvluz
 ckzFVa1prFWXIFOAN6QGQkOb2FbpT8+e/4eN+vVglmyqwYAkS6KiSekpYCG6PwMW
 1JXTf8KzbIUlivIeDFQnjIrTVyNaGMEChpsVq9uefFKNugW87CkYxf/tf95+NsTS
 WIM2NEFmhcNj11cX4uCuBmMnV0p09/6snnaJTo6jtH+NJGczOkySWgxgRy5kxtfk
 dFL/orxmn4e1ghReTFTHJHKh9L8z1VkMWyfjrcVlHP6r3dcA3qMbYejtAdo8k5kH
 DjX2QQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak694rrds-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 13:59:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ee409f1880so5943721cf.1
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 05:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763819986; x=1764424786;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UPiNAw1Tt7RvkHyG8Y7Sk3PFLPISpHRMaZn89Q+0vA0=;
 b=E2WMIECjRxGnItR6f+PvQMgZCxKAia8+0uyA0+6W/LCy2MIwtRgC2xOoSlxNx5QxkD
 XUwFjK74dg10YiYUwFp4S/S8en6M928jyG0cn8YXQTLts+dXyD9SkXTysZGu+yh+1Azd
 gWOe/pdDYKtZnDMNR4A5Pv86s1rkEyZpwzqdd4TruvC9KHcT+Jg24dDH/Bw7i1EQ+Bfn
 ICnG3NaeY5Efodvh78y4TEgHoAPY5Gb6ps5I0sxy3sG2gzaV/txaZPVzhNnAybw7yq8L
 Fk+UB0Hs6aTe/gymqLuxevcdWKtHreFGq4GJ1LQRKO4GJWG1o5EZx/crX52f7ubsMg5U
 EmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763819986; x=1764424786;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UPiNAw1Tt7RvkHyG8Y7Sk3PFLPISpHRMaZn89Q+0vA0=;
 b=v0b/Qj9GiZE64rFq61JlKjKimg11ofrhN1VTzUo1DMXFRDn+QM3qnIJ0aJdpAf9czL
 bWi81hTvA9HlwPSmFR5HXtXp/774ej9OECBm3XWmnw59v9M4AOSa3Ho4XxlB+B8XhXme
 1wlz3MDY7hgVS/rMIEMpdmc449qDxdwonsZwwcZAU8cjeQCl/0DFMdly1+V+oV93JsYJ
 OE4wLdb/3kojqN6Rj5JmHNklFTEGXf7NTdodJhz82lZLxHR0JtsgUvMM0vmWkH7qHzhO
 wxT9QU7lRyFIND0ngPcMj+tdqsz2InV2kwe0lEOgNRwrGciRrtQ7GYVpnydWG8gaC9cU
 2Afw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa+kqZ8yMI84jDTZP2w4mQgCqun/Rf7iXjCNMkGYJaPdbksQ3xeaj2DSFDG5T56PWMH8U/7BDMzrY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWHDS69T/FevOecnA2BItuYkkNd8AKQ50+rRzrIdrLcGu5pBdU
 ILj/Tf/3XozEofMKLbdeZnuvhaQ3wUSG3IXrwqWZ0ejVwfDOCnAJEDjIaCrHXBoi2KBotAstOmQ
 buIYdAU/sZAXJfNdgBf4UgylvYtAAi66E6SOpin9Sdok9m5jBGXqqdsUewbvL2rWhI6nldjU=
X-Gm-Gg: ASbGncvmyCSKqULhvJxeYUP4i7VgGG/qzhsLRtClNAaulW7nbDOkUfDx5QSvIrZp7Tw
 FU8f2Cvk9t2kQ/DjCzVybrd2IY10g6rDrxT6EZbnaY4eCyD9/HLHhnfCYRf2OdMA9csURmW5Bvk
 T0dnuYg1jkw1j388Y9PCVpBOD+Ulk2I6qZiut7EotxNpE6od6dztNAqi7EOGijjnTApCXW2+in2
 EyQvDwZ/9eRQJldDu0gELEubGQOYew40tq8BJHrKS4Lh3jCnIOrVBsisX/LD8r7W+St4XtO8Bw+
 mwLHfS55M/+acdFsDA1nwiciRwKiW5R3rVSwMI+4x/PzWZUGVOn7uuRE1q5IW+aWWkZG8E0ocER
 Fp5RHIjRlPc2jqvwvFZinznFd5nTvGaj6kE4lyyeVM+vqCE5hs3CLB67zuV+GWntIt1U=
X-Received: by 2002:ac8:5a46:0:b0:4e8:a54d:cce8 with SMTP id
 d75a77b69052e-4ee5885ba39mr57660261cf.4.1763819986385; 
 Sat, 22 Nov 2025 05:59:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFIJN+vL5B0qzR53Fu8tdU0kJslcRoEiovdfi/oC99Dchs3yUA9islhgT15c7fVbBvVSSpozg==
X-Received: by 2002:ac8:5a46:0:b0:4e8:a54d:cce8 with SMTP id
 d75a77b69052e-4ee5885ba39mr57660091cf.4.1763819985888; 
 Sat, 22 Nov 2025 05:59:45 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7655038011sm737185266b.62.2025.11.22.05.59.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Nov 2025 05:59:45 -0800 (PST)
Message-ID: <039dd3f2-3ea1-4dbf-81a4-ef1690c9236b@oss.qualcomm.com>
Date: Sat, 22 Nov 2025 14:59:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] arm64: dts: qcom: sm6150: add the GPU SMMU node
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Qingqing Zhou <quic_qqzhou@quicinc.com>,
 Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-4-9f4d4c87f51d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251122-qcs615-spin-2-v3-4-9f4d4c87f51d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDExNCBTYWx0ZWRfXy3ADISbTD2BR
 tgn/cXxxo03NhX+URezCAD1951K4YNmhczItNaor9byB4XeUXnTJ9RNjFyDnad/bXeEU7u0MkVF
 2i5oCyjyRH5dqH0MXMzH4JB0azr3E1PWZut54Deh0Lgto/IwQQMqwi98VmPk/ZsKz76fO6ESU30
 +PerzX8jfYE8Uup0pHbWr7foLo/X8CowTXn9Kd9Jr4XhM2+lpIaBhphDA95V0vG3hZhlzRMB5eK
 DX2YzxBiq/3jhZbwhf5M61Y47xgrA81vvMLEHB+eQpmlt1+oO/hokIfDnwgZ8z4/TKQOngWxxoT
 T4kstycJ4T6OBu8I+xqu0w9xWv1ch6CNKxC2ZyafJGtXyAY0jmJ4Y9+74AcTnAqVMakTj36D4Km
 FsxDiHXm4CG0kmiKRYPsFh9ZWnnHuw==
X-Authority-Analysis: v=2.4 cv=YJqSCBGx c=1 sm=1 tr=0 ts=6921c1d3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=QDjCMyA0A8yHJihhU1wA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: i9iFf6FSjip-g7ZyoQf86JNTIL6K8gJ-
X-Proofpoint-ORIG-GUID: i9iFf6FSjip-g7ZyoQf86JNTIL6K8gJ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220114
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

On 11/21/25 10:52 PM, Akhil P Oommen wrote:
> From: Qingqing Zhou <quic_qqzhou@quicinc.com>
> 
> Add the Adreno GPU SMMU node for QCS615 platform.
> 
> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
