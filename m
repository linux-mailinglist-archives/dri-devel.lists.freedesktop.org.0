Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B8DBEE47E
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 14:11:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8628389CC4;
	Sun, 19 Oct 2025 12:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="g8ouADzE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0576489CC4
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 12:11:53 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59J4F2BH024567
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 12:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=FXakmNjNk9hILrNuLbMXrtpa
 gW3k4d1NuiaVjYCVt/0=; b=g8ouADzEe0zM/uNAVtVaconF+XQLNz+dEJWtiayy
 wZxGiZVX74GKQFgaPqUdiyjOsqx9Q67CLBNMvO3UZU3IxvLpIB9yUJ2you+o4zvr
 HTBnLtyiVb8GD3v9rTSx+QfOyb6UlW4i+KzQrY6CvsLLMPKNSni1LjiQmPcoYyH6
 GmhpYg7qy28ZubfupYrrFfUeX74bL/p+lX+RBANpLiQ+6N2xa2ZsvBOdKEn16Z9J
 3ujNlM5WqFj2bWuSfW2x2irKnhIDL9n/BzRr2jlIrqMBX3dnjL9U0F/xb97u9WaJ
 zgxW9W5fzW9mNnw/w/3eybvl1zxu6NmD+LXTBhBohKLgFA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3982a59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 12:11:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-88fec61f826so1081034885a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 05:11:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760875912; x=1761480712;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FXakmNjNk9hILrNuLbMXrtpagW3k4d1NuiaVjYCVt/0=;
 b=LHNAfyBZ44/SW5cuYEiqZP7buqAMOPMH6GN86tWIHz/qgHwPIKhjgsAPwZ6RyNN0Sd
 oEmh3Pxh/qOHDLeT1bI0IO5CmJqqPEn1CYNTyNjybYHmg8zcA3f5OHU3dQF30mD/IMuV
 5MiCeuR8u74pjMZFTthi9eQk5CsiYHFZW2JBgy7rB+VnG4f5OY2ewdoQ1AAmozGRhF/R
 7abHvGBhv1Q26xlKtbn3rwnnre8PKTXpoDWJEIXyJH/aWacPiQw+jpFXp86XfVo+hiR/
 YGm9WstdgpDctBoGGDvsjEEs5KniofARwo0CKXQCDjIZQVVw95bO5dTsSvNLbJiiBW4F
 zw3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCixvSNQ30CaN074c0bVXV7zJa7XRkacmpyKbT3/fXTxxBEPbFK+w14tFZF05i2GVnlaUvmvT+p/8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw768YWkdEQv/zjwH90Yy1nOtgHukWrMVzVBCWplvb1aa4Q5xic
 WnU0wV9Qlxyci5Fbf1wtoco5Rmh6a8uOEtQL9sKk3EExeMilTAUYlL5QftBriQX//lgPhChXYpG
 OjsyJAlrSyy2L8yb0A3VwbaSzzVlWCiqAM8SVbcuc6QGCR3ZDknkHFzKvU7ZBjKrDQO7jQg0=
X-Gm-Gg: ASbGncuM9Lukk123fxHlrf5fBtYLidB2441PXQ2lq1ERNhXbvj0qrUmLjJPgRMu+ZiC
 wSq+ZQ1e0jyp4BMtRH7RXzWoUAtFcXOV2GbdXMOxneJWj74OH8Pa3HVCB4RG0a7I9SUsGGqLFYQ
 4xFsLaBxo4K/Tus4xtaoX/nMoC8a2FdqmIh9CU5OcbhdPwr9uS7V6KZMCZI3J1v+d9jUUSkyq6D
 77BPWBez4YbWunRDQHWs5xas1coWHJE80K09+Ecba/sy7HzOfr0Le/4WcQFEMNkW9G9rDBZNLAI
 mOH8mBFPwSkdKC1JG0bbj+7mpwLtaewfHtEq86pkycDtRdJQpNw+Ry/qaEWREW3CuhqlYk3gyq0
 kximY1vVUqefp3Ws2JW7IgWp03zLmP45ic50pbliFdGBwGboNnwea1vJ5NvUf4Y7caOh6CL9Eo2
 +tGJpQQNqWEcI=
X-Received: by 2002:a05:622a:5cc:b0:4e8:a51e:cdbc with SMTP id
 d75a77b69052e-4e8a51ed369mr89145251cf.43.1760875912142; 
 Sun, 19 Oct 2025 05:11:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQGIvBCD9sJ/M1qvRjDaUZ1+T6tRELaWa2oMHhW/HyBqE/0fYTWTtclEdazefvpcZR2v9Ysg==
X-Received: by 2002:a05:622a:5cc:b0:4e8:a51e:cdbc with SMTP id
 d75a77b69052e-4e8a51ed369mr89144771cf.43.1760875911633; 
 Sun, 19 Oct 2025 05:11:51 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-377a91b7111sm13663761fa.7.2025.10.19.05.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Oct 2025 05:11:49 -0700 (PDT)
Date: Sun, 19 Oct 2025 15:11:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 4/8] drm/panel: Add Samsung S6E3FC2X01 DDIC with
 AMS641RW panel
Message-ID: <32iy3k5aq7aiz3juq5i2wnnidsmbde3kdixlkpxrvgv75573ow@ebo3pi6kbr6n>
References: <20251016-s6e3fc2x01-v3-0-ce0f3566b903@ixit.cz>
 <20251016-s6e3fc2x01-v3-4-ce0f3566b903@ixit.cz>
 <didkbltadu4ql6xcqtjrtf2iguody5bgy6mqlwtbyfgbambaii@mzofzymnfbju>
 <d13cdf83-22df-4a24-a711-2db4abe3a0a8@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d13cdf83-22df-4a24-a711-2db4abe3a0a8@ixit.cz>
X-Authority-Analysis: v=2.4 cv=KcvfcAYD c=1 sm=1 tr=0 ts=68f4d589 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=WFa1dZBpAAAA:8 a=bBqXziUQAAAA:8
 a=yoNOsk6A1An68yMDdNAA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=MZguhEFr_PtxzKXayD1K:22 a=BjKv_IHbNJvPKzgot4uq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNSBTYWx0ZWRfXxxgC5VG1zKov
 LzwEDWIMN9nncSl+eDoLMlO8IsH1NcBTRTCQYWrUNNhsVzkMsL4kGLu1ahWxhVbi4V6dfqxVFZQ
 xr6areT+POGKIfGuTABbXw5HQSUy7pBFvEG7eqvag0Qd/0evs19c29uhrFcB5qMWdsbRD1LNgaG
 hXH0QjWYmkAf2BjOe1eVw34gBkA/NnNNc63Z5DKNwi971zkjfBhlfLJYt5NV6eX9fhCDn5XlbWf
 tu5cVrljakLG+kCrqLs0nuD9zflhB1ElKOqszRkMgtia1MdpBfVhqubqrp8c3gVUBqhJ9cdObyO
 XxEazlCJ6tppZ2qch55QIeCsVBz1pFf/gixL4OpznsJhbl2Y5JG5lOLjvSZr+Q98IPWqVgB44nO
 AMGtLeyK0kSyQQJF7PVFZLLPR9Ycew==
X-Proofpoint-GUID: ICvgX9KGizpAAKvMwwOc96JsYxVx4s_h
X-Proofpoint-ORIG-GUID: ICvgX9KGizpAAKvMwwOc96JsYxVx4s_h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180025
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

On Thu, Oct 16, 2025 at 10:46:56PM +0200, David Heidelberg wrote:
> On 16/10/2025 22:12, Dmitry Baryshkov wrote:
> > On Thu, Oct 16, 2025 at 06:16:59PM +0200, David Heidelberg via B4 Relay wrote:
> > > From: David Heidelberg <david@ixit.cz>
> > > 
> > > Add panel driver used in the OnePlus 6T.
> > > 
> > > No datasheet, based mostly on EDK2 init sequence and the downstream driver.
> > > 
> > > Note: This driver doesn't use previously mentioned "samsung,s6e3fc2x01"
> > > by OnePlus 6T device-tree.
> > > The reason is because DDIC itself without knowing the panel type used
> > > with it will not give the driver enough information about the panel used,
> > > as the panel cannot be autodetected.
> > > While would be more practical to support the original compatible,
> > > I would like to avoid it, to prevent confusing devs upstreaming DDICs.
> > > 
> > > Based on work of:
> > >    Casey Connolly <casey@connolly.tech>
> > >    Joel Selvaraj <foss@joelselvaraj.com>
> > >    Nia Espera <a5b6@riseup.net>
> > > 
> > > Signed-off-by: David Heidelberg <david@ixit.cz>
> > > ---
> > >   MAINTAINERS                                      |   1 +
> > >   drivers/gpu/drm/panel/Kconfig                    |  13 +
> > >   drivers/gpu/drm/panel/Makefile                   |   1 +
> > >   drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c | 399 +++++++++++++++++++++++
> > >   4 files changed, 414 insertions(+)
> > > 
> > > +static const struct of_device_id s6e3fc2x01_of_match[] = {
> > > +	/* samsung,s6e3fc2x01 will default to the AMS641RW mode (legacy) */
> > > +	{ .compatible = "samsung,s6e3fc2x01", .data = &ams641rw_mode },
> > 
> > Is there a need to probide this kind of legacy?
> 
> I don't know. I don't see the need to provide it, but I understood you may
> want to have it. If not, please tell me and I'll happily remove it from next
> version.

Since this never worked as expected and there were no DTs in upstream
that used this compat string, I think it can be dropped.

> 
> David
> 
> > 
> > > +	{ .compatible = "samsung,s6e3fc2x01-ams641rw", .data = &ams641rw_mode },
> > > +	{ /* sentinel */ }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, s6e3fc2x01_of_match);
> > > +
> > 
> 
> -- 
> David Heidelberg
> 

-- 
With best wishes
Dmitry
