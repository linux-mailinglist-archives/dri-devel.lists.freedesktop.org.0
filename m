Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6F2A44171
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 14:56:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9C710E6A7;
	Tue, 25 Feb 2025 13:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="B2eNZhub";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D7E10E6A5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 13:56:00 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P7hKxP012817
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 13:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vBY5RYMViCND9aWHIb0vvyXsjgb0Fn3HBfOa7+4/rtg=; b=B2eNZhubz34/eSks
 cckq449GJPS7tEuL/u7iRFFjz99viuZvVhiJw5nduwcLqacLfu0CgkDWkNMIdyX/
 CAkiCkTazrlj2uaANecC9fYEZSY4EyxSU3wuHtIdY0Lmq9fzgDweoVgEecaQOntK
 fnQufaDLyXnw8Ga9uNN5TN1U+6lvq5GW8xBz4tXQqD9cn0kQdLcgBa+902ox41qc
 noqaKq4rZGlhKZ9fpQUoX0qvjeIwnvTHlVl7Ud0JphY/OlcOHoNGHwYFIY1XyiFO
 CpHb9c3g/9Wta/VRqy2RpQwvWhBw+B4sxhMN2QZHfz/lvnxHo2nbBVOu1i13U/qC
 6MPr5g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y65y11nq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 13:55:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c0a42024ffso91586285a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 05:55:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740491759; x=1741096559;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vBY5RYMViCND9aWHIb0vvyXsjgb0Fn3HBfOa7+4/rtg=;
 b=RAolnIImFrDRA64eHaxhpjrRLuwDb7XeGGHMXDAP5eryPJg5bcL6oeWAYUyPkHe+7S
 12f9mWJHgRX1v+uSAJ3jSwDXVmg/rloBCCD9ACz49HuvsX5lfHN23voawXY42o04V+sc
 995LMmTUuvpZgJ/quG1XCeaEtW/psJqrDkovSHDMz3NyfTo1bcqSUfb7RBnam+Zx4Ie5
 jHGowz8Yqzbv5e8UCrL6aBO69r14HvXxxDcq1+pfwbqFucrHBd3WNlAGhuDsyO6pA7mQ
 b2XSljVKwfspATff3Hg/8IfYya5QFGwHCcFZmPftX+GebZ7k3bxtjOqStS3TSFK/7ZUd
 2aTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFYZeU4eKSJ0T1km3ZvS+gLGpxO1Csbok5ks4EyNAHDWw7nFOeQcsDf5L5JYjdXaVXxRNU/wKUsP4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznMP7NmeePwbqbMrrGYMAlci0tUW7lghplEqgwH/eGmBVs07kJ
 ZO53abAUkNuJWSFNemGlum19Q/hKVr64WtpNiFSyavKLUbrrYcP4y27EtGfxbx25Auzi3QLwSY6
 OmGjQkWP7eId2dhHaIQEYuORrU4JwzPmn0KOpcCAC0RunTqWhlrlhezFIGCk/slOrqBU=
X-Gm-Gg: ASbGnctMCRUCg/cnx3y1GQ9F7YXDw5JloF57/1SA1/uLfq7S8yKg64B9Jjlx1oikWpN
 YyuA3NwVJv0nJ1VwMXmnPzvmiYICdbRYp7sMk6zHcN9CIu+CCkJmt3Opi6Otol+6yn7/3YQiznX
 sDaUbx5h9lkHBZxMIWMdTwRPWiP8TbAP1zd36/Wa8wR0ZCBnvy3ePoCBHr54BGjXkXNJypvq9T/
 7NV4fjJ8caBU2eU23xDtx+gRJzA9FW5aPOWDRAdUDTiy2Et8aIVCt03oyP7QTHoNqYEn64CcHYf
 DLWy2l0HywGNTqJepqOhH8PaVnqkEUuNz7OXE8iIxp0VjeGfPuVFp8EsOayaWSt06AL+xw==
X-Received: by 2002:a05:620a:2444:b0:7c0:a1b0:1ef3 with SMTP id
 af79cd13be357-7c0ceee99a3mr916339385a.3.1740491758838; 
 Tue, 25 Feb 2025 05:55:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/PjnVD66AJHeVDtIRjlMA2STxMYD46o5L45WU8s5YvllCmc0/7XQePe7pEpigxyn6R/Byng==
X-Received: by 2002:a05:620a:2444:b0:7c0:a1b0:1ef3 with SMTP id
 af79cd13be357-7c0ceee99a3mr916337085a.3.1740491758404; 
 Tue, 25 Feb 2025 05:55:58 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e460ff863esm1239615a12.62.2025.02.25.05.55.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 05:55:57 -0800 (PST)
Message-ID: <b5ccdc2d-5f3b-4a61-8e14-697468dbd62a@oss.qualcomm.com>
Date: Tue, 25 Feb 2025 14:55:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] drm/msm/mdp4: register the LVDS PLL as a clock
 provider
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
 <20250220-fd-mdp4-lvds-v2-3-15afe5578a31@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250220-fd-mdp4-lvds-v2-3-15afe5578a31@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aWSBYE6LWQw7NinG7YHMIlrSe-bn-JAj
X-Proofpoint-ORIG-GUID: aWSBYE6LWQw7NinG7YHMIlrSe-bn-JAj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 mlxlogscore=836 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250095
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

On 20.02.2025 12:14 PM, Dmitry Baryshkov wrote:
> The LVDS/LCDC controller uses pixel clock coming from the multimedia
> controller (mmcc) rather than using the PLL directly. Stop using LVDS
> PLL directly and register it as a clock provider. Use lcdc_clk as a
> pixel clock for the LCDC.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
