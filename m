Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id PDQbFCGpfGkaOQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 13:50:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBB4BAAEE
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 13:50:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D0810E9DC;
	Fri, 30 Jan 2026 12:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L/6eSNks";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1D710E9CA
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 12:50:05 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-4359a16a400so1806688f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 04:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769777403; x=1770382203; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DmrH8ssg9I3rSN9CRTVvj/vC0MjWYSI81FqMxg6ZCSs=;
 b=L/6eSNksGGfWSVJRSyxXOmq+szuQ/0D9tmUIfqMCZMJ3R9tQ4K5aGCy5mfz6/Eh4st
 fu5jLY2lTEJjVSPcPhgJ73w7+mtL0+Pd23l3niMHyVquduKW+EZwvbpCw2uKliZZqhDY
 Fdq/bSDJrARByyIIIkbGO4qni+rmfzW7EyoPgq4tBXZxBOOS/OaWeLrA7g0ROoK4ofGQ
 lAr70dmr5ye+jdWA11OxabrxFfngajTP5eTNt4biIPVudMRuc+gmjQivxrYiy9C66vKG
 VVPG9eEiMsW/UlCgZp9MxKOy2EwlQPGSbhHJcUR7XWq2Ky5dp88IxRquZllgK4L/lgCL
 KUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769777403; x=1770382203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DmrH8ssg9I3rSN9CRTVvj/vC0MjWYSI81FqMxg6ZCSs=;
 b=fxutVi6RVnnda+j3dMRlDvcKdXPmMbYzAC3xDDHwp7jXIDDzA6rthteohF1jIA3juX
 l1q0gsowMSvHBlR+BsUcfmUuAk4+nibWhfQM8tzYWKQwaTBWomwdD4oPgJ2//f49dl24
 /3ss306QPxd6g39ARsm8tjvZ5VmZzA/sbh+pRiJmKDL9Y55KXkKiP6w/rd+d5sMo0cET
 OSpx0SBwLWmo7PE2voCrxb1BzxapDKZVxTltVWCQMEd3Aa8oSsglXBWrvN2XzYd6NzeM
 F4a/+AoLvQ1LMtihTtfx+nwVuB8LJYY3NvZRRhgJTIsqfjBm9WQ0RqV2ac9NDN2mT3Vw
 OS9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvB+cQXCYvzCnpAwMDrMq2EdLYXCZEwgu6RJcJo8H9GrlI5qWbJPXClLkWGhCHe8QhcENWmNUr6wc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBySxQs21OzJVOHgQkGmp0z4W3/poAXE+RC094yqDHtW0oW+IE
 iKMRFWWMqBGRCst+GcUcV61DmgEHI5QCoM7O2yHoTQw67GdI0OCAzWLB
X-Gm-Gg: AZuq6aKqcXuNkWL9COx6mIJiDfAjdt2KheMsBe+zOotV8YKwe+kgdm98vw70Zt7wF/B
 oouH2AIbHdf00Bu+6UXf2EwZMnWaS+Y4IBBvHDFRYVDZegUjnVb1ZO03p36rlkuYOKXJej1Awvi
 cZ9Z7AxJ3H/nhWuOk9/xS3bysgIeIb3aRMRLLalNefRmeY7Un82GExuFrwfPT/FvqhR9CgeGxS5
 imxokJ9hkd4IKzgkXRWxl2hRH3zheVG/4qZmjBGSPtUh/OMcPz1nz8N2Gk/5IM20y3k7DyzWabu
 uCoIdjxjZv+/0PgZj7eUVAH/3XihJpuWx3dxPlDyVu9uVi2DyaLeAZUfvdkU/KmT9/w6KJhucpX
 sfvX+eVE4wrxb80aVExav2m3D5pqoHGU5e6HeFgYKoIYXxq5M4qXXzK2BXh/IQaLDD1wQKltDLc
 dD
X-Received: by 2002:a05:6000:4381:b0:435:9f41:d60 with SMTP id
 ffacd0b85a97d-435f3ab2020mr4343007f8f.35.1769777403327; 
 Fri, 30 Jan 2026 04:50:03 -0800 (PST)
Received: from xeon ([188.163.112.49]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jan 2026 04:50:03 -0800 (PST)
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
Subject: [PATCH v6 08/15] staging: media: tegra-video: tegra20: set correct
 maximum width and height
Date: Fri, 30 Jan 2026 14:49:25 +0200
Message-ID: <20260130124932.351328-9-clamor95@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: EDBB4BAAEE
X-Rspamd-Action: no action

Maximum width and height for Tegra20 and Tegra30 is determined by
respective register field, rounded down to factor of 2, which is 8191U
rounded down to 8190U.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index aa9ff7fec4f9..b2e706fa727b 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -23,11 +23,10 @@
 
 #define TEGRA_VI_SYNCPT_WAIT_TIMEOUT			msecs_to_jiffies(200)
 
-/* This are just good-sense numbers. The actual min/max is not documented. */
 #define TEGRA20_MIN_WIDTH	32U
+#define TEGRA20_MAX_WIDTH	8190U
 #define TEGRA20_MIN_HEIGHT	32U
-#define TEGRA20_MAX_WIDTH	2048U
-#define TEGRA20_MAX_HEIGHT	2048U
+#define TEGRA20_MAX_HEIGHT	8190U
 
 /* --------------------------------------------------------------------------
  * Registers
-- 
2.51.0

