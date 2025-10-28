Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1D4C16B12
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 20:58:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1867A10E0C1;
	Tue, 28 Oct 2025 19:57:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UHhMVulV";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDEqIpfp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B2610E656
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 19:57:50 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJlPqZ2502839
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 19:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 D6VZKEn9mknAk1r90YKOpNGy35ExdR8YFK78o+x3tCs=; b=UHhMVulVkgHJA+O9
 X6ac5szrW0Z4VNTvJDBJMnDs3jnixW5/qa05NeeBzC1DKxQqeSZ4x7tEPRFM7v8X
 FShBg/vud9ND4ewHLDWYd/mVaX2zh4uIAoSWzdRDwGeOW9Dp3FOnYHXek7hJAVaU
 5Q3L2PSf9DQ6QJo9xOFiRkGNSOsLo6YHER8fzKLf+HtSIrEAUyi8G5M3JSGvOJsN
 Q+azj3WtF2DHS0PpXutHWeG3NtwqJUxMwLWqt8JjJInCh++Qrnq2X8QvF54uHbtO
 7o+wcI6COwygvveJDjbv8RpDAil9plcXuhdVsyPQbDkToUg/Dj7GO3nsLANc03Ww
 1x4Pww==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1g0q7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 19:57:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4eba1cea10dso197691911cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 12:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761681469; x=1762286269;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=D6VZKEn9mknAk1r90YKOpNGy35ExdR8YFK78o+x3tCs=;
 b=TDEqIpfp/ETrzpLrkR/lqADtRFTbU2a/pT36oifEpfstHxmuSRzBn2GcQVx1ljqoQq
 EQs2NsXgxerOt2KmnaLejYtGmuz3YvCpLzrCvGSHK4k8GbhehfCbZFqRKkDYLs/Jk1bT
 l4osPTupx/yQ5ROuFWpClHihWghfHX2PeU1OeB4eKfTz4ENEFmwBwv9+bDOG9FoY3FhL
 +FZ32N3XjldYEudbGC+jKidQW5omeH1a6uyRAo8h7MCuz0yPpYzCEtcePXfZBXiKkXou
 GWii6Gr2k7C6lp22weIg0MmzRzj4TaGK4RVpxtWY8iCNYt/Wd6uY+9gkoTFZ5DC36z50
 6ScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761681469; x=1762286269;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D6VZKEn9mknAk1r90YKOpNGy35ExdR8YFK78o+x3tCs=;
 b=VBpF1FZ7eO16+NJYTKngDJ8egqZzJlbHlF1iNw0HtgH+fVOResPZ69+OpiqvY1+mLL
 AC2Os1Dmp/QIPFKZ73/M1Bxd2sXq3kahaCb3tz89R1Gs3n23kselTDcxBxfDZcj4fBt6
 d2InCeSghi590u7OiZOYQ7szOWj13e2JELKAqxWttW5ZQCJf348OoLuFCC/cN3IsuVlA
 NgfmIG8UxobzFV30GLFtLmXt1p1zGa2qRv2A8xL0x04RiRzL0YTO1QgJn3MwdW7XoKjJ
 Hx3RSXTlqbM3EeeHRXXiQE2aGptD4mhKiuILvGyFt2S1Pv1KdkqEq6AAJ9ZySf/MpFE7
 Bhlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKRB7Li2+FF5IZDrAYs5dUNVa4PcQ+XMUYJAySZm2JRt7yg3nmDgSaFQSrbHEEe/lmIWTVehB6blc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywe0++KaZgwxtJeArByJiSbr7zDS9C3fdItAxuXVrl7sReVSpuC
 tKvxNp+T4ssUagKbjcOqcYt6ApQU5Ct1ZpxlWsdn+VjRQObUbTiPAYi3ZyXt97kfzEgCFHXV+Z4
 u+8EK2MrY2X4KoxkolrrOS52fFDZxs4m9KO9D8H4zUrxEYJP734Gkw/ukJ1jQKhUPwe2KeH0=
X-Gm-Gg: ASbGncs0vHorEJiGQ8b85/69zpv/Mi8y5xxIGH/4yGXN9uW1iAVgaYdUEz3JEnmEqNG
 WFqwplrNDFMVynFiF1O/898RRMnztmuEIdKkZnAjBySP3YEAoKyWojgF3zccWvxK2OGHqEIswe/
 DiH/ZGmRqOT4NxuYxVG1/wgGTMwomZwX5JJI05WyJs3dPqO+8gKsemEdaauSy4grpm9TJD4icOj
 C8iN1gJQ+XYE12tZ22yc6zgWDX5bn11m5brQX8EYuDT3GSwLKERVoNgeRt8p8zFR71J30J9FArl
 6fvU+0fAEh6m4OpaK/ynaauGLgiIIGCHgG0ZJ1AtnIxmWxA949Y0zgSEAjRB/do2Nlz8mldqRpo
 g+CUBdar4pJ4VNIxg3dot8hPqSZZgM95hl1m6YiMpGkoqRca5Q4kV/nrpemRigIrBPgwzHeahHe
 zxF0xeZKaET0zE
X-Received: by 2002:a05:622a:514d:b0:4e8:aad2:391d with SMTP id
 d75a77b69052e-4ed15c4748fmr6727211cf.75.1761681469437; 
 Tue, 28 Oct 2025 12:57:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnWHRjVfSuZFrm84Q00tQxrmEsW1azjVpDihZ8mio3/6wz4xCAvAGLduksdpAN6IyL1yO2mQ==
X-Received: by 2002:a05:622a:514d:b0:4e8:aad2:391d with SMTP id
 d75a77b69052e-4ed15c4748fmr6726941cf.75.1761681469012; 
 Tue, 28 Oct 2025 12:57:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59306b82de0sm2421121e87.0.2025.10.28.12.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 12:57:47 -0700 (PDT)
Date: Tue, 28 Oct 2025 21:57:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
Subject: Re: [PATCH v6 1/4] dt-bindings: display: msm: Add SM6150 DisplayPort
 controller
Message-ID: <2rvypo4rvvjrtnjow37vfqifbkr7gfra5n6rnrshubtk4nxt2w@uan44zq44iem>
References: <20251024-add-displayport-support-to-qcs615-devicetree-v6-0-c4316975dd0e@oss.qualcomm.com>
 <20251024-add-displayport-support-to-qcs615-devicetree-v6-1-c4316975dd0e@oss.qualcomm.com>
 <20251027152647.GA915648-robh@kernel.org>
 <207641b8-c272-46d5-a459-eb720a4b94a6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <207641b8-c272-46d5-a459-eb720a4b94a6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=6901203e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=zlLbQ5bJCEovvze19KoA:9 a=PRpDppDLrCsA:10
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: RMPAiwW6nPNHKcU3SEExdIyvQdCPcmav
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE2OCBTYWx0ZWRfX/J1U+VzBepzN
 G0FFRra1p1jrRNcegcp36QS3MJTaBcV8olXxJ5I4PsovhM0TCRkLuxYpzUSAPF3g2AoVNNv2fFv
 4IwZ0T0Lcb+CQqCEF6LYLk/gzG3NRwrowSFpt8JzXTrBPMh/s7yTon5OXeQhgwOcS3zseFXOtbA
 AlG0JNlImSip4ZM4f6nmPbgomeFhnsBD4oMKBdyiWPo7czdrNECWDahcz2q5H9DPoiFo+fLizZs
 kiRiHzLlKz8Q2j6jLtz2+UMHyW5SJiHul+RKecMDdBYbqiEKw/ek2D3SROP4tAY6AAJXZvg7Bin
 4cHZVu17dP4ETGr70wLoEvOR+96AlaNDmDfcv/6nXOiy40cA19gtBq3PMLHNUBnaRW4WTpTpInL
 4NwYB+bo+jqdvhcoUccCSlkrrKoMpg==
X-Proofpoint-GUID: RMPAiwW6nPNHKcU3SEExdIyvQdCPcmav
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280168
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

On Tue, Oct 28, 2025 at 01:06:52PM +0800, Xiangxu Yin wrote:
> 
> On 10/27/2025 11:26 PM, Rob Herring wrote:
> > On Fri, Oct 24, 2025 at 01:21:01PM +0800, Xiangxu Yin wrote:
> >> SM6150 uses the same DisplayPort controller as SM8150, which is already
> >> compatible with SM8350. Add the SM6150-specific compatible string and
> >> update the binding example accordingly.
> >>
> >> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >> ---
> >>  .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml      | 10 ++++++++++
> >>  1 file changed, 10 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> >> index 9ac24f99d3ada1c197c9654dc9babebccae972ed..ba0dea2edea98cee0826cf38b3f33361666e004a 100644
> >> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> >> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> >> @@ -51,6 +51,16 @@ patternProperties:
> >>        compatible:
> >>          const: qcom,sm6150-dpu
> >>  
> >> +  "^displayport-controller@[0-9a-f]+$":
> >> +    type: object
> >> +    additionalProperties: true
> >> +    properties:
> >> +      compatible:
> >> +        items:
> >> +          - const: qcom,sm6150-dp
> >> +          - const: qcom,sm8150-dp
> >> +          - const: qcom,sm8350-dp
> > The actual schema will check the order. Here, just:
> >
> > compatible:
> >   contains:
> >     const: qcom,sm6150-dp
> 
> 
> My initial plan was to use only `qcom,sm6150-dp` with `contains` as suggested.
> 
> But when I tried that, CHECK_DTBS schema check failed:
> ‘displayport-controller@ae90000:compatible: ['qcom,sm6150-dp', 'qcom,sm8150-dp', 'qcom,sm8350-dp'] is too long
> from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm6150-mdss.yaml’‘
> 
> So, I have added all.

Please use properties: compatible: contains: 

> 
> 
> >
> >> +
> >>    "^dsi@[0-9a-f]+$":
> >>      type: object
> >>      additionalProperties: true
> >>
> >> -- 
> >> 2.34.1
> >>

-- 
With best wishes
Dmitry
