Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03554CD5388
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 10:00:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B2EC10E53E;
	Mon, 22 Dec 2025 09:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QhglG0sp";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UoC2OhXx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E019410E4F7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 09:00:22 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BM83GVg240215
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 09:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7dzW06QAIiAkc0UiQYlfxr0uMo7Khj7kqrWF0YPuD9k=; b=QhglG0spVm0QGZ1Q
 SZBd/YM34FpvT2X0InMZs1uuuAtN8Sb4WBPnDcJIcemDtm1jUWiLw+E/VKOpuPt3
 5xNPxP9BqYhEJ6N9HxQDlfm2zDM+jhXyGlg6wqjf+4p4LBzVUNjbc6uau2C1t5ox
 aK2z8xu5nKl4jH6qy9eOK26SH1O+50Ax7VHAbzbLVxxsapAkTtY/koq0PZJwekzT
 BiL1aAE5oYkDVOzdFav27lBIP4i/HNl0wmo70zSzunKQvPrcSMP1CE+ba4yIiW5P
 +j7oV7ARwpQrMeekK/5tcMCsSKEP2ejGW3JI3uCkrXKFba3Hm55f6HdZO2fpOcZs
 OkkfsQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mubmcea-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 09:00:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4f1e17aa706so20599381cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 01:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766394021; x=1766998821;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7dzW06QAIiAkc0UiQYlfxr0uMo7Khj7kqrWF0YPuD9k=;
 b=UoC2OhXxxTFY2j2eJ2U+6dGQ0Cgi4gPL8aA/sQU4rleRGH8HynemcxrveXzw44ETHa
 B43jdYGn+LDSykYAPG+wBM7H5lyb/uB/kKYhl0CoSKeobTmdjIq8gT3hov5ACDLAX/Xr
 gnUUYMq5WESDjb+gzlsaS2aDQo5Q79nZHxPYiNbOHKZ1hI/RnQf0TuDYSciMIiUcIDUm
 hWiqQdl/sVa+LQrQ8702I+YymUoJwr/YTGsBAwNw8BbKKPAlmbZqdkLImwRfvP4S4zQ9
 BtdsB8EjcfuSmEvalPbYyif0ee8f+pH+CorrYspZVK5+uG9EqTszBixodBD9bGMVAbr5
 XQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766394021; x=1766998821;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7dzW06QAIiAkc0UiQYlfxr0uMo7Khj7kqrWF0YPuD9k=;
 b=cOR1CAxALUst7bF5KxbWYs9FWtpdqXH/AzrSe3zqXH6QnmVzISwzUih6WEG3UvZkia
 I6G8NrzxajodgMeKvy4nHTauYrqTDgmtT0KSIDTeTjg+Cm6+HJ9ZReDnJllzXwlI3z5S
 00WsX5dQfkif9R0aMywhGtw2HitrHdPEVDTKEu75+kMBwtolDU4PbQY+8BT/n2Hpt/S/
 ojK6gLn+UKltnCW+XhvaUZaVUJni72BQDrBtciEY1TswO4UqHJNvU5C4DDjkTAiUo175
 C4DImQMfXFSo+YXoQ44oHYkNMrBE+huodK5SFd20yxMuMGJtBZgrJ7NzI16Y06j1AK7I
 1mQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhLWojaGDxjQvK4f+0yQhW2aqQvcK6dw1uYywYbfTGyLKWXk8G9bIJnM8G7lCNLhm82EmaSWUDC08=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzViKTamYIDgr2awyAkFWak46T77smJ8DIoRb8po686U79SSDTL
 xJz6xQx9NuAGvQ0u+EIWNKTwaDlkOFkmFHf+oC1sFQp+cYq+0az8J0JKJvoQc/EwmomSE0SsQXw
 Iz/EjvwcByF8RFstC/Tpw7HM3w7lPyB8GCh6f9wrpJZIse5UtNkbGp5wcpEM4QvBBqo2C3Lk=
X-Gm-Gg: AY/fxX4nnn5dcELPa7ModRDnUJi16pUbcYGEmYmxHaJLBc51wUsjndxEmFOHbs4xiz4
 gX5/cB6oLlu2g0xpEiIg9LJF3NXO1gK+gTlMeQOnDM1PfOH1gBwDtSIcNy1pgA3hCh4cvWlft1Y
 0DCGVUJNJTrMnGfexMD8qfIpZkdfT6GFS5EPA9hq2H90FBL6CENrg7wgdxaBdcpUbyYIw8R0SdS
 tYAWn7J142qpep/2rGGz/KmvgEMmY4Rz16f2M4ecdQtukkRwuovHWLP+OZdVmRxJeW7J53LUW91
 nhzpRbVR0Fe4E9Mr1UY810l5KeaA4/Eyk910SbTQKys4fhlGt/olkid8ouP7qVxIhpKmhZqLEEL
 RWYPCVNWkGcOi3g2H1/AtrmpXf3AZx7wYjbX0/mgxd4DA5brmwjBy3ntyQcv9W+DltQ==
X-Received: by 2002:a05:622a:290:b0:4ee:1588:6186 with SMTP id
 d75a77b69052e-4f4abde8b40mr126852931cf.11.1766394020872; 
 Mon, 22 Dec 2025 01:00:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJ3sa2cwix8pdUL8luSbRZkdo1cW7juRVDsscaa4ncFyVB+MukCKD119lgajVKKUHQrCA2Sw==
X-Received: by 2002:a05:622a:290:b0:4ee:1588:6186 with SMTP id
 d75a77b69052e-4f4abde8b40mr126852221cf.11.1766394020083; 
 Mon, 22 Dec 2025 01:00:20 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f0cc52sm1005945566b.52.2025.12.22.01.00.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 01:00:19 -0800 (PST)
Message-ID: <0d442547-db12-4408-a0cb-b3d2bbc723d6@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 10:00:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/6] soc: qcom: ubwc: Add config for Milos
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
 <20251219-milos-mdss-v1-1-4537a916bdf9@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251219-milos-mdss-v1-1-4537a916bdf9@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4MCBTYWx0ZWRfX9l21At6DO+2c
 SYhr4+4Sewoo+XaqK9EA3TwVY7JR02oKC2nP6sPhYZ+b/OUn3QSfAcF/pPvNc7ReEzEQtSTaVXu
 qMuVIxMpXzUU1TFpVpgTApMgJGxUl9PhD5cbK0eHRxxRNUp+IfTcfzyoVrEmvtk08Yvup9QKdLR
 FseG5YISalgLoVo/fPXs4mCEkpd+7BO2v6Gg+8DgmQabZDltwLuC+zkhoErC9A4Rug3mNJiHdxB
 f8TYA8i7iJ8zzLCOPw7dB6r8Dh8y3zar17XNSQ4HhSLxR3bVIbIwG9fm75DYRrj3cn56KT5s1XK
 38trkt6p7fmTDv2pj+oNA0bqMNHic2umpTK9/1bVnL7xvUz1ytJB8sqZcGpIoJgsCq8hse4g5oP
 guJNzE+V9VVezZwm/Xvujkby81qkR6ks7Z7iggArkZ/ZRQjZXTIpMcaVX1dYUCal9+s40IhlBZi
 MZOutogo+xZpfDfGFmA==
X-Proofpoint-GUID: P_W3bHNNL6DA81GK9Hztes4v6EaZKEF7
X-Proofpoint-ORIG-GUID: P_W3bHNNL6DA81GK9Hztes4v6EaZKEF7
X-Authority-Analysis: v=2.4 cv=KYbfcAYD c=1 sm=1 tr=0 ts=694908a5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=KB0s8L93-oSB63ZrkccA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220080
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

On 12/19/25 5:41 PM, Luca Weiss wrote:
> Describe the Universal Bandwidth Compression (UBWC) configuration
> for the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
