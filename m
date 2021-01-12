Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0282F4620
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE48E6E0F0;
	Wed, 13 Jan 2021 08:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29AFC6E231
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 13:47:36 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id D36295C0230;
 Tue, 12 Jan 2021 08:47:33 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 12 Jan 2021 08:47:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=Uf2QUSsK86Gv4Ov0rY7nsOidQh
 6GwnxOCmA+qKSGCnk=; b=Vx3Sy9VyntuXgqjjvPE2vVjp5PPSfH20W24KBSm2qo
 NB5WIbyzwSZdLhXiEpsWQUDZQ7j1HgUMGLddGhtf9D1NFzEyTwLrRcUuc1oVcwEA
 yE28I6/G/3PmjSgjUtmjqf61okGfbAUre6x7Xo+0h1nce8SVtOQblOTwz2+qGF8l
 BYbfJvueVj974Pp4sfiUQAIemk01wtgvlS869Sz1JBj7sje6n3kogd7Zx7qKJCrb
 iIO3tPA956uR0SOpy+AAeSkfhbMDM4dx0GhWcYBPH5oCDUOzzEo1vxD2wpFt21jH
 uNXJ2+eLDM+SsAceLECOjodV1nF6DwDknundI8OhegwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Uf2QUS
 sK86Gv4Ov0rY7nsOidQh6GwnxOCmA+qKSGCnk=; b=PCUxpy/F5ekeZFOZvVuF5w
 IP5pJSTGQ3FX+Ntvgh6U9Un89VQ4uQE3OHOc5rXN/q6u1ey6H8vXCjBhyuufU5ky
 hP2zyFb2mYQ6zS0WPor0k7bB7W7UaqR4SG26OAcC6ybDnMjfdq6tXz4iK6I6+vJ3
 3JLMlxGSPwfGZlysjpgYBiVgZDxbBGN9Ic0kGHByxZ0AJLaPjfDtAw5YHESZ5BV6
 lFJmOV9M2U+SKbluWOARj2Aj6Ds2hqaB4QbygC3tHy4AgR4iAdhJ+/7RKo4UGCiq
 sXIF7k3TyMvk7kObAKkzLUVOGqoxJBGxQGRxdRcDHrgK3/HPBlCOwDZA/TnxnnDQ
 ==
X-ME-Sender: <xms:daj9X-2EZID_Ul9VIenaqPyvRieJRxrsd1LrmclHJBsqBfqjHdpGSg>
 <xme:daj9XxGjq1KbAdv4GM9EO6MNWSsMFK57yEu39zSv8jxnVUyL1GPcXXzPxVqhKV2we
 clNGuCxOj3FCXqFMNU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddtgddvgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepteeikefgffekgeekledtheduteetjefgkeeuvefhhfetgedugfektdeugeffgfef
 necukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:daj9X24MonCRq_zefkaY5zQCEUhpF2ncERX-Jg3oJf6p489K88VDUw>
 <xmx:daj9X_2KdapBInvbGWXd6DOBoN3hFyv_BEqj1w1v2Dhs5Gy5SC5UsQ>
 <xmx:daj9XxFAa_Ii7_GVbrgn_ndUyNkDxRyIP8qodDNJ88sDU-eMYnlDCQ>
 <xmx:daj9X_MYYk874P10Hj65YIQLb1AZ9jzJwbAx_6fHPzjfXpbMBdlTNQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D99C7108005C;
 Tue, 12 Jan 2021 08:47:32 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Lucas Nussbaum <lucas@debian.org>
Subject: [PATCH RFT 0/2] drm/vc4: Clear the display list on startup
Date: Tue, 12 Jan 2021 14:47:28 +0100
Message-Id: <20210112134730.810697-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 Jan 2021 08:21:20 +0000
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
Cc: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

Given that I'm not having a great success at reproducing the issue you
mentioned, could you test the following patches to see if it improves things?

Thanks!
Maxime

Maxime Ripard (2):
  ARM: dts: bcm2711: Fix the HVS size
  drm/vc4: hvs: Clear the HVS list at boot

 arch/arm/boot/dts/bcm2711.dtsi |  1 +
 drivers/gpu/drm/vc4/vc4_drv.c  |  1 +
 drivers/gpu/drm/vc4/vc4_drv.h  |  1 +
 drivers/gpu/drm/vc4/vc4_hvs.c  | 12 ++++++++++++
 4 files changed, 15 insertions(+)

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
