Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGwpHQipfGnuOAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 13:50:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3FBBAA9F
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 13:50:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 540F210E9D0;
	Fri, 30 Jan 2026 12:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KP34JSm1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5191610E9CA
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 12:50:09 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4806bf39419so19908475e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 04:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769777408; x=1770382208; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jCPyOYLjH+xCK5jyX0zEVU2hkN+dQM35tiBS1e1/x50=;
 b=KP34JSm1HrCFZAm3r3H3nl1minCbWdHT1MAdB+fJnS+VUNKxHr78sQBFGMdu0mOtzo
 qkDThyHGB6OACZt2XsQnk2XNO8ITCeFb11WTNdjNhjQwfsLz/M9kQu7FllMf4XikemLo
 6siOpXUv2wby+A/XE8F938A0zVlfrB9wE7jQv1Ab7zhLg6otCiYuaD/n6bPd7z1zoGTV
 VwYu3ZELucorIIeaP5jkVVuqSNjssKHD2RbLCATsF47BndOtScSS2DtanIMZL6mHxdz5
 rVyP8gsejxbq8Mo7vgEJ+IcT2hfi3V2XF2bg8aagvYGiCqH5cs6c6aInlJiYLvn05U93
 9NYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769777408; x=1770382208;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jCPyOYLjH+xCK5jyX0zEVU2hkN+dQM35tiBS1e1/x50=;
 b=pwNCR/YWP5/COwpepR0PN7l9Nv3TtO5mwvH11CEwnV5X/nbo7O+pAITzJZsgsdKPoA
 0alx2UDn5mjHZjT3TKfLQUIboiEZLTXUoO9qAxIzfOXVYP+oSY9+xCTSAmNmabwsJP5I
 yZjj5VI3PeVHrZJX3wJdN4RomgcpIyL7eCZSXBPwrbSG3QqXpTMIdRv6un1GVre2r9x4
 5s1eEEbe0rqmoUsg1J4GyGsvOIm3avSNKbtDYR2hWBP4HC8FBa4PTpkZlvefFzDxDoFP
 oBD0gLCxeTeUF51F88WvcU/m42FJ5gQuy+zKhtRufKhcBWTov65bvOetbXMX8k6dn0oB
 M5Gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUU1UgCbrU1hdmWzxqvKhnH14h73riJZea+p7KaiulqSYACljYNZWa+j6Z3hIawglFdzw3b3DYFEEI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yym1baBGepZPIWOI17/bqF+1AliK/ne09mAebMlpDCkA7QWapsH
 eUAmlpFBVqntaGZ52lFTSyShfAaEoYeJOBxtcdKALakD8h+2fvzQF/Hn
X-Gm-Gg: AZuq6aKzN1Alb9XyJdd92ORbwaHuESCQwFjV8SaRcdu6uak0zYi7v8mEUirF30vZ6cB
 4EwqdPlUaQk+s1xVB5Za+gHjZSZPJ3YROgyonIAINZilaT3LT/FVtkRK3buWPsrlLQyR+vCAuYX
 LUHnNFM14f2dNMpQW3z1cK4gPHKMubRU1xQxYuPjLM38qtqfJ+BAiy1nPoeBkcznUv562id3Sb+
 R97RkhO+XQcppUuEGVL2vzvd9hj9tRb7KkwNefAyb5WJkwB9dLBzcbARmwP5I6/S4vzbMaIKjYx
 BzGfnsq4dkejXB1j/xUOf8oFrK4ppyJTee3urNKbOTcxIR4RjtTg8Sea/ZLRB16NBmXNZH6d0wE
 0mSPG0Ihe+enqHP+qj9eAd+Ql+V91ynj92Od64AyTqLW9ZP5wf2lHf+6BoNz+qc5+IAOXYHjnWw
 NM
X-Received: by 2002:a05:6000:178b:b0:432:dcb1:68bc with SMTP id
 ffacd0b85a97d-435ea2102d0mr8586769f8f.23.1769777407709; 
 Fri, 30 Jan 2026 04:50:07 -0800 (PST)
Received: from xeon ([188.163.112.49]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jan 2026 04:50:07 -0800 (PST)
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
Subject: [PATCH v6 12/15] staging: media: tegra-video: tegra20: increase
 maximum VI clock frequency
Date: Fri, 30 Jan 2026 14:49:29 +0200
Message-ID: <20260130124932.351328-13-clamor95@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:email,bootlin.com:email]
X-Rspamd-Queue-Id: 2A3FBBAA9F
X-Rspamd-Action: no action

Increase maximum VI clock frequency to 450MHz to allow correct work with
high resolution camera sensors.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 7ceefd920cd6..bf8755698610 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -598,7 +598,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.ops = &tegra20_vi_ops,
 	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
-	.vi_max_clk_hz = 150000000,
+	.vi_max_clk_hz = 450000000,
 	.has_h_v_flip = true,
 };
 
-- 
2.51.0

