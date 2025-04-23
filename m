Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 921B0A98BF0
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 15:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3B810E041;
	Wed, 23 Apr 2025 13:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DeLymmwS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063B110E041
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 13:54:19 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAEKVJ016080
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 13:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cJX2fb/ffnpa/u3aYJ64X7d+kE1K0IKu9sD+lgBHlKg=; b=DeLymmwSMCbIy49E
 r5QVfafjNeO5exfLzXBvDczdCEQWbWvZ11WkESac/Rq0arZQLUSoJaELhn20+YIZ
 sC+UQfw+/VMJJgLlZanr2oEEhZqyDuTtnboBdB5iMjHldgpGT8ppytlhB/+pckxS
 5BGXW+ki9ikYF7VAuGSy94VON6HvUbcVQaS6BYicOMI+nz+/dPaqOIMt1DD66Uco
 /tJxpKHQvUikXqBi/4DOWR1wK5XlafuCwOIGZ0hRKMymFHxOmTLTnTlK3OsUYoxS
 0ckxiVqN9S7gSTClq+tP/+yjl/eoLxsYVYANw5DfUqrXoT7lVDMSr+/+5VG4KM1d
 7zRTeg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0ab6m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 13:54:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c552802e9fso122989285a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 06:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745416453; x=1746021253;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cJX2fb/ffnpa/u3aYJ64X7d+kE1K0IKu9sD+lgBHlKg=;
 b=vqdXNpx1i8UPZ7oFZMq0ugfgp7v6tEk7utcRnnd7/GXd5neWdUpxgrteTlZQ1epmtE
 P+GPiajiGbK8pMHUGcLakixASVE6AHuyKFH3MSg1XO9GiK6UZ+hcbWx3/j3Eh0YLrRqp
 FS8zvW0GEsfRFHQkEbHv/AVBoiR836mwBbT/1glkgwdneAZTrun8OQaJxCWPCVEUnE0x
 rRdcz+UprR//KKK9GoGi6NpM0kJm7NeYT0ffybA9jK2Yx/nE3iC3A6IomRUIb2Hiw74u
 IAVYbOi6It3TSgXsQ2K7gNttgZOBbZEq44XTOrBC8DpZTb19gkYjWPjkPI39ZTuGrNg4
 uLtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQPHvE6N22iZcuXV5HvzLjVoVYyOxnP9tsP4EifSftKAq8DAQs/fXP06S/CRTIy4zIBiO2pZkhJeE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiCVcFvBdowMNSOSgJ3itQYkzOqjWBTVCMKjxRjNU56mBvNY9+
 ECVKFH3m/nmR/ZNtiP1paF8ecd0hbBWHXNxXmbQTXJvP2SgCYR/jtV+Rw7WfDWPHVR4sMTZdgj6
 MXmqYLMYRuX7WPaHXSKeVZL/LPh4Jp7NW3hYJn1udBfCWYdoxEtzW2+rMM+tI07ieDbE=
X-Gm-Gg: ASbGncsosvLVXNtajek0UL0HTbxmH7f/1ZsK1GqaEVICkx5Z8+UO2DGV4e/8zt9aY5z
 3FUw2eZOnZIpm0H456Y4UwvW9TOc29S4tMHew2YtCvid9sk0xmRD1M6zNgGRjH2rtcAXzKB5Bpt
 G9MwEtN6XhDZEqrM0v/CLS1fyx4qCMUb8AaD02UQTabJaEPiArQOA6gpI5I0j0DKvce7ClRwWhH
 Gdx6aiokDHanmO066fh1XB/3ttmFoxTh7dz+5XYELolV1n+E9KoQKPUmpSgp2t/xXJcoVIqfwK3
 8Pe82txeC469S/Vcfo6kobGPqCksb4zG2bNx3es3u8wHDLwydIF5lMTaeuce9CpmUD4=
X-Received: by 2002:a05:620a:17a1:b0:7c5:8f37:5eb8 with SMTP id
 af79cd13be357-7c94d2cdeb6mr185092285a.12.1745416453391; 
 Wed, 23 Apr 2025 06:54:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5GSKl5nOJGI1IDLlBzmI6OWMLujvoHpe4eYG3KxeTMc/rjtv7PPTjZDEBvTI5D7TyWEbafg==
X-Received: by 2002:a05:620a:17a1:b0:7c5:8f37:5eb8 with SMTP id
 af79cd13be357-7c94d2cdeb6mr185087885a.12.1745416452864; 
 Wed, 23 Apr 2025 06:54:12 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acbbab86f15sm299799566b.76.2025.04.23.06.54.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 06:54:12 -0700 (PDT)
Message-ID: <da5f63ad-3206-436f-9b0f-4e966b817fc3@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 15:54:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: Add Xiaomi Redmi 3S
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <lumag@kernel.org>, Adam Skladowski
 <a_skl39@protonmail.com>, Sireesh Kodali <sireeshkodali@protonmail.com>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux@mainlining.org
References: <20250421-msm8937-v5-0-bf9879ef14d9@mainlining.org>
 <20250421-msm8937-v5-5-bf9879ef14d9@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250421-msm8937-v5-5-bf9879ef14d9@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KEmHN9on0kweGKzhqew-w2P37a3DiFtM
X-Proofpoint-ORIG-GUID: KEmHN9on0kweGKzhqew-w2P37a3DiFtM
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=6808f106 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=VJhJOi4SVWMle1XIrLYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=YF3nxe-81eYA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5NyBTYWx0ZWRfXwG9zDcGsofmq
 AvNr6VLic8Wji/e4c5rd0GmpLrk8aspjvMCKkgujDG1p0R5b6jhtUsVGm8i34t1p0voXZabR0aA
 nHKiCFkW6mOLAmK60SRcrv63Ar+8FvRTpa2xvE1BCQFO9diTF2Dg4cIX+82SEOUd9dHqN0PY6RK
 3PUBFNIIIY6+9hBCrHXJFeZK1pu97Do8euI/p6NpsFLIW2UU+VITvqTpoOh41nyzttUwst6Vh2q
 mQkRNl1gttE8FAccjAo9qlQW3sirfI94vgo1pLG2+4YzuygjWl8fGq9Zb6m6if1hUy7vMYnVZr1
 n/5uud2+p1bofeVyZVELAmfol0jYx0aUQcdICLPTKLfjSBOoSR5GrV/7U6rxzlQQnKmIuoYZuBF
 QXMuOA9iwhMD9kVdba6BNSnndlkfqJXcUUx/Yblm5HHTLb8kMer7g33N5tMqjEzlx6nUWAUc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=757 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230097
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

On 4/21/25 10:18 PM, Barnabás Czémán wrote:
> Add initial support for Xiaomi Redmi 3S (land).
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
