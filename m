Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6D79F1075
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 16:10:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A44B10F04D;
	Fri, 13 Dec 2024 15:10:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mK8J6k93";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F44B10F04D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 15:10:55 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD8rNJD022799
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 15:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LMIc4H61MSX6NhiZyaW7yQQ8yYjrJ8QN6wNQuoNHEE0=; b=mK8J6k93itNSQHVL
 3K2T9rLsizlfRH70pfIh13QxdWITiqOKxT9q6VaMTeU6Ek2qbGChXYlLlgS0K+GQ
 MBsz6hxU2GRFXe080hRCYhHuY/ja5INxatSXQWiOYSkSvXMIg2eeDqUIJ+jyeCVg
 W2OktgAHNaMPkt7haa2AWqZAyvOgLQ0iqCdDOcWwIE9mTKTWdee/A73uZHv+M1lr
 SaaWjleMW6osd4hMaIEZRknj2Sxb2dqVDpoH4mdTx9ITM+08BQ6Cg7YmTaF1eh8N
 yD1sGzaX6GMAbk76eYtOC2ZmHOPhGrSC6T4KS7BbhIDkApo2ZwLaUP0s1GqvBJiZ
 A5vuwg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43g4wnav04-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 15:10:54 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6d8824c96cdso5041756d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 07:10:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734102653; x=1734707453;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LMIc4H61MSX6NhiZyaW7yQQ8yYjrJ8QN6wNQuoNHEE0=;
 b=cFohAPQgPmFBkR41i2l0Zeje9YxI+befrlMXU6E1Nkd3wKLsM8hKRIKIElxlKfQKv4
 BbIMSLQoDYNrb9ZSHlrbl0i6OeMxdD93ZP5n3GnkOLJwDDglegAbEy2uJcnIE7NWSoEh
 2Wf7FFmWiqDT9c4J89jgaASzEpOp8A0nmvwpxVuGCnOdYsEyfli8EhugZzPQkz/xPxjU
 xrAMyMp0ezzvHxq9GMgdF2exgcPo1AeCMZ5X5GDfrF7OxLB0l/qMjrSwLMhldo8jvHi9
 Uk5XTjEJ6okbI9BA6eXCJAYxBrbNIsROm0+fhz2zIAUYlqGZ25/KfSKnk4NrHC3h7nKK
 60Uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbJLeLm8+pD1+Fx54j4aS3AZtsD3GgjPM7oO2qGBqOq9iZND8HBHxKLMZbND5pO+vBmtQyBerdscs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpTzZl3O9QjcIMrJhJhyLeTCqsEwJvChqHSDRxbqsrBpbXazEp
 Y6jUQtrJGe7KKCzCPf3HW+rKECQo57HQRvQY1GJHHY8D/w9RA4sh4R2Ou/hldoRfmabawQ3Xu0D
 09Mu3j+18scxp1+MA74d7D/56oiO9HHcCva9+8Wtkuu9m8QfVrQ+TFg7EcYWzLYZ8NXo=
X-Gm-Gg: ASbGncuwPP5UlqkNHzjiQTwdo4UNVFcFOjOAYG1Es5Zg2tnuieBUy7GmeW2oo9kM905
 5sGZ1lEV6l5TqxjYjoclDJ9tmKUBsFCBNPIpbIjO19ToQjwzv3vFO1OB+zSYTVIach+Ab4QXS1Z
 W/Zzx+/BPtvsXWmDQiludpxJG1ZbsfzU4+zfsj6EvXJbJgf6bExVfzV3w8Hefy5fXD9RZ/FybG5
 Rs9urTWR6mhZqOI6UPA1JEZZoxsyVjySoDZ3Z2eLUjgoAfDB9JWJr40dV6JTFPTughY5uCERjHV
 EpVu0ExrSBg1BOl8oqx05w6mMfhY2fufEeeb
X-Received: by 2002:a05:620a:4609:b0:7b6:ce8b:6858 with SMTP id
 af79cd13be357-7b6fbf3267fmr153298385a.11.1734102653256; 
 Fri, 13 Dec 2024 07:10:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXTG+90+T6m0TzrCRgHC+VZFlf1IXbKAxpR0NrkdAYlucCrf2kmttpqZI7dcBXlrZ51YZyFg==
X-Received: by 2002:a05:620a:4609:b0:7b6:ce8b:6858 with SMTP id
 af79cd13be357-7b6fbf3267fmr153296485a.11.1734102652746; 
 Fri, 13 Dec 2024 07:10:52 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa683a0a736sm746086866b.142.2024.12.13.07.10.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2024 07:10:52 -0800 (PST)
Message-ID: <a31a60b2-429c-47f6-af8a-57f14163a4ab@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 16:10:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 3/4] arm64: dts: qcom: qcs615: Add gpu and gmu
 nodes
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20241213-qcs615-gpu-dt-v2-0-47f3b312b178@quicinc.com>
 <20241213-qcs615-gpu-dt-v2-3-47f3b312b178@quicinc.com>
 <a41eb4ab-2045-49b3-b571-b49eb5a05057@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a41eb4ab-2045-49b3-b571-b49eb5a05057@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jQYWn-Eh0jHTy-2AJxVebhdpyq6YCUwE
X-Proofpoint-GUID: jQYWn-Eh0jHTy-2AJxVebhdpyq6YCUwE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=717 spamscore=0
 mlxscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412130107
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

On 13.12.2024 4:09 PM, Konrad Dybcio wrote:
> On 13.12.2024 12:31 PM, Akhil P Oommen wrote:
>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>
>> Add gpu and gmu nodes for qcs615 chipset.
>>
>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Well I forgot I made comments on the non-resend version

https://lore.kernel.org/linux-arm-msm/a44027ee-40d3-4552-8f61-bcab77476f68@oss.qualcomm.com/

Konrad
