Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF7AB09ED0
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 11:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D7B910E166;
	Fri, 18 Jul 2025 09:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gl8Endv7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7310210E149
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:13:18 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I7dFFp022405
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:13:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=XqdkQsTPxt7V80AMIAUMJZ7h
 FhUw+ACosjR1rjJFwmE=; b=Gl8Endv7QmU/nfL9/gxigtJswfLUlhZ4Iwh1dDO4
 paXBCU3B+06ttzNQeNYGckeAILV8ZKJC+9GWp8rHC6QdkhjlPbMpnFF87Ydn0rSp
 uBpodt3sDBgUZKGKjNTcbiEOP3nTDsHhTXzu++A4CRWS8ln73SWDPyLLjmAWZ2uq
 cgOa9shKAdCX+Wu18jJVwSSwybBMlZEMjYpKLP0O8SwW3H6bzbh3/HMjUzehhnsd
 jB/d6ij1WIgOMtMZgBBLmrjzYkBKEuU5Rr19ICBuudipoE2EGiMG6aT7iJyPvu9h
 DxOZLJvrLLeP17Dagpufn9vJSA+cn6sDMk3Qg9ZHkNSR+A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsyavy0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:13:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5cd0f8961so339099185a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 02:13:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752829996; x=1753434796;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XqdkQsTPxt7V80AMIAUMJZ7hFhUw+ACosjR1rjJFwmE=;
 b=iip9HFfQEdnvPadDX31LjlKV1CLhAJqBZbGqwX27F3MRyRxw72lKo8ygT/J1lY+Rva
 NL+IvHHp1KszUD1JXF3JMzQkY6StzpP/OFrBhiTG/30hVJDmN1OsqZLlzcuh5yWUHQr4
 PMHOkFEKPO+3lyVaIeXUqDzOOvnNq+OFjxOJhCGwPvVgLdJAlWxZ+wmTuEpyYX7iigDd
 92ZScK9yjBnTghSR0kMiwnbgngHP374Zn6MEcdZ6VsGw8JU61UhI9ebt3B1zE4WYAFNQ
 10kbny6VCDlW3GF4MTQMJe+SgOFnWfDaBDFurQKrmP7HSBae+Q8pGJ6EI3VDx1es0TwX
 YH4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv8SP0MCeNYaeCMOfUQ1edtQweFE7ADacEAanBgCGpoXR4jg1+xBlb3QHvrdhL2OVaMcjTbZfCS9s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsbfRozznNTWp7pi3hnVoWzRUzk1ruOr1Q/yY3FV/1UcH83YvK
 IVZIjWpgrbjOllYLGPXujoXk/y1llZUxht3bLaHQMLp5fRYlVhZD5cntkne+kLcG6SS0zCQpQb7
 hFKG3M7GwIzUT5mDbhxs5cVyay2d3DaJIU0Nla28UL8dUybuDcgVYAN35hNSDrFR44bbFxQM=
X-Gm-Gg: ASbGncvF2tJZ/5Sc0eVxVjl1kXojRVidEOgY97Pw1WN35Oz60WnDqfv2eLNKJ+YD45K
 bRJJoQybN2FCyU84jQ/qN7qCBqmi6Cg8LjhQeYnsTHAN8GilkYLcwjIXdIHPf00BJcKDQcy29WB
 7CsBwTzkbjCA4js55nooTkYTewO5UP4jgStsGG5W924BTNaNCeEfXuBR3oQxziCyI/PIoA0r4u0
 4CQZ1lCQ7IPxNj4NgiD+A4KVd+cnv3JVyLfhcqOt3yIcYTp3V30AWnE2KymtgFIWeCFsxhbjlId
 Y6KOZOe4jVZVrI0nnJ8+AytJAdCRudpw/Hz6xr4XEFIWC9N+ybfv/kPSjrdFBY+2dClzDGv4tNG
 oHueZSEH5cQWGEyoU7Fl9THHWBATZXfDa0Dy73XWxcQ9eHOqTdN++
X-Received: by 2002:a05:620a:63c7:b0:7e3:2cad:a101 with SMTP id
 af79cd13be357-7e34356ca74mr1333185785a.16.1752829996376; 
 Fri, 18 Jul 2025 02:13:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbU9LSFJQqHNFp5kpMH5LhaMG5b/m+Rc+Sp3X+lOp4tCy8yEj/Le//csSQhKYGhEm/cuwKrQ==
X-Received: by 2002:a05:620a:63c7:b0:7e3:2cad:a101 with SMTP id
 af79cd13be357-7e34356ca74mr1333182585a.16.1752829995802; 
 Fri, 18 Jul 2025 02:13:15 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-330a9104896sm1502151fa.36.2025.07.18.02.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 02:13:14 -0700 (PDT)
Date: Fri, 18 Jul 2025 12:13:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Danila Tikhonov <danila@jiaxyga.com>, cros-qcom-dts-watchers@chromium.org,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: Fixup x1e80100 to add DP MST support
Message-ID: <unwinuwoft6sfczcjlqq5kijss3ttggfbobs6ydw5c2lkmndc6@7c23jntiprob>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250717-dp_mst_bindings-v3-1-72ce08285703@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717-dp_mst_bindings-v3-1-72ce08285703@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA3MiBTYWx0ZWRfX4uTB78bnOHg8
 s+YCZQYI6bUSpjr/EjGtrxPMHjvtpVF+cwSXuAvjCXEIGtfYtej4U4O22tptEF4ck9xTTPyR2Nb
 AagbBOhHRyYiDw+edhTS9xN7l0JsPF7dvHUB6/YZT/h+vZas1/th9LW63WrnHbwHRh564ASbcEj
 XN4MxK0w+60Hqla0aet9pQjnlztXB0YTsWFdNmKaT+TkU3NG4osmSgwgMWmNDWJjcJKTtth/GDT
 waUjNUWpWclkIUcirEFYltxjsdCdSFoh8WtyeLBHfZBZTjfufkuULwccpoUZKurRA7PePufVcRR
 j1kbUaO3TYlwU8TfLJ4EqOTpcFTa+NtlbVGYaT0wmlTC6qspQSZYHOVcn+RdJXdnYq3Gdy+mdv7
 YLEd+0YSx+6QIR4mQlgFILzvsM3AJn+EiTgHGAhdiYpk5zHyZDTwX6AuI9Lq7sf/2Wiqi8Uk
X-Proofpoint-GUID: ASNw_4bzACnoGSeNztggqBvCXG4juA_S
X-Proofpoint-ORIG-GUID: ASNw_4bzACnoGSeNztggqBvCXG4juA_S
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=687a102d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=GX5c02JtZ_BarTZei1QA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=884 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180072
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

On Thu, Jul 17, 2025 at 04:28:43PM -0700, Jessica Zhang wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Please fix the patch subject.

> 
> Add x1e80100 to the dp-controller bindings, fix the
> displayport-controller reg bindings, and drop
> assigned-clock-parents/assigned-clocks

Why?

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Reviewed-by: "Rob Herring (Arm)" <robh@kernel.org>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/dp-controller.yaml    |  2 ++
>  .../bindings/display/msm/qcom,x1e80100-mdss.yaml          | 15 +++++----------

Split into two commits.

>  2 files changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 9923b065323b..4676aa8db2f4 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -29,6 +29,8 @@ properties:
>            - qcom,sdm845-dp
>            - qcom,sm8350-dp
>            - qcom,sm8650-dp
> +          - qcom,x1e80100-dp
> +
>        - items:
>            - enum:
>                - qcom,sar2130p-dp
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
> index 3b01a0e47333..0e699de684c8 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
> @@ -170,11 +170,11 @@ examples:
>  
>          displayport-controller@ae90000 {
>              compatible = "qcom,x1e80100-dp";
> -            reg = <0 0xae90000 0 0x200>,
> -                  <0 0xae90200 0 0x200>,
> -                  <0 0xae90400 0 0x600>,
> -                  <0 0xae91000 0 0x400>,
> -                  <0 0xae91400 0 0x400>;
> +            reg = <0xae90000 0x200>,
> +                  <0xae90200 0x200>,
> +                  <0xae90400 0x600>,
> +                  <0xae91000 0x400>,
> +                  <0xae91400 0x400>;
>  
>              interrupt-parent = <&mdss>;
>              interrupts = <12>;
> @@ -189,11 +189,6 @@ examples:
>                      "ctrl_link_iface",
>                      "stream_pixel";
>  
> -            assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
> -                  <&dispcc_mdss_dptx0_pixel0_clk_src>;
> -            assigned-clock-parents = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> -                  <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
> -
>              operating-points-v2 = <&mdss_dp0_opp_table>;
>  
>              power-domains = <&rpmhpd RPMHPD_MMCX>;
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry
