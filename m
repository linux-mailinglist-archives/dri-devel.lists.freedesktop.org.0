Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECF350D36E
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 18:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB8A210FCEC;
	Sun, 24 Apr 2022 16:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B248810FD50
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 16:27:02 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id F2AD55C00D0;
 Sun, 24 Apr 2022 12:27:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sun, 24 Apr 2022 12:27:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1650817621; x=1650904021; bh=uC
 Q2R2fyjy+uTBpLAiBmpciTr9WrThWXS0olngIbwR0=; b=ij6TFogyjPCTd4plzX
 fkpJG8mtbhVNOQIItFHc0QOCPt61FCO0S2yXlFwHKW0GInr+ltoFvcMVJZRsjkQo
 mqXfU+81ApWAN+HtFND1LmnQgpJMVRR7eC7/HOEMzQuFtFqDD/S9QaKWF1QXJgla
 ulLiaW1QXB4s0OvXLkAo4E2xGKf7nEO6HBdpWzo6CU/sesst1wlX8YCU1Bi67OHl
 1CiOmiWOfDPB64hbSqsEgBKXu95MFmFS9ia1nty7YTYYLJhSc4o5ZKt1kZ9+qFVe
 2tA+KdfgKVDZPRLptsAnOjkrZG6WjDsQ7oLLchDS1cTryG1m8nAkMl80yQvih4gZ
 w9zA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1650817621; x=1650904021; bh=uCQ2R2fyjy+uTBpLAiBmpciTr9WrThWXS0o
 lngIbwR0=; b=pvGuu6uYTlgC8AerhkYb5tHBgdw/KN5Bd84WIw5PMP1EOSDE+rF
 d4ZhRjuin817P9z2QkrDYuPjWskd03ktnXRO5jcWM3IicP/fMyctdeD2zGsly6Pd
 ky8I9OVL0KbyQ8a2aeI/86acoqs1W4R1/37f2XjPBCwgKPT9T/Pq4H1ZQgRTaL7T
 YFbcwoGDque4RMKQMV6Lfdux3WZmle2x9DgiC3hL3g1GdhzMAU/lrtROqyHPqy2+
 mivzBGee6cu0CZzJ2sHKcATYg6dhA1meeAXFAEhJrJ+HClpUrVigcbdwZOLhAf8s
 X1pcJ9tOPUDfDEGh1YAX+gWw0UFWU1qvfuw==
X-ME-Sender: <xms:VXplYhEdd2ZlpgvBxLiY_E0WvpHQjgxVk8BrPm9FlQWC88zWp9n_XA>
 <xme:VXplYmXCdnZCTh8Z1JQcrFMtFd4Z02O8MH9vJKaCXJU88b7dqZOoEhK3Rx3RmOft9
 osOIwseA8KB44fihw>
X-ME-Received: <xmr:VXplYjLbs-X77ca3p1hHrqQPOhXzM2nkR_9ypXPhC1GwM31hE0Xuu-zCmtBe8z4RAUDj6DRzU6QmjmACqPjDTdOsMxYJjZf0nf79s-C8m--y3upCZL7inTfrbrHW-PFIRiPGKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtdelgddutdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
 udefiedtveetnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrh
 homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:VXplYnGsfhef7Aj0otzWUycsql50_eCy0JBEuhPQRK8U6i5Ez0bq7A>
 <xmx:VXplYnW2TAJKpf1sV_Zr8v_DObGmeViE2UFgsTpwQ7lw01du5LW9rg>
 <xmx:VXplYiNqWRGGdLCmms64r4OqX78AiZe_XOjFLvxs_r2gya90b26aCQ>
 <xmx:VXplYqNL-pDjO6fSNjtnMnc9gIzgI9kuVDpHfiBpvBwKwWHjPtp5Ag>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 24 Apr 2022 12:27:01 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 14/14] drm/sun4i: Add compatible for D1 display engine
Date: Sun, 24 Apr 2022 11:26:32 -0500
Message-Id: <20220424162633.12369-15-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424162633.12369-1-samuel@sholland.org>
References: <20220424162633.12369-1-samuel@sholland.org>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that the various blocks in the D1 display engine pipeline are
supported, we can enable the overall engine.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v1)

 drivers/gpu/drm/sun4i/sun4i_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 6a9ba8a77c77..275f7e4a03ae 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -418,6 +418,7 @@ static const struct of_device_id sun4i_drv_of_table[] = {
 	{ .compatible = "allwinner,sun8i-r40-display-engine" },
 	{ .compatible = "allwinner,sun8i-v3s-display-engine" },
 	{ .compatible = "allwinner,sun9i-a80-display-engine" },
+	{ .compatible = "allwinner,sun20i-d1-display-engine" },
 	{ .compatible = "allwinner,sun50i-a64-display-engine" },
 	{ .compatible = "allwinner,sun50i-h6-display-engine" },
 	{ }
-- 
2.35.1

