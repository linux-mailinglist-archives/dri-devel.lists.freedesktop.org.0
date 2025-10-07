Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FEABC1D00
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 16:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6BD810E6A0;
	Tue,  7 Oct 2025 14:51:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BsX74Pvg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 179D510E6A0
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 14:51:35 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ETNU6022566
 for <dri-devel@lists.freedesktop.org>; Tue, 7 Oct 2025 14:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SOCW2rZ9r9iWkoujOSTsHNr4e6m0l3aCF7JRUUZi9ZA=; b=BsX74PvguuoWFObY
 af81foHuUgxLLDzx73unfPClUi3AEtH0thuPR9GECtOtxOPxf0o6FjvEgegTIHr6
 I5brLgKVDconJaCJTfZePlnFudVAKcf7+K801ED0HPCGSy/0il1oCVGosIonFTFT
 6N7dKd1C8rMNm1VaO3kTW+cgM/9sv4yb1LZSoxdNXsviGeHao5ZDkBeTnn8/HfVm
 YCTmNmr36N6jmwjvkm+f8Ii8OJgoInry4R/xl0UfmQneZTLglAZUQU895bSi693w
 YW0JvvU+M6TQfFGhrq5XvjQDtwRMjGHWzwq1wn5POn3DdgHc5N8HkpJi1BH0NO1r
 g4ENbA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junu7jm8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 14:51:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-267fa90a2fbso79255925ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 07:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759848693; x=1760453493;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SOCW2rZ9r9iWkoujOSTsHNr4e6m0l3aCF7JRUUZi9ZA=;
 b=BtAqIt7TfhA76anU2BMBQQ919LU6LafeRtlH/Rsf6xWlbRqNxeitvgvp0K/PHPbdQO
 wVV6NVpqCcx/Bk5tqUDyE03yMak5Fuo3d9PUIM9uS6EvZrfWaZEvP7e4DM+d6vBWJxep
 vSwAxZF0sP5L1qk+MEpnj+6yR8zPbctUFhVEqFmFifzgrsrcooXqObbuOPDX/zcUuDyg
 N0EUJDs8mwYdADsMiTurlgFSYcTidVJ5KOdE3zpim6mhzG2Bs2BizW+MOn8bWJcQj5Sp
 92fqP9pMYqAegTk4Ob4l/lOjUgFHwm1UO9yd6s0A0DrCAlaOHcDM6cYZXOlacd+L9BlC
 9ekA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEh+2i52GhwHIB7gDn0nNVNsL0ttF6QAaiOa+VJmqKwAOi5YvPT5LAE8qOWl4R2c5GwwXEDI0ZHx8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6cIIAFHvDUFz7aS3hdDc30zLVPpcq8bQgCrl598KbiFg+9Bdf
 CqeW4c5GyBppYaQg3dv/+54JC1MbPiVkC1rq2F+YH90RHEVbwKssx1pBs5HtoOtVLmmH6ETnXBe
 7Y1fgjUncRc1C3wSCG7A+2jXe2O3h/VHeQXBj1QaqOoJ/JIZFASzCWcDtvMGFZ6JKG6MnbTw=
X-Gm-Gg: ASbGnctDXGn+V+OrCzzvEq5p6e6wjlPnBGQIi/mYBBORB1id2MKnGD7/lm5lnwpypeo
 bylGo/Qik0CmCQHfg7Cfa+FFcPJuYZHZs50NwfSQMkltYxbpm0/vFQao68OyhIPW8jMAvYkRk2L
 nGolW9eQ+QTWVHGDCPCUfZnHrK12l4hVxPzrXPoVCa8ZWB97+jHIB8T864u+WqtoBx2N7zpuJvh
 58zPCY3nUBnQX5MB8jH+Cx9HMZhn6rQhQBsBI4cfuugEjQVJNKvy6eVXvtxsu7dS+yeycwJsSnt
 1kbwp6XwLbcZ7tQLSxc5lr/AgP3w/Rf2BKBh8D935Xe46pKGXeol3OUS/ozcBmvW+VEAkJXoc6P
 J02EBlCRKw7eo0n/M28Y=
X-Received: by 2002:a17:902:f790:b0:267:8049:7c87 with SMTP id
 d9443c01a7336-28ec9c50919mr48391875ad.14.1759848692811; 
 Tue, 07 Oct 2025 07:51:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOmH2506cQVkPq01K7wDTvpevLyZD2fZ7HFWKnxDuV3j2vf5b09vsharrCpHFawP0DIcCOHQ==
X-Received: by 2002:a17:902:f790:b0:267:8049:7c87 with SMTP id
 d9443c01a7336-28ec9c50919mr48391495ad.14.1759848692279; 
 Tue, 07 Oct 2025 07:51:32 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d126078sm168548775ad.31.2025.10.07.07.51.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 07:51:31 -0700 (PDT)
Message-ID: <d87317b6-bc92-48a6-abed-05857afc9479@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 08:51:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Trigger engine reset for additional job
 status codes
To: Karol Wachowski <karol.wachowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com, lizhi.hou@amd.com,
 Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
References: <20251007083511.2817021-1-karol.wachowski@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007083511.2817021-1-karol.wachowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hk1HrWIGP1_5NSotMmYOS684T9PIPOiu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfXx8PegjxW181X
 qcyI5B48lQWhvaADtwYmh1603Nf+uBIDMskWOkoM3F2k56HsdV2OfoPZlleq8iK+dlUi7uxm1P4
 G0HEKXwxBrf/tTrWgLnxfE4WoJbqtiP/Q07pwdV/PLKd69cu71SYAfKe/Vh6v/H77mbKBu7Glv5
 ODrHgg6pmKgVK42WwP6G69r7nmok8NaDjpErP6PfBSiDS59io6tHiMmwjRHhIIDuKqF5A1lrpWf
 nFqnYjnO4AVBCuc9WwREg9LUlRBSVDv54gNohC760lc3m1Ozy4wKWF6Dx7b3yzMq0ySyzddWrbH
 QUlqkImchlUlBgFHi3wL8W/083fx7zA/aQvXm5Cm5TZpE7j0DtQsBr15nX3CYix6hLa7vHxq1dQ
 23Jp8Nn7FyGnHpP/MOwdZvZhaqvlFQ==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e528f6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=WipgGoFZFPbmpiL_MuMA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: hk1HrWIGP1_5NSotMmYOS684T9PIPOiu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040023
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

On 10/7/2025 2:35 AM, Karol Wachowski wrote:
> From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
> 
> Trigger engine reset for any status code in the range.
> This allows to add additional status codes in the future without
> breaking compatibility between the firmware and the driver.
> 
> Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
