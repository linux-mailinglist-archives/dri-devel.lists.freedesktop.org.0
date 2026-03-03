Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qK5PCRmfpmlqRwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:43:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C81C11EAEE7
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:43:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A061C10E678;
	Tue,  3 Mar 2026 08:43:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="inIiRNt2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B824610E678
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 08:43:01 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-389f2c46d80so77773961fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 00:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772527380; x=1773132180; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bqEeaetpkKSpqDc/1afFvsBhHX5UV9awkVwQAYPdPEo=;
 b=inIiRNt2Ka/PRqrzOnGOTt1xn/jcAbRK2q/NzDxuotfYEx4F099XW2DIuqnER2HsD8
 rI36owilBnLqW/BEfPt177Pk0mmxIvsZ+E9FF5f9h4+gGnU0lTdwPIrC0Ztn+efhc6fG
 dmjxuTpFANa4Uk8RPlRFMjIiKW2OU0dgaOq11puzqizhtYLlSx9WU0/cQfKtOyf6z6uE
 wivQEsbPAk7gQPrG5TDuWUYpGmOXh5QRHhNQQ3CJBJLFZNrjdRv4cLEHz/DnJ5+TX46u
 yG0U1KaTfyHiSy86A6HZMLMRTfLUzLlGQ3AqbUU6nqicruaRHVOSBUkparprp20x+jMJ
 igLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772527380; x=1773132180;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bqEeaetpkKSpqDc/1afFvsBhHX5UV9awkVwQAYPdPEo=;
 b=MzJowKrhrbCyZ1jQyGOAD8Smry4RZmq7SwSjwRbGDER02wVyD/Wr3/xDCswdjnQBDU
 rzeQ4lyRZGwaM0ZQhdCCslQM8JT1sCGo4pDB1Mh9YOz8JJ0lb3inLXZgo34tLcREVl4t
 AAMkslkXTaVSMNO98mLYaGTsipKBY9bif2uhjRSUFI5sh/ZA+EATEI8Qc0hUSPBfSPJn
 gUHy1edU/7f0kDFWAkqJNExlhXxNyMKq4HinYAravLOTvxElGQfnF3XX2UGam4bQht5Z
 2WWsmmjdqXI9l/7tQH19hYg8r5H7YNSblKJjM6vAH2csQ0IhfKN8u6qmS3zRwo85sq7I
 D9RA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjKLEj2EeZOo8c9jXaBj/ETCysJVU+fKVumVBjd/TN/6uwtA+Qh9I+Hli/1gHA2kDskQkVk1NZlFY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPB1yHNNlxGy9cDo3rJT4RTEFfNDIzWOYD8oAN7fpku4rr5zKj
 YzZYitDQfJ3y9JQ5TEpeRlLGy2x5d26nsIjrNQgediax7WKzWU8T3u3I
X-Gm-Gg: ATEYQzwOy3nm8kmI5io1nkUW2ORm/Kqi/V6gt/pyJrLxsiNaKv3hYvwavxhHxPOjfYl
 qwFeoBTYkE/u1pmN8O25f+pkkL7wY7QzF/BSon4WeS629wnP6evgwhBCKW3+d7jfjt2CRs3U/ru
 HDgbKcYLW59JH3EmUUjkNmJayvtRqfGXscR+YqMtsrnAfGacq4vqrj8UNl0QZy9aGebG6l/nsz2
 zf6mn6jIn3ybOqgocRVj5Up43sD2cgtjgIzj7pHchheIbcAEsCL0ahPJq+nhSnCkHcmosU6NysZ
 Uf+a5vBL1WOW411CLla8OC5iorjagnHubvXSXKeyAC0DE8W5vczq9DNFy20olCHlP5L5NX+6Mv0
 9Jd1abCTL0GeDUdka1nThZsjxXBMPwNyqsf31ly2NMLEWedX3vBUi5QY7cNmFCa6dlUr/yPaDWN
 1TLGwua575qJu4
X-Received: by 2002:a2e:9e95:0:b0:387:cdb:9b9a with SMTP id
 38308e7fff4ca-389ff3580d6mr88804201fa.32.1772527379909; 
 Tue, 03 Mar 2026 00:42:59 -0800 (PST)
Received: from xeon ([188.163.112.72]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 00:42:59 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v7 07/15] staging: media: tegra-video: csi: move
 avdd-dsi-csi-supply from VI to CSI
Date: Tue,  3 Mar 2026 10:42:30 +0200
Message-ID: <20260303084239.15007-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303084239.15007-1-clamor95@gmail.com>
References: <20260303084239.15007-1-clamor95@gmail.com>
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
X-Rspamd-Queue-Id: C81C11EAEE7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@gmail.com,m:treding@nvidia.com,m:mperttunen@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:skomatineni@nvidia.com,m:luca.ceresoli@bootlin.com,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:hverkuil+cisco@kernel.org,m:clamor95@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:thierryreding@gmail.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,bootlin.com,kernel.org,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

The avdd-dsi-csi-supply is CSI power supply not VI, hence move it to
proper place.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # Tegra20 VIP
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/csi.c | 19 ++++++++++++++++++-
 drivers/staging/media/tegra-video/csi.h |  2 ++
 drivers/staging/media/tegra-video/vi.c  | 23 ++---------------------
 drivers/staging/media/tegra-video/vi.h  |  2 --
 4 files changed, 22 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 92078a1f9a4e..c4d3514f19b3 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -710,6 +710,8 @@ static int __maybe_unused csi_runtime_suspend(struct device *dev)
 
 	clk_bulk_disable_unprepare(csi->soc->num_clks, csi->clks);
 
+	regulator_disable(csi->vdd);
+
 	return 0;
 }
 
@@ -718,13 +720,23 @@ static int __maybe_unused csi_runtime_resume(struct device *dev)
 	struct tegra_csi *csi = dev_get_drvdata(dev);
 	int ret;
 
+	ret = regulator_enable(csi->vdd);
+	if (ret) {
+		dev_err(dev, "failed to enable VDD supply: %d\n", ret);
+		return ret;
+	}
+
 	ret = clk_bulk_prepare_enable(csi->soc->num_clks, csi->clks);
 	if (ret < 0) {
 		dev_err(csi->dev, "failed to enable clocks: %d\n", ret);
-		return ret;
+		goto disable_vdd;
 	}
 
 	return 0;
+
+disable_vdd:
+	regulator_disable(csi->vdd);
+	return ret;
 }
 
 static int tegra_csi_init(struct host1x_client *client)
@@ -802,6 +814,11 @@ static int tegra_csi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	csi->vdd = devm_regulator_get(&pdev->dev, "avdd-dsi-csi");
+	if (IS_ERR(csi->vdd))
+		return dev_err_probe(&pdev->dev, PTR_ERR(csi->vdd),
+				     "failed to get VDD supply");
+
 	if (!pdev->dev.pm_domain) {
 		ret = -ENOENT;
 		dev_warn(&pdev->dev, "PM domain is not attached: %d\n", ret);
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 2b4d586d3845..5344088aa022 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -141,6 +141,7 @@ extern const struct tegra_csi_soc tegra210_csi_soc;
  * @client: host1x_client struct
  * @iomem: register base
  * @clks: clock for CSI and CIL
+ * @vdd: vdd regulator for CSI hardware, usually avdd_dsi_csi
  * @soc: pointer to SoC data structure
  * @ops: csi operations
  * @csi_chans: list head for CSI channels
@@ -150,6 +151,7 @@ struct tegra_csi {
 	struct host1x_client client;
 	void __iomem *iomem;
 	struct clk_bulk_data *clks;
+	struct regulator *vdd;
 	const struct tegra_csi_soc *soc;
 	const struct tegra_csi_ops *ops;
 	struct list_head csi_chans;
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 7032c733577d..f14cdc7b5211 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1418,29 +1418,19 @@ static int __maybe_unused vi_runtime_resume(struct device *dev)
 	struct tegra_vi *vi = dev_get_drvdata(dev);
 	int ret;
 
-	ret = regulator_enable(vi->vdd);
-	if (ret) {
-		dev_err(dev, "failed to enable VDD supply: %d\n", ret);
-		return ret;
-	}
-
 	ret = clk_set_rate(vi->clk, vi->soc->vi_max_clk_hz);
 	if (ret) {
 		dev_err(dev, "failed to set vi clock rate: %d\n", ret);
-		goto disable_vdd;
+		return ret;
 	}
 
 	ret = clk_prepare_enable(vi->clk);
 	if (ret) {
 		dev_err(dev, "failed to enable vi clock: %d\n", ret);
-		goto disable_vdd;
+		return ret;
 	}
 
 	return 0;
-
-disable_vdd:
-	regulator_disable(vi->vdd);
-	return ret;
 }
 
 static int __maybe_unused vi_runtime_suspend(struct device *dev)
@@ -1449,8 +1439,6 @@ static int __maybe_unused vi_runtime_suspend(struct device *dev)
 
 	clk_disable_unprepare(vi->clk);
 
-	regulator_disable(vi->vdd);
-
 	return 0;
 }
 
@@ -1895,13 +1883,6 @@ static int tegra_vi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	vi->vdd = devm_regulator_get(&pdev->dev, "avdd-dsi-csi");
-	if (IS_ERR(vi->vdd)) {
-		ret = PTR_ERR(vi->vdd);
-		dev_err(&pdev->dev, "failed to get VDD supply: %d\n", ret);
-		return ret;
-	}
-
 	if (!pdev->dev.pm_domain) {
 		ret = -ENOENT;
 		dev_warn(&pdev->dev, "PM domain is not attached: %d\n", ret);
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index cac0c0d0e225..bfadde8858d4 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -94,7 +94,6 @@ struct tegra_vi_soc {
  * @client: host1x_client struct
  * @iomem: register base
  * @clk: main clock for VI block
- * @vdd: vdd regulator for VI hardware, normally it is avdd_dsi_csi
  * @soc: pointer to SoC data structure
  * @ops: vi operations
  * @vi_chans: list head for VI channels
@@ -104,7 +103,6 @@ struct tegra_vi {
 	struct host1x_client client;
 	void __iomem *iomem;
 	struct clk *clk;
-	struct regulator *vdd;
 	const struct tegra_vi_soc *soc;
 	const struct tegra_vi_ops *ops;
 	struct list_head vi_chans;
-- 
2.51.0

