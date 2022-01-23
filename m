Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E3B497CEB
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 11:24:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3209610E872;
	Mon, 24 Jan 2022 10:24:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E37510E505
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 22:34:20 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 o30-20020a05600c511e00b0034f4c3186f4so1884667wms.3
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 14:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bCNGUDQSGH9xNCol2x80NKTo+CZUhhFOnPlnY5tZ8U4=;
 b=O09zGu4YJvsZVDLdpbYBixQ9Q01D+m8PO80S2oO7EimAj6T8/ojDty/tqx7VEUDCQ4
 jlvqs9r4XBLOcVpl3E5m9krBnI9BuNHo3bAImqInXEBy5U/OGmVeUI2mToceOsuDXVm0
 oqSyIZEvnAWKCznuOu0lZb010kmzxZvaFwJp2hoNgAf/Z9U1uEnxqeSeRy85U6c+qn43
 D7xa2Wgu+oZ15PYhD+qZc+TM2NILKNEUod7Al4ZRX+JRLv3rvFtSm2XaxfOfh//vLotG
 MrMQXAu+21B8dbu79Tf2kaAIBEH4p+/k+E5si5Ql9yBPa+mPakV16OyJtObAVqfZJjYE
 m+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bCNGUDQSGH9xNCol2x80NKTo+CZUhhFOnPlnY5tZ8U4=;
 b=lVLESAfdzUjLH+uoOyWV8BWgRdUw/h6MYdaF06ySh+lwf79cyaUrhJlTjpKFBDn+iN
 Fp5oVv27IK/bsXuGbXucwYTPJhgnAZEkpT1hNrwcDKGJPOAavYEj42qccdHnjuRbKdJ3
 SsHdUejrzpQ+84JQyJ65v+fIIBFuEL83kHh8rsL8mMD0XUFJgUBb67+VqxbPZydmOq4q
 HfIQUYDKNQTxL0KKaN7LsmYMygMoskT7wbSuFaFRTeRze2ieAPuJP0HK7xOlF0TDlONV
 ++e7csprEmrcv/l2v4ZmMNYDdJVsyXTO25kokRC8jFB4NnYku0mxMwg2FMfTY7cm6jYW
 T1+w==
X-Gm-Message-State: AOAM531A3uYh5nxlhp9yBVZdkgMAHt7IV/vVMGWOpJ3y9vwN7q8WFdgV
 XcBJfd7yh1f7gswP1w/pJE4=
X-Google-Smtp-Source: ABdhPJyRaNf2iwoq+Ye3fLdAxsVjpnS+gubpY+VSE0HaMIOQ2x9sh04f0onyuvQdU6o5q5XMUQiquA==
X-Received: by 2002:a1c:256:: with SMTP id 83mr9487342wmc.166.1642977258810;
 Sun, 23 Jan 2022 14:34:18 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
 by smtp.gmail.com with ESMTPSA id o5sm17681375wmq.21.2022.01.23.14.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 14:34:18 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/imx: make static read-only array channel_offsets const
Date: Sun, 23 Jan 2022 22:34:17 +0000
Message-Id: <20220123223417.6244-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 24 Jan 2022 10:24:17 +0000
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The static array channel_offsets is read-only so it make sense to make
it const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/ipu-v3/ipu-dc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-dc.c b/drivers/gpu/ipu-v3/ipu-dc.c
index ca96b235491a..b038a6d7307b 100644
--- a/drivers/gpu/ipu-v3/ipu-dc.c
+++ b/drivers/gpu/ipu-v3/ipu-dc.c
@@ -344,8 +344,9 @@ int ipu_dc_init(struct ipu_soc *ipu, struct device *dev,
 		unsigned long base, unsigned long template_base)
 {
 	struct ipu_dc_priv *priv;
-	static int channel_offsets[] = { 0, 0x1c, 0x38, 0x54, 0x58, 0x5c,
-		0x78, 0, 0x94, 0xb4};
+	static const int channel_offsets[] = {
+		0, 0x1c, 0x38, 0x54, 0x58, 0x5c, 0x78, 0, 0x94, 0xb4
+	};
 	int i;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-- 
2.33.1

