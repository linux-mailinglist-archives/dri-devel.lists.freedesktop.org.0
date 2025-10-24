Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D54C0471C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 08:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B6A310E9D1;
	Fri, 24 Oct 2025 06:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KEEy5YYW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51FFF10E995
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 06:08:54 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FLTE022330
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 06:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5paQZUXoZhbSMdqEbr7oDMWv
 5wYg/eSHa84AvpMQ1gU=; b=KEEy5YYWmGISqZocseXqFvvaaUAPB1sOLO3rqjvo
 KU2JgAV8n6Joarvt+LHc7yBgdWDf0m7m+vEWqORLJf1frTF3vDqE8P5zeMk/5X/w
 HQVRqFAwnYc5vNQES9Iqf8gMP8C4QU2evE0EBL5HaP/16cECqMGIZfh7QDBs5C9z
 wkIDgrgKOtaiBmghZxCT4Z0Ka6NJDAK64YoX5D+4QB01Opv4APoRwOxGU7wFlQyV
 +VZElCAflFA3Qf7Rdn76yUIjBSREdea05oxzw4vYWrOBwkCuKKYCFFCBanWJSVxg
 35BlkTKW8mlwQcLetyJFcvBpWL/ec7QZzMZduNclkrT8Bw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qmxk5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 06:08:53 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-87c171369aaso53399966d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 23:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761286132; x=1761890932;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5paQZUXoZhbSMdqEbr7oDMWv5wYg/eSHa84AvpMQ1gU=;
 b=BCAnVurIa58tK55glmi7fx9+sre+lOVrqkkFw9bPV7l897F1ecgRqe97HM9VduLmHB
 KedPJs3+gJjHK4NitVloz3WJwFCmAZJbNc6QQgPwGecDWpfvbyR5xGREb9nNat7mArUH
 KLaNgN8vZA2wtD/7t9tN9XopF9Zcr/diDi2W7JHnd2Y5n68gbCtKgkVh7g80GjZDl8VT
 0B7kYSr6wX19KWaWCDsCFwAnFK/FQd6BBkMy1y9OTKOTq+JtBss0lAOQYSSN5YYDVpXl
 eTTpvdx/BU4kRoZTl2lNO/Z9CPPoEFEfsApmTYgG2iY0xFXcUMKlbJ+JV65eE1Qxoj/e
 2Azg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/gXBwwbnID5GPO6XIp4w8Lum4ks66G/odx5TEoaL24O5YyqaYt+HK+3hD+tPz006Ndr4O/bzZfI8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyo0HOh8y6QORAwSmAmMDJQEAQMO4cGwze7+W+cPbk26RnsBQjQ
 SKVi0wHZvXSfHdyUKdsaOJS46PYfYr5YOB/8nYbI9pSy2eEgy5t9RfzFGHJrSwVs/9z0LuXQJLj
 zo8QUuCX+4elWVqJwTVQlFBUc4bTa8aRDAS4RxxUJ8uK+Uhi47oRmRc+OcwTXGDXGa2y7CRk=
X-Gm-Gg: ASbGncu2gzg5EwNO2wBYqNT9aKvQ8DE2mcV74iS3uanUUs4MM7KAF5ME2DqhspbClu4
 CvroK35lCYWvRD8RqrEQ8VPXhQPdDCmZXmnvy9R1OcKtOX6TgphNYj+1v4uOcgQgXwiTscDsuR2
 EJOqUdsPmE/DH55baMz/YMyeGXtuEQkns2NTV3VBhBBNXlxRInXOlijBDy1A/VpzosM89mWxi8q
 FzblzTSXvXbArzqsqLJ/0PBkKYqbHLFqJjx34Z+4AGt1V7eXA34ZSp4BHBVT7EaiW+4z29ITXKE
 fLTSMLUsMpOCkpPrV7P6UdF+0+36mdxrrjCV9ce2AnoSgYTcxvIXt01u7yGbx1sU8CkF3xMFo/w
 BlmrYzz8T3gwg7hIZCFyV0A4uuKJ1Zr7CwndVvVta5Xr43eCs1cy86NQCGzjy
X-Received: by 2002:a05:6214:762:b0:78e:2582:fe4 with SMTP id
 6a1803df08f44-87fb41405f1mr18971316d6.30.1761286132457; 
 Thu, 23 Oct 2025 23:08:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJfims6BmldfbNUzzEmlDV12NK3CNrXycYwMc9WdMoAhC7GnzxeZrG4DxKcu5+ArENqYaIDQ==
X-Received: by 2002:a05:6214:762:b0:78e:2582:fe4 with SMTP id
 6a1803df08f44-87fb41405f1mr18970886d6.30.1761286131954; 
 Thu, 23 Oct 2025 23:08:51 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-87f9e7f52e1sm29575846d6.51.2025.10.23.23.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 23:08:51 -0700 (PDT)
Date: Fri, 24 Oct 2025 14:08:40 +0800
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
Subject: Re: [PATCH 11/12] dt-bindings: display/msm: dsi-controller-main: Add
 Kaanapali
Message-ID: <aPsX6Fh0tiGuUox6@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-6-yuanjie.yang@oss.qualcomm.com>
 <binhwh2sb72ipt2qhqdmnid2hygdnjx62mhzn2cl4v2do467gz@wkmsvroshkcu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <binhwh2sb72ipt2qhqdmnid2hygdnjx62mhzn2cl4v2do467gz@wkmsvroshkcu>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfXzCOvP6tBQrFX
 ldXoXplZZn1TJIsNRqZD5xkB1pzPevaDuEO6YeM8t1Yd7uhMioZm093gH4//VEFcQxRz8b5LtT+
 rcQ4bai7rCvDTZrvg6pLMWFn9argSqGYTtjrtp3Y/yQsJJJeUeCK2spzefHs3P4k6yI38zBuU3d
 viKJ7RU0BgdwGad3zIX3TcDsNMUVpNR9/DttWl/EWucvJB0BVzmBdn9wirJoZUOqptkDIW9Sbm3
 lr1v64xn83Y1XdnleSSfblP6qOjUKWJ00895AIjB378VPn2XpQ4HsVIc8mR5s5kQiSRGXUQ7qQJ
 xjcf3CE05e88MkLzTM0XD3dX/90h8uld7xN83ACZxvXJ958IXrs9nai2Wpgx5/eqmoNIdS9cn+k
 ORnBh5THaw1KAeZQVpRvfxZBy8QQ7w==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68fb17f5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=WIVAG7BfrJY6p4e7JxwA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 5D0uCGPDFv5ri1Gkd07SBfpV1Rg0My8d
X-Proofpoint-ORIG-GUID: 5D0uCGPDFv5ri1Gkd07SBfpV1Rg0My8d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168
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

On Thu, Oct 23, 2025 at 03:16:11PM +0300, Dmitry Baryshkov wrote:
> On Thu, Oct 23, 2025 at 04:06:08PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > Add DSI Controller for Kaanapali.
> 
> Please say something more important here. Why do we need new compatible
> for this platform, etc.

DSI Controller for Kaanapali have no significant diiference with previous version(SM8750).
But some register change make it imcompatible with previous version(SM8750).

I will give this reason in my next patch.

Thanks
Yuanjie.

 
> > 
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > index 4400d4cce072..536ebf331828 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > @@ -15,6 +15,7 @@ properties:
> >        - items:
> >            - enum:
> >                - qcom,apq8064-dsi-ctrl
> > +              - qcom,kaanapali-dsi-ctrl
> >                - qcom,msm8226-dsi-ctrl
> >                - qcom,msm8916-dsi-ctrl
> >                - qcom,msm8953-dsi-ctrl
> > @@ -369,6 +370,7 @@ allOf:
> >          compatible:
> >            contains:
> >              enum:
> > +              - qcom,kaanapali-dsi-ctrl
> >                - qcom,sm8750-dsi-ctrl
> >      then:
> >        properties:
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry
