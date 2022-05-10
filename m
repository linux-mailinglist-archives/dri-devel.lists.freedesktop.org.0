Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3326A520E16
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 08:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1771210EF4A;
	Tue, 10 May 2022 06:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB4B10E468
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 03:02:40 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id j6so13809370pfe.13
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 20:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ordBIaEUDLbti7M0xUa/AbdDrMXvFisQMIa5b0nyI3I=;
 b=DuWbjHWH3zDh8VikdxPnwiPGg6TwxdZyLCFrVU3bCWShI/vVWoH3t/IKHDdGl3QsDi
 +WTAP/Q7WX3/v0sne4CbgMbz1TZiaKRfDFVKVOFyJ5pELCuNkEHE03Yhjjt5NfDbI/J2
 5maIHgMsZKu4TaiI4mJnT2hIiPC3t9w/tW/fuM/4ctbNJt6/gYSm7xci0rBXsK6fhvRs
 GbBgmTKrKr5+h52ibuSVdHoORJ+hKEddLKWDmfUc4CKxdi1gDDHxxkIHyN4dV4QzCPg0
 AxVdXJGlPabyvMji2fSL1LuIq17dYgrmcvKA5v0b3kTlXQonJbdJJoD/8CgBkxLMaIQG
 TWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ordBIaEUDLbti7M0xUa/AbdDrMXvFisQMIa5b0nyI3I=;
 b=coP0tDEnKwVu1DnHvKM05DE89WnVaDU+0pkWuqYl7tM6a28Lre8Fzc+Bpx+4+SPWzm
 jyvw2w20w5BWnlNnxKNiIMNwnik5+qJZYXHv49LiycjvXz7sUFXYMOauUOlCigRDwJHd
 WqvXvrGoOFCUNvp/2E4xBF4l1dJswUpceZECyKlhdAo+5V6OiH0Kpw8W4cz6g3Gh55ZP
 mH4eNV/SRYxZfJnlfGGq9Mz9nr1wrzJLar+jYtmuu2UQE0x3i8eZalKbjSMniDjY+fFt
 j0UdXgwSl4cbYSalAojpbgx+OsaYW7qvwpgsYCtLB8p/iOxVctnD2JIAVA5aTwcTcoqA
 UZ/g==
X-Gm-Message-State: AOAM5305YWlgzgCyw7Eg0lrVg+ndKQd4BrbPbvaHS4IqsHdSwSI/kt47
 Wu/R6NDpk9OpHBbEm4iDzcw=
X-Google-Smtp-Source: ABdhPJxv5QBHUc16y6nkqTIz5HpFvRimP/3zk5T67xIEr3orr6iUbtHCEzOLwvvTxydhqRXilQxejw==
X-Received: by 2002:a63:1a5c:0:b0:3c1:9a7c:3739 with SMTP id
 a28-20020a631a5c000000b003c19a7c3739mr15432124pgm.272.1652151759652; 
 Mon, 09 May 2022 20:02:39 -0700 (PDT)
Received: from lxb-server.lan ([2403:18c0:2:4f4:216:3cff:feba:eec])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a170903120600b0015e8d4eb291sm617622plh.219.2022.05.09.20.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 20:02:39 -0700 (PDT)
From: Yunhao Tian <t123yh.xyz@gmail.com>
To: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH v2] drm/mipi-dbi: align max_chunk to 2 in spi_transfer
Date: Tue, 10 May 2022 11:02:19 +0800
Message-Id: <20220510030219.2486687-1-t123yh.xyz@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 10 May 2022 06:48:43 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yunhao Tian <t123yh.xyz@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Lechner <david@lechnology.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In __spi_validate, there's a validation that no partial transfers
are accepted (xfer->len % w_size must be zero). When
max_chunk is not a multiple of bpw (e.g. max_chunk = 65535,
bpw = 16), the transfer will be rejected.

This patch aligns max_chunk to 2 bytes (the maximum value of bpw is 16),
so that no partial transfer will occur.

Fixes: d23d4d4dac01 ("drm/tinydrm: Move tinydrm_spi_transfer()")

Signed-off-by: Yunhao Tian <t123yh.xyz@gmail.com>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 71b646c4131f..00d470ff071d 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -1183,6 +1183,13 @@ int mipi_dbi_spi_transfer(struct spi_device *spi, u32 speed_hz,
 	size_t chunk;
 	int ret;
 
+	/* In __spi_validate, there's a validation that no partial transfers
+	 * are accepted (xfer->len % w_size must be zero).
+	 * Here we align max_chunk to multiple of 2 (16bits),
+	 * to prevent transfers from being rejected.
+	 */
+	max_chunk = ALIGN_DOWN(max_chunk, 2);
+
 	spi_message_init_with_transfers(&m, &tr, 1);
 
 	while (len) {
-- 
2.25.1

