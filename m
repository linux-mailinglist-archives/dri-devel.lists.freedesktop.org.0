Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5373D23A66
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 10:42:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1261510E72D;
	Thu, 15 Jan 2026 09:42:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OhnnM2dq";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dk4Rp3DB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB7610E72D
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:42:34 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6g18c783422
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 J0OOfu6f5Nk1cXvMYkdgiKPZusVb1yTTCdfQuLtoapU=; b=OhnnM2dqLL9vYjc2
 7N5rMoLad0asDbhs3eE8WvkeJOpDHI651W6tHUoBvpaufP3SFKYEgcNo+qzhFNrv
 It4js1yGN3QjFuscnhP/rbMRqEtNqNNU52gGOQfyOdExum+rJtiVW5AKfQnJ8gof
 8eVIogfBS4W6NYE9rlSA68M6P/ykj9NRCTezXwL57d73HW1ATey5T5Oeens8imoy
 xYWTmXKZXAOjh3j/MzGvlfmg23s4YbfnynHyBXrMavT5s/a/WapK3aqTYpq+X1Ay
 C/FL0eXY3+K3sUjL3jelaoQWRqhhTdyZJrx9I5+xX/LJGCIwZGS7xfLf4uEEHQvI
 5Wi58A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbj5kcyj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:42:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c52c67f65cso281813285a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 01:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768470153; x=1769074953;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J0OOfu6f5Nk1cXvMYkdgiKPZusVb1yTTCdfQuLtoapU=;
 b=dk4Rp3DBAVJ9SCWwaUrZHNOtPO3LPqQ/a9SpOkX3k+BsRZWOYEsy01qirl6JB6M/PT
 W9ZticWXV8c87doqbbPy5RKUN5jFwioz/ULNocf3Nv6TKPt/+1colLvhpQPvPCP3H7W2
 CTYeaBdjPN16WNn8E0Ny3bG6rlOkgDbpHyWxNEgSyqPJB1DqugPTbNIO7teiO9inEIhI
 E6/B4FXUUpH9aBBgK1RtVymG7GpQWq1r0F/Tgh4pkNj2826FlxnXhrzsLPkoJasRlG0H
 a5jCdYJaRhIRJWwa+5SLMgSuM+bL3MPIyk8xcz6u11mp02rE9BTnU7+3d3fvJmDqacRH
 M9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768470153; x=1769074953;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J0OOfu6f5Nk1cXvMYkdgiKPZusVb1yTTCdfQuLtoapU=;
 b=qa6ncA6rYBpv0Hr1I+h7K3Ox98xTo5LBIVWBV7zY27efFs91JsZHeo+yhgYBZ4073W
 rXcPD1mUzp7DaF84bV2g3fVGsxqD6kvpOO1SF5Wo5x+EyYGLC79BETyZYNNIsAp+puql
 OuNCP7dlGQ7CuJExjkFw8MU2RcsDtyPQP/UqGSahCpkfWG60B17PYoA+PaBOXtnOOyQ3
 6rPiVulMte8iEiY6vfsjtvhXKuRAYD8rgC31gMOLQ+W6m1SJ7rzYI20guoqGKgYfWo2J
 WNJi/yWye6tsVx6fmJ/IuSMBiXVBqkAssmCdfkNhV7LqVDhzwkSRHhQqYkeynKrrd94x
 cjfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0NvXDYEcBBXL+haUV8JRqpQGO7qtGbG/o2AmYjMo0DgRmekReN92ni6zNYYUWUYWmFkRNHXA41G4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPouYJeO15aE5+xr20CHDkmeWd0pAnqWQ7ByYQ+bak4ZmfSKH1
 4xdqWsPxG32FDYIfsnPpLeuY62paG8NmIBajrBdrDEWdnm6v05D69BkfwTEHpCq3SiHPtHf9dCE
 1Z1vw3L9T8ibTbLjGgzq/46H+5dr/47t/SGW4hLD46G6OFf8NHSr+NP1IXVTVQnoAm7Am4Ds=
X-Gm-Gg: AY/fxX79IoNN0JDAT3GTIyzTJpFcs71qfudLrhnbL63iD7S9vbd5wOALRMhQ1njRFl7
 12Mi0sq+kABwf9Hhna3z64gC0cJWK3OsiI5GuElAzgu8bBLLXkKlT5BraQXbjQdSPi1K7fTw7tD
 vU4e1Wu43/5OkvPRHIj9g3eMl3/uimsJOjyo8GtdriHJdArlhsFvVAaH6oh1NPiK01BesK7jB1b
 wDsVIZnHVED2vA0tBr8V7Q9e/f5E0r8bSzy9UinXZBOO5hLE8Xf7K7fD4F33tSvMXPAGJSvWqJR
 JVVqW2VAQ9O+ZRWLE8A3px8Y3aVqm9D3WhgCfgrc8W4s5eUuns3E4OlT/PPe1qPymykvu+eHkzM
 1Axx4Z+nEb8BN/PmzihSs8/toAF5wjJWKw9FnSRQa5vT3yxsT/77MQuPtp7WZzEAfD2DSvVy0hR
 3PkLrZ
X-Received: by 2002:a05:620a:4082:b0:8bb:7e56:f204 with SMTP id
 af79cd13be357-8c52fb56c2dmr804139185a.20.1768470152959; 
 Thu, 15 Jan 2026 01:42:32 -0800 (PST)
X-Received: by 2002:a05:620a:4082:b0:8bb:7e56:f204 with SMTP id
 af79cd13be357-8c52fb56c2dmr804137285a.20.1768470152423; 
 Thu, 15 Jan 2026 01:42:32 -0800 (PST)
Received: from [192.168.1.188] (87-92-245-163.rev.dnainternet.fi.
 [87.92.245.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6541209cd87sm1963901a12.35.2026.01.15.01.42.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 01:42:31 -0800 (PST)
Message-ID: <22a3ab11-9151-41cf-a0f2-8509abbd3d27@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 11:42:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] drm/msm/dp: Drop EV_USER_NOTIFICATION
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-5-08e2f3bcd2e0@oss.qualcomm.com>
 <17990836-4278-4c5b-afa4-eb631930ba2a@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <17990836-4278-4c5b-afa4-eb631930ba2a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NiBTYWx0ZWRfX2Zg7qqPe2RkW
 MaCzvSIGjdKNyqICJeWtGogC3RqGJVbrsE/Y+0QsEldccS+18Cva80g8hcaAWxQ1ICte4vaK9N2
 K7DreanNF9ZUHgQJ6TZ776R51DYqRrGII85WigeSyLmSvSYDo2HyusO8Eyxqb31/Y2/29Sr/nP5
 r5AKL6nHMVgu1S7zaGUhA9wK+k6vHGTpBV7VbuWuAtjmfPgkZe+NY3nSxdv+qB9JNen1lkJ2PNo
 /Ow9ywuq2+UIow81JSlFqE/mXTnZQDyxfJmqEPbrQJMNi8gE58WriaY1ElIHSgNzSS6UnN+CAxe
 kJSyNFCW6fPc+PcNYK5iW6V13E6b2X6EpjcdfWtn2qhyaY0zt211Nlv39jsKJVMhsR3fE5+TvBW
 WC58FVQzxM1GVnaqVgwZQnn9uFYfr7ajFin94panRSL0/wl9vxSrzyUAPxRqSN7XWEpKzPKMxJr
 +wGj9RGjONy4NUQ8Pyw==
X-Proofpoint-ORIG-GUID: N9YC-G84JLwgDzSJ2tpyL_nu97emi4FL
X-Proofpoint-GUID: N9YC-G84JLwgDzSJ2tpyL_nu97emi4FL
X-Authority-Analysis: v=2.4 cv=aapsXBot c=1 sm=1 tr=0 ts=6968b689 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+WgfKLcscl3VAWRHYO56eA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3lO4ytp0PBcW_CA4VZMA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150066
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



On 15/01/2026 11:41, Konrad Dybcio wrote:
> On 1/15/26 8:29 AM, Dmitry Baryshkov wrote:
>> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>
>> Currently, we queue an event for signalling HPD connect/disconnect. This
>> can mean a delay in plug/unplug handling and notifying DRM core when a
>> hotplug happens.
>>
>> Drop EV_USER_NOTIFICATION and signal the IRQ event as part of hotplug
>> handling.
> 
> IIUC, the drm_helper_hpd_irq_event() -> drm_bridge_hpd_notify() change
> also prevents us from checking *all* connectors if we get *any* HPD?

_unnecessarily_ checking all connectors if we know that HPD was here.

-- 
With best wishes
Dmitry

