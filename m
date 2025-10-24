Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C98ACC0554F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 11:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC4B10E9FF;
	Fri, 24 Oct 2025 09:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QguF7XEk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A05F10EA05
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 09:28:29 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3GBFm022251
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 09:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=zGkcT0F5HdfRvmdgOmrFrIfL
 DkdtJXkgEZhfMIxuKyA=; b=QguF7XEkUeOh2E3pknh1RhOE8KhIQT1c2uP+IQ0G
 zX/1juHpOOEgEAb2n5P9kAUK8s7h/r/ztfyqrAjbkoZDG/QlE2jUapvWcUZ7+01k
 IpUUGvjz7ZBKuL/vEafSBXLPqVZcft/UJlDHrY8ogrgd3k31WJtotb9RXel5w+Nt
 0crZWgRXZMURhLZDg0xZO/c80EjdibmbPGGwqO2U6xm/OYF+YCV7jsFsFGDsE0y1
 Sd5iNhe+3glckfGyogGvxX912c1IsECwYnzbfIdVZ5jeiv5/5N9uZFl1zWzeRAQi
 OCxz2WyWH1NVxvk9mdU6hMl5AP8n8YOg7e4YzonE6ynTCQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0sh2t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 09:28:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4e89ed6e110so49581901cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 02:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761298108; x=1761902908;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zGkcT0F5HdfRvmdgOmrFrIfLDkdtJXkgEZhfMIxuKyA=;
 b=OfEca7o6U7s+3BnBfiZvs/cHiUGH90FUhimIknoTC3AxPxeRbS08h5gRT52dilnmn3
 soA5C5XXQBrquFcyR0EeMwcKwzPjqrnxiU79gpG7GmZeT9eCIwqhOLX89byXue+OwAEX
 de841+11WpLuHkLBBHI0mk/hPPr3SR2s+ux/1JFNs9IWYhjGIqD9vL2j7qoiaDD6gSyN
 0OGDcAz2MGlgOt4WKjqMEz9RplJBCoUHt++cyK0jq0PUekVQ8Fmqao1F862ykWPIvRlf
 cSREsRkILFvOxnvLhvTX56Kq3YPc/NAJ6Yn2AzW3Itxhf4CMLLiEdnFGnujVbzZ9wUUV
 1kRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPE+zgU7ouYZx6n6g81KPPvEsXKqDHQNIACkOb0wdhmhYxlFNNvxMLsnwEg6j883E53+t4DgsE9d4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwohVEktGGI3TLCU754kRTNiNylzVQWFm6XZO9niq4WEJZNwiOz
 SBtwKzFkREj+kqz6K0pkMbPMooquo+zT3JlV46HriSWz9R/a6f18ysKCnZG4jnNRQJvy1kHBQED
 nacwRzx3uI2TjCtxGgw9yECLJsOR/0rRrg9pyT4g7hwjkhMIbdf3oh6Zq/zxtj8OgKBznM+w=
X-Gm-Gg: ASbGncvRypf42EV7jkpq7k1G1f1bI39tIi12OEGkly/ToO/qOdOoUsZcKykIS8LTISy
 xCUHESFxOt6cRDRWjgOSFJ2gpsfKE8qFYEQg734R3fuJzXhc90zkAvVuy4LSWRHjX/2w4umVuf4
 elFizLxb3KzmUjNwvXixGJERCYftx3nKc5p+yO++TkQzdYMLy1IM7tTB8XKEyrsyhpYnaBTHbmK
 Quvh7rOjKzOQKVwvSXgvtPQdS327tpd6F2iZmu4CcAvInRMnECtIVH33ySM+nAyIxaQ74lgBSve
 mR42sMbt0mX+4YqfwG5HteE0du2AtL1u1gPKYHkOMNibAHmhDY5V6BB6CZ7TgGRfW3l5sD9Howy
 23dWe4rGpZ5Xji4hxnhopV8uQjJP/kp/1zpgknhWjkXrdVrUcgGnot7YSQlmVZQTUf7Z5kIj9XW
 cXeukjJeV38Jwn
X-Received: by 2002:ac8:5881:0:b0:4e7:28c4:6492 with SMTP id
 d75a77b69052e-4e89d2e9159mr345061891cf.35.1761298107563; 
 Fri, 24 Oct 2025 02:28:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGg7yl9p+wm1YmrVjaFh115CT4BHZ4Az1ybfHc7KF6ROWYFgbMv01hIcBHSAkMse1hgWxSIKg==
X-Received: by 2002:ac8:5881:0:b0:4e7:28c4:6492 with SMTP id
 d75a77b69052e-4e89d2e9159mr345061771cf.35.1761298107121; 
 Fri, 24 Oct 2025 02:28:27 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-592f4aded51sm1489790e87.23.2025.10.24.02.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 02:28:26 -0700 (PDT)
Date: Fri, 24 Oct 2025 12:28:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH 3/6] dt-bindings: display/msm/gmu: Document A612 RGMU
Message-ID: <qcs6y22hozfmb2ipmahfw25m2xti2gr5kjn43c2woiueqe4xmd@ovnrhwibhhe2>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
 <20251017-qcs615-spin-2-v1-3-0baa44f80905@oss.qualcomm.com>
 <8f3f4874-2e82-473e-87bd-e3bd58089b90@kernel.org>
 <181af756-09a1-4694-98c4-53cea556e172@oss.qualcomm.com>
 <ff37b635-b3dc-4180-8eae-e798ef6ce55a@kernel.org>
 <f677f8ee-d635-4131-8ee2-8ca6ead43095@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f677f8ee-d635-4131-8ee2-8ca6ead43095@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX2q/0AgPJ9s++
 +MMRUc5Lxu8zIMR2hjdYLOz42jziASktIQsqn3/0gfYVdCggRjZACGdt33/m0tvmm0JoXV1Wb9v
 HCNInMopgySH2fuNVFLDkhpum8tN6EByJhZci/iSEGvOz61cElCce/5IYVCd9wDscUmMD2pF1Th
 PZZl0AV9bdEvePHL/YLgqCHTjeOrgeso8LcHo1cpO7ivwmeT/AEOAzXkUW33QuywDS8g6ct36m8
 mj7XE9RQh1aNOHVyOABW7LrD5xw/XWwS4eaRG85r1IizPp9qkH8MXl4qf4iRSQb0r1/73SKvHvq
 DesvAeKz8Ix35Aj1ukWDUZFwON3zy0kAM+DRxm5HrB4QEptbWTCl3lkn5CeKOmxHwhH3Ooz/u54
 yN8y1GSanNCAhWDV2N5parh4ywX66Q==
X-Proofpoint-ORIG-GUID: NORWmdehNeqpK61-JAXv7kJnT52-9Ni0
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68fb46bc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=QZfYkoQWqmGXo21g0SUA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: NORWmdehNeqpK61-JAXv7kJnT52-9Ni0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167
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

On Fri, Oct 24, 2025 at 04:33:28AM +0530, Akhil P Oommen wrote:
> On 10/22/2025 12:49 AM, Krzysztof Kozlowski wrote:
> > On 21/10/2025 17:51, Akhil P Oommen wrote:
> >> On 10/19/2025 2:43 PM, Krzysztof Kozlowski wrote:
> >>> On 17/10/2025 19:08, Akhil P Oommen wrote:
> >>>> RGMU a.k.a Reduced Graphics Management Unit is a small state machine
> >>>> with the sole purpose of providing IFPC (Inter Frame Power Collapse)
> >>>> support. Compared to GMU, it doesn't manage GPU clock, voltage
> >>>> scaling, bw voting or any other functionalities. All it does is detect
> >>>> an idle GPU and toggle the GDSC switch. As it doesn't access DDR space,
> >>>> it doesn't require iommu.
> >>>>
> >>>> So far, only Adreno 612 GPU has an RGMU core. Document RGMU in the GMU's
> >>>> schema.
> >>>>
> >>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>>> ---
> >>>>  .../devicetree/bindings/display/msm/gmu.yaml       | 98 +++++++++++++++++-----
> >>>>  1 file changed, 79 insertions(+), 19 deletions(-)
> >>>>
> >>>> @@ -313,13 +360,26 @@ allOf:
> >>>>            items:
> >>>>              - const: gmu
> >>>>      else:
> >>>> -      required:
> >>>> -        - clocks
> >>>> -        - clock-names
> >>>> -        - interrupts
> >>>> -        - interrupt-names
> >>>> -        - iommus
> >>>> -        - operating-points-v2
> >>>> +      if:
> >>>> +        properties:
> >>>> +          compatible:
> >>>> +            contains:
> >>>> +              const: qcom,adreno-rgmu
> >>>> +      then:
> >>>> +        required:
> >>>> +          - clocks
> >>>> +          - clock-names
> >>>> +          - interrupts
> >>>> +          - interrupt-names
> >>>> +          - operating-points-v2
> >>>> +      else:
> >>>
> >>> No. Don't nest multiple ifs.
> >>
> >> I guess we should split this. I will add a 'required' constraint to the
> >> rgmu constraints above. And apply the below 'required' constraint
> >> specifically to 'qcom,adreno-gmu' instead of the 'else' fallback case.
> >>
> >> Please let me know if you have any suggestion.
> > 
> > Maybe the binding is getting to complicated and RGMU should have its own.
> 
> There is just a single chipset with RGMU and we haven't seen another one
> in the last 8 yrs. So it is very unlikely we will see another one again.
> So I feel it is not worth splitting this file just for RGMU.

I'd second the suggestion to split the RGMU schema. It's not about the
number of platforms supported by the file. It's about the clarity. I
think it would make the file easier to read.

> 
> Let me send another revision and let's take a call after that.

-- 
With best wishes
Dmitry
