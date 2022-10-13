Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B88225FD764
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 11:57:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A0010E505;
	Thu, 13 Oct 2022 09:57:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49B110E505
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 09:57:05 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id DC8775C007F;
 Thu, 13 Oct 2022 05:57:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 13 Oct 2022 05:57:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1665655024; x=1665741424; bh=ElrFCOQYz9
 811QjA+EhljWQJuhopMm0PAtIt4Y0PiLk=; b=iH2vj+1AVMLQNpZSN3QgFdI8in
 C40uzS6P9OGiTyC9cMNYtDhbpHHqe8bv9mhp4/MLs5+efc2saoFLxfDDGybR8mDI
 nu6hReuNGs1ZUS3GRpzt1iwOMWNVlISaxcMA0XzmmKmb0iqbhq+MzGC244ZWm/VQ
 h6PdsqJEuoNGI6O3Ix2aHcD+caqUITm/JTj4TREAR02wriG2RctIHH8MrA9LUuLQ
 kFQRd5Y6Xs8MzSiLVBdXS+QLjMMU8trB3WeQNDPwV/wsY/dCD5XjsbGF1o3zBWlT
 Zv9426I+pm60L9woeIgpCFIQL4nIgzk0lOGIRaXZKR5Rm/k/YEV2l9ByyK3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1665655024; x=1665741424; bh=ElrFCOQYz9811
 QjA+EhljWQJuhopMm0PAtIt4Y0PiLk=; b=Y4teWWMceoV4F1I7ZuUd+/WDAP/4V
 kARrTUAl0vvYdaNnkfp0DXHbouVSO9pf8AQTP/oYQwrFpIZJEeS3VmyoxGy8tnD7
 Q9w4bu4otB7Hbtsj7Dyr0baFn+dXlTnsrXhdusg21qoVnHXzyVMOQlzCmsahIQDE
 rHX351Qg/ieyfVvLETq0gNLPYBO+Zv0GpgMoSoSU6EQgu/wKPp3aabDLp8RNmXHM
 XQ7qnMoKbIY6PJ5h2QCRQx/1O/XQlz96jrCNDEiWOyph7ZHp202fof5Xfxw8wi+V
 z5aV2rdu26mv53rH1NvFDVZhooSKCBovYgAXNT7LQy3LGtYFgdmCln7MA==
X-ME-Sender: <xms:8OBHYxg_CHC8TNkEsY_PK2T1_5OITwwNcQPk-UpeuzsroTeOgoN7qQ>
 <xme:8OBHY2CJSF4ZGCRLp7sdFb7ly0l-uXyBE47O1KycAi-ez_hMwwlxADCcJvkTMT8eq
 rwqwXS1wPAZ7W8bRK4>
X-ME-Received: <xmr:8OBHYxEWLyx55AQX6wCrDiYDtnVYKHl-q-NRzRGc1JZZp6tweDc8yCPwsdfz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepufggtgfghfffkffvvefosehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdehfeejtefhgeegudegveejieetfeeugeehveffteejkedufeeltedutdeu
 geehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:8OBHY2QXb3jnZ8y1g6Bj-zDF66BYHvMb96Jc_eGqCWk6M_-rlndj4Q>
 <xmx:8OBHY-yRxJp3u_KobENmMx9Fo3cOqcZ90y06SnHOZ4BuqyozeKEWiw>
 <xmx:8OBHY87FQi_YXKz5g5C5lKPU1fmFqsF9qV6mleJoVl9RwbVPF-sykA>
 <xmx:8OBHYw7obaVWRX8T79IH2OidkN3EFF_oBKqgoi3PuJpl79ueLQ71kw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 05:57:03 -0400 (EDT)
Subject: [PATCH 0/7] drm/vc4: dpi: Various improvements
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIANzgR2MC/w3LQQqEMAxA0atI1gZsSxG9TW3DGNAoiboR7z5Z/MVb/BeMlMlg7l5Qetj4EEfoO6
 hrkR8hNzfEIcYwhIR6MjaP91OPh3aSy7CmNuacU6hpAl+XYoSLFqmrz3Jv2/f9AQtg5JhrAAAA
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 13 Oct 2022 11:56:44 +0200
Message-Id: <20221013-rpi-dpi-improvements-v1-0-8a7a96949cb0@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Eric Anholt <eric@anholt.net>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>, Rob Herring <robh@kernel.org>,
 Emma Anholt <emma@anholt.net>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=1493; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=mBzc73alVw2h+DQ2TtBLxfsGXPDhw2QfH578ZOwcUoQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMnuD9666/w6fjWoe4066wn7iN2893YEhfEH/smT27zvX0Ni
 z3fhjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAExkiiAjw4rrpROdRQ8IN9770r8l/G
 7pA+UFPz/MKtQxfHnOZMsBcx1Ghmcrv2bXxbmkX3y32Svmfw3fnjOcvfze6lvPbPJfeNt8GQMA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Joerg Quinten <aBUGSworstnightmare@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>, Chris Morgan <macromorgan@hotmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Those patches have been in the downstream RaspberryPi tree for a while and help
to support more DPI displays.

Let me know what you think,
Maxime

To: Emma Anholt <emma@anholt.net>
To: Maxime Ripard <mripard@kernel.org>
To: David Airlie <airlied@linux.ie>
To: Daniel Vetter <daniel@ffwll.ch>
To: Eric Anholt <eric@anholt.net>
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: Chris Morgan <macromorgan@hotmail.com>
Cc: Joerg Quinten <aBUGSworstnightmare@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Chris Morgan (2):
      media: uapi: add MEDIA_BUS_FMT_RGB565_1X24_CPADHI
      drm/vc4: dpi: Support RGB565 format

Dave Stevenson (2):
      drm/vc4: dpi: Change the default DPI format to being 18bpp, not 24.
      drm/vc4: dpi: Fix format mapping for RGB565

Joerg Quinten (3):
      media: uapi: add MEDIA_BUS_FMT_BGR666_1X18
      media: uapi: add MEDIA_BUS_FMT_BGR666_1X24_CPADHI
      drm/vc4: dpi: Support BGR666 formats

 drivers/gpu/drm/vc4/vc4_dpi.c         | 16 +++++++++++++---
 include/uapi/linux/media-bus-format.h |  5 ++++-
 2 files changed, 17 insertions(+), 4 deletions(-)
---
base-commit: c9b48b91e2fbb74fb981aa616a6ef3c78194077f
change-id: 20221013-rpi-dpi-improvements-c3d755531c39

Best regards,
-- 
Maxime Ripard <maxime@cerno.tech>
