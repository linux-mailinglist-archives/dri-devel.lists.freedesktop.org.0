Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A0EC010B2
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 14:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4985F10E3F8;
	Thu, 23 Oct 2025 12:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CWyxHwSj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E71E10E3F6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:16:18 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6fEZ5018576
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=9bI46L/4oozpzEJG7ZAsQNzK
 TAJeVoM2mUGb1Do1MpM=; b=CWyxHwSj6udPgRngKWzY6aHNz7/y1XRW7WFZ6w9l
 RlmrmFeJXWPk9aG/2XNfqZM8YBfzklf+n9SJr7RRkaSsv12WCDpt1572JVHPyPNA
 IOK0kiy5iDQPG8RZiKZ2+FsXVkhoeZsj+BXvjQrb6npJj4YU7hfn4W8zMbzmkQzN
 DE9M6ZeGxXhBcKy3MXnVFUQNHTae5VtByMP+JZZU2mIjxT8m+BEO25FlSMkwprtL
 CIzHBGnsmD0tzL6tXq8EIMgFxg+5+Mr+sfOgE1JsafAAXEMRkEL8AzJeY2gw4wI0
 xJRtB8R0PEmJNV+CF6mtBm4wdldEVpLfBdjyBg1LMqMGKQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08prjpp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:16:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4e8bb155690so9810011cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 05:16:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761221775; x=1761826575;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9bI46L/4oozpzEJG7ZAsQNzKTAJeVoM2mUGb1Do1MpM=;
 b=exFWWgFdcBxL0zCb0yxYjUXDcDm6PGvp3wSwj+PBnZshWn4omTMY04QceLwt3VtiBd
 MjHOpdtcgKK8x2ngLb23VhSi9hJVq6UhB4TTWjii12UojWsAm0zS8K4Kw12YtbDG26it
 7bFzk4s+55jd1fLGWBLWCK4TltQscuSnp6rb2lSKBVwqgdjccLEdm4ck+XKMl2tpoo4a
 P23vq3TJF8YTj6ANY2zVXOkBQUA4zajr1cNtev1+Iffs2/oHOWKdsyN5EICeQnJ/nFP4
 Jl6wvEAbAUrk8XSlfasUQREba/52tJDgm6coj4+m6YbYi7MrXjdewVXQNSido+Uo84cX
 o7hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXr8XlD+mkozdNPQfJjH0WAtsNbHBJoaL5JQhbyGPvTu/28McxNtewneBbk0I8Ex0jyfh4A0siX9+o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/erly6tiNhScxb7aP9KRUGcU8sAAS74TttBSr1acKjWHsEGo7
 Z/bJWZGntf+nzupxFr8y+QeueaveyRY7sL6YJqSEMQXKPJG8Yx4pVMId31rFVGGlnv6D+WIAaYc
 GsfjU4gaTDbPrOYwvWiG2+qLWf/qnAlA7H3IHKm57DCjOoXNma9xswfItWX4aVoPfCEaQScg=
X-Gm-Gg: ASbGnctORrLJFreOOLTPeZ9fqcY8ZS7WQgsIo6AGfCrqoiC0HC9MEeyTdDWX6uIfR1q
 GxBzdhU+Vu3tbflH9V+yfg9k03rBgiAIUBnt9Mtz9Xw/QcNx3Dzwo9J16kwN2TUqIkcFJ2NwTpO
 I1jv3p11z7f1CSlp95KHdqYHmRGVtf1l+FXyvz9m+4OLfbwcwCxIztH3emCCjQL6BtDFLm6Q7G/
 zCAWCdMvawFtJSmrHBYQIam2WTj1EN8T5sHdosLV2bR/JYCOlieMG/iLNZU3QnK/028oVWo6fEX
 ZHeYxY1/0cQ0YZlkqYefpo+MQCNziZ7gqfVzr/PsMajutrYu8JtNDbmmDrvi9ZgXEQzdWJufH05
 3S/g9HBCShFvw35uSwRN9UQxCIWsefafRjVvpOdwYxrdfIiavbCqyn1EI9jN0D4K5NMyXWQvMhf
 YHiazxFPa/qjA8
X-Received: by 2002:a05:622a:4c8:b0:4e8:ada0:450a with SMTP id
 d75a77b69052e-4e8ada0a00cmr197924041cf.45.1761221775017; 
 Thu, 23 Oct 2025 05:16:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeUhuoseObWTvRgOs3Xxp4Tq849T+csVGpql5BFGo9n/VmAM+rZHain9nu6/6zo++Onjyw+A==
X-Received: by 2002:a05:622a:4c8:b0:4e8:ada0:450a with SMTP id
 d75a77b69052e-4e8ada0a00cmr197923451cf.45.1761221774525; 
 Thu, 23 Oct 2025 05:16:14 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378d67db627sm4204351fa.39.2025.10.23.05.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 05:16:13 -0700 (PDT)
Date: Thu, 23 Oct 2025 15:16:11 +0300
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
Subject: Re: [PATCH 11/12] dt-bindings: display/msm: dsi-controller-main: Add
 Kaanapali
Message-ID: <binhwh2sb72ipt2qhqdmnid2hygdnjx62mhzn2cl4v2do467gz@wkmsvroshkcu>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-6-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023080609.1212-6-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX1bJb9Ks6zmxk
 ujyv2RHwivssoA70DFOjuxeVBC8zQ84BINQTTqf3zdQpXKsFsGy07vycjNOEjDHQSeR5pKiAHsN
 Mgqlqg5vT12TsA55XIrZvkX2obyjji4lUCMQAQKpSOugDlLCGZlGwPwvwd3f3AVaBhNoCoTmlTx
 35yH6Id79TaqGFgOz4sndTA0FBdsLro2H1pGg6HiHTiCkYRUwAAbfbyvW++oONgT4Kh8h+B14TS
 Aep+OqkLhz688ICSTr6u5RFCCF6QvK2iwp5UO8MXQvCs9ZwxKzAv88mH4ndQyAoRPLMAEIzAyfX
 WUWICDkLR/cT2cIGTF+6R6SUw9F/mEcz9nadyz0W+UqISUj2+X0qSqLKETSJJcBHq8+9fGCazVE
 Yo5KPm6rrxvU4nWjxpqoAamcWhuaRA==
X-Proofpoint-GUID: IjhHA1XUuGqqajcb8WRHr2RrjmMWIPb-
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68fa1c91 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=yQNLmfnzQBnRYO31l0cA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: IjhHA1XUuGqqajcb8WRHr2RrjmMWIPb-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000
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

On Thu, Oct 23, 2025 at 04:06:08PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add DSI Controller for Kaanapali.

Please say something more important here. Why do we need new compatible
for this platform, etc.

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 4400d4cce072..536ebf331828 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -15,6 +15,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,apq8064-dsi-ctrl
> +              - qcom,kaanapali-dsi-ctrl
>                - qcom,msm8226-dsi-ctrl
>                - qcom,msm8916-dsi-ctrl
>                - qcom,msm8953-dsi-ctrl
> @@ -369,6 +370,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,kaanapali-dsi-ctrl
>                - qcom,sm8750-dsi-ctrl
>      then:
>        properties:
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
