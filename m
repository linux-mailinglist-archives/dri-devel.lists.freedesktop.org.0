Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C41E5C54AC8
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 23:03:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4833F10E7AD;
	Wed, 12 Nov 2025 22:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHA0o/fh";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C2V+jmc8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D023110E07C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 22:03:02 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ACHVW8N907726
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 22:03:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 d/nTs8LVBJqSn132QZVwYlosV14mCj856uKAHF6W+UI=; b=cHA0o/fht6HtoqNI
 X2cYYYSs6rD1AE66bCG5GhR0LOm9LtO7Mobjpxoyh3U95AlY29yom5E7WGfeb6kW
 UZhdWXha5de685yIUOUFbiGYTJL1cifGUzOVgzEHA8tMX81I2u1DIhyu3vfXk7gf
 PiNBbBzVjBv5J4JD+tvjbGU+6glXD2zrN+SItouNpSIDY2egKFY2EzgIONn0u2Kv
 bO5ih6SjmiIh8J+TftgLVC8WyCxiZiWrXt6albknM9MMXu8nHASqw5x2mx41WUYB
 H9qA70549eBQUyzq6ZtpLH/hCI98INtheCd15AVSEtGZPZJkZQb/jSRiy0CJ9Fo8
 a31FmQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqura627-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 22:03:01 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b993eb2701bso141442a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 14:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762984981; x=1763589781;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d/nTs8LVBJqSn132QZVwYlosV14mCj856uKAHF6W+UI=;
 b=C2V+jmc82hL7tNRyhzsIPj45miGqzDFRijuhNsh/tj3/1Emcej0F5nuEvQk74/MY0l
 stujJc+K0vpv4si7kG3qfIWqz/8ywxAB/Bi/YpIZjBcraYH2pT5jaSahIliF1QviE8HN
 14QjYr8clCyVhGzVhvLBCdsAv/ZM0KFuHfAd885e0oHqjCSlvEYi9DUHBUyXhkerkG9o
 3LxkxNrSq+/aD/vkMlNGeVt/wTDoepA8CM6WxXhWDACnYsNYgxETpFk5r1dVVCyinBxR
 cjRD5Zi90XUFRmsMNUSjIdcSs3gI3FexQ8odud5TxRU8BGggAfKun8AD0AndmzU7Yxh3
 LRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762984981; x=1763589781;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d/nTs8LVBJqSn132QZVwYlosV14mCj856uKAHF6W+UI=;
 b=L5YZLEyMPJ79TYYhPeZFbEBLXC2TbGN/F18SYXqAhGq1fbIRwuvc58cIYvj+YcmaN+
 sqmRpR2X3Cd8GpMt11wDabwOD6LZBT1BcYAnbWh0Ovw4hXCsyS510zEJUPrtNn08gzxF
 LDBPySjbxzbNE17KfsgYkUWEmRu9hEi5sSdISvz7qZXy/Io0zUYcwO0lDuxO2OiJs682
 dWKh6lFPHb6oJIVo7lhJzGIDxXdj+/ZVy3Sjc2TKQ5nua6jqY5o7nnlUQJcgpCPCIJFh
 Uf75l8ugylV2a4vzvNeSQF282yuTBICK2g19rQbxz4waiQRKSB93768KeQ8d+mrnhiuV
 g+kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn81Uqkd291O64QnDPpMeuFSMSX5RB2pGdi2husNhSHyNMmRu1CByrQlIA3PHtJWRuJ+JJ555V244=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzhFTaJlV2sK9P+dUafXObXy+m5tgLvSghvzmRjpQHZMavFCTC
 1ihKswLLjL58TqBI3oZVUHi0VBxJX66OP3xA1TNprxJvQp5C3ubuYct8lcEM1upKJIG+sDg7rC0
 ia5JTD6lZkbvn8wY1PbbnY1Xsf/WHd3JvP0C2SJWNGdNqAYXjVxIecWJnlFOYx7vDYRZ3Row=
X-Gm-Gg: ASbGnctna0Ve9aGCx7fkA9Eq+qnd2c0IOFz3V3rpvQJDaXdiEpU48o2MXTxWhz70Z1Q
 l6pBX6+hR9VHIVN1AhIP90Ux2zcynQPE4HhOHCgiF2W/evXBU9180z2VFo82fKCbN2k4Wjr6V6y
 3WrLAP1XLmORfeAONUPneqVZkJlTFIPJnLJwNwHnzjYwW9J9G01EXdBuhtBIyr+Dcnn0dtwjeLj
 gihbSQsSZLEZtMfRGP/+9vSHDOUuf0dLlaj4E6Cu/y/hkk+QKDRR+zO0U0OIPs9eeQrM2Y/Sgtp
 NtK1nU7AEfRsl+D/0fLHlFjn7xfPDF85UEBm09a1R+yE+1pHAlM/PqfAcY8sI9M0YLFLcifXqc6
 OphCbrwTwJBonbXpXR+0Usg==
X-Received: by 2002:a05:6a20:a110:b0:306:2a14:d0d4 with SMTP id
 adf61e73a8af0-3590b514a27mr5686009637.43.1762984980835; 
 Wed, 12 Nov 2025 14:03:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHn1u1Nzkjc6Q6wIjoT4YUJ/liTOuUsOAfbNf14qAseJxfRuSew1Z6BWUptugvCHiHCrtJQpg==
X-Received: by 2002:a05:6a20:a110:b0:306:2a14:d0d4 with SMTP id
 adf61e73a8af0-3590b514a27mr5685964637.43.1762984980255; 
 Wed, 12 Nov 2025 14:03:00 -0800 (PST)
Received: from [192.168.1.5] ([106.222.234.47])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7b9250d28c2sm54557b3a.26.2025.11.12.14.02.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 14:02:59 -0800 (PST)
Message-ID: <12e6f588-e422-4803-ae14-56e5297e564d@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 03:32:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/21] drm/msm/adreno: Move adreno_gpu_func to catalogue
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
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
 Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-5-bef18acd5e94@oss.qualcomm.com>
 <28d62905-c191-4c3a-995e-a4146ffce619@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <28d62905-c191-4c3a-995e-a4146ffce619@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDE3NyBTYWx0ZWRfXytaCNuG0Fznr
 LgVl4gIopbWCnfBwrHStBfS4IXMANb+RKkQ0vOmMEwk6SyY62DwaZBT6IQ74Ae0Da04Ic1Tubf3
 4EW7hU1scgX5hYlAjaTNDJylahuiL6AZsM+5DKEHRPTgFN1cCiK3Kwr56up2aVqBExUdZ3bgd4X
 u17tf1WM0JdhFh38GCKCdcQrCoeZ1Z7pXjmpLthY65h59JZl9I9IVlJP7MWRZ02B9oeSi6bPKOq
 1yH943OUj7f21KGJxTaEOdC97HaxfDPpGu3LgbQ5Nc2SIso61KuawT75GmeB8jyd6V1TQ5l9Nj2
 1JBln7U2+f5Ai8TTbmtgdvJfuMOvLZ32c9pM7uakozF0FIB639QTYX/JISJYc1kjy+A9C+1iKAj
 VqTIk1RskvSv84RKp6OkhSaNnh9Csw==
X-Proofpoint-GUID: doHaCCIxroylCTETYMJpCjmV4eg1HmwI
X-Authority-Analysis: v=2.4 cv=bbBmkePB c=1 sm=1 tr=0 ts=69150415 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=2IP1oaZ8+KUWsYovLW0HHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6-R1E5pqECOcxGsB_ukA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: doHaCCIxroylCTETYMJpCjmV4eg1HmwI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120177
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

On 11/12/2025 3:52 PM, Konrad Dybcio wrote:
> On 11/10/25 5:37 PM, Akhil P Oommen wrote:
>> In A6x family (which is a pretty big one), there are separate
>> adreno_func definitions for each sub-generations. To streamline the
>> identification of the correct struct for a gpu, move it to the
>> catalogue and move the gpu_init routine to struct adreno_gpu_funcs.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
> 
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index 44df6410bce1..9007a0e82a59 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -683,7 +683,7 @@ static const struct adreno_info a6xx_gpus[] = {
> 
> Somewhere among this diff, a619_holi needs to have gmu_wrapper funcs

Could you point me to the holi's devicetree? Currently I see only a610
(sm6115) and a702 (qcm2290) uses gmu_wrapper.

In the driver, adreno_is_a619_holi() checks for both 619 rev id and the
gmu_wrapper.

-Akhil

> instead
> 
> Konrad
