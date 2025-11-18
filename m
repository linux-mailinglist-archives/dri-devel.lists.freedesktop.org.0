Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C23B5C69515
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 13:16:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6376010E491;
	Tue, 18 Nov 2025 12:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dy3q72Rk";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YkSb3vgY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9C810E491
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:16:04 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AICAo542802295
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:16:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 54AlXktT9apxczmnoBTDmz8mEG7d5mGc9KLiJxsdO+g=; b=dy3q72Rk9f3oYRbr
 zNi3J61/WYUKzpHetZyKDQTWBG/fHB3Kzqpo48ZXTHNbpKaIu6XDg4hESvAZJz9h
 /xjRFqzI6CpzTkcGgf6UT0sg96emUiP2Z0IqQw3UdFtXigz1Nk71p0Ioz62Xa0+l
 Fdj4R9ckr/GmEf9lxI+jmsE0J3Si7+ZwsJc+YxykQWdsvpXQRmGbUjeurgEb2euS
 +wzmI/o9bIHmluzJoGs4LUpSn60fZHIFJe5Y39nghMenEsdVwgAczC5BZYVgWiLy
 Hw3d5YOFnAt2kijNAlyb6JNRXb7z43TuYvTBc9fXO26eKIc04S84sKoYvtNdL7VV
 +IyjVQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agrk200dh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:16:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ed83a05863so20914011cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 04:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763468163; x=1764072963;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=54AlXktT9apxczmnoBTDmz8mEG7d5mGc9KLiJxsdO+g=;
 b=YkSb3vgYco/NgB/I6hSxEOcvJtXrkrWitM8mec0UWGxNC7ai7q3Z6WDH6D4zCO59MY
 MGBHlkzZCK8YXBpnPH4ZeYlw5EkRWj6n6Vz3ms6h/S8WgluU5Py9wKCImOVLebS1j8+4
 loc2juwMNhkqNF6wo5FjADfIr0n4gYW7Kn7B0+Tg3dGkxWfb5rjpE9g5L3ioH+2HaDvT
 4Fdpo0pUDtDtM0blt8XxLBC4jC5/9BKPqYG49rqQRkxxLUJgr0cLhnn9hr5VImRO6jw/
 ElUR+Tx0nuObJmzLf9QhWLSOFO1v960sqysj9GkKicMWXbrFN1897n+GPOi1cO0lQtpb
 LPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763468163; x=1764072963;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=54AlXktT9apxczmnoBTDmz8mEG7d5mGc9KLiJxsdO+g=;
 b=RhMv3BfTUwYJ2GBhuHwyPDKjHJMyPxbzTUZ2xD7HT6kBkTy179ZlMBQksSLTfs3Q3g
 yYm1rF2GO99CwtLwKct/PPG0haAmV3hHosgE0fRFbtKDzYzwI5HX66tG9dkzPSJ0Tei7
 +001G7v6dM/CYGu8/RHnJuG4j4thtaXqIeSj5PraiFEGMUQRozVuzarnQJwTj71Has5Z
 X73yc3o1b7Tj8hKgJJf71PpMnHC6yBBqTcUZBKKnEes5ZBf+Uk3G6FgP7VOZWaxQKNJ/
 xA5rG4IPppfoMEQzRuqBcMNfzqCYb9lknEAy7d589Ec5OHxckganeytbigio/JLKsLF4
 Dk3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWi+JPH1Ovxzn9QvqPUbpAINTfePDEdabRwRXl24l+OoiYv8UZ+m59jeCY0rCPMJDwa9w9bOwhiOdI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzl/Gr13B+z1z10opQO5Syq/FOWszDj/IXUVNKAuABC//X+OHVa
 cEj0LbcJoVqKVN9q2tzK62NKB2l8pS1VYxfYVh/+M8Sts2/Dm70Qb2RuZcuHT4o8FZGUU/dq9yz
 LyBKKUxZeq18Xzkj5CI0Zkdy/n/YpWMnUrATq9ZYrAareL6wSEOkax4vKpM05p+D8M4i3/yg=
X-Gm-Gg: ASbGncvp+zTM/jgaMkSK3rx0F0QsxI2HGR4M/TjqtbpMjVvWuUxfSWSZ+3ECaRzu6ik
 lZ1yqcVZGBJEvD3RPQdPlUpuE3++gGnph/lETg1z9rl6Fct9zYZ1SA03BQ/DxhXFcro3k3b1T0E
 FOXv6+lwt1BVNNtgXTFxWRy7uscHIle4iOZZrzN7Qd7vqnmONYhHr6+HyAsI3tMJ3F0AUYO14d6
 F85r5ogongXIP+IiYR36+B9CbR+Pfvjm9XW3tNQbvEyqCFs0A2TSacGIrO0lEnPubJSR8pzqMi6
 EAIDlE0jtRecKZbt2vdUfAMCKrBhBnceKDIsX7nZVYJ1eBsSwGLsBHPleXBKF/e5jl40Q/sdXGM
 y9LpHt094ifSz2dk3sYx3izKRWTiiRi9WEborKRE1UEIXnZc+u3zMHYSFJd2/J6YlgOs=
X-Received: by 2002:a05:622a:24a:b0:4e8:a001:226d with SMTP id
 d75a77b69052e-4ee317b3acemr23702271cf.7.1763468163306; 
 Tue, 18 Nov 2025 04:16:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6pID+a9PTJziO6Al+fjeQboZCd5oeZ2xL2RTvSo+ugWKwkruWzV8d/WajOx6TuvAeTk05dw==
X-Received: by 2002:a05:622a:24a:b0:4e8:a001:226d with SMTP id
 d75a77b69052e-4ee317b3acemr23701731cf.7.1763468162759; 
 Tue, 18 Nov 2025 04:16:02 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fad44b4sm1355453766b.28.2025.11.18.04.16.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 04:16:02 -0800 (PST)
Message-ID: <74b5d4f4-ed36-4691-a82d-37e76c52974b@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 13:15:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/22] drm/msm/a6xx: Skip dumping SCRATCH registers
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Rob Clark <rob.clark@oss.qualcomm.com>
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
 <20251118-kaana-gpu-support-v4-4-86eeb8e93fb6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-4-86eeb8e93fb6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a6Q9NESF c=1 sm=1 tr=0 ts=691c6384 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=oEwtcOY8yq9sNqF-amQA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 6mntRUfRdPqt8ZJ8PSIaI5pwscZMWjAX
X-Proofpoint-ORIG-GUID: 6mntRUfRdPqt8ZJ8PSIaI5pwscZMWjAX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA5OCBTYWx0ZWRfXyLmk7ujIyh1o
 pYIIeXGHBRz0cq/v+s9JA6dFzTyMiiCS3pvTfYL7Xamsjds89AzlewquwLo9vhZVrfUKhFLWL+W
 ekNGCd2onmHN+yQMhQPcrHOc4qT9G0oUFawzIVBFJEQwsO3XDc3rzogUESzjGvPJKoSj/PNC0Q9
 n4S9WW+Ign/UPCIMQnGkAqksiZKl3DmD2hdKcQ3wp21/WQHrNHLlZAZ2JBLB+ihoAxhGs0mYwMa
 KB1bJnjtSp4hUStgY91BGzw9ymB7Du/+crr/dnjyKMbl2tIMFSogxw8UFaMhKZzChRozVKk36ex
 KFYwWWs0zZLTaX/RG5QddY7cMuKDzHORwSjztwUM1I5aO7G9lpNohX1I6yvSA0yLNqt5RCFup+m
 Fguk2YUdIijQCHmKAIU3R3hQui9GNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180098
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

On 11/18/25 9:50 AM, Akhil P Oommen wrote:
> Crashdec doesn't require SCRATCH registers anymore for a6xx and newer
> architectures. So skip dumping them during recovery.
> 
> Suggested-by: Rob Clark <rob.clark@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
