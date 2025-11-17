Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D20C647BE
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 14:53:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B1310E3B6;
	Mon, 17 Nov 2025 13:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mFtFuGK1";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cJR+8UQf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FA610E3BA
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 13:53:04 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AHB64ac4107460
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 13:53:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Yi+BdGPgnrk+oNWxD1uiFb+dRMmL82ThS7ds7IVksSw=; b=mFtFuGK1MCuVmr12
 f9haVzaVKOz32O1RSgy/Q2GSQLp0IWB6W1rgvDBTRR86RSit5e/+gL7U9Xf4xY8P
 PpvZb8gQE910myLphQRL2OWHai4slaABAa+akYYX6cdEGm0iZinbzoeouP3lFqwB
 FiE7ADx79zOF4EWoLQio/1MMQ/F9Ipft88DUbf8M2q+dpOgrluXfim46yIfXD+Vl
 LGgURcg40mLjKu/qRRbcCHsAuhQRpz/dcSqa8Vl0cBZ6skK2SqI7rHe9TqHvZr9m
 RYZdThUlTtssyPSjrI4YTIolsb6e73tn3hD+UU+sLtYBVCq7O/CxnI8efXt0ataz
 og8aZw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2hp8e9u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 13:53:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ee24e1559aso690661cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 05:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763387583; x=1763992383;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Yi+BdGPgnrk+oNWxD1uiFb+dRMmL82ThS7ds7IVksSw=;
 b=cJR+8UQf+D6VDcEyx4YaMTF/sOsgOwpAJQY+MBFnGWEPsX3UfTwQZQoG5nWEf4XEC6
 3UzW+wF+6mt6lTONyXKEBf1tFOej8WKcplQ2j7GkhRT+6TvFqs5pfrjtu1pUvBcCW8R8
 ry7nXQSAE+mlqovSaGvjJw2sSczpgrYlakxJcO0rqMQNenREeM8XEx5Ylqu3iPTr94IL
 yP/PgVcWXXGxaB40ztqHs6BMcGzaLDF6Y3E86wTT7R8hM58C6G9E6Rnn6CcPKqVAs2U/
 CNEuGaYMBUuCsoF6mVQ4wlApuSo2neec4yzmMn91Rv3Di0yyG9odR7/bOhQS2XEKd4Xi
 bm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763387583; x=1763992383;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yi+BdGPgnrk+oNWxD1uiFb+dRMmL82ThS7ds7IVksSw=;
 b=qUp0x9GAc/og1MVJ8aVi8g/UVvMZZhRF4Nus3mB7snvsTyJ7Df4DBvvw7c8wvT9p5n
 KLQAPhCtNSuGJgKMIYtxBLSNd0t2drmifRKPzpdFOyJ3aE9MxBrjyFT+e/9cjrD9S8DT
 mbKPViYxUi7DomQ2rKGr7UeyDLaTTufBpiyynrdQ+BeLKqOkmh5C8eT4dMSI6xj83etB
 q5rWWMUl5Skd2WKc+05AFnaqRF8pPfuZv5lHAR1FtOA7wtitTxq9L8qxw29GFSAPCB9N
 32M30SKzXekbFNV8jevTlBcG0nNNGkAMvbpovEe16OIRtLuNYPr+98hLdmJvzfdaw8yq
 LC+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI5rXSmEjOGUj4f3EVZ+zOXvV/dZNZVqil12KroTeFbJ18hEOMhv1dWgPta3viSQcpGq8yaqbwIM4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynEO1XXWjuFf0MvDS3K6kDJZeXNAtE0yZmd7B8dOv1HQeQJL1Z
 dx21zR8vZzJQ/rMgFcFM4o8mY7trcdzmnbbZMo0g1A2g0/UtgbvslnLxMcWDY0kLTurbrvd9qfu
 T+g9R7euAh5lhgzHvEPSaRhE+Pi6wwf/bnzR5632f1BhV/SOqBbaN7ULt42OrEFsOAFtVoRo=
X-Gm-Gg: ASbGncvihQrz3eIaY+et7fzy4swfXZZwnSWN/vBtn56E2W0L2BiIt3S24sQ6bsGQHoa
 aJ9n4bcxJmtSCDOkWlCyarINvs5ZmCwY0pFHqCOcTCRf+m5CjEXRo0CsVH4MrB7WsUiwvT0W5Yx
 R5VZAtQFBeqocUmtNxGjnti98bBh1BTQh+Ra8wGVfkj4TYtiWQ68UQWdS2417tEzEfcVIIycVc7
 lUgMbyB6crG3Gd2N+oin777BQ6fK3CA/GetRF/TwaXL9VFVy1YMHIhZchWBC1MI4g4ekt8tXUP0
 fIjyE0ly99+JJ0WRZkAa+p3l8Lb8B7+kGnptuKMJ6rY0U2xxj6bhLh7jeYl0cEvvUN02Ibkxi/X
 WsmFS3fiTsP8VfWRgGhIfCnmcj870cCBX8Bigax/8KEbQ7hLQgazLXsrc
X-Received: by 2002:ac8:6f08:0:b0:4ee:1063:d0f3 with SMTP id
 d75a77b69052e-4ee1063d7d8mr73608711cf.11.1763387583368; 
 Mon, 17 Nov 2025 05:53:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFP6/ieJt0wbfNJVaOx0h7m7+0k3hS0h1MhOub3nCOiBuEQbZ7V+KAM8rQUI0q8j+iY7BfrDw==
X-Received: by 2002:ac8:6f08:0:b0:4ee:1063:d0f3 with SMTP id
 d75a77b69052e-4ee1063d7d8mr73608341cf.11.1763387582843; 
 Mon, 17 Nov 2025 05:53:02 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fad43dfsm1089481766b.20.2025.11.17.05.52.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 05:53:02 -0800 (PST)
Message-ID: <73c3de56-5c60-492f-8b1a-209b5b06e7e1@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 14:52:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/20] drm/msm/a6xx: Fix the gemnoc workaround
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
 <20251114-kaana-gpu-support-v3-2-92300c7ec8ff@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-2-92300c7ec8ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rCijgoIrZBdusKvPQGzeVzNYiMetbB8S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDExOCBTYWx0ZWRfX6p3LJMErgctl
 kdMWscimM/zYXGnDg18MKq8lmvXXUVnlHrpPbii6+n52G2Bq3STyIr1w3UOxexByYGJaiW28+s6
 vpYWo76Eew1yMUTZgXDoewTA0CxD0BdAQrx197Yf1r99SUKzv4Xs4RWZbkSjs7YMN2RCJwHrUYI
 lcsTEItXw236zHc3yOkVA935L14j7M8aj8N0XhGarWf/Z3nfiGH0Da23flZavGfpEbYILzqxJkj
 A+HBYzIKigHF38x06qKvjeh9zIb1GKlS74U3Dz45xU53Ehu6oqtIseRg12ESmPvynwCs947ey/T
 +dEZYj2zc5WHcLBpcslhwGcEdeVk3OUffEc6hd4aJs2xh7JlVfSYn3q++fRKHyvruNctlnuGoaf
 Mux7INBIpD1gnabWEGhks9rFFUWUkQ==
X-Proofpoint-ORIG-GUID: rCijgoIrZBdusKvPQGzeVzNYiMetbB8S
X-Authority-Analysis: v=2.4 cv=Y5L1cxeN c=1 sm=1 tr=0 ts=691b28c0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ws8SwQwlQu7ULn3ZA60A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170118
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

On 11/14/25 12:28 AM, Akhil P Oommen wrote:
> Correct the register offset and enable this workaround for all A7x
> and newer GPUs to match the recommendation. Also, downstream does this
> w/a after moving the fence to allow mode. So do the same.
> 
> Fixes: dbfbb376b50c ("drm/msm/a6xx: Add A621 support")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
