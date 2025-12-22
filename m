Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A33CD53FD
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 10:10:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1CAE10E5EE;
	Mon, 22 Dec 2025 09:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hj7MUYmL";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fMZ/CQfu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5BA910E5ED
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 09:10:04 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BM7A3oD3109737
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 09:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JHWWdE+wbubFTvie2Z1oIhb9fPYx8KhlXYjd4LJ4pI0=; b=Hj7MUYmLG/YfTa5j
 EV6U0BVE3kdgHyx/TOBsIi2Muuz36pYia49op82WlExlvYS9E+Fj00LKPyUndzmd
 7gfgGAhfaThqNaxWSiHygmWDieTLNCrimmy0LRa5ZyGI95gjjjzLtwTwjVhe7YKt
 5XYYP0KkoRnRuqH/z3eiTstuFy3j6mBxWZs9/MYCGP2Bz+MDgZ6Wzz1YDe57Gd3q
 XWS9aYg08MF/xtFXHSAUxaPuTA678CaJsqkobEvcWJrGHghrIUHCAHzFlhEn4Fzr
 aV/DwIgaOxYh77R1iAB+QPwBM4rBgHtUIrhFSEW14TyNtpqs8/htktVPR2LTqIdJ
 A7M7FQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b69ahjq6x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 09:10:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ee07f794fcso11439421cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 01:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766394603; x=1766999403;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JHWWdE+wbubFTvie2Z1oIhb9fPYx8KhlXYjd4LJ4pI0=;
 b=fMZ/CQful+yNEoHSXGywNIvmDDFcbTu6qF52vfkN7xvNM/bK/hDHCs9LKKfF6V6SnH
 sOzp4F4foZA2V77q2enqiTYZ26AijBLN/GkDLa9iWIyLkzFr/FBrtWFNLMN4xLpWsyCN
 Ja/0c+3M9rGOV1RY6NOnJMjTFWCoXeHCtcW5vVL1T3BgWrEFQKKY4eBgnWIKq+v0LGO3
 gBLuAlGWG/UIGTdLIzHQRE4EktWhKZxbA+0q9j4mUlSUFbXBLSamaZSO8shK/gZSfAKt
 B0qLXtg5ajbaUV3soTHWKlJR3TyM65uFfjKdDcvICr3tLPMNSwwQ2zG26wQ6ImqBw7fr
 +nsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766394603; x=1766999403;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JHWWdE+wbubFTvie2Z1oIhb9fPYx8KhlXYjd4LJ4pI0=;
 b=v6lP/7hM2O35t475Ir8VGfqXbkMsCuazz0ADoZYbqZGmBHWA7MJkIgoOvFfEmJDTc/
 QmnE0wkZmXqjBuRSoQ2xCY9akOIoZVt9TPcoOx0yxf2Z8Cuyhnj6stJ8ARuMXjII8+HP
 DF+Z8iFrAIzscBK9GECOSGYrlhGwBoONH6dASLdyagUi4C7rxOji3S3Mjee69xrGp2Lf
 uB/Brnnu1xt+4xi2dkq/9j/n6dcxvfJZdDlC/2WWMzWLz03mFj1jX9sH05YePesMILlM
 bpxpTNOsAQTWIVZBy8xRUxbAEWXdi3mHY+yV9uWIpW4+19AVbYD5MCRBGIBuPz52aU/a
 EB5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOWJLKOeSKsewkn2OtiKO5BKChilEzh3ciFtEECqd/LhwNZOoXSKnjlyLwflNmrK2vpBmGMqCcl64=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysV4/F/lzvdLNydNOXzFHiLIfIHru6zOUzDKcxibapZhO43Pfj
 I5jse2oHaY7lfp4TeCoC6cvacdjjQA6u2o11w9rJfZCh6ps3O+fJorG9I5UUTzHgv55zuHCj7bR
 KBFOzS7I1xvVaONHNPtiS6f7qdSYOUfyScj41XAjZtPmZbK0sVlFa0+c1YFny7hZBU04VYLA=
X-Gm-Gg: AY/fxX59bwnb+Gk17iGYqmIPyb/yYE2upTw51ItmpxwnPu/NG2njFSe6MxffiI7Pl4v
 LOTJxksdbbdIwoBJJ/W7r2pHB3hQUWQz46lXTwR7DoBxaer6cgwnX2CbwzuKDSMZcXx9+RbcbJx
 S4MMGrSrytJrc5+TgxPCITSaL0h4GnTRpaP1HS78Ks/EY6bFNaBDRJk/3EiEtLdgzkWJbGA0E++
 j+fp/4hgVqaTripUS/35Cp9xttx/scgCuE4EGsiCU8KBBbGl+C7FS6h7XrkfUzBV1oEIIHLaKF4
 zyvxJDVTzmZlgomf4YPHmd1DHq1bPbH5OVaZ1euIvx07e/i68L1ls6dl5OLDrAhttKL4Gjmtn1m
 l2ck0PBQrUvJp4idFhYh71qcA7g+4y346tQBX7s1aUg4i6yoMcXdKu+ugZy71XhsEFQ==
X-Received: by 2002:a05:622a:247:b0:4e8:a54d:cce8 with SMTP id
 d75a77b69052e-4f4abce7d98mr117884141cf.4.1766394603170; 
 Mon, 22 Dec 2025 01:10:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTv9EYxPbsYfG8sAutjjuuUPajlBybvkaycaj2QtwrxowzdMs7eKcuYEBPmJLLlgfLbWzTsw==
X-Received: by 2002:a05:622a:247:b0:4e8:a54d:cce8 with SMTP id
 d75a77b69052e-4f4abce7d98mr117883871cf.4.1766394602784; 
 Mon, 22 Dec 2025 01:10:02 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b90f53b21sm9799699a12.5.2025.12.22.01.09.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 01:10:02 -0800 (PST)
Message-ID: <2f3c7bc8-8c7b-4c47-95de-7a8ac6dc3c57@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 10:09:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/6] drm/msm: mdss: Add Milos support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
 <20251219-milos-mdss-v1-3-4537a916bdf9@fairphone.com>
 <475izg5bi56oefqtqkvqeyspx2por66zrw4tgqbb3f2ziaghyt@tccm73sl2u2e>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <475izg5bi56oefqtqkvqeyspx2por66zrw4tgqbb3f2ziaghyt@tccm73sl2u2e>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JuH8bc4C c=1 sm=1 tr=0 ts=69490aec cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=DgVbG8OoVQ-VTv-dGB8A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: c1v2qdUB8Q1emGizEhBPyoWIFHuAdap2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4MiBTYWx0ZWRfXxTFqKwWg1lyN
 0xE1Vfjq3lT9yWp62VwwgVdh5kSV0NR8u3qkOFeqQKTEZv9T+UKbJ0h49agWolvfoU5bHLzvmp9
 f45LdiHB1iqKSwS1F9yGoK1GKBRiYZulTi4M8rF48//r70BpR0ttHJJCD5n9DonrZAM4TG+bOXk
 +o3wcIJxpf9tDsSuGPLvE/V8uwgGfQenX5a90UQAt65haVEtPNP6xNLg2f0R1DDtoTxpNbM0ErP
 cDFWTZ0870fFM4fyVX6qf9pxCwjkzyWhY2pCBxX0/u5ztCVt2INRf4ZoUXTiQQJch0NHOoTp4SM
 CP7/zFHGosWL2kMNL7nQt2fsPqMmuFESoZ/YJXiJStRuyL5CVattTiRW6GskGittSVr8tKQbb8K
 ciVTse0MMmDBwicD9R5sTC+ItB+vZmDYvYF9lMKVBbvhJ1q+I6y5sNHiL05COyrGDDjZ0ivqANp
 WTQZ12A7zGXSYlRjL4Q==
X-Proofpoint-GUID: c1v2qdUB8Q1emGizEhBPyoWIFHuAdap2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220082
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

On 12/20/25 5:52 PM, Dmitry Baryshkov wrote:
> On Fri, Dec 19, 2025 at 05:41:09PM +0100, Luca Weiss wrote:
>> Add support for MDSS on Milos.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  drivers/gpu/drm/msm/msm_mdss.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Though 14000 seems lower than the value for all other platforms.

IIUC it's essentially "nonzero" or "first-level-above-just-nonzero"

The downstream DT also defines a 140_000 and a 310_000 point.. though
the middle one is never(?) used and the latter one is only used during
UEFI handoff and upon the first commit after (runtime) resume

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
