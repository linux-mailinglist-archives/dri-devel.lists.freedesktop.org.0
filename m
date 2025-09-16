Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EB5B59B90
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 17:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B288410E0FE;
	Tue, 16 Sep 2025 15:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="d3oPnFiD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB2210E0FE
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 15:10:50 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GAFex1013413
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 15:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=g1Z+oPGXQpLxnAZpBbOZ/u5c
 mt3wM5YUAcTV6PLokuA=; b=d3oPnFiDYbzgsQw8vdiCpR76ns9JcYMBKPVaX3jd
 gApfGla58qI5RqlUdRsrwP7l4h38RQrOVWEJBaA7Bjpw152xxSpJgj6FM4j/pAdW
 E0rO56RTTKFDdrN4AJMSCnu3d6XIFwbmp0drBaztN2DdcT02u7WDNv0uGcySfcBV
 C45I9SLbYWWwgJornlsCEjUPpLm4PuJCUHjWE4cn3sIfqehMouKdlJz+68Q5G+M4
 UeZ1GIOQYwZjTl8ojT7PumN5QELIeu0C55hbDAbR5tKe+AHUkkCIJrYjy0kdXXDe
 Q2OlISo6BuWzYQ9jrBBNohaTST6pNEEygFxBgv/5BASWjA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496x5atehg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 15:10:49 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-54a1ea646e9so1532555e0c.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 08:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758035449; x=1758640249;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g1Z+oPGXQpLxnAZpBbOZ/u5cmt3wM5YUAcTV6PLokuA=;
 b=g3RwDAoKN7djJZm5tlZJh1CCB0/D+w+5KBOBmdRh1c1Q4b0KwWQRPVIen7S4wTR+It
 5iT5apRdSoE0+kn5qImLVu68NJKXQTnOpCmsxgANhE+DOK16syjxJKwpl9rBBuCG8Fn7
 NYZm3HZLilNdUEH05OEiY+8HLFlZn++acTDgDL0zF4n4Am0kpS0sE7ge0uB0r6Lk60PP
 skGusiGPSNOiCjptJhfZoHvlvHWYuSc5sr+uND9zjm+7By1OJYP+vMe02AnpH2HAuamb
 uPD+SsAV3uXbKIFccEfLJhWloqqrc/Rc8gscUZihSdiYeNqxApv+87hSjr4JfUMeT45q
 QA4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIoGqIm+wqaL+pKpkiR7JKmSvK7XhtOxcWD7BQ0bFRYBYOba1+Yr71uV8b3WzocyDAcrxYL34FUEk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytafVoFXHb/q3Chet9XNR7vA3oLmOrej/MaD6/7++wRGLp08c9
 +asZGRD6Vs2Mf8DN5G7TsQVSMaK6kIgCveFMiPjwKLv6lz2pN0GvidFxBtFA1GzlPI/B731lYBs
 OVvNOYZtpmotPb5fwYx40wn0T9Krwr9FbgFrK/tKUj6n8Xs4CRV3sd8R0eQM9gZ3gmwjKCuA=
X-Gm-Gg: ASbGncsUR9iey2xTnIpv/d+W2TlZXPsDPKGWU9UJwlvj/Q54AknsBOd62lFFJAgHPPe
 zuprdX9dIw0+0e32aVcD4L6PMv6tRq3S9tUfEFLnLqc1JQfDvqTsXodQz3/3ydfpSZOSkwsFSp7
 Q2f64GeSmdAtKfZCXYxAS/VSTc+uyfJCeux8xQZ81zw4WEKj2C85Vh6U121U6nk2l+fP2M+5eiX
 o22/Spn//hhbeiiTY0II7RowIE7gVDQ4ttYlzlIQ/tIxb8FxVNL+p69tGV2V8Y0q46dwMhQETM9
 /8FgMULbDAvmZjPkkUKPU/IrmC/nqAIZ2xxS+y1oI00uqAbtVhnu5ffIeAMm/D4LYsK6scCdncN
 0yHM1ytKjkFDqEjOumy5nX9wso3ivYZDuVsEimITNzNApIXKhRPoF
X-Received: by 2002:a05:6122:8c1e:b0:545:f023:ac1d with SMTP id
 71dfb90a1353d-54a1699578cmr4957842e0c.0.1758035449037; 
 Tue, 16 Sep 2025 08:10:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOjBcIPt0evZtEawDOU4ceL65KWW429XS23INAGRqTzAWor5/oJYp5i4nvKOrZ/npWDeBcWA==
X-Received: by 2002:a05:6122:8c1e:b0:545:f023:ac1d with SMTP id
 71dfb90a1353d-54a1699578cmr4957779e0c.0.1758035448483; 
 Tue, 16 Sep 2025 08:10:48 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-35e8957bc07sm411231fa.18.2025.09.16.08.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 08:10:47 -0700 (PDT)
Date: Tue, 16 Sep 2025 18:10:45 +0300
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
Subject: Re: [PATCH v3] dt-bindings: display/msm: dp-controller: Add SM6150
Message-ID: <av6zvj7civjycnj7vsdfufdlnpcq4mlpz5cwpamtapzkdqoe6h@rqfea46xs2r6>
References: <20250916-add-dp-controller-support-for-sm6150-v3-1-dd60ebbd101e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-add-dp-controller-support-for-sm6150-v3-1-dd60ebbd101e@oss.qualcomm.com>
X-Proofpoint-GUID: bjDXcomqQ6xciRmIllFdbSlV-WbCj24I
X-Proofpoint-ORIG-GUID: bjDXcomqQ6xciRmIllFdbSlV-WbCj24I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDAxMCBTYWx0ZWRfX2tpHr0rOH+IK
 PR+pS6ULyg6Zb8vovrBm/Wr7oXlTxKjY4zfiI+ZJLduD4xhT5UpSFyCNyBZItSq5OznejBnAKEU
 A1K4Io7tbJUdNFupPkwhhMSjQFRfPVjUUzpYVXfE29p2xX2kzLlZEWDhNmI7J2i4Fj0jjBjy1ll
 OrCZFOt9Uj4m7OTA6dCG64/Q1xjRWWQayegfUWmlDYB4ybc1M5d+Nlzfs86rwX8kMYqxKXIrAgF
 bDtRbvrjudy2NMO9oqhU0wablauSBWbtNn/hWvba9Q7m8JJCoyZHm57rSOs61Y7UHBtVnhM0GVK
 N7/TuBKKJykHIy15P52QhrOl5Lx6CrU06v6DjwX2ORMfnM9Ekqzl+0/d5yR+dUTt9AKhweUBigP
 sIHsjAiF
X-Authority-Analysis: v=2.4 cv=WpQrMcfv c=1 sm=1 tr=0 ts=68c97df9 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kjV3pKRppw1HhCH-an0A:9
 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160010
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

On Tue, Sep 16, 2025 at 08:11:03PM +0800, Xiangxu Yin wrote:
> Add DisplayPort controller binding for Qualcomm SM6150 SoC.
> SM6150 uses the same controller IP as SM8150.
> Declare 'qcom,sm6150-dp' as a fallback compatible to
> 'qcom,sm8150-dp' and 'qcom,sm8350-dp' for consistency with existing
> bindings and to ensure correct matching and future clarity.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
> This series splits the SM6150 dp-controller definition from the
> '[v3] Add DisplayPort support for QCS615 platform' series and rebases
> 'dt-bindings: msm/dp: Add support for 4 pixel streams'.
> 
> The devicetree modification for DisplayPort on SM6150 will be provided
> in a future patch.
> ---
> Changes in v3:
> - Update binding fallback chain to "qcom,sm6150-dp", "qcom,sm8150-dp", "qcom,sm8350-dp". [Dmitry]
> - Link to v2: https://lore.kernel.org/r/20250916-add-dp-controller-support-for-sm6150-v2-1-e466da9bb77d@oss.qualcomm.com
> 
> Changes in v2:
> - Update commit message and binding with fallback configuration. [Dmitry]
> - Drop driver patch since SM6150 is declared as a fallback to 'qcom-sm8350-dp'.
> - Link to v1: https://lore.kernel.org/r/20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

LGTM

-- 
With best wishes
Dmitry
