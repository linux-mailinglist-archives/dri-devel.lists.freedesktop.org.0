Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31862D122B1
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 12:08:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D5710E0DE;
	Mon, 12 Jan 2026 11:08:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hfx+xYZR";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GsbszmNM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5235610E0DE
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 11:08:06 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60CA6gFJ1380744
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 11:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wxJGoCtvWzd/ibCsZ4iab40VKlglbQukDFb9mt+kQqY=; b=hfx+xYZRpVkUeymA
 3Ja8ykcT4C3u6CIn0RzQonqRYyirG5dg5XnSuc/yDv+Vg1LBqfWtUq4XP1mOw4pP
 uQsYZFtCHvsb8Z7/aN8c65lRxdsURNE7GJkf4hPPB9/9Cgq0GJFRpGvTpfajeJA1
 MbbsTBgSJK2OaNIEHHseiuXlksLMhLCUpCtk8efail104nbPJYyIxjW85JOQo+BZ
 E1B2O/J+m/pUlEpcsAqcswd3giu941S8lyLfk0N7vJFe9jF+C/zEvmkNhHo7wHF/
 wZpd+zeOkp1KdC2wX8b4HywuXpRqT3IhAhyHJufU7tLb+LSwT8K3XoV7Hm8xJeJx
 lX9ZsQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmxwv051g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 11:08:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ed83a05863so21754951cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 03:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768216085; x=1768820885;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wxJGoCtvWzd/ibCsZ4iab40VKlglbQukDFb9mt+kQqY=;
 b=GsbszmNMkauvU6hIs6Yu+J0YXd6CjfsXbPBdXoC9IEyT220SC7THRPRSmhYuOzidD3
 m9lSA/EY8MBpAkERjlGpUJnDIFXylwS9rq63Qfob34wpR3OJGQXuKBdwVhMWA/KfjjMK
 Z1AU1Vp/VgOdSwfejawRdMqyw/Oq7KjHUAReqRS8w64lM/KH0uLO34t0A7isliH2ja6m
 vRE6KqK6VkZ7AYWQPxYJjnbfVyM8irTurlffg1Y2Ps5QKnyZui4TxCugtrtclBFzbWKJ
 +zfeg6bQl9kCzw3ITCGAesxFCBf9RHu4d5mKWtmX39uFbJ//veYC23oDaem6BgY9DnaC
 KE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768216085; x=1768820885;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wxJGoCtvWzd/ibCsZ4iab40VKlglbQukDFb9mt+kQqY=;
 b=lxH3hrv3TQtgpF+Yt9+IOmgG5hYIKBE8EJV5wgoP7SD0KWe/g23x8CAlea6feIIhpA
 F69rfgjU9bNAE1h0xlCyP/m8wlGiPs0ydmiKP1BCvTorVaXzCVmdOmYhwcLMpBiQBwFV
 H9ZW2lBntuRTUkLIBOw76t9/6VdnL6+zPTCKHGvUVoMqjZz63r8Aq2MCS/oXPQs+Xhyf
 SoUo+ZGmHqYSEm8A2yHWK5gnHgnGkukJEBTVhi1jFULiKgy2FmeXtEojzlmIqYBXYB9J
 t8664tFDEA5A1vJAONRkm6LzQU1cLNtgMo9D6LccvIZU3f5jDSxZT0JtlrEJ35nSTrRo
 3dKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVibADpUjNgoPy8tZPX81hX915vmjYdA5ypA12dOvsp5rzodu2ZL/H50h2FS2c4J23jPiPsy9OsDq0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwusuDdYcF7Xksjfcc8VjWAr8igYAjwG6YvTDppyjFbLqp50fOf
 rC5a4rRxbrTIfpdKeh0HawC0xKm36of5Mf4lu/hAm0kJhsNU6RKpWCMnpzWldor/w2O3CcQhrnI
 GjBJmI0cPfw+2krYHHypzA6k+tUQhobCP0E591Wv8t5bJw1M0y6CfXthvUmVp6aybpYfknLs=
X-Gm-Gg: AY/fxX4GtXFtYGw0hmZc5mxGd3t+hKv8uJUUW4nYhAGANC7fja8P45Cczb3vfJt2iPI
 f9//YAecpuplUCmZlhzxHKoMLGgkCnR08L9ys0bfpzfYcYml3ET/zPonKbePTUAxwwkZi6ZH6PS
 y2I/dOSCfPT5Q7D704i3sk5749VjpF9kr+c5kKgC+IseWjoPIAjFI/mrx1Bz5vP+8R6Yjwyz4hV
 DQsuSPqWJqCwUSQzttTUYT7ETlLARvmWEkqYa6GQJ+QdZhkGIJ0pa8knEQl2HHeqhcATEYSa1Ea
 4WNTdsDtPjBdQ0oPEKsmBRXryrj/mKUY0WsawZTOsKy2EIpG7aLO4PJTzC3Y1GFHNJyxnEvNFYk
 3aHNTkgnX0Wv68nGF6C8v84K2XaVAxtIJqVV00JWSuJP0U6MSA54IXoIw1mzVJj5T2LA=
X-Received: by 2002:a05:622a:1890:b0:4ec:f9c2:c200 with SMTP id
 d75a77b69052e-4ffb4a6d91cmr183969491cf.11.1768216084931; 
 Mon, 12 Jan 2026 03:08:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMgyGfFYE6XaMmeLltZggmuQ6DITKn6VVK29vyczbb9806g1/vlY8V0ofwUK5H2Z36AvK6RQ==
X-Received: by 2002:a05:622a:1890:b0:4ec:f9c2:c200 with SMTP id
 d75a77b69052e-4ffb4a6d91cmr183969101cf.11.1768216084412; 
 Mon, 12 Jan 2026 03:08:04 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b87124e1a1esm374226066b.48.2026.01.12.03.08.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 03:08:03 -0800 (PST)
Message-ID: <0630acb2-f18b-43de-81d5-4260b1add934@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:08:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] drm/msm/mdss: use new helper to set min_acc length
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <20260110-iris-ubwc-v1-10-dd70494dcd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-10-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pSox46y9CWU0j6rbSZrjD4nDiXwDeYIf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4OCBTYWx0ZWRfX0HHkvzyQ3rRC
 RvIdClD6fVIQclyXUVEG7RYo3J18/rSAPwuR2Lf7tQggdyBRZksQ5J3vY3zsQKB/MDspItrqaGV
 u6VhocdZI8Dz61SRBNn8QOPMa1m4Dsqhl0bT0FTSETmgJqzfmvtZ3L3HStU3/mhQxN8ROV7P9Ls
 1kmJmb7d6/bNd1j6bHIqEZSitoZMudULd4N/KVF0u6Yv2+Zdmypd1HZebGPT13eO/38DQ0uuAqp
 CfgZ0e3JObCNBmSqR8UWXOtXPdg57Aml1w/KYwdofCYrz5nZkizMlzQ/YlR07pQrFpAUuuDgKzh
 v53shvuIv3firkg2u2OVnWXRnpW0WKkBr+3Qv7qDQA6ViaMOyxezbPNqZ1PY4srivmFXdPF4wTg
 fAuT0rauM73xbziXmRR5WQARxi88wW4Z4Ie54ag90inMAr9ydRW8F/ASwd/+vnEmgcWl/WaCKz6
 xvb4wpeNIWCWXiTOnjg==
X-Proofpoint-ORIG-GUID: pSox46y9CWU0j6rbSZrjD4nDiXwDeYIf
X-Authority-Analysis: v=2.4 cv=C/XkCAP+ c=1 sm=1 tr=0 ts=6964d615 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=su5gWXN3lQTy_5l37lIA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120088
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

On 1/10/26 8:38 PM, Dmitry Baryshkov wrote:
> Use freshly defined helper instead of hardcoding the checks in the
> driver.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

