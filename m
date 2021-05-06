Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 243513754E0
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 15:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C6AF6E42F;
	Thu,  6 May 2021 13:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 584ED6E42F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 13:38:03 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 2C6C112D2;
 Thu,  6 May 2021 09:38:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 06 May 2021 09:38:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm2; bh=e9xz3pS7wYUP01uXq3lBzQSI0ZzT83Ib5WSC8lj7IqE=; b=nRHbHB9c
 dFS695D46OjGvDYE8vPBgfLScGJEZULQhPZt1eS9ve5xPnnpXEll5j54F2ltvXbZ
 rWsi+GzpvZo5p+9a3DG4qnQvkQoj7AgEQIiEybqCAeAgKycPhtt5Zc3Nex/3juY6
 r/kE8Kyn7VLc+7l4urQfs8W/UyFOESdJkwrFX43yS4QZCSbaNZTm2ojSIWnEQF+d
 6i/PeIgNcbRrBIuroEkuK9avZIjf9Xb7jHMyUrza+JvBfTA3eU7xku9UYXtCI7kf
 QY29i9QFzJo13OUqpMJEZnH0oC8c4BUIfq3/4tK6U5dtZkehGie3IdM4Z1m0CiWh
 qxRCEYaXi0nQVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=e9xz3pS7wYUP01uXq3lBzQSI0ZzT8
 3Ib5WSC8lj7IqE=; b=a2fKI5Rlxh8ewWZh5+gjeaFsvGytMrCKVwojNcNxtKjLN
 a0ktHa+s588h9PDlFVTe+8AJuFTB+TRGGAzq7BCJO+n0jchWfGr401Px37SaCCu6
 osGRtFsS3t7gOfj6hdjdT9XCHpiubZuVHf+OnUpJhOtH+koO3717gDDsrmOiSi00
 Meqrt8zKTkPl/yC22v5aUAj4DBBh8COevY2FPOPk+254tXVQgwRAMXBP5/ik84KI
 W7Yh2TZ/fajTSco2gvKeZDItoqaXfwbuphGruPUhCxwfwSImMM5x837hSSJCYqC6
 aPXshkZ/79NOjtq9p/qv4USXLnfKi1r1nKuwA2GmA==
X-ME-Sender: <xms:NvGTYI8vkQX2sIh27Mdahvfjvq4T3DenXfEV9R9y8pz28uwjJeCVMA>
 <xme:NvGTYAvWVfHfMAqOwdhn2-qYgGBb4K1x2JDReuNX1lxM50Ad9GSOLBWkusXWGAgs0
 YnLthK3-uULluRvyq4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegtddgieejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddvnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepffffudffudfgudefgfekvefgiedvjeehtdefleeuffefgfekkefhhedutddtvdev
 necuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdeikedrje
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgr
 gihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:NvGTYOBcXrPQx80M9jRlglcGp_BumqDH_hYsUtwfT65U8NKpVy8v2g>
 <xmx:NvGTYIc3AkoF8yyNi2g3eeg4ZAR2ANxtd5XbOUCUbOQPcIrlfviS8Q>
 <xmx:NvGTYNOyjP8deW24Orhap6y7_a8HZnEae-Rpg5vOhO8RJ240QspXRw>
 <xmx:N_GTYAf53AFiPswhYVLgL30mygsvP2BPPp8g07ZDVDcyvJPAfDdfIQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu,  6 May 2021 09:37:57 -0400 (EDT)
Date: Thu, 6 May 2021 15:37:55 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: Hotplug and power state of a connector
Message-ID: <20210506133755.fie3766a5sco5bii@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wrgopn7bytfw5n5k"
Content-Disposition: inline
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wrgopn7bytfw5n5k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I've been working recently on adding support on vc4 for interrupt-based
hotplug detection for the HDMI controller, uncovering a bunch of bugs in
the process, and interestingly creating a hard CPU hang.

The HDMI controller CRTC is shared with a TV connector that doesn't have
any hotplug detection and returns an unknown status all the time.

After digging into it, the sequence that leads to the CPU hang is:

  - The HDMI HPD interrupt is triggered and the connector is now
    detected as disabled.

  - A new commit is done that will disable the HDMI controller and
    enable the TV encoder.

  - At the end of that commit, the fbdev DRM client will run
    drm_fbdev_client_hotplug[1], and then call
    drm_fb_helper_hotplug_event[2]. In that function,
    drm_client_modeset_probe[3] is then called. Once all the proper
    arrays have been allocated, it will call .fill_modes on all the
    connectors, which in both connectors case is
    drm_helper_probe_single_connector_modes[4].

  - Here, we go down the drm_helper_probe_detect[5] path, and will end
    up calling our connector detect hook. Now, this is fairly simple in
    the TV connector case, where we always return
    connector_status_unknown. However, the HDMI case is a bit more
    complicated:

https://elixir.bootlin.com/linux/v5.12/source/drivers/gpu/drm/vc4/vc4_hdmi.c#L157

We basically first look at a HPD GPIO if we have one, then we try to
probe the display through DDC, and finally we try to access the hotplug
detection register in the HDMI controller. In the failing case, we were
first going through the DDC probe, and it turns out it's failing from
time to time for some reason.

It looks to be timing related since a bunch of printk are making it
work, but I'm not quite sure why at this point.

Anyway, we were then accessing the HDMI_HOTPLUG register to read the
status. Except that we completely powered down the HDMI controller, its
clocks and its power domain as part of the atomic_disable mentioned in
the first bullet point, which then completely stalls the CPU.

I guess my question is two-fold: does the above flow makes sense from a
DRM standpoint (it looks so to me), and what are the expectations for
detect in terms of controller power status? The doc doesn't seem to
mention anything about it.

Thanks!
Maxime

1: https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_fb_helper.c#L2396
2: https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_fb_helper.c#L1948
3: https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_client_modeset.c#L765
4: https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_probe_helper.c#L416
5: https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_probe_helper.c#L328


--wrgopn7bytfw5n5k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYJPxMwAKCRDj7w1vZxhR
xdHJAQCgT3rt2H47Qw/si8neCFQ80h40gAPB/pvqP2t2O9ldzAD+LksTQBlVQ4n6
Wq4UZ7ohIPXlbIi1y5iy6dk67X+nbAs=
=Gqnj
-----END PGP SIGNATURE-----

--wrgopn7bytfw5n5k--
