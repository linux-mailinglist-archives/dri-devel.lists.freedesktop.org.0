Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3731C0476D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 08:16:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3994310E9DB;
	Fri, 24 Oct 2025 06:16:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="e8zB9oQl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA06F10E9DB
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 06:16:50 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FkR9021725
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 06:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Oc3gjqlqckVAbSd31V8Qk20G
 E0yeIECg+nhtUabuCV8=; b=e8zB9oQlRCKyR8irosjyBtwH1pKlRx0uP3KnLmMC
 SL5l2poYCFHIxJgbbwCGIeUuJtHp+M4ET41hcFW8IQiPMhe4V/pB3okow2//sLMR
 mbe6dCxYG2noMwa10KYtmUmJBW6y1Z4cM7Ta/Md3RIHeBrtUC8qXlwUtQerLKnm6
 Smp0yIyDueiOy2SzdM9SbposLrIKJmhd29l6m3AqzfnMP0LebAWNqcmg8dYViTC/
 r1Qv2IT3t9KFoXuOx+oCnWXnaPC1pLo0Sno8sXwGve7uU3klvZKLuW4peORoLh8O
 HA14+RQsJn0dqprACEeAizX+Y7s0Dujsf7jkfeniYp8yCA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w8ayj8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 06:16:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-87c14264340so19149976d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 23:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761286609; x=1761891409;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oc3gjqlqckVAbSd31V8Qk20GE0yeIECg+nhtUabuCV8=;
 b=eF5I+Rzgx+UTAZvWJFPubXMEtnkbFH76l8TXad3hK33b+EHWIxGL2qkI5O8fUkot7L
 PwQ9YceeLXwX6hmZKvN8b9q80nsrei7Eg1Uc8kGkiQYluu3O8Gvu3oeUh0EkR8Uvh+Cc
 UXzFvM1IzggBf2z/T3VEk/nhWSbf4W22lxwkoIRYsxbAN3hw8sOM7MMLAzLcMDKzA1jT
 pH5evWKR9TKsnWbUD2vik5l7/ccApiLywDu8z5Q+2HklPWX405xiHhlfSzCOT9ahbmQw
 SsHvBne1eSa4EwWIMt0WI+EeqZC3huhI7lGGQq8vQ3QSxCmbodk2Z3YJBjyB2qJ/SEDw
 XSCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7WxRNQvShvSNfgov+IfLG0cK0IIhte385wfw9JePRJMwLJHf92h6bw8uhIYqUbQ79f9hwhINY06c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhNteWf9yFYMhmmKO31esrJDVoF6wXQsIczKvD8ZPJ4DA+o+5a
 43fDPBOHKxuUxwpL16srceR3aO56xvSgvGQx60V4t0oUg5ytYhsZGc0qFVLRfpG2US7D4cPFQ6R
 kpavo0xVtSsKqU3XYbeQeuH1y5XyySXziPADwe/Jntdyb5nyCAUkaVZhuMMocbcK8AmettBw=
X-Gm-Gg: ASbGncu9GYNuSk4PQ8qe4bleBE9ebu5qXXKULUnaOQpPWPwvcfzxzj7ZOFn2uzXq97/
 JIHux8UQ1Y1JskvQAam7v7lqbX8GXqlOC1LwHel1j8dus1dSmiZIYZy1hYUtPGgjZvCPKdfxUnD
 hdoT3fRYVuQAi1y0J7dYZa0NjsEC+w/vnhxf3mZDgGNINJa0ILI5/uK/+NsHwOt5tKma81Tu8n5
 j92A+efSujmHOcBs/npmq2eSDmq3nH6OBZLH/S4KclotCMi/SBWhTfRvTM8cWL7a0LXP+Pt8AvC
 4I/qf3PjwSpOXE2N9OGeWXWHD7ofXNWbCsN5yjqvFwnhIkIQoThzSMsOE5TSaNFYJpk4VhzsxQ2
 1YbHhcu/MiWXIRaIHB6n47wlVMwt4MBRoyWn36VL+15eG80xsggfWJH/2vFIG
X-Received: by 2002:a05:6214:1948:b0:87d:a372:fd3e with SMTP id
 6a1803df08f44-87da3918502mr252316056d6.56.1761286608902; 
 Thu, 23 Oct 2025 23:16:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRWxznceiaYwoYfRYDi83MmSgEYL00/tTzbMQnKGU4A+s5YJqD5hVgMNUNelwZcLrgA2PNdA==
X-Received: by 2002:a05:6214:1948:b0:87d:a372:fd3e with SMTP id
 6a1803df08f44-87da3918502mr252315746d6.56.1761286608426; 
 Thu, 23 Oct 2025 23:16:48 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-87f9de7df36sm29520256d6.21.2025.10.23.23.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 23:16:47 -0700 (PDT)
Date: Fri, 24 Oct 2025 14:16:36 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 12/12] dt-bindings: display/msm: qcom, kaanapali-mdss: Add
 Kaanapali
Message-ID: <aPsZxLLkmLXCZlO1@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023081736.1251-1-yuanjie.yang@oss.qualcomm.com>
 <3jjgcha25ieekpulyc64gafyg56n66emr2ibmtdyugfsm6tjvh@rkhrs474vgdc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3jjgcha25ieekpulyc64gafyg56n66emr2ibmtdyugfsm6tjvh@rkhrs474vgdc>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX9gFWa90NflVH
 mZ90oJlJeMH3FmWGSl8KfDaeSMSCJ8mywKfI4SXvDQu3udefs219yYh6jgfAtrz1QHWhl0gY/72
 JlTsSK7SWBBwy8b+22s5cNLI3Ze3PMuO3eEmtag3tAYuflwSTaihnOp4yE80LM/NUKGcF7zklZf
 6JS8p77vTKpjB9WYNpgANURW4AUIvQiXiOesB3pEJK0gthm40d2/fH1ojyOVGdwFbLtLRqTI1le
 /doI2mj/GWuY9+xhqpFkE7dCeoGkkDTvc44DTtZqCR7lpbtXas29T007N58W07pYTaYlm7knIzP
 exZW87b0RARwgw3+SUvyjM6rySMDimNszgKGEW3mNNaHnjuKIOt4YSGUBwJ/ZSljgJFzWwqxX3v
 yyyribwIhpcgUC4X/O+9LWk73DYiMQ==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68fb19d1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=JSoK1XWtJ22zO0-9PVAA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: _c8r4FCZkL_PuxjLnHIUyVdYwtwyGm6a
X-Proofpoint-ORIG-GUID: _c8r4FCZkL_PuxjLnHIUyVdYwtwyGm6a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015
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

On Thu, Oct 23, 2025 at 03:17:53PM +0300, Dmitry Baryshkov wrote:
> On Thu, Oct 23, 2025 at 04:17:36PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > Add MDSS/MDP display subsystem for Qualcomm Kaanapali.
> > 
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  .../display/msm/qcom,kaanapali-mdss.yaml      | 298 ++++++++++++++++++
> >  1 file changed, 298 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
> > 
> > +
> > +  "^phy@[0-9a-f]+$":
> > +    type: object
> > +    additionalProperties: true
> > +    properties:
> > +      compatible:
> > +        const: qcom,kaanapali-dsi-phy-3nm
> > +
> > +required:
> > +  - compatible
> > +
> > +unevaluatedProperties: false
> > +
> > +
> > +            mdss_dsi0_phy: phy@ae95000 {
> > +                compatible = "qcom,kaanapali-dsi-phy-3nm", "qcom,sm8750-dsi-phy-3nm";
> 
> This doesn't match what you've written above. Was it validated?
Thanks for your reminder, this is a mistake forget to fix.

correct here:
compatible = "qcom,kaanapali-dsi-phy-3nm";

qcom,kaanapali-dsi-phy-3nm and qcom,sm8750-dsi-phy-3nm have different cfg.

Will be more careful to push a better patch.
Thanks for your careful review.

 
Thanks,
Yuanjie
 
> > +                reg = <0x09ac1000 0x200>,
> > +                      <0x09ac1200 0x280>,
> > +                      <0x09ac1500 0x400>;
> > +                reg-names = "dsi_phy",
> > +                            "dsi_phy_lane",
> > +                            "dsi_pll";
> > +
> > +                clocks = <&disp_cc_mdss_ahb_clk>,
> > +                         <&rpmhcc RPMH_CXO_CLK>;
> > +                clock-names = "iface",
> > +                              "ref";
> > +
> > +                vdds-supply = <&vreg_l3i_0p88>;
> > +
> > +                #clock-cells = <1>;
> > +                #phy-cells = <0>;
> > +            };
> > +        };
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry
