Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5B1AC965E
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 22:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5493B10E217;
	Fri, 30 May 2025 20:09:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZPEUiZLX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6CF10E217
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 20:09:12 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UJQZqG008586
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 20:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Lr5s1xj96hvEFSJoflxlO+2R
 6/H8h+Vs7x/BcGRAh5w=; b=ZPEUiZLX0xEsu7cUxMGrgpsmKWPYkQKTrf6Gat7j
 YmbnegfBHv6QaLORxcFpIpyRcT6nZ5MJoycaIyecuZpHrfEoe+VU0QOTmR4wbDBd
 7vQPESwRM2cTMbdrIUUpwjMyorH35adtmZqSrKsWTNLN3Q8pAV3d5JLOsHuN3I2n
 imKgrL7VgGZva380fFwysHidSFwi+UgBVtPuTeHhTUYcKk/BtI0L8GZYTXeA9UKV
 Wf0Q17X/UKHT7S6SM2DkB7Q+IFHA9Bcm4XLBQqeo8ouDHxkm1/KE7jnrTWOVL8ju
 BVXPwK4YDCykilNmxlcI5EUXISLc3kLCJBFLiUw6VX5OfA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992vje9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 20:09:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7caee990722so399500885a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 13:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748635750; x=1749240550;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lr5s1xj96hvEFSJoflxlO+2R6/H8h+Vs7x/BcGRAh5w=;
 b=RbUjBiYOKhPLjq6wbvV4NkFO7giMqN1FRBbqQG4P/bNLpsnFNTFxbJaxRDiPaTQ0YO
 XrL7Lm+4q6RJ3uVfUgeAJfJpQRxAOsPCpG1IlLBiGBupDuUWWjkanQ+vQRfs1UbAG1ce
 oSbG9XV0TAonRKXOwxSCqbx7Xlab1SeibgOzFA330ZOT5eFFrexnlR3hHRBGG3rFhyWT
 Q1XQx7LMJWhtorg1Ao8S1RyQF4wUE1Q9fUSvNL8HtnPMWXn2Uun25LIQaF3Zya3mBh/3
 SD0VvUxIuTljQeaiBes6ETwheVYoQxEhlMN/RvqqHzI+YubFQ6p2QbvgLUQKLVRvFjaA
 2jVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVmGNpQMVsuPXYwBUi95XI94lNbOahWvfR6gUsamByZZ3+0OvblQItHpRVdG4sqLq1vjg71iXWd9E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfQ1872m80ZwUlZOKMjMx8h9nxp9p7Z0IfuikKe2T0KBa1ypIN
 nhzW4yStXae6HKH3z6IRubWYpSUfKhd/wQ6d8AYZcq9/bq5rfhKwf3Y+j62xBNjfv5AYOJSOrdR
 Fd0TEOECZnwXoH7Qgbut31lY5LghFumKLOfysX7gLL+gatjgX8QI4aQ81NeGqs0RK0h+yhtY=
X-Gm-Gg: ASbGncuejj9WfA7IFXjZNL6yuGYAbCRZ20mW2wCdvPrMlAOtUn9WvujhurSTZZLsJ5K
 35mAjUtTBO7i7zBWMRv48gIbwLvrfbXuxLn+zrlNT6kMEK74tv2HV12JhYwPdqymgg+aPkpCP9z
 wrxwxhN++jLA5DG+pwVFj/WL+v3rhg/pHZzOYU8AYOrJfWjD683UF9tc4Acv/9O/f/WYkh3+xZm
 nDXJiALGeAaQNJP3Qlx8vhHvoR8+x0VjvVlL8dDwAH0p4htjrlAsYyqoFABC82fzXwGKwVRMeJn
 zUvJ7+NDWQlf3zJPagk9XYQFilaYr6MfaLlLLzvnmUYqwS2qzJTKiF+CMytluwo9vfVoA2pf4WO
 IMzD7VYLwsQ==
X-Received: by 2002:a05:620a:31a2:b0:7ca:dac1:a2d9 with SMTP id
 af79cd13be357-7d0a4c457cemr505535585a.28.1748635750290; 
 Fri, 30 May 2025 13:09:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxr8DtUZE4WLzMYtnDXmRGwCGjTFx8RDkihvU7FdNCuG8qkr/d30/DYFr7JUuCHRCg7VWeAQ==
X-Received: by 2002:a05:620a:31a2:b0:7ca:dac1:a2d9 with SMTP id
 af79cd13be357-7d0a4c457cemr505529485a.28.1748635749833; 
 Fri, 30 May 2025 13:09:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55337910df8sm812496e87.139.2025.05.30.13.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 13:09:08 -0700 (PDT)
Date: Fri, 30 May 2025 23:09:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
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
 Danila Tikhonov <danila@jiaxyga.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH v2 3/5] dt-bindings: display/msm: drop
 assigned-clock-parents for dp controller
Message-ID: <pxo635637l45rxb5fgnmopq5jbs7lp2hd736mwrqt6jfgvw75g@kmc7rqxu6oyh>
References: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
 <20250530-dp_mst_bindings-v2-3-f925464d32a8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530-dp_mst_bindings-v2-3-f925464d32a8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE4MCBTYWx0ZWRfX48sO2SMd50+b
 5LnlAe9tNefiBpqlpCuUswBVUN9AfwtMIkVV7e3uVQP5f6X/ieVp13fyPrijF8OovOiLmBbxaD9
 uCgVblGtsTgXQa8PABBunh+HeSmQKv42zGKaMC+CnkF5M8vXmAOBLAAcCx9OOesWgjjniRynnoX
 Aii/i1RuhYMFhlYUBnbsupeVFmYde7C9sxjXmTlBjYWE82TKUrKZn9YD9fhn8cKRplP+DA+UIy0
 VKJ8WXKAaFHf4MSwRBEl5IRCgYXxq2ET8ZK3qf/YP8WYGwXgAejtRP3S2rzjAaIbL0hTItGTy0T
 QEI84m1IAhpR5ZtQLOEnEguTI+GaqaWy788x2gJJkNMYvVjNBYQKF1ngs3fZrZfF6Sv7ImYpn1D
 FZZR+BgIbS8N+OuUGhzW0nTrR5hkvfVfzOEolBcoEpHpy0rj8Xf1zcUaRrCnowD/RAZXqZTr
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=683a1067 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=MHIm7bi-knHlpQ7IpJwA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: j6IymRSSGLDgxBfoxlmf7mWYEr0ogfH5
X-Proofpoint-ORIG-GUID: j6IymRSSGLDgxBfoxlmf7mWYEr0ogfH5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_09,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=940 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300180
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

On Fri, May 30, 2025 at 10:47:26AM -0700, Jessica Zhang wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Current documentation of assigned-clock-parents for dp controller does not
> describe its functionality correctly making it harder to extend it for
> adding multiple streams.
> 
> Instead of fixing up the documentation, drop the assigned-clock-parents
> along with the usages in the chipset specific MDSS yaml files.

Don't we need to drop assigned-clocks too? One doesn't really make sense
without another.

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml   | 7 -------
>  .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml         | 1 -
>  .../devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml        | 2 --
>  .../devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml          | 1 -
>  .../devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml          | 2 --
>  .../devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml          | 2 --
>  6 files changed, 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 46a50ca4a986..a63efd8de42c 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -74,11 +74,6 @@ properties:
>        - description: link clock source
>        - description: pixel clock source
>  
> -  assigned-clock-parents:
> -    items:
> -      - description: phy 0 parent
> -      - description: phy 1 parent
> -
>    phys:
>      maxItems: 1
>  
> @@ -208,8 +203,6 @@ examples:
>          assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
>                            <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
>  
> -        assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
> -
>          phys = <&dp_phy>;
>          phy-names = "dp";
>  
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> index 1053b3bc4908..951e446dc828 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> @@ -393,7 +393,6 @@ examples:
>  
>              assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
>                                <&dispcc_mdss_dptx0_pixel0_clk_src>;
> -            assigned-clock-parents = <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>;
>  
>              phys = <&mdss0_dp0_phy>;
>              phy-names = "dp";
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
> index 870144b53cec..a1f5a6bd328e 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
> @@ -216,8 +216,6 @@ examples:
>  
>              assigned-clocks = <&dispcc_disp_cc_mdss_dptx0_link_clk_src>,
>                                <&dispcc_disp_cc_mdss_dptx0_pixel0_clk_src>;
> -            assigned-clock-parents = <&usb_dp_qmpphy_QMP_USB43DP_DP_LINK_CLK>,
> -                                     <&usb_dp_qmpphy_QMP_USB43DP_DP_VCO_DIV_CLK>;
>  
>              phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
>              phy-names = "dp";
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
> index 7a0555b15ddf..f737a8481acb 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
> @@ -269,7 +269,6 @@ examples:
>                            "ctrl_link_iface", "stream_pixel";
>              assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
>                                <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> -            assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
>              phys = <&dp_phy>;
>              phy-names = "dp";
>  
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
> index 2947f27e0585..7842ef274258 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
> @@ -298,7 +298,6 @@ examples:
>                            "stream_pixel";
>              assigned-clocks = <&dispcc DISP_CC_MDSS_EDP_LINK_CLK_SRC>,
>                                <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK_SRC>;
> -            assigned-clock-parents = <&mdss_edp_phy 0>, <&mdss_edp_phy 1>;
>  
>              phys = <&mdss_edp_phy>;
>              phy-names = "dp";
> @@ -389,7 +388,6 @@ examples:
>                            "stream_pixel";
>              assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
>                                <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> -            assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
>              phys = <&dp_phy>;
>              phy-names = "dp";
>  
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
> index 13c5d5ffabde..3cea87def9f8 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
> @@ -401,8 +401,6 @@ examples:
>  
>              assigned-clocks = <&dispcc_mdss_dp_link_clk_src>,
>                                <&dispcc_mdss_dp_pixel_clk_src>;
> -            assigned-clock-parents = <&dp_phy 0>,
> -                                     <&dp_phy 1>;
>  
>              operating-points-v2 = <&dp_opp_table>;
>              power-domains = <&rpmhpd RPMHPD_CX>;
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
