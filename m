Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80657454417
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 10:45:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78BDC6EA16;
	Wed, 17 Nov 2021 09:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0D96E92D
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 09:45:35 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id CDDA258082C;
 Wed, 17 Nov 2021 04:45:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 17 Nov 2021 04:45:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=ekf9vvCWfLNoSjVEXV4DBI29ZU
 qfpHxwPzoBJFFnGlc=; b=P4evg08MecqlLumYRn8QndAEXrs+/iJm6R0Ty+x7UM
 62Q59fp0ynTFDMk5aFR04apSz1VADfOO5ZSop0rYeIvd/EwmOHsA/Fysuo4YMjH2
 0iN/o+ypkq8v6fRBygaM1haaDv5eNkP+4ZO1xYvmyXKDBCSQUsUkKfgzHaX80+8m
 vd8uMcuZZyf0t69m5+EXEGgNZ1p+5E6yklmaZhbxM3pp+RGjRpvs2SOBp5hOjj9D
 TRLwh9RI9pA8FSk85XcBrIdSSZJr5t3gYNhMM0wxXIaELRQp6yElnFtYejkeikGM
 XxuYd8H100UE66mIY2cFkfii5vWrDlhrwJFv27NUw8gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ekf9vv
 CWfLNoSjVEXV4DBI29ZUqfpHxwPzoBJFFnGlc=; b=HpHRdddOKEdflxjZDdIf9N
 HvgdZdbjhRv+6H0Istn4yNtuLqBsb2m2y5PpGYK0kV1QiC+NedcQ0XSYWEiAKisW
 t5HnF+WLfZ9tHkFncsQ5QGeu/2KP2FrU3T422Ym827Qg9RjqafaHVXk//eiINLH3
 /kzJxGJw1Q338yi6PRjv8+1cjIu1F+uFZU5IubtubhShL4a7+M4e8H9PV1Qew4sk
 MYU3JYIoq+nSy5OSiUw+rkwzvW7Wg+0l4vI5oaTHUc7qO67h9diz3Ywp3Gm/Gr1w
 JNfuGu1+5l01rewxxuJ/byq+2g9ixiXodW9kmaeaNYIIReE8NrVt1fgYdLSNgDUQ
 ==
X-ME-Sender: <xms:Os-UYYN1n05mmRPcfrtHx2VEmOE7F_1I6Cj-jxAJZzx0UbBE9Nyi0g>
 <xme:Os-UYe_WMvS_wgF_JSj6V27n31XSXWEPuInGf4GTXsEHAetsAhZwUYBL-Hu79al7j
 8chkM1_c8Z_JSx2RZ4>
X-ME-Received: <xmr:Os-UYfSVdATDDAvi-gunQ_tAwHu7Vux0hMRCmkqSqrtBOPEAmtP8sg0WOxcXPwQLqWPsJe4SFfbEIF8WEARF_8FD3Eqzyahsay-8abFJRtE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeggddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepteeikefgffekgeekledtheduteetjefgkeeuvefhhfetgedugfektdeugeffgfef
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 himhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Os-UYQt9ML7c0juaaJJATX84szjrzzKixhEOlwHRxfJNgcZCsNODNQ>
 <xmx:Os-UYQfkZJfdTsQZda-2I1pz2IKhQvPSkc77Dc6LCCvPKstkH1nQAw>
 <xmx:Os-UYU39LeS8XL2pOTRkNr99gJ0QReIB23DTHPbcutvhGQJC-mtB3g>
 <xmx:O8-UYY72WpGZPN21qYUswdFAeXi7AzjcPL91BhmnO1_NmjTQwcrdZg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Nov 2021 04:45:30 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 0/6] drm/vc4: kms: Misc fixes for HVS commits
Date: Wed, 17 Nov 2021 10:45:21 +0100
Message-Id: <20211117094527.146275-1-maxime@cerno.tech>
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
Changes from v1:=0D
  - Prevent a null pointer dereference=0D
=0D
Maxime Ripard (6):=0D
  drm/vc4: kms: Wait for the commit before increasing our clock rate=0D
  drm/vc4: kms: Fix return code check=0D
  drm/vc4: kms: Add missing drm_crtc_commit_put=0D
  drm/vc4: kms: Clear the HVS FIFO commit pointer once done=0D
  drm/vc4: kms: Don't duplicate pending commit=0D
  drm/vc4: kms: Fix previous HVS commit wait=0D
=0D
 drivers/gpu/drm/vc4/vc4_kms.c | 42 ++++++++++++++++-------------------=0D
 1 file changed, 19 insertions(+), 23 deletions(-)=0D
=0D
-- =0D
2.33.1=0D
=0D
