Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 637F7B4254A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 17:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE87D10E8FE;
	Wed,  3 Sep 2025 15:25:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dSH+Gm4Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE5A10E8C7
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 15:25:22 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583DxAT3017520
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 15:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=IzstwaAk/9gASzk67aMPoDLF
 wx1pPBoDPB8FIPR+FXc=; b=dSH+Gm4Y8lZ+abblwn5oiEtwLhMymGrVbiwpJt4G
 v2B1G5YfHBhcHX+Y+p5PawEKefsDIBm3rM5jc3SXoc0dObfIMHOWLM7Wd5yISKwB
 44SdTKgzXbQCZuajuUYV+t7fDneQ8vn9Fu4TsjjZ/RCG0eScgwNVCDqElThXTNQz
 nu1HBhHjcbuNE74uFcCfXNNEcuXkNVHgVdyAqA3PnD4FGSOmHIUS/8WxcXVBaPs0
 b9G5kujl0uVlyKadFNt3E2XrIvT+Ur2w+buORX61Xzqkc67rpRdfwguB8IumTl4z
 hrQiLuBSVGWSCyElf0SmC/YuDIiQk8Hcqv9M+R2RSstR3Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj0r51-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 15:25:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b3316dd5d0so617931cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 08:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756913121; x=1757517921;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IzstwaAk/9gASzk67aMPoDLFwx1pPBoDPB8FIPR+FXc=;
 b=Qa3SNmuNZgN/kYFs/pDVj00GcuQRxg8XUv8jE+wgiJxiyiPBPby7N19FbVqho33JMi
 LQjcPdiLh6NCsiOOoUwIfPw//U+tKJebNKpOUsAj5sEyKAXuQucH+tZdefoI8AqVCZEp
 KaYXAvxYWRKIvWaPQARrYn51Bc5sdTDJEpMp/7xEC6NJzX/6zcD8li558zwAuJGCVHfX
 Z/xWdSRahvCRe+hmBtgZAgcw8QGUl3xDiXAlt3RhbpvyrXQQ2Vs9bLaVydL2c1qCLoMc
 R2QAj1o+/8o4DcmKVs943lPTqUqeqfGQMftIiu9cJBHhut5XEQiovbHd45/oaXDVlVbg
 0C2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLGy8jdwJ0UF2EsQo8i9XXiR2NbH5U7P6dqAlxvmYrsxT/0UJiQlqOdswF7+qYOXx+/ovrT+tnxRw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtApWOooNCPpV8nMnmS7Cqf4dXLOWX/TvfbcwHf25oGucD1LxH
 JzlhGTtZSQ1GXxCVg4xd+qUFHjG9wkXFxdJuDX7p3m+45G8wwRo4wvVMaoZqPiVMpKBfgAbr0Vd
 nlt0kwTJPU0Cdw5kyZlDeaW80Zr6687dYIJtBsnyU/QygcCoL8kywvcZ0Se1BU0jSyj0cTbQ=
X-Gm-Gg: ASbGnctK6rLNKYwGK+NeU5j0Mwk3wghNzVDG/i1Be5Om92ccdbB9Vlrs3mCJaKFwbCl
 bAQfKtRYurX+Lnhv6ae74xPL8jAfCIuoRsbgC2qXpLLDwVrXTDSX/qZgonscxhIxTscsbs7YW+C
 +nT+dm+h5gTxKefqMwmRyY27JSjHJiYM2XvrEPnY3Ad+JxeWPYQoSVLxt3e14L/Rw8DTbzcGuRn
 eQMc1PCPRkujdVNMjivxNRXXm2O8K/qcvLwVMD7LZYE86W41VHfc0ejXQSgMhfdnnyaeZpJBFE8
 9h5DfTPpFJNgJAIK7X++YSe9iBLFkFsBP52GiCGgpiuY+39AnKVzy8qBCvYBlD3epiQsavbyByc
 4qxLmcXtaD49+6Z88qwsDJ58dJgKdqbwHcB8KonBweGpNnrBpT7xr
X-Received: by 2002:a05:622a:997:b0:4b3:735:c36a with SMTP id
 d75a77b69052e-4b31dcd00c5mr189313691cf.75.1756913120720; 
 Wed, 03 Sep 2025 08:25:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsXzIAz12Lk6+O5Zx3h1C4NcdtKzpJmeWYRdgvuT0mpQkWtK7EWAI1sP87I4FOMC3nC+7qlA==
X-Received: by 2002:a05:622a:997:b0:4b3:735:c36a with SMTP id
 d75a77b69052e-4b31dcd00c5mr189310761cf.75.1756913119675; 
 Wed, 03 Sep 2025 08:25:19 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ab5e530sm589009e87.10.2025.09.03.08.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 08:25:18 -0700 (PDT)
Date: Wed, 3 Sep 2025 18:25:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: drm/bridge: ti-tmds181: Add TI
 TMDS181 and SN65DP159 bindings
Message-ID: <37czaypq2newm3hn6nfuy5ndkibvaqf53nx6zvv3mhddh4qku5@psqqxbu7bycf>
References: <20250901142958.843678-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.edc18686-244f-441e-a6ac-0b62492b96c8@emailsignatures365.codetwo.com>
 <20250901142958.843678-2-mike.looijmans@topic.nl>
 <pml7rfbkerzkx5df26x7kxn3tk2o7oqrkqnx26tzikeg53djn5@islb4hlm4ks7>
 <aa80b3c4-01b5-4d4c-9fe0-523cdb895eb3@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa80b3c4-01b5-4d4c-9fe0-523cdb895eb3@topic.nl>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfX/kEM7vnYpCAa
 X1oeCBRbERwwtpJ+2VUIGPEgdyTD3uk97LzmDOuC6OIkD63BNH7grUMXet/fMUSnc6/sKcMOPM3
 q5HnUYJM1rioX/F+T5ne4H+KjdRkIPDIajw9NBCJYUCprYkRQz3XgYMmgO8VJljbpTLryiIXSm4
 Lq4+piBofGXBe6HL+pZQItk7HDnI/T1ZKLVGxa6HSJXAcBzJkl8wbOPIJts7tbzusParjLfWQLn
 xWBu6h0JeWAW9htpiGkbFa0556Gt+LA5OZMoPBWRDohLGDVSfw4I2TTg+juL23MP5OMGlDl1SYI
 X8s6NdlYVLdMqiKIy5z4C6hOLDmqoj/nhx6CVE8Nhu+7XsbTqppNl6rb00c96D9E0k0nzQV/HQ5
 xuvBDH7T
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68b85de2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=S_xtky-yvbmAgHGpMXIA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: mqlu7NbmKvUIcJxeoWy13fBoiYoES5Lo
X-Proofpoint-ORIG-GUID: mqlu7NbmKvUIcJxeoWy13fBoiYoES5Lo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117
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

On Wed, Sep 03, 2025 at 08:17:33AM +0200, Mike Looijmans wrote:
> On 02-09-2025 19:29, Maxime Ripard wrote:
> > On Mon, Sep 01, 2025 at 04:29:01PM +0200, Mike Looijmans wrote:
> > > +  ti,retimer-threshold-hz:
> > > +    minimum: 25000000
> > > +    maximum: 600000000
> > > +    default: 200000000
> > > +    description:
> > > +      Cross-over point. Up until this pixel clock frequency
> > > +      the chip remains in the low-power redriver mode. Above
> > > +      the threshold the chip should operate in retimer mode.
> > Why should anyone want to tune this at the firmware level?
> 
> It's a board property. You'd set this based on the hardware you've soldered
> on. If your clock and serdes are good quality, there's no need for the chip
> to be in retimer mode (it will consume more power and actually make the
> signal worse). At higher speeds, that situation may change, hence the need
> for a way to describe that. The chip has a similar function built in, but
> with only 2 choices of cross-over point.
> 
> To tune these parameters (retimer, equalizer), you'll probably have to take
> your equipment to a test facility (like we did). It's not something that
> end-users would want to tune themselves.
> 
> Most of these settings can also be done using pin strapping. I guess it'd be
> helpful if I added that to the description.
> 
> 
> > > +  ti,dvi-mode:
> > > +    type: boolean
> > > +    description: Makes the DP159 chip operate in DVI mode.
> > Ditto. Both describe policy, not hardware.
> 
> I would set this flag if I've soldered on a DVI connector instead of a HDMI
> one. I'd consider that hardware.

Do you need to set this if you have DVI monitor attached to the HDMI
connector via the passive cable?

As for the connector type, you can check it in the .atomic_enable by
checking drm_connector::connector_type.

-- 
With best wishes
Dmitry
