Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73311B5847E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 20:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E83410E531;
	Mon, 15 Sep 2025 18:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hct3YM5V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D17110E531
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 18:22:52 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FE8N9t018045
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 18:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 F1LjIqAwbyBFY61E2h7fViEwka8RdZtiySWmXgTI3a8=; b=hct3YM5VCcVXNXsm
 JNY1lgpvsscIGnVixGxMLCvDrkhKt9qGRTGAM9LmAP7OU0I6uH9BKx/svAepFs4x
 gk3TQWQFnHaFKeMZw6i29fMtTmBummUwei5QiW1UpabMCTTKzcUNRels/Q56xoYI
 88+6YHTa7s7+RhjG5fbBSLK6fVzkU0oj5Ktvn12BdJfAb70MWQQsFd7W3Z+i646E
 aqeDuItCY7OXWCjW7RjFhZxlgYlvN92LtMzWuRRw9I/f6y0jDvUJNDKUFHZK6QH+
 XQv+NptwYm4OgjT5VD226EtbH3U/N6v3K++W+VMvg5iUdh9CjhfvU90Oga6RZZae
 BDJxRw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4950u560qj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 18:22:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b32d323297so98628441cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 11:22:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757960570; x=1758565370;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F1LjIqAwbyBFY61E2h7fViEwka8RdZtiySWmXgTI3a8=;
 b=kWeCIK8Jr+ApJ1tKFzxIIls4cUM4mpZKZPbRQTpBKJW4DbmSKQ8SFDMz5qC4SoTd3E
 f+xRyf6MINT22SC63RZT2UT/xGJOCo9hVbR0sAYSJv/HzGNNR+gJXl6y87B3kJqWW8IM
 TxA3pOYYcLdKhm0bzGtFrPagKC3BQcUpPOcYDcB6wMB6w7/GedLhrM0l80hk5ZOVRSfb
 vmwWOJ1Uc/kxMBr9tG6zDIHzAupPooINeY/rUuyQvK3o2uK7HWU4khwKjV01YaoIhRaX
 4sJAqv0qFZz8n5962kdTCs8YLqdVWAM4FtiDClfgAbqIhIcU73CpJUnepACfyZEF+xA7
 TWFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUH/DD5p4ERqj8iDo5UtkeBin7JiThHEau0rwcx9nFbtkAkizhT9SHXPj97GNW/6yn4MahACuEATu4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJilVbqJ5FTGpDKyjvXW1NUZQHWfEE1nLDuObwxDp+9ArrX2v8
 9lQuoUNhA77LxvP3z0oQEDCttIdaVnZnh9UXtnRSVXoPSA16dCr8zwl5uKt3Gh2JdYzC15g4iwI
 OjazRe/fjIgZp1QGXlChTJ7mo4q9L6JXoteBE8QkhMw22zJsblfi+zjUFCrqkJ02WtxzbljQ=
X-Gm-Gg: ASbGncsHa1Bk+P9g0XUP1omw3VxPJemfBhj8OTi3QZ4ouJQumARIhL+eBlpTTnXjvk2
 4lkYkuFlKqm/f7d4m7sBAGOnKRzc6T2xoHvhRoVj5pa61mYjvRj9CmO2MYdzm6DpWPXaCEg3F8b
 yeVP1GbNgj5wQhZ5mD0oIV/TTCYhBMcrejUp2kTGYJNbCpxu4MzRCrPt7l85z9MvirmKX8QRa9p
 0d24rgIxBdxi7E908pH7U/6R+UTjvNsHdld8hug9VX1CAW0nnkYcryb9vBUyQ0oW/Hu+FXvaM2q
 avKQnM58vw9XPWKxWQMPve0+dsklShfDcFWhqTH/WnYYZHo6cNvY2SjqM+HR+U8/nra837f/oDr
 Eg5WrXUGKz8yp8MrL41nF8iWojTbSG8ZWxNms5w9iLUD5R58oeJdH
X-Received: by 2002:a05:622a:2448:b0:4b5:ea1f:77ec with SMTP id
 d75a77b69052e-4b77cf3fd63mr188714951cf.0.1757960569956; 
 Mon, 15 Sep 2025 11:22:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAuVVuM0n9l3Cg1YMA/er5S/o95KrZuuWZTRloeO1lERKI/EYVWxGvd6dsy0z2sc5Sm5CG7w==
X-Received: by 2002:a05:622a:2448:b0:4b5:ea1f:77ec with SMTP id
 d75a77b69052e-4b77cf3fd63mr188714401cf.0.1757960569240; 
 Mon, 15 Sep 2025 11:22:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-573c8330d2csm1333852e87.58.2025.09.15.11.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 11:22:48 -0700 (PDT)
Date: Mon, 15 Sep 2025 21:22:46 +0300
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
Message-ID: <ylo6kh6wqzpedoibc52qjbb3fbmiofclfjj2zog7sufn4rqyvf@jxcxjft56czl>
References: <20250913-nt35596s-v6-0-b5deb05e04af@ixit.cz>
 <20250913-nt35596s-v6-2-b5deb05e04af@ixit.cz>
 <xi65tabv4sgblzmw52wxci5wsrdahshvos5we5wko4kfcfyozp@y3vw5gt3elwv>
 <ad1764a3-12b3-4c30-9b79-313d9c1d37eb@ixit.cz>
 <a5zz3piadpmi4atnnafa5bfz32da4nioob7xsmqtyhgpjpqz5c@zzoa72rgwaet>
 <4a718ca8-cc40-4642-9f88-b654a90045cf@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a718ca8-cc40-4642-9f88-b654a90045cf@ixit.cz>
X-Proofpoint-GUID: oVpC5O4UcKfVqAQjWsilgVzNXtdVTFWo
X-Proofpoint-ORIG-GUID: oVpC5O4UcKfVqAQjWsilgVzNXtdVTFWo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzMSBTYWx0ZWRfX6F8Bk9Ra+EVl
 DgnXDnurATp32mQ4lO5MNQByXwEDqj/yEoCQ55npuLZXQTW0pVYVbYfMDAAWc6DNx/As8+mlTyz
 t3cf3192I3J4+33CC1HCR/7qTDr85Obdye4wdr9jAWkUPLznTTxzLHMW2/7XKTp6Fef6NgNIDeR
 mpeCPd6tUugmNg7AFEuGlX6gJ7Qo3am6qA64ZAMADPDe1gmXaFV3RF66E8N49GgDaatxvXLL4wr
 Bba/ZyWnCX0WkCf997sXgDPMUVkDXbDU/rjD5ZvalPZ3VS6b5/TCXdf8yWyPQ+Pf26Ff3r14h/G
 VS10VfrUNdE7B6PnAIJ1l09pHFpaTAWJ6EIQH17SOe9ITW2Vq+vF9272kRt7Sir1St4Eb97BN0G
 36GgP5Xx
X-Authority-Analysis: v=2.4 cv=JvzxrN4C c=1 sm=1 tr=0 ts=68c8597b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=Vt2AcnKqAAAA:8 a=e5mUnYsNAAAA:8
 a=pGLkceISAAAA:8 a=QX4gbG5DAAAA:8 a=KKAkSRfTAAAA:8 a=wCpFDx9_YxCViFKvQc0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=v10HlyRyNeVhbzM4Lqgd:22 a=Vxmtnl_E_bksehYqCbjh:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_07,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130031
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

On Mon, Sep 15, 2025 at 05:06:51PM +0200, David Heidelberg wrote:
> 
> On 15/09/2025 13:11, Dmitry Baryshkov wrote:
> > On Mon, Sep 15, 2025 at 12:11:49PM +0200, David Heidelberg wrote:
> > > On 15/09/2025 03:29, Dmitry Baryshkov wrote:
> > > > On Sat, Sep 13, 2025 at 09:19:48PM +0200, David Heidelberg via B4 Relay wrote:
> > > > > From: Molly Sophia <mollysophia379@gmail.com>
> > > > > 
> > > > > Novatek NT35596s is a generic DSI IC that drives command and video mode
> > > > > panels.
> > > > > Currently add support for the LCD panel from JDI connected with this IC,
> > > > > as found on Xiaomi Mi Mix 2S phones.
> > > > 
> > > > Why are you adding it to the existing driver rather than adding a new
> > > > one?
> > > 
> > > Hello, originally it started as a standalone driver (see v2 patchset), but
> > > got merged due to similarities.
> > 
> > I'm not sure, you had to get rid of the two command sets. On the other
> > hand, adding a new module will add a lot of boilerplate. Let's keep it
> > as is. Please add some notes to the commit message.
> 
> Ok, I found out in the meantime that Alexey is working on refactoring
> nt36672a, so we’ll coordinate. I’ll likely need to rebase this changeset on
> top of the refactored nt36672a, or possibly move it into a separate driver.
> 
> See https://github.com/sdm660-mainline/linux/pull/114/commits

I think it fits even more after refactoring. I hope Alexey will post the
refacrorings soon.

> 
> > 
> > > 
> > > v2 patchset:
> > > https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg404290.html
> > > 
> > > If it's desired, I can switch it back to the standalone driver.
> > > 
> > > > 
> > > > > 
> > > > > Signed-off-by: Molly Sophia <mollysophia379@gmail.com>
> > > > > Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
> > > > > Signed-off-by: David Heidelberg <david@ixit.cz>
> > > > > ---
> > > > >    drivers/gpu/drm/panel/Kconfig                  |   7 +-
> > > > >    drivers/gpu/drm/panel/panel-novatek-nt36672a.c | 225 ++++++++++++++++++++++++-
> > > > >    2 files changed, 222 insertions(+), 10 deletions(-)
> > > > > 
> > > > >    MODULE_AUTHOR("Sumit Semwal <sumit.semwal@linaro.org>");
> > > > > -MODULE_DESCRIPTION("NOVATEK NT36672A based MIPI-DSI LCD panel driver");
> > > > > +MODULE_AUTHOR("Molly Sophia <mollysophia379@gmail.com>");
> > > > 
> > > > ??
> > > 
> > > What's wrong with it?
> > 
> > I thought that the module can have only one MODULE_AUTHOR declaration, I
> > was wrong. This is fine.
> 
> Yeah, it's not usual to have more than one.
> 
> > 
> > > 
> > > David
> > > 
> > > > 
> > > > > +MODULE_DESCRIPTION("NOVATEK NT36672A/NT35596S based MIPI-DSI LCD panel driver");
> > > > >    MODULE_LICENSE("GPL");
> > > > > 
> > > > > -- 
> > > > > 2.51.0
> > > > > 
> > > > > 
> > > > 
> > > 
> > > -- 
> > > David Heidelberg
> > > 
> > 
> 
> -- 
> David Heidelberg
> 

-- 
With best wishes
Dmitry
