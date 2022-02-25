Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 140BB4C4BCF
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 18:15:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC88B10E85A;
	Fri, 25 Feb 2022 17:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F9810E852
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 17:15:01 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 340155C01A4;
 Fri, 25 Feb 2022 12:15:01 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 25 Feb 2022 12:15:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=K3tfYrcyCWdbZh
 RE1S/J5cl5SWWwiCQww3LdJHQwE64=; b=nhK4DdnVXxpBAx78up++2vZgMCFhaN
 HAmx1cJCleJw2kMQflGismsiGpD6Z1y7fggXQCJu0A0+rY0WcBfXH+YmN+2xFP1m
 3ulvkvzV5aRf70TipSUHtqKhmIdt2EYqVfcfelViVwcdpgnmtfGQ1YPVyQXl0dUm
 rN0w07cUs8Jbuh7cPMBaUzB/By4Fj/mdaijv2oK1lQ6xLkX5PJZKv5Iy8ODflziv
 475dgn7JMovO3/uHhpqQeUu0FsQf9lmLr4A4CwhpF6mmHetOvXBCFfJ1RAi3bVWy
 hxy7oR6cnUKTb1RA5C/x05C8W6cwIq0S7i+2inDQvJ/oEjxpB5Ak0ZIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=K3tfYrcyCWdbZhRE1S/J5cl5SWWwiCQww3LdJHQwE
 64=; b=BVnmPAze9vSWTA4vNoJa4dp5+5CwXNbzH5YvQ73XLTSI4aJMSdwoIpNUc
 JZV9jaiU4qE7M3k4bK7eAy4OoV1mTYsM9zgpziUE6GYh62DXixgkH+qRaS6yT96p
 UfJUUwS6QcTRqEx1ZqtDKs4Q63MWwdbZd9NDaFxcUfq+UJ4nqNyyb/+hu5JvGM+u
 YK4hH8r+09ARCDSoJxF51JzqELWoPTBYW0n5OBZyJH9XHSWrh8I3M7Gg7D7auoyx
 J/4Q1P3VgjsvfNePR5uQfYabysDLZV4RBDxrtPNBRX484mQOUqjR3aKarOewBI3z
 JhkgAYu0+dWXTOmKOaPvjs0TOB7sg==
X-ME-Sender: <xms:lQ4ZYiLpP1_-oNsrX_V0fxBuFMapa0QdSeqXKoyHoknBYXM__ix3Hw>
 <xme:lQ4ZYqLr-Ki6bmHeht4eC3krOiHHIixsGXU4HRmk7gzR08C49PtADuuMpnVYGr-Uo
 w13nVaUuG8a-ZTYjxA>
X-ME-Received: <xmr:lQ4ZYis4aEKNYKojVh-8PH8ojGQhSyfpR0nAkjQ9nBc5yeM9yl4lOgHoPH7TelStS62q-1gbJ5uFXlB-5sX863gcULYwlFwYUHhyL7o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:lQ4ZYnb4XT90VFJ706F3MB_XXnVuugxWXQ2LOayx763_cLaxOkq3WA>
 <xmx:lQ4ZYpaSSAUDT7pcysE0_hvgwJeKNO9IgeV2UogeJDM1Eyv8xM2_ww>
 <xmx:lQ4ZYjDKxyoWc-K-zml4YNVdmzXW-YTEXCVBuqpm0nIDBxAiUcZlTQ>
 <xmx:lQ4ZYnOBEXiBqkFKuv5_PTZ5iw4VnKnaSVX4YfBbZ2X9YvnJCgcfkQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 12:15:00 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <maxime@cerno.tech>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: (subset) [PATCH v2 07/22] drm/object: Add default zpos value at
 reset
Date: Fri, 25 Feb 2022 18:14:42 +0100
Message-Id: <164580928297.726994.18444689513539017894.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221095918.18763-8-maxime@cerno.tech>
References: <20220221095918.18763-1-maxime@cerno.tech>
 <20220221095918.18763-8-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Feb 2022 10:59:03 +0100, Maxime Ripard wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> The drm_plane_create_zpos_property() function asks for an initial value,
> and will set the associated plane state variable with that value if a
> state is present.
> 
> However, that function is usually called at a time where there's no
> state yet. Since the drm_plane_state reset helper doesn't take care of
> reading that value when it's called, it means that in most cases the
> initial value will be 0, or the drivers will have to work around it.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
