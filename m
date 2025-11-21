Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8109CC7AB70
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 17:08:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A410E10E8DA;
	Fri, 21 Nov 2025 16:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hIXXKixN";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JVEw36DO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBEF510E8D6
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 16:08:08 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AL9SYkV3541436
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 16:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Ufeoh7bUM/nJ4GaNvnQRw4cW
 bujDEIpSOeuZ5ieZIV8=; b=hIXXKixNU13SiX+lrJVmgBdkops/RLgPt5jtIm4X
 3ThhrPw9dH+49IIbUKhVU4Js8MKRhBc2fBU3eAoW80ztIiCFqJOo83GqCO47/vQb
 RrSSCCNObh7mXJCtGW+ytCRWJk5bfoMUcP9iyVFBTpw3uKJPmoER9ELDoA+X66zM
 NGJfo5NCYxOAUGtAaANZT7yEDz9ARwRWiwFKaHLToKMZjPk3pqQ2AvXBosWYSeQB
 bIhATxwCxXvQUsgvLYSIWE7v1Y+AKFeOcZdwPAxmunfjq2cFVQsdVXUOPWoV1WLf
 lKoOrYhjobYngek4mmU0vi4PpcLVf0MM2JCRThLtgWJETA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajng0172b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 16:08:08 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id
 71dfb90a1353d-55b11778b1fso3977777e0c.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 08:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763741287; x=1764346087;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ufeoh7bUM/nJ4GaNvnQRw4cWbujDEIpSOeuZ5ieZIV8=;
 b=JVEw36DOBNGTbXOfhjlkddTvVMRJ/rITwjcZEFsSRpw5qhvf0zihaj+r5njmP+WlFI
 6EoCF3jbY8ijW41jXx/z+3C45nWaVsy7F4DyQRYTt9nxpxOxwfs/vrsJKDjahgDjZxnJ
 EfmoeCRnGM5+7gGZPgyUxZrqbCowMmM77Je8F+KN1hckuN+7thjNTOJ2I3cQ7I76jYrl
 2JHNM38bYKEhtu2QYaPnU/udv+756M0n+e5AKZEcMNlwlxECrweHbJSMSJFGWWfj0Zr8
 HSl3rXiZB15i89Rv4Zx1uA0HN5jr8rO4aSBSCYTCHJOrlH7PaAE0F0m0rOg0K8qt9U+I
 fLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763741287; x=1764346087;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ufeoh7bUM/nJ4GaNvnQRw4cWbujDEIpSOeuZ5ieZIV8=;
 b=pg/jTEGVnEwXCfepnxxIpzLPh8bubB9cJ0Cjaw0dvenXmrvwIk98jKVGCXaJjx8WAk
 M0ffHMoFtxvrHYGG0w5YMbk+PzNaghlfkZW7sde/AB2HbDNuZNRz/WTiACtoFcXtVp6T
 ihD9AynUwMthj3xRVGiFJOPPffWLVHxxrr+7syJxUX0pEH9ZiaptNPRU+AOj1mTDkEr7
 OOWQFgsY1nMNgF4YcZobfZ/2DmGWQGvcJpSJ6Qk3Pks9d87PJkHiGmqerT9fzrAK1HKE
 mJqEnAMjklHjm0vVA2ZgXumykOYG3U2JMXLDhP23MeSaVGpoeAk+goNHmcmg04Jd9Bgx
 Yd9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWowa0NPUOD1FSzVP4YSSAkx+BC15sKIqivi2TAjgYYM8fx5SaIQxAT2szdq/cmWyPuq2DDKxez9uY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8q5MLFP9y0f/ZwTu2x+1d8Ufon/gpsvPr/BTSUWMObinjHhZ7
 JEN/rwV/X644fgL50VAQ2bXfH8EA0Fz11u+sOMBq489ncbeevuebuxqWwqblJ42SxQGYdPBUdPE
 wA0kn8n6FNMIHC44Bwy+OXyMO6AH2T/9Qopd8Vxgy5bDKjo0/oACpgeHW4a/x4YKgkAhc1o8=
X-Gm-Gg: ASbGncsG0V8cldP0vSgqm7AxNHpk0GEwmJtWuNm1SVXw0lxaNiFvtBRicYEXbOpO5vA
 voG/foD9mu1P4IK/kiOpIBJ3GaPEfycRo1iO6VnoYrVm8+UZT1O7rj2h3nro3xGonbKuTlCSp2M
 V1A+qyejLoMkTei4m+VsDJf1AbKFtE1sgHAK/BwO1zFNiRlOaw6xPb5gZ8vD9ob2AEu5kQujVdU
 ZiD8KjRlWGixLbvzi2cGn52Ds/UFE8q4P3f0gVPj0X3TXoHOqT/+wF1oo5Jev/lmMxG6FmW9Tvr
 ro3u/0dREt6BrrMn+knz6AqAHmnH69lf3bzLHyFsvKNBpkp5uWzyl5kUi/BkX9Yy//JwSy6iCHd
 TjOX7B4x7pHNx1g9kxvnqUS2bSnBHF8c/JybyWLGqr96H8X5fcSqnwvnWfLKlKLRslKFDpiU6jX
 yTtK2c3m6Wa52S2vv/WfNjmuE=
X-Received: by 2002:a05:6122:2c07:b0:559:83e9:290 with SMTP id
 71dfb90a1353d-55b81923b82mr2151511e0c.1.1763741287301; 
 Fri, 21 Nov 2025 08:08:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVq7cAAt3X3C7SUO92wc6199AKDzCdd4I14oiTzCPYWOFGE06Zbz1JGXbXRXaOPE1XR2OH2Q==
X-Received: by 2002:a05:6122:2c07:b0:559:83e9:290 with SMTP id
 71dfb90a1353d-55b81923b82mr2151424e0c.1.1763741286683; 
 Fri, 21 Nov 2025 08:08:06 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969dbbeea7sm1718367e87.65.2025.11.21.08.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 08:08:05 -0800 (PST)
Date: Fri, 21 Nov 2025 18:08:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Liu Ying <victor.liu@nxp.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH v4 01/10] drm/connector: let drivers declare infoframes
 as unsupported
Message-ID: <5qncx5sww7feugjmtkskvoussd376rgxtcx3fqqgmgatjrdamx@iio4gxk2ildp>
References: <20250909-drm-limit-infoframes-v4-1-53fd0a65a4a2@oss.qualcomm.com>
 <20250910-furry-singing-axolotl-9aceac@houat>
 <z333ysst5ifakomo35jtbpydj44epqwwn4da76rcnsq4are62m@32gsmgx2pcdi>
 <20250925-didactic-spiked-lobster-fefabe@penduick>
 <jfxtcvh4l5kzyv74llmzz3bbt6m4mhzhhwl6lh5kfeqgqhkrhi@jzfvtxpedmyf>
 <20251003-primitive-sepia-griffin-cfca55@houat>
 <54a06852-4897-4dae-ab9c-330d99f3bf42@oss.qualcomm.com>
 <5cc5l2dihgdbgnwyugelwrklpaiiy5yaczqllu4bi6asvlt354@kib3flskh34g>
 <ez6y7q4lgbwt7kpnlpausjpznckr3yyejrwtxm7o6qw6wlhqoj@6iypzdhfthzy>
 <eiaxss57hauegv64ek4ddi3ib5x4t4g4xwiqvuaj43b52wpctb@p63ewh6tqblk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eiaxss57hauegv64ek4ddi3ib5x4t4g4xwiqvuaj43b52wpctb@p63ewh6tqblk>
X-Proofpoint-ORIG-GUID: cPthcfcqpMAkAfRH2p3HaMd5pw8ZfMTj
X-Authority-Analysis: v=2.4 cv=R+UO2NRX c=1 sm=1 tr=0 ts=69208e68 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=siajl1OzrqvGOPi-8wUA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: cPthcfcqpMAkAfRH2p3HaMd5pw8ZfMTj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDExOSBTYWx0ZWRfXyYigUkG25alF
 5CPjJmDDXUPDOcjLRQy/4p7lXuSu2dzsbbZ26BIaMRuOHjLhtQRZT2RfoWKQqAZlU/ksBS1IFei
 IpJB4Cul/9F2LXujy1hdsiyCko6c6Y69fTSwaxSzxyiO7EO+hACU91+f7/7UI/clQcdP86/5VuQ
 2JY7kt5eE+W3jImX2N3nSouE78c9bKVFiOhl/rgyotfMTvq7wObmlS+sW1azizgrSdtF/CKLRpT
 c2ARYlYdDO6XegANWuUvs0lCXMXPOxjYgFqoDppiXscPUDuXajGkxNTUz34n6MwUPdZIbFsrlkE
 YABfwwSEJ3uPgr8G0s/JXXQ+wreReJJGc2xer6ZmGmia4KIPLOhdyIlrMeoJPFkMGprR3Yr1KDg
 AVWPan1Lb8qh+WRTKXl8GbD2Ht44vw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210119
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

On Fri, Nov 21, 2025 at 04:48:02PM +0100, Maxime Ripard wrote:
> On Tue, Oct 14, 2025 at 07:02:03PM +0300, Dmitry Baryshkov wrote:
> > On Tue, Oct 14, 2025 at 02:43:58PM +0200, Maxime Ripard wrote:
> > > On Fri, Oct 03, 2025 at 06:41:58PM +0300, Dmitry Baryshkov wrote:
> > > > On 03/10/2025 17:23, Maxime Ripard wrote:
> > > > > On Thu, Sep 25, 2025 at 05:55:06PM +0300, Dmitry Baryshkov wrote:
> > > > > > > > As we will be getting more and more features, some of the InfoFrames
> > > > > > > > or data packets will be 'good to have, but not required'.
> > > > > > > 
> > > > > > > And drivers would be free to ignore those.
> > > > > > > 
> > > > > > > > > So, no, sorry. That's still a no for me. Please stop sending that patch
> > > > > > > > 
> > > > > > > > Oops :-)
> > > > > > > > 
> > > > > > > > > unless we have a discussion about it and you convince me that it's
> > > > > > > > > actually something that we'd need.
> > > > > > > > 
> > > > > > > > My main concern is that the drivers should not opt-out of the features.
> > > > > > > > E.g. if we start supporting ISRC packets or MPEG or NTSC VBI InfoFrames
> > > > > > > > (yes, stupid examples), it should not be required to go through all the
> > > > > > > > drivers, making sure that they disable those. Instead the DRM framework
> > > > > > > > should be able to make decisions like:
> > > > > > > > 
> > > > > > > > - The driver supports SPD and the VSDB defines SPD, enable this
> > > > > > > >    InfoFrame (BTW, this needs to be done anyway, we should not be sending
> > > > > > > >    SPD if it's not defined in VSDB, if I read it correctly).
> > > > > > > > 
> > > > > > > > - The driver hints that the pixel data has only 10 meaninful bits of
> > > > > > > >    data per component (e.g. out of 12 for DeepColor 36), the Sink has
> > > > > > > >    HF-VSDB, send HF-VSIF.
> > > > > > > > 
> > > > > > > > - The driver has enabled 3D stereo mode, but it doesn't declare support
> > > > > > > >    for HF-VSIF. Send only H14b-VSIF.
> > > > > > > > 
> > > > > > > > Similarly (no, I don't have these on my TODO list, these are just
> > > > > > > > examples):
> > > > > > > > - The driver defines support for NTSC VBI, register a VBI device.
> > > > > > > > 
> > > > > > > > - The driver defines support for ISRC packets, register ISRC-related
> > > > > > > >    properties.
> > > > > > > > 
> > > > > > > > - The driver defines support for MPEG Source InfoFrame, provide a way
> > > > > > > >    for media players to report frame type and bit rate.
> > > > > > > > 
> > > > > > > > - The driver provides limited support for Extended HDR DM InfoFrames,
> > > > > > > >    select the correct frame type according to driver capabilities.
> > > > > > > > 
> > > > > > > > Without the 'supported' information we should change atomic_check()
> > > > > > > > functions to set infoframe->set to false for all unsupported InfoFrames
> > > > > > > > _and_ go through all the drivers again each time we add support for a
> > > > > > > > feature (e.g. after adding HF-VSIF support).
> > > > > > > 
> > > > > > >  From what you described here, I think we share a similar goal and have
> > > > > > > somewhat similar concerns (thanks, btw, it wasn't obvious to me before),
> > > > > > > we just disagree on the trade-offs and ideal solution :)
> > > > > > > 
> > > > > > > I agree that we need to sanity check the drivers, and I don't want to go
> > > > > > > back to the situation we had before where drivers could just ignore
> > > > > > > infoframes and take the easy way out.
> > > > > > > 
> > > > > > > It should be hard, and easy to catch during review.
> > > > > > > 
> > > > > > > I don't think bitflag are a solution because, to me, it kind of fails
> > > > > > > both.
> > > > > > > 
> > > > > > > What if, just like the debugfs discussion, we split write_infoframe into
> > > > > > > write_avi_infoframe (mandatory), write_spd_infoframe (optional),
> > > > > > > write_audio_infoframe (checked by drm_connector_hdmi_audio_init?) and
> > > > > > > write_hdr_infoframe (checked in drmm_connector_hdmi_init if max_bpc > 8)
> > > > > > > 
> > > > > > > How does that sound?
> > > > > > 
> > > > > > I'd say, I really like the single function to be called for writing the
> > > > > > infoframes. It makes it much harder for drivers to misbehave or to skip
> > > > > > something.
> > > > > 
> > > > >  From a driver PoV, I believe we should still have that single function
> > > > > indeed. It would be drm_atomic_helper_connector_hdmi_update_infoframes's
> > > > > job to fan out and call the multiple callbacks, not the drivers.
> > > > 
> > > > I like this idea, however it stops at the drm_bridge_connector abstraction.
> > > > The only way to handle this I can foresee is to make individual bridges
> > > > provide struct drm_connector_hdmi_funcs implementation (which I'm fine with)
> > > > and store void *data or struct drm_bridge *hdmi_bridge somewhere inside
> > > > struct drm_connector_hdmi in order to let bridge drivers find their data.
> > > 
> > > Does it change anything? The last HDMI bridge should implement all the
> > > infoframes it supports. I don't think we should take care of one bridge
> > > with one infoframe type and some other with another?
> > 
> > Note: I wrote about the _data_. So far the connector's write_infoframe /
> > clear_infoframe callbacks get drm_connector as an arg. The fact that
> > there is a drm_bridge which implements a callback is hidden well inside
> > drm_bridge_connector (and only it knows the bridge_hdmi pointer).
> > Otherwise, the bridge, trying to implement drm_connector_hdmi_funcs has
> > no way to go from drm_connector to drm_bridge.
> > 
> > The only possible solution would be to introduce something like
> > drm_connector_hdmi::data (either void* or drm_bridge*) and use it
> > internally. But for me this looks like a bit loose abstraction. Though,
> > if it looks good from your POV, I agree, it would solve enough of
> > issues.
> 
> I'm not sure I understand, sorry.
> 
> What prevents us from adding ~4 functions to bridge->funcs that take the
> bridge, and drm_bridge_connector would get the connector, retrieve the
> bridge instance from it, and pass it to the bridge actually implementing
> it? Like we do currently for write_infoframe and clear_infoframe
> already?

Well, we discussed that having the write_foo_infoframe in the
drm_connector_hdmi_funcs means that the connector supports that
infoframe (and it can be used to e.g. report errors). However with
drm_bridge_container, we need to set all callbacks in
drm_connector_hdmi_funcs, even if the underlying bridge reports them as
unsupported.

Am I missing something?

-- 
With best wishes
Dmitry
