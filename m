Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED127B594E3
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 13:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A50010E03B;
	Tue, 16 Sep 2025 11:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VCibe34o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96A710E03B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 11:15:45 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G9bti8001512
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 11:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=EF/S6FDzLcaJWs7HvTl1ShFJ
 hPhwV2oWvbXTPFhEkJ0=; b=VCibe34onAgpZObd2vq6ZmxrnjuoafNmA7uKmMJ+
 fomPUMDuJ81vFHDuFr/AXL7lP3T+pRVJoDk9m3VBZkDukGpa7kl6tizOExosPM9X
 TUYFUTkObozvgE+sKfU0u61ObdC8CakUTyfMHQek8EhwuYsbk8UEVmKBle4zXCMx
 R3nufq+vXgUBczUIuERrhKQ7x2J1JxNL9JFXuM4vE89F+lJdJ0x5OH6tqCRpyxAP
 Sh20Rfx/P0aTkT+UjCigusbOhRII11mwFHYg6KqQDXSvbVbBxkYEeHXu/Lot7K+z
 m9jKwQ4mFaiIRtz1q3iTYqAW3Kf+gEoBI3/Gqfoe/mmdaQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495eqpympb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 11:15:44 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b54ea95c402so98596a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 04:15:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758021343; x=1758626143;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EF/S6FDzLcaJWs7HvTl1ShFJhPhwV2oWvbXTPFhEkJ0=;
 b=ToRBKWWzqIJdysBq21rLop6YSNSd0cWLrVOl5psiBggSVzDtEgr9k6V5TiJPy+gW3S
 TssGCByfC4WjBdZzzmTXp8QxlKD5lSAxkjuX62gn10BlpxCgTOjA9HiKBUCcz5vYybIA
 xsYEeEtvgleV1E2d7aNm3eX9Ly23LYt9h968qROT375iwujBR0K7XFiQKMtmMyGsxeOL
 cJtfmXJso8GDM/jdLxNh/Io5MuKEs6/dPbkTsf+M6TD9co3/PMf/NbuuuEzSoHbW+H+0
 QYpR3TvEGhgZeStoiGFkNp1V6S+ZyvzMTP/mgWWag3K1JdHzGJkMdHpjF2LwmtFRncqj
 mC9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNtTNJojTE0nE/aGScmGWnIqHKEaCQjTbLv0W8c7d3mQ4r0GChwyY8FQF7YtwycI9PKfekE2E007M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOJRadyLvk0hJR/E5QUtv3EVOw9APmFtSBuTbfrkt6XD472tvu
 epP9EiJiGteot7cPc5TQvF0RJZiL2k23CGyck8pRJS76fqPwzxA95jt36MsTt20dzWyrklWrDqb
 uoOby7GKA91bVgUreKDAXi0fAHfIbUrzuVdewqxNzP01bN0O8720Ocfq8UuvFFSD0XNSv5w33cV
 LF0EN3BsU7YHA4P6BEwZrqeX9XNIneRpl//qd1yYZ5TBkfkA==
X-Gm-Gg: ASbGncupSncJtOmxYWGqcpzc4ixkoweLGTNqdZLVNU/6MGWa+dGL+alwIbwyh2WJyxx
 3Lsid5vykU/so8Lb3hrg79tyhpHwJOlHjhb65b7+TTL4EiQkTtu/4IrrVMd+3njE/2htkwLS+xD
 /o8sEIXvTtiA0x4lFbqihyaA==
X-Received: by 2002:a17:902:f707:b0:25e:78db:4a0d with SMTP id
 d9443c01a7336-25e78db4d35mr157341775ad.36.1758021343410; 
 Tue, 16 Sep 2025 04:15:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFc2Z5lFZhJY9bsazp6OwSaOuU8wJA9but0dZjgdmcKOPYzxMzIDTJny2BCYClCgkV7O2ieYZCSKCnOU5yAkec=
X-Received: by 2002:a17:902:f707:b0:25e:78db:4a0d with SMTP id
 d9443c01a7336-25e78db4d35mr157341435ad.36.1758021342860; Tue, 16 Sep 2025
 04:15:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250911130739.4936-1-marius.vlad@collabora.com>
 <20250911130739.4936-4-marius.vlad@collabora.com>
 <ssvxorsrhum2eo2uiieradrrmytemivr6m5c3mskalehzaj4ci@nc74epxgjq5w>
 <aMMDxIWN9TadgVyw@xpredator>
 <6zmp2dzpvcb4hi4kaa66q5o4rlcpdkor75ci4rnvalt2a37f26@lbmvc4t2ow4z>
 <CAPj87rNxGfroKTf1i5UtmmnZ9wDQTdZFDMKw-MLdbCfjTCD=Uw@mail.gmail.com>
 <20250916-piquant-jerboa-of-completion-87b80d@houat>
 <CAPj87rMuwvir_aDReT1ou-BNs3w9coUG6MPmCnGAeg5rQ97rCQ@mail.gmail.com>
 <CAPj87rPRG=7qPp3QMXf_6FP82-gWdgWpXdHmwZjHKrnU-PdQ0g@mail.gmail.com>
 <b6sosuofgvanq7hjj6lfev4ifu7muhhd45lncdu3m3r42rqwaq@tgxtumlxhtkx>
 <CAPj87rOUgY+WEP73hL8kWhgbXHG7krvraQb6n__tC=vr5y0=Cg@mail.gmail.com>
In-Reply-To: <CAPj87rOUgY+WEP73hL8kWhgbXHG7krvraQb6n__tC=vr5y0=Cg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 14:15:31 +0300
X-Gm-Features: AS18NWA3kOt6A7gqBCx-mXGevrQAowc_B0fgiIvUlZIzFUwoiLuV3rE0Aee3frU
Message-ID: <CAO9ioeXb0qcJsfjZMG=1MMUL7RWuge4h2zK7Q1y_u-FS+syGTA@mail.gmail.com>
Subject: Re: [PATCH 3/8] drm: Add new general DRM property "color format"
To: Daniel Stone <daniel@fooishbar.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 Marius Vlad <marius.vlad@collabora.com>,
 dri-devel@lists.freedesktop.org, wse@tuxedocomputers.com,
 andri@yngvason.is, sebastian.wick@redhat.com,
 daniel.stone@collabora.com, jani.nikula@linux.intel.com,
 tzimmermann@suse.de, simona.vetter@ffwll.ch, harry.wentland@amd.com,
 christian.koenig@amd.com, derek.foreman@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: Uz61m18dHZsMYHD_YvNVM8NbjgCLYUm8
X-Proofpoint-ORIG-GUID: Uz61m18dHZsMYHD_YvNVM8NbjgCLYUm8
X-Authority-Analysis: v=2.4 cv=XJIwSRhE c=1 sm=1 tr=0 ts=68c946e0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=Mu7bQiZmAAAA:8 a=EUspDBNiAAAA:8 a=zmwVEVwQRcM0LkvMam4A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=UWaJenGNYZZVxFGCzVlh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDE4NiBTYWx0ZWRfX5bJOz/wROw1u
 P6VJDvWlrMip9kBa6ofFGHrjVCFFIZbtYscpEeVhpfl020ySlt/GVJLEA//AFCshC2H+Nrddzr6
 kDwzGGdmZzomTxYuFKQ1EDW+QFp97GJXJ1PYrqfpdGp2axlM/K97CBWqWpV3loNgpteYYe1v/El
 lCQGYQ7L4wuRogtnfgvFdtkvNaAFzC5b611rqeFHZheRfG0fL/U7oYkA4i93BwUoCIIJbi9ydXu
 JaRyCo17EakhKK+wpkjinInIiUR6TH5KzfS0i/Gdppdpmj/Yi2W975ihjUK+kDE8t+lxwcVMoYB
 9kXzVAq3AhO/AmYY7w1xvAs/paW7n8JEAaE46/Zk/Xg86ryh/Dlp1ePnvtHb9XY8EcBYKSvjmFB
 Vlbhqg3S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130186
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

On Tue, 16 Sept 2025 at 14:11, Daniel Stone <daniel@fooishbar.org> wrote:
>
> On Tue, 16 Sept 2025 at 11:57, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > On Tue, Sep 16, 2025 at 11:48:39AM +0100, Daniel Stone wrote:
> > > So yeah, I see it as the same as the input situation: you _can_ do the
> > > basics with raw evdev, but unless you're very special, you should use
> > > libinput. Equally for output, when you go past what e.g. Plymouth
> > > would require, use libdisplay-info to parse the EDID, rather than
> > > trying to make the kernel try to turn the unhinged madness of EDID
> > > into something userspace can reason about.
> >
> > We do a lot of EDID parsing in the kernel, including HDMI VSDB and
> > Y420CMDB parsing. Do we need anything else for this feature?
>
> I'm slightly confused as to what you're saying here. Are you saying
> that it's OK for the kernel to expose connector properties for
> userspace to see which colour properties
> (model/range/depth/subsampling) are OK and control what is actually
> used, but your hard line is that the kernel must do an intersection
> between the sink EDID and the encoder/connector capabilities to filter
> the list to what it believes to be achievable?

Yes. I'm sorry if I was not explicit enough. I'm fine with the idea of
the color format property (not just for HDMI, DP will need it too).
But I think the kernel should not be exposing 4:2:0 there if it
detects that the monitor can't support 4:2:0 at all. Likewise we
should be failing to enable 4:2:0 for a particular mode if the display
didn't list it in Y420CMDB (and we don't have e.g. a quirk of 'the
display lies, 420 is supported for this mode).


-- 
With best wishes
Dmitry
