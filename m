Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2384BC51A0C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 11:22:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3347A10E6E8;
	Wed, 12 Nov 2025 10:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="A3D2P2Im";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E5EJ9rjw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA3010E08E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 10:22:51 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AC9ggLi1109094
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 10:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5rwAyU0aPBERjod7wgKA1iXuGw5l4SeREMu619RQNrI=; b=A3D2P2ImD5qeuGzo
 jpBbHoHhTWoTnBAVC6dE7Q74dffCYK3d80Avh5EWOL9OPMibphll25jw/a+c2fLK
 C5Xv6OpsbOgjUViRvORZ+CEajalz9Rufz8i3y5mJ2xlMsqWP4CYR0jS6FfxV65Z5
 d867ln9H65q5ZU2XS8q/+NvwyDNLhI9aTeuQXWh7xnlDZOaHMasR3hzUsIAjzWVE
 evSA5abf0Rm28Ey5jE+QIs1WuH5Y0eqCeH35kW5hDrm/kkpjf/WzOU/kUnT+0InI
 kNXy1SsstRtaRY8vrTCrNCkHCRaxLqzO05nSOfn6qD8vBhrVoyDKg2u63Tt/Z4Th
 9sFYBQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqum04r6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 10:22:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ed83a05863so1995311cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 02:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762942970; x=1763547770;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5rwAyU0aPBERjod7wgKA1iXuGw5l4SeREMu619RQNrI=;
 b=E5EJ9rjwqOrAl/vtvnWCKZzT9otvNe3xWquJX0JkiJZM3Qz5t5iEsQCNK+zTs3/aEa
 l2xfCjOhq0wKIEcextZANcScdOsGbX38NDrKRLMnUMr1bP0DjHtH5YyuiahIT504GunR
 35rzrovg//Wvl8Nru6qO2Z4dg8fxOcK6U+dBv417m23ghawbJSmxaWDKfLQgfCUi4ZSG
 rbAZ2h2D462eKJcOAYuAPwFekO/z1yaIvmHk/iOBsgD7q1WeK5lSQ/twlqdDRmMAdyxx
 Z08KS9YpDeYkwsuWrN/RQ8EVdY4ACuZOBiSsQIyTfVW7ZwdLVSuPIN33RAYClxvDDcfK
 2hOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762942970; x=1763547770;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5rwAyU0aPBERjod7wgKA1iXuGw5l4SeREMu619RQNrI=;
 b=twU/TsUcZqweCEtgWgTkivWligt2gYJ857cPjMnJGlTr/lE+Ka8zaP4ZmvOmjEtLup
 5tfC8Oeh6FpLwbo6hkKiIJIRuV+FvK1akXbA9NYObrs4sZ7O0c9emgl/mH+dTJPmC8eu
 HW7taOfvbb6j0v711oDVNtgkWv4pu27RSuCJgVF5whYzDmx1et5T7gJK5lW8I3z1/di5
 1gsxNfNV0SxuCcfUCQEZWsFKg/z7D81ZpRVp9mQhrdiQWv3IKsbloFaKLbckc5zVEJso
 FhHXQqwPUIe3GMhYyABFSe4B/PgLT0MdMy73sYDO8sXs2TqR6NfnNjuVuUxCozEFEFXW
 P87g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYACRJcBbSdzbrSZ1VE/FZlpWJ4Omr8TVoF94/W/GBMv+1FTudgKUMBNlVtOQ6A+2HD56INSDdEKA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuCs9r88mGSKqL5n+6ECHkMNfW0+TFA8DhDf6YfpJPVh+2qmRY
 q8En4Il37ThDBpFerlzlkKAFMHS1QvSJav1HtvyFUXAZPgwaHn1l1VU+kLOIKMh/YD+jm4RVy99
 kMyFeq8+DE6vl2NnYEgQcTSO1vHKfLvuKykcKuAwyv5UrVV1TKw4ujTg8UmVseZ8Qvv3qM/I=
X-Gm-Gg: ASbGncvtDrcJclHCqyNVCBnB8j4NHrmfy1tBk0XpFYaqCo+JVllklPGSmNuz6jhgjjc
 hp521cN7M0t4xHhErzJpeeOGg95Pe9Rfm4KFDsSZcYFizJ6xxybK4f3BMiTgZCKif5D473BgQZ5
 27iaY5ghRSBN89WYU/4mtZSXL8wBRd5YjYcpvn4W+KLbql0QYhX9DlFxDgTGWrNJN2V9uniaa8W
 rX7yWFlakSDzQ32Xnb3vVeRIhZNom8jOeczJRyWxEliGOTE0iAutDp0IBzHUzXRg/YWj+H/P2aF
 DV0b4rTVZlE/QSmPXF/TTOpDV4l/wNicbycHe4m3FtPl6dnpMsYsy1NqbPvs9CrPs0Zfv+7LViK
 ODUqvp2O4HZpNGp435WmlEqwh264NMl+4XF03ItzC58jxfNGaP8BouWT7
X-Received: by 2002:a05:622a:d0:b0:4ec:f53b:418e with SMTP id
 d75a77b69052e-4eddbc6bc3dmr20363001cf.2.1762942969365; 
 Wed, 12 Nov 2025 02:22:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGebY4K7Namd6glwHLtMAZE0lf4hL9guGKfOfliFjM5eEuz55Nipc9SN3o1JFfip8JTUrox/Q==
X-Received: by 2002:a05:622a:d0:b0:4ec:f53b:418e with SMTP id
 d75a77b69052e-4eddbc6bc3dmr20362721cf.2.1762942968808; 
 Wed, 12 Nov 2025 02:22:48 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6411f862bd0sm15744925a12.26.2025.11.12.02.22.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 02:22:48 -0800 (PST)
Message-ID: <28d62905-c191-4c3a-995e-a4146ffce619@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 11:22:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/21] drm/msm/adreno: Move adreno_gpu_func to catalogue
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
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-5-bef18acd5e94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-5-bef18acd5e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA4MyBTYWx0ZWRfX7h60ivquRw8U
 b0uVdCfDZMUomMRg6jdDC1AB1ZgnD+PkV2uBtZCmHdMsDdF90K8pjszRxZ4m56u10pXPdP4v1+S
 5lqlYVHFgb+Dw6d9fsDKKh9Oq48cSCRR5/Bgqe5r+ekitZP+7dIqXZP/eMtDF0utxo6DyxX+Tia
 uRi4avfck9kab7grwroLfrTOhSfP/XBxFScDX5rZAQzDEwfRFynfMbE5dN+yb41VPrd6H1jS7AQ
 nRkcGVH+KE3V53Vx4Yz/JNPn/GJAc7ygvhBYNgdZtKxFFI/UncbpLshF0MPZlyXheI2serxtRlz
 3/9x/r2jJIYY0q/F+OcRYDlB9ls+vUMku1WXauFdFA864SrTUK7kIBPwxv5d4pa256I761UAsz1
 /YdPYndwYG9qOihi6DN85Z9lXd5ImQ==
X-Proofpoint-GUID: wm-7Ug7A-f_iYCSAz01DtK87Zg9xyDfn
X-Proofpoint-ORIG-GUID: wm-7Ug7A-f_iYCSAz01DtK87Zg9xyDfn
X-Authority-Analysis: v=2.4 cv=KeTfcAYD c=1 sm=1 tr=0 ts=69145ffa cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=p7PcLuspDTVbkQel-sEA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120083
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

On 11/10/25 5:37 PM, Akhil P Oommen wrote:
> In A6x family (which is a pretty big one), there are separate
> adreno_func definitions for each sub-generations. To streamline the
> identification of the correct struct for a gpu, move it to the
> catalogue and move the gpu_init routine to struct adreno_gpu_funcs.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]


> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 44df6410bce1..9007a0e82a59 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -683,7 +683,7 @@ static const struct adreno_info a6xx_gpus[] = {

Somewhere among this diff, a619_holi needs to have gmu_wrapper funcs
instead

Konrad
