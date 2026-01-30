Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLDJL/6ofGnuOAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 13:50:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7050BBAA88
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 13:50:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94DD10E9C2;
	Fri, 30 Jan 2026 12:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OXo+tTEp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9B410E368
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 12:50:00 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-47ee3a63300so21659515e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 04:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769777399; x=1770382199; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ZTvAgzsdLyPVb7r9icvoh5jhK/kCdwgL9RfYNjUTH0=;
 b=OXo+tTEpLc2L91w4kWdszy4FZ9Z7vxTb9VdwzmWxweGPIcR93nYs/toXWDJ5G7flSg
 aLW+AIit7n1fiUq8RA3xsPcWMastM2/kjEmICcYNTrPBgkhiFVyH5VZmBWe+58a+2orI
 Naq7+KLhdsNO92B+IU1okyT+mgF9wcuuL0ezJHJA09Pe72RJkNIkycOkmQBGiz0pxYHB
 gKF2DQUezfcBQXhXflAcxXY1brnY8ic4D4GDZDmxYBlE8aArOvaFnx0y9wwIiMMJpK3I
 dKapsRkeDu9wNsSIxpD9zSDvl+hhCFi7KwxZbeZwp0wDtBXcsV0o3qZ8zcTeQE11fu2C
 fySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769777399; x=1770382199;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5ZTvAgzsdLyPVb7r9icvoh5jhK/kCdwgL9RfYNjUTH0=;
 b=gxnf976ndPS44nsU1yT39aqUNuBBcQ8OWUkiQ128/9z9LVEm9BSAWY2D5MIzIKBU7v
 Tvkr1T7a4/C7F/Coe0etWx0fgGcRENQS0UQcaAN8Edl+MFrj7RsegVQQYJLzy8WLeDtY
 9L8e7XI4sjI2HtztXfj7Gv6XrtNqVcrn/honNj3fFjm8HojYx64Gd/zhehCSh9CZ8Qfl
 567B0Y5KAgoCshZ0FCTwJEaB22V3cUAxCYL1hCNukZSJXuE4tv0dk8RlXvypdWkrebys
 Rd6tcNOnFuKZgUJLxFwBGjha7x9gJbih+qlLz5b4Rxq+8TgKNJNGBadiURKh0At2OS2G
 WWFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbZBKwDdoTawFM5yQORLAriJhHCTYG0ofBPHa8w/z/iSh9l6O0pE+CzrgulnXkBrhnZnQHkR6EwLE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yye8Ja0mZwCevTkQzZkejz7hJBAbhdHrppaoHWm3WdHQBEl+qff
 BskOH7UmC7P6X2Os0lmKii6X9UUFroDSiOTuEYY3cItbKO7TUk2zMrSg
X-Gm-Gg: AZuq6aIUW6JqfrmO7mqtpL69k5hd3tE7/ajwpiQFuVA4kFavs7F/ByhlN2ye0FrgDD/
 4xUaR5V1fNtIkI1eLxkn37JnwXXccFfBO3nnmEfaV7nvMHBwr87brBYOxsxWiqPm/7o40XvkpZ2
 DLvAdCo+QcuAsVE7wSja1z6/n5076t/cfNbUOE5TRDkCkoqM1HV6Jh92lthCkI28LfuQN8Ft1nA
 IxQVUKVUflUMrjj7xsSvcf1uzvpuJZv5tIbf6HZ73S9MRadPoKrIhaeX2Mg+iv/ccgAPZDE2jjO
 ZEtyKepDqAoiS4wNEYshaVxYXPP9oYq/zHrsiTFq5ITGQpBdSKghHYsz8oqg5CL7ax4atodBzlM
 XIxWwfqHPp9Nb9zFdj9pRn+Hi+cgDUGNwlIDxTPhO8ZDedO3/Yfb1B8Kx+sHuyt0W6I3mH7pDtx
 /7
X-Received: by 2002:a05:600c:a08c:b0:477:6374:6347 with SMTP id
 5b1f17b1804b1-482db491ef7mr36328755e9.22.1769777398808; 
 Fri, 30 Jan 2026 04:49:58 -0800 (PST)
Received: from xeon ([188.163.112.49]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jan 2026 04:49:58 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
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
Subject: [PATCH v6 04/15] staging: media: tegra-video: csi: move CSI helpers
 to header
Date: Fri, 30 Jan 2026 14:49:21 +0200
Message-ID: <20260130124932.351328-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130124932.351328-1-clamor95@gmail.com>
References: <20260130124932.351328-1-clamor95@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@gmail.com,m:mperttunen@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:skomatineni@nvidia.com,m:luca.ceresoli@bootlin.com,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:hverkuil+cisco@kernel.org,m:clamor95@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:thierryreding@gmail.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,bootlin.com,kernel.org,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	ARC_NA(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: 7050BBAA88
X-Rspamd-Action: no action

Move CSI helpers into the header for easier access from SoC-specific video
driver parts.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 11 -----------
 drivers/staging/media/tegra-video/csi.h | 10 ++++++++++
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 3c3f6e3fd1ec..894583d48b35 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -20,17 +20,6 @@
 
 #define MHZ			1000000
 
-static inline struct tegra_csi *
-host1x_client_to_csi(struct host1x_client *client)
-{
-	return container_of(client, struct tegra_csi, client);
-}
-
-static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
-{
-	return container_of(subdev, struct tegra_csi_channel, subdev);
-}
-
 /*
  * CSI is a separate subdevice which has 6 source pads to generate
  * test pattern. CSI subdevice pad ops are used only for TPG and
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 609c5952e050..2b4d586d3845 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -155,6 +155,16 @@ struct tegra_csi {
 	struct list_head csi_chans;
 };
 
+static inline struct tegra_csi *host1x_client_to_csi(struct host1x_client *client)
+{
+	return container_of(client, struct tegra_csi, client);
+}
+
+static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
+{
+	return container_of(subdev, struct tegra_csi_channel, subdev);
+}
+
 void tegra_csi_error_recover(struct v4l2_subdev *subdev);
 void tegra_csi_calc_settle_time(struct tegra_csi_channel *csi_chan,
 				u8 csi_port_num,
-- 
2.51.0

