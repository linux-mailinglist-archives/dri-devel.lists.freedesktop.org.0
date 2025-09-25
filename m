Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A56B9E47D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 11:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A29510E8AF;
	Thu, 25 Sep 2025 09:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MpxISx3D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE10E10E8AD
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 09:21:57 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0KfJx025136
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 09:21:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qkY6Gkhe4/YsWoOULLmVEty3WERnlLeTlM1ZWPHFrjQ=; b=MpxISx3D5ylLI7z7
 xry39xZ8wQkjCX0D5Tav+KZW74WENGTIphUInpXBVPNrEK0J5iIKevLedCaQqrxb
 Mr/Y/F8WbfyqTQ0T/lyCFh+VxB75TTdEmUzXZno0OqkHBlruo1yyrwDi5xv4xQsq
 puJV1fggyRt+nU4IauL1ESO4wcE9Y8d2/SMNUsE1WlysrIVB2WXoUwRfIBlzUg+J
 MjYSlAlcRch9h3eyALoo/aEFlGSjH6N6fZKOyhay4fadPgF3qvc5m5hdDRWTL0uF
 yIiOujlPGMoh+GuZdbulCMsQEuK2b4hEYRx4CT6LGtf1zIDvcpkuG1ZFVut0GwVr
 8k+sZA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv17j52-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 09:21:56 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-7f5798303b3so1789166d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 02:21:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758792116; x=1759396916;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qkY6Gkhe4/YsWoOULLmVEty3WERnlLeTlM1ZWPHFrjQ=;
 b=eZnsf6Mh2dVdNkcm8y6SBe9rC0RcjKzDTtYoZ8HGJXYAfh0fX15UX9e6PL4ke3+zlP
 sQHU6AAqGaTmSRGJkiGF6XpTPUBy7mtrjc/LVoFgONnzlZuw6VszETlsjSKHQ2WX/eja
 uIzwUxFFHUza1PLX6NFSNYopIpnx7uFcj7X2ZHD7KPe+2f/g0Byz19cTxi5BTxYARyvS
 lIGgwiDLwgCr/ut+fnivz8hlED8qzWECu5pylWtiVsE56YRpRrvZt6EB2amT9kfzXyfo
 bRbCY6N8NGHgYOP40rFJHnJ7cPN5ulIBmhz3Q6Xk5tq9TeBbF/VH+XRJaTa3FBDsNJVC
 bBQg==
X-Gm-Message-State: AOJu0YzKN1Adchb9dNpP5TAPQZsQZya2BaO3raD/xfGZP3JwxJATpWu/
 lVx2Hl7fH9En8UxwAxV6Ddq+R7usCD3DnLgckZLMkpy60MIkCtHWbCHvjqeg308ZU2Hk9TmlUUN
 JQSNYJdYdh6/7RnDkWadZWMwZ0+hat0xHygMlu92r2ghbFXBCjaPpCdYUH5Xdy2J1CdBhUXQ=
X-Gm-Gg: ASbGncuVPO/P5UWHXb0FzR1XgSyunYJwcc1+h2IgYPTqpjUXS0VpP/P+z4DPAhlcOVT
 KN7yL2HVtOfHVOQtw3/3ENHLPEEj/pTS5XAa6B/VQDIEPPYq3prDMbtaow2XBX54kYYsoEju2rp
 zbbpdzXRzx0UcY/mi8qHHAxA4sOB79XSmHIjFFnsAZJQraEZ4DpqcBqF6Kc8oz2hvYpq4o1PNqa
 4lfwFN6ckllT8oDQWYp9eATIQjeGe4/hS5yBrYsvAA1VU4krbfZ5Cwm36WgScD7HAJkvXwWkNXI
 xfiHa/vs0MX3NwGyRjU2tiVXw28y3eRUCFX4j/JV4CclKyXvmPkVMKO36Zthvfg0joORZdwhAkQ
 LWoUykO6CzPyHWL0N0QDmpQ==
X-Received: by 2002:a05:6214:e42:b0:78d:8226:756b with SMTP id
 6a1803df08f44-7fc3ed8a772mr26720286d6.5.1758792115672; 
 Thu, 25 Sep 2025 02:21:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwGMmaaEcZzBvc/SySDy9DSNDQiiY1yU0ffafhsYtzP+HwoCnQGiPWpwjVLzKv+RZ8tvroZQ==
X-Received: by 2002:a05:6214:e42:b0:78d:8226:756b with SMTP id
 6a1803df08f44-7fc3ed8a772mr26719976d6.5.1758792114882; 
 Thu, 25 Sep 2025 02:21:54 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-634a3ae2ff1sm901820a12.26.2025.09.25.02.21.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 02:21:54 -0700 (PDT)
Message-ID: <3d808b73-7c6a-4b24-a3a7-b7fb798e24cf@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:21:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] arm64: dts: qcom: sdm845-oneplus: Document TE gpio
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
 <20250925-s6e3fc2x01-v1-6-9293016768f7@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925-s6e3fc2x01-v1-6-9293016768f7@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1BBkAgl2hGBrSjd86vU44ZlXVgFKSSMr
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d509b4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=OZMW2xe04SQmtW8ssQgA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX0g7E2wMXpIAx
 ic3qLW+ZwNuyjnzSdSyohsmSoIffOsZSR+f+eIS3t8XP3qV6RXY5JoNBAJAGVrn8FHh4uw+oCnL
 BZu0Lwfl6vRyUIrfMJ8dEKkJf9Kk7MfrqC44E8intNt2ey4NqZpDWaj2YdMUZRD3KP0974QiBOq
 ArN1reOT9kS4F8cTlzb8Ou6CfDHwlkI7mrrLR1q5np67wrlQ99vSD0OGAG2LCLMvtiREoZpFgyG
 tEWaSa6twFW16anQBBlTFaMtZoiSAriuVIr7jomr8akEpocSEGhBj7P9lonZ5IngFmnDJYGaM2Z
 zYHCg5MbNVP0DV/0YhkJRoCCOnI9SesCHtpSnnjkvybAe/mm11ZUaSePandVRnbOaJk3c9YLHns
 vLBu8pmy
X-Proofpoint-ORIG-GUID: 1BBkAgl2hGBrSjd86vU44ZlXVgFKSSMr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025
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
> From: David Heidelberg <david@ixit.cz>
> 
> Document panel Tearing Effect (TE) GPIO line.

"document" is a keyword in DT context, perhaps "describe" is what
you're looking for

with that changed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
