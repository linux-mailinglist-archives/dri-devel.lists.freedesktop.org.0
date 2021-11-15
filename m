Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAFC450373
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 12:31:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B416E063;
	Mon, 15 Nov 2021 11:31:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09F36E063
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 11:31:12 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 70BEA2B0117B;
 Mon, 15 Nov 2021 06:31:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 15 Nov 2021 06:31:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=oEPb279Pc8ICHxOjxF4sDkFL+s
 /davMGKpI867X6PF8=; b=Zp8ep0hNHQS6Py/AgYK2oGRSuIc8KKJtecqBd+zFCH
 /UyNSYhI5dA0D4FvPyHofOl/lD0IeKboJox/8/Zk+IuhQxPM34kPlbjKPxliy5hc
 m8OKUuojBOB7gyw5m49i+U/KCh69KnBartF1y+DSYssDVaI+W1a2Z2JCTVOiWELt
 3jPUlOsgPZXXDrSyySs4rzDTFNeHxMy902DVwNBUV6KZpwYkNE3fBm+u/KPr2s0C
 JRJlqlH4x5ObEbjPM0X26tnDCo/BQkwOamDCh7hxSzI74NZey8wuWNR7IjdfJt37
 Dm+7WLOju2idhKqy30HBNavvuywX0zhGZThyGzYfNxzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=oEPb27
 9Pc8ICHxOjxF4sDkFL+s/davMGKpI867X6PF8=; b=ETg29ZlcFmHgF8t+4PoLs6
 iq8HK5h74SaAgfc1FGkChNU+WvsGMsfGFIHNmMhx0swBxZYVyNr9jk0X+lhHAedu
 HE5o1xUhicc8GDH8DyEdZJQaafBXg5h9ZtglDcWItdOesAzOYXUofFV78Itln3VX
 isamYLrDrHpnqOLNuf0hOVKJLOZvmg3Xf32mE/TM2rGfFkdZlnot6/SVpEtamSnF
 rBDCP0ex6iqxHSkWfzNcH8RQmLH+dJ8+MSB+I9XMs967sy9ZCi3Vd9OMMbDAi1gf
 95Aa5GOJ2vBL7G2vb/Lrb3dKZzCnCNSEN7Z715Ty7+wDtIPRRfCf1U4mLixEOU4w
 ==
X-ME-Sender: <xms:-0SSYWLwg7oVRgECGl0IVIP8lh-cOkDQI3dlrDSyxQGdXfKjPs6g4A>
 <xme:-0SSYeKBc9JPVVTRu3rtzPmVOHr2ukMWZCaZ34xrag0TWnMd9AT8LfBV93HO7clhS
 v6W4703wj3K5JxK5o8>
X-ME-Received: <xmr:-0SSYWuxlxEJBNbpXoJiaQa0CFXcvECt00Xi0pN4XUB3u6KLGkdVCLsIBncZqGK5Ar1xwTcH3eaXIpxI8DOvZ6-q698WbuyjPc5rEntB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfedtgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepteeikefgffekgeekledtheduteetjefgkeeuvefhhfetgedugfektdeugeffgfef
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 himhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:-0SSYbYYhGS1UTRlg6HfqbEs_WUGkUtmnm0PSVxEEwGHpS6Qt1H_pg>
 <xmx:-0SSYdbNfVKK4knqGPia7vT34gL4HkrNRxAwREML2OJaATYIpMUKpg>
 <xmx:-0SSYXCErfyH1cFpnrEzH1w1PZSW0jPCnvzOot4e4O_rDVFgFCeXFg>
 <xmx:_USSYfnSSB0trNP0dacLgWnvlWPPrFL0FHFszUzbjSDc7EjdLRUnpCxjYeY>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Nov 2021 06:31:07 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH 0/6] drm/vc4: kms: Misc fixes for HVS commits
Date: Mon, 15 Nov 2021 12:30:59 +0100
Message-Id: <20211115113105.103275-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

Hi,=0D
=0D
The conversion to DRM commit helpers (f3c420fe19f8, "drm/vc4: kms: Convert =
to=0D
atomic helpers") introduced a number of issues in corner cases, most of the=
m=0D
showing themselves in the form of either a vblank timeout or use-after-free=
=0D
error.=0D
=0D
These patches should fix most of them, some of them still being debugged.=0D
=0D
Maxime=0D
=0D
Maxime Ripard (6):=0D
  drm/vc4: kms: Wait for the commit before increasing our clock rate=0D
  drm/vc4: kms: Fix return code check=0D
  drm/vc4: kms: Add missing drm_crtc_commit_put=0D
  drm/vc4: kms: Clear the HVS FIFO commit pointer once done=0D
  drm/vc4: kms: Don't duplicate pending commit=0D
  drm/vc4: kms: Fix previous HVS commit wait=0D
=0D
 drivers/gpu/drm/vc4/vc4_kms.c | 36 ++++++++++++++---------------------=0D
 1 file changed, 14 insertions(+), 22 deletions(-)=0D
=0D
-- =0D
2.33.1=0D
=0D
