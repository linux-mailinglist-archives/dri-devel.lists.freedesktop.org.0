Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3BECA7185
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 11:10:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35DF010EA9F;
	Fri,  5 Dec 2025 10:10:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EnFt2avy";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A3f4pmGy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E6E10EA9A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 10:10:34 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B597iH62896539
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Dec 2025 10:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2CR/m1EziAWXkhlhHGXHaDJSzwxk1KHIJ35EMa2YMpI=; b=EnFt2avysqlqU3Pr
 R1TTsAjPul9RIqEAR3ZM4ejGNfXSxuJnh60LAdf5ma8OPXmnBjswrM0Vo+uZyzwh
 SO3fhr26TY51CgYQ5FTqLdKuxLwiWHKUEJqakaZIjfWUeoeIbpYTGKv6rTrcR5+X
 w13wk14K/zUiChaHyt9Onw3qxCI3xIcae/QxU6li4UWBQUvC51quO3K6l/crHtUt
 JyhdXRrJrL9LhByjOJZlr9ZIq21Yl5DN5F+i26IW97XUk71/kIXR3dUEt0NOcaWB
 TuqG+cg+ve3k6n057nm3vA/YJ+seRs4JWALUE6OmX45hn8fdgSX2PJUFSGlXLzZj
 BPAntw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aukmj1k79-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 10:10:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4edaa289e0dso6625451cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 02:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764929433; x=1765534233;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2CR/m1EziAWXkhlhHGXHaDJSzwxk1KHIJ35EMa2YMpI=;
 b=A3f4pmGyvjQT6C/gJhWPWIFLWgOKkYFJdyI+FSr9Lb4hBvqdIk0918RgUE6qhANP8I
 qRocV3gutG0a7B1hW+n2K8h+G/ZE5X8QH2N3hARwhLPt3BcYVVqPJ3LBxheMxjharYJh
 O+1BvW/oZL03IslzXHqPvhhuQoy4kz3YjBLfUFqbF76sUVhE0VJZJgQ85AZj8clx2Ghf
 7yz3n02TqD9l/1gQPFxi6taODGv3WwmevXAFov8VKRT8YKfpiSuvaeBNF/6OC8wSr7UM
 l9GXBP2VQqDV+V8IAibVFSCzQwACMoLbizPMravGZUb1h9ozk2d3q5+INlf9ot7bG+cQ
 8jbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764929433; x=1765534233;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2CR/m1EziAWXkhlhHGXHaDJSzwxk1KHIJ35EMa2YMpI=;
 b=rCIVbNO4afKqPBlwB88iobF2ku26i7PwNDhACFoKeuAYXuQxp22dZHO4p5vNW1eLqC
 y29c7LUi86rtszptyfjMWbOysKEbqDFTKcThtouGU93ixWY3FCxaLFErQUoqseGawXji
 Q8ShwgxTr1nThREKl3ihEnLIqy7JbFpfLuiJrQAAFp+dCEwFJS796w7i6CaYPjxq1WfU
 H7MnbE9dQVVCnG6L1+in/RLZGzlthm3MXzmIpKFbyX4qzAfmd1XRGOWMCtB9RIxrVAsO
 QLa3qwHCw0zw7vC4BuZaNbdsYivzvmsDX1jbBcJ5NjMg/v9zXvVeViqknO5DOgF6b6jD
 nkQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRchrWg3mQqqFCGEyFUChw9LqUYqWLly2bYpne7wX+a+pdj9pp/8xIeX2SlIzp/MpBrN1qmvRNM8I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxThb/rvQUbFSme5CZojVJRueCAxOCBctfm9qE6s3sWhcN6fSyw
 qQ6wHakogNIqWXyuc6CvDeAE6DU0ElAMQLRuLyzan+dZP1dhsbJbckLrc8DxNkl1RUPJimV2o4C
 gvSDhtC8Sa9xbuQeV5fFCtErru7dRESzmlzl9+YO4AZh2RTGwb3heJM4CetqA6vdgsaB1gwA=
X-Gm-Gg: ASbGnctYyR14VUC3LtHHBsqgq02lFl3f3hcp+/gjK4tyiiExv1u+YdRyyxQWnqrjLCU
 UEqohGk+3tJ4eZPsnwbM/eTJ+rVLQWNG5k2eoc65w/jgza/fRPeOnYbM14zypvv/TRowtgHnmpd
 UFr/pKO7Xc/19bUGkOWetQ1uoYDjTI96oyc2HAneTppZ2ax0Hy3wzdKDPFqT7v1ShKO7qNtCazh
 I9bwQTTjOPZfZ87OHtDkvQeI0kykqK7kGFW0z+YLDhsZKnPk9kvGa67LbFobmfArrtrPVwgOqCK
 zOTzkGzMpgrsTyeLo28dQmAB3rELaJoY4ocyHibOjQiqVJ0/MU0JbPhFwOcKRagcdUPYV1ckKf+
 FcufBOy85vKqB+PzMgHRWWRyxyEf7xstFHWQpzvDvRSgo7zQ32o3WwVNh5VQgwANylg==
X-Received: by 2002:ac8:5dc7:0:b0:4ec:f9c2:c200 with SMTP id
 d75a77b69052e-4f01b4ec03cmr86964441cf.11.1764929432731; 
 Fri, 05 Dec 2025 02:10:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHyRAhn0k1YE9PnYXg3wa/SAZLktCWYdIO5bMKO203xivv/wR+f0izBEVjDCYKjQN90jdqwmw==
X-Received: by 2002:ac8:5dc7:0:b0:4ec:f9c2:c200 with SMTP id
 d75a77b69052e-4f01b4ec03cmr86963831cf.11.1764929432114; 
 Fri, 05 Dec 2025 02:10:32 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b79f49d24a6sm323585366b.54.2025.12.05.02.10.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Dec 2025 02:10:31 -0800 (PST)
Message-ID: <7d71f882-1d52-43d7-9f0f-e7f7b53c853f@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 11:10:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] arm64: dts: qcom: talos: Add GPU cooling
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
 <20251204-qcs615-spin-2-v4-7-f5a00c5b663f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251204-qcs615-spin-2-v4-7-f5a00c5b663f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bYtmkePB c=1 sm=1 tr=0 ts=6932af99 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QDjCMyA0A8yHJihhU1wA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: iE4-XiAkZoai1Af_BEkOZ3nR10LT_taX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA3NCBTYWx0ZWRfX2pIUufPJ/STb
 eiorkSUwSUShoCthe2nXSFsLYNMckZ2XZJRHjh6j4ZhL0KhetSVeKs2kGB+3gHt/tGNzCLGxsWb
 6+gj9u+SQaOlZiBVIH9MKRbkZY+2WJkqruGbxLbDutSAhGEy4P6BugTlhJfAAcfTa1C/UC9bJuG
 vVPG+7m/ggSJVCtuGzvK0bxKQnW7T4phrxz6H6H+qLpR8YlQD7kG2VPXoT3J2srgVyv5cblDa2E
 52qXzojFUsVD7JUkYXjPiYG2NRCpnxzh9yJueHAtX47XCwSycK5cHM/3wPOgW3Jzpm5ELmmvIH9
 B+YYfuV/72fWaV21TrA8fRmnyD+AZbNnDSI03yeMf3pcuD4xHpH+LY2HnXAYWf5Hcwj8OGYNNFW
 p8WJ9wOMRU5I56dnUvm2KrgAvE8+8g==
X-Proofpoint-GUID: iE4-XiAkZoai1Af_BEkOZ3nR10LT_taX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050074
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

On 12/4/25 2:21 PM, Akhil P Oommen wrote:
> From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when it
> reaches high temperatures.
> 
> Set up GPU cooling by throttling the GPU speed when it reaches 105°C.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
