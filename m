Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gApmKBufpmlqRwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:43:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A3C1EAEF6
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7242A10E66D;
	Tue,  3 Mar 2026 08:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DQ24H7Wq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27DD10E670
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 08:43:02 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-389e71756d8so99716551fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 00:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772527381; x=1773132181; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DmrH8ssg9I3rSN9CRTVvj/vC0MjWYSI81FqMxg6ZCSs=;
 b=DQ24H7WqY1DnGkcObbIgU/j/zTmXn8n8NcW0iGpORTl5yU5GoAUOsK5VVTh9D65wtu
 iX1aqX/WYyK9sVOxG3c8j+W/zPtC+u4fOfhW5CCmnIV5aN4cIBQpUN4q09TzkHbiorVM
 7kvonnvJld56T01i44AoUIlDGHJkXFgiyIrQ9YXJa/ole5dekSRwcqRJbuFfWwPrfE9c
 1hjgk0WF+hcPNi/Njs5LNZq5yZtyNeshnb8Qn/pToeEul4wcw7HexfxQFosoOmqjOED1
 1VDnyQOg3fNZXEDR3uZ7CEBv8CswE5CNjiiglUfDGA8rGr184tGRk5nH/SQi/fuHaGeT
 1bhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772527381; x=1773132181;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DmrH8ssg9I3rSN9CRTVvj/vC0MjWYSI81FqMxg6ZCSs=;
 b=Gj4adprUFA3WjDw2rkVaRod7cA4JM+7VjhYqfP/ukyp92NH03QOV0+n0sLbsrJAgJ1
 0qdOtxmhYY3LWX0bcekkdattCD3aS8W1cn923U/x2f4j4OaHT7griOJ1Z64VHMYceXU9
 kYIA7ZFTqX3fEAQ+gjsXUMMCl1h7XUIoUvgQ4SnFMSXqSvxDw+Gn1fDwkMSNO5cJCm/s
 iAsfpc/zpoSsjFZp2SEgu/0GSRp5E2J6WCnl/goTqcKs/2OukoUg67Ryw7VkWSInUMd4
 nzXAd4blWkm4rcmIukV96byxPMocHR8fiUYpTiQ1iUmAfLwU8WQ6P2VN5wSWbctH7vSR
 NiAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjC4L3S9wGuE1Ul0WKGeho55ZMpdvR+8pKMIPW6MoqPssehogPweNl7CQrAlQosng7HAzzXlyuOFQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpRFQP+R9W+cVkSTulljQt2i2zQpO1k+wRw5KtJ0VUUakQv41E
 PK2fAOUzlyb9Go7vPwhAPtVYYjifm1/MWrz2oRLv5+K/w+ObGDu4UwBu
X-Gm-Gg: ATEYQzyMtHbz2RIVOT2J93TiXWJk5bxHAH9pzOpS9V8X/DLpxO0h1hS57jNMh+lBWv0
 7C4vuwFq4JUrAHxJg+ZqtdZdgSEHsIGRw17ujqB3ohdGcJmZ8MRG/f26PYK8QSUYagoop2PJiQM
 6yRQuqFs0ydINms8+gZlc5KNqrFfCQoO/Xu67i/acb2cZZglhnMJlXniYhno4kpVU/l4I0qX1eD
 EHf9Z3JnkXcYeguUza6qsbQl2k58wkn3Sp3Nhiea82YvcUltZqTHMwoT3vgUnM4N8d+XsiNXuPy
 mE8Jri9k4D2JQGFiQjZa6JCYyRWsc3WeodxBBDKXIYJyfqTBFn24Wp08VzxfwtQwDj3WodQ0gSq
 tTQDxr/pL13ccq2cGhf1jKQVXtVzQ0lfgHcxcdFlzUCYd5xFXjy0TNzFURvlm+S0A+FtFuITZJJ
 7uaF2BzPdQrlJ1
X-Received: by 2002:a05:651c:882:b0:389:fa5e:51f9 with SMTP id
 38308e7fff4ca-389ff355fc9mr105960021fa.27.1772527381047; 
 Tue, 03 Mar 2026 00:43:01 -0800 (PST)
Received: from xeon ([188.163.112.72]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 00:43:00 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
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
Subject: [PATCH v7 08/15] staging: media: tegra-video: tegra20: set correct
 maximum width and height
Date: Tue,  3 Mar 2026 10:42:31 +0200
Message-ID: <20260303084239.15007-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303084239.15007-1-clamor95@gmail.com>
References: <20260303084239.15007-1-clamor95@gmail.com>
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
X-Rspamd-Queue-Id: 54A3C1EAEF6
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
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@gmail.com,m:treding@nvidia.com,m:mperttunen@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:skomatineni@nvidia.com,m:luca.ceresoli@bootlin.com,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:hverkuil+cisco@kernel.org,m:clamor95@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:thierryreding@gmail.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,bootlin.com,kernel.org,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[17];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
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

