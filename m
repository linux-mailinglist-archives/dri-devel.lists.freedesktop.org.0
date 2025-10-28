Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 460B9C16B3C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 21:00:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6915F10E655;
	Tue, 28 Oct 2025 20:00:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FzycHZfy";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g657usWi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1617E10E655
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 20:00:09 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJqZeV2511058
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 20:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=V4roZFbJyz4h3LTg3OYpA/rr
 jgxznf7XEnG0CMcM7Z4=; b=FzycHZfynrd35FGtx+2WJpQ3s9APtJZESicJKxHF
 2uKj3LpBadHCj8Yvf9aQjS39nZKVKdXwyFCYOhs1dlp/99lSNRgO5ymcNCFDTmT5
 hBy/FGHn0j/kppmpceiujkfCXT0cOCqh27p6jwpgl1IUzh+U7KjHBix7w/oRd6c+
 N/60sgCzSylbB2wtGCtuXzEQ0JmS0b8dC5/Hweg2UGZOZIfBG5JlE5wr9GNapDPw
 x4BkBC98mmhMpUIOEn9VUt6h2jFDD9WVMSt4F9hp4gn2IkE6jrVGA+sdg+o3AV4i
 zLj+yifHnwmsVJGB3QNsZvf/tK5vEADGvYEwj+yszjyFkg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34cd80gr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 20:00:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4e89f4a502cso194528791cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 13:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761681607; x=1762286407;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=V4roZFbJyz4h3LTg3OYpA/rrjgxznf7XEnG0CMcM7Z4=;
 b=g657usWiSezpWLb7EWChLUVaMgr2wXcqo9en6khHqUU0kdPNUQwAoTf2l4HaKErr4p
 D9LPCn4CyQWvg4Tc84qiRdL5WVxa3MxIAGBFZHskCu//Ooqf/OOb2WCeJfvs781ftrIb
 XXErWYdCvKV0q/YDmuSdfl9Zli/vW/5MfqMh28CFEiGbfrNV0xPYRBkCTl4psRcBVKLu
 Pq1gkOU3iq6K/5rdtihhK3ssXcqvOrsw1VxyuP7cPAcy6lzQvr/YXVco22XjVNgJXorg
 QbMs9TegCh0m7LHiDxJ9sdBs4uv47otCuwa71WZ7VcrbDoPB4cyvIGQjrp0JM/L84M8Z
 1h7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761681607; x=1762286407;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V4roZFbJyz4h3LTg3OYpA/rrjgxznf7XEnG0CMcM7Z4=;
 b=g2Gyv+R0o5F5oEbJZpWNE24zRK/LC0aSsbvCyW6DG9LM3QBwsTTwCUKainb+0Anbs2
 R+RdZTJL9oqQiOMwae4BZvBripbS6vBOJDx25axfcfkiwXmjDyzZVzWUdICdh2iydG8D
 yhs6AcQWuTlk+nlkEIkKeYb59jdUzg49W39FbskvbZbsK4aBDKSCV7JDWzVT1RM/Ob6n
 KVuOPHk4VLmcRgLf/rRhoCz20tnwYXs4t+MvlLyLQuZFliTosHMr28ubOegwQsToGv+o
 3DMi8z5uJ82ZcE4PeNd+r93BooQj1jcy8+WL7GCnf4LUhMcAfA/Mah6THs9YvWd5L7CC
 PHpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWVM6pPfKVLH85z/erfQ95uNu25nGjTd0sB1IMCn3/5bBO0GtTan087EJqhgSCGXQF+MzVzgMCT2E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7gwmoIqL4OzI9j0oiIZXPKrsPJwZRbC5d6sMaMC7CoancKlNK
 EJGWCfcu1OuaqnmVTrnp4Ld5toxwcRp7Jed2R0VFUjxdJsFUpdg/Mt9VhN6DEhKmqZCSfeJGifl
 q2AyqPFXUVjVnpZ5Y1M9h0QBFTV8oicI+7Y79U3lSs66azFitkdlpQ6YsAQe7XRADkz0xrEg=
X-Gm-Gg: ASbGncvIvobobHE1Aoe+u9apZBLiFoXzqpDvGSSAud3ltqU7JTGu7//rVe/yV1cOTPB
 96ek8QkkPXngwT8hEpc5SAyU8HhLULYL3owgS9uTVe9GYAwXCl37r3DjKu/txteIGCsJMu1MlOm
 PZtrZdYxtbj6C5CwyDcYwvb7VaZ6BqD1XUzXMWppVNu2OS95xsa5QLFKvFUzwkItjvN+H5l/u0j
 FC6MYAMNZxnnsC2oLI0t44WWgJOHh6LKEE1Yib4LOj7kuvE7rzCxPSzpQxXeK2ZcNqAPxtn9VLb
 fGxL8n2nSZGBZqR5s5YGpao4Xb+JEYzWD+H47Xuwund4/+xTuFP3MeTSVTf4TRXp0Qm3rsAvy7J
 eVnIUh1xmqS1ae7eOIQUH7kAWOjQ6zJ7YB5EbkC4mie4ygHV2Th9VFCA5IkWggXd4fiPmrjYGfH
 OyJsLreitB4M7H
X-Received: by 2002:ac8:58c8:0:b0:4ed:68a:abba with SMTP id
 d75a77b69052e-4ed15b7dad0mr5278111cf.37.1761681607307; 
 Tue, 28 Oct 2025 13:00:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFW5aQI+Mi4P7TXLTknhsG3o08YzSTL6vg6PtZtW0JsBzmgyHQTV0m7A4A017Zn2nx/4LIdQA==
X-Received: by 2002:ac8:58c8:0:b0:4ed:68a:abba with SMTP id
 d75a77b69052e-4ed15b7dad0mr5277611cf.37.1761681606708; 
 Tue, 28 Oct 2025 13:00:06 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f5c33dsm3249487e87.53.2025.10.28.13.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 13:00:06 -0700 (PDT)
Date: Tue, 28 Oct 2025 22:00:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: xiangxu.yin@oss.qualcomm.com
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
Subject: Re: [PATCH v6 2/4] dt-bindings: display: msm: sm6150-mdss: Fix
 example indentation and OPP values
Message-ID: <ggrtehmzg5bajbglcjhlf5jynhwqq6vztc2fqwxxgip2q3vmip@t72qcggza2or>
References: <20251024-add-displayport-support-to-qcs615-devicetree-v6-0-c4316975dd0e@oss.qualcomm.com>
 <20251024-add-displayport-support-to-qcs615-devicetree-v6-2-c4316975dd0e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-add-displayport-support-to-qcs615-devicetree-v6-2-c4316975dd0e@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Y7ERObvUJMxVlwHdq2k4o0-pm7kENgYj
X-Proofpoint-GUID: Y7ERObvUJMxVlwHdq2k4o0-pm7kENgYj
X-Authority-Analysis: v=2.4 cv=avi/yCZV c=1 sm=1 tr=0 ts=690120c8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=oTxB0LKMmMN85w47ZbAA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE2OCBTYWx0ZWRfX5gvoi2NTiJFS
 dDtEmGWevLnhkfCUjSQprOI1FUgUJcJbVO6v2iJnDEuK0VHYyf/8/GJXRRBbrpVtKOUII5tN8wz
 xSJe7HfobRFnJdK9Aw6iw272Etvers8FZAGj9I3eYBySE16q4pRMyzL3yQ4Hl5Eshcn0EXLbtkM
 F/opAnUDi6JpvYlWN2rqkSogbAxTIlN0O5grGsmAGWDdfNANoNYg4j59n9koQqiZ9LsOKBY4cmk
 K6Fz457Mgn9LGd5NrmX6YIBYqxoMqQqN1AoL32ZjgffTgdLzEoTSHeeSnj7tBc7HAGsY65kqjQS
 atR3j6+QfMxf6dDEElMJ2T5k1GGXiHY8CTYLMoa3RDG3H2cVlcFpWfIkBdr71WzHiIMzmRHYLWN
 K1ESSKIDrBGLJLWCJ2nZiyHHqZA9Ug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510280168
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

On Fri, Oct 24, 2025 at 01:21:02PM +0800, Xiangxu Yin via B4 Relay wrote:
> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> 
> - Adjusted indentation and added missing blank lines in the example.
> - Corrected OPP clock values to match actual DTS configuration.

See Documentation/process/submitting-patches.rst to check how to write
proper commit messages.

> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/qcom,sm6150-mdss.yaml     | 32 ++++++++++++----------
>  1 file changed, 17 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> index ba0dea2edea98cee0826cf38b3f33361666e004a..80183df71cd9288f652dc42afeae101e8edcbe65 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> @@ -140,35 +140,37 @@ examples:
>                  #size-cells = <0>;
>  
>                  port@0 {
> -                  reg = <0>;
> -                  dpu_intf0_out: endpoint {
> -                  };
> +                    reg = <0>;
> +
> +                    dpu_intf0_out: endpoint {
> +                    };
>                  };
>  
>                  port@1 {
> -                  reg = <1>;
> -                  dpu_intf1_out: endpoint {
> -                      remote-endpoint = <&mdss_dsi0_in>;
> -                  };
> +                    reg = <1>;
> +
> +                    dpu_intf1_out: endpoint {
> +                        remote-endpoint = <&mdss_dsi0_in>;
> +                    };
>                  };
>              };
>  
>              mdp_opp_table: opp-table {
>                  compatible = "operating-points-v2";
>  
> -                opp-19200000 {
> -                  opp-hz = /bits/ 64 <19200000>;
> -                  required-opps = <&rpmhpd_opp_low_svs>;
> +                opp-192000000 {

This is not necessary. This is just an example, so it doesn't matter,
which values are actually written here.

> +                    opp-hz = /bits/ 64 <192000000>;
> +                    required-opps = <&rpmhpd_opp_low_svs>;
>                  };
>  
> -                opp-25600000 {
> -                  opp-hz = /bits/ 64 <25600000>;
> -                  required-opps = <&rpmhpd_opp_svs>;
> +                opp-256000000 {
> +                    opp-hz = /bits/ 64 <256000000>;
> +                    required-opps = <&rpmhpd_opp_svs>;
>                  };
>  
>                  opp-307200000 {
> -                  opp-hz = /bits/ 64 <307200000>;
> -                  required-opps = <&rpmhpd_opp_nom>;
> +                    opp-hz = /bits/ 64 <307200000>;
> +                    required-opps = <&rpmhpd_opp_nom>;
>                  };
>              };
>          };
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry
