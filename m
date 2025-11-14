Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BDCC5D8F5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 15:26:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CFFF10EA85;
	Fri, 14 Nov 2025 14:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="onGjc7qK";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OQhKEQca";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C11910EA84
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:36 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AE8RvZq1427916
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 l9no/0GxZu07rSqXKlYIfPnkQay7eVZlKqtoBFEi2pc=; b=onGjc7qK7k480p0+
 9xm/ydktUD61A5FPyRVnxcyvkkUEmSezTIcdhaqTu1ES2CI77dsomBXbBPqNRR4z
 x/9Eoy2WPml6sskYOZhjw3q3k4xY+c3/+LLNY3YmkHj/6nZg6Ws8B/Yil6MMk7Jj
 Y0Ad1c0M8K2ixfIJMcv8TyQWpvzMKkoPOZWEw8lGz+oNXoHXZi20lDnJWq2HLlzp
 sPniywPeDgRsLlQB4GMn0u2G5wnh8dueM5BhOgRJd8WIInrexXLUG99zASdOiB3+
 Kjvqlfp7XaWmlmZpMe5rg/XiYavJxbJKjJW2OJ1/eVsy3HVsrY9F8tTOKwafco8F
 gOpqJA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g2dhd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4edb34dd9c9so54659951cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 06:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763130394; x=1763735194;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l9no/0GxZu07rSqXKlYIfPnkQay7eVZlKqtoBFEi2pc=;
 b=OQhKEQcaUn92WeSxLfK67GbX1az4kUwA4aZnTn/JYa6OnolPVok0QRA9GCaPIqAqhl
 oGw2toimOz3pc0Ne3FT2qnak4QQzKWqtIeODAzT12oUbhOcqe/I8WnNSTPy35tOdZjS8
 XjnzVjpmz+P9+BiYlO/c4m+AjxrBaQNOwIsU4qEsukqCZDAQmQ65BsIISlnbinfphuWY
 K7XwB9Z+xmm6cEFpePb6T5ivkASjRNUo6N4v67h11oq4Vm/MdBpTQMDSdHbWAYJIJJ18
 QvZW5FDeB4owWE85CuSaZBFs2c4ke/koCM7uCna+a3X3muO23zvBmOrY5iGEY7bRRT0r
 2zAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763130394; x=1763735194;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=l9no/0GxZu07rSqXKlYIfPnkQay7eVZlKqtoBFEi2pc=;
 b=VxM6shQ6oaiKo5iXcYpIPCz3NoHo20aZN3PX6CrJmWwKCggRlKSHntkyVTaaAoWDcJ
 PxJA3pvRP9Q6LRqM3seaeUFvSBm+xIDKNNoIyHpF4+ek/ggXLqsoj5qFZPwd41YAg+Kh
 nuP825zPrN/b2IHix/QgOZQyAIz2eJtH+Hh+JC46t8/aV5On/sRT1UGXS3pZzsvBWtzZ
 4AYSQYhNQZFG18an2lErDraaVctBzcRH4Z7s7D2xLOblsMJPH+zsjAKJ+YsBUeGturZ2
 TUPDf/NrrXSbw/2Szc2YZx3Ag74WT1qMX9+gGcbvmRFZGu+M1T3VaPzBs0Xn656CwLHF
 tBKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUygTcFe9oFSPwGmtx1oVRED+X7xEeZ/Bma1WzNe4ljXSbNfLHu3jARtcg64+vKql5JZ7ZdTsmCQEw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzruNv8ss1Q13hKhljpBL/Lqkd3WB/bfAR81sO+hDCzwlpbAFKI
 Blt7YoozBsDpql1tRKBDuC+zoRdwswZb93PnmdoKZdC9y+1JGJVLJp7d7rCpWYUlE7xUkm+8PSX
 kcARXD42BYXZrdtggJqBqPUxmwJUw3euB6l2cKlMG9Rl3dlaAI+lj9FI+IBBWrFowH+h030w=
X-Gm-Gg: ASbGncuULO2ckD5Dyo30UEhqjLbswAaUtTBcIe2W1ghj3XUSmcM8Rm9Cll85s03OGG4
 LaSv2lx/01Yo0bmbLwIbmv2mCwCSkCGg6tlHCWHdlDeZd1AWAEe4cChjnpsowHsDBAwIHiCuUtr
 qXgHyzFOf8+DqctvMHLx0ID9fRBFqX0rdWndgGzcJHrdl0UPlKkyRaA2NAhEEWn+2qHNhSWGd7J
 Wq9BLiMPnxQEibnMWhQRbPnRVqUwAMDsFVtynLafW2D8Hjn7TaxpwQ3vYVPXpdEu1HCLbX2T0pj
 lZFJ1CiYf+4s9yAoMZj2Po2vb+d9FKqaB8Kq0GXLLoWenn32hk+7gDaQa6M5M4XHisPi1xd6egf
 fvs2XdnrJVexix1rzxNC2d5N+X4eqCq2L46Caaif45K7kL8Y2vF208DVzbKA4q+FNnywMktxEIt
 aSacgKpc93sfU6
X-Received: by 2002:ac8:5809:0:b0:4ed:1948:a8a2 with SMTP id
 d75a77b69052e-4edf212af38mr48477281cf.40.1763130394380; 
 Fri, 14 Nov 2025 06:26:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHscNoHLm1MuydPFCmacZaAgfo0Tvh6OgbQ4/hlbC4OeYTE54MJSZKbngEqsl8733UCg4WVw==
X-Received: by 2002:ac8:5809:0:b0:4ed:1948:a8a2 with SMTP id
 d75a77b69052e-4edf212af38mr48476551cf.40.1763130393831; 
 Fri, 14 Nov 2025 06:26:33 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37b9cee0cabsm10318821fa.40.2025.11.14.06.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 06:26:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 0/7] drm/msm: Add display support for Glymur platform
Date: Fri, 14 Nov 2025 16:26:27 +0200
Message-ID: <176312947284.1737000.2080843930887893997.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027-glymur-display-v3-0-aa13055818ac@linaro.org>
References: <20251027-glymur-display-v3-0-aa13055818ac@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=L+AQguT8 c=1 sm=1 tr=0 ts=69173c1b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=c_IYe_yHoYF0OweyKxMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDExNiBTYWx0ZWRfXxvMfl3i6m2aY
 7Xrmo1saiDj/waxsIMmEvM9PzbKf9wPDnj7DY1tg5k08nba9zSF5zln81SJ8EJ4VYd3/oNRcoWJ
 RhAkW46kZzg7TwZdPbrnFzG0yGhAp/j5vQmt2EVAfLUcZLKqFW/6w9MvAN1FHZ/lzSB3mANVYhf
 /omthxpydmzgmOTw1r6K3Eihsf14gJvChhdRHrSd3wuaNHHk9FwTo5AUG7Az0oMZdwI+5qFiMF0
 nr0AUBjrdwACtVOaiBGNp69+D+XgJQo3xHIOjJ0iBM3pPmHc0G5hT/FfYmPxuwJbiYezRRV9UUb
 yh9zpNwLK6cRL6bd35CwkKEXbypeYpL/qmkwLQ18dDcijtuKjxnCIRzMAdPRxj6+fPIGEgyQf1M
 ADQgfTXt8gDtijWmIK4An8Tyuum9Mw==
X-Proofpoint-ORIG-GUID: 5c4UCg2F94EUgmeDcKtNCc85kShU01al
X-Proofpoint-GUID: 5c4UCg2F94EUgmeDcKtNCc85kShU01al
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140116
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

On Mon, 27 Oct 2025 16:59:17 +0200, Abel Vesa wrote:
> The Glymur MDSS is based on the one found in SM8750, with 2 minor number
> version bump.
> 
> 

Applied to msm-next, thanks!

[1/7] dt-bindings: display: msm: Document the Glymur Mobile Display SubSystem
      https://gitlab.freedesktop.org/lumag/msm/-/commit/29deccdb0927
[2/7] dt-bindings: display: msm: Document the Glymur Display Processing Unit
      https://gitlab.freedesktop.org/lumag/msm/-/commit/306305f38cd5
[3/7] dt-bindings: display: msm: Document the Glymur DiplayPort controller
      https://gitlab.freedesktop.org/lumag/msm/-/commit/144a3862f626
[4/7] drm/msm/mdss: Add Glymur device configuration
      https://gitlab.freedesktop.org/lumag/msm/-/commit/401388017c14
[5/7] drm/msm/dpu: Add support for Glymur
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d15c65a4645c
[6/7] drm/msm/dp: Add support for Glymur
      https://gitlab.freedesktop.org/lumag/msm/-/commit/eaedeef2b9aa
[7/7] soc: qcom: ubwc: Add configuration Glymur platform
      (no commit info)

Best regards,
-- 
With best wishes
Dmitry


