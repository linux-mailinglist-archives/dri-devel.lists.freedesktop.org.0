Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C88BFD289D3
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 22:06:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2982510E7C2;
	Thu, 15 Jan 2026 21:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="l13oVhuM";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YmaTpQmt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E53A10E7C0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:54 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FFYV8a2174880
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jC8lA6B0ipWoMHR75M2AQCJx5qPi+JNV6zZXo9VKefg=; b=l13oVhuMfVG9bJJC
 o3w4j4Dcm0fBhXvn/AW1LW9YGKandwyzAVGNoUQ+UDhD4dmAjY+hp07mdC9S1fCk
 tAWdHZRNFtvV8YjYzEPhMhZ2EvOLvKTWgNW7wu/Vj3ofVOrkNnfDrFOo3w6VocS4
 gBQGUxTl4kw1R3etUcDHof9VLHHrRAYtAu9MC0dopweshkNjAeEBUHBBltr4uF8V
 qxVH/iUYv4FDWbYFYtAFXAoW8IgNeVAt6X4YL10bDJjGojxo+i99xmiCeTMn4B0P
 cfur3HRG5GThOS/DIrNEjrXPGtwUx9kpy3RVld6F8THH9cLvG/8H7J42G9pSPFXL
 YkShlQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq1xh97me-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-88a47331c39so30843466d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 13:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768511153; x=1769115953;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jC8lA6B0ipWoMHR75M2AQCJx5qPi+JNV6zZXo9VKefg=;
 b=YmaTpQmtLlD8VxTE46Jc5PPVSNFGSZsO8AhC7YQHOEoyB3dIG/NcnFTCgqMCDn7uxu
 idWB4yIR7koTYMEvjzlGoXJJ64J1kYQnCQ5XdU5fzECaO/3WoNR+ikqMuVDHiqD9N+mn
 wFjtR/8Q6FGa8PfuAizAiGZMSWN/mGLS4lWoHNr98/UhUAF9dxz/GTm8NPMfG+Ro0V8a
 3bBSVA6STOPXgB4hEnK0AuvXawtUu+PtTtYQbtpvWUFn0bYDIcmg5Mlr0aUzQC7fQx6m
 YI4cVh95q7c9+Z+xrVzA8zsu/Qoee38HUbk93Bhnb8o9n4bVtRhxFlxvUJ8/ph1fuU44
 +cjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768511153; x=1769115953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jC8lA6B0ipWoMHR75M2AQCJx5qPi+JNV6zZXo9VKefg=;
 b=vggWbtWE2s3eaPgbA9NvoAfD9kPZSuOQ9kHBKC1Qb40JAe5owE5rNwpTMXjqhEp60B
 4Fxyload6ICFpxvaaIu+Uj6NpVwZGO3A6QqSQj//idHWMLWTDEBtoMVSqvlsfGIW0Cv9
 BA9wBCHML/hhjb0ZnfJ8KA8zRbFvk1aXuJoOoK0s33v4CLmcT9wMSuoYyEOu1pTKN1/7
 gT4cXN2MgAVfCWhdKqeF23SfJMpyEGR9HD37oScznTnGUiDhgQ+CxTTYH7FQFBHvFq5S
 AjbBHmHYzCiME4YJ7KAxPlfNQ8aQwteW4U+wIFx+9vE4YhsEn8/njInnE1KYwB4TxoS0
 RPtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTUT4J2bDyV0J1HemKovwRbpyVJwiWWP3thTAMHF581DUTnqv4zCNPxjw8u9jYtNjh8wbgwqiUNGQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywi+Tzc0SJCsC4M33dLaI/DEb4aWERMTvvRBE3mB77ae9e4XR/E
 O+Zb47wBjpEoEheLyKHLcUX09C5rJZyJni25uqIfMMshE6X8ll8804od9BmiC0+iBFFeDv3nTAP
 nuYIVqtEd3J/Y5DlthxihBuceIhrRuDwoULwub9/Cmde4FeeljG4ymSArloM24vsv/RHItc0=
X-Gm-Gg: AY/fxX5v73UPbux1zhqIDX7YfiBFkL0okxoKruUma9xFBD3P7yGAaT/ar9+a0AH1Eps
 TcQ99HcXSDFfb3vYpk14DlTe2l3J1EH3yR/6Sc6Zc324q4U3McYa0Q1oOQqKtu/nXtlviX+RAd+
 scHhdLEQ9t9q9P5pnlNlER/cuherTNYrLBVeeRTaRZQZ8AsGGU9MwbO5P5K7xlHmD/I2yNeADtQ
 HokQ6IzfbwUZfj7CVnGYBfIRxQ3vvXuYShQviWV71pJoRsJWIpgHAywmJo6TeI+g0PhPoEopx0L
 21tHfRNDjqH2MdW6t5MLMdspTxSAIE4JhpKQ/qCsj2cV7vMLo55OdF4eyiyKFqATe8q3+FoR3rb
 X54nXy57zkJTRPqrhRiMhxDvzxeS3awyoNFbHi468qov5V/zWSb33kny0kqseOEADRbIK2+Z81R
 yn7VsHMghKOdKNmRBmTnML4+Q=
X-Received: by 2002:a05:620a:4610:b0:8b2:ed29:f15f with SMTP id
 af79cd13be357-8c6a68d9299mr104181285a.21.1768511153495; 
 Thu, 15 Jan 2026 13:05:53 -0800 (PST)
X-Received: by 2002:a05:620a:4610:b0:8b2:ed29:f15f with SMTP id
 af79cd13be357-8c6a68d9299mr104176285a.21.1768511153011; 
 Thu, 15 Jan 2026 13:05:53 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf397672sm155740e87.61.2026.01.15.13.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 13:05:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/msm: remove some dead code
Date: Thu, 15 Jan 2026 23:05:50 +0200
Message-ID: <176851027323.3933285.5242543959069807337.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aWAMIhZLxUcecbLd@stanley.mountain>
References: <aWAMIhZLxUcecbLd@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Pjin45f3Rcq7BJCpJ01mB0NTX3xNslq2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfX3wRdMtMBVd8l
 miaoLx8oRzR74ZJj0cHgE6ICgt6NMVXFvuEw5z1XaxoavzwE5LSmymRDN+pE635bcLX3it6iaBd
 rkZJG8/N0tQFwAduU5+miwxQhc9NajJV2VSrjkTfm1KMVupvcrCQxQtQhmaW7lsxR8twVjmr2zf
 z9sCb2y6EfXAHuMDiLQGUMImPJjhlBQmAb10+odT68bU9aieXQaYh3Q4WYN2jVIXHyraKO1/UHI
 PhNmHNtShr04BYUSe8mnQ6wdeID5ZB2fTGocm0vxEc5JutnMvj87+f8oOPVFNzUlPRo2gf/bdNJ
 aKDH8nuTPE/qTESuGAnNwMq/wHju49aWuWa8t6DzbIbEGaNydU0Ct7S7VM/VofAkOyO9z+boH+/
 MFviZN2G3HzH2K5RmHqdHeQuj6jM+ePcu006Cw4PjIjfKwoi8dIQkQW8A9lNG9/yMPpAVAdLCiR
 KIKIv0Ipmk3xsVuBA4Q==
X-Authority-Analysis: v=2.4 cv=TdWbdBQh c=1 sm=1 tr=0 ts=696956b2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=vfcw8cltYcJMyB0lYhkA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: Pjin45f3Rcq7BJCpJ01mB0NTX3xNslq2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150165
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

On Thu, 08 Jan 2026 22:57:22 +0300, Dan Carpenter wrote:
> This is supposed to test for integer overflow but it is wrong and
> unnecessary.  The size_add()/mul() macros return SIZE_MAX when there is
> an integer overflow.  This code saves the SIZE_MAX to a u64 and then
> tests if the result is greater than SIZE_MAX which it never will be.
> Fortunately, when we try to allocate SIZE_MAX bytes the allocation
> will fail.  We even pass __GFP_NOWARN so the allocation fails
> harmlessly and quietly.
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm: remove some dead code
      https://gitlab.freedesktop.org/lumag/msm/-/commit/37d2e108de4d

Best regards,
-- 
With best wishes
Dmitry


