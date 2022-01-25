Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DB049AFCA
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 10:25:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A1410E961;
	Tue, 25 Jan 2022 09:25:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E131710E6C6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 09:25:29 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4AFDD580699;
 Tue, 25 Jan 2022 04:25:29 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 25 Jan 2022 04:25:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; bh=O8ZzvD4QGMsxFS
 HVsCUMmngFD5zDVQSN4CjcGXonVac=; b=lXUBbtMYnR4hdjJ9RnOz4iZi5LM3bw
 LzE/uJKR315HuPIMnYob/d9Oqee6hIyWev+K+o8q7xurYTRH7biP480H2+uZSmxf
 khfuXlmKZz+ikX4Bf2yVZJssBT3INR9p2iJsWN+KHQi1HpK8TUsJPGaVhQO51Lrv
 dMMoxKDr5YvQe4p7Dq8X5jsSr+SiQFRG0sF6+0bJcyIZOpmtjMO871VPwAdTDRj6
 yVv84fcihSUvXztHoO5S/uqkmcloZQ38+c9Q09COywT/6e5jYX0+KW26J3jLyEUE
 vNNDPmeMwubZkA2baekn78ZzHRD1MrqncHg0wotrAoonungapz74ng+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=O8ZzvD4QGMsxFSHVsCUMmngFD5zDVQSN4CjcGXonV
 ac=; b=kP01ZLdjvK+z+Lo/Ua8Knf3GhQGfBJ46oTfDkR/JKcuxJ6zPQU4RLNV9c
 u2NmQbb6xhmNC3Hl6Wrl9j0i0qgfQVqVOkpccGOpTuxTC7+OUrmw6o4xnAtDllcP
 WSdEYQvgMdtzfylhIZnG8laAYljYWVvo3+E4MhDwcWLpJPDIoefU0qnAVKNtHqXQ
 XEkc2Ffo0rmZBiRSGYdN8E8tP+qWs08X5YkoVEAm0O9GH/m+bCi60JQvE3MaFQkf
 QiQEaf4t38BNYzIJo3/jGSUeRDL6NkFIZI5vQkf2ZNQMAEKzK11NrCt5CuX8xTFv
 Iv5Mohhi+4OUnrxituS+FNFTiDjHw==
X-ME-Sender: <xms:CcLvYZtb8mlM1HlSo2QkI0Xpy084LwRTjDKikYOGAg-3rj7OTjNU8Q>
 <xme:CcLvYSdfWP-1UZKeSW4JOwAQ9Dc-XAOK8eDInYv5IC39E8F7n8mto0GIBmWleYA_I
 yBgu2G-nQOLW8j6aB4>
X-ME-Received: <xmr:CcLvYczlcZ80izk4BcpSi7xf13bHULPIiQCfWM0pvb2bJh_jwfrMO3Mpy9bsrol9a2IsR8hZjau1ucZAMhz9CTbb5dkBKDySfePisjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvdelgddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:CcLvYQOM5zzMWB_wQJZBlLowl3h-N010Zs1qY8_uQ2MvKVrwWoIHOg>
 <xmx:CcLvYZ8Tad-bEByi0SCBSrIWqMx0NkAZfwX9hkaSTMszXqBHr59uBQ>
 <xmx:CcLvYQXR2AAxoEoMTua5xKq6XoSCk0hoBtTJ-jw3IINI4NT7zXso3g>
 <xmx:CcLvYYazU_RnZCIkveJ1tHhuH7uLaM3Ft2f5GIxPtkkr3ppNjgQqlA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Jan 2022 04:25:28 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: (subset) [PATCH v4 03/16] drm/edid: Split deep color modes
 between RGB and YUV444
Date: Tue, 25 Jan 2022 10:25:12 +0100
Message-Id: <164310270996.583056.4800004908115541949.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120151625.594595-4-maxime@cerno.tech>
References: <20220120151625.594595-1-maxime@cerno.tech>
 <20220120151625.594595-4-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Werner Sembach <wse@tuxedocomputers.com>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Jan 2022 16:16:12 +0100, Maxime Ripard wrote:
> The current code assumes that the RGB444 and YUV444 formats are the
> same, but the HDMI 2.0 specification states that:
> 
>    The three DC_XXbit bits above only indicate support for RGB 4:4:4 at
>    that pixel size. Support for YCBCR 4:4:4 in Deep Color modes is
>    indicated with the DC_Y444 bit. If DC_Y444 is set, then YCBCR 4:4:4
>    is supported for all modes indicated by the DC_XXbit flags.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
