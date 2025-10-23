Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 944F7C010F7
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 14:18:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB2910E3EB;
	Thu, 23 Oct 2025 12:18:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FTtuAEou";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A73910E3EB
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:18:00 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6cCon005645
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ROFrsQyZm8CifMY+KSTeuljF
 MGnyvNU7m+oJiV21M1s=; b=FTtuAEoupXC5vdrrdyN6IxcUq+6yZemCgio0oCQD
 O9ESPbFCoEwgoO2OgxMOD4PaaBGiBmf+bgtaj2PgIlTDRyDIqGK4mBVXszrWVpUR
 UUNWk3SbmrypTznS/u7oqEM+4wMx0ut7ONpVxXg0S1wqoD20QmgEhwYQAsFiYupQ
 7U7+ivuGwHVztmvC9c1vPYaBbzh/OGrF9se0c4J/FISDE2dUOihmXbGmNDOgROpU
 bDzmlbt3MaYIQpFWQOYba6m25ah6FsUaWCdo7E6R36UNxkqTdMWoFG2lADYTOVKh
 fwwDNkgqpLrUA4yQgPu/k3l1cBeuD+I5TmTZKWRZFYhI6w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j89ar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:18:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e8aafb21d6so23694321cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 05:17:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761221878; x=1761826678;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ROFrsQyZm8CifMY+KSTeuljFMGnyvNU7m+oJiV21M1s=;
 b=uooDw+4Exshis7CuV3UWIBuibedInMf/GrFiH4bIZ5K5qIYji1ufDdRNDsbZckCRWA
 f/ukhCKgKf2ZfFv07QpjqGa2IamNPb4Jk0v/KSIZmM1rY4lzwRFYC+vlPi+MbgIByFPb
 8Mp39QOmqLEY9hgy/dtf7okR3ng7zUvDwnF/sKpIdc0UJcNOfsF2e1nqz3Itt5INkJuG
 9Hah2xvevr14dd+R8AXfQ4bDEyZxupTcGzbMCvLoqoHlfc583ln7sZmIqmDuu2I5pwyy
 bjZjPPT9WIWgEi+nMe0S+s4BUthEXx7ZJnlQ4XQCgtWEu59uZkfdYRJW8cKE3ek310Qz
 b81Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcLQWkvIG4GBrE38FDFucgSHU+o/L7GEN3bH7wqR3GFmK7SrE4akpQIapNAs95JTE0hnXk5yWzkzQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEkkrxl43nwJbO2RaiZvLauiFA56w1VOMoRy6T8l3J7j7Hv0Dx
 xPpEG5K8Bk7anUM76NancUtWeTo4FNJtJg19MAC69+t99Nn+pnjmh+HrelNLecmSXi4E5VtnZvM
 PkpJpai/lchDh1RkwzRz/qC06dRJE/0hn9p/0XJMMZm/nf1SGSavOF+5FscttWg/FcIWM51c=
X-Gm-Gg: ASbGncvNhkmIMB7rDR8jvVe545MtyZnimNbmdWxCE8fAgUqvg6KsGoEmLEyqvzo964U
 nevhH4tQRAI7bqHE8fiX+jZqsF488uiqg+2pft3iX/kePEILCVD19A0jlIYu4ybO1lzA3xIHgDv
 bBbBpfa4GYR09r1JGos7Slnq8fhABgS1Ak9NzMZVgiWI+kdk4aWrC6WX/mL6M/fkMtNhUNOn3EM
 pWSbeVrf8V5tMj7AwRSQYRlCFaH4kXl5LHLdHhrCFdaEAS3/Em0MNPUOg+JAqeoYjOPI1fQnvqd
 JiRhd0abe/aJKq9dPFq6GaSKuYRpUxChNX4ATaEFbyowAFJZs008vbv6JZrVRXVJ6qInkb/oydn
 54K54QbTS4PvICgjVeKWlcObcGB1oQrkOICUqYt1uaj2BFPa5KbYBAQLeoRbt354aaWwQrHk1Ix
 PzFL1hrpLZMSym
X-Received: by 2002:a05:622a:1b8d:b0:4e8:aa15:d927 with SMTP id
 d75a77b69052e-4e8aa15d9bfmr268551331cf.47.1761221877845; 
 Thu, 23 Oct 2025 05:17:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEM6vcDVrWNof3DbeXJ3ZyXrq6655uWMwZz0bKDp8nNSSm+wXht2S5o3XqgeX/K+hhx91DY1g==
X-Received: by 2002:a05:622a:1b8d:b0:4e8:aa15:d927 with SMTP id
 d75a77b69052e-4e8aa15d9bfmr268550861cf.47.1761221877374; 
 Thu, 23 Oct 2025 05:17:57 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-592f4aded25sm697972e87.16.2025.10.23.05.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 05:17:55 -0700 (PDT)
Date: Thu, 23 Oct 2025 15:17:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
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
Message-ID: <3jjgcha25ieekpulyc64gafyg56n66emr2ibmtdyugfsm6tjvh@rkhrs474vgdc>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023081736.1251-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023081736.1251-1-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX7oLfp/9UVxLx
 ZWZEew3oXCYBgrm0ANQ9JohXzMrIyuVWBWB1/3yBHfRD5MY+a9euAoq2nkiMml7bJe2NQjoRv2q
 cfwc8prjxQppmKOVF7OKqniQjGmX/4obY6ozrPdeJUVNTKg6LpnyYpPJgSHUEN6oNeA5PzjDi7P
 X08GQ/r3Z1MfPvqIR2HpquI+/NfjaWiSyFMksOnyfjTkyhe4xjQmEHof6p7uafWPXGYA1rxQdUz
 43cDmadC1qH5UzYkRfAup9ONAxBi+TTpxKSJIUTI95BP1BXDaTTYM2JxYT4tUlQ9VJnKiRid/6H
 c9iqR3Bg6V/4V94l5OQ95uqECXZzfV0fSDjhhgG7ZGSSZskl+p7x10B0OP1KkwcbDqQo9ZNAZZP
 8wawmirW8OX8z954qVYoAMJKucHYrw==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68fa1cf8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=UAfhHCFBB_nVBZkyMDUA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: ENjMEv1jCPLXCCMVPfbonlU19GT8ux3x
X-Proofpoint-ORIG-GUID: ENjMEv1jCPLXCCMVPfbonlU19GT8ux3x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018
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

On Thu, Oct 23, 2025 at 04:17:36PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add MDSS/MDP display subsystem for Qualcomm Kaanapali.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  .../display/msm/qcom,kaanapali-mdss.yaml      | 298 ++++++++++++++++++
>  1 file changed, 298 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
> 
> +
> +  "^phy@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        const: qcom,kaanapali-dsi-phy-3nm
> +
> +required:
> +  - compatible
> +
> +unevaluatedProperties: false
> +
> +
> +            mdss_dsi0_phy: phy@ae95000 {
> +                compatible = "qcom,kaanapali-dsi-phy-3nm", "qcom,sm8750-dsi-phy-3nm";

This doesn't match what you've written above. Was it validated?

> +                reg = <0x09ac1000 0x200>,
> +                      <0x09ac1200 0x280>,
> +                      <0x09ac1500 0x400>;
> +                reg-names = "dsi_phy",
> +                            "dsi_phy_lane",
> +                            "dsi_pll";
> +
> +                clocks = <&disp_cc_mdss_ahb_clk>,
> +                         <&rpmhcc RPMH_CXO_CLK>;
> +                clock-names = "iface",
> +                              "ref";
> +
> +                vdds-supply = <&vreg_l3i_0p88>;
> +
> +                #clock-cells = <1>;
> +                #phy-cells = <0>;
> +            };
> +        };
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
