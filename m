Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D2D418BDA
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 00:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE166E5B4;
	Sun, 26 Sep 2021 22:42:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C126E5B4
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 22:42:39 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id y26so29087444lfa.11
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 15:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yDP03amDwCEY6IiivIbDG+60+C+xV/Pv6sR1LEywSYo=;
 b=ByNHptD14yPmBI5qwC9iLjNDIrS32hyv0eOv0r4DI67a82TRGkwAolm0a3jemhZJ1Y
 ndRBWXsWDlo2ZqXlOsa9s4WcpVXNs7zNzqFB0o2HJEQ2BUJAZuJN/NqsJn/Y9PaDty4P
 Qh9O3DDW2qCbpxE3fsT1jOVkZ9Q/zP1jt30/CYULft9d3sAFb24IH8CJnqtxgzmOD8Ap
 CjmvDPKdhiXMLtTMKHQTzOKc7JHVvXxW7MzBKpVRBTdP2+Bc2ohgArtTwM345FHktbyH
 sJTjvbUXKxsEw4SdFS506k3hjs364Wxxly6t038kdqy0ZrJazBY0OTp2jzkynLCES97Q
 9CRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yDP03amDwCEY6IiivIbDG+60+C+xV/Pv6sR1LEywSYo=;
 b=WFeSkNmrCQbr9EmYxNPGbi4+r4qSZUzMaU/sF6w2VU37oe/UbTxkLxohKPG6yYXvxf
 Lxn1wccQRyhSUWuWHE8GJiZ6FTU6VP2PTrsosCm/T/rIq+9IKqUBL5L7iw+5zBs8M7TZ
 rju8QIc4Fdf6utvAStLWYlwCu18wlgeQwX9jg2aQDz3BPLrJoTB5QJKEb8muVfm1spvU
 NiXxgGhP7qHnYRNMbBYedvYNSAvqYrNkWdVh7ZVHBVxVYJfqwWg6kH1A1lp7YwwPeVGU
 /7Q/LXM8FrJVt08/QHe3YseDc/DbD5U3zsmcdSCRc8bAfAnHC6oDDvzxll/9Cdcp2FiY
 Tmbw==
X-Gm-Message-State: AOAM530CFuaFH+VK33wGvDQJyABFZqP2e4oOrtbhOY/Fjg1jESIAUco6
 nO2peLmfcDEBX8RWUtZrCZ8=
X-Google-Smtp-Source: ABdhPJw6v9K05vkQynZjDEwTD9e/1b4p9LcUZ8h1o8z6+yyoFWDLAIfYhhkOBzZBHV0QVhZxMh7xjw==
X-Received: by 2002:a2e:a7c5:: with SMTP id x5mr1671863ljp.89.1632696157847;
 Sun, 26 Sep 2021 15:42:37 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru.
 [46.138.80.108])
 by smtp.gmail.com with ESMTPSA id m10sm1408899lfr.272.2021.09.26.15.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:42:37 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 David Heidelberg <david@ixit.cz>
Subject: [PATCH v13 10/35] gpu: host1x: Add host1x_channel_stop()
Date: Mon, 27 Sep 2021 01:40:33 +0300
Message-Id: <20210926224058.1252-11-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210926224058.1252-1-digetx@gmail.com>
References: <20210926224058.1252-1-digetx@gmail.com>
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

Add host1x_channel_stop() which waits till channel becomes idle and then
stops the channel hardware. This is needed for supporting suspend/resume
by host1x drivers since the hardware state is lost after power-gating,
thus the channel needs to be stopped before client enters into suspend.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/host1x/channel.c | 8 ++++++++
 include/linux/host1x.h       | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/host1x/channel.c b/drivers/gpu/host1x/channel.c
index 4cd212bb570d..2a9a3a8d5931 100644
--- a/drivers/gpu/host1x/channel.c
+++ b/drivers/gpu/host1x/channel.c
@@ -75,6 +75,14 @@ struct host1x_channel *host1x_channel_get_index(struct host1x *host,
 	return ch;
 }
 
+void host1x_channel_stop(struct host1x_channel *channel)
+{
+	struct host1x *host = dev_get_drvdata(channel->dev->parent);
+
+	host1x_hw_cdma_stop(host, &channel->cdma);
+}
+EXPORT_SYMBOL(host1x_channel_stop);
+
 static void release_channel(struct kref *kref)
 {
 	struct host1x_channel *channel =
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 7bccf589aba7..66473b5be0af 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -181,6 +181,7 @@ struct host1x_job;
 
 struct host1x_channel *host1x_channel_request(struct host1x_client *client);
 struct host1x_channel *host1x_channel_get(struct host1x_channel *channel);
+void host1x_channel_stop(struct host1x_channel *channel);
 void host1x_channel_put(struct host1x_channel *channel);
 int host1x_job_submit(struct host1x_job *job);
 
-- 
2.32.0

