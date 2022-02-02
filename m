Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD764A7496
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 16:28:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1452610E2E7;
	Wed,  2 Feb 2022 15:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B5AC10E2E7
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 15:28:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1F9AFB83122;
 Wed,  2 Feb 2022 15:28:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59F7EC340ED;
 Wed,  2 Feb 2022 15:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643815704;
 bh=MFLhHIccww+C6Miy6gL9xMLWRPu/Rj2WB7xgwMoy3NA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OSytJd9hz4koys0aqHE/uOUQkLUkRl5R4BTFuC0cVzqXOj6gMF5gGo2rw3HlTP/xp
 OTpN90DX9O+Mk3w2xj7yBlst4QRKBDEW2/PTzHG8BVl0QkX8TrXnxfRLPIdrrG37hh
 DDG+nLoW2ufoaye9btpBW72O3/q9kEvtntdyauwoMUcQngbcebEtSZ3Hb/1Y2JuclC
 CNxW1bMYnrd3WiABFfKdZIE+xEjkCLv8JNXG7tCCI6YSXl5ge7v2YIMDbRxTlHsR+X
 fUh5E4e3Y1MeC9kU3LTUEOnTYk94m9jAVJ1zNoxWH8ktTfeRXGIu7NKBs9Pj4Lgki6
 n5TsvrDe6F1yg==
From: Mark Brown <broonie@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 2/2] drm/st7735r: Add SPI ID table
Date: Wed,  2 Feb 2022 15:26:31 +0000
Message-Id: <20220202152631.20704-3-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202152631.20704-1-broonie@kernel.org>
References: <20220202152631.20704-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1023; h=from:subject;
 bh=MFLhHIccww+C6Miy6gL9xMLWRPu/Rj2WB7xgwMoy3NA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBh+qKmIYlhDkeY73lD33a4BU6BF0SpMDPljbFe2dJd
 uhgqfuaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYfqipgAKCRAk1otyXVSH0FgGB/
 9cfMMK3YVZ17WX9CGJKvJoQBIANDydQNkUiquukizwBpCQdW0/wMEPsfBdnf/yEsISVDTkTeUwTkET
 liwhSngoH7kE7rUxVuw+jlzF/y63Nx6LAIvGpJ2OXxGko/Uo5K9gYM6Q7+x5K5Rkasixxta1U79HD7
 UqRZcts+dvIBrBQCHppPrOC+ilnUQl6ZyTfLdsL3qWcV2XW0qvzWSJa7zNW0FdIqR4SPNXokppUpzW
 JWrv1m5VvYLuXKdb5ZyYdlGaZmMRfokqJdc+BWtY/rGfd0N3uJjhhT0mJ3NXRSpG2ic3BweP7QW/Ca
 nUxONvytzRydIyX9dGzFxA62wO0vyt
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
Cc: Mark Brown <broonie@kernel.org>, David Lechner <david@lechnology.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently autoloading for SPI devices does not use the DT ID table, it uses
SPI modalises. Supporting OF modalises is going to be difficult if not
impractical, an attempt was made but has been reverted, so ensure that
module autoloading works for this driver by ensuring that there are SPI IDs
for all OF IDs.

Fixes: 96c8395e2166 ("spi: Revert modalias changes")
Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: David Lechner <david@lechnology.com>
---
 drivers/gpu/drm/tiny/st7735r.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/tiny/st7735r.c
index fc40dd10efa8..713e4b286210 100644
--- a/drivers/gpu/drm/tiny/st7735r.c
+++ b/drivers/gpu/drm/tiny/st7735r.c
@@ -174,6 +174,7 @@ MODULE_DEVICE_TABLE(of, st7735r_of_match);
 
 static const struct spi_device_id st7735r_id[] = {
 	{ "jd-t18003-t01", (uintptr_t)&jd_t18003_t01_cfg },
+	{ "rh128128t", (uintptr_t)&rh128128t_cfg },
 	{ },
 };
 MODULE_DEVICE_TABLE(spi, st7735r_id);
-- 
2.30.2

