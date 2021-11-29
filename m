Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B40FF461970
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 15:35:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A89096E0F1;
	Mon, 29 Nov 2021 14:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA976E0F1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 14:35:38 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 968932B007DF;
 Mon, 29 Nov 2021 09:35:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 29 Nov 2021 09:35:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 xm+l1nSfwC7zBcsMJAcijsrRTvrg5VC4+dBlMBFu66Y=; b=BXVW75TTpiO3mFaD
 MvQSlv+X41H/7ocfbHnrVMZp8nuTtzE+hxzkzSRSsSHJ9W5S2/397FcJ5FCnKdXE
 +o70kS2r6uDh5B9BWQzJ0N2WTHeApaf7VDUj2G39iHUPQVBd1YztUv/f26U9isW+
 91YWhMTJHFSxtcTKlu62xhIHJ0hMvwYbK1RoE4OnTOzUy7ctsQmQO+V26m/UmUda
 fgERNp6PF/S76F+ACZ1WhjP13hzJpH1vc0EcmV3Mn5Bb8z/9GLQyA/Tv/nojCxYn
 ujWBDHIjc+AabaG1WBg0MdovcUCOASutM0CjwNBmBgk3wqM4/aXSZ1Mwerj1eijw
 bzYXKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=xm+l1nSfwC7zBcsMJAcijsrRTvrg5VC4+dBlMBFu6
 6Y=; b=TYYnQG6DmisKBs6SW40RYMzrkZYdf1rPJeJ0aYqmGAEnjJjZ36msJWoZJ
 0BhChaAEk66wBOA+zJ5k9gOMpBi43KO6ziqG0+/deurPf99MpJdkR1smHBOnzd2J
 ba7LckG+SZfdnAgewLRbopFrj5R8thzS7TuG11WUC2C76ehSdgp2o9Xb+0xXdsQG
 33c4I9mQ3QpqWmyBWZ2OM85hWu1dk2Y51Qn6tVKOyDj6N8i/Pr79rJFCnRi+nSe8
 5FKNqq59tNJRoN5oCKkunSvscPltYWFQNHnetdG1GcXQ8Rphy2HFIxT9aw3sT1JK
 7ez2Kehgcm7chU8tNHY6KEP4X0DJA==
X-ME-Sender: <xms:NeWkYQIy3GCbk9wocEbS5thFh4CP05oKcFw5BJQaxDzi0_jdCWgbEQ>
 <xme:NeWkYQIzfTCmnzTLLTIlEHqMkcVeFqLoppKENYf7wWwRZ3GfPEi1y7fAM3o7PdhxT
 0K9ruRl9SY3Pwh9yC8>
X-ME-Received: <xmr:NeWkYQvcWtqNCjrG-NTjgMJHPnzJBtZk7T95NFX3aLkhQkUkfHRDupriLbXdAJnEz9l9OvE8ewO-CM2qG9TrBTpwFqmwCFciCtI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrheelgdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:NeWkYdb-aEN6Q3VlcUgUgfzYNMxknfe9sy5sz2QQ3Rm9-r0h1M07Rg>
 <xmx:NeWkYXaJNMb9JmtjI8uR24BaYl9RSRN5BiYXjiShQZTEARQKxUl5nA>
 <xmx:NeWkYZAnjSUGOPcxEk3uz3AxoQO_wwi47ssKVq16Ork8pdBfFTKLWg>
 <xmx:N-WkYRmBs8U9UraaGyo6Y0_kqFj_hPbnr1XkoSi5qH0fkvYMw3cz6FqFPDY>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Nov 2021 09:35:33 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2 0/6] drm/vc4: kms: Misc fixes for HVS commits
Date: Mon, 29 Nov 2021 15:35:30 +0100
Message-Id: <163819652186.306917.1910249657016871077.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211117094527.146275-1-maxime@cerno.tech>
References: <20211117094527.146275-1-maxime@cerno.tech>
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
 Jian-Hong Pan <jhp@endlessos.org>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 17 Nov 2021 10:45:21 +0100, Maxime Ripard wrote:
> The conversion to DRM commit helpers (f3c420fe19f8, "drm/vc4: kms: Convert to
> atomic helpers") introduced a number of issues in corner cases, most of them
> showing themselves in the form of either a vblank timeout or use-after-free
> error.
> 
> These patches should fix most of them, some of them still being debugged.
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
