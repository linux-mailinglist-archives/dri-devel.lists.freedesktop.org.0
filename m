Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAEF4694AA
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 12:01:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E413D73757;
	Mon,  6 Dec 2021 11:01:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2FB873757
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 11:01:47 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 5D46D32003C0;
 Mon,  6 Dec 2021 06:01:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 06 Dec 2021 06:01:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=uURppObJUNaK7HN8Uz06T+BghE
 KAPHKvYBlC9UTRey8=; b=ert9unh+8PLRLSbFRyxhaSxwn+6mqE55WEiv04CvCE
 y39Mn4695qowixifpOUEcAYolBMWVgCB0iPd+Khqkwl+a+P2IwV8bzlmMG/GjHR9
 w7SL7rN5hZ3qkSn5+MCInhR8b6BcRN3qYyxAQAstC0gmsSZPmY0rTu86tsz6euUW
 D3S4NSVvWQCKbqtLLu0ZWXp3P3QA8ha9/XO43GrNnHvmw7Sn/QOXfwtyYXdOSZjK
 RwmugihsHQN1ieA5t6CFk8SgMBcb2RxLOxCjNj/ISjb4NJ/b/0STv60DTyjZ2y3G
 j22crE4HRoeDIyWv84Z6GcmXsdVDGB8w3Oett9BbOsfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=uURppO
 bJUNaK7HN8Uz06T+BghEKAPHKvYBlC9UTRey8=; b=VSCHbKdYNK41eH13KimPmE
 0xuSiPH7ytX+7pwIHLqhWyDm/80hf0IQvovCWu4su/ffmeRJlCMFcy9AgGZ7Wu+o
 zXI5+Gr2o1vcDuwpRDqz9HermcpO9t1F+t+QVvnfL5M/AS2pUsJ0aKFx3Pm/bUfs
 CjfyM4kolaAHN5gP+o3YXzv1IENimaKkRFIup8uDPAdJJLpOBsqmTjyYLzRae1IT
 HdTlq61Cwipav8eMEo8pSQEZIdO2FeV7vNJhYCgUuJ23Eu6z02WXYldTv3vzUXKX
 M5wLhE92ULmx478Sfw7NgSoQVuX4fj6DwSsU2B4guHdt4PeM+h0oE4K95PEZkW6A
 ==
X-ME-Sender: <xms:lu2tYQ7y2ZB2SXnGnx02NN0daSa7LRVypFjXMq29BF8AY43dLYPheA>
 <xme:lu2tYR7AIg3Ajx52HVq779Z3wHnNvfZQR7meTXcDgG-cXG0qUoUdfa5knHIbz3Cyv
 CoK1TNxUBjQBC6-Yf4>
X-ME-Received: <xmr:lu2tYfcYb-cYH4v8IyVHZfSXRLX_tBy8t2Fxq_ICC223_a8MnPK4RKN44pzXSD-eyT3e0crDeSXVlFUVUtBBDLcS_PUnMXKIBnRcLnE_YEhsHQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrjeefgddvvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepteeikefgffekgeekledtheduteetjefgkeeuvefhhfetgedugfektdeugeffgfef
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 himhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:lu2tYVL3UtX354NXHz_PJMl9aa6vQx9ShPS5twzp3hF0-utatfIWog>
 <xmx:lu2tYUK-YrbQnnLbIfxgxNYoQWU8ugiwChDlEKVbDXunFc_3GlAwvw>
 <xmx:lu2tYWzquIA5VSqC02WVO7kdE2OUA2HsGJMJl94oWX6dNQMJK_78lg>
 <xmx:l-2tYT8tAslNjdgxdREZLVBZhynK3lf4O1zb3__XA8q1RX51qetjDQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Dec 2021 06:01:42 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 0/3] drm/vc4: Support for 30 bits YUV formats
Date: Mon,  6 Dec 2021 12:01:37 +0100
Message-Id: <20211206110140.119650-1-maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,=0D
=0D
Here are a few patches adding support for the P030 and the BT709 and BT2020=
=0D
colorspaces.=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
Changes from v1:=0D
 - Reworded the format description=0D
 - Fixed use before initialisation=0D
=0D
Dave Stevenson (3):=0D
  drm/fourcc: Add packed 10bit YUV 4:2:0 format=0D
  drm/vc4: plane: Add support for DRM_FORMAT_P030=0D
  drm/vc4: plane: Add support for YUV color encodings and ranges=0D
=0D
 drivers/gpu/drm/drm_fourcc.c    |   3 +=0D
 drivers/gpu/drm/vc4/vc4_plane.c | 199 ++++++++++++++++++++++++++------=0D
 drivers/gpu/drm/vc4/vc4_regs.h  |  19 ++-=0D
 include/uapi/drm/drm_fourcc.h   |  11 ++=0D
 4 files changed, 193 insertions(+), 39 deletions(-)=0D
=0D
-- =0D
2.33.1=0D
=0D
