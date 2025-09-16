Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5082B59D30
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 18:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE2710E0DE;
	Tue, 16 Sep 2025 16:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dljyHedG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441B210E0DE
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 16:13:57 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GEGIPF007118
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 16:13:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=fUcHMwZ0rGqLMrSLWnbCu15k
 ya9bjClPzpZhwOEbIRo=; b=dljyHedGH2MLYXDB5jpTuhA801EXoxbb59IVqQsq
 20fd4As2kURD0F98V7ffp0fs34yNGnukicnX4sRAHB1J+hnEBgYwcyk6KxnbuXfj
 I6PCTQh9Zk3shH34pHQPqY9/POUw69LLbFXyPpIjwE1D+5/Hkw28Hs/dIoK8tOOH
 pcrnkrjDheyQw+uh4ne3XPXK/Q/kiiV6DZOaqGHMPH3mAlHwAyj8IH9VOBmfvhdX
 c9quLH7jVmjJZzOHpdvfbaDONHy+90ngG34YsZKnc/KXZly225ukNKy1TPKUjIlG
 DuYmnwYRmVDd7S2cUBa+q4MLmNO9p1g1BgzZuyYzbyiopw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494yma9hwx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 16:13:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b5fbf0388eso75952371cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 09:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758039235; x=1758644035;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fUcHMwZ0rGqLMrSLWnbCu15kya9bjClPzpZhwOEbIRo=;
 b=ibI9GNnsYM5biVeTkAapMyTDdO+nhtEilUDgvmXMZD6slDop4wNmsPNoA63SnEvEjM
 1WVpWnz8wv7SMynH3vK+fsyCb+hDuLBcPcTORRZv6Ogj2lQ0OlFsl6O5by1iakJaQ0Gu
 +q9gw7knlSTbZX2/F2fS7GD2KE8NBNGAicc7mXcB0rnW/YUYSOR0D1M5m6M1raNgwnuF
 I2d3ljcLlVBaIwjCWef51VX9eJg1U4jFqAe7ODvh5EKRxOA6mzYjyI1VnHAUOIkD/kOB
 nED8X6DLKPVvPhGqjHNzDmwA65vLOUf+ivZhzSXcdxsHKuKs3WMLqHgH3SuBi353+hQP
 tg6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGZi7lQ9VArEJfXKqCBhcjOU2yIBAiufJAHDDiZqUwK6hhgpjrmZoB35FPGxpFwA2KMY7WCWTPmUk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyY1VvBuat/q4/0NN3eqoJx5Mvr44Oxzspl3fg6JnAnJQTkyHjj
 vKYlb1zc33yuqAomLQroUj1pAUA7fCaHU2I2EqkZLaKRJP/I89MtbN5FRF2NUdxucF+1nKR2lc0
 VJwo0SWYJ1VB4kSqshFVu4uI60+Fy4pyYn0sj9OAMW5ASkQkjdjDuP7y+bv35xXl3fciD4h0=
X-Gm-Gg: ASbGncubfgkPI2v5Uz5qfi1MBlUqEpWZbFcMj0mgDVti16FXHMpHsL+4LGj8w6r1GAv
 rZLpyt2T7vQ7od6mC0I8H1g+9LxMSMfu5v2ZYAX3ZZD2NaUodH/Q4ATtC/qIob+fMM4AdzTgGob
 kaz3F+SIQ0mJ8STgGvaZILRVzZUbwM4BCbKoKnonppNUHoQ69RTPRlwWnaAfkB4JPrOukGBD+/X
 6bzRT1yMfayrjjw6crr4oj2wSkxq+L9V0HEAQAuDFV7gC8m06bm48mD2s8Tt4IcAv2E24bViOrt
 8Rp+wOMSvJIpto8bItSzc7AQ35jIdKgpdTNXGwtKj0oBeiQxEBsp5Cr6cHblq+qmCAKuf71spPJ
 TskTkq3Exgg6OnIzgwSQZ2b5DRMw8FvFb0ViD9hXhTY6ZSEZ1xLvj
X-Received: by 2002:a05:622a:2510:b0:4b6:36bc:55c4 with SMTP id
 d75a77b69052e-4b77cfdaa2cmr227359291cf.4.1758039235072; 
 Tue, 16 Sep 2025 09:13:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtQJq/yCE0NLbmwXGL4UZGw+3Gp9auhl6wG7bHuDxusqrI9kvBkOezy16S85q7JlYGwhpZsQ==
X-Received: by 2002:a05:622a:2510:b0:4b6:36bc:55c4 with SMTP id
 d75a77b69052e-4b77cfdaa2cmr227358591cf.4.1758039234329; 
 Tue, 16 Sep 2025 09:13:54 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-57108354ab0sm3762200e87.152.2025.09.16.09.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 09:13:53 -0700 (PDT)
Date: Tue, 16 Sep 2025 19:13:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 Marius Vlad <marius.vlad@collabora.com>,
 dri-devel@lists.freedesktop.org, wse@tuxedocomputers.com,
 andri@yngvason.is, sebastian.wick@redhat.com,
 daniel.stone@collabora.com, jani.nikula@linux.intel.com,
 tzimmermann@suse.de, simona.vetter@ffwll.ch, harry.wentland@amd.com,
 christian.koenig@amd.com, derek.foreman@collabora.com
Subject: Re: [PATCH 3/8] drm: Add new general DRM property "color format"
Message-ID: <sp7ujo4yjfujbzxr6iezbpbaae7qydquebltc2jygs26j22crm@s42xx5gaydqo>
References: <aMMDxIWN9TadgVyw@xpredator>
 <6zmp2dzpvcb4hi4kaa66q5o4rlcpdkor75ci4rnvalt2a37f26@lbmvc4t2ow4z>
 <CAPj87rNxGfroKTf1i5UtmmnZ9wDQTdZFDMKw-MLdbCfjTCD=Uw@mail.gmail.com>
 <20250916-piquant-jerboa-of-completion-87b80d@houat>
 <CAPj87rMuwvir_aDReT1ou-BNs3w9coUG6MPmCnGAeg5rQ97rCQ@mail.gmail.com>
 <CAPj87rPRG=7qPp3QMXf_6FP82-gWdgWpXdHmwZjHKrnU-PdQ0g@mail.gmail.com>
 <b6sosuofgvanq7hjj6lfev4ifu7muhhd45lncdu3m3r42rqwaq@tgxtumlxhtkx>
 <CAPj87rOUgY+WEP73hL8kWhgbXHG7krvraQb6n__tC=vr5y0=Cg@mail.gmail.com>
 <CAO9ioeXb0qcJsfjZMG=1MMUL7RWuge4h2zK7Q1y_u-FS+syGTA@mail.gmail.com>
 <CAPj87rNeMd87XZJQscLZVhrPtW+8y79kLFy1ZXUq9eOWrOwMFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPj87rNeMd87XZJQscLZVhrPtW+8y79kLFy1ZXUq9eOWrOwMFQ@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxOSBTYWx0ZWRfX9/vh0I29aGuu
 4gjV6mezGiq01g71iVysQJuJ6HhBSWn39A0EfovcF4aJG2iKcV9SIceZlNtajt90GlCuwTp0D7f
 g5LwR8+2wPoc4BSxM03nd2J1ONOTs69DJNFRMntBnXowbHx5uKUpseg/IZZTwPkJPurBYfd6qq3
 M/ywWbfTPuvcLoj/5pLifCb02gnkB8n8K28EeRStS06G/ZUiPbtj+Mp+4HxNMDsip0PZCz0oPe7
 9EkzBUqZB1/gkRakvPkG0I92HkyUotNfVhsEk+svvSAMzDXcx8i2tqq9GAH47dz86XSOUCOjTTi
 BcHf9Pa40+aFCcljsogBExoCgN0tSFFfqv9zq4RaPpZbm8gWUlwOHcTskKIHY8Zod5T2U9Bryt+
 un7fFa07
X-Authority-Analysis: v=2.4 cv=cdTSrmDM c=1 sm=1 tr=0 ts=68c98cc4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Mu7bQiZmAAAA:8 a=vyqWZklI4px8nqO-uvMA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=UWaJenGNYZZVxFGCzVlh:22
X-Proofpoint-ORIG-GUID: g9pGlxBtQJdhOTBD24lrANkWpUDikRLo
X-Proofpoint-GUID: g9pGlxBtQJdhOTBD24lrANkWpUDikRLo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130019
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

On Tue, Sep 16, 2025 at 12:35:50PM +0100, Daniel Stone wrote:
> Hi,
> 
> On Tue, 16 Sept 2025 at 12:15, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > On Tue, 16 Sept 2025 at 14:11, Daniel Stone <daniel@fooishbar.org> wrote:
> > > I'm slightly confused as to what you're saying here. Are you saying
> > > that it's OK for the kernel to expose connector properties for
> > > userspace to see which colour properties
> > > (model/range/depth/subsampling) are OK and control what is actually
> > > used, but your hard line is that the kernel must do an intersection
> > > between the sink EDID and the encoder/connector capabilities to filter
> > > the list to what it believes to be achievable?
> >
> > Yes. I'm sorry if I was not explicit enough. I'm fine with the idea of
> > the color format property (not just for HDMI, DP will need it too).
> > But I think the kernel should not be exposing 4:2:0 there if it
> > detects that the monitor can't support 4:2:0 at all. Likewise we
> > should be failing to enable 4:2:0 for a particular mode if the display
> > didn't list it in Y420CMDB (and we don't have e.g. a quirk of 'the
> > display lies, 420 is supported for this mode).
> 
> No problem at all, I think I was just being dense and not quite
> parsing it properly. :)
> 
> I can see where you're going. There's definitely quite a bit of sense
> in it - I'm just not sure about the value tradeoff, since I would
> expect any userspace which is sophisticated enough to want
> fine-grained control (as opposed to 'just get the splash screen up so
> the user can enter their LUKS passphrase'), to be sophisticated enough
> to also be parsing the EDID.

That's fine.

> So I would still lean towards it not being worth the complexity in the
> kernel to implement validation for userspace which really should know
> better - and which already needs to have fallback handling for silent
> as well as explicit failure, given part of the usecase is to be able
> to deal with marginal signal propagation. But I'm not really against
> it, so if you really want to see it then that should be fine.

Well... I really think that we should not be exporting the values that
are going to fail. In the end it's as easy as checking what was parsed
from the HDMI VSDB and Y420CMDB.

Moreover, those checks would also fit nicely into the
hdmi_compute_config() / hdmi_compute_format() (a part of
drm_atomic_helper_connector_hdmi_check()).

-- 
With best wishes
Dmitry
