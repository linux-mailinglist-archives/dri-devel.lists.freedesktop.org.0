Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE4D560028
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:38:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFFD14A655;
	Wed, 29 Jun 2022 12:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9636B14A649
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:37:56 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 6EF90320095D;
 Wed, 29 Jun 2022 08:37:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 29 Jun 2022 08:37:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506274; x=1656592674; bh=nH
 E1W1eXLTeIY4F4dXeh7XyIeM3Zv33nK1Xxbxva7jA=; b=t+oS0psnKyv/ZGUyUT
 KXo5OrbtnHLAgxjLn3/gliImgmZpzVvgKVrNhDaNkeV7OIgTbN8cJbqZhgJ84ijB
 1HubC6VxpIEmRXzoyl6ONcuixKgL5+ln4IVVDYgrdHjkXum3APdvrsBqtkEgxeRJ
 iUxvpcLpUe5i5KrAvJKxj7cxs8pCLVl6xGk83Pdsz/yx6wlFM6QD21+tkBEQfuAh
 hgzbWFASWa5nfftj7Xq+eMkidOtTN1563qP7IToO3XALFQ41zCab9PGqovpQ7nBV
 yt+/JjtkTww1+gRAmIaH8/chbMgoZiwiZBbzJJn1GT54JXaXPfItMIje8UfvgP4B
 mS+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506274; x=1656592674; bh=nHE1W1eXLTeIY
 4F4dXeh7XyIeM3Zv33nK1Xxbxva7jA=; b=w0W4LWG2vEH8JQ47MllKUxj31et6m
 d7hcjp+iIafffJoPbyBvroXzY9rL3uQ8hiZqGcYcTfZMyOwCbMP5LRajIN2+f/O+
 YLPAAl2ivM3GdugEcu41fmG9vVlgDDUDLco553rM9Q8a832RV8zTUxiU7b4P0BJj
 ESsnwTI6/+Fpew+oRM7CvSpAuQi/1cqkaM2aJZTkVliUWfGqXbDafhbUVlGnzivM
 RFmA0bzAYdA/ye/xMindVTWs6NeDIYM+zYhG9EmG4UvqB4pKuR0WEqzX5QrJEHrv
 V5ZpEFJaoW6vmiuGe2uTzpjlFGpJ1ZAeNhkdw70KRH+5eMhD4bkH8v3JQ==
X-ME-Sender: <xms:oke8YkiQZR1IHYldIi9O-1u7cZh9C-Idv6Pwly0S2LqC_0u08b2Aag>
 <xme:oke8YtA6NX4cGWgav-mRZjxTfyWggL79FaxPXbHOgg7UXJcJLnDclWTSMCevhjM_u
 decSCwP1fEiFac67zw>
X-ME-Received: <xmr:oke8YsFCoR5z8J4a0Hv9LK7zDawGPjeWdntQNZUKkHBANnaTLcPONr-Rm54IbE2UG4z8QPxNEuY2DARQeN-atFJoTVdOMsn1zZc99A0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeduieenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:oke8YlQ-chnAqGa83qhbw2xklGivUSIECopZ3bgENZBwvtYLLb3QdA>
 <xmx:oke8YhzGVwNaFN3fTGsZ9ODeBpRPRm8p6VXUmI-LanIs0M8dkpJbHA>
 <xmx:oke8Yj4eE7MKl0GRZax5yKC0vw_gxOPyrOpWBTPrDMEYClZ8Yk7Law>
 <xmx:oke8YjsGVY3XMWg9y9tngiRkuX-v8TnlwJs4m4Equ0TG4UfFznvdXA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:37:54 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 54/71] drm/vc4: txp: Remove call to
 drm_connector_unregister()
Date: Wed, 29 Jun 2022 14:34:53 +0200
Message-Id: <20220629123510.1915022-55-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629123510.1915022-1-maxime@cerno.tech>
References: <20220629123510.1915022-1-maxime@cerno.tech>
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

drm_connector_unregister() is only to be used for connectors that have been
registered through drm_connector_register() after drm_dev_register() has
been called. This is our case here so let's remove the call.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 160f9d0ec6f0..7e5212bcf8e6 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -336,16 +336,10 @@ vc4_txp_connector_detect(struct drm_connector *connector, bool force)
 	return connector_status_connected;
 }
 
-static void vc4_txp_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-}
-
 static const struct drm_connector_funcs vc4_txp_connector_funcs = {
 	.detect = vc4_txp_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = vc4_txp_connector_destroy,
+	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -532,7 +526,7 @@ static void vc4_txp_unbind(struct device *dev, struct device *master,
 {
 	struct vc4_txp *txp = dev_get_drvdata(dev);
 
-	vc4_txp_connector_destroy(&txp->connector.base);
+	drm_connector_cleanup(&txp->connector.base);
 }
 
 static const struct component_ops vc4_txp_ops = {
-- 
2.36.1

