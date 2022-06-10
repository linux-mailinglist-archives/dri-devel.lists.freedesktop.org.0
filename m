Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB4D546221
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0CB4113BAE;
	Fri, 10 Jun 2022 09:29:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7E61122C2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:29:38 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id B740F5C01B1;
 Fri, 10 Jun 2022 05:29:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 10 Jun 2022 05:29:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853377; x=1654939777; bh=7f
 /HtFpwYygqcU7HhkPDpO3WMBG0ucgSk+08aGyVEls=; b=OYLjbBPHePntZ+QC37
 J7fWOJO6UE0SuQ68S55nOOFTQyEDEnHKebJqGovvBgS3Zw44qdfYjZh+hPnC1byA
 5EidZ9CqCyGNQusxIOObYfojZVwpIRtsXaaWqpDCGLE6EQPEMDFy8xLTRBP/+Lsd
 I8VmyIu/plKETCUi19CRUC+/H8P1GSBembodggJ7MaKVNNnd/9pM6NiWy4zzsYWb
 RGmz2aIO3bT1hTCkvEUMGwiVt7b6BxtW3m7WTtlN7XyclJzNUlRD/fS8eJgi3Lt6
 nnJWJEPJqJZGPM4oS7U8QhHS1lkvk8nTVPV70+7SYX7QlFjqtytcZpRoUWYX8TsD
 yrCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853377; x=1654939777; bh=7f/HtFpwYygqc
 U7HhkPDpO3WMBG0ucgSk+08aGyVEls=; b=uQcPTAnKBxvySI2qR0NHdbsUqE3TX
 REd3LlJCkqJeLdTTCPtFmgSLX4N7iSHfnjmwn14+ZJRLJcvgCIFz4a77G4ipzr7g
 6hHCn4ZQ+guaVPLJOMHtaBt5IPDChYzY+l/B37LrHeTBXPz8zmomLqO7TYoZ4+yK
 sJXai4nAIflR2kPcR/vpW5ENRL1VZqK+zUKRaf9Qd/wA5x15Bh3CdHsCHKkgVkB/
 Jb0nbnR7sgIZ5GFDUQyNYo6/NbHSuSdGZnZqaB3sieJ9Dsvo49PyDRZlSlm54uet
 Q0NVG14tTC5HxWHf1DP5FzKLJANjKeXDm/jt+2jSqwPSMU/sla9DeCMXQ==
X-ME-Sender: <xms:AQ-jYkVSziv1bUlZmN9hMW3Ql3AJ8IzBKC9lZ7HtpiK5tU_5xBsD2A>
 <xme:AQ-jYokhVfqfmJClMm28rviI883lFRWgQ-B5iZrXu39uHF3sUkWepKTTLCVVr05Cs
 mzjlBjdebwXwOXXxfA>
X-ME-Received: <xmr:AQ-jYoa1DMIFpp0LrGlB6G8XAPjbMRf3qeGxLusyVggm0Rm8UKZXVZ0G0KCSqu2WU07MXOYdwjn0pXBw7erR_FOYZ73q5nj9KIGGkn8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:AQ-jYjUa69rhlBf4kN8pLXFNFNRuRcKIv6ig-eQvf2MtDFIRuG1CGA>
 <xmx:AQ-jYumKxcrVe2qUF7DFpdEw-n0KgGYvEmCEw8bQGADBY3RpUh5cLw>
 <xmx:AQ-jYocXnG7F9ImrpjqJU0eluisbGn6dapS3zjTxKzoeMJMnE5Im8A>
 <xmx:AQ-jYvANPlXhSVrNkp6LOt2WDpSD_a9x2yOh2eE4NtgrZ7MMkclgNQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:29:37 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 05/64] drm/connector: Mention the cleanup after
 drm_connector_init
Date: Fri, 10 Jun 2022 11:28:25 +0200
Message-Id: <20220610092924.754942-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610092924.754942-1-maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unlike encoders and CRTCs, the drm_connector_init() and
drm_connector_init_with_ddc() don't mention how the cleanup is supposed to
be done. Let's add it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_connector.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 353d83ae09d3..2a78a23836d8 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -222,6 +222,11 @@ void drm_connector_free_work_fn(struct work_struct *work)
  * Initialises a preallocated connector. Connectors should be
  * subclassed as part of driver connector objects.
  *
+ * At driver unload time the driver's &drm_connector_funcs.destroy hook
+ * should call drm_connector_unregister(), drm_connector_cleanup() and
+ * kfree() the connector structure. The connector structure should not
+ * be allocated with devm_kzalloc().
+ *
  * Returns:
  * Zero on success, error code on failure.
  */
@@ -345,6 +350,11 @@ EXPORT_SYMBOL(drm_connector_init);
  * Initialises a preallocated connector. Connectors should be
  * subclassed as part of driver connector objects.
  *
+ * At driver unload time the driver's &drm_connector_funcs.destroy hook
+ * should call drm_connector_unregister(), drm_connector_cleanup() and
+ * kfree() the connector structure. The connector structure should not
+ * be allocated with devm_kzalloc().
+ *
  * Ensures that the ddc field of the connector is correctly set.
  *
  * Returns:
-- 
2.36.1

