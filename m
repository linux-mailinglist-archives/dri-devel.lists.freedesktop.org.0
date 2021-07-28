Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E68C3D8F1F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 15:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 218FA6E953;
	Wed, 28 Jul 2021 13:32:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9231D6E953
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 13:32:34 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id BD485580B85;
 Wed, 28 Jul 2021 09:32:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 28 Jul 2021 09:32:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=+Xx3pAsLQy5UCtTPgEWxKG5vyF
 m55cMeftQwgRJlKhc=; b=jkYR1vmuTKY5fm36O+3iulERPmhF/EKvO4aAuVy0Ij
 pag6QKuk55wlnYBn1TRFlKmr4K42riRvh2DpUHj0OsGvW2U3vnEWaGZ8nqUE8AtL
 Qq27sxiu2R5wb4u1G482ytXb9xZgMrhWT4l/SKhy1tiuAQzZ73KA/X90FGVaJw84
 GzjcIjNYQvRgrBPeB6RGiaC7OTmo/Thw1FupRmN3jFhhH5aqo+86mOMJ7FHC7SWb
 liRWn6RbNEbNQmRuw1PAN833/BjwtErKVfbqMgkLsplQb3d2ZlVIchRtSCHaw/nN
 h2So73lBP7Jc5EbNZf2kHbZpECk+hw5O7XgsvKht/idA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=+Xx3pA
 sLQy5UCtTPgEWxKG5vyFm55cMeftQwgRJlKhc=; b=YPaOxVh8Vm7CWURDyQshH/
 NwYEouivNd60ivP4SPmH0DwOmyDqMlDrS7+sEsT9zlgB65ZIFPwounV9svUqxwtn
 q/rXoXZJNoSEXJN1ZJyGM7lkn1Ls2Y7tdrniS+dLFhDGcnSsmHBHXG72Bay+VacB
 Q0qdnOgS50zEMHjGi3bP1sAdkYsmdqRY684tbEVKrngS/SBO4AJCAz07r1u6sbF0
 2tHYoCz7M9LRtYq4E0taKcaE+zfCHWVpiHHjkwg2NlASmm24v78GHfEKXbJ88zMB
 gke1iAs7HEAXP3otECj+p3/L8bOVg0DzUuPYVa4SnNVOUDO3ZGIdriSpq3yRB5eg
 ==
X-ME-Sender: <xms:b1wBYQ3LIEwmlm_HMhhJNat4C3Ukn0F58rTQbwg48kVoscwtkvIE-Q>
 <xme:b1wBYbE-Vp6j4h35OL4eUEhG46M4tB2CRM8YkswQ79tl-DVrcdCA92z-Tsbcu8o7Q
 w-4-UdDGLATZj5L-VI>
X-ME-Received: <xmr:b1wBYY4PmCc-SPmwotnut4Qvn5KftrKpbmobibkrCoTylHgdEx61Fp7EuKluKnXBAcgmCFjK_A1pvoW1IYWLxC5YknZVpdF2K6iZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeelgdeivdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepteeikefgffekgeekledtheduteetjefgkeeuvefhhfetgedugfektdeugeffgfef
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 himhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:b1wBYZ2fgzlM8Nhy1i1-lU_RPjO4U7f4tkn2dC8S3K_H9i5WqwIEtg>
 <xmx:b1wBYTHIcUV5AuvmbetSBOFgodmhXVwC0qzu6PyO6nESC7IpFo-qaw>
 <xmx:b1wBYS_fYFdkU48M7PbahhpQrE0emVrcnqyhoFQWGgFl2RgTQaIONA>
 <xmx:cVwBYTERMqcBBSGZirzqcGHuHVCfKwIWpl2Bwu1MykgjSDTlRpCAMg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jul 2021 09:32:30 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v2 0/8] drm/bridge: Make panel and bridge probe order
 consistent
Date: Wed, 28 Jul 2021 15:32:21 +0200
Message-Id: <20210728133229.2247965-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,=0D
=0D
We've encountered an issue with the RaspberryPi DSI panel that prevented th=
e=0D
whole display driver from probing.=0D
=0D
The issue is described in detail in the commit 7213246a803f ("drm/vc4: dsi:=
=0D
Only register our component once a DSI device is attached"), but the basic =
idea=0D
is that since the panel is probed through i2c, there's no synchronization=0D
between its probe and the registration of the MIPI-DSI host it's attached t=
o.=0D
=0D
We initially moved the component framework registration to the MIPI-DSI Hos=
t=0D
attach hook to make sure we register our component only when we have a DSI=
=0D
device attached to our MIPI-DSI host, and then use lookup our DSI device in=
 our=0D
bind hook.=0D
=0D
However, all the DSI bridges controlled through i2c are only registering th=
eir=0D
associated DSI device in their bridge attach hook, meaning with our change=
=0D
above, we never got that far, and therefore ended up in the same situation =
than=0D
the one we were trying to fix for panels.=0D
=0D
Since the RaspberryPi panel is the only driver in that situation, whereas i=
t=0D
seems like there's a consensus in bridge drivers, it makes more sense to tr=
y to=0D
mimic the bridge pattern in the panel driver.=0D
=0D
However, panels don't have an attach hook, and adding more panel hooks woul=
d=0D
lead to more path to maintain in each and every driver, while the general p=
ush=0D
is towards bridges. We also have to make sure that each and every DSI host =
and=0D
device driver behaves the same in order to have expectations to rely on.=0D
=0D
The solution I'm proposing is thus done in several steps:=0D
=0D
  - We get rid of the initial patch to make sure we support the bridge case=
,=0D
    and not the odd-panel one.=0D
=0D
  - Add a function that returns a bridge from a DT node, reducing the amoun=
t of=0D
    churn in each and every driver and making it a real incentive to not ca=
re=0D
    about panels in display drivers but only bridges.=0D
=0D
  - Add an attach and detach hook into the panel operations, and make it ca=
lled=0D
    automatically by the DRM panel bridge.=0D
=0D
  - Convert the VC4 DSI host to this new bridge function, and the Raspberry=
Pi=0D
    Panel to the new attach and detach hooks.=0D
=0D
If the general approach is agreed upon, other drivers will obviously be=0D
converted to drm_of_get_next.=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
---=0D
=0D
Changes from v1:=0D
  - Change the name of drm_of_get_next function to drm_of_get_bridge=0D
  - Mention the revert of 87154ff86bf6 and squash the two patches that were=
=0D
    reverting that commit=0D
  - Add some documentation=0D
  - Make drm_panel_attach and _detach succeed when no callback is there=0D
=0D
Maxime Ripard (8):=0D
  Revert "drm/vc4: dsi: Only register our component once a DSI device is=0D
    attached"=0D
  drm/bridge: Add a function to abstract away panels=0D
  drm/bridge: Add documentation sections=0D
  drm/bridge: Document the probe issue with MIPI-DSI bridges=0D
  drm/panel: Create attach and detach callbacks=0D
  drm/vc4: dsi: Switch to drm_of_get_bridge=0D
  drm/panel: raspberrypi-touchscreen: Use the attach hook=0D
  drm/panel: raspberrypi-touchscreen: Remove MIPI-DSI driver=0D
=0D
 Documentation/gpu/drm-kms-helpers.rst         |  12 ++=0D
 drivers/gpu/drm/bridge/panel.c                |   6 +=0D
 drivers/gpu/drm/drm_bridge.c                  | 114 ++++++++++++-=0D
 drivers/gpu/drm/drm_of.c                      |   3 +=0D
 drivers/gpu/drm/drm_panel.c                   |  47 ++++++=0D
 .../drm/panel/panel-raspberrypi-touchscreen.c | 158 +++++++++---------=0D
 drivers/gpu/drm/vc4/vc4_drv.c                 |   2 +=0D
 drivers/gpu/drm/vc4/vc4_dsi.c                 |  53 +++---=0D
 include/drm/drm_bridge.h                      |   2 +=0D
 include/drm/drm_panel.h                       |  27 +++=0D
 10 files changed, 303 insertions(+), 121 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D
