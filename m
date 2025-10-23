Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A825BFFDE4
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 10:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D12C10E8CD;
	Thu, 23 Oct 2025 08:22:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M3D/dYor";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D4F10E8CD
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:22:19 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6tagO019818
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8FruMMDEn1euhlML1huGGXWeCVKOxK18le6bqpoMasM=; b=M3D/dYorK3RcIt7H
 jJ55aYz/7RKPCryvULpMhjyJ9CHcFylvfk/9r8H9Tn2J8jtVr2TgatzdVW5ocAzz
 KlFXjdcFtGC3bI4brJU+UxlgCUrsy5NCxQB6AFvK423OOVRf7+11JVVAhbuDANhJ
 L2L0yPns8sRASb9lkySjZ9xkYdGQ37kadKwbrS0+vxDvNpJXaJq93zyvQhvMMlV2
 Bzktpfq7R8KJtQyDbqDVqOjpjPsKyx+65fIbayk+NxEHOc+CbVMUjr0YnSCjgUfY
 y/2yIXnKfwTbicUp8R09X6pNgtrzl6ZCx+riHFJkKiF4FLWyXcaqCqisfooJCSrT
 FXqyfg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkpsd7cn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:22:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4dd3c89ad67so513401cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 01:22:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761207738; x=1761812538;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8FruMMDEn1euhlML1huGGXWeCVKOxK18le6bqpoMasM=;
 b=Z6N3DCRbIZLMNeR5naqZHBIB4FLJx7faFH16y/z8WwxM2HmNB3XZZzb5hnag1a3ynt
 rASzOh9bHMWjtobaXYzF1WQtTaktctzsES1Ie3Lf4H/K3ke8y4LwX0eUTt0YBvrpG23s
 Cwf572Iadt8enDk+Xniov8W4lgdPsGlZU968UzSLN+FizLGDRIkh7AolyfixtoCWvi7w
 i0s4naPjHoJw6FyfqElwM+V/svJ0LLww8HV6FLwMeUwM0aQGidrjaTmYuqpQRITRITVV
 Ye0IL7sgDJkT6tUKDXds0jESj6epBRhBRQHyGyIzZpN8OO0chTZ/oI4r2XxEAn9jIqb9
 AlOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWz1jORj3hLHE9X4Vc/XrCypecsgLe3Kg1fs/LEG1t9s6RzLHXvhSLuyvqiDjapN8z3/qMctIpuY9k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVDq3C7o5hp+GDJodwxztSL1a2JI9qw0Y2uF5t8ejeeebPOFhA
 8bwlbdUPuEN5LEweM1wovH0wY+E05i1kxRQrJ+afR2v38mEAzo+/BfOYJWDqHsTuRuTOpyLzMHs
 nBJzXNntyXS/hY86xqdjMpSi8QLM3L0XbT9f/8D5tORkvA5huEqBv0wpGgkvT+BI3eliFL+g=
X-Gm-Gg: ASbGncuMbYTL1BU8wgdIgC2gfGtjzadI1a9RludbaRtyBAxGjdYIcsyBNDckdCBVE+D
 1Zznt/7BJiL7S51lp/8HAC06oG7d4HtXxRLAh6GghlDF31q3BEpiWZmeX8qwK6ojsWxFPiXmNOV
 yKWzysY3n0Dmb7w8TVsVISLG2QdHtvNW8ZOQvES+kgDAlDeFx6Dzccf/lOFmi4isrH5vtcqBhgD
 gObBbNCw7YP8Mikv4bWxqdraQsk/nxss8+Z4HDfapc2yTqMQqjMHNg5eAGp5mW7ejmTk+UyPrnN
 i7X/rb2WFf9uIrdCuBExc0XErDN0Uc3fJgooyVgBjrAow53Hb1dJ91zbhD/7eWFlA+gA1Lw6DT4
 vSAnV8b+Dk04CJ+6KQ2HmSk3FRxuqTNGGCiNmT3cwoEmegpps5WcuT8/L
X-Received: by 2002:a05:622a:20a:b0:4e8:9ed2:78fa with SMTP id
 d75a77b69052e-4ea116a2337mr82965581cf.1.1761207737733; 
 Thu, 23 Oct 2025 01:22:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2XIoSLrV1GTocr6bbATcJdQVR3JTJAVs0QtA04SjsNS+0NDII1q5KQNFmWxX0Qxq+jTp1XQ==
X-Received: by 2002:a05:622a:20a:b0:4e8:9ed2:78fa with SMTP id
 d75a77b69052e-4ea116a2337mr82965141cf.1.1761207737193; 
 Thu, 23 Oct 2025 01:22:17 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d51471c24sm157607666b.75.2025.10.23.01.22.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 01:22:16 -0700 (PDT)
Message-ID: <4f9573d3-41a4-4478-8c19-39716b29f587@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 10:22:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] drm/panel: Set sufficient voltage for panel nt37801
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>, robin.clark@oss.qualcomm.com,
 lumag@kernel.org, abhinav.kumar@linux.dev, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfX7/O127vlI65t
 7ZKoUFbdQ6zpE5vsmbCQRAYbyph6f4AZc3yrgCfMYtHyFLz/FGy4hiSjd1u0+R1qooBctPoK//a
 fPF8mz6UngB+zEKcajU/tlB1jfTO21xVG55BinA8MU22NmehzVCxobRviHJ6VzoNvCvhwoP1wGl
 phkY/j3BUcQL3+DjfjlI0z3K/j6BcnxP38Ll/dGriPHIn3IrR0JsEJ++qHs/v/ZXVBn6VFPc/wA
 PkFQte2nZK3hFJolKVzdmuobRkDe3pKcKzUD9IXJCskhJ1FrNDfoa2B4EZ/EZ2rDXA6mpqT2jzM
 ttQKbhya4lIQYKK6BOZ3gFdAgeHhqhCdsMXzHuaP7MvIP/Cl760Mmn/0u5zH3b7NORjxIJY5DkS
 tDjNs7eQkd1KsoUTkrCd3SuVj8hPJA==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68f9e5bb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=91DCyrf_GaaWAzlYtecA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 1d3vwwyorWRUBCjcvL5z3WJnitwQCUWw
X-Proofpoint-ORIG-GUID: 1d3vwwyorWRUBCjcvL5z3WJnitwQCUWw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190
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

On 10/23/25 10:06 AM, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---

This patch should have been sent separately as it's not at all
related to extending the msm display driver to support Kaanapali
*and* it goes through a different maintainer

Konrad
