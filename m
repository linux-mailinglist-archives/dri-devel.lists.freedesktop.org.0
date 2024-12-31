Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E2C9FEEB9
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 11:32:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB0310E15A;
	Tue, 31 Dec 2024 10:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eRV3D+PJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF0510E632
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 10:32:54 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BV5mnJt009655
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 10:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YSJC+oAIYFHch5VxryaXW7jbaxZD9NOaWfHg11T19a0=; b=eRV3D+PJpj8fjCSy
 4aNxjO6gdNimMFRQClI4GqQiDZDfLWbWRmh5OedZm1oLQq2O/n4iRq42KeKiwucL
 /j/igHgVdWOsb/VqNKSKmdHaWxip6OoXFhZDeLXb5n/MzCtYK9TXl+GVpqz+rC+e
 zKR4gD6LK833S65OyH6bqRI8xNiHzfLjoiUZAhCzy3+nfofk+5RkweAn/gbQwl6e
 vAmYnsEbkQA3enoc5ZGShgD/py/eto+2IQJMiEyMtzm65r6v77dNRD4D0gwIJvQn
 SUFoTaV8bBrGUY1Ce6WtkwyMXuxDIjy4cy/n8FLRrRy2fsVgBoLOp+qpGLIuA/FX
 ERzVXA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43vasy8m7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 10:32:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7b6ee03d7d9so62836685a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 02:32:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735641172; x=1736245972;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YSJC+oAIYFHch5VxryaXW7jbaxZD9NOaWfHg11T19a0=;
 b=YVpUWgRL8UgA/w3chOJcoADvole6dOelQTewVwFT2ejXo+g06cXVMFQJ0rYbC1WSAG
 XKTSs8WuPfLiivNeYn5RyYd+L3+UrBfv6IfLhvdZhsPQ+6myeJTXb4SuVA7GDBNbKrtg
 MkjOUzrjLdnQJM69tI7PCwaYzvnwez85BHu7131T5tLxLebGBtzrvsia9Yj/fO04RhMD
 8aiNSpAKI1ys0ClsARHbFLQssePDx3dS2Ry+UtkPZqwpRNWrPw+qRmMci2zCvQoYF3/Z
 Xcb5nn1VN+L+l9haeSWlEaKdNkeHMeN3Bt0qKUXm+MlmvCBWPb301o7U5vTssg/OoJvu
 qaEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWq91xAY7Nxr4wsfmJc7YTZ5X+bURBZUCPG0nZOBeozBXuIDddjehtpO9afZW5DjZ4DxpP1U7EiEw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVwfbb2kpz5eqjbXWQGLoIXOch//UH+h3m9RRQ3uLZ+371HBmO
 5MUk/h99dFdHLOj/NmQf2THb5ubhHeQhRhLJdln68gA0vL1ovk8cO2Kj1xQ4sSruJcEaunP/OE3
 NRKj1c79s4kCQXKjeWjTC9MOXEGVNLS5X8dlejgMcK1n8JkmD54Iu+/aJVMO5F9yzvGs=
X-Gm-Gg: ASbGncuw0d7ToPrpyEOyKenupCtMjlQ2Wgz3oQ9a09GX9yn4BGyGlVvP0FdGLsyZzEv
 udXcAciftm5Qc8P1h4EkDJSXQSg/7q6rthxYb+o7bpbgI2WCh7p8E7LPM+ZoP4yNAAI/eqbazW8
 WMWrV+Jbr1iz43BssGfQQS2RgKtHZfg5jjNqHM8MQ1NstQsCSc4U5MQzzb4kaZnHZUMmzUsrU5K
 ZmWjRYXZyUOciITSWx9JDvjpy31TLkAJCvw4EJjiZ9wpx1x6yRaHvjv/Dj99f54thEFEH/nQImb
 d1SYScQ6Pw8J+jTupq61tQPHIfal2Eum6es=
X-Received: by 2002:a05:622a:15d4:b0:467:6283:3c99 with SMTP id
 d75a77b69052e-46a4a8cdd7bmr241338501cf.4.1735641172150; 
 Tue, 31 Dec 2024 02:32:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHev8rES9N0OrYAIAyswBL66viX51APNE3D7v2N9ryEeR9n7vvKglxjk0UBQxLmkedJMPFHTQ==
X-Received: by 2002:a05:622a:15d4:b0:467:6283:3c99 with SMTP id
 d75a77b69052e-46a4a8cdd7bmr241338221cf.4.1735641171775; 
 Tue, 31 Dec 2024 02:32:51 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e830af1sm1560481466b.14.2024.12.31.02.32.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Dec 2024 02:32:50 -0800 (PST)
Message-ID: <3f33a94e-3fb2-4df2-91f5-59a92f5094f0@oss.qualcomm.com>
Date: Tue, 31 Dec 2024 11:32:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] drm/msm/adreno: Add module param to disable ACD
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20241231-gpu-acd-v3-0-3ba73660e9ca@quicinc.com>
 <20241231-gpu-acd-v3-3-3ba73660e9ca@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241231-gpu-acd-v3-3-3ba73660e9ca@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gpV6EsSdOqIqGoNascxm2_8nmNenKZFK
X-Proofpoint-GUID: gpV6EsSdOqIqGoNascxm2_8nmNenKZFK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=925
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412310088
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

On 30.12.2024 10:11 PM, Akhil P Oommen wrote:
> Add a module param to disable ACD which will help to quickly rule it
> out for any GPU issues.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

Is that something useful during internal development, or do we
see ACD causing issues in the wild?

If the latter, would that be caused by e.g. outdated firmware?

Konrad
