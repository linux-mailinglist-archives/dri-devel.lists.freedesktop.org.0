Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePM0MgqJe2loFgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 17:21:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1A3B2186
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 17:21:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 373C910E89C;
	Thu, 29 Jan 2026 16:21:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZPqO/7pZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9DC510E89C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 16:21:25 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-81dbc0a99d2so598715b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 08:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769703685; x=1770308485; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8Trr4HnVnERvKYHpT258ly9SLNvFfewR7K2JtYDPUe0=;
 b=ZPqO/7pZ+bx7ROekME7nEs4vqPKoaulDXvl4oEQ8UuUV40bFzO2hVhnmHhhl0jlrqF
 mrK+KhTrWz9WjApbNyubXpLFxOWR8/TU1R509HTyv6ZxvKLRzA0EHcGDzK4vWJ4zn5Cp
 Aj9ZnFasJhYhE8oY471ZOnwQ4XuhUAZpJ1RNGrPNl8pgZ4UzMwEGf57dHUeZMo+F5bqW
 t6CkwJpubkmRY2zxp2kfvh02yZduT1UcMwmAy277dpbKmvmFGSWf2S0bPhU5+df10lfd
 yHQRSjCi1evg78GGx3oAC05iQWhQLZPQtu7/fYFQjqcx6aETTjya/wycthXq1p/jO01R
 JUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769703685; x=1770308485;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Trr4HnVnERvKYHpT258ly9SLNvFfewR7K2JtYDPUe0=;
 b=DzOchBez7d+7kuqZtbLW4AnWQdocNT36MBqQtrh5TQAKwnxt6/y92bcP/m5RqXIPxs
 fWJF1ZkUKH/wqdr3VYMIoyaJKBujSppBRSoi86c0TAPh4R7R+mj0CBgZ8Hwk+I8LcIpC
 2utl0cEPQCEI2rptas1vt/gw9ZjQxBimwZVzLgDgqmGNOXzpZeMzLBLs7Xgmww9NcfJk
 dHDAiQgyhOUNkO2AgzwAiLorQ1D+4ZKbIqB8AGkhBWhUoj7b6yIcPC9PWCGQ2MNc6OqK
 kSd8EJ7gvgeWSce9iqEsiDSlAM0jNeXUIJlpVBTDKPWcawg8y4MNAfyshPV7i1WDoaP/
 Af5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqmS8W7rf6J/b6P7xov6XNaU5gUEtSthvlQIpBH5rf/24uHcFYBq4+lLTm1ufJAQnueobolNy6Z8c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPF/hoc6QzuzIYHP2+qtf64f8M7JeBS48FaBgbm/W3Zf3aFjYw
 0qh2UnDGAdiCXVS/XeSjMVuzFo5KkotdpibwI6B0ZoDarJyVbJolFUxD/77QM43JkZIovw==
X-Gm-Gg: AZuq6aLq5QXlOQu/B3KQncHmN95CO9mvKeTNubwd4sRGwJrXIcySBBYAXb3ezama0Wz
 c0bqhpWPFSoFdvg3d4XE5p76LG90iWzRx3dOLtefyDT1s6tHZAViSjW6xFQ1ont92w1Ms9WAHFt
 cDx8RnTdbr/4OaEl7pZd0JOdLyK/YKJ6EGX7DlTNwr6MwmQ+Rm3TDOViEamJyfvUCiKDA3Csp92
 EHak2YIwChXeT+sjJ4wnNW1+uXr30V+N8e4TmPoDqVffxsf0YInFVK4tn61r4U5yMqihk7+DuYm
 7GePJdkmxyAoMXEYlEBVxLgkaxhEooVe0bwabIoDZgCKuAVppOOt2J5e6370Z8TmPfvL/LIOsWd
 5rmNG/sqrlzVMBFyESX2kFhFhSR9IYb2/Q134OsH6fQY0fLzTBf4HC/Az4u6huNKM0/OJdkSONW
 CQGi+CzjtQGiaqPof4z+hBFNYEcg==
X-Received: by 2002:a05:6300:4086:b0:366:14af:9bc0 with SMTP id
 adf61e73a8af0-38ec659f89emr7640806637.74.1769703685336; 
 Thu, 29 Jan 2026 08:21:25 -0800 (PST)
Received: from junjungu-PC.localdomain
 ([2408:820c:9008:ba52:ad1a:7b1d:fd68:35f0])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c6427da845csm5475039a12.12.2026.01.29.08.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 08:21:24 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Fri, 30 Jan 2026 00:21:19 +0800
Subject: [PATCH] drm/logicvc: Fix device node reference leak in
 logicvc_drm_config_parse()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-logicvc_drm-v1-1-04366463750c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAP6Ie2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyNL3Zz89MzksuT4lKJc3SQL06TEFGNTA1MDSyWgjoKi1LTMCrBp0bG
 1tQD+jQIHXQAAAA==
X-Change-ID: 20260129-logicvc_drm-b85bad350509
To: Paul Kocialkowski <paulk@sys-base.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769703681; l=1655;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=zwjOf1i4lGOL1MPJJBIakEtH6mLVNfzraj+FW/M7s80=;
 b=AZvQNLGw15cC8tDIc4KLtq0vmXX9HIPky6bCCDUD1FpTLI3OuIC1YO6wqhZQwCsHIPt3VcjTt
 vhH9KGeG2y7CPVA9XhXpNJUW6xbTJsv03JnKO/jNeOKNLEkYn1ycpxv
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:paulk@sys-base.io,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:paul.kocialkowski@bootlin.com,m:linux-kernel@vger.kernel.org,m:ustc.gu@gmail.com,m:ustcgu@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[sys-base.io,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[ustcgu@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[bootlin.com,lists.freedesktop.org,vger.kernel.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 0B1A3B2186
X-Rspamd-Action: no action

The logicvc_drm_config_parse() function calls of_get_child_by_name() to
find the "layers" node but fails to release the reference, leading to a
device node reference leak.

Fix this by using the __free(device_node) cleanup attribute to automatic
release the reference when the variable goes out of scope.

Fixes: efeeaefe9be5 ("drm: Add support for the LogiCVC display controller")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/gpu/drm/logicvc/logicvc_drm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c b/drivers/gpu/drm/logicvc/logicvc_drm.c
index 204b0fee55d0..bbebf4fc7f51 100644
--- a/drivers/gpu/drm/logicvc/logicvc_drm.c
+++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
@@ -92,7 +92,6 @@ static int logicvc_drm_config_parse(struct logicvc_drm *logicvc)
 	struct device *dev = drm_dev->dev;
 	struct device_node *of_node = dev->of_node;
 	struct logicvc_drm_config *config = &logicvc->config;
-	struct device_node *layers_node;
 	int ret;
 
 	logicvc_of_property_parse_bool(of_node, LOGICVC_OF_PROPERTY_DITHERING,
@@ -128,7 +127,8 @@ static int logicvc_drm_config_parse(struct logicvc_drm *logicvc)
 	if (ret)
 		return ret;
 
-	layers_node = of_get_child_by_name(of_node, "layers");
+	struct device_node *layers_node __free(device_node) =
+		of_get_child_by_name(of_node, "layers");
 	if (!layers_node) {
 		drm_err(drm_dev, "Missing non-optional layers node\n");
 		return -EINVAL;

---
base-commit: 3f24e4edcd1b8981c6b448ea2680726dedd87279
change-id: 20260129-logicvc_drm-b85bad350509

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>

