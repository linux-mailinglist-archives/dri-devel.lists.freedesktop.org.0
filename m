Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6F5A631FF
	for <lists+dri-devel@lfdr.de>; Sat, 15 Mar 2025 19:55:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF1810E120;
	Sat, 15 Mar 2025 18:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C24mY4aT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE72E10E120
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 18:55:31 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52FAU0jp002370
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 18:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 K/Bg+0bSqCV2Vst9e1gE04trcb0kg5qeBGjARd0aKNk=; b=C24mY4aTn8XtB5D5
 7PUaCHvanRm/JBMF727XjluFgNAFmCm5uQ0ab630erausZxnmlL8H2jCakQpTZ4Q
 9NrKsssILVV7GqhQWjz4Q1ZRcWR3y2qcw7w3YfecepIxV2gn4F7213ofQUyB+mJt
 Id12WRW403e1+OHkk3toGf3iPuFcsULR+H8fdDG9X74/EgFnoGz9s57vSoRLFfDG
 OjBNEo/mwaFGjv+wacRqKDz7ypAZUqu+rMIKnJ2h2lhXyY+PeNfMComIRCx4/1pM
 O7DeQVkZRGMYaxoJ+YU2Evyhbff+CGzt5l2GsPrKu3I6GBnadN2a8Vl4AV9KhPY2
 s8AcoA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d2ah92cp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 18:55:31 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e8f184b916so95291276d6.3
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 11:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742064929; x=1742669729;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K/Bg+0bSqCV2Vst9e1gE04trcb0kg5qeBGjARd0aKNk=;
 b=c5kln8lBt/armkb4+R2F5Wjf17tlmFUx6R3Yhg+CjUo/K0HYw2sxjEh/DKEL11qAPQ
 7rKbXlObepMWqf20P+y3HdHGhSGmfFHmjFE3E9xrYeL/Hyyj2eNzlpX2aQqFU8uJ1ZHp
 8OLh0gG6s7WMCxW6bJSPx/XQNA1KnmrKFQfeh/8HWebd8EWPjE2/TV/L/ZTy78YolF9x
 3bJDE1N8D67xePM7WVndkAmSFozgqnprw8mSbTGXKJd2oYBJmPvgcPFEBO0TmDniT8Hw
 fC8V28/cg1velz0NEH05hCT8uu73HsDSetTjP7GFoqiHNcc45/iYgqFZmbdQoxMRjMG5
 v4Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFR9hwpFYORZ77/aw24V+xYsVjlCg/mw3I6SOOuAwBRNQHFz4firrUY0ogFxFbj6LiG6bVmyyWGNA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQy8/HPed9AR3RUbr87S/4avE92XZkBDx5lLUWenwcJ2YQPYzz
 Rxqe3Km8ubfXL9mXkEVpcS3+QPc7cyZx7Zrjlv+ENOUNRK3wjSQ7dwGlUe9l15YYyh2JgRrVmRI
 uwsS4z57gYkZImIIRhLW4G9Exnxl93sv1tTZN9c9OZLfDnj1SvQx6ZQzAZnGCs54V8bWvrWZPSR
 M=
X-Gm-Gg: ASbGncu26RAv9fLeXfFSic22KFULJiUJLGRMR/2bP+vWJiZyJLceskTA3DerPthkzs7
 Sml9TI+g+zKSFhiWuoeeGFyoMMvSPggVvJDr2Xp5NYct6egp+GiCKK1P6oQde51ZR99k8azYIyJ
 TUIV6jht8ugDPFGKbyK3r2K2D9NUzSOOw6ptFNIM6foKQhv8/T6vnHaB7GDYbsMTHlzTs9Foyj+
 awGjcVdOOQATMdB0UxpHoxQEbCbIYpN1FuFE0+FZUT+RznX1yYjobWAw3/O1lsUHsAvKi58DEiI
 3yEE/jM9ouLe8yl9xbFR1iJfrfOil/CAmDXVqOGnr5qT5PCkTOFxg5nbyEc/aGICEN8BPYH11DU
 KaOI=
X-Received: by 2002:a05:6214:29c7:b0:6d8:99cf:d2e3 with SMTP id
 6a1803df08f44-6eaeaa50d3bmr104586726d6.22.1742064928991; 
 Sat, 15 Mar 2025 11:55:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDiE3Ox1WAqlrYpcBS2XWwNVDHpecP0pAZ5Gz+cJQL6mkL94PZDr/YFxU1JuA49DIFbIpRHA==
X-Received: by 2002:a05:6214:29c7:b0:6d8:99cf:d2e3 with SMTP id
 6a1803df08f44-6eaeaa50d3bmr104586426d6.22.1742064928564; 
 Sat, 15 Mar 2025 11:55:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba882806sm861886e87.191.2025.03.15.11.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Mar 2025 11:55:26 -0700 (PDT)
Date: Sat, 15 Mar 2025 20:55:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alex Lanzano <lanzano.alex@gmail.com>
Cc: Josef =?utf-8?B?THXFoXRpY2vDvQ==?= <josef.lusticky@braiins.cz>,
 dri-devel@lists.freedesktop.org, noralf@tronnes.org
Subject: Re: drm: mipi_dbi_hw_reset() keeps display in reset
Message-ID: <6t4atietudbk7i7l7wsnxz7gq5cbivwkkxrki4m3azyeookygp@ap5vinadljix>
References: <CACnTymYtkLJ=EfZK-c1nCW+bLSKAaq2sTW1x+Bj-_ve7hfAdKA@mail.gmail.com>
 <n7qaikyyisdq3m74buqjfxzyi5lgntnsmtirrmw5vi2nkf7izl@6coklitzp3uc>
 <fm4kqbfknroub3onbbhbzvurw7ig3fsjrxpeucdtioobssstjk@hzmdxa7uby6f>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fm4kqbfknroub3onbbhbzvurw7ig3fsjrxpeucdtioobssstjk@hzmdxa7uby6f>
X-Proofpoint-ORIG-GUID: _cWpuy-CM7odWBa8YBXVlQf8QbOMQM5h
X-Proofpoint-GUID: _cWpuy-CM7odWBa8YBXVlQf8QbOMQM5h
X-Authority-Analysis: v=2.4 cv=R7kDGcRX c=1 sm=1 tr=0 ts=67d5cd23 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=e5mUnYsNAAAA:8 a=1kwgJe286sTN27keIREA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-15_07,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503150136
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

On Sat, Feb 15, 2025 at 02:14:54PM -0500, Alex Lanzano wrote:
> On Fri, Feb 14, 2025 at 08:04:41PM -0500, Alex Lanzano wrote:
> > On Fri, Feb 14, 2025 at 10:29:29AM +0100, Josef Luštický wrote:
> > > Hello Alex,
> > > there is a bug in mipi_dbi_hw_reset() function that implements the logic of
> > > display reset contrary.
> > > It keeps the reset line activated which keeps displays in reset state.
> > > 
> > > I reported the bug to
> > > https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/63
> > > 
> > > Unfortunately, fixing the bug would mean current DTB-ABI breakage and
> > > device-trees modification would be needed.
> > > I mainly write this email to let you and other people know about it, so
> > > hopefully it can be found easier.
> > > What are your thoughts?
> > Thanks for making me aware. I'll dig into over the weekend and get back
> > to you
> 
> Alright so I looked into a bit more. Looks like the MIPI Specification
> says that the reset line is active low. So, if we want dt entries to be
> correct the logic for setting the reset line in mipi_dbi_hw_reset()
> should be flipped. However, like you said, this is going to cause a some
> confused developers to break out their oscilloscopes to figure out
> why their display isn't working.

Would it be easier to flip GPIO flag in DT (and explicitly document that
the flag is to be inverted)?

-- 
With best wishes
Dmitry
