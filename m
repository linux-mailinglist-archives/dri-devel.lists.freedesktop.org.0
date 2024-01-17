Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B508303D7
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 11:45:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD6D10E633;
	Wed, 17 Jan 2024 10:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630C210E633
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 10:45:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 31C5BCE1B87;
 Wed, 17 Jan 2024 10:45:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40503C433F1;
 Wed, 17 Jan 2024 10:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705488309;
 bh=7ndPbhI5d5AQDciViVHBmYZpN1QDnXUWhOlTjOcJJYc=;
 h=From:To:Cc:Subject:Date:From;
 b=bTX0pgfAY8Jr5Jpn94oiN/PqUK5smgKzYjG9YMKNQJLKslfomfST2Gowbip+ZSMIM
 22S35rDUc1owxrKWWIOc50P/qdKGJ5WVcnUBOY0r7/I9FgqITVcw9oaxiVizW9PjZu
 7ZLdo4EjS8Lk8RochcdPj3vtOgo7bN066Xk9z937QeMXY0/Iv8KwLpN3v5E+U+iVUi
 HkqnvwRBLWm8dSQrFdoT61kQdXalthjLk/fivH603sm1sDscUqavp1GQW1Tg4qFJG+
 kVLWFnU1q3SdaRTnBIquNaANcPkv6czz+ayUXLOhuzL0yddmG1E8MpM02qFs31yWIH
 LyxBzDmIONwVw==
From: Arnd Bergmann <arnd@kernel.org>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: [PATCH] drm: apple: mark local functions static
Date: Wed, 17 Jan 2024 11:44:10 +0100
Message-Id: <20240117104448.6852-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: Arnd Bergmann <arnd@arndb.de>, Sven Peter <sven@svenpeter.dev>,
 Asahi Lina <lina@asahilina.net>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 asahi@lists.linux.dev, Janne Grunau <j@jannau.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

With linux-6.8, the kernel warns about functions that have no
extern declaration, so mark both of these static.

Fixes: 2d782b0d007d ("gpu: drm: apple: Add sound mode parsing")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
This is for the bits/200-dcp branch in https://github.com/AsahiLinux/linux,
the code is not yet upstream.
---
 drivers/gpu/drm/apple/parser.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/apple/parser.c b/drivers/gpu/drm/apple/parser.c
index 44aad9a64f9a..ea9f40bb7de2 100644
--- a/drivers/gpu/drm/apple/parser.c
+++ b/drivers/gpu/drm/apple/parser.c
@@ -694,7 +694,7 @@ int parse_epic_service_init(struct dcp_parse_ctx *handle, const char **name,
 	return ret;
 }
 
-int parse_sample_rate_bit(struct dcp_parse_ctx *handle, unsigned int *ratebit)
+static int parse_sample_rate_bit(struct dcp_parse_ctx *handle, unsigned int *ratebit)
 {
 	s64 rate;
 	int ret = parse_int(handle, &rate);
@@ -715,7 +715,7 @@ int parse_sample_rate_bit(struct dcp_parse_ctx *handle, unsigned int *ratebit)
 	return 0;
 }
 
-int parse_sample_fmtbit(struct dcp_parse_ctx *handle, u64 *fmtbit)
+static int parse_sample_fmtbit(struct dcp_parse_ctx *handle, u64 *fmtbit)
 {
 	s64 sample_size;
 	int ret = parse_int(handle, &sample_size);
-- 
2.39.2

