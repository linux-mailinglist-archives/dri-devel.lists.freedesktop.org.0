Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D48454839
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 15:09:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F586E3E3;
	Wed, 17 Nov 2021 14:09:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1755E6E3D6
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 14:09:07 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 3F30F5C01D9;
 Wed, 17 Nov 2021 09:09:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 17 Nov 2021 09:09:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=w32oeM9Am+1mdq+38r0Dx3KDGF
 KzDewpUGPl3LQfuIQ=; b=RtGJ0OZxpsue0iYXWQ+WmW6ZJUYJv2KLTfT8ChmvsK
 PkeY30Jp37WfcMie5wjzSfcM4Jqd5V3rCWQW5qptBRMcA5PiD4UGmGFsI6o5yNTh
 UgerR3wXoBU8fmUXeQ9BCCGgJYnZi1vMjFJfXsDIjr8WSpftVn91upYmCjrHoUto
 DtMWF9Mt3E6VRzO+0uvyBqXDdPWCtge/AuCmhWWawMdum0ooWcfCwzDVzTwLZxqo
 jUwjfLq7xEPLBa/EfV4soZK4HuU9Jemj5PHN50/wywRFQqLISgBgIdx/VEg9mUBb
 1klEp+zax6BZAActzsas6fB7F3Cok/BxBOYAUeNhW69Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=w32oeM
 9Am+1mdq+38r0Dx3KDGFKzDewpUGPl3LQfuIQ=; b=Cw4pVudKJ1K99S/+uYyb6n
 mZblfd2+xdt9GhiFNnUwVijE2M3zRLv0VluewwUAC4umMvOUE9zfC0gr8JiOZYRM
 MH0o/Bpmk6CxkyvHdKwGIp28VKpYyRTmUKoZDUHXi8NpYkCIu0P4wKjaA5+s13Kw
 AFrjPMIUM5hucFrvQlDr6g6jXVePzGnq+gMBp2t/X1tOCRLyzeT9CBv6fv8WOWGS
 12wzfIHVZl3VJKrmAA6wTerplrX49Ue1QSx/gzNpoFO3wpK02bmf0YG5eyphx8ph
 sQMIJp9SjvuGaVWtfzVnZYwoXvpHBmJUsT68w0/NikkyH3VlixGgMHfuIbviBYBg
 ==
X-ME-Sender: <xms:_wyVYZOGA0E49mkLQchi06mw6IJVY9H67TIV3TbkgiFjNzfk94bAbg>
 <xme:_wyVYb964qodjmixR5aXVANUcbmZMxyp4V0Am7NwRou2oyY_uNeE1MiaTBnELJqzy
 5S4DEqlPaR_552-Kro>
X-ME-Received: <xmr:_wyVYYQ1Kv6x3wRQQSxg17H0mPNM8o2SFgdzOWFkul4IPiNNeYMsaEV4eY5jG9DBz0a56ZGgM2A9qmXeOkCQvibOuPfN0IHQd51TY8iuYgE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeggdehhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepteeikefgffekgeekledtheduteetjefgkeeuvefhhfetgedugfektdeugeffgfef
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 himhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:_wyVYVvNoDbuI35oZYg5vTsgOkLKXiqq9frX08P_ENQ6TM8-_iy_bw>
 <xmx:_wyVYRf2HjHvft09qDCRmYGAlPEdzghU-73Vg-7sHr-mvvjZ4-6PRQ>
 <xmx:_wyVYR0OYgsm0iG6Ug4zk3PZ5m1iDlab50VZAe3wVvpP-uOB2S1rNQ>
 <xmx:AQ2VYQyHodQ4VpmMQKI878B5RvjNYfN9grBCxgv3kvTAin4okWx99g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Nov 2021 09:09:03 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 0/3] drm/vc4: Support for 30 bits YUV formats
Date: Wed, 17 Nov 2021 15:08:57 +0100
Message-Id: <20211117140900.313181-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org, Dom Cobley <dom@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
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
Dave Stevenson (3):=0D
  drm/fourcc: Add packed 10bit YUV 4:2:0 format=0D
  drm/vc4: plane: Add support for DRM_FORMAT_P030=0D
  drm/vc4: plane: Add support for YUV color encodings and ranges=0D
=0D
 drivers/gpu/drm/drm_fourcc.c    |   3 +=0D
 drivers/gpu/drm/vc4/vc4_plane.c | 169 ++++++++++++++++++++++++++------=0D
 drivers/gpu/drm/vc4/vc4_regs.h  |  19 +++-=0D
 include/uapi/drm/drm_fourcc.h   |  11 +++=0D
 4 files changed, 167 insertions(+), 35 deletions(-)=0D
=0D
-- =0D
2.33.1=0D
=0D
