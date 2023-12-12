Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9764680F48E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 18:27:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC18510E67B;
	Tue, 12 Dec 2023 17:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF60110E65B
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 17:27:12 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rD6X1-0001uR-3P; Tue, 12 Dec 2023 18:26:55 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rD6Wx-00FOPS-AU; Tue, 12 Dec 2023 18:26:51 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rD6Wx-001nbp-0U; Tue, 12 Dec 2023 18:26:51 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>
Subject: [PATCH 5/5] clk: Make clk_rate_exclusive_get() return void
Date: Tue, 12 Dec 2023 18:26:42 +0100
Message-ID: <3f556647c09162be61edba6b50e76d235aace590.1702400947.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
References: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2265;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=qJe1s9wVwLl8m/pFpVrdi1+PKSyFn6KyEhyiKlqeWWk=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhtSK6Zf0mliZ79remRRaoTdVj3sjX5Z43dTfXEr7MubN7
 cv5Yz2jk9GYhYGRi0FWTJHFvnFNplWVXGTn2n+XYQaxMoFMYeDiFICJuD3nYNgg+PrYSkuD2Eki
 L1U4HRwVOm/VLGkPWWUoV1WYwxBfEWYmlb5vdk5eXETUxLjPjnuM9m124lwrkvHnX3X3TrfzUWd
 XtRVfrdwx53zY0iitL8q7iiOm/RSY41yVxy7Q3SF+Yf3DO/PK2hbZC6n2+hisPicuvTMhrsv85J
 +QOu6/GZ3CmxdfOB8buHp9dNSn+ZszIi1YT3amxbtM0I1SV/vT2/G2XCwjeaJz5bNzS+UOnBYu3
 8VyICqoSHNi9dnMPxmiJx7qHy3ZySo1tTiDY5NraL5Po03Y7PjDOWnuQoe36p20d9SY6BYbPV8/
 xLjJxNLi0Z73rq0//xkv+LSD59R1XatNPzx3tk47vXM3AA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Chen-Yu Tsai <wens@csie.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Johan Hovold <johan+linaro@kernel.org>, linux-sunxi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-pm@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Ripard <mripard@kernel.org>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Georgi Djakov <djakov@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function currently returns 0 unconditionally. This isn't very useful
and makes users create dead code error paths. So let this function
return no value. All users were adapted before to ignore the returned
value.

Also fix a few typos in the kernel doc comment for
clk_rate_exclusive_get().

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/clk/clk.c   | 6 ++----
 include/linux/clk.h | 8 +++-----
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 2253c154a824..af2011c2a93b 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -925,17 +925,15 @@ static void clk_core_rate_restore_protect(struct clk_core *core, int count)
  * clk_rate_exclusive_put(). Calls to this function may sleep.
  * Returns 0 on success, -EERROR otherwise
  */
-int clk_rate_exclusive_get(struct clk *clk)
+void clk_rate_exclusive_get(struct clk *clk)
 {
 	if (!clk)
-		return 0;
+		return;
 
 	clk_prepare_lock();
 	clk_core_rate_protect(clk->core);
 	clk->exclusive_count++;
 	clk_prepare_unlock();
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(clk_rate_exclusive_get);
 
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 06f1b292f8a0..f88c407925f8 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -190,16 +190,14 @@ bool clk_is_match(const struct clk *p, const struct clk *q);
  *
  * This function allows drivers to get exclusive control over the rate of a
  * provider. It prevents any other consumer to execute, even indirectly,
- * opereation which could alter the rate of the provider or cause glitches
+ * operation which could alter the rate of the provider or cause glitches
  *
- * If exlusivity is claimed more than once on clock, even by the same driver,
+ * If exclusivity is claimed more than once on clock, even by the same driver,
  * the rate effectively gets locked as exclusivity can't be preempted.
  *
  * Must not be called from within atomic context.
- *
- * Returns success (0) or negative errno.
  */
-int clk_rate_exclusive_get(struct clk *clk);
+void clk_rate_exclusive_get(struct clk *clk);
 
 /**
  * clk_rate_exclusive_put - release exclusivity over the rate control of a
-- 
2.42.0

