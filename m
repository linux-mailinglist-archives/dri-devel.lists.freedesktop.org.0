Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC69B9E45C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 11:20:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E6E10E8AC;
	Thu, 25 Sep 2025 09:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="owxgzDMu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2858310E8AC
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 09:20:50 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P4auYe028515
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 09:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 J03QPepsogPpGOX5Hp1cEWYgqtb4aYw0wehT27zRwhc=; b=owxgzDMu2Fk3akuO
 VePtbRXRjuHYx2ZWq/g6KNqV8mw7XOy+F2Q1I9PSKa9njAGhk3dyhLcO9/GlR6Aw
 fj69wBCMRkyajcj6HJrInkarA9M0wKRSSpwU0dAVkXlymSVvzd6ReYrM9YJ0ePKa
 EcF4DuFYcLcQniD5DhSjB34AnRsnXa3s3GXM0OpcQ/oxRczgzjrSWqiBMpqlTlXN
 ePkl2Kvkp82f5ZcZnAkhc8LDNlhAuQoZhKO2eHWWjZT2MrxFHDyX/0zGhb54QmlZ
 hrM3xM1q0MHlSmdWKo6nSJSqzEHD+pbCAN2xOAapiB93m2P9fAtEzqIBjL0UJqVN
 E7QGEQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49cxup0rq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 09:20:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-819d2492a75so38100985a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 02:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758792048; x=1759396848;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J03QPepsogPpGOX5Hp1cEWYgqtb4aYw0wehT27zRwhc=;
 b=k57tHTGN4hH/e2+TWWDDha+AJLWawrkCMfyNWx1CWuoVYna3Mh9nNDkMefWsQp2LNz
 QANZ/wpke8w5PEHNSBDxCtB2T94KsUDgIb5n+h2NKqacXENov/ioKfBYB0Npz+mhsYhL
 ZpC6FB3SXXhZCrfd24foD0u28zsFLsngzO6rlG3cD3Z8mE0BOUUN8Da8BoltexSkxXhg
 OFNy3ocTVijK7+bkS7oDKuYieJhUW0ynVz3NBvOHMleFoF10JdO4LPHvPZlQv3Hl6mw9
 +zgB+FTvjns3tvqHwiVlK5Zp1ocBFPQOOkwX4rAXcXghOtBhKVvv2OafM9Y78Dtz4EJi
 V94g==
X-Gm-Message-State: AOJu0Yx6hhZ5Z+QUHuGzhoyKs9Y8UPDZmTrdqMoO85oSv9qmOEn6aiPb
 snY6ip8yoy1jzx3sSEZp2ePlVxKWZsXVWPfHf90LWqVkmiPa5EpAbGbqbqeSVuDcA5hHPMSVTVw
 uNM1WUHMy8eoUYdF/KbMaWgjyQRy361UOAZ/Ye4tTF3cBSfbf7S7Nn1cPLhwwgcwzXdNaj2M=
X-Gm-Gg: ASbGncumSaHVHUcO38T+c6B4LO5Gyi0WgItdJgh2LvMs1bKVNMYZInahHvpBrYC2NeW
 LKUYBR/XARHzeP7dLTulnb0qsfWndfna+sA9Yhw9nO6uLJhkokEoeqGgQht2zoh0sJZG3fbV+UT
 geHGVtCriWGFLazIFvZ0eU2UZnsTqO5DnE+XJqPDZRA0JkGh+18FYCClTp5AvllDVdF5TGOzatQ
 A0HooK9oeaRtMrGURfkMKXwsIGuDNEupkNAgYKUwict9J7ZUI7UgMRPv7OGRuFIYBVJXpaBcjCC
 yOh5Hpo7ObsYKRktcISw+APqQ9IBkRhIP41k/AGTgQeX5PoqAngYFP2F/6NLKQ6BMY3i0wcgBXn
 dBy8bIfCTBKDSOcrEOkDbhQ==
X-Received: by 2002:a05:620a:2954:b0:80b:2e03:dc88 with SMTP id
 af79cd13be357-85adeb4da48mr256640385a.3.1758792048264; 
 Thu, 25 Sep 2025 02:20:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxlKFEMgfLPnWUY+9AW+CoP7+beslOB5aFZUiExK3V8Ym0wfYrxR4gKAsXlJWjx7TSAIaVSg==
X-Received: by 2002:a05:620a:2954:b0:80b:2e03:dc88 with SMTP id
 af79cd13be357-85adeb4da48mr256636285a.3.1758792047678; 
 Thu, 25 Sep 2025 02:20:47 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3544fcddf1sm129596366b.77.2025.09.25.02.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 02:20:47 -0700 (PDT)
Message-ID: <55ca6423-a27b-4ac0-9c36-ba20bf8172ee@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:20:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] arm64: dts: qcom: sdm845-oneplus: Describe panel vci
 and poc supplies
To: david@ixit.cz, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
 <20250925-s6e3fc2x01-v1-3-9293016768f7@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925-s6e3fc2x01-v1-3-9293016768f7@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B4a50PtM c=1 sm=1 tr=0 ts=68d50971 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=CJSKMeR5ttdQttduZpoA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDA0MiBTYWx0ZWRfX46kI6QY3v4R9
 Ht9jzHUy4M19lhNK6uDw7tEUBlhunHK+cl11nxCbxFVdmQJHqNUyeXJlvjEuxTo020uqSxDPHZu
 9ZXKR0/Q//azdqngTJABggxCvUhZSwPCGU9PtuF6k3axhm+eWNBCSu2u21lBKDYOLGcYDl8P5yW
 7u+OenATgBJoI2BBXIjr67dHTjYk5onpiZ/25tu05J5cer4dSGyYoWATJul+qMx6dEmc4DGbaBz
 EZJLBLWg9CMVTPCQZoNXVzplW773U2ljyWikardsuvsa2DBidcgRRM0g8dq6FgWwhkzlqs64S6z
 GkfWdr5LhdVEHTcQ4a2p0Hrq4XOZRYgYyZOKTucTHx/5mISTABk2HlqdWxKViIMW5IGEl+qlbb9
 BFOVBdK4
X-Proofpoint-GUID: kPx9TsV72bW8OCX7E8skgbuwSZkIssw6
X-Proofpoint-ORIG-GUID: kPx9TsV72bW8OCX7E8skgbuwSZkIssw6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509250042
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

On 9/25/25 11:12 AM, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> There are two additional supplies used by the panel, both are GPIO
> controlled and are left enabled by the bootloader for continuous splash.
> 
> Previously these were (incorrectly) modelled as pinctrl. Describe them
> properly so that the panel can control them.
> 
> Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

You may want to add a pinctrl config for them, to ensure the
GPIOs are not in a funky state

Konrad
