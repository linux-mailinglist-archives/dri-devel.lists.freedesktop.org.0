Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEC5B19AE8
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 06:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F30210E2A8;
	Mon,  4 Aug 2025 04:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dyIkqGCf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA49C10E343
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 04:52:35 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 573NmeVu024325
 for <dri-devel@lists.freedesktop.org>; Mon, 4 Aug 2025 04:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/cFrwLq3HQhmTSQxSXVw+WLa
 sVwzOCkOdDsAcXyYKYs=; b=dyIkqGCfdNKl6Us3ZqdLv900sBhQcbcZuKh3IpRB
 rp+GprCgw/PDncnzSI5o5u36Bd6Z4QlQlQDzaJlpXOInn1//ZY8MbDwuILRqGP7p
 xoUNT0po7g//5y7GL4+9vAD24pGMLBjeLq7RZVzbTaVaB2IithipY5ytodYPClC4
 dNUA7PkVaqoCvIW0ONhx9pL+00tl3h6v7izoJNKJpbJUKvcsDqBYp/ipOeViRqZN
 es5qUBMkj/VNPb/iOZd+sj0zhbDAeC168B35co6yR3Zi183lHCoAFSPvVHT8NcF6
 pdpCNo+qn5vdQC7vhjhsyaCOAP9EdM7ekV/EwiIrfWHlaQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489a0m3hsv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 04:52:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7e7f74baf26so176468885a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Aug 2025 21:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754283154; x=1754887954;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/cFrwLq3HQhmTSQxSXVw+WLasVwzOCkOdDsAcXyYKYs=;
 b=P48L/YFQYOvShFquqQY25qCJZ3jIHjivw7f44VX2zUh6kNnaz+kRieNYs6uUSkwVNS
 /EoCip5FYTsROU5l8MfPZU3DCdp/QbdaQY8CsoLSKD6oCZqPlx/4IMFUQDltJ8s2egsv
 ACBWXTYbv34dCXA+6EiJZmLWIbvSKIfa2CP5G3pwp39HpU0y9NuaKsKg+KAyW/XJFy/b
 zjogqf3X2EEWCbcEQ6uidP1qJgqHPJuY0bpc5DTdDatTj5ZjJrQU6YmY20o2b3cocpXL
 CwnzKBet6RA4bFESW2VT8EJLJ3tvhAA7BqUAWRclnHLFD4AftpzUg6ZRlC2R5hcZmPP3
 1H/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtCPNDa8qXC6ocDwBSLcoSeltCQKdSTgNORYHhxXfLfsHEQpoqJjEqmE9UHIh04eMXtmoJOONvr5o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzbe8cU07Zwg8m/ryQyySVnk/BJKVCcMo7hfu8PBmTz0OMOCSow
 VS9cjcuGAuk+dEx0pZYKW3j2yGORj1+GKBaENTyedAr8D5GnVIOVgXRBxchqk0huSUqlhdzVBc7
 mhcS7nEiV/Kp50o5I19Y9WoDciinp4xgGio8ZJc8zebKihgu2woxbW22BdavnNH4Ci/B3KFs=
X-Gm-Gg: ASbGncseRY+pIwHBqqNx4FhFz0losZBKuvv2NPj4hRrpZtJSKwqas0KQWRPC7BJWSG5
 KDklH9134ollNeRbPNBLPF/zMGoeoId6PkT73mGwclJdkchGkWN2635cuprR2WmLw4Fzrp9T2YC
 joZeRdt2Hb93sEH92ITzMF3zL7vSixO7Oa/2hOUf1L7kN8mGZ+BPgzicyYYIOd7BDicJAh0nF4I
 o5+r3yhfxoAUngxZSN5SPYdqwegGlCsPMvbEe0yl8XnFQfHnsg5Qx5tCAteRbpVuZRyX10zVqKk
 eRtnPILhMaQXjEbnQTUpdo/BPekb4bmSYFOj23He2jM2HDtt/PKdLNjsRP5RKRPq0a/rDmwk8OB
 ovFiCZWjVcg9Sm98M1mgggKamRX03lh8qvwXTI1XPEikGMSgBMVPq
X-Received: by 2002:a05:620a:11a6:b0:7e6:2882:f25a with SMTP id
 af79cd13be357-7e6963a7457mr933657885a.50.1754283153640; 
 Sun, 03 Aug 2025 21:52:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMfTWsXHPhBqobpYEbz/9bATgsYAMJPvLrtT34rSptfkECCIJS6a5FJfM+Zfa+aRLsRdRtKw==
X-Received: by 2002:a05:620a:11a6:b0:7e6:2882:f25a with SMTP id
 af79cd13be357-7e6963a7457mr933655785a.50.1754283153198; 
 Sun, 03 Aug 2025 21:52:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898c164sm1468453e87.23.2025.08.03.21.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Aug 2025 21:52:31 -0700 (PDT)
Date: Mon, 4 Aug 2025 07:52:27 +0300
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
Subject: Re: [PATCH v5 3/5] dt-bindings: display/msm: Document MDSS on QCS8300
Message-ID: <gkcy5rmtodvkgcyzv5mylq4fnlampwichvywcej7ncrbn35jni@ewvcda4o2s2l>
References: <20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com>
 <20250730-mdssdt_qcs8300-v5-3-bc8ea35bbed6@quicinc.com>
 <deefg7w3ot6cd3woexfwagetmkg4nvu37f66h4ulbdqegdgi3u@plj6puxcsil4>
 <477bebcc-2d1a-4183-8e3d-d792e876c63a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <477bebcc-2d1a-4183-8e3d-d792e876c63a@quicinc.com>
X-Authority-Analysis: v=2.4 cv=JOM7s9Kb c=1 sm=1 tr=0 ts=68903c92 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=Ynuxa8Nitr_4Jzo9iNAA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: G8bCPFvXHkr2dZ1kIty99NFfNRGpNMxu
X-Proofpoint-ORIG-GUID: G8bCPFvXHkr2dZ1kIty99NFfNRGpNMxu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDAyMiBTYWx0ZWRfX2kIqIy7UuIcx
 WzIsZBW8cqJiYY/k90XAbiA3UMUAgOWAjHz0iAu3OTFsBKsDCgbiiOOcoPaRmdwDK1WoRPLuwVN
 W2RoR8c+p/zb+cxFHxyrZbSkpPlpVl7k6vtsCoeuhQU8tZ0FDIhVzDiFoeIb1jnw8AKiqPoY95k
 jhBcBN2ySqFfQznDUmNs6pJBfWdhaZ1yf7r2l9PtNUN0BnUI0n/k7tF/GsHQ3EKrPZt0Puc8rUR
 tpaZtjRs++wiDuxAzb8HFY+9MhFOh038gff3UzQAM/eSJtJwAeFFsjaTQ49OEpdz6j6q0d2nNmt
 obfgQ4Nn1jf50FDd1BTIs3eOuQNeykdZRWFlmdjpfr2YgrOA10xx73faMHBQcs7jCAEHTXXfyeb
 1+EhwqfoTGtWy8+Uomf7+/S7NJTpBq4QHAqATkawXuq+9ngspMsAdYH/sNVkW2WvtRNmSdTS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_02,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040022
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

On Mon, Aug 04, 2025 at 12:31:31PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/8/2 17:56, Dmitry Baryshkov wrote:
> > On Wed, Jul 30, 2025 at 05:42:28PM +0800, Yongxing Mou wrote:
> > > Document the MDSS hardware found on the Qualcomm QCS8300 platform.
> > > 
> > > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > > ---
> > >   .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 284 +++++++++++++++++++++
> > >   1 file changed, 284 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..ae4bc16395326bffd6c9eff92778d9f207209526
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
> > > @@ -0,0 +1,284 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/msm/qcom,qcs8300-mdss.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Qualcomm Technologies, Inc. QCS8300 Display MDSS
> > > +
> > > +maintainers:
> > > +  - Yongxing Mou <quic_yongmou@quicinc.com>
> > > +
> > > +description:
> > > +  QCS8300 MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
> > > +  DPU display controller, DP interfaces and EDP etc.
> > > +
> > > +$ref: /schemas/display/msm/mdss-common.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: qcom,qcs8300-mdss
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: Display AHB
> > > +      - description: Display hf AXI
> > > +      - description: Display core
> > > +
> > > +  iommus:
> > > +    maxItems: 1
> > > +
> > > +  interconnects:
> > > +    maxItems: 3
> > > +
> > > +  interconnect-names:
> > > +    maxItems: 3
> > > +
> > > +patternProperties:
> > > +  "^display-controller@[0-9a-f]+$":
> > > +    type: object
> > > +    additionalProperties: true
> > > +
> > > +    properties:
> > > +      compatible:
> > > +        items:
> > > +          - const: qcom,qcs8300-dpu
> > > +          - const: qcom,sa8775p-dpu
> > 
> > Use contains: instead of listing both of them
> > 
> Got it, thanks~ here we want to fallback qcs8300 to sa8775p.
> Should we update it to :
> +        contains:
> +          enum:
> +            - qcom,qcs8300-dpu
> +            - qcom,sa8775p-dpu
> 
>  above method can be validated using dt_binding_check.


_instead_ of listing both of them

So:

  contains:
    const: qcom,qcs8300-dpu

> > > +
> > > +  "^displayport-controller@[0-9a-f]+$":
> > > +    type: object
> > > +    additionalProperties: true
> > > +
> > > +    properties:
> > > +      compatible:
> > > +        items:
> > > +          - const: qcom,qcs8300-dp
> > > +
> > > +  "^phy@[0-9a-f]+$":
> > > +    type: object
> > > +    additionalProperties: true
> > > +    properties:
> > > +      compatible:
> > > +        items:
> > > +          - const: qcom,qcs8300-edp-phy
> > > +          - const: qcom,sa8775p-edp-phy
> > 
> > Use contains: instead of listing both of them
> > 
> Same as above
> > > +
> > > +required:
> > > +  - compatible
> > > +
> > > +unevaluatedProperties: false
> > > +
> > 
> 

-- 
With best wishes
Dmitry
