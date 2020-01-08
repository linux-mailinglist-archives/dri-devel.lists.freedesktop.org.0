Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62884133AD6
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 06:24:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0226E177;
	Wed,  8 Jan 2020 05:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC026E853
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 05:24:13 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id t101so559920pjb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 21:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UOwyKJvK30gkDautsCvwyHXlhtr89ohJP+HqIMRnEEY=;
 b=QLx9yX4oKgUhsf9zqBiMKi9PC3cJUGptpG/rsIeA0xAbFDz3AFhMYQndfD4e5TiiA5
 wduA+xP76VAH3pTE/Y7N2zNP97+RQWMddxzeUn/Nf0v4LIAyD01x4QhbaispCA389giy
 7q8R+qc9ynzewq3J8aV43Z09BdUAkc5nDf8Fg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UOwyKJvK30gkDautsCvwyHXlhtr89ohJP+HqIMRnEEY=;
 b=MJlyW/9N/Wgq6iQEAXMvpx054a6N/qyGAXf0WN8z/V8ARF2Pd759jwNQVzGdd+ukHZ
 9Hqw7Cvs87ZNqNPzwbwFIGiZ+DpS9C/+XAyAfYTTOoDjI+JSUVm1eg02Pu+ZrWgtTvo7
 jJa/yseE1qBsFsCDUhI6j6GGl/+drhVNmrxg+jwDIeFELg5r27Uid1rbsWZAJdwr+hH2
 EcD1rtOgT/mPHWbZI+8hSFgjz7AGjs5iwAavvGbP6L8sDQ4Dh2rtHT7rowF1C123Z1z5
 lBvpYMTDFtHJkmO4H1lMekcXqhKduxoziqgblj+H2SN0EblVUFBDzTAujC909eLuNwB4
 bt5Q==
X-Gm-Message-State: APjAAAVSNA3TR18Umk3oFBtXCdEYqCUZu7aWiV0fWcCiAdGeWRTwl26l
 h4dQB4JRGB7mlV7ClUmTFhO2Aw==
X-Google-Smtp-Source: APXvYqyP94Ucu5iILCPq19i7mowizjkSB4O/xb8qsx3dYRf/q3ysQY9apimu4OZEq+YRXwTIHiTnjQ==
X-Received: by 2002:a17:902:265:: with SMTP id
 92mr3326908plc.188.1578461052777; 
 Tue, 07 Jan 2020 21:24:12 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id n24sm387505pff.12.2020.01.07.21.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 21:24:12 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 6/7, RFC] drm/panfrost: Add bifrost compatible string
Date: Wed,  8 Jan 2020 13:23:36 +0800
Message-Id: <20200108052337.65916-7-drinkcat@chromium.org>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20200108052337.65916-1-drinkcat@chromium.org>
References: <20200108052337.65916-1-drinkcat@chromium.org>
MIME-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For testing only, the driver doesn't really work yet, AFAICT.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 48e3c4165247cea..f3a4d77266ba961 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -591,6 +591,7 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "arm,mali-t830" },
 	{ .compatible = "arm,mali-t860" },
 	{ .compatible = "arm,mali-t880" },
+	{ .compatible = "arm,mali-bifrost" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
