Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99665B59561
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 13:37:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D0510E77E;
	Tue, 16 Sep 2025 11:37:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="R+aYzdaW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73EA910E78A
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 11:37:24 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G9btkj001512
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 11:37:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dxuG3uBlvh++1t244lhPvOvJ9hQr+cTrRHwr2AleVfc=; b=R+aYzdaWE7qzBzkZ
 3r8dVPKPTpL4moVEc6HwWBv+qSrCNTLvNl35lEKrn4LUghk4F4fzy1PjdnTK8bda
 JeUCewIXSOp536KIXjizho3QyHA+2pkQLBkXUfiFK/kc2u4hwGfgj+sHV5crylVN
 yMpub9dvQ7B8Ag4DRg7j7LwqiYcD+gf8d42lYs1WKnSdRWaAAay0wq9Jh9tD2GLz
 IRBxuf3ptYHZc+ZjtYO51t5H3L6e5WTqYPg6SNhN39/Ht4sNWMzc8COFC3tjZh3L
 ASai/UdeM6K+dhaBPWT16P5Z7ip1DXt1ZbWyOTb7ze3moEwyMtpaIg16pc+8Su3M
 iH7R0w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495eqpyp91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 11:37:23 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-775a4b30153so53683646d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 04:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758022642; x=1758627442;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dxuG3uBlvh++1t244lhPvOvJ9hQr+cTrRHwr2AleVfc=;
 b=vyXTO/+O+SOEBVRJRpn2Ef+jXlIxtulocWSyVzeBinEkuLRfiMCvCke5j2KHsOY0aP
 L1LK/VOb+NGQwS0IuuRgWwVYu73AjafUJ5VOPYLJILdVMhFg6DC9oBRSp6Ped4RnnSbm
 CjKaSi99pbS75x/EJAHU/YSboAzjc6seAsqp+kODKOt+fEX4zyADdj7/XLBNC+lYYe5s
 qMCObhISf7dGr+3VChj3ctXZg6PQWRmjc1idVqomwdPdfM5mU7OJpXBJhcXADOW+ITho
 wmohh4TdCOPCqs+KKftmQ3JF7/OS0aoqXCPfOF7cVQ+SKshm/zxetJVx+2/6SnJNR9Ct
 aQhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrikE7kjtUVUy6V1ciNf+nW60bJ0NAqjKsxTUJGytew1EvQ8OR8HBYT7xnFuHGzzUa0r0A3YRigII=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvGgXhtXSuTNgsmZtt0j6x5Df3auIoW32u9uL18X8fX/NDW3Cc
 nVF7xxvCl6ihNziqBFnh8Axy48qABgsb+oqqhudn81h58m6k6QBBe/3zCtdtVDe4WHCRab92hQi
 rrtsXs6UHU/Av9mY9KVVo9Xouoya2lF/dTrgHvwmCEeNAL+0kOgaEexNvj9MNozoGzK5ddjo=
X-Gm-Gg: ASbGnctBqUxs4mvXXjn+VQMEHwE0wYYYOOheVvsqdeuo2S2p4mzc842umIRUpuXkh4Q
 zkw9dlMi1vR2q+Pf0zEUJagDUzeaHDAOU3y95TlXH7jzBPV+sgrzwPAV617ZZ9KMZiG4aKGe521
 B6OL9sIWEfKXQcw7B29CUli9kpyyPbPFjsjAPTBBB8Bf95qtI4cvBMhP8Ajual28wPfoNzGIq+w
 xgWULyGF7jGfFUlVVaqMldYcKf8x9J25Wvwy39c4vVZHfpNRSTvfImKJt2PsHUwnUtV/tBMwQra
 hLp3OryZ5JjzlIGsWUkx80mcrRhsXPMnW6pOs8eK/1l/WtoJRdTmNApPZn3dtTMFc4hxwSyYFXP
 sX0d+g240qEjTS8YCAkgyhDBNzj0oa2adVtPDATZ7l/IWaoerkYu5
X-Received: by 2002:ad4:5ded:0:b0:72b:5e4d:d41e with SMTP id
 6a1803df08f44-767c69580d5mr201007996d6.60.1758022642167; 
 Tue, 16 Sep 2025 04:37:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxRVjbeGA3MMhK0y7Gk1lUdDnWFrfIP3SLf3A/hUrKPUgKEZcoUaquPXGhgx/yv9i67CvOTA==
X-Received: by 2002:ad4:5ded:0:b0:72b:5e4d:d41e with SMTP id
 6a1803df08f44-767c69580d5mr201007116d6.60.1758022640778; 
 Tue, 16 Sep 2025 04:37:20 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e5cf300b7sm4379319e87.45.2025.09.16.04.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 04:37:19 -0700 (PDT)
Date: Tue, 16 Sep 2025 14:37:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
Subject: Re: [PATCH v2] dt-bindings: display/msm: dp-controller: Add SM6150
Message-ID: <qnsxykukg3kigfiihdrrjkp6sbm4qte6lsga3as7eg3xaodtlt@skg5tcp4htii>
References: <20250916-add-dp-controller-support-for-sm6150-v2-1-e466da9bb77d@oss.qualcomm.com>
 <5sg43rsun33i6bm3vz7io7yx2p4m7bmk5bnrnjg6u3zrulyofs@gyxtnfs4gvhz>
 <d302e71f-19bb-426f-a7df-c0d7854e97af@oss.qualcomm.com>
 <67a06487-001a-4af7-83cd-e9d05d848479@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67a06487-001a-4af7-83cd-e9d05d848479@oss.qualcomm.com>
X-Proofpoint-GUID: bfZFpTJBfSmmE0M0-Lx1dhXpzY1dT4Ea
X-Proofpoint-ORIG-GUID: bfZFpTJBfSmmE0M0-Lx1dhXpzY1dT4Ea
X-Authority-Analysis: v=2.4 cv=XJIwSRhE c=1 sm=1 tr=0 ts=68c94bf3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Cl27WJnY82uGaOAjgZAA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDE4NiBTYWx0ZWRfX/ZEqIu4ndZRQ
 pFZtKUWDFrG0ZeCBNi3KF50lg7HeAb6s61cl4JwBHZkMp0w9QyLizXhaCjEOl7KLe2b0iQvXrXB
 wRKxAYSdTXJbGZ+wui4lRABwzdqEEbKLbaKSRBAhcTAHijK2RPUR5Wxaa3CMbVMbSnrnlTsNID0
 nCYLFSRkL/lEx7pwk6HnlX/B1UBvKbcNXL67tN4g45azYqlJHfZux/beeHQPwhXjlZecYHNgE67
 5t0Jm4EsrT+WYIePQ09v0Ef2x994ywuU0p139M0TISMjfxMMP2VEGcWjF/XVBaa7yXRQgCP5HGV
 PrJIT3cJT5skgqNwB4zTsdp9SsOEJL6JeP6Jda5vQ5WekJiwB65D5nGfAHZZNmWVtJYyKPfwRQp
 n6Abb+HC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130186
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

On Tue, Sep 16, 2025 at 07:34:52PM +0800, Xiangxu Yin wrote:
> 
> On 9/16/2025 7:25 PM, Xiangxu Yin wrote:
> > On 9/16/2025 6:22 PM, Dmitry Baryshkov wrote:
> >> On Tue, Sep 16, 2025 at 03:31:35PM +0800, Xiangxu Yin wrote:
> >>> Add DisplayPort controller binding for Qualcomm SM6150 SoC.
> >>> 'qcom,sm6150-dp' uses the same controller IP as 'qcom,sm8150-dp'.
> >>> Declare 'qcom,sm6150-dp' as a fallback compatible to 'qcom-sm8350-dp'
> >>> for consistency with existing bindings and to ensure correct matching and
> >>> future clarity.
> >>>
> >>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >>> ---
> >>> This series splits the SM6150 dp-controller definition from the
> >>> '[v3] Add DisplayPort support for QCS615 platform' series and rebases
> >>> 'dt-bindings: msm/dp: Add support for 4 pixel streams'.
> >>>
> >>> The devicetree modification for DisplayPort on SM6150 will be provided
> >>> in a future patch.
> >>> ---
> >>> Changes in v2:
> >>> - Update commit message and binding with fallback configuration. [Dmitry]
> >>> - Drop driver patch since SM6150 is declared as a fallback to 'qcom-sm8350-dp'.
> >>> - Link to v1: https://lore.kernel.org/r/20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com
> >>> ---
> >>>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >>> index aeb4e4f36044a0ff1e78ad47b867e232b21df509..82481519005a1b038a351aa358b9266239d0e8a9 100644
> >>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >>> @@ -46,6 +46,7 @@ properties:
> >>>        - items:
> >>>            - enum:
> >>>                - qcom,sar2130p-dp
> >>> +              - qcom,sm6150-dp
> >> In the review to the previos iteration I think I was a bit explicit:
> >> "qcom,sm6150-dp", "qcom,sm8150-dp", "qcom-sm8350-dp". You seemed to
> >> agree to it. Now you didn't implemet that. Why?
> >
> > Sorry, I misunderstood your previous comment.
> > I thought the recommendation was only about the commit message, not the
> > binding structure.
> >
> > Does the current implementation mean that qcom,sm6150-dp and qcom,sm8150-dp
> > fallback to "qcom,sm8350-dp"?
> >     - items:
> >         - enum:
> >             - qcom,sar2130p-dp
> >             - qcom,sm6150-dp
> >             - qcom,sm7150-dp
> >             - qcom,sm8150-dp
> >             - qcom,sm8250-dp
> >             - qcom,sm8450-dp
> >             - qcom,sm8550-dp
> >         - const: qcom,sm8350-dp
> >
> > Do you mean modifying it as below?
> >     - items:
> >         - enum:
> >             - qcom,sar2130p-dp
> >             - qcom,sm6150-dp
> >             - qcom,sm7150-dp
> >             - qcom,sm8250-dp
> >             - qcom,sm8450-dp
> >             - qcom,sm8550-dp
> >         - const: qcom,sm8150-dp
> >         - const: qcom,sm8350-dp
> >
> 
> Or this?
> 
>     - items:
>         - enum:
>             - qcom,sm6150-dp
>         - const: qcom,sm8150-dp
>         - const: qcom,sm8350-dp


Yes

> 
> 
> >>>                - qcom,sm7150-dp
> >>>                - qcom,sm8150-dp
> >>>                - qcom,sm8250-dp
> >>>
> >>> ---
> >>> base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
> >>> change-id: 20250916-add-dp-controller-support-for-sm6150-525ac2ed8c86
> >>>
> >>> Best regards,
> >>> -- 
> >>> Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >>>

-- 
With best wishes
Dmitry
