Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F2ED1227B
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 12:06:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB06010E395;
	Mon, 12 Jan 2026 11:06:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="T5ZYtTpZ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bx+v6snX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8037B10E38B
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 11:06:18 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60C7OmmP555754
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 11:06:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8afs7XBatBRPfjZn/K8JHD8vDykz785GYcRAb1f0hO8=; b=T5ZYtTpZSe2TzbqX
 6JHS/5mADeL3Am90SylVsj90XQWwXfZbUbNv++j7poNfVC8QaJnqJpzODV8Rhcub
 7fqY4BTsGRpi+33pBSLWW/1JjiFc/8+kPP0yCui4u2tXdofpvUTlVMuVN1QNCisQ
 +8Y7AaGbpxLRkX9PiT1aXYo21ia+uZVvvIYYs47aCkV/MQVq76fJrwE/29KSllfj
 sIvpOECx4kGx6d8IEWtnMJTkhyZQdzQQ4hJ2b0ehBqI6YmSbhx2L23LvWKJJs3I7
 tZB6YSTpsIwF2ir1kOQACDew1mqI3d5mHns+QJSAP8BUp39JC9B1reQ1LJRSX1Tp
 Kg8NlQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmvhw0qxv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 11:06:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ffb8ac2cebso10736661cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 03:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768215977; x=1768820777;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8afs7XBatBRPfjZn/K8JHD8vDykz785GYcRAb1f0hO8=;
 b=Bx+v6snXvT0uMmjAXQ49+viRzAP211WAdiH7ns4Y9iUOGMYgssGwDtjECME6bWajTn
 fbpS1/meths4u4YpU1FefiynLgogrkxVvxo6grZm7YPMvRYI5rYhmsc6omJvtJykN8q9
 vBrQiHfXfGivCqHRcJBVM/p6Ghr+oWQecuRNWBOAk657cpoMg8PDNLd9Jc0W2cm7mjZE
 /wGJD5rXfpecvUFv8EE9WYKONus4vH2BfJ1+Ofz39alY5zKeKdYSBnCu2trcmpjWZByQ
 Zp4vbn3pt7j9gUOjw4UjSsgFNpH2gce7JO+umtZagJckFkv9hcaOLU5YO6rhwFYWuXwp
 ssww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768215977; x=1768820777;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8afs7XBatBRPfjZn/K8JHD8vDykz785GYcRAb1f0hO8=;
 b=nyvzHwryvEI5vO0IlmR0EVVyMxWIZ4TeTWcvvS9VQasf/cXk2vIchbW5kAZEQi+zwu
 Kj05oLxTDy4rwWfD1kxu0AVh45G/iduEiN/IxWzYj9Nb3+PzGbGaCiDLSQdPIs4QemrW
 bhkWeS7LIRyQXht9bi6PDEJZ4SpP4fNZZC4i3J0NcE8LVVllDJ0sGIdIYsNEBIw1Dqq4
 QhGGloPbuCvYxoJmwieD6z0AT4kANA2nLCEohoB3YGjDvYd5fC8TUcH42IEnXPJjLReh
 1XQfoPDTpat4CsOqydbakHQx0+js4lEMBDxJ5YI85feQ0dBUnN8+YZ90fg1OkRd9DDLF
 OPBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdC2S11evCltuV7LIw+o7BNaB3IdgjhibQWdSpQ0bBvFEFp5Lf9zbodo/Sm2so8cM8cKkQI6QMiE4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/HRBKYWfnHvt5n5tvbbRCpxAX3hrmSbv6TKYz6glvjOPjJ3+E
 ZD2tU4tn3qb6+kXqnffgipqREkEQdvNb0lHBHrDY3RenlkX3DbnU6FoW//UkgUSxi9ooFOeDbur
 eWh4vr5miy4AJsgmWCDLFOhKv5fQ9Psid1CYLPDAlpmys6mKsGj6aud7Bzi4XKWZFK83zi8c=
X-Gm-Gg: AY/fxX4P+iQW+8/E8XhV8YNmyBdviWzd+Reamud31+xDueKRjolW9it8Gmw1QLwLbVv
 p90p5KtUbQukIVYoR3oKbOCy+1U9rjd7TjtBVWBz2WFt+tkDZhgvzjx6l4j/rrt+mX98QKZPURb
 d1TAtfqYd14xbkoExGtf0u9rtIeKEgZwDSlt6w5Lk9uGw6HXwmJqnIRpadIQTCrFydZgVajaTve
 XJUMOOmmBZ/M6pUe9BAdV3Hy1wa5rbW23ePs3bYX8h8r6Ep4DXhKI9rrxcx6lwqU67PRXKukf/O
 duSAoDusxJXVEKXYzbOCLpUBEoe3HtScuE2RW/MhMv9u6gkNXfgSzmajCiFoWKT27ABVNxGAHtu
 EcaqHsJEF9q2tvUDz3BQP2bAEqsbCncsXXtrhqLIoqE3G1Hs7B2aIEIph3OH5CLHzco8=
X-Received: by 2002:a05:622a:1890:b0:4ec:eec8:e9cb with SMTP id
 d75a77b69052e-4ffb49f6842mr188340801cf.7.1768215977100; 
 Mon, 12 Jan 2026 03:06:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEoROZPkrFaKwWGha6CXTBLtHxCU47doHYO2L9KQ5RvLt9XOFT6EtYsvfRFTpRB9pmoi7emoA==
X-Received: by 2002:a05:622a:1890:b0:4ec:eec8:e9cb with SMTP id
 d75a77b69052e-4ffb49f6842mr188340531cf.7.1768215976475; 
 Mon, 12 Jan 2026 03:06:16 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8713416418sm381115666b.49.2026.01.12.03.06.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 03:06:15 -0800 (PST)
Message-ID: <9c9ef8f4-8305-4151-b079-f24c8cf8d51b@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:06:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] media: iris: drop remnants of UBWC configuration
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
 <20260110-iris-ubwc-v1-9-dd70494dcd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-9-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4OCBTYWx0ZWRfX5t/KsDeWoddk
 fK/wtTf2EL2ajWuDDm7IbKno9UcVBLauuPY4Sf8piVHI+FM1p2SEMI58d3tPpWYf+FflZ9raJhg
 Wg09dcV2+NNBoQDjUsHuXUbpo/8jy4feOTuyGrabBDtnfuM7KZVCQ1KhJyDYsuVsmgsh7blh5sL
 TjcOENG/TqOXIRq7ZZ/9LrQs/H7EyUcEBT6SQxGH0SAebCgGHW91haJ7hbFJ5Q/tzDrOvEPYKRM
 XGsB7brOsas0ak6Jc2Jaw7SbOTGxdzmiGf2+lKbJBA1+XNrZPrd9oJVEbvyc/PVCdmKS5mRX8C9
 JsgnJtD1wIH/C1c/5P39E42qkeGNHTzniKJj+7ec0b0EmYW+uAIoP5d74iInnMeTOIOdudeMixQ
 jXQeCxpFqCGvp7yIZCp0EWmcn9EM7J10rw3WUUGnQQxfW3zhdQZRKkJsERP32fDRiWr4BLMjKVF
 1NbaK21CiTw/zH9K9yw==
X-Authority-Analysis: v=2.4 cv=JP02csKb c=1 sm=1 tr=0 ts=6964d5aa cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FQNS5iDjU0T2HGSwfYQA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 1zLupDKV5CqgTBqiKrgRRxMXSuQGOJ2h
X-Proofpoint-ORIG-GUID: 1zLupDKV5CqgTBqiKrgRRxMXSuQGOJ2h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
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
> Now as all UBWC configuration bits were migrated to be used or derived
> from the global UBWC platform-specific data, drop the unused struct and
> field definitions.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

