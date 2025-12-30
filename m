Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E53FCE9E2F
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 15:12:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A3C10E8FB;
	Tue, 30 Dec 2025 14:12:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="c5CqhybS";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FhgUpaOd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD74B10E8F8
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 14:12:07 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BUBckE02671365
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 14:12:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gOS/6+DACahWk4IG+foy9m4YTOOq38wbloAXw4QG9DQ=; b=c5CqhybSYs4lu27D
 BL0ATI7xRfF5THO9eETo0uIn9M9+EHPhSRv+15qAisAZ7XVA/CiHc83nJO7+Lx//
 iB0qS8uMeOh+ffFPrZg60+13q4/1eoLvol17wW6n/k8XVWxxqdJNgFQJKyMisOy2
 xezZsjQY6Ycu4d4fF+yzEBWBeilpf+9RE3NrNXKzY1tAV5Qlt9LhMPILXqveGujR
 ngzLKPJOn37ks6UWPg3NfH0e29mQqOR/CO36cH9bXDHL+/nvdNgbj2NRjm7Fv6gS
 XnP79OQfo0wQBOOzFOaT6m6t4Xy5HsFx1WWXhAhyO4Xu1b7HBIrg1fKTv1Bh1vq0
 XQC89g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc4fcspg7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 14:12:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ee07f794fcso39763561cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 06:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767103926; x=1767708726;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gOS/6+DACahWk4IG+foy9m4YTOOq38wbloAXw4QG9DQ=;
 b=FhgUpaOdsD4YoMbpenAyeT2cQAjdwSATytCttvztUvInovTVTXn2tqBaE7iRi6vRfI
 jxYw6ezBxGw86tVnjQPQHOCjTkn8pTYmHYkuDqW80wReus/ZXZ2gQZgI3wvNixwJyAPz
 DDL72coyfITaqyBwKohltHgTWpLsKFGrd5DbldQHuo68gjKrUxlGtlPqNSHcUZq1v+Ug
 lL7blDevCEOUawG1QP3ZKsQYiyqLDxpRUpqgN8YXzJITSIQgJ1hLJyjYWjPj1ux4rjjx
 oqY+8yK4B1I+xwSvAhyt1fuS8+djX1ZdbWHnMwOer15AbucVQjWL9r1rySQehfYKlolb
 iYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767103926; x=1767708726;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gOS/6+DACahWk4IG+foy9m4YTOOq38wbloAXw4QG9DQ=;
 b=Uys0OCp7KBLCMc6Zf2NKGE2+rnPQr5HpYByEU5KKbCg+Pe780Wrr+17+xCt0Z7Df25
 D3CFzuMWlmg93ByvHNSQBvZYeVLIOTvMUFlmqlwczEHubimbSuV/3zan2Xpwq8XIIJQu
 nVCXFV6b/FhmXHONDiYi9Llrmi3c+ASElml/relp8P0RMfLIX5LGr5rHtN3CzanuszQM
 SB4+8SB5ZHFWEKXKZqQ4/6SuGlH6q1yjrX5NHtF5VhYZC1Csqq3ejBYYTawOAI3IP2/+
 acEBiOZ9a5joIDNTQCrIwKvuxoWDXwAhxBL0tbRe2PkNPU726gAnOJXBr2Ag2PE5DvVg
 RySQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiNg1RIZwrZDY1h90qjfrmfpttDZe3GK7Ebwl09uTL+quMPz2Z9pwSRSZZnZcCf5dtGgveOTCuK6I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8dyc6kIE2+n+a99MgSftkDLll55OlZl+4m7K6rrgnJ0dwPspn
 IU/CroufaN++s7acqCVEjXXpRrte88wpDfj7K+/YGOUDgEkilTBagREZAXo+DjlxqQDgiHAgz76
 8RI3BhB7v/5//JuzNieMJKLcmElrkdk7LsukKyhq5/hhh7qdP1yNVhNRiBzHPbsEsFT/f4ms=
X-Gm-Gg: AY/fxX56hB39sPd8L8NmoWH25AjOXOP3LInFZ1Mf8PTWyTGdVUHDU1rSwKlPAkZ2FK0
 nopY7LZz5WHAXo1DYhCfSPVBuOzNGpVPkKJ47mw/tnmGFW5a3v/Ef7F+53lUeWhWyj02YJInvaC
 8MZHjKtlb6y0ZiUfY20deN4WI/Ldr1LEJxOARKxPPLx9qmt0n4Ca3z99f0zrovUpBeH361e8nuL
 gxe8YtDivjZtrgCFqDhbkQ8o7AXTlg3hLiHRxaa/nx4sXQbR6ysNoTBh43H1HXz/76X/AWheY+u
 VT2LSJR+mnGkm94w2ixWj8+Zlm+viZ1ygY6bvnS4ix0mqyGhA1KETtWekNgbQ2KXFLbItX4NFrV
 lveAdm2Cee+WcKb6CLZieYODGgrW/wH8PLit9UisRJv49oexiD/d073PXLFlRgSFDqQ==
X-Received: by 2002:ac8:5a81:0:b0:4f0:299b:c785 with SMTP id
 d75a77b69052e-4f4abe04451mr344777901cf.11.1767103926418; 
 Tue, 30 Dec 2025 06:12:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjqp9PxLRQ/4vjh1lhSfvZgUJ/bKmJeLnU3Q+HtKB9o/HKRUhKyUByzv3/wHYsWz7jfIc6Dg==
X-Received: by 2002:ac8:5a81:0:b0:4f0:299b:c785 with SMTP id
 d75a77b69052e-4f4abe04451mr344777461cf.11.1767103925985; 
 Tue, 30 Dec 2025 06:12:05 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b830b5fe8cfsm2133862566b.59.2025.12.30.06.12.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Dec 2025 06:12:05 -0800 (PST)
Message-ID: <0d3e5f9e-b9ba-4c2d-940b-de25ca8fb208@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 15:12:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/4] arm64: dts: qcom: qcs9100-ride: Enable Adreno 663
 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251230-a663-gpu-support-v9-0-186722e25387@oss.qualcomm.com>
 <20251230-a663-gpu-support-v9-4-186722e25387@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251230-a663-gpu-support-v9-4-186722e25387@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uBjmgDj9oPliwBRPm8faO9LY1nO3-Ymx
X-Proofpoint-ORIG-GUID: uBjmgDj9oPliwBRPm8faO9LY1nO3-Ymx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEyOCBTYWx0ZWRfXxUczZxj9kNe8
 CrehE19m7ZEvEhY7872quBRbDWhI3S+XyTgL34S+kkGf62XQGFUnfirx+V1PAMwkRlFB0/6jB8R
 mDO9x0/ln0DumOIcKUfAMgogYdy6+OlJADCsUavWczIGvUIufTnuOd7yWUjIrwuL4YaDCcAybr+
 Kpfn8g449jDlUqt+B9l74oi43mjxIemf3DKsKSUOBYzywNVGpbGuePFieUJOQtS9QjxL2w4l7DB
 v2bspgxVxLXcQnxc3nY6hjpvijTBn0fWsI9djvTxPVY4UlFq+7d6ecvI2+PxNoocIKaTmeq8B+S
 o4Qb4giMg4xqm1kC3PLbLE+zQdKUsBnMkjKOo1vLyo368L94RUp308dWs0VZipB1Rs8HDazDl9f
 rfhw1M0+qQVkICfjprADj0aukEZpbg8jSAxhsTwlz5QpWrsAa87H1XWnds5EWPSv9lEhTTYoBSx
 s5NDU9Sn/evwg9kQe1A==
X-Authority-Analysis: v=2.4 cv=foHRpV4f c=1 sm=1 tr=0 ts=6953ddb7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=be7_MNJoD_q9xFtD3CEA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300128
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

On 12/30/25 1:33 PM, Akhil P Oommen wrote:
> Enable GPU on both qcs9100-ride platforms and provide the path
> for zap shader.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
