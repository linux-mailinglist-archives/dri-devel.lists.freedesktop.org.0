Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B799D122C6
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 12:08:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8732910E365;
	Mon, 12 Jan 2026 11:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fJQHfpSe";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UfSWMMvt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2CC10E365
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 11:08:19 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60C84FMx3455445
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 11:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SpjQ3UXs8yQYCWMwewPG2bxBVEtUl6oOH+rM/TylefY=; b=fJQHfpSeuBqfKrpE
 +U76b0Y/C5CNDcOEO16jhYn7gsUWw5M5SyfoeD7RZz83e2GbkjBk5j9Z5HHNJq0o
 7SXY8gqctzhAjSqBIX1uxwTB1VkRfZVwnqkO/49Flw64eDiqYtgjK0BFoyrw+qU5
 uLhgS4+F58sOUhrT4B6gWwAUgjPQirB14Ky5Xo5Q3oc2udvaQ4YPgML0KFm1gbkV
 6ayXwkjzQjRphjlfI1zAc4ipzUfNMy0sSLvZtMj6AUB4FA1eOhiM6+cxP1KpLBaw
 wvFnFv/Mnde00HLfaZbenRF9mj66huix+rlXmnufKcypQY72FWCE0ME/1xGpPWVN
 CjQp0w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bke3e4rea-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 11:08:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8bbb6031cfdso209854185a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 03:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768216097; x=1768820897;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SpjQ3UXs8yQYCWMwewPG2bxBVEtUl6oOH+rM/TylefY=;
 b=UfSWMMvtBaIVtaUz7oSq8DBiVw1ML9fLPuKkyvKg46+fxHqpjT2cmf0lxmzMw32zwI
 ErHVopYc6NBF4NmS7/HF5ft/oxmb6s8vXLszL9qk+Jdj83oA9HuIrxtrCjYh3KLjTYPm
 iTixKSVOXtFmZ5/wMQVxxxaK6E/o14AZuctLwJ+0d6+f1QHmvckyWq2OhbFlV8dxiDWu
 4x6Z2VautFUahhfisGDqVxGaGRZWAh1dhUdfiI8VpPL/USohqU6B0qCc02WcwSch7dKQ
 Vg39LoK3SAKR2PPWn8O0HjM1H2TAHVZZm359ZHKW9FQwE2LcIG73lOiOnklUXZn2dsR9
 Etcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768216097; x=1768820897;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SpjQ3UXs8yQYCWMwewPG2bxBVEtUl6oOH+rM/TylefY=;
 b=EhTPjcFd1BCWJZlXsOc6r0r53pvzqYLycP+NP5w9Ye5N9PoZ3nmfj+3PFrjTVxvTG3
 i7N9p/owXWasgni+KSI5AIL4FHSJ1tfgpWUHqA7PLcJIB5zssX3Xf0wC70YqjCyzFEv2
 FOICWVvVRydqUa5KwT7uDHNxr9cQuV83MS8xN83U5pLo68kblN1VL9kOZWiIwMEjlpL+
 3AViNmJ61GuMC6Glto4gnafmxGVPogHjttbHzZOGhP7ycckQwL70pgf5v4EmytcaLTI3
 5Ln5Re4gP121IEc25Ue943qYA9Efftyac2kuXUVy8Z2xYhJdDbn80mNeT8o3WZCwlo60
 XIVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSecQA5DbP9E3BUNeAlKxk0YVBezzB6RuA683+ZAHJeNMsR1TLaRPAuQ/iVjFgzN1k3m6HMDn3OXA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUoCIsz2Q68zMdNopR/pHp/G9aMi9C3aC33v6xVTNG0N4i+sGl
 lo2Cx0aW1dYuDyiv9TuUz1b+swGjFTUpHrqHceCwkR1DuN5KEkyuqHb9xI0qmuajrPdTXaa3/mi
 VFvxt6Au8bjcDN4YFJhod91eztkWgpFTuB6CYwm2hSmkmg0DLd6X7bUqDGqXe3uNhdlZov6g=
X-Gm-Gg: AY/fxX5nW7qPUc5fj8smM641KAP23R9xEDKPREF9f2RAqn1UTXaJEFrZA6YE+Z3Vibw
 zAiFekPbIBco7HQcByh3+Hn/hWZQv4kv9MePpaGC8G23qouQqQ1jufdGJuaL+/1xn3uRVQaaGce
 qcZFHKTzorowqpKVXcWVc6ANqq9oGcUqshAQvz5Hxq3Yf9J43sysG7+CZjgzdA2BawlwoVVPSII
 4tnxcrShA31Ap49xtE8MUwKTGk47m2GGY3+tDkS1j6Sx4/tWFT1dUz43TcMn4ESCyJvDm86WmrH
 uF6KtVc7VfHrj9HxRlrdFWvVQg265/rf5CaSyUneaEbtYaEk5Aq8MohgryNLJZjlgnqhXGOLqD0
 dFkvrttUAQK7gwAASN67uV6cD+KrRswvRFvmzAs1gw5Q/tVydeGHgbl/zbon6qckps34=
X-Received: by 2002:a05:620a:1901:b0:8b2:e177:fb18 with SMTP id
 af79cd13be357-8c3893fd199mr1758457085a.9.1768216097429; 
 Mon, 12 Jan 2026 03:08:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBH4pb5/3BYG/cAuJcv/xavCclwNEZZzBJQcWjCGzKwsMo2DvYPIaRbeYOzCTWmrWy3hc+mw==
X-Received: by 2002:a05:620a:1901:b0:8b2:e177:fb18 with SMTP id
 af79cd13be357-8c3893fd199mr1758453385a.9.1768216096987; 
 Mon, 12 Jan 2026 03:08:16 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8724197145sm173031466b.11.2026.01.12.03.08.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 03:08:16 -0800 (PST)
Message-ID: <5594210c-ce25-40ac-9b5c-69c97eb0bd72@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:08:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] soc: qcom: ubwc: add helper to get min_acc length
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
 <20260110-iris-ubwc-v1-2-dd70494dcd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-2-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8VK6EcTIht3bEtQsBrs2bPspg9m_547X
X-Proofpoint-ORIG-GUID: 8VK6EcTIht3bEtQsBrs2bPspg9m_547X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4OCBTYWx0ZWRfX2t0r9FPy4TzD
 KfeCFgFfz/6ge9IVx4YhS5jZVxjsG285HkCG6IupUnBpJLQLhTbPX2qbqwBBwvsb28nrKdhdbai
 CJueM25J9IkIGgfK+B4s04UZcweNYYWWO1Mvft3cr4tsb8Nq0eFfq4XJzjRW8vyhPQdGuDgG9vx
 T1rjW2y3HLXkDA66TqRmPInpSOEUwtNe2vXB+gR4MXGzQUDbuF2GqbIJkScLzCUNTWa6bo+ngQv
 qtBx4V2hDyhtI/5dmx1e5Y8TU2cJBq1lvi8la08DG7QUYPG/H2bH4SKpqYY0jgcLYj+8JUTlkdA
 V0OPT33iabxvt/oO3OCuK1Q5kmtvkgn9SsboKk24f3HwRBbzrq0M2YcdN/zuUAY+6e899dxse1o
 /hpEZ50OWTiZVFG77ZJZsEYn0zw5u0rLXJqnQXfdOitngoyz/2AL3AAA4p6smrEexMvB2kzZ5kp
 JXptSL6uO1FEn2qtABw==
X-Authority-Analysis: v=2.4 cv=Dckaa/tW c=1 sm=1 tr=0 ts=6964d622 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_A-17BlWpzFJNOduaeEA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
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

On 1/10/26 8:37 PM, Dmitry Baryshkov wrote:
> MDSS and GPU drivers use different approaches to get min_acc length.
> Add helper function that can be used by all the drivers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  include/linux/soc/qcom/ubwc.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> index f052e241736c..50d891493ac8 100644
> --- a/include/linux/soc/qcom/ubwc.h
> +++ b/include/linux/soc/qcom/ubwc.h
> @@ -74,4 +74,11 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
>  	return ret;
>  }
>  
> +static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
> +{
> +	return cfg->ubwc_enc_version == UBWC_1_0 &&
> +		(cfg->ubwc_dec_version == UBWC_2_0 ||
> +		 cfg->ubwc_dec_version == UBWC_3_0);

Are you sure this is a correct heuristic?

Konrad
