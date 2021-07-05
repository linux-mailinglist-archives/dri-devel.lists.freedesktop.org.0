Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E65563BBD0B
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 14:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4405F89CA1;
	Mon,  5 Jul 2021 12:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B640689C19
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 12:45:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 65C2A22656;
 Mon,  5 Jul 2021 12:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625489119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eqrsw/YQQF05SJ4Vu9j4dLFqHw02VW3UZd5Pc56hDjk=;
 b=rpFvxpOGlTrAnbXXwgu7AUC/JDhxn7RbSiWFtVePN87v6RxQsDAc0iNeJjzSuIOC9k6xTU
 FcuxTxmPykoanNq1bVEHwVvr0RLe5CUmnxkZ330l5SDTgWic29eUaDYZH44lKQ5Gka6g++
 /Je1+eQ5vclxUtrRPJnt4fdcgSox+PI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625489119;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eqrsw/YQQF05SJ4Vu9j4dLFqHw02VW3UZd5Pc56hDjk=;
 b=PQE9C6hZ/4f6uejF8smI/k+Vb1w9xy0Po726o8Vc8WFDXzP8qcxS8hcJQDKS/5SQf8D0qZ
 DTA0VNJxZ/zrMmCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 21E16139F6;
 Mon,  5 Jul 2021 12:45:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CCYHB9/+4mDkcAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Jul 2021 12:45:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@redhat.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 emil.velikov@collabora.com, John.p.donnelly@oracle.com
Subject: [PATCH 10/12] drm/mgag200: Declare PLL clock constants static const
Date: Mon,  5 Jul 2021 14:45:13 +0200
Message-Id: <20210705124515.27253-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210705124515.27253-1-tzimmermann@suse.de>
References: <20210705124515.27253-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the PLL constants to the RO data section by declaring them as
static const. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 70 ++++++++++++--------------
 1 file changed, 31 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 99b35e4f9353..5da72ebd8a7f 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -187,7 +187,10 @@ static int mgag200_compute_pixpll_values_g200(struct mga_device *mdev, long cloc
 static int mgag200_compute_pixpll_values_g200se_00(struct mga_device *mdev, long clock,
 						   struct mgag200_pll_values *pixpllc)
 {
-	unsigned int vcomax, vcomin, pllreffreq;
+	static const unsigned int vcomax = 320000;
+	static const unsigned int vcomin = 160000;
+	static const unsigned int pllreffreq = 25000;
+
 	unsigned int delta, tmpdelta, permitteddelta;
 	unsigned int testp, testm, testn;
 	unsigned int p, m, n, s;
@@ -196,9 +199,6 @@ static int mgag200_compute_pixpll_values_g200se_00(struct mga_device *mdev, long
 	m = n = p = s = 0;
 	delta = 0xffffffff;
 
-	vcomax = 320000;
-	vcomin = 160000;
-	pllreffreq = 25000;
 	permitteddelta = clock * 5 / 1000;
 
 	for (testp = 8; testp > 0; testp /= 2) {
@@ -241,8 +241,10 @@ static int mgag200_compute_pixpll_values_g200se_04(struct mga_device *mdev, long
 						   struct mgag200_pll_values *pixpllc)
 {
 	static const unsigned int pvalues_e4[] = {16, 14, 12, 10, 8, 6, 4, 2, 1};
+	static const unsigned int vcomax = 1600000;
+	static const unsigned int vcomin = 800000;
+	static const unsigned int pllreffreq = 25000;
 
-	unsigned int vcomax, vcomin, pllreffreq;
 	unsigned int delta, tmpdelta, permitteddelta;
 	unsigned int testp, testm, testn;
 	unsigned int p, m, n, s;
@@ -253,10 +255,6 @@ static int mgag200_compute_pixpll_values_g200se_04(struct mga_device *mdev, long
 	m = n = p = s = 0;
 	delta = 0xffffffff;
 
-	vcomax        = 1600000;
-	vcomin        = 800000;
-	pllreffreq    = 25000;
-
 	if (clock < 25000)
 		clock = 25000;
 	clock = clock * 2;
@@ -323,7 +321,10 @@ static int mgag200_compute_pixpll_values_g200se(struct mga_device *mdev, long cl
 static int mgag200_compute_pixpll_values_g200wb(struct mga_device *mdev, long clock,
 						struct mgag200_pll_values *pixpllc)
 {
-	unsigned int vcomax, vcomin, pllreffreq;
+	static const unsigned int vcomax = 550000;
+	static const unsigned int vcomin = 150000;
+	static const unsigned int pllreffreq = 48000;
+
 	unsigned int delta, tmpdelta;
 	unsigned int testp, testm, testn;
 	unsigned int p, m, n, s;
@@ -332,10 +333,6 @@ static int mgag200_compute_pixpll_values_g200wb(struct mga_device *mdev, long cl
 	m = n = p = s = 0;
 	delta = 0xffffffff;
 
-	vcomax = 550000;
-	vcomin = 150000;
-	pllreffreq = 48000;
-
 	for (testp = 1; testp < 9; testp++) {
 		if (clock * testp > vcomax)
 			continue;
@@ -371,7 +368,10 @@ static int mgag200_compute_pixpll_values_g200wb(struct mga_device *mdev, long cl
 static int mgag200_compute_pixpll_values_g200ev(struct mga_device *mdev, long clock,
 						struct mgag200_pll_values *pixpllc)
 {
-	unsigned int vcomax, vcomin, pllreffreq;
+	static const unsigned int vcomax = 550000;
+	static const unsigned int vcomin = 150000;
+	static const unsigned int pllreffreq = 50000;
+
 	unsigned int delta, tmpdelta;
 	unsigned int testp, testm, testn;
 	unsigned int p, m, n, s;
@@ -380,10 +380,6 @@ static int mgag200_compute_pixpll_values_g200ev(struct mga_device *mdev, long cl
 	m = n = p = s = 0;
 	delta = 0xffffffff;
 
-	vcomax = 550000;
-	vcomin = 150000;
-	pllreffreq = 50000;
-
 	for (testp = 16; testp > 0; testp--) {
 		if (clock * testp > vcomax)
 			continue;
@@ -419,7 +415,10 @@ static int mgag200_compute_pixpll_values_g200ev(struct mga_device *mdev, long cl
 static int mgag200_compute_pixpll_values_g200eh(struct mga_device *mdev, long clock,
 						struct mgag200_pll_values *pixpllc)
 {
-	unsigned int vcomax, vcomin, pllreffreq;
+	static const unsigned int vcomax = 800000;
+	static const unsigned int vcomin = 400000;
+	static const unsigned int pllreffreq = 33333;
+
 	unsigned int delta, tmpdelta;
 	unsigned int testp, testm, testn;
 	unsigned int p, m, n, s;
@@ -428,10 +427,6 @@ static int mgag200_compute_pixpll_values_g200eh(struct mga_device *mdev, long cl
 	m = n = p = s = 0;
 	delta = 0xffffffff;
 
-	vcomax = 800000;
-	vcomin = 400000;
-	pllreffreq = 33333;
-
 	for (testp = 16; testp > 0; testp >>= 1) {
 		if (clock * testp > vcomax)
 			continue;
@@ -466,7 +461,10 @@ static int mgag200_compute_pixpll_values_g200eh(struct mga_device *mdev, long cl
 static int mgag200_compute_pixpll_values_g200eh3(struct mga_device *mdev, long clock,
 						 struct mgag200_pll_values *pixpllc)
 {
-	unsigned int vcomax, vcomin, pllreffreq;
+	static const unsigned int vcomax = 3000000;
+	static const unsigned int vcomin = 1500000;
+	static const unsigned int pllreffreq = 25000;
+
 	unsigned int delta, tmpdelta;
 	unsigned int testp, testm, testn;
 	unsigned int p, m, n, s;
@@ -476,10 +474,6 @@ static int mgag200_compute_pixpll_values_g200eh3(struct mga_device *mdev, long c
 	delta = 0xffffffff;
 	testp = 0;
 
-	vcomax = 3000000;
-	vcomin = 1500000;
-	pllreffreq = 25000;
-
 	for (testm = 150; testm >= 6; testm--) {
 		if (clock * testm > vcomax)
 			continue;
@@ -516,16 +510,15 @@ static int mgag200_compute_pixpll_values_g200er(struct mga_device *mdev, long cl
 						struct mgag200_pll_values *pixpllc)
 {
 	static const unsigned int m_div_val[] = { 1, 2, 4, 8 };
-	unsigned int vcomax, vcomin, pllreffreq;
+	static const unsigned int vcomax = 1488000;
+	static const unsigned int vcomin = 1056000;
+	static const unsigned int pllreffreq = 48000;
+
 	unsigned int delta, tmpdelta;
 	int testr, testn, testm, testo;
 	unsigned int p, m, n, s;
 	unsigned int computed, vco;
 
-	vcomax = 1488000;
-	vcomin = 1056000;
-	pllreffreq = 48000;
-
 	m = n = p = s = 0;
 	delta = 0xffffffff;
 
@@ -573,7 +566,10 @@ static int mgag200_compute_pixpll_values_g200er(struct mga_device *mdev, long cl
 static int mgag200_compute_pixpll_values_g200ew3(struct mga_device *mdev, long clock,
 						 struct mgag200_pll_values *pixpllc)
 {
-	unsigned int vcomax, vcomin, pllreffreq;
+	static const unsigned int vcomax = 800000;
+	static const unsigned int vcomin = 400000;
+	static const unsigned int pllreffreq = 25000;
+
 	unsigned int delta, tmpdelta;
 	unsigned int testp, testm, testn, testp2;
 	unsigned int p, m, n, s;
@@ -582,10 +578,6 @@ static int mgag200_compute_pixpll_values_g200ew3(struct mga_device *mdev, long c
 	m = n = p = s = 0;
 	delta = 0xffffffff;
 
-	vcomax = 800000;
-	vcomin = 400000;
-	pllreffreq = 25000;
-
 	for (testp = 1; testp < 8; testp++) {
 		for (testp2 = 1; testp2 < 8; testp2++) {
 			if (testp < testp2)
-- 
2.32.0

