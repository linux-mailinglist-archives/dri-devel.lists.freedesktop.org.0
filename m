Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8A4AFA4C2
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 13:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55EC310E17C;
	Sun,  6 Jul 2025 11:24:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VYYBIkei";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBAAC10E17C
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jul 2025 11:24:38 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5666eeKr002117
 for <dri-devel@lists.freedesktop.org>; Sun, 6 Jul 2025 11:24:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=lZ4wwBfarfMu4FkrcJkR7OZr
 INgFH1Bdf9heJSXgTxs=; b=VYYBIkeiin0PR82ZMncxUtwhwPT6cO5tPwmBch14
 PE5RogrghKZ7F4s+jJUA5gtYoR9of97tLfBAbOOk9GEyoWB8zXRYA/agbRQ3ZGf/
 ZOk9fx7OAhEQcVkqq+o8Q2AmqNFAiKkTC8wEd+Axvr2YeqU4onZunRKCkA4giabc
 tyEB8OyDcUDRlL/WthOh/nQxl17SiReeLZ91nkBLYS5TokXQi8JiJ+KMVb3CIhTn
 flj6zwflp25uO2CGgQnWujouXDSwhGQlMwekGyY0jprIR5OIztUUjpZRoj3AyZEP
 JPl8RheHt1nON5jtGnJcQJT6QYkoWblob3c0LifUF12CWw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pun23tum-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jul 2025 11:24:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5cd0f8961so448079185a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jul 2025 04:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751801077; x=1752405877;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lZ4wwBfarfMu4FkrcJkR7OZrINgFH1Bdf9heJSXgTxs=;
 b=V8h/wVolBytVipS9ZYOAg7GtxSrjPZVIocquoDx+z2vjyyc8Bh7cD3eQhqyrr1nzy7
 5HfVW4+1+0KMQKQXhtMUcf7pb8vol3+AjmK3CnGyRoa8ROQDY6IooVAaN84Sycba2DdO
 p+auIPSK4uWKRa7RSq1JnvF3rJnj6EZBuYdpGeOygA1PnWm3s5NAe1/HdkVMmCj6r01e
 lnpOgwWu3ogLKswAjl6YMai0cWpCVvMmtcefadx/UJg/2kmrc0KBXlRthkbgYAsz2jOT
 o3mNSv1p8wPCabrTupMEluWT9sU4gpkUXEUNx60hygxtBU2Bw9Gkb2nn1WEiow1Zdpag
 sCAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2p1gpfPKN73R4xdwDmqiPwQdxP8dQhx4VS09f3MbbimTVK2n4FcBg7orVfYRXqcKxtXruHcnz1F4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxd+GLTa/hhKek4LWQfg9f6Iv2GedGO2FIGKehc3HdAdsHCmVXt
 R8LDGJBK99H2hidP9bZOyR/39EKLRPiK5CkkJAxgtnCZrtKluUMlx83HmHDIowFdKJ3P7mEP5UT
 xjNHIfzRSx200cvlGphnI8FTcT30qghMONbbSGkPJlt8B/aRf7u7CohadW18n0lu6bpaV3O0=
X-Gm-Gg: ASbGncuGYOEDUd8WI7/63n4x2iXPtYthN4K57nI5H6wAf/IEYDBf72NGA5Ur6Asr4KY
 YLUH93D7EowPEja/B+xbvqEAe9zf6i1vSCSM9wsPqWW3qTCBLsz8xOzx5biAGdXL+AQMsvV2e5r
 hF3l/EJ45zhNO0hlpW3sRQUQi8Qd3q3pCVOcL47aUyVoWDBBgGL5Kjqgayrd1PhXlmypZh33RF8
 l9+FGQ91dc9jxQr+Gn3AmdSMFGe7DZgyzBPh+RKrN5JV7DAKXYVUW4Sjb+URq7dZK0Pll3WzoR2
 1rH9IzIP/tYaROvhgx4ATuDedyS6wZdVchTjFuSHwygFYL88wrX4YG3de9Fi0hBHI9Vl9dmtusN
 uFw6v9ALiJu6EuR2QqlU+mm2Ha2EzPGjA5FI=
X-Received: by 2002:a05:620a:bcd:b0:7d0:9ebd:821d with SMTP id
 af79cd13be357-7d5df0f57a1mr1309143185a.23.1751801076687; 
 Sun, 06 Jul 2025 04:24:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQxYqVhwCDN6qw826q9oGMWTR8eFtlGsSrq4QGizeqSiuAU0bbfjwG1uKJ+bSsm5e2+rnjSw==
X-Received: by 2002:a05:620a:bcd:b0:7d0:9ebd:821d with SMTP id
 af79cd13be357-7d5df0f57a1mr1309140585a.23.1751801076305; 
 Sun, 06 Jul 2025 04:24:36 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32e1afecf39sm9101591fa.42.2025.07.06.04.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jul 2025 04:24:35 -0700 (PDT)
Date: Sun, 6 Jul 2025 14:24:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Luca Weiss <luca.weiss@fairphone.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: display: simple-framebuffer: Add
 interconnects property
Message-ID: <vk7xshncx3vj66ykbt3cfdjwdsx5uewfzlqmfsdbjfgju4awwk@lz76hnenxq2u>
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-1-f69b86cd3d7d@fairphone.com>
 <20250627-mysterious-optimistic-bird-acaafb@krzk-bin>
 <DAX7ZB27SBPV.2Y0I09TVSF3TT@fairphone.com>
 <1129bc60-f9cb-40be-9869-8ffa3b3c9748@kernel.org>
 <8a3ad930-bfb1-4531-9d34-fdf7d437f352@redhat.com>
 <85521ded-734d-48e8-8f76-c57739102ded@kernel.org>
 <e534d496-6ce0-46c8-835d-94b3346446a7@redhat.com>
 <6e4253dd-cd73-4302-b9df-44c8c311eb22@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e4253dd-cd73-4302-b9df-44c8c311eb22@kernel.org>
X-Proofpoint-GUID: o2IK6UiIULEIMM6ccrliUq0GhD0y7iBs
X-Authority-Analysis: v=2.4 cv=GdUXnRXL c=1 sm=1 tr=0 ts=686a5cf5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=N6X6wSw0Y0as479F-PQA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: o2IK6UiIULEIMM6ccrliUq0GhD0y7iBs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA3MSBTYWx0ZWRfX90qNsPRRWdY5
 TDwXlZ4f2fEbqGCD9OpFOAAVVCa0ZPnhE5nwlJNIw283nr3utR6fh3+Uc88J1XYKhP2aA/dvhmx
 KiEahMeBiKBHqsXOq3gZEuDNOlGiiNWcoeXiSaN7x6kFVisNOlZsTbvaKjbLcamgNDut2Wle82C
 +Opf1svIhs2rxSpHkaUribl+XyqC4YPwTAztyONGnDEM3VaKax42FVnaB49ZIWuHY/4cf0DK90P
 xSH+XelaCIClpOr1n2EMHT1Wtsiu03t0O61IaeHBOq3qd2qaeNpJylTISclzITun9bM89wV2SdD
 xuME0M+uuGezeehaQyILavTKY+vP2cJcuxV/CXYUAx363lR7GvGGwsx2ex6em77b/EuJC0O8fL/
 AdDp+IbbHUWNRc5jzsbbA+xj/ZHV6oLdiYt5TWRSwlEfoyuyu83bdincDWOlGpIN62TVmQvg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 malwarescore=0 mlxscore=0 phishscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060071
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

On Wed, Jul 02, 2025 at 10:43:27PM +0200, Krzysztof Kozlowski wrote:
> On 30/06/2025 10:40, Hans de Goede wrote:
> >>
> >> No one asks to drop them from the driver. I only want specific front
> >> compatible which will list and constrain the properties. It is not
> >> contradictory to your statements, U-boot support, driver support. I
> >> really do not see ANY argument why this cannot follow standard DT rules.
> > 
> > So what you are saying is that you want something like:
> > 
> > framebuffer0: framebuffer@1d385000 {
> > 	compatible = "qcom.simple-framebuffer-sm8650-mdss", "simple-framebuffer";
> > }
> > 
> > and that the binding for qcom.simple-framebuffer-sm8650-mdss
> > can then list interconnects ?
> IMO yes (after adjusting above to coding style), but as mentioned in
> other response you can just get an ack or opinion from Rob or Conor.

But, this way we end up describing MDSS hardware block twice: once with
the proper device structure and once more in the simple-framebuffer
definition. I think this is a bit strange.

I understand your point of having a device-specific compatible string
and also having a verifiable schema, but I think it's an overkill here.

Consider regulator supplies of this simple-framebuffer. Obviously some
of them supply the panel and not the SoC parts. Should we also include
the panel into the respective compat string? What about describing the
device with two different DSI panels?

I think this explodes too quickly to be useful. I'd cast my (small) vote
into continuing using the simple-framebuffer as is, without additional
compatible strings and extend the bindings allowing unbound number of
interconnects.

-- 
With best wishes
Dmitry
