Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6CBAC9669
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 22:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5575510E233;
	Fri, 30 May 2025 20:13:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cfirfARK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E3710E22C
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 20:13:09 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAwRS9014001
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 20:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=OadsK1rEyJ0H/6UeuCVG3zTO
 8HatytaJI7W16ZL8R1U=; b=cfirfARKU95wLmTLhM1DWv+6hCK9/XU6ApM7UDVy
 /MfEZhGslm/IOaZTSrX0RSap2IMua3gcVB8bpiQGgwIuaqWpidbq7kcSPVdtgxFe
 Q5/8GWxXK2tj0oWHgLVqg8TIzcjbyYZcp74YKStItp1gQSL43zmZb3jWvNJmY8YO
 AlwXClASF304pV8ET2tDoIN/C49C0TmXVgslCkQ+OANDjhqs91g4shygvwKBBvKL
 oOX16ZjdGC7ufWfbwWQY/oYI/6UOXDv0yuXMYuXHYpfzFqMYimp+50gefeLgBRw9
 AjJIFW/lHOULrVJ2tgGJt8gYXTv1Jv/tbi+YX7GpiHSn4A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavm4brj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 20:13:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c760637fe5so374590885a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 13:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748635987; x=1749240787;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OadsK1rEyJ0H/6UeuCVG3zTO8HatytaJI7W16ZL8R1U=;
 b=ho+uXnZlpg52FgB05JBZwn+B1lFLymnldeefsvTddtmhT82fcvmKIFQT20ZWhrkDxF
 Gq1JNvTd/NBQzXt1Z77FK0puavg31ibUGO7eDt2ayxkFjm60nkWpZYpyiGP8JMePJ4IX
 WQ0+1XNRH/QiunCrshTwG87daGHIllAAAduTP3XlUh5SzDZAIVzxomjrUDmzIODXVBys
 Fbb5jdJUp7G4H7aea9mNaKrYsdBHt4HEj7mncwYffRfriIfYTh0eIIK9cviqrQhBcDY/
 ldEUbKghZ3guooGK0+DMczuVkfmUb4uicSRjY62SD4wyFelskAYowjORZq8+0wZfpOTx
 4ElQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6TavsDAMWIv/1E3bJ/OseeWF6KWZmGBBmhNpV8YtsIuz7GPMsTtrDwHceSgUf0XNzBL/42ZB6DzU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmQF55MmyHSr717wlpL7jA6sPptEhFiGZqzW9CPs9dxaHyjz7I
 keIPwpU104dkx5Hiku++7cHW8gQAaMXst5taie101mp5aP5U8T20llh/DD/LJKYMncCMTC//RI2
 3jIK4IMP6Epija2ONKYOMHDrEP2bUJqlbpcB1Pvmq6a9noA0sSySywn9liYPuM9xUYrlE2hI=
X-Gm-Gg: ASbGncuQZJYxSKMLp19RlYI1lKczcBIgQ840uYFVp/dwNiKbG0MHuBo6/OAzwgQKjUE
 ioEbHvXpqUWkaMnzDItxhsn9HLIh/2lwJDejoa3HkPTEFEWz5mXGPCMmaMzLjjgUkI4ty/f0mJd
 P2RvbthyDv+8WVjEBuAceRyf63Ft9eeN3vL7ztcr7npsqfqjcf4E/rcc/WF/tEE1Zten1sEnoME
 Y7d5BagjoH5e0BFzIh1ITuBkuZJESbyeRPz543VU6i3b7D4ENHxZ4c0lPEGBCNHot/c9bKdUofj
 3+NkiW3ML5l6y7juVTSDYRGE34EeATiH1xikFXnJqOmOwoxHMw0DVytQ+E1LRE/6GWMavHzuePU
 =
X-Received: by 2002:a05:620a:2796:b0:7c5:5d4b:e62f with SMTP id
 af79cd13be357-7d0a2016d83mr732917885a.43.1748635987451; 
 Fri, 30 May 2025 13:13:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAE89MTxPgWdO4i0WDxPat+2lBREnl7QdMY9f1fr5cgF/Pe+0swZFpwTEUR+ykqh7B7ZTwzg==
X-Received: by 2002:a05:620a:2796:b0:7c5:5d4b:e62f with SMTP id
 af79cd13be357-7d0a2016d83mr732912785a.43.1748635987070; 
 Fri, 30 May 2025 13:13:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32a85bc507csm7159961fa.71.2025.05.30.13.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 13:13:06 -0700 (PDT)
Date: Fri, 30 May 2025 23:13:04 +0300
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
Subject: Re: [PATCH v2 4/5] dt-bindings: display/msm: add stream 1 pixel
 clock binding
Message-ID: <lrrq7cj3kw5sk7y4wjvbdvjf5qu3cwbhreod2twttvejcxtfzd@eygjcarxxd7m>
References: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
 <20250530-dp_mst_bindings-v2-4-f925464d32a8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530-dp_mst_bindings-v2-4-f925464d32a8@oss.qualcomm.com>
X-Proofpoint-GUID: S2FJxjtFHFaoys8unaGYc8stNQNXv9dZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE4MCBTYWx0ZWRfX66chnBWt0Grv
 SFdjgcFAYZQvx36rs7sRJn5/WyRP4L5kh/IL8yRfMIQekhmRS630bdH3XQlzGvs7xZPPs3rveaI
 WL1IG+zwRKrjoMNGiszw+VTcNGZkn6ho+WHlKlziB9CtzWgubHPEE1ezcGpo84EqY8rbrIz+8Ux
 rZ89HGk4fuW2MxKw4TnZf3KNg9DQu4SIg1du/fXfO2pH5iShnNMb76nizJDH5I20CtkgNHmUgYb
 NJtStNhEMlijHePWZi41OLXZCNXvyU2mI0kbbOip8OVp17UHyQgklwswhA7obkC8ABAnFTRU58E
 7jlhKqcoQhoRK1ko5eVOPIzKlC5knxtxNywbynWJ5DiNUwuvj+m6yt7r7MCjVrUPwzwC29UALTr
 SFe50XBzQK6rqtRDed7CYP8vOwtXL6JRVnllRw00VuDskqfBg8QVMP3dts9b30d3yVRIcQKo
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=683a1154 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=s_08DJon4HIwgivb4r0A:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: S2FJxjtFHFaoys8unaGYc8stNQNXv9dZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_09,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

On Fri, May 30, 2025 at 10:47:27AM -0700, Jessica Zhang wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> On some chipsets such as qcom,sa8775p-dp, qcom,sm8650-dp and some more,
> the display port controller can support more than one pixel stream
> (multi-stream transport).
> 
> To support MST on such chipsets, add the binding for stream 1 pixel
> clock for display port controller.

If I remember correctly, some of these chipsets support more than 2 MST
streams, which means more than 1 additional pixel clock. Could you
please clarify this?

If so, can we please describe all clocks, so that we don't have to
return back to the topic.

> 
> Since this mode is not supported on all chipsets, add exception
> rules and min/max items to clearly mark which chipsets support
> only SST mode (single stream) and which ones support MST.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dp-controller.yaml        | 36 ++++++++++++++++++++--
>  .../bindings/display/msm/qcom,sa8775p-mdss.yaml    |  9 ++++--
>  .../bindings/display/msm/qcom,sar2130p-mdss.yaml   |  9 ++++--
>  .../bindings/display/msm/qcom,sc7280-mdss.yaml     |  9 ++++--
>  .../bindings/display/msm/qcom,x1e80100-mdss.yaml   |  6 ++--
>  5 files changed, 56 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index a63efd8de42c..81ffc141e00d 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -54,25 +54,31 @@ properties:
>      maxItems: 1
>  
>    clocks:
> +    minItems: 5
>      items:
>        - description: AHB clock to enable register access
>        - description: Display Port AUX clock
>        - description: Display Port Link clock
>        - description: Link interface clock between DP and PHY
> -      - description: Display Port Pixel clock
> +      - description: Display Port stream 0 Pixel clock
> +      - description: Display Port stream 1 Pixel clock
>  
>    clock-names:
> +    minItems: 5
>      items:
>        - const: core_iface
>        - const: core_aux
>        - const: ctrl_link
>        - const: ctrl_link_iface
>        - const: stream_pixel
> +      - const: stream_1_pixel
>  
>    assigned-clocks:
> +    minItems: 2
>      items:
>        - description: link clock source
> -      - description: pixel clock source
> +      - description: stream 0 pixel clock source
> +      - description: stream 1 pixel clock source
>  
>    phys:
>      maxItems: 1
> @@ -174,6 +180,32 @@ allOf:
>        required:
>          - "#sound-dai-cells"
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc7280-dp
> +              - qcom,sm8150-dp
> +              - qcom,sc8180x-dp
> +              - qcom,sc8280xp-dp
> +              - qcom,sm8350-dp
> +              - qcom,sm8450-dp
> +              - qcom,sm8650-dp
> +              - qcom,sa8775p-dp
> +              - qcom,x1e80100-dp

Let's get this list sorted alphabetically. Also, do we need to list all
those entries? Some of those use fallback compatible to qcom,sm8350-dp,
so it should be enough to list just that entry for those.

> +    then:
> +      properties:
> +        clocks:
> +          minItems: 6
> +          maxItems: 6
> +
> +    else:
> +      properties:
> +        clocks:
> +          minItems: 5
> +          maxItems: 5
> +
>  additionalProperties: false
>  
>  examples:

-- 
With best wishes
Dmitry
