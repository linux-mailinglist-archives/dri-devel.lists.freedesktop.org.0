Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FEBC00595
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 11:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DFED10E14D;
	Thu, 23 Oct 2025 09:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="e5FNKPF0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C5710E389
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 09:52:43 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6kth1015109
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 09:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=lj4HGsR9qRam1xu/E/CQi8Qt
 OyeipH/qWlPK+yXMX3s=; b=e5FNKPF0Zf0SW+bOQun0ZKKrCe4aazHrrBYYJtZr
 CcQvJguaZm0s6DGPnNakYReyeqfAuv4cBK2SfjdMxZBF0TE8KdhPWtlX1tnGo+j/
 BWFz035c9Y/jdFQNMeyhu0LVKI/NSAQ1R0P3FbrjuX/HJoipzNRDzsOQ4zB6qp/C
 5jd7BVk53ENCamvpoqM3kjiXDnfna0NC53B66StBK+1GwJPbqHfpY4yiIi/EgEtP
 s3MU2YhUzV1yWcuiO4c6CWgqrRfKTBTTu+uMo5MmuNZS4hkqlVnI5DJf1UFcW5wm
 vPpCj04lc/8VxEWLEeWRec+E+xF2eyD/1UntRiHwStNZYA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0nu51-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 09:52:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-87c1d4f68fcso23383956d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 02:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761213162; x=1761817962;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lj4HGsR9qRam1xu/E/CQi8QtOyeipH/qWlPK+yXMX3s=;
 b=HW2nGRT5IovMKRoUnSLBKzdzTjOeixGYo8v+RSruG6KVs35jisTuWOG2+kqORoSBWw
 uQbER5YEC6HeDJ2mWPmj5NTkasg4lkPbBRIV6ogLMiNmwanmbW4jzsHtZiAAJhFxvrH2
 NHNIHWmT6pngbOdM13Nilqh2Qx30HvHWRrdhJvNzfDUJmFRq8yQVAY55KSj5S5jiyVBm
 MwjOnFUslgwnUFCe9d7M8H2E807Ky+iSyttkxq3A2Z9OGWK8WkTDOrHF0wv91JRA1CsB
 LtENlTXp7AJVNOleuVoqT2+1L7nlHzdb0E4wFpIZLFMq/OxcQeovhEwJF5R38WnZNVT0
 0OXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMgL3VuyCm3VeIJry3bvDEJTKBXRU6PdmX4LMb5Zvz7Uj3kQd+PGsRGPXbTjdCxpfXA5mMIGylF78=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5p5bX/QcJBooh3uJY1LHKI9hvIOUIA5slu0N9KNv7Mt/ThZuq
 WvotY9X/5WK4QPJrYy5Q3yUYRpapiPbXCfKKtdyLBHTBPWJ7wzTak/2cJEqTrqJlr2nrKBdqR1n
 pUUc0tEXAhTO7DLPEyGfe4m2UJimfyrMFS+wytYwKdm82j/TIpFgVCc+5O6ACyBcSJhh62tE=
X-Gm-Gg: ASbGncvRWLxXm2fY5Ok36qiaf+qh3gO8mc1L0a29GOmPWoZ0lNzrMOu2IoOakIxZ5jU
 6b61O9fl7xKp2k55qckVvqjGpnf8Vy8Yob8L5bm8Bue5G/MyxH2RMkTbWl+36QKUF5gZKpLisDi
 bGkHY7NmspPi1eqE/SiILFvW8wtg757JIDJ6Xa/CaGi4FMLhmqifFJKNFNpnFin4MG/l0z+aHVM
 g6kws3Tm+FCUo8o0TikLDOmmNMEBMcrfqmvcr9O889uFP3tY7yyPVKeKsW44p8TliggIl8lYOaE
 D1hsEO4PeH+2Iin2PvX3LXwkpcduhgQvqUEKacXkwoqLconYHFBKF8r4a/XQGZQUGafdfY4e3al
 xHouDS5MfidUncS/O+O2o7W8sDgINkIWPiZ1AAb2z42yBe6SnvEoL+6Pdoo9b
X-Received: by 2002:a05:6214:2406:b0:87d:e77e:4df1 with SMTP id
 6a1803df08f44-87de77e4e55mr114575266d6.60.1761213162123; 
 Thu, 23 Oct 2025 02:52:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7AbIcMz4qaa9yIcpZvpwREt3p4UM9idjvFlz0HEChINWcK7/GEpAuVvvqWLIzfePwg8PadQ==
X-Received: by 2002:a05:6214:2406:b0:87d:e77e:4df1 with SMTP id
 6a1803df08f44-87de77e4e55mr114574926d6.60.1761213161613; 
 Thu, 23 Oct 2025 02:52:41 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-87f9de7beafsm12276226d6.14.2025.10.23.02.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 02:52:41 -0700 (PDT)
Date: Thu, 23 Oct 2025 17:52:29 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, dri-devel@lists.freedesktop.org,
 mripard@kernel.org, linux-kernel@vger.kernel.org,
 aiqun.yu@oss.qualcomm.com, marijn.suijten@somainline.org,
 abhinav.kumar@linux.dev, simona@ffwll.ch, devicetree@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, krzk+dt@kernel.org,
 freedreno@lists.freedesktop.org, neil.armstrong@linaro.org,
 quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org,
 lumag@kernel.org, airlied@gmail.com, sean@poorly.run,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 jonathan@marek.ca, robin.clark@oss.qualcomm.com,
 quic_khsieh@quicinc.com, conor+dt@kernel.org, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 12/12] dt-bindings: display/msm: qcom, kaanapali-mdss: Add
 Kaanapali
Message-ID: <aPn63QSJL52HmhGZ@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023081736.1251-1-yuanjie.yang@oss.qualcomm.com>
 <176121209123.1694835.2815069098750745260.robh@kernel.org>
 <10999a80-df1a-45c5-ba1e-e64b2afeeb4f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10999a80-df1a-45c5-ba1e-e64b2afeeb4f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfXx8E6KXf3rNHW
 aPf3RZ+TnchrLJGYx/v0UDLaoELH/czpS42P3ANqN47TScaS59fQbPWza9pnbCQIwYVq8eIPrhA
 6/ebX3h1Qg7oUkSBljzTfwIv1jb+djFh4V1/cQBFjuXzTu6ZjAwMlejY5GdaIrIWUsJ81J/y+bX
 +IwnGh2//i4yg1Q+ZQuKYIODi7t87tqlyFSRwvxs+C9oa0NS4qRqYJY3UE5VVZ0OE01XWE1eriJ
 poZGhx4fk6Nxoud83J7w/OLBX7S3D3RxbEiN4G7mq0uLOGNcEijl6NKT3ajMYk2zV34w9hG8uF8
 ycu1a9ShLTTjJtX96kc66IvxsB0cT12BxVVEhKbxc3/LrrWRENK4DpP0INKE9MsnCa8etqxeznu
 rNA0D1Xg9Rvp+4J6u0KBu60POOG0mQ==
X-Proofpoint-ORIG-GUID: _B7zjq6FsDmrxbFhLneiWpO8upKiMDQq
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68f9faea cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=i8jsQQnW1KsEJaHduVgA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: _B7zjq6FsDmrxbFhLneiWpO8upKiMDQq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
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

On Thu, Oct 23, 2025 at 11:36:42AM +0200, Konrad Dybcio wrote:
> On 10/23/25 11:34 AM, Rob Herring (Arm) wrote:
> > 
> > On Thu, 23 Oct 2025 16:17:36 +0800, yuanjie yang wrote:
> >> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >>
> >> Add MDSS/MDP display subsystem for Qualcomm Kaanapali.
> >>
> >> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> >> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >> ---
> >>  .../display/msm/qcom,kaanapali-mdss.yaml      | 298 ++++++++++++++++++
> >>  1 file changed, 298 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
> >>
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.example.dts:26:18: fatal error: dt-bindings/interconnect/qcom,kaanapali-rpmh.h: No such file or directory
> >    26 |         #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
> 
> Please do what you did with the other clocks and simply refer to it
> as some vague &rpmhcc_xo_clk which doesn't actually need to be defined

Thanks for your tips, let me check and fix it.

Thanks,
Yuanjie
 

> Konrad
