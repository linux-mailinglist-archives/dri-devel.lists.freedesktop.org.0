Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7F0B295E2
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 02:42:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD5510E023;
	Mon, 18 Aug 2025 00:42:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MDW5UKnb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C40F10E023
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 00:42:15 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HNoIYm004363
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 00:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=TTIHaooodPnPN/uV4iXuYwFR
 FvxVYdQqEnjkEjkUyXs=; b=MDW5UKnb8wZXu3Rq3kr0ghlak3YhUwLOHMqkBlbb
 gCsLJSXJWev5fu5tMdafOzJ6PVg5cwEvCVpvdP2mqqbfdRkFxtoNHCaRHHYrRJ5M
 RdQ6EdgcgzlogYwr/96OA9d3y4zwCvzug81MFhlaj4vFZxVWdMgpbdps4ZD23+rt
 0FvPy3nCf4uZmk2vGaU94TXPtqJybKfKuRP8PV+/nv9jLL30eVT4hwXKMDiYx/yK
 Cfy/B6ZXYhgSUJBGutqr4qSc7ywUuCSKIyA4xEza+qHK/jOZC1U9PT7qBr3c4pVX
 tWCcFfN03QP+rg8PISsy8Oyr6idoFYJns/Cdiib1PnfPOg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjrftsaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 00:42:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70ba7aa11c2so54074886d6.1
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Aug 2025 17:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755477733; x=1756082533;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TTIHaooodPnPN/uV4iXuYwFRFvxVYdQqEnjkEjkUyXs=;
 b=PUKhzMC7uN8wGDaeD/wX2RXlp4kPOZ4TTfVn3ACBk1SsOm4h4wePu5rSxZ3Pp5r2Wk
 gU+Eap+ajA6oedgBSYwOpCLh+93qzWCCReYK/HtoLEm5RwD923ATHZvQndGoy8lCqyZk
 mcnMx49Z7jCjRLjAq8Z8aGGZX4bk4FYGum7mPjHQe6pxKmCPWovnngwG1cEu2BDyM0Kv
 7HG8J+mJxlTjhNysUUG10ix9ZVPI1beWqD+7ne3RCIMxUz8LuSj6RRv/cuCSKZB/I9Ai
 bRtvESS1TAWA3qEu0e73l1ntaa/EGv0dj+gDayAxykBj/yfomNb4UXhU1YQwdzSH2uH2
 4yRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNBVofYIu8aVnU6BAufQSPaziTneI+OK5Q/URqXebttD61E2/KuLJ/8SacVwC1yzO/iiiVn3pE5po=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxktUS3WNuKx9m2Lk9C28KuLBHXZNBlBFEn9Yatux6ezZnhnNtz
 9i6nWiw8RZLxXjPLCSqDX9okOrbzBQqG1hcRr2MGortviHsItr/7EkguB9BjO01jCSLb8/jgRGZ
 w2oXOW5wb5257JG6p9mxs5WTGF2cXSaxjuFFsYqmD3C8oPk1vVBBXjxWxchSnpVriiyyVzUI=
X-Gm-Gg: ASbGncs/j7JWXCk1wO/GvcZYPMrORP7wPcRdeWz5W4FAq0PtwqIRfDHldCWf/URWRQV
 SixUegKS1PbP4ViQWRUZ/GPZMiGNu1HRmiQd6E3snO1fBi1Tk81oU004VA1xEFOhZrNOCSbpsmt
 TrgnemGRZM+Un262ovUHyMCtIlwhrtVA4cp8PG/rLvCv8PoxqRVWlp7dWlRiVesRQQY/YKen5tf
 /mzo77I5cLGDTI1EE/Tmd0+dkySMKqQKGRW2+x/RPDbexO0o7YPEgLxRgFHED8kVhLWddKIwgXn
 VtuKx20rzH4B4sv4gRIOf9r1NId51CCPzm5TxSzFHkCPVvQLr+HDvosEIg2+de0fFgg7n/N/xIA
 7oMLZIzTnSyV6sZzT7NPSx0u05goYO31CAIqFbEjD01JvP0swT1W9
X-Received: by 2002:ad4:5c42:0:b0:709:b6bc:f6f4 with SMTP id
 6a1803df08f44-70ba7bf7612mr120609036d6.32.1755477733407; 
 Sun, 17 Aug 2025 17:42:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaOFAA4xzAEpkq1pbcegEcpv96JKuWHG5xRULfd/dnlRxyzciJwghtw+nPoI3WDSgIvg3ZsQ==
X-Received: by 2002:ad4:5c42:0:b0:709:b6bc:f6f4 with SMTP id
 6a1803df08f44-70ba7bf7612mr120608736d6.32.1755477732843; 
 Sun, 17 Aug 2025 17:42:12 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3340a604690sm15654081fa.41.2025.08.17.17.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Aug 2025 17:42:10 -0700 (PDT)
Date: Mon, 18 Aug 2025 03:42:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Henrik Grimler <henrik@grimler.se>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org,
 linux-kernel@vger.kernel.org, m.szyprowski@samsung.com
Subject: Re: [PATCH v2 3/3] drm/bridge: sii9234: use extcon cable detection
 logic to detect MHL
Message-ID: <r2u2odrkzfezohq44nh4jw6oj23j46gohuzsh6k7jpwnzojxqk@vdus4jj5lv7x>
References: <20250724-exynos4-sii9234-driver-v2-0-faee244f1d40@grimler.se>
 <20250724-exynos4-sii9234-driver-v2-3-faee244f1d40@grimler.se>
 <ldhyfuczwtwydwnvno4xn6ppjtt7mtcj35fp52xrqaajtfbtpb@2pgkytczb5k5>
 <20250808095259.GA31443@grimfrac.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808095259.GA31443@grimfrac.localdomain>
X-Proofpoint-GUID: cRsNw0izth6UHkFZ0LslenHRXsErx4a6
X-Authority-Analysis: v=2.4 cv=YrsPR5YX c=1 sm=1 tr=0 ts=68a276e6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=ZUfLXKp3AAAA:8 a=QyXUC8HyAAAA:8 a=zbyRAtfhQp2mi0id9n0A:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=RYC_AntYK8rCuVhA8xHq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzOSBTYWx0ZWRfX8v53Xz9mYwRe
 051Up+elQPzh/1F+V3ccKqBNeb2VXsZ4qJnREMuYYTJJpJz9FkhQkTFc2zAKcn8Qxry91+Bnoic
 HR++rPbr9PMrjeBjOzYFcIvT7f4ZyekC5mwSDqdDkozq9EjyCc1Z69QsQUN4uRaGufw8RCeRwff
 9S3IsVfTWFEUIk63mM098G2emTZrwvOMLIvAlU+t58xt63P2q4lUWL54v79q7ix37+pSKLt7bY1
 Vm2WMWUgffP+AovCNMpNmSl0ZZBf5ap+wjusTTwuy+L8EXygGy0FXjFfiM+qzWeAYYzbwpkh5xK
 EzY/8tNg997GjITMvejoF9LpG/xhjpgFeFyuNn8D8+tH3pM8L05l7x/LOtEV2qbPbAID0pXYKMa
 u1mD7c/1
X-Proofpoint-ORIG-GUID: cRsNw0izth6UHkFZ0LslenHRXsErx4a6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-17_10,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160039
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

On Fri, Aug 08, 2025 at 11:52:59AM +0200, Henrik Grimler wrote:
> Hi Dmitry,
> 
> On Sun, Jul 27, 2025 at 08:07:37PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Jul 24, 2025 at 08:50:53PM +0200, Henrik Grimler wrote:
> > > To use MHL we currently need the MHL chip to be permanently on, which
> > > consumes unnecessary power. Let's use extcon attached to MUIC to enable
> > > the MHL chip only if it detects an MHL cable.
> > 
> > Does HPD GPIO reflect the correct state of the cable?
> 
> Yes, the HPD gpio pin changes state from low to high when a mhl cable is
> connected:
> 
> $ sudo cat /sys/kernel/debug/gpio|grep gpio-755
>  gpio-755 (                    |hpd                 ) in  lo IRQ
> $ sudo cat /sys/kernel/debug/gpio|grep gpio-755
>  gpio-755 (                    |hpd                 ) in  hi IRQ
> 
> so that is described correctly.
> 

Ack.

> 
> and in captured trace I see that on cable connect we get an irq that
> is handled through:
> 1. max77693_muic_irq_handler
> 2. max77693_muic_irq_work
> 3. max77693_muic_adc_handler
> 4. sii9234_extcon_notifier
> 5. sii9234_extcon_work
> 6. sii9234_cable_in
> 7. hdmi_irq_thread
> 
> Raw captured trace dat file can be found here:
> https://grimler.se/files/sii9234-mhl-connect-trace.dat
> 
> Maybe you were asking for some other type of order of events log
> though, please let me know if I misunderstand.
> 
> > Should the sii9234 signal to Exynos HDMI that the link is established?
> 
> Maybe.. Sorry, I do not know enough about extcon and drm yet. I assume
> you mean through drm_helper_hpd_irq_event() and
> drm_bridge_hpd_notify(), I will experiment a bit and add it to the
> driver and see if this improves it.

If you are getting the HDMI IRQ event, then I'd suggest checking that
you are actually getting the 'plugged' event, etc. I was worried that
you are hijacking the DRM chain. But if you are getting hotplug events,
then it's fine (and most likely correct).

> 
> There is currently (as I wrote to Marek Szyprowski in a response in
> v1) an issue where device screen stops working if cable is connected
> when device screen is off, maybe proper notification would help..
> 
> > > Signed-off-by: Henrik Grimler <henrik@grimler.se>
> > > ---
> > > v2: add dependency on extcon. Issue reported by kernel test robot
> > >     <lkp@intel.com>
> > > ---
> > >  drivers/gpu/drm/bridge/Kconfig   |  1 +
> > >  drivers/gpu/drm/bridge/sii9234.c | 89 ++++++++++++++++++++++++++++++++++++++--
> > >  2 files changed, 87 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> > > index b9e0ca85226a603a24f90c6879d1499f824060cb..f18a083f6e1c6fe40bde5e65a1548acc61a162ae 100644
> > > --- a/drivers/gpu/drm/bridge/Kconfig
> > > +++ b/drivers/gpu/drm/bridge/Kconfig
> > > @@ -303,6 +303,7 @@ config DRM_SII902X
> > >  config DRM_SII9234
> > >  	tristate "Silicon Image SII9234 HDMI/MHL bridge"
> > >  	depends on OF
> > > +	select EXTCON
> > 
> > Either this or 'depends on EXTCON || !EXTCON'
> 
> Feels like depends is a better description so will change to it,
> thanks!
> 
> Best regards,
> Henrik Grimler
> 
> > >  	help
> > >  	  Say Y here if you want support for the MHL interface.
> > >  	  It is an I2C driver, that detects connection of MHL bridge
> > 
> > -- 
> > With best wishes
> > Dmitry
> > 

-- 
With best wishes
Dmitry
