Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22887B59476
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 12:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6896D10E30E;
	Tue, 16 Sep 2025 10:57:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SW1RI19/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F5010E30E
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 10:57:46 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G9qrfb015309
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 10:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ug6ti1zK7twK3EP7eA41pZ4N
 +9DaxLD+TwQRJrQjMJ4=; b=SW1RI19/NRwSeDohW/sZjmnZ+shQbCH3Y1dPpR8d
 UokRvDs7aglM4oHGvQLE3J41bbJOFcYytt3lJ/e1xosq9YyEUAYlj6bn3+t7A5Ed
 Hc21BGcucjwlEvv5gx0BdkwNF6g7l8qgjVavWEYoFkUEkxZp5PtMts3NukHo7R22
 HebeqDvgD8E5z9psI9kZglOjb+/BsHfIsrbXsb6ZKyA4WBYm/YneaX/iPAHgUEkH
 CxMCo2lHn7YPSlgM22i9RCyzpuK8AbnAWLEOtS9aENstABbZpddrNv9dEQW0+tD1
 MT6yCqHZGrKBmR2XmfwFunDOVNuGp5eKk9L1RdaMPxbOFQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496x5asqm2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 10:57:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-817ecd47971so1389524685a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 03:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758020264; x=1758625064;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ug6ti1zK7twK3EP7eA41pZ4N+9DaxLD+TwQRJrQjMJ4=;
 b=jP3/BzsetKH3V0EWYAIH5jHpIynmsNnHrtdm23c/rBKdfa51PbpUin7uVD3UBPO5F9
 fg+WqFhmSKVp1MLsG9xrICQeXiI1cTqdyESoVZRVNhGGf6j8B3J/3Mr/x07tSE7GTx1p
 76WMgiELNWD6jxTrBinwnwmxk5CksfnR47KiOyEMQcqXpSCR2FkBR2ZxRtfpOwvBYIdp
 M0nqzA9BoVrlAKqHC4cXHCQIX78UG0AEFVZ2NVsrhy2bGfI4qMwSFk5ze3evw9ZK+TPY
 vnPkFas9tDw9ScJMkw3lVswodv6rVrT2TAbKnvqHlx/iY8FfFRBC4mWVFKx20JwHBGZU
 C+bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLrMl6ZemQHYagUhZr8IYHJ8mzmmMRoA1cyP8CpJcdvTctx+9ZVOe0gGeFm1IClXT1b06Dw/SuhEc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrsbbhPSBSjww7TWHNzu0O5FuMSM5Sa/H3kbYBYBQeO072hzXx
 s9Wo1Dl6F/g+ebqUVmhEIRRnvtqgAIr0roaeqoDsGq3A4huplxoX62GolRPl8pmWoXcApdh9NWN
 fK5fc034AKRa9PB1hvtZfKZ3oVpV7bfy76jS4dnMt495H9W/x0SSfK2dD5CpkwZrWD8Lp/2k=
X-Gm-Gg: ASbGnct+d/AmIxKZR4fjQMqrZXYZ1gieSD4mrPKe1T9q5EVJlEBx47mXuDBzHfjZldx
 GCX35g/VSgHZ++zC1JuOkN8chVpKJ8RFUwenp5lLIxLPaVqqOlddTuwJSoSda5m0AHvjvZHgwpA
 u/DNw6lnTwkrMoXAm4EjvDZx3fmPTRkhATA8KqQkVqxN544nV6P+gpPBXSkdkEHkvlVfVKMQwLQ
 onJyUI5tc1engp8nYKtnveENwtZKzY9uw4Q59LY8htrzp/iotRS8EPT5RrDLsU5X6aS9uLx3yqm
 A+tPSA2XAtROQHCxrbbZlD0an0Kx6hBsaokKWQtrLhOE1lnoEfbtUPfWViewT4n97GrAyoBkVE9
 fctdVfxKyO50/OyRxNmAyjCZmoXGupWxx8jxrIPB43ETMkbixkZCR
X-Received: by 2002:a05:622a:1446:b0:4af:36a:a60f with SMTP id
 d75a77b69052e-4b7b44f4d60mr17156171cf.21.1758020264453; 
 Tue, 16 Sep 2025 03:57:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElrqCIhgDfxLIwm8IiyOmaJvEpt/5/EabimMrrc5Fg4XCBaXrzKGkJBTC4L4Q+5lSB9lgMrA==
X-Received: by 2002:a05:622a:1446:b0:4af:36a:a60f with SMTP id
 d75a77b69052e-4b7b44f4d60mr17155971cf.21.1758020264029; 
 Tue, 16 Sep 2025 03:57:44 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e5cf2f467sm4340698e87.43.2025.09.16.03.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 03:57:43 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:57:41 +0300
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
Message-ID: <b6sosuofgvanq7hjj6lfev4ifu7muhhd45lncdu3m3r42rqwaq@tgxtumlxhtkx>
References: <20250911130739.4936-1-marius.vlad@collabora.com>
 <20250911130739.4936-4-marius.vlad@collabora.com>
 <ssvxorsrhum2eo2uiieradrrmytemivr6m5c3mskalehzaj4ci@nc74epxgjq5w>
 <aMMDxIWN9TadgVyw@xpredator>
 <6zmp2dzpvcb4hi4kaa66q5o4rlcpdkor75ci4rnvalt2a37f26@lbmvc4t2ow4z>
 <CAPj87rNxGfroKTf1i5UtmmnZ9wDQTdZFDMKw-MLdbCfjTCD=Uw@mail.gmail.com>
 <20250916-piquant-jerboa-of-completion-87b80d@houat>
 <CAPj87rMuwvir_aDReT1ou-BNs3w9coUG6MPmCnGAeg5rQ97rCQ@mail.gmail.com>
 <CAPj87rPRG=7qPp3QMXf_6FP82-gWdgWpXdHmwZjHKrnU-PdQ0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPj87rPRG=7qPp3QMXf_6FP82-gWdgWpXdHmwZjHKrnU-PdQ0g@mail.gmail.com>
X-Proofpoint-GUID: dncLpwm7-WzLfn-Sn0duPWzy3nKRPLDk
X-Proofpoint-ORIG-GUID: dncLpwm7-WzLfn-Sn0duPWzy3nKRPLDk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDAxMCBTYWx0ZWRfX/FGDwYIE5U0j
 Vmi+HJunkwL4PfD6YqwA5Mz4rvN5LuFC1SUmh4DtM/8bbhFheNpmWCGW0U3Mwb8NviY0z8Vak/Y
 nDXFRR7VWtgFkKOG9oZDRP6D+ZdAXKwgZYspCnmfw7DjLIByfWRyk3qInIhd8u/UKkSwvpk4wPo
 AV2yjft+BPAmdVswR6y+O4RWKSj/evqTJJU3XkH88OhS1s2JTgdv3gz330rUW8VZkRvvGMBb/Iu
 dJj5IymYB4PQPypfsCPiMkQQTY8gJMhGLZ+LSaM8yHan6ssbxPsqaeq4NoLxJFcjGhDst//Rubp
 Hbn6P9j93a4hQMCFl8+m3xAegQrOYubw7uGhWH+shCkmw1PkrlSRP1EXIYhy7N5EUS6agjK0uSb
 n4ZglF3a
X-Authority-Analysis: v=2.4 cv=WpQrMcfv c=1 sm=1 tr=0 ts=68c942a9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=Mu7bQiZmAAAA:8 a=vh4qsCKzG4s0duQrLs4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=UWaJenGNYZZVxFGCzVlh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160010
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

On Tue, Sep 16, 2025 at 11:48:39AM +0100, Daniel Stone wrote:
> Typing with one hand (and not the useful one): not good.
> 
> On Tue, 16 Sept 2025 at 11:46, Daniel Stone <daniel@fooishbar.org> wrote:
> > Again though, it's not something new. I promise you that Weston (for
> > over a year), Mutter (for about a year), KWin (for over two years),
> > and wlroots (for two and a half years) already have hard deps on
> > libdisplay-info. Even outside of 'serious' compositors, Mesa requires
> > it to support HDR in VK_KHR_display (when it was added a couple of
> > months ago),
> 
> ... and mpv has also required it for any DRM backend support (same as
> all the compositors) for the past year.
> 
> So yeah, I see it as the same as the input situation: you _can_ do the
> basics with raw evdev, but unless you're very special, you should use
> libinput. Equally for output, when you go past what e.g. Plymouth
> would require, use libdisplay-info to parse the EDID, rather than
> trying to make the kernel try to turn the unhinged madness of EDID
> into something userspace can reason about.

We do a lot of EDID parsing in the kernel, including HDMI VSDB and
Y420CMDB parsing. Do we need anything else for this feature?

-- 
With best wishes
Dmitry
