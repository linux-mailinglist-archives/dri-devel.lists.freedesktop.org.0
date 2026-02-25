Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOTFCezdnmkTXgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 12:33:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CACF5196895
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 12:32:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0E110E73F;
	Wed, 25 Feb 2026 11:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="orQZRn+M";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kifr3as8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780FD10E73C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 11:32:55 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61P9T9eU1579406
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 11:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3UwhFgmW+9RAf0H62dLr8IYTJ0+P3nnry065u5Hn37Q=; b=orQZRn+M47pKGt7H
 9x7/xb77psfK+0qyoRrFHjWKTrNNc5uARyxnWkOC3tzAGQIrzGVwptTdZexmo/Hr
 regQRM0vFIO6/gi064Su2+7ku+mBwb1EwgcgBw16+7nZkt5Bl/bYjCnSXiUSEXm5
 76nDNku++x176wF06VwV3iYuiPYTGfPBVnJ/YoC+1WFXVMp///eQKeZ3GthB5HzD
 g3T4ueSAT+n56RMzag0RWFINKTjb+wkenpVhvdDWrgp6tv6NJjjmlNrYnCsqdMAS
 ybuxOb4ItBvZN5lM7ogRs0Cibyr5AlFERlWAzo+4w7MXZ4l+8VzRxih4rCs4UZBq
 Iq35og==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg1sb28q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 11:32:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb3978cdb2so538038485a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 03:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772019174; x=1772623974;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3UwhFgmW+9RAf0H62dLr8IYTJ0+P3nnry065u5Hn37Q=;
 b=kifr3as8BmV3KvTTcg3sfCy6nTmLosEB6YeQ6yBQIXP+KYvuIY8tQicRZoMIwiomul
 0KDpL/FSaWJR71KN0Fphk5TIJ2gKIiDC0PNeXhJ3/pcisIQ60A6vcrBKBSz9XpLlK44p
 Q6MH0ytTi5JolleNHybU/Zsk47xB2NDgoz9qcy2HWfC3nVPrqzn5vcgltbe07WSVJ5JY
 x1XWeYr9LpVuUsmT33qoSq/NKLde1jkzHqIX0Odq8ceV4NO+LXG2KMrMMjr7HPOngRzs
 EA3xHINGVwBEEHKA3vw6N2ePtB7qIV31BuZ+Zn2Ufe2loz/Lq4I/+ISFLHLmHZTBAmkB
 pb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772019174; x=1772623974;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3UwhFgmW+9RAf0H62dLr8IYTJ0+P3nnry065u5Hn37Q=;
 b=RQIjcKtP9zWscmlB2HcMIEToHUumya+EP6v4V1P0xTrFG8uLPY4yL4n8/TCto+mW/r
 sWnAeE/LJeqWsz2B9HZ21SLpISTgO5l+/5QRWnL7peVnMw8aMabBV6yBK2HorxyxpvaQ
 cVsytWVBDOxsqtr2e00LOFeYD3RTFp9UK9W/4oefqMr1YiweiGYkFWUEyh/tdkioXSYN
 dUF1V4BVTNI7o56e2If+1wDwSVV6Ie17z52otpzllh3DixVSZuUzrD2wreIUufAsHl24
 UKLjy96tNhlURrMmq2yHY4HlqITlyxbB16ckoUQ/TcywoVswoQtqtrF65+3ed1XSNB2q
 8QoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK6u0JfbQeioLyGf6QnM+ySX1c9wbNoF/nLjwRRtYx3bSGXVBQoX2sKsFEHwo4HV7sO3vPfu0MT0I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yydd+QknTqi7JF228vZqGBcfeU/RkU4yUZcHN6yUkv6fBvVPgKI
 CimfFc/zhGNHJKsd45fCDuMkTzQ2TCejzAW/Adz7V8LRP06B3vM4whfsQrridJIFGKDEk6C8wdO
 Fu82KizJpdm5ydDBRMeugWK+y19X0JLtQ1+8qInP0+z8I82MokcaMnF0HVtRZqjygxJLJfG0=
X-Gm-Gg: ATEYQzwICo9ihY50sBjO8FA1tIEik00PGNlWCj+3DF1SU5NgKAqa9aJbKOcWdUGLM3A
 FLlMJnSRMJfo7wylHlTrewuoNHHVh1x4jMqjVTo6PJKYvEkSL5ItEFT8WODoh1xuAbFc7UAIBQI
 EcYW/bZqh83QiqgWVsJe/zqZfxEHaUO6kDKmJEb2JGLt/Qh6gPxYmq1bu6xiBTAxBm9aqr5LKbQ
 qIWY2eUJCrZ8ulNF9wuURhfea82lcTDFRqkwwxDyw6OIzgOQHveFZ+x8vP3L9MCMN+TqNwUCqtF
 ntk2eZL2oIv9MolgEl+IooIR+g54tG3WJV5kUzn2IK4INVrwqcUBqagg0J/YcLWeSQP++OG5/0w
 eGC6g4fO1A2gcVdE4IA+jCR/fQEGtjxIQlbmU0ORhT2Wj3sdZ7lL0ARepAUigTFDJh4UGG1mzrE
 BrOKk=
X-Received: by 2002:a05:620a:4011:b0:8ca:4545:aee4 with SMTP id
 af79cd13be357-8cb8c9f491fmr1434474285a.1.1772019173966; 
 Wed, 25 Feb 2026 03:32:53 -0800 (PST)
X-Received: by 2002:a05:620a:4011:b0:8ca:4545:aee4 with SMTP id
 af79cd13be357-8cb8c9f491fmr1434471185a.1.1772019173484; 
 Wed, 25 Feb 2026 03:32:53 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9084c60b91sm513928066b.14.2026.02.25.03.32.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 03:32:52 -0800 (PST)
Message-ID: <aab51596-465e-4af2-9a12-48b64160f77b@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 12:32:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: Fix the bogus protect error on X2-85
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260225-glymur-protect-fix-v1-1-0deddedf9277@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260225-glymur-protect-fix-v1-1-0deddedf9277@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZKvaWH7b c=1 sm=1 tr=0 ts=699edde7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=mSm37ElbHMQ3LlSfNvEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: _9dh8KZxItXpzRh38wx7oh-HuQz7Jjkn
X-Proofpoint-ORIG-GUID: _9dh8KZxItXpzRh38wx7oh-HuQz7Jjkn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDExMiBTYWx0ZWRfX/4rxpczR6Gd7
 MLcsMdPwdBlsZPzry39ceVfOZQZ11E3rZeFMFTcRk6gpZCwz34Lk94DuY79zXevanXHenKkkdm1
 5z3ZglhF/tB6Pa27ZIyhyEYwOOLXPCcVhTJ2hyzeRD3gKCX+gpMVxdAJZ6VUCAA5rQxIFLSiLYJ
 /mi9qNppNDCX0N+xkCnyVlKd9e/MghAxp6LXvILKYVDa00IncNMAAdbRhNRf6mgByK0qI328oGl
 U94ejRSCRWYq779tMsdetX90a/QYAJSVSafHQxgc1PHlVa5TalZJsJvMYLPZ5Dik7mTEXMAxLFB
 ksn/2HxOHYpLeDJlLiqC9g4ZUA1eN06ijEgJpaM3Cw5yLM427SxgzWKCsXxVbTebvBpWK0pMoHz
 gRD5yOTpy3NH47/S2iQ5IblS44DYHDIn8NwZ/CiwWklTCOGuhwjQJUlD/FTAOYpK15asorOcGxz
 ATgFOFgjQAWFyJVNCXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250112
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
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
X-Rspamd-Queue-Id: CACF5196895
X-Rspamd-Action: no action

On 2/25/26 8:41 AM, Akhil P Oommen wrote:
> Update the X2-85 gpu's register protect count configuration with the
> correct count_max value to avoid blocking the entire MMIO region from the
> UMD.
> 
> Protect configurations are a bit complicated on A8xx. There are 2 set of
> protect registers with different counts: Global and Pipe-specific. The
> last-span-unbound feature is available only on the Pipe-specific protect
> registers. Due to this, we cannot use the BUILD_BUG sanity check for A8x
> protect configurations, so remove the A840 entry from there.
> 
> Fixes: 01ff3bf27215 ("drm/msm/a8xx: Add support for Adreno X2-85 GPU")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
