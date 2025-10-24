Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4055EC0472C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 08:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8069910E995;
	Fri, 24 Oct 2025 06:10:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hV/iQ0Ve";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 173E310E995
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 06:10:44 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FgEn021720
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 06:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=iPDyisl44Ds/H4LrsIWE8heq
 Yin0PT0m3dP+JNRSHeI=; b=hV/iQ0VeW4QjxbWm9Z8aa1teHm+fAYtwOBru/D+u
 pN+54kTGbayJ6FViPbZT1uY9Yg33/T5rzquz//sIlwCumVOqXeE/MLjjCBPzwkEE
 eXRezn091PeuNcxYpdQRZaVxzP8wNTo3hWQSJ+U4VHHqJIPxhX0QGQSrf1tRfHCy
 3Pf+9PTcT5v1GPFtQRD7K3gR2uKIxv7crkRiDRzVdVVK3JhbWaRfMVv6WLSuOESV
 D8kZckRAB9VIvxbhuTecApkFcDFv3pkZwZzrfFGoA4qWIpexxWBl6m5f2oYemGJ4
 oWqZcu5Lh/In0a2ifFQfkQIr/r632CmX7xjMJb0Jxc2IhQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w8ay28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 06:10:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4e8a89c9750so60331191cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 23:10:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761286242; x=1761891042;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iPDyisl44Ds/H4LrsIWE8heqYin0PT0m3dP+JNRSHeI=;
 b=GpQyR/EAI4ag0WtnFacpCH+4DpC2owWrdqR9lbXb89+1IB4QlzZtSL4UDR8jnLdMPT
 1Vjuk+6/mLS+WrVmclffV2NqjmzJFk9+PnOtjvTeuOE3gDYBHSwq0OkhmWA60/3RiyWU
 cHaE+WvPEc/ycNqfadYgzv7posK5e7CjUdgkK0VHuvCwWX2PzN8nInMiae9Y4QJxOidU
 0tYeXMNwYc/nnvqjrYTIQG7+GrMtj2k86hmpu26lp//vewdFAdiLlhCSKkM299SppGP+
 BnzFtkH62vpCCCJ7zKnR/CJWebOSzFDnvGirSNcS/w3tyd9Qkze2MPubjoYi4ytm95Cb
 V3Vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbmC1wsupiiv/PG+wOljejIBgGgOwdtujsgrOsLYKoI2+sHa/r0NJ2+jwv3aQns/bUvBcPX/Xjd8E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvM9HoLKo3mYFqg3hSdxN0DsP++xCGKjFdnAS+/z5S8Ou9s5ky
 vsVYviuUCNSIzqJogHxpEJZ+1si7fvvZGR4NwUgfzkW3nX/adKoigzMTNoo7a3+AHTqkCUyb0Be
 OUCDuKVHZEBE+cUXaXXMuoC99/O6HrB+EP7ctwvuZju9VPQ+jWAY+AI0IQ/2bSdlW/7OGUb0=
X-Gm-Gg: ASbGnctE9LKb8zR+vV/PszGpqBnWn4VBQr11rzKd84ZFFtmIA57lngo0I8x7rUWR5lj
 akdkWK2wRxgFMBIrYP7zhyzgqBqZGaMq6i2EPavvRgiwiBcN6cnDQvvYDk9he6dO2+UztiDb+KF
 HKu+M3i7hlrBI+5U3sAjqAMfb8wQTyngjHPj3BzyHs9FLYyvmdL3Ja3y32bQCYAb5HkpM4Qo+Vd
 iCljMhNaQ+6sYnRQAjm3bJDsnswOtfrBBQP6HEwLPE4JEoaxvJb0s7Iq1m23bnI+MUihSJpjsF6
 0LwU2YKzTewp6lURCuULzgWjEOifgmmbc6uekGA9YEe88US65JlDbM1+GU0aSwZZhEohnaU2pFz
 HoxU+uNNpMqZepeQsmsHnAMQKHFjevTOjH3e29N5OahlpDEYjY/COaxkJnQJW
X-Received: by 2002:ac8:590a:0:b0:4b0:677d:d8e1 with SMTP id
 d75a77b69052e-4eb947d0b75mr10195401cf.17.1761286242337; 
 Thu, 23 Oct 2025 23:10:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEtR9U1iGlrQGZPr6uA0Clma7yT4910fb9qum1J+IWWzJ2J/Ji+vn8lfUnOE0P2SRWMpyyYA==
X-Received: by 2002:ac8:590a:0:b0:4b0:677d:d8e1 with SMTP id
 d75a77b69052e-4eb947d0b75mr10194911cf.17.1761286241626; 
 Thu, 23 Oct 2025 23:10:41 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-89c120567b1sm320507385a.51.2025.10.23.23.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 23:10:41 -0700 (PDT)
Date: Fri, 24 Oct 2025 14:10:29 +0800
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
Subject: Re: [PATCH 10/12] dt-bindings: display/msm: dsi-phy-7nm: Add
 Kaanapali DSi PHY
Message-ID: <aPsYVUjyPru5FwPe@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-5-yuanjie.yang@oss.qualcomm.com>
 <em666johhzrluo5z4t2nu5jo4yuowegaemlrursvczx2zze5o5@uakt5j22ygwm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <em666johhzrluo5z4t2nu5jo4yuowegaemlrursvczx2zze5o5@uakt5j22ygwm>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX36v8Jkr2v6zG
 s07rDG2hFH/SX/wwL5dS/A1/BUA5E381wTU8JMcoVwfHKkqG6BxG6aGYoVRk7sc8+vF+VJChrYn
 3rf8VIfIt4TVktFuKvRA3zxqgnpIRAsbyWEsUflY8Nd0yZQ8RL/MzmAuB15LXa5zG2rI35+clGC
 +wBoPEQohfg477/632rdN1Bh5VL9h91DWq3TEr8ZRHAWxGwY3IBveBYYUZGpGrEiQ6vjuFcRk9Q
 rwWn3/4VBVCLSArQFI+B6CMw7UQ/D6hx7ht12PxgSyBDIu0gJ/YgSlQcAy5CvqQbMmx6n+wunzJ
 A0mIXfhAqm49hrxCpq+i2K/zPo9VQegTd46H9DeIxB63ntcXgnJsAvTEAbyWJt+GMFnu2I/WjGY
 CJ4M80V5zOyMcYM9tTNEbOMHfmP3uQ==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68fb1863 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=WIVAG7BfrJY6p4e7JxwA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: -M-ERZh0PIRePfldrkQEar4O_rSIibtS
X-Proofpoint-ORIG-GUID: -M-ERZh0PIRePfldrkQEar4O_rSIibtS
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

On Thu, Oct 23, 2025 at 03:16:31PM +0300, Dmitry Baryshkov wrote:
> On Thu, Oct 23, 2025 at 04:06:07PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> In the subject: DSI, not DSi
OK will note.

 
> > 
> > Add DSI PHY for Kaanapali.
> 
> Why?

DSI phy for Kaanapali have no significant diiference with previous version(SM8750).
But some register change make it imcompatible with previous version(SM8750).

I will give this reason in my next patch.

Thanks
Yuanjie.

> 
> > 
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> > index 1ca820a500b7..a6e044eed3df 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> > @@ -17,6 +17,7 @@ properties:
> >      enum:
> >        - qcom,dsi-phy-7nm
> >        - qcom,dsi-phy-7nm-8150
> > +      - qcom,kaanapali-dsi-phy-3nm
> >        - qcom,sa8775p-dsi-phy-5nm
> >        - qcom,sar2130p-dsi-phy-5nm
> >        - qcom,sc7280-dsi-phy-7nm
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry
