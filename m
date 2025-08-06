Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B20CFB1BF66
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 05:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A376110E71F;
	Wed,  6 Aug 2025 03:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mzCGJaoS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA2E10E71F
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 03:47:05 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5761es2i000763
 for <dri-devel@lists.freedesktop.org>; Wed, 6 Aug 2025 03:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=uzO3gUvM2oUa6aLeaVCj3dH+
 MS759piHbjXm21lQVQ8=; b=mzCGJaoSZ6f1FgMO9zeG/iAb9tlRkfedI/WzWEC4
 LcHol/+wg/+ZmGqYtYExKN+kWeXgPNAnDtg7+NSuTtEFo6eTiSJ+82NQ4022vci9
 /ZZPLtUY9J03B1W7pLyDCk/C+3Vlw5NTkBwXkOy9/rnXC6vT2dV2bF5mQk/TBScH
 d9VD6cpp7NxN14fnq39hAg7sBv8X6RvRmxeyiLbuy0h9lsy48MIwCDw2wNrBlksj
 2PAY6PMSpoFvIKhwzv0b23KCPbDqyG7+VekHY/Z8D4CybckxEOcswoxN+sAkRBPn
 r90iR0zqHIBrTP5DYFUetO0iG+Xv9YvdSC0e8s4tgd3LDw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy6saxv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Aug 2025 03:47:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7e8100bef92so236810585a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 20:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754452024; x=1755056824;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uzO3gUvM2oUa6aLeaVCj3dH+MS759piHbjXm21lQVQ8=;
 b=wivfsSvgFQU2kp/eJhX4wiMMxHYnhkyx18LGISGCf2bJOA1dnm87OA/4uYD/+tL6m/
 NJDN7+HotaYLwQLi6hu36VNOFdHmPFnxapvf+0Yv8d4aSeVpPvoABZhhnVLZ/2O5KgTW
 swjAeLPioEHeSdiM0eXsRDevnfUvqxQ4htaWU0y36P0AQNUwJ8mx+UENnYhbesyiz5xe
 un3Jtb86+IGsZ1QvEc8fOpbPa/Dmcs/dp6wRmVOWcrENH9WCJNsDV3biPOWVGe5Pr8mq
 75nQESoWs/gI3tOuMK81ic4Ihot0B3KShsPq4EdAXM/iq58QiLzoyfeB0wPtnG0eIuFd
 Ceaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+yLzD/1vzqchqondW00K3B2B1g5a9EMzvieSd/zh1hSNwEuQN1rKvWNJK+AGGEe1i8SdwrprO3tc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/ZiCDTOGhSqLAG5J2tg/j1jMOQ23DJpNTTBEL5rHHTgTInhXp
 MPt98DjAwz1X9KW6t/ILfezb/00zrKR1SlxrTOZobqDYOP9K2ttBhXAeuyAWXEb3/zvZad0HGgB
 FdSy4GRBoN8E2p2+pf/bwOVz/awwieV0MK7hgqTg3kmq/Aivg8IKb9TZdvysjd0w0BkCL5F0=
X-Gm-Gg: ASbGncvPaQgBgQQUB5wk0Or4sQsZLwPZFjzk2R6SItGoEWzMMy6Lnpy9doYDcpaq0cl
 0oxCJ3bKCdfhF2b2n5AKyoB49xCnM7152ijBWz9S2h6KpiXfNh5Z00umKUAOvsoVi8vcr+NNYAy
 LiNRoFEhdFbB0RjJZuE8NLH91FsHbP9JJHpX1vChwQ8LweBlQFx80Cr+n+WsvpKlK52NydjuCBd
 iEW9eaWkkPjz7hjVeWIXr8YvL+cDwVuCSsRWt3ZoA5/NSsnH2swRRbe3F1podXoODH1ndsTS6sC
 P7GLhqb2GMBKRcBQh6jzUsMOXGBwzozHk/02/3qvA042k1d2NGwDdohV57F6J6hfIBXMGlWcA4c
 c6l5YPowsxBOoL6nenxk/JZ4Kak1NIb/xho2qVFSXZbWgx6Hgzzwc
X-Received: by 2002:a05:620a:aa13:b0:7e3:49b5:d53f with SMTP id
 af79cd13be357-7e814eec6ddmr188019985a.34.1754452023473; 
 Tue, 05 Aug 2025 20:47:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETZoK/bA2Y9Krb11P0NcogumIV9weE+6Fu9JMkAUX39k+KYb80V4r912KnrkZIKfzAnXHpaw==
X-Received: by 2002:a05:620a:aa13:b0:7e3:49b5:d53f with SMTP id
 af79cd13be357-7e814eec6ddmr188017985a.34.1754452022876; 
 Tue, 05 Aug 2025 20:47:02 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88db2214sm2114064e87.177.2025.08.05.20.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 20:47:00 -0700 (PDT)
Date: Wed, 6 Aug 2025 06:46:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
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
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
Message-ID: <b24ln55wgmjzksugbowgilxqbnp6d6mgq4cdqljrj4jftuefa5@gjcszc3t4bqg>
References: <20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com>
 <20250806-mdssdt_qcs8300-v6-2-dbc17a8b86af@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806-mdssdt_qcs8300-v6-2-dbc17a8b86af@quicinc.com>
X-Proofpoint-ORIG-GUID: tdpn8zZeTTqfILrMfbG_JAKF49mGuM-H
X-Proofpoint-GUID: tdpn8zZeTTqfILrMfbG_JAKF49mGuM-H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXzotRz6YVSLWN
 NfN5w83K/LSi6PGz8kFWn3Rpw2gD3dCGNjCnM2f/3KbVZv7IGn7zoLaWBFJoMNtUp7eKWd8JpWg
 MVoeuxf8IkyFv+U/hRiNjeC1KX3D+L3r3EIYxo+5I7aF+dIYM3hyrO/ZOH1vJVkHOtNUXGBsLsP
 MnW+yJRJ9vvmRerFGnUfSE3oki83egEKCWgzejVqp3Oeol8xafZHAKI/5/17DzYrkUmByHncNdR
 AeTE/fyp3Tlg/E5/zdlALg/B0Jqy6RA/inc2ju37Sprox2FE23V/wuzv0MDG7GPoOhs2zIRrL4B
 vEEzXY1FNnG++oCEuQyT43xsnYQ16IcEnfgE1RfbwcCEUBznfKq4BIxyQRrPKarwmZ9/6dERFfT
 C5tVCL26
X-Authority-Analysis: v=2.4 cv=LNVmQIW9 c=1 sm=1 tr=0 ts=6892d039 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=q-PZGS4JpPPfnBF8F2QA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060009
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

On Wed, Aug 06, 2025 at 11:16:46AM +0800, Yongxing Mou wrote:
> Add compatible string for the DisplayPort controller found on the
> Qualcomm QCS8300 SoC.


Typical comment: you've missed the explanation, why it can not use
fallback.

> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 2893f097df826a5f941fbb754fb4a96a1e410a70..f5930f29c91ec95e9182c7b8ee83c0549c6657cc 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -18,6 +18,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - qcom,qcs8300-dp
>            - qcom,sa8775p-dp
>            - qcom,sc7180-dp
>            - qcom,sc7280-dp
> @@ -186,6 +187,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,qcs8300-dp
>                - qcom,sa8775p-dp
>                - qcom,sc7280-dp
>                - qcom,sc8180x-dp
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
