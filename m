Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE41417652
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 15:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B276EE19;
	Fri, 24 Sep 2021 13:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C536EE19
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 13:55:33 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 5E0D35C0236;
 Fri, 24 Sep 2021 09:55:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 24 Sep 2021 09:55:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=qutxWftZ6OBZeX1kVy9tGxbqKI
 Y4+VANbGmn3Ivw2jU=; b=Sn3pBIVt7xtXGpz0T14jRRbcdsVivPCOIMSs9Tu8co
 jWNNEIViEgVQ8x8W6SKDSRiG8r3lLhm0l3IfX80ZLlWxgqD/E9xfxECqbE1KWPu4
 bHRnsVSnV1bB8Pv9JLpVEMOzDL7PvN0YBQse6e0AFo2wXiW1bobxiWZO78y0i8lX
 yvtLDD4Mg2pnncsd2ZzuwKgcCCAQTZFCQzwKu7mleRI26L84h4H3rC29ivdwXb/o
 poan1GFzTHDda9xAVXyGrXD3iPFDwO/VO6DfkHUhRAf0U1dzqK/VxsxQIqE0zRPZ
 Dil/Jb0fA93J1sL6LOqvsFOyg7Ao6PnsrdqiquhvQOxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=qutxWf
 tZ6OBZeX1kVy9tGxbqKIY4+VANbGmn3Ivw2jU=; b=aJT4dzBEkISheySzP3cQ5x
 CD+UlKojBcMG2idIlaIdwWmfQH89bnpAZCrRePFz0jIng4sVQ5DxsYUBRAwcna3O
 HjJmFFlzZFe3+i6zuI9O4QggJG8bbiLleCEcpo8z8lxB1fg6VW/HAl4afWP4h2Ck
 EWrQwN79SmM4sYM197+D7FSV1i+3J+L+kv8/0kvNJB0TO2KENVxtvnft3J9USQFk
 G6LvotodPeUOOl6BXEJR2Fg8gvKOCyIht4XMLoBT688+tH457Wg9uertbnTlcAxY
 T2k6Sw2O3paFtKAg2Y6R3C9k49nLoQ19poCT7/jfNQYN46l0XEKDORslORGGh0iQ
 ==
X-ME-Sender: <xms:09hNYTA0JARDWnnhvnf1VM1SQxFP9j7H0Q1e8yIbWvvI6QhkOBC2Rg>
 <xme:09hNYZh0g06n9SOavUF0IlaVTMTKt5fp91kqyXwqG6pnNqUm_uvcfjAj7L-qfGHUJ
 FcINOMx5e_r_oBhX6M>
X-ME-Received: <xmr:09hNYemMOczLNr1AOTIMAT0ib2-vQlCT3VWqz5FfttGEu37hnMEwHL-LVym9SqhMUSOxQRlLf-r9RRZbz_iI6lsxPW8IrqsXl5Tr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejuddgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
 feenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:1NhNYVzByeKUQC6YzfIKHkYFRFIZAXsJjbP7ken5eVN7uoZor-TxPw>
 <xmx:1NhNYYTAsxjfj1tJjR3nvBO4WlghH4Vip0HmO17g3GxS9YkcQPpFZQ>
 <xmx:1NhNYYYsFnZ-MJaEc-DhCaN-coKo3fWaAARLZLxuZwQOmxwO1I_DRA>
 <xmx:1dhNYdRUk73QcwpTPh7xxEiuqfukJKGUH6cvOSfZs5ozfpEnuS1jWg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 09:55:31 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH 0/2] drm/vc4: hdmi: Get rid of encoder->crtc, take 2
Date: Fri, 24 Sep 2021 15:55:28 +0200
Message-Id: <20210924135530.1036564-1-maxime@cerno.tech>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,=0D
=0D
Following the report from Sudip Mukherjee, the previous version of that pat=
ch=0D
got reverted until a fix was found.=0D
=0D
While it's not clear yet why we end up in that situation, the culprit is th=
at=0D
the original patch in its ASoC prepare hook was calling the vc4_hdmi_set_n_=
cts=0D
function that in turned relied on the connector->state->crtc pointer being=
=0D
non-NULL.=0D
=0D
However, no particular caution was being done to make sure that was the cas=
e,=0D
eventually leading to a NULL pointer dereference under the "right"=0D
circumstances.=0D
=0D
We did however had some checks for the pointers sanity in the original patc=
h,=0D
but they were only enforced when the device was opened, and we were only=0D
checking for the connector->state pointer.=0D
=0D
The fix is then two-fold: First, we check that we can actually perform audi=
o=0D
operations in both startup and prepare, since the situation could have chan=
ged=0D
between the time the device was opened and the time when we actually start=
=0D
streaming. Then, the encoder->crtc conversion patch has been changed to che=
ck=0D
on connector->state->crtc as well in that sanity check to avoid dereferenci=
ng=0D
it if it's NULL.=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
Maxime Ripard (2):=0D
  drm/vc4: hdmi: Check the device state in prepare()=0D
  drm/vc4: hdmi: Remove drm_encoder->crtc usage=0D
=0D
 drivers/gpu/drm/vc4/vc4_hdmi.c | 75 ++++++++++++++++++++++++++--------=0D
 1 file changed, 57 insertions(+), 18 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D
