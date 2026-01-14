Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F99D1D9B0
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 10:39:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F6B10E2A4;
	Wed, 14 Jan 2026 09:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XwW6/XG2";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HeVj4Kyp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09E110E2A4
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 09:39:18 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60E7jFmb2081702
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 09:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bW7hurFHBkMVJEHuJgTkpaD0kO00VP7nzaajP+IP9SQ=; b=XwW6/XG2vIXEXkjF
 SvKwsdKwUQiSBz0Hfw4Q7KAT0DF+bf0qYMNkgomj9n6KpYDJOWTjxh6Yy3LN530y
 7S7SYuTlJ1AocYPGzYaf9l8U32ZmUn2lN6b/jSzfBOjZMm8zrQ3jmfPE4ky7mFiZ
 T0AlUccn5iEn8+qoY/aP1nJHVGvpVBYmqjNQAk/3otJRdr9e44TPcdYfnF95H41H
 yTb2QR1sueH4Mc5wTH843T8ClCK+fYcbV5PsMsFSvpPL0j4x0MncReJaMvlKyV76
 PuT2JJq0dv7JN1ic4gafb04oh642Q7CxZWk36w0K+g4cTv6SFjbsn+kQgA+SZqdX
 4XXHWA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnu58tr61-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 09:39:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c5265d479dso27381285a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 01:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768383557; x=1768988357;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bW7hurFHBkMVJEHuJgTkpaD0kO00VP7nzaajP+IP9SQ=;
 b=HeVj4KypY+a7JaAfIT3OjAvKJBN5l+SjdADx/0s88xtNuQtsdcQX8Di49Pmf8f2uKo
 zUX+/QQHQJXp+DjNEGRGmmaw/x5OExh8v8dh57ovCNSnAOjhxpD/upAU7wrRu19XE2cc
 csYC5yAER3EEgUBwuuPi4rnqhw8LsM2NRJ9NtkPWnTSHW1AC2cvGu/ELPuqrxct6nh5j
 QqD6XajFgSDLwxXyDVrF1emZUp4B7XtEy9CWok6BgZF6+YtLW5AjSckMfFRxpVCOgkMt
 zgBz4MOq9sZNPPgh/HWdH/F0ro1fzHvB6CCHDRxNIM+0Ps2YukJwTWTnI/iN+uJHX62W
 hxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768383557; x=1768988357;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bW7hurFHBkMVJEHuJgTkpaD0kO00VP7nzaajP+IP9SQ=;
 b=pK2lTvUZmzTteN8z5e/WVqmB4klSwB+m8LfWdvYl228Z6FmAr8IlP2/di0Fs8D9ari
 SEtggVmFI3lu/i/MBKgStBkNIztMFUzKo6kpTdkIZdbXFUVBrtWQScEM/UK4VJovmXop
 Y65TLK1Y8cAk1lMRqJ54Mc5DnMnFIe2Vx6aHHDM8WL+ddR8TaoSb+XnKOPjaBjVbhXsl
 bVYcZwm+XGT/DwwgYrOF2AkYzgYRypBHG0FpWeXlz2WC+2su8OYxf2YObAUX3HLsvpUN
 eZ5ctQioV5HbJrZ3dm3hewGVWSMofbABLfEDLT9HzCEN+jrYC/0v/ToM75Qrb+Kk7EE+
 lwAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNWFtWcHtbeVerwoW3kcNFEFLJ8fsFyJ7qflUIDWpuxG3PgGQeTlbVNxo5k4jp0KZtX8W9P2dUrVg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoSuQyf0rt5p+4M8lqlmR4BpZnooj1034ROs3iGj6dKd/8AjEB
 ZfA+0ffhJ99SWOhsuBRsWhOuJ4TEQVec35IFJRcFAzQh79VA8ya4cqn5SvEMDoH3C1iAoJD+eK3
 BZLQ+ozaK8PgUxG150xpO6AF7DVDCs8qL/wLdQUFdQ10afrSsyeQpWgOXirYBMfAoBrBA07U=
X-Gm-Gg: AY/fxX6tXw3hnhtLE/8R1OFBMaq/nGffHPRzBVxCEstHxtbaWgW+47ESFfW3pTDGEcZ
 jmhvxG7h2b9TqbqXW2FIeE87wpnoo7lvdmv6vhHkOHxoup8l3RU3M8ugvP1/C9Yw9ZXUxr/FCaA
 FI1bkxx9kggwgW025Z+4k3CZTGjyLeX3L+y/rcTq+wVveh7nD4PJgQS1U1sX1tsRbnvGLYazR/m
 I0XyGet86ph8gFWoYIpDHjxz4jR+OX4K3pF3Zg0mUKpty4YIiXXXGgChtNiA1mGHZjtXnnQyoct
 xmdyNiRVbrATp2AlT7PdEhXkKKZg6Yx5GmH8OXfksEvd89DxgGuqPBtlSNtX4V+kU075DTdW4oE
 kRp1MQns2YPfR2aBB7gZJyoH4KrpXV0ABMtJhu7CHUaczK+Bx+KOFiwN/01qvOaHJaK4=
X-Received: by 2002:a05:620a:7010:b0:8b2:9aba:e86e with SMTP id
 af79cd13be357-8c52fbeb24bmr205578785a.10.1768383557379; 
 Wed, 14 Jan 2026 01:39:17 -0800 (PST)
X-Received: by 2002:a05:620a:7010:b0:8b2:9aba:e86e with SMTP id
 af79cd13be357-8c52fbeb24bmr205577085a.10.1768383556843; 
 Wed, 14 Jan 2026 01:39:16 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b86ebfd08b2sm1288984566b.25.2026.01.14.01.39.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 01:39:16 -0800 (PST)
Message-ID: <c64cd28b-58f6-4d91-a3c2-eb54effbe898@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 10:39:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] media: iris: don't specify min_acc_length in the
 source code
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
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
 <20260113-iris-ubwc-v2-4-4346a6ef07a9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-4-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA3OCBTYWx0ZWRfX1qRUWN5pwOMI
 CW5kBYaOx2pY9jsJYSyobuv3HhndW1RX5/4S13rglPPcUQ6sa1EX7ydvsP+0Jar+48gNTHc9SxB
 u4MF1C6fUGYrc/oByuvX7HwgDlhz53MnqmaZoXy8Vs5TtYUWr2Gg+hyo9S2Mf6HS0pnQDTtxVAS
 cpNEMwVeyb36knI8bz2Q7kzapKRIfhXx6SW3RThTXa0+ujzPOxK3nIvlUrxtxDuEwdkZhzNTY+a
 foDTbF9MWYWXy66bt0Fg+IOTp+10880fEmno/yU3uWc1N9tLwrJi+yYx4SwHB7uu7qTCmmbFZCE
 gABH8DSMsp9rB1oxIlVyGTF7yCj2MiMVqALy6XYXFIE/sXreLPztyGS28PZ91fEGyfRfjZmXpK+
 dhrEnJeWLxp28i98ty9X5gdr1T1oSfEPvGYWU3NEsBaWNtQcesA0YCoes/qiWWs7VeFMN0UyvP1
 AeRngMWicD6w3gaonZA==
X-Authority-Analysis: v=2.4 cv=BZnVE7t2 c=1 sm=1 tr=0 ts=69676446 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=BAgg1nNj1X2pGIFylwwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: URXdpoZkkMTNCSDFDSHBQsDlczHMRdrX
X-Proofpoint-GUID: URXdpoZkkMTNCSDFDSHBQsDlczHMRdrX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140078
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

On 1/13/26 5:57 PM, Dmitry Baryshkov wrote:
> The min_acc length can be calculated from the platform UBWC
> configuration. Use the freshly introduced helper and calculate min_acc
> length based on the platform UBWC configuration instead of specifying it
> directly in the source.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

