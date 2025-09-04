Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99305B4473D
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 22:23:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 400B210EAD0;
	Thu,  4 Sep 2025 20:23:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIx24vXp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B66E210EAD0
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 20:23:34 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584IM9gu031829
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Sep 2025 20:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=BhjhLn4p+fVTddeDOV5N535S
 l5j76d//X2bYh+lMLPs=; b=gIx24vXpFsSdYeFUk+FTmMF+B4fWHQdBzPmDn1LF
 SRJUli3nCxV50BpDCX1zqobOq32MoATgytI0qIMpMYtk2fVfWbJt86zys1vlIheb
 cViV+E2xviNdFDXLMdfK5WCGZvLlid0xsRG7K5iXiF5UFcVUm24gEW95xzMjDGRW
 4Dm/0Gh8RYXspRMoJL1mMXKXSc3otG7CWOmIjLz35eYjeNYSprPo1S2ybgR1Glcu
 xXNh275dxJHD5kI8+rxFACAbl1Mu6aV2Vw9A/WEm16IK2D6DI+HehFjC6Ki6etoS
 rPBFtMlReVhhyvGq1l9pAYY3qknNvEyGFz3E4pUS/uTblg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw08v47-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 20:23:33 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-718cb6230afso25646106d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 13:23:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757017413; x=1757622213;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BhjhLn4p+fVTddeDOV5N535Sl5j76d//X2bYh+lMLPs=;
 b=kuyJkdzoZ09rsOeFi2ZACaLdv3GxePBI2ISGOJb9PY07zDIllb1d5Q7azHMB5Thhry
 381mmhDnpabvN6ZPbyVxzldTvjZ9AJEEjPbX8J8M9odZNnH90a6VQpywhMUy2nsHAOH0
 21Hlw0Z8s61TATmh0zz6Y6itNb8bRR3s+4VV62Yg3PkazRoCGjbf+aYX3ovZYpEO7FK7
 vtnWbTa3bIJhlOk67HzkgOLAajw8xlnAL21Gc/2Th3p8mkiB2S2f41MWVzfT33CWP9dk
 pEfobVJ36dFTRmdMsNqv3Ma2LgCjY66Bvj+3PVMZe38yvoQmxmnJwXSIPpRcZSO4j+qz
 IQbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDBCdczKsuksi1kJXghkesndP4togFEhjjyX6D4Vb7XBcmsk/IMVUc6JC/5jebj7qNrmuyBzePxns=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZinQDkDId0mjfaNJf/PBTlZJgNN83cBdYEKkjhbiBp7DVBcnt
 HWhMkE8X5OmKqpFQ5gx5d68F5wxBGMkBhwKv7VNroYKa9tTSjiFoc1SxoGbRzw+fPmb6hYSAWvP
 P1dZ4IEO/DJ1tr4zgDvKqkJlx0Tz+EB2NZYMItwFNm1To7vYUXVI2VLpf2jEk+kcRcARNcbU=
X-Gm-Gg: ASbGncuZ+9fu1HrDNvMLDmaPoI4TK7K7RGdqsW9zZsx+VuHv1xSHAqFidod2eCbGTyE
 tTlUlwN1efS+VSYHQomU1XAsVcm7FyQJABK+onngcVo+vCsMFiqD3DyRw5S7IuObMppWnz0Af62
 X8XgvZSNBN44AAb9rzZteYo505ATXGBIHBGJ1Ln+9cTx0JEc+eL0xLbqgAYe7sA1v4Br4epTVrU
 W357i0KdbUIBzrscIVSoECc6b47TIedGK56/C8GPE8dk4VGUSeBRymX9z3c4OfbBkLH6fgU/+1R
 aLNAnNAETGYkWb3eYlnWk+mHZ7n546dP+aRz2AeIGGBoLqxbAowAtwFwqDHrDffkJTFTAh4XJ3H
 wYy6GD8n5u1JCMhixqNlREg+VWu4GsZZOudp5U85NpBdnJ3pfJFOm
X-Received: by 2002:a05:6214:40e:b0:709:6582:86d8 with SMTP id
 6a1803df08f44-70fac789c6amr237886086d6.21.1757017412570; 
 Thu, 04 Sep 2025 13:23:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7DTtrjAmMG4+SbOuJLgcfs9oxMwNnEiEQAc0Pfy9/m+t6Z1n1hx4a3Nf6n68AGum0eX+41w==
X-Received: by 2002:a05:6214:40e:b0:709:6582:86d8 with SMTP id
 6a1803df08f44-70fac789c6amr237885516d6.21.1757017411833; 
 Thu, 04 Sep 2025 13:23:31 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ab5c0acsm1437638e87.16.2025.09.04.13.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 13:23:30 -0700 (PDT)
Date: Thu, 4 Sep 2025 23:23:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/4] dt-bindings: display: bridge: renesas, dsi-csi2-tx:
 Allow panel@ subnode
Message-ID: <lecx2cs5durkwq4at4w32bgak3s7tsxfmj6fzvyxhfjud4zljm@25aijm4rlhmg>
References: <20250904200431.168363-1-marek.vasut+renesas@mailbox.org>
 <20250904200431.168363-4-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904200431.168363-4-marek.vasut+renesas@mailbox.org>
X-Proofpoint-GUID: 0NBeAsXrSLljHQ9Vyu5UKC1BCqpR_vCL
X-Proofpoint-ORIG-GUID: 0NBeAsXrSLljHQ9Vyu5UKC1BCqpR_vCL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfXxT7QqtM5gAZ5
 718ysElXug72UWs5RKJAuMIh7IHUlUupb3AYFoxKgNbIRY7VYBNT/rFL8DHDa+9St+ifMKxUEfn
 T6XsuyFF+drjgUwO7wVzgNDDAYQmasYntNM+nJ91Z2ql7R1gqT+VDxrx9aLIjrz50ARttKax670
 FT5SmYCY/kiPk8WNUcMtB7yWic+W1sCS8Fp89vJyVdSjsmKk2LjtS70+Dy1v4atCKZWk6sW+k/T
 NNnMprEuNq8JU0FLhqqj8ArEr685hlnAVsM47+HO/QX3FPHRJ55HhvLNM+U1A5J2iFo+WNlUIKo
 tpgi0RB4ruxKRc61ym23N1ISDQ95tfREfLuLVIkcLzbt7d9dcubg9e9YGMdjotAtgCiSXPnZSWZ
 WuGfFrPe
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b9f545 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=b3CbU_ItAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=P1BnusSwAAAA:8 a=KKAkSRfTAAAA:8 a=e5mUnYsNAAAA:8 a=HSFmO_Wm-5cOy6Hx3LcA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Rv2g8BkzVjQTVhhssdqe:22
 a=D0XLA9XvdZm18NrgonBM:22 a=cvBusfyB2V15izCimMoJ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_07,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027
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

On Thu, Sep 04, 2025 at 10:03:08PM +0200, Marek Vasut wrote:
> This controller can have both bridges and panels connected to it. In
> order to describe panels properly in DT, pull in dsi-controller.yaml
> and disallow only unevaluatedProperties, because the panel node is
> optional. Include example binding with panel.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  .../display/bridge/renesas,dsi-csi2-tx.yaml   | 53 ++++++++++++++++++-
>  1 file changed, 51 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> index c167795c63f64..f663bc6a6f831 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> @@ -14,6 +14,9 @@ description: |
>    R-Car Gen4 SoCs. The encoder can operate in either DSI or CSI-2 mode, with up
>    to four data lanes.
>  
> +allOf:
> +  - $ref: /schemas/display/dsi-controller.yaml#
> +
>  properties:
>    compatible:
>      enum:
> @@ -80,14 +83,14 @@ required:
>    - resets
>    - ports
>  
> -additionalProperties: false
> +unevaluatedProperties: false
>  
>  examples:
>    - |
>      #include <dt-bindings/clock/r8a779a0-cpg-mssr.h>
>      #include <dt-bindings/power/r8a779a0-sysc.h>
>  
> -    dsi0: dsi-encoder@fed80000 {
> +    dsi0: dsi@fed80000 {

As you are touching this, you can drop the label too.

>          compatible = "renesas,r8a779a0-dsi-csi2-tx";
>          reg = <0xfed80000 0x10000>;
>          power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> @@ -117,4 +120,50 @@ examples:
>              };
>          };
>      };
> +
> +  - |
> +    #include <dt-bindings/clock/r8a779g0-cpg-mssr.h>
> +    #include <dt-bindings/power/r8a779g0-sysc.h>
> +
> +    dsi1: dsi@fed80000 {

No need for the label (dsi1:)

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        compatible = "renesas,r8a779g0-dsi-csi2-tx";
> +        reg = <0xfed80000 0x10000>;
> +        clocks = <&cpg CPG_MOD 415>,
> +                 <&cpg CPG_CORE R8A779G0_CLK_DSIEXT>,
> +                 <&cpg CPG_CORE R8A779G0_CLK_DSIREF>;
> +        clock-names = "fck", "dsi", "pll";
> +        power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> +        resets = <&cpg 415>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +
> +                dsi0port1_out: endpoint {
> +                    remote-endpoint = <&panel_in>;
> +                    data-lanes = <1 2>;
> +                };
> +            };
> +        };
> +
> +        panel@0 {
> +            reg = <0>;
> +            compatible = "raspberrypi,dsi-7inch";
> +
> +            port {
> +                panel_in: endpoint {
> +                    remote-endpoint = <&dsi0port1_out>;
> +                };
> +            };
> +        };
> +    };
>  ...
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry
