Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AA440AAF5
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 11:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C0A6E453;
	Tue, 14 Sep 2021 09:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B806E453
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 09:35:25 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 506E92B012D0;
 Tue, 14 Sep 2021 05:35:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 14 Sep 2021 05:35:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=U901QfoqKz4GL
 akDPdNIajCVx7aBZFboxgzImXSjFz8=; b=cOa5pBVqwZPdbS4A/OCJeBXtxyEYP
 EK42b2duh3pQnzcW69FojgiuyYPsQZ9tI6djaO8xkbjE5L1DGo6UmE/6VSQ3qopI
 9aayC/YvEAx9OqA0yZU8XQ4WoIsltfXzRFfeE8hCMIg8JHvERuDVuVQlS8C+X0+s
 qGXpIqDgWfSAa5xs86meMQrZzHwzsMKRF7rSRgj9teO+LgQQAkR4BNBYJUq/+LAn
 JHCzmmbpKeR+qHyQalHH/1L0d4HL/XYVAdrLMlV56COvp7Lfx/9mEwzJiGo4j4yJ
 ECu4EbemXmXJ+h86SoI6NUOdwU7MB46x9gagjw5vsSR+qhXh7u9A/mVZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=U901QfoqKz4GLakDPdNIajCVx7aBZFboxgzImXSjFz8=; b=WihmGbWT
 XfqTpYIh9IIG1s2bQWmkSPyDBMpLdKKOz92u7RfdhZht7p0/9FU3cVPG/2AqP0df
 RbC3wJz8mnNdSsm88GoPIvT6QsmvpdNMO7Fw7lfB2dGQMAA4jUFGL7P4bLXJvzBk
 iyeVyBLiKrXU2tXL3s5CRgpBi3AP9oKQaEH4RREm5GGz95FlgF5qZH+HLjggLos1
 mQDJRMxOyyFwCr8Hcx4Wa4URhQCNHZCLNO2WEx0QyzOY/IDaa4DafPeDFcJcm0rV
 24bflehcI1Kiqp6KNBIujsiI7x8WDEUIqXBa/WBMJhS3DMxGpowdCSJZ8Zr9RKWU
 SbeJ8Ei1ce9rTQ==
X-ME-Sender: <xms:22xAYfO67uXIbGnJpj9JbHkGxd9Xo-m1AJIirCmj0iGgVe25X6-qLA>
 <xme:22xAYZ8HlrxUL2jR__zC_kheCDZNJGVUrsjDmzPXhwt5yFkWKWAT6XPUPAYc6zeR_
 Q41A13ss9OamxjtG1E>
X-ME-Received: <xmr:22xAYeRwrvbb4lh-PrYOF0X19MqGKBqOPwxmnIannMdERkSV4x3KV1L8lPHoTSAdO9Vf8lwuUGoDR98GkcGGhEWYsJHaNdHmqa6K>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:22xAYTtVxtDwDVlrwSoHuGt3qSgiwibG7T1EQD8TeNv0mF-2Ip7S6Q>
 <xmx:22xAYXcQrQ0b5BSnJYoS6OOPutZFZCUTjuESiZhgzJuezdr-WABRlQ>
 <xmx:22xAYf2IFTDp41p79uepxwO2CW-boUS1l2zhGUoduDHubJwSh2zMAw>
 <xmx:22xAYf_7gdRkx9eKtK0Ob1e1PiJyJYY_5ViTYSYe9reV51u_sO5rD9UgAeM>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 05:35:22 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>
Subject: [PATCH v2 1/3] clk: Introduce a clock request API
Date: Tue, 14 Sep 2021 11:35:13 +0200
Message-Id: <20210914093515.260031-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210914093515.260031-1-maxime@cerno.tech>
References: <20210914093515.260031-1-maxime@cerno.tech>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's not unusual to find clocks being shared across multiple devices
that need to change the rate depending on what the device is doing at a
given time.

The SoC found on the RaspberryPi4 (BCM2711) is in such a situation
between its two HDMI controllers that share a clock that needs to be
raised depending on the output resolution of each controller.

The current clk_set_rate API doesn't really allow to support that case
since there's really no synchronisation between multiple users, it's
essentially a fire-and-forget solution.

clk_set_min_rate does allow for such a synchronisation, but has another
drawback: it doesn't allow to reduce the clock rate once the work is
over.

In our previous example, this means that if we were to raise the
resolution of one HDMI controller to the largest resolution and then
changing for a smaller one, we would still have the clock running at the
largest resolution rate resulting in a poor power-efficiency.

In order to address both issues, let's create an API that allows user to
create temporary requests to increase the rate to a minimum, before
going back to the initial rate once the request is done.

This introduces mainly two side-effects:

  * There's an interaction between clk_set_rate and requests. This has
    been addressed by having clk_set_rate increasing the rate if it's
    greater than what the requests asked for, and in any case changing
    the rate the clock will return to once all the requests are done.

  * Similarly, clk_round_rate has been adjusted to take the requests
    into account and return a rate that will be greater or equal to the
    requested rates.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c   | 126 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/clk.h |   4 ++
 2 files changed, 130 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 65508eb89ec9..9ab0927e7ed6 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -77,12 +77,14 @@ struct clk_core {
 	unsigned int		protect_count;
 	unsigned long		min_rate;
 	unsigned long		max_rate;
+	unsigned long		default_request_rate;
 	unsigned long		accuracy;
 	int			phase;
 	struct clk_duty		duty;
 	struct hlist_head	children;
 	struct hlist_node	child_node;
 	struct hlist_head	clks;
+	struct list_head	pending_requests;
 	unsigned int		notifier_count;
 #ifdef CONFIG_DEBUG_FS
 	struct dentry		*dentry;
@@ -105,6 +107,12 @@ struct clk {
 	struct hlist_node clks_node;
 };
 
+struct clk_request {
+	struct list_head list;
+	struct clk *clk;
+	unsigned long rate;
+};
+
 /***           runtime pm          ***/
 static int clk_pm_runtime_get(struct clk_core *core)
 {
@@ -1434,10 +1442,14 @@ unsigned long clk_hw_round_rate(struct clk_hw *hw, unsigned long rate)
 {
 	int ret;
 	struct clk_rate_request req;
+	struct clk_request *clk_req;
 
 	clk_core_get_boundaries(hw->core, &req.min_rate, &req.max_rate);
 	req.rate = rate;
 
+	list_for_each_entry(clk_req, &hw->core->pending_requests, list)
+		req.min_rate = max(clk_req->rate, req.min_rate);
+
 	ret = clk_core_round_rate_nolock(hw->core, &req);
 	if (ret)
 		return 0;
@@ -1458,6 +1470,7 @@ EXPORT_SYMBOL_GPL(clk_hw_round_rate);
 long clk_round_rate(struct clk *clk, unsigned long rate)
 {
 	struct clk_rate_request req;
+	struct clk_request *clk_req;
 	int ret;
 
 	if (!clk)
@@ -1471,6 +1484,9 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
 	clk_core_get_boundaries(clk->core, &req.min_rate, &req.max_rate);
 	req.rate = rate;
 
+	list_for_each_entry(clk_req, &clk->core->pending_requests, list)
+		req.min_rate = max(clk_req->rate, req.min_rate);
+
 	ret = clk_core_round_rate_nolock(clk->core, &req);
 
 	if (clk->exclusive_count)
@@ -1938,6 +1954,7 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
 	unsigned long new_rate;
 	unsigned long min_rate;
 	unsigned long max_rate;
+	struct clk_request *req;
 	int p_index = 0;
 	long ret;
 
@@ -1952,6 +1969,9 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
 
 	clk_core_get_boundaries(core, &min_rate, &max_rate);
 
+	list_for_each_entry(req, &core->pending_requests, list)
+		min_rate = max(req->rate, min_rate);
+
 	/* find the closest rate and parent clk/rate */
 	if (clk_core_can_round(core)) {
 		struct clk_rate_request req;
@@ -2148,6 +2168,7 @@ static unsigned long clk_core_req_round_rate_nolock(struct clk_core *core,
 {
 	int ret, cnt;
 	struct clk_rate_request req;
+	struct clk_request *clk_req;
 
 	lockdep_assert_held(&prepare_lock);
 
@@ -2162,6 +2183,9 @@ static unsigned long clk_core_req_round_rate_nolock(struct clk_core *core,
 	clk_core_get_boundaries(core, &req.min_rate, &req.max_rate);
 	req.rate = req_rate;
 
+	list_for_each_entry(clk_req, &core->pending_requests, list)
+		req.min_rate = max(clk_req->rate, req.min_rate);
+
 	ret = clk_core_round_rate_nolock(core, &req);
 
 	/* restore the protection */
@@ -2255,6 +2279,9 @@ int clk_set_rate(struct clk *clk, unsigned long rate)
 
 	ret = clk_core_set_rate_nolock(clk->core, rate);
 
+	if (!list_empty(&clk->core->pending_requests))
+		clk->core->default_request_rate = rate;
+
 	if (clk->exclusive_count)
 		clk_core_rate_protect(clk->core);
 
@@ -2420,6 +2447,104 @@ int clk_set_max_rate(struct clk *clk, unsigned long rate)
 }
 EXPORT_SYMBOL_GPL(clk_set_max_rate);
 
+/**
+ * clk_request_start - Request a rate to be enforced temporarily
+ * @clk: the clk to act on
+ * @rate: the new rate asked for
+ *
+ * This function will create a request to temporarily increase the rate
+ * of the clock to a given rate to a certain minimum.
+ *
+ * This is meant as a best effort mechanism and while the rate of the
+ * clock will be guaranteed to be equal or higher than the requested
+ * rate, there's none on what the actual rate will be due to other
+ * factors (other requests previously set, clock boundaries, etc.).
+ *
+ * Once the request is marked as done through clk_request_done(), the
+ * rate will be reverted back to what the rate was before the request.
+ *
+ * The reported boundaries of the clock will also be adjusted so that
+ * clk_round_rate() take those requests into account. A call to
+ * clk_set_rate() during a request will affect the rate the clock will
+ * return to after the requests on that clock are done.
+ *
+ * Returns the request on success, NULL if clk was NULL, or an ERR_PTR
+ * otherwise.
+ */
+struct clk_request *clk_request_start(struct clk *clk, unsigned long rate)
+{
+	struct clk_request *req;
+	int ret;
+
+	if (!clk)
+		return NULL;
+
+	req = kzalloc(sizeof(*req), GFP_KERNEL);
+	if (!req)
+		return ERR_PTR(-ENOMEM);
+
+	clk_prepare_lock();
+
+	req->clk = clk;
+	req->rate = rate;
+
+	if (list_empty(&clk->core->pending_requests))
+		clk->core->default_request_rate = clk_core_get_rate_recalc(clk->core);
+
+	ret = clk_core_set_rate_nolock(clk->core, rate);
+	if (ret) {
+		clk_prepare_unlock();
+		kfree(req);
+		return ERR_PTR(ret);
+	}
+
+	list_add_tail(&req->list, &clk->core->pending_requests);
+	clk_prepare_unlock();
+
+	return req;
+}
+EXPORT_SYMBOL_GPL(clk_request_start);
+
+/**
+ * clk_request_done - Mark a clk_request as done
+ * @req: the request to mark done
+ *
+ * This function will remove the rate request from the clock and adjust
+ * the clock rate back to either to what it was before the request
+ * started, or if there's any other request on that clock to a proper
+ * rate for them.
+ */
+void clk_request_done(struct clk_request *req)
+{
+	struct clk_core *core;
+
+	if (!req)
+		return;
+
+	clk_prepare_lock();
+
+	list_del(&req->list);
+	core = req->clk->core;
+
+	if (list_empty(&core->pending_requests)) {
+		clk_core_set_rate_nolock(core, core->default_request_rate);
+		core->default_request_rate = 0;
+	} else {
+		struct clk_request *cur_req;
+		unsigned long new_rate = 0;
+
+		list_for_each_entry(cur_req, &core->pending_requests, list)
+			new_rate = max(new_rate, cur_req->rate);
+
+		clk_core_set_rate_nolock(core, new_rate);
+	}
+
+	clk_prepare_unlock();
+
+	kfree(req);
+}
+EXPORT_SYMBOL_GPL(clk_request_done);
+
 /**
  * clk_get_parent - return the parent of a clk
  * @clk: the clk whose parent gets returned
@@ -3851,6 +3976,7 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 		goto fail_parents;
 
 	INIT_HLIST_HEAD(&core->clks);
+	INIT_LIST_HEAD(&core->pending_requests);
 
 	/*
 	 * Don't call clk_hw_create_clk() here because that would pin the
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 266e8de3cb51..2aa52140d8a9 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -15,6 +15,7 @@
 
 struct device;
 struct clk;
+struct clk_request;
 struct device_node;
 struct of_phandle_args;
 
@@ -783,6 +784,9 @@ int clk_save_context(void);
  */
 void clk_restore_context(void);
 
+struct clk_request *clk_request_start(struct clk *clk, unsigned long rate);
+void clk_request_done(struct clk_request *req);
+
 #else /* !CONFIG_HAVE_CLK */
 
 static inline struct clk *clk_get(struct device *dev, const char *id)
-- 
2.31.1

