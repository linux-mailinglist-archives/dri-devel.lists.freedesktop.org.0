Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87486C0D79F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 13:21:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE46810E460;
	Mon, 27 Oct 2025 12:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mh4W2s9i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D637A10E460
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 12:21:02 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59RAAAbD1502840
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 12:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aP4mxhUOOvb5sFzTA2872hnI8+YOJ+Fa/nda32UGswI=; b=Mh4W2s9iCZTmOG/W
 eiIFJyfeRI84xvhv9CLFGqr7pVww6ukMC+1WntxshoS2QBlBGiyNzZQbab4vU03T
 x2NhEP65/wuehfB0uS64BV2OCCbF+Hp7LTcMjY1KdVxzSDNJkzoKQby8spZ/jNIl
 0Iti/RVC0Af7lX8O450WcUbVPfcXp0OqV9iW4hhffprkXvBlFnmw4nNzinVVT9xf
 AFeisaiUmfGxGbNFKWpgdhJYKxwHABwUXwJ/FAIeXCF3X0DKKJ099YkRBbt10l3C
 LcwEdhew1qtui/XWreVyqvweyydqcBYpFXIzvDDD/zu04WvPLn3k5hY+GrUH5sQl
 Ab9riQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a20pnsepe-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 12:21:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4eced2a52ceso5922471cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 05:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761567661; x=1762172461;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aP4mxhUOOvb5sFzTA2872hnI8+YOJ+Fa/nda32UGswI=;
 b=E3Xkjl9381CVdY90rrRLYsAJoSOjOB1NVh6lfXPYrZ/HXguG5Ms7eDg0o3IzEHxDJs
 AbL8W/yrgzxMw5Z4tzU4o5+6RiZWk70+nigLKkCuM8TxO4ungfV61sgzMIap0YIKGisl
 CID8k0SXPVRdFGzxLvPZKo3AdBGW7bnX8gBaoZykly+GbdMDrtkc5FTiR1KeMj4+Tran
 NmzXRQDEaBsZ+a1+pHjUpCUX5E0hs4S2KvZo0buJvAjPrBbjfYG1ye49ONwctlb6SQ+o
 xmDyBRYnlLiRT+VuKIDxs6YIksy5dsNSLbNP3YB7JWcXcSPg1qwrzJFT0bQRQJxkXpBO
 MEZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnpocsYbveVxyEj26TfEVy2NPh9yi9so7jvA1vet7NaewWAYoDe0iRaw5WH0dMmEMeTxVvaWhu4zs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEPhA7jeqZhWip4KwYwI8VnWmmJxZjvDt09CB78u17qYmx04UP
 roZTUfwDRoGqT3Cm1MIyLxzjZAstV/UOkWQ3rICp1JsacP849HtFTgdsYmkvTMx6RjnolMb+kYB
 PKtuQzQgpm6sZdOGwrhrX6UXepqU4z3A3+H+eXjyYf61XmrHe3KGXV4LcB5dHMp9aKEySbS8=
X-Gm-Gg: ASbGncunGevwjKhG93MOqWx400SbHUZsgHn6p1ymkxzKbSeLb38WxL1VlEIm7f46TFc
 5JtCHqYm4g6lejQJAZ/POnQwSfho+/aeOP1tbNk4w5AmbJHg1QMEii44+b2L/ahlqY9K73yBS8K
 XX21FPkQzYg6F2B/YB4RVAMvPX17mopP3nx0R3u7cZ09Zn3e/w4VcSYFeRXoHlTpma2lEpogZUX
 ERBuBpGvfnQa0UPjsJBMQCW9D94FjnSVMHVsnpdpqxGfDk7joaHH+SizyCn0g9fqoXM7KCmmFIQ
 3cyRSUfnKrdWLqJx1Mg1jZPS+RuBP5hyQyEkfAZKBF5Eujt407k674DdnYHZCFOWUmyHtLdDZD2
 5LHE/NB3g9P3/bzV3F7V+L65kBwLB21wSScgfDvZeMShzxh0YOdta3819
X-Received: by 2002:a05:622a:289:b0:4ec:ed46:ab6d with SMTP id
 d75a77b69052e-4eced46b36dmr54348761cf.9.1761567660975; 
 Mon, 27 Oct 2025 05:21:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/Ymwp4j4U76wtRZGQW8EHbN2uGqMPPJ/w80E3/mCrIAWR0RdpJNVmK9Zxy1Lr+Yj9F1bPnQ==
X-Received: by 2002:a05:622a:289:b0:4ec:ed46:ab6d with SMTP id
 d75a77b69052e-4eced46b36dmr54348351cf.9.1761567660538; 
 Mon, 27 Oct 2025 05:21:00 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d853f9a0fsm746527466b.50.2025.10.27.05.20.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 05:21:00 -0700 (PDT)
Message-ID: <51da0617-db4f-4c6f-9f46-0492e49c9a2f@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 13:20:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e78100-t14s: Add audio playback
 over DisplayPort
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251021111050.28554-3-krzysztof.kozlowski@linaro.org>
 <20251021111050.28554-4-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251021111050.28554-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JKFHJU7wdt-nwok96L6dKfdZg257QjhW
X-Proofpoint-ORIG-GUID: JKFHJU7wdt-nwok96L6dKfdZg257QjhW
X-Authority-Analysis: v=2.4 cv=A+xh/qWG c=1 sm=1 tr=0 ts=68ff63ad cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=PIn3yDVZNjJHwrb619wA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExNCBTYWx0ZWRfX2zUMdDeIC7t/
 wy/A558Whci5f9+JzXTuMp1EBLNzWIqGq8hB1ifdltqPyLNXa2DB3Ik273D1OdolXjEQFBwqQ4l
 PsouYXH3EDd3MT5YSR+1IDKYq/o0GUdupujLStjaCRM9drfHwYubAN/GxaecWTWd9Ta+Cv+nPHS
 EhWY9GcTKJdk6wLFrZezowhuei9Q/rsB9YtqdHgdQaoX1XrMfUkDx7F3NHDv08TylnvKzRr2d7c
 VqY+VXMCRDDL0jOz+/aRa9GkRwcPyAbbYQtxDqFlUd27wkSHS1RgyxZkC8Vv1dkhkUewJg3E9zy
 mkLWNCt0h9d7DNVjcGQKWHTnW61nQweXwspL02aWvhhPwyKM2OxHDqrYxGPB013kxTT1XtXkmGg
 Sl0yL6mxtQfuAfJ0+QhNfFhopjoMyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270114
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

On 10/21/25 1:10 PM, Krzysztof Kozlowski wrote:
> Add necessary DAI links and DAI name prefixes to enable audio playback
> over USB/DisplayPort and HDMI.  The HDMI port is not yet enabled, but it
> should carry respective DAI name prefix regardless.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> ALSA UCM and audioreach topology will follow up as well.
> ---

[...]

>  &mdss_dp0 {
> +	sound-name-prefix = "DisplayPort0";

We should probably push this into SoC dtsi since #sound-dai-cells
is there

Konrad
