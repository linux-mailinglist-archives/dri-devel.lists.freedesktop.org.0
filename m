Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKKzEM87d2mMdQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 11:02:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D88865F4
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 11:02:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41AC510E3D9;
	Mon, 26 Jan 2026 10:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gckajqXL";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fhrvg8a0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C4F10E3D9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 10:02:52 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60Q5UKN81019099
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 10:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QJ8n/rnroMmSRj+BA1mzSL3+xFr/ialXAh2Tf9HBPZM=; b=gckajqXLiuRnM+t1
 ASQNSqNfr9LdLD2E/c0A1Qy+JOZ5ZnvglyE6cIq9ocnhIu5FoyzX9gLtvRKbL7LQ
 cfW0h/IFZ5N8xJ5MMyEAAkBSzV/SIgyCsSZDk7tWA4k5OIMHqzjIV7TnUy2/EpGg
 b+rJ+j5tiT6cTmRjXMJYGCVvdYuDtT1GLNqEXPhErDUjhNeX6hR6ZMnHEXh6fEaD
 cz5WlSM483CPp1PaRhMfxuZ+AmN7qhHh3UDS2BVVn9QXgab9TDLJkYqs1EFr3Hra
 7AapljJSpnJJPfmtSddfF+hN8xtqeWVgKyDmJtatLN7qtWuwgHxtGsdVxWJlQt/F
 fkaLDw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bx2680n5f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 10:02:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c6de73fab8so133917585a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 02:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769421771; x=1770026571;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QJ8n/rnroMmSRj+BA1mzSL3+xFr/ialXAh2Tf9HBPZM=;
 b=fhrvg8a0QUl/tbp1Mxqvsmsj+5VfIplxjtaWGWFDXM60uOmypmJFNWt1C01JcsV52m
 XwJwXzBhGI8IzzQWEootHUQ5WT9tKX+BB5c6mVN46d8IgWsLdaVv9gLHo07PCiTv5g8u
 cesMZm5V8tna/jWtlFc/fQy8tPqMdcRcaI6L4KMQjqWNMCJN+Es6vioZSHoOuOqJtZ0c
 c4x3gGrXXpVTbotsHrbgqAeAMfnWg5qg1CGZHVA2Ocf6HwvBQDeJM+qJEbXeppvrDZA9
 qAMdi6lamNvADZ33DBl+r2APaMgaBZtkNhtkCzciu18uwvk3Ch2myIuCQOuhsi8Rj06x
 id4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769421771; x=1770026571;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QJ8n/rnroMmSRj+BA1mzSL3+xFr/ialXAh2Tf9HBPZM=;
 b=BmGASrDO8bCpGEKardeMaMLmt1+RV/UkSPUNO/o7lSrDiWKUm2/L0stYc4zGiHOGsU
 gC2kkLHodJGiyM0vaS2Gc3ncTGu1/hFxnjfFsSoqDCTvojc0mqNxobGEI5yCU63JmEJX
 blYz4yQqTdRx4ymWLxSMvuHOuZog3VQStqpT2PvF5L52T6Mnp2tvPWW77vUMYzLnCIt6
 HKgx8MFdzZS+SDeA678/1ieqG/0r7WqnPaRXPkXUYV4CxI4qokcDCC5zhyapGk/o0J1x
 PqlWzhX8Xe7pR4KK5lcRV2pk04yNXiHD+zgXmEYU81H9v/1OkQALoHuVzdYU6YStNvYc
 tzMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4Ik4nD/dhkwuEww8jkdH7R5/PI0WELJ0N27NTJNMkeEH8vXKQkoZ2nUjQwTAp2m+TsklQN7f1gok=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz35BhQMK4KoLwNMRJLhIo4sBa0dTRReyd+nJ7JbYSNIfrVUiN3
 jrfQfjoMfu13FdwM5jBY8Kw8zAqbYobMhocDmG8oQHJTpxkRvlB9ONGcMPnrYtVflfrSDhYCW0w
 r+VX+BkB0uSOC0/oJsfc7TNVQNQYIYENKjXAGVJXAJ2IJiNJiGQYBOZ9Io3nJ9xf2Xb+FDwk=
X-Gm-Gg: AZuq6aIJliS5gC1N1/cXCPpcwWBBYDgd/+XqhWg3BuqSqI3Z8Ge/cNhEVEfTPjlPSws
 ho/C0bjaJbnhnQOZPcRsW8AIqP9iFZu0b2L79bWWbpTfUaOxInJuHgwsIz8h6bY443Tp3VLQHYc
 bLWGkbf7pc2WlmIe08beWjkB9xHMHTwUhYm0AVeXnme0rSfVU7G2vkxiZ7dX/zYlWAfdmKSqj/k
 0FCqF9qah5wnrK9K4a65fJdHZBkmeZeBm7bjraMWl95ttdVxm12BKmTCCGSbrh6lZWu3+2S3rxG
 SGFuhw5NCw+v5D5iMCxJmOXzF2HAkZe3gZVNn4/ZV7PWTKh9+suGwmGNOrAN1PTG7RVA6YufVqR
 bPmhWNp+ko2WULSizs5L5xHiDFQQ0EzKUaSh5NaFt5eDEJdjvJCsNgVvG/5xEL0kqGss=
X-Received: by 2002:a05:620a:6a84:b0:8c6:f997:d6d1 with SMTP id
 af79cd13be357-8c6f997d6f4mr264582885a.8.1769421771183; 
 Mon, 26 Jan 2026 02:02:51 -0800 (PST)
X-Received: by 2002:a05:620a:6a84:b0:8c6:f997:d6d1 with SMTP id
 af79cd13be357-8c6f997d6f4mr264578385a.8.1769421770666; 
 Mon, 26 Jan 2026 02:02:50 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b88693ee59dsm563948166b.4.2026.01.26.02.02.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 02:02:50 -0800 (PST)
Message-ID: <3e996da8-fab0-4a50-bb95-75a339b01547@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 11:02:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] soc: qcom: ubwc: add helpers to get programmable
 values
To: Connor Abbott <cwabbott0@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, Wangao Wang <wangao.wang@oss.qualcomm.com>
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
 <20260125-iris-ubwc-v4-2-1ff30644ac81@oss.qualcomm.com>
 <CACu1E7Gpzgg0WKT9EyFO+uJsGCVAcEUG1OkTdhXLpGThTrd=Ww@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7Gpzgg0WKT9EyFO+uJsGCVAcEUG1OkTdhXLpGThTrd=Ww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bIEb4f+Z c=1 sm=1 tr=0 ts=69773bcc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=DqWAgVkgPjLbLUnWXkwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA4NiBTYWx0ZWRfX9xCSx0ocFKs7
 hhlxTh6pOq+DJMFRcNwryUxoAsH27J/arLraq0G5t7+x5d++9nT1z5DyaJZLO+QANUCDeG7ZKGe
 nw+67yRJG70St5LK2J/Th2d1kQRePfagXzo/oYVTSzj8ECEFT4b3OKj162A+zZusmflZFRBpFxY
 HRHOCZ285tAK5YVHk1arPTpVayDmdslqyAZN1b2gMLqU6qrDiKincPBYe0Cxyfcq0UCug8/Nhre
 +u0y6kBi8f10JzrZx8AjBH9j+eLvXRkqifpFBckmTEAAnmrQOeIb1BNDXJSgGnmyIvOHaoQA1yz
 b+5M2ueb7FYOQjknDn9N/zlDz4BGNdlLRiF1szVWxlEOp7q5pKGgiUvxZHYbMUAdu102c2KYfY9
 Wb9BV+kOdu15scbOV186Wim/eyWhYo6q422w5GJUgIXh9eSEkeaiOPmrqeqYop5rIrEhr7zHZMb
 LUTDzwJwZ+B7vSr3EPg==
X-Proofpoint-ORIG-GUID: YlW3Iyc7A3NnJl3dTITFjJYK4Z4bb8fa
X-Proofpoint-GUID: YlW3Iyc7A3NnJl3dTITFjJYK4Z4bb8fa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260086
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:cwabbott0@gmail.com,m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:akhilpo@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:wangao.wang@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E7D88865F4
X-Rspamd-Action: no action

On 1/25/26 6:16 PM, Connor Abbott wrote:
> On Sun, Jan 25, 2026 at 6:37 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> Currently the database stores macrotile_mode in the data. However it
>> can be derived from the rest of the data: it should be used for UBWC
>> encoding >= 3.0 except for several corner cases (SM8150 and SC8180X).
> 
> FWIW, there is a UBWC version 3.1 not currently reflected in the code
> which adds the 8-channel macrotile mode. If we just added that and
> made SM8150 and SC8180X be 3.1 then we could derive it from the
> version.

I see 3.0 in docs for both

Konrad
