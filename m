Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4DBB577B6
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 13:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9185210E382;
	Mon, 15 Sep 2025 11:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b8lPHVRl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB5610E382
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 11:11:36 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8FiWD002363
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 11:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=XdB3ee82a2VvLPTM8C2BPhUv
 8QQP4Ys9XkdbXnW+eOQ=; b=b8lPHVRlg58D7grObMkFW2yhxHYUpSReSO//bFgt
 K1aPjRR7J4L3lRfXgQNWz4WNwK2QpCBReGkAlR1ZXvXlHCTLmsbHvxe9dFU3fVhU
 ewylHzFtHiW8t05WXwmLq4c/67lZUZXTWjs4CcgC3fTJ9Ng6j3zT2D2QVycPLtTd
 M1zAUE3tFEXc/hW0xkLgZVnqCUEHYTUvZlpaAGUY90kF9eVRD75BThmSVkptX5YM
 HSu3MpXvUo4tN9LxZlaMhnIKe8GhtFSU3zf8QosHclgN8eJeP5yFBCsJIVXZ8TI+
 f6SBjAJq1eVDMG5aJ+JkxKeiF7Ahl/+r6LolX9UoLgsP6w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496da991h9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 11:11:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b5f31ef7dfso95634331cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 04:11:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757934694; x=1758539494;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XdB3ee82a2VvLPTM8C2BPhUv8QQP4Ys9XkdbXnW+eOQ=;
 b=CwRh7dCPtN2cZyM7k5hsSTLahXaqCVvTSSrHx+OlfkOQg7PiC7DbSm82mABk5qgpum
 mlgFz+svyDiRz5IMcPBd8tm6b98dRbQE+RdF7MrCHnLz1d5LWdmO6/RPS4mX2uDxVf+g
 3NjSqCjsg/KPT/KoIE2IWKHC1IsB5C2/3VU3pErj5rJmRSzms1Zid0bwGNPYay5F3PXR
 glw7MV9qlxWOQl7arHXSt+bqq8twHihAUyzDPLmJTAO/AqPgzkmsnBpVJ93n6pNkErtX
 ZaePmemVsp+Vsah/Hn7dvwIz+K2oaRWz19H35qy09dpHJg8CuIR44lp0SGkeSzUuSW50
 ybbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcooas4s4KL1/NAyCoJxYYmimFhrjESUiaCdymEL8BMlCFRD2U9IdbW4E7AbZZd8BkytP7RrezNzE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjVqOcUtGC6CAKj9Qb0glERSzTLDgjVhK1ZiNIzaeHSuOiB8no
 oyY3Il7+EKBUW/hS6jUNzz+grEqCVxfNpCory1KF+25g+fCpfOBXEIY0Y/bT6J2NU/+qA7/rTA/
 7+iNS+ir4ycV/62MYLSb6E8eCCQnBQAH7p3qeaH1vXvtYUQg6tNArSHF/nZ8ewwi9C6h26m8=
X-Gm-Gg: ASbGnctBp9ghUpXFr7Uk/fNqjQcPOmQPUnJNIfDR1bZ210o6mZVUmDWU5+7AecV845v
 rsDzjAbP2zJz4NQdtyjMXZ9kAj5awO2KxWB8APXl2nLdTpbL7yh2bYWLMpFXy/GqYXJjgLTxytj
 QpTsP06yr1CVB0AzYNw2zghaJ2Xkj+FzF9dKSTlYYyg6opXsDoH1zP3Rnkkg2pyASklXDJJcqJ0
 5XxM2lT43HhijQkriLHNrE2PooiwK4R8mxCJezDUPoqoDAnEAv3OznnMcFo79c3/wuyHWJLYF0h
 6W7xkaIQlbDlPIKr8HlD1xPQ4SMvzTwlFhLn1eYVxBecFFw/+RCFeYRbXBpxkzFa3dYgethhIsv
 Ua+t5zSUn7kF2IDEBN8fgukU161h5SMuy6UjQHidWQyGlxNX6VHSU
X-Received: by 2002:a05:6214:9ab:b0:784:b299:9c29 with SMTP id
 6a1803df08f44-784b299a052mr15325336d6.26.1757934694450; 
 Mon, 15 Sep 2025 04:11:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHT3PDb/ZyytqoXXQM/9aC2/b+zBIr8oo77lrn1IuoMlX4o8MvEYE7fMWu3HsGJjprRAtyb1Q==
X-Received: by 2002:a05:6214:9ab:b0:784:b299:9c29 with SMTP id
 6a1803df08f44-784b299a052mr15324886d6.26.1757934693893; 
 Mon, 15 Sep 2025 04:11:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e6460d4b5sm3552605e87.97.2025.09.15.04.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 04:11:33 -0700 (PDT)
Date: Mon, 15 Sep 2025 14:11:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Molly Sophia <mollysophia379@gmail.com>,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>
Subject: Re: [PATCH v6 2/3] drm: panel: nt36672a: Add support for novatek
 nt35596s panel
Message-ID: <a5zz3piadpmi4atnnafa5bfz32da4nioob7xsmqtyhgpjpqz5c@zzoa72rgwaet>
References: <20250913-nt35596s-v6-0-b5deb05e04af@ixit.cz>
 <20250913-nt35596s-v6-2-b5deb05e04af@ixit.cz>
 <xi65tabv4sgblzmw52wxci5wsrdahshvos5we5wko4kfcfyozp@y3vw5gt3elwv>
 <ad1764a3-12b3-4c30-9b79-313d9c1d37eb@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad1764a3-12b3-4c30-9b79-313d9c1d37eb@ixit.cz>
X-Authority-Analysis: v=2.4 cv=M+5NKzws c=1 sm=1 tr=0 ts=68c7f467 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=Vt2AcnKqAAAA:8 a=e5mUnYsNAAAA:8 a=pGLkceISAAAA:8
 a=QX4gbG5DAAAA:8 a=KKAkSRfTAAAA:8 a=mCu-rAxjWtjh-wTS5UcA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=v10HlyRyNeVhbzM4Lqgd:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=AbAUZ8qAyYyZVLSsDulk:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: u8vICoL4lND7PwfS9BGKg9afy3PDJ_vI
X-Proofpoint-ORIG-GUID: u8vICoL4lND7PwfS9BGKg9afy3PDJ_vI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA1NiBTYWx0ZWRfX6YsiaPCaECNr
 5RKCmoiqSq08UpqgXAAWkZEfdJ2gUgdwHbT+Mpxes2yaFA2hYSWHpAiTpK1nsZK9qrBfUD4JAnb
 EYZakBVUY/DYJ9fsvLvTTtYOLswnSPWAdmoHf5tEctVQJeR06xSE5UKUXeQOUr2N+3lwDQYMxWo
 Kh4+r3xgMSxzFvqPx3Y4M5X2XfRX3W4nuCz5VA17mEhL1Pj+/3y7fYC+UfGy5yBWi2pBwQ3QTNR
 XiDv3l+VD14IOEtsC/6zPg14wMSqH7fc0ebG84aQoxP4/mhnkWwubkqVA2wnc8pCgjo4imlfWd9
 x0YYZLkB0z+nPIYnPcXw7dnrfIih6Oedt4QRCWoMDdv0oEq+ILdfyN2DM+RfGCymmjbBwoIDzHh
 KeDSaRAW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509150056
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

On Mon, Sep 15, 2025 at 12:11:49PM +0200, David Heidelberg wrote:
> On 15/09/2025 03:29, Dmitry Baryshkov wrote:
> > On Sat, Sep 13, 2025 at 09:19:48PM +0200, David Heidelberg via B4 Relay wrote:
> > > From: Molly Sophia <mollysophia379@gmail.com>
> > > 
> > > Novatek NT35596s is a generic DSI IC that drives command and video mode
> > > panels.
> > > Currently add support for the LCD panel from JDI connected with this IC,
> > > as found on Xiaomi Mi Mix 2S phones.
> > 
> > Why are you adding it to the existing driver rather than adding a new
> > one?
> 
> Hello, originally it started as a standalone driver (see v2 patchset), but
> got merged due to similarities.

I'm not sure, you had to get rid of the two command sets. On the other
hand, adding a new module will add a lot of boilerplate. Let's keep it
as is. Please add some notes to the commit message.

> 
> v2 patchset:
> https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg404290.html
> 
> If it's desired, I can switch it back to the standalone driver.
> 
> > 
> > > 
> > > Signed-off-by: Molly Sophia <mollysophia379@gmail.com>
> > > Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
> > > Signed-off-by: David Heidelberg <david@ixit.cz>
> > > ---
> > >   drivers/gpu/drm/panel/Kconfig                  |   7 +-
> > >   drivers/gpu/drm/panel/panel-novatek-nt36672a.c | 225 ++++++++++++++++++++++++-
> > >   2 files changed, 222 insertions(+), 10 deletions(-)
> > > 
> > >   MODULE_AUTHOR("Sumit Semwal <sumit.semwal@linaro.org>");
> > > -MODULE_DESCRIPTION("NOVATEK NT36672A based MIPI-DSI LCD panel driver");
> > > +MODULE_AUTHOR("Molly Sophia <mollysophia379@gmail.com>");
> > 
> > ??
> 
> What's wrong with it?

I thought that the module can have only one MODULE_AUTHOR declaration, I
was wrong. This is fine.

> 
> David
> 
> > 
> > > +MODULE_DESCRIPTION("NOVATEK NT36672A/NT35596S based MIPI-DSI LCD panel driver");
> > >   MODULE_LICENSE("GPL");
> > > 
> > > -- 
> > > 2.51.0
> > > 
> > > 
> > 
> 
> -- 
> David Heidelberg
> 

-- 
With best wishes
Dmitry
