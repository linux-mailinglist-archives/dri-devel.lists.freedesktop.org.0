Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA01DAAEB45
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 21:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9013110E1BB;
	Wed,  7 May 2025 19:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iNgXu4BQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42FC210E1BB
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 19:05:26 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547DdLJk014527
 for <dri-devel@lists.freedesktop.org>; Wed, 7 May 2025 19:05:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +SHDmPRfAeDjssx8L+cu2l7LCPnVp2BGSEPoSn2MUB8=; b=iNgXu4BQN8U92D6D
 Lxf9aOjh+Vb2zIhmTz2xMpMRID9F5WtGLTuDNmZ0fWZjsLoOVBpVJJGGA3AyVm8N
 i5S6rbAo6tcwUIBENLofOj26VB0thosM8mqr1BtAZQ/bG6wW4mvKa3jkjkiD2FHN
 dCcI5OA3/Z+D0ToO88pqAq/lWKPC/Tqs43y06TrgeaHC2XRwkTGasAQAW79t8qbO
 DBRZRY5h/xL0PtidAbmVSy8GepBaUYkjv3tdj66Xo/hTuA9/oCsf8Tj6VInE81k6
 I8WSpylLhlVdpshdngSxHx45/y8XddFVgDKGXTNrLzRLWO8czpUMB6GXh2FH7+ot
 4bDrGg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46g0kh2e3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 19:05:23 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f543e296e8so419926d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 12:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746644723; x=1747249523;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+SHDmPRfAeDjssx8L+cu2l7LCPnVp2BGSEPoSn2MUB8=;
 b=HH1e3stVlTOWdCaLv2Q/KrSvQhJWjgcX+fuZqctkJ4vgvIqm9QENkPxAEMZpTJkN8A
 20gxIxnS/6PCwW4kuTTv3+F6KfO+kwM+ZMYzcDTBp7POKKxQqUbcRb99qGTv0J4WSsdt
 CxPvSsAOknfnxpD87t3cJh36WXul3FEVVvtCuiPFP5n701or8J5+lqtK4iOEY3ZyNJ3W
 bSTWu0a0hXjOi88dAVKpdjapY9kj5TJKlFa2zdT3pnDfoSdeUiUqE6rACqCGqGCTPekS
 /8ESAV0oanDXdZW1IdCN9W3dg6xqXUCzQgkbcBiBt8H/sEaWoDiYMYev0XonfpjLHxdi
 g7/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVA5vMlx6mdWh/0ewpfL5Ojk6aYqOVKlIlp5h5wq5vY9wR8gVRQGrRLYTUCjQEHpJX9+63iXJxVK9E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqGBPSyymsc8XMP8aGcJXu2pnszt5ggVTqcXOVCwaCXK6wZfq3
 UuA35/jW74nvp61Z2b5PFmFMM/SFdUH82dQCKGnxwnvRKqDGEdDcTAXVwh7WPh7qcqhsCgmuNby
 1Q68ucBQ/kHE5yVg4DMysstL+wcabQCAMuIFrp5x7hs/qQmuffr9XkF3bmPEx1PKIokQ=
X-Gm-Gg: ASbGncsI9/WuKhWr44DAurpSBRZRvASrHIC/TT6V+f0AUCWYj8DNH0MrMhGnsygqRZS
 g4hojeefyZxYMguamf0d/gPTFk+YjWOXtJ+V8mvZPrvkaHN8BGJgXXjsrf9+vew1WlVsD3RTTB5
 6ur6xmBNGGm9+rDqN56UIyOb4VsCg6/QdiF8o9UpG8dDtuqIsIT2pD8UYoVS2nsCut2RHVjszU2
 uEMxmsAWlE6CpS/cc6hPG6cKW9YM1WgRW5CJwrGfO3HxJ8pauvHPgIhQu6ngz/rkV7ONEFHAxiC
 lpEoNr6ecTnDXacCvMEIwH/ns1aKcyUfke0q4JQPrvLIWvAm2nzFIxyGoC6zqZfqoBQ=
X-Received: by 2002:a05:620a:318f:b0:7c5:6fee:246f with SMTP id
 af79cd13be357-7caf73734camr275203085a.1.1746644722772; 
 Wed, 07 May 2025 12:05:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHi8oUmL4ldGmEKyWAOMA5TwxCGWZERQSSET3xMoBXXRc5YWp0bJOTj+IEY5QkdrpAQaT3HLg==
X-Received: by 2002:a05:620a:318f:b0:7c5:6fee:246f with SMTP id
 af79cd13be357-7caf73734camr275200185a.1.1746644722249; 
 Wed, 07 May 2025 12:05:22 -0700 (PDT)
Received: from [192.168.65.139] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad189147329sm949542466b.1.2025.05.07.12.05.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 May 2025 12:05:21 -0700 (PDT)
Message-ID: <e307c4aa-1dae-4d48-ae79-36923372c8e0@oss.qualcomm.com>
Date: Wed, 7 May 2025 21:05:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: Remove MODULE_FIRMWARE()'s
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20250507154723.275987-1-robdclark@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250507154723.275987-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDE3MyBTYWx0ZWRfX0mpYeP9hSmLc
 vPSpwNNDQdaMk92LN8ZPEWbzb96CCnI2MzLyvlW6Rtq237YxW9UsVffLQeVm/9npT09fWXMlIj2
 rdaeYPSP3mClemEJUsBtjxBCWKHVKkblmhgdPQvtyUstbunQCj6CPh6FmPPk4ZAXPQbaK9nF976
 fVAF9KtD/4YDV9KF6+DJLiZPlCud48V71fuyhx5WuatL/kfBz2tXJ8dW8mvulFj4Wrl80xTZdSO
 tcSYXqMjSyQxmjHkYsf01QJJ8poahgae4iovsxCIAORJVTYt1eWvhQUdmV+WL+2f2daTxaTct09
 t4m6z1glOSQFnRKGzLnw2QH0Y9q+lOpJ1J9723Q9QEv4+uk+HvzWt28b0OJMf5wJi9RoVyX/ssF
 ntvtWQKDitx38XGAmKCrb4lcPXeflxUqXeY6Lj42A9BZyjC9kyCUQu2B4EacdWEId2E+LnvL
X-Authority-Analysis: v=2.4 cv=PNUP+eqC c=1 sm=1 tr=0 ts=681baef3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8
 a=O4ZBKxZU-tJ0OIaaHa0A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 7sngxZJ5dtr_V3dWdftQmrg32ghv9RXl
X-Proofpoint-GUID: 7sngxZJ5dtr_V3dWdftQmrg32ghv9RXl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_06,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 mlxlogscore=917 malwarescore=0 spamscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070173
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

On 5/7/25 5:47 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The driver handles the case where gpu fw is not in the initrd.  OTOH it
> doesn't always handle the case where _some_ fw is in the initrd, but
> others are not.  In particular the zap fw tends to be signed with an OEM
> specific key, so the paths/names differ across devices with the same
> SoC/GPU, so we cannot sanely list them with MODULE_FIRMWARE().
> 
> So MODULE_FIRMWARE() just ends up causing problems without actually
> solving anything.  Remove them!
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

it's probably the best decision to avoid all the mess..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
