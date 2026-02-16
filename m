Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HkKEJfXkmnKywEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 09:38:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FEB1419F9
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 09:38:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B4210E17A;
	Mon, 16 Feb 2026 08:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ammUolMM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com
 [74.125.224.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927F710E11E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 04:04:57 +0000 (UTC)
Received: by mail-yx1-f50.google.com with SMTP id
 956f58d0204a3-64ae5f0777dso2557012d50.3
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 20:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771214696; x=1771819496; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tRRuxIXhMKonaU99F20lodjybZ7fyhXBnJ+HNCXqEL4=;
 b=ammUolMMEwLHhTcQ0PlRpIAGQbnZGf6eohpLIVnA8KcgSyzNYumZT/tT2xFoFwvF+Q
 q0IBoANa1ZMhcK8t8bi/hfGG7H5CNkwlBah0jxZ8jW417/UbjLHRC0rTMNgXfFNn5Qfv
 tx2kKSVxEjYMiiznR0prH0oh8pJC581lHwCZqlHzsBfas2G2EeMHPkgvAxq08gG0BkwY
 S1z08NR68pJdZUids+gtIRlVeYnTbcbHgeu7D81QzsARUUmz2B/t0ZLqLNlpBReM00y0
 lkpmgr52MUtILVPH8QhPrEI6y+wz/w5uSniP72y7UfD21FI7hgUKTaoGsTTV+NrZr7N9
 1FFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771214696; x=1771819496;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tRRuxIXhMKonaU99F20lodjybZ7fyhXBnJ+HNCXqEL4=;
 b=XkfPeuZKDaCol1uMjTOGTq6eqYeyjr7Q2GXrnt56jJKn+sqFqn8saQcNegHt6vWQna
 1pumTS9W0x0w1MeNLWmyNT4KInWts+1xCiMD8Xns21Tuimsme/FY4WN0QjGhWF+G392h
 EtIBV6VPrJKN4JH2I4SYJDdgmsEyoDNkHy6IDEGf0KNE+wgXed0znUDGuUIjbhyhBNvr
 pUjGRcYaj/TlpcP1+K1vViEaf4JBZaPh3WvK17uqLLXKzST7CzyoJuWfWIdy/pvBCJmc
 DMoR+e97QBX2Lx/TU9k8kh8eq5VNYt9yQcJrHx9gYS6ZHVe3zYViadZdNE4FiApz+R9M
 +XnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQ6HRsMASc9Gd3071fZ/+K8UDorW9PNsZMG4+5wwku4gGZakVNAcOpZGSc2EHOQRIJqs52UVOFWDg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzeWAhM+F6DOVNczT7/WaONTaktb0kVnApMENYXCl985HSRfLKD
 HEcjuM0YqDJJywSyxv4fE7SISQVQOXlk/lYE38RDjS8SGZGd5A2UwwDE
X-Gm-Gg: AZuq6aJ6nTUetujKsDN2KNiZyJlj84+JLmSD2FdOy2mTOw6DJRM7pTUB7Dw0m+BYXii
 guyeiirOX3icTt43UK6n5VgJC5z3RiYiQJ6IDp5Xg6w3jOEsavv9GatK7NYfMa3rUzUYy9NmmTg
 gUt3/hf9Psc+qKmUETdl+tWo+C2byy2P/HN9GCKwffX5QiRMMTSHq1pAwcU/Z1L1QLnCd25mq1j
 Yw0z70Dl2Mtb6z7nXaEViELi/QhXrV68H14g1hf9nHGS3nGTRCidfFvcrlh0ZGwr+AFZKHRiiGj
 h9lLInG/FT5GV30PM97t2p+Lg08Z0nY42LF4t3/OukcHRpUNwLl7uBV+pMUQov3S/EUiTOd2ZyO
 yj3FGfuSqOQKipQbRu3yc2qcpes5QBY3qkXGfposwR5XVT9x269OXCTUcLYYZCR+Yr8DeCAm4ii
 EKQ2sMTMRrISwQnb8B2/PclJ5ywHAyPLmP1jmrpO/VcA8T3q5rm3+kqEwVqI3CxtLn8AHFTwXYY
 Y1/jgujL4HQP+lErxd9sWM664mIkHdnQDwNx1Wqd/w=
X-Received: by 2002:a05:690c:34c1:b0:794:d887:7257 with SMTP id
 00721157ae682-797a0bfadc6mr149673077b3.21.1771214696299; 
 Sun, 15 Feb 2026 20:04:56 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00:e3a8:26f7:7e08:88e1])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-797a5caf0e4sm34101517b3.27.2026.02.15.20.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 20:04:56 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: lanzano.alex@gmail.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org,
 mehdi.djait@bootlin.com, u.kleine-koenig@baylibre.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] drm/tiny: sharp-memory: fix pointer error dereference
Date: Sun, 15 Feb 2026 22:04:38 -0600
Message-ID: <20260216040438.43702-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 16 Feb 2026 08:38:41 +0000
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lanzano.alex@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:lumag@kernel.org,m:mehdi.djait@bootlin.com,m:u.kleine-koenig@baylibre.com,m:linux-kernel@vger.kernel.org,m:ethantidmore06@gmail.com,m:lanzanoalex@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[ethantidmore06@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,bootlin.com,baylibre.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A2FEB1419F9
X-Rspamd-Action: no action

The function devm_drm_dev_alloc() returns a pointer error upon failure
not NULL. Change null check to pointer error check.

Detected by Smatch:
drivers/gpu/drm/tiny/sharp-memory.c:549 sharp_memory_probe() error:
'smd' dereferencing possible ERR_PTR()

Fixes: b8f9f21716fec ("drm/tiny: Add driver for Sharp Memory LCD")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/gpu/drm/tiny/sharp-memory.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/sharp-memory.c b/drivers/gpu/drm/tiny/sharp-memory.c
index 64272cd0f6e2..cbf69460ebf3 100644
--- a/drivers/gpu/drm/tiny/sharp-memory.c
+++ b/drivers/gpu/drm/tiny/sharp-memory.c
@@ -541,8 +541,8 @@ static int sharp_memory_probe(struct spi_device *spi)
 
 	smd = devm_drm_dev_alloc(dev, &sharp_memory_drm_driver,
 				 struct sharp_memory_device, drm);
-	if (!smd)
-		return -ENOMEM;
+	if (IS_ERR(smd))
+		return PTR_ERR(smd);
 
 	spi_set_drvdata(spi, smd);
 
-- 
2.53.0

