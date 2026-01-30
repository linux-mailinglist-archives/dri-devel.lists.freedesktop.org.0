Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ZpajCCGpfGkZOQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 13:50:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3F5BAAEC
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 13:50:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F420C10E9DA;
	Fri, 30 Jan 2026 12:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ceJnkK3Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6160410E9CA
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 12:50:08 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-432d2c96215so1885877f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 04:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769777407; x=1770382207; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X4ctCsu/iwYqXOjPjOHAyLkKARUcVjFZmtnOvE7QpjU=;
 b=ceJnkK3YLrYnaJUrvNYI1El2jHa7vJUa1VFttYY/OujuohwfPQd0w6VxV/0QA3h+Zf
 7EF8s1Ds+pVx7hKnm0LJ/GkBHH4+q868bqvQExKbpn9G4HjXG80Rjv+qm6L1PcnPdLO5
 0xpgXYjWDZjmwG+WPoCMWGMCuzCKgzlBdtGuqU/rLdM7mW72HQsCT+JOKv40npLf5lpA
 xCiw9ztjEDZEu/GQEFNmtrO4z2mPhtEh9MKvNhUnhGve7m0VQOMqJNW9aSOQTNGjyw2p
 TYR+0Y1KCePMqZ/hzQ6dm25XvjwmNYOJcsGNUNknuJ3v6cHX2HvBHMUvOSTvdtP9fz3p
 O4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769777407; x=1770382207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=X4ctCsu/iwYqXOjPjOHAyLkKARUcVjFZmtnOvE7QpjU=;
 b=B/CT35pC4C+YpaNdUQb8dugUGR6S9Ekj2STBCjf7bP2r7EeZv3StIZQ7725lkLeUus
 iwLYShCn80Ks7an8YKnmEi0qn9L21ZnLppGcuMK1qQUmQt6lad+zRHH6KLc/rxHwjEn8
 S8KwNGoVaFXLIKF29c1s8zqX9//o8ZC6KdbdNWqIwUukQSIEPamMCxU+zpVyG56UEODW
 wTAtADCBSXxBAR6CxlE0LFmwspLgUP6rhCxCqmReffUwTO5UmQfoK1YImTRs4LC6D2kz
 ABdhr/X1r6UEeatYbkBrJPNkkILDjP6PdLZeNvnJCRt6kw7MzM6GTwESE0vUAQo3dKvM
 qzWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3pEcb1snEsBMt/Ljwvq7DYIwbeWNMpuQZH/Pei3XSJY0srUcLaLCAcBpkq8lieDmNsVybIDghFb8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9J1ao4bptHOdm2v7wK25zquJSNBztLJnhBlqgq7V4cKRi6kXt
 SNYn/F9qQ0dZWXpXHBVhaoTQ0BRUmVR8fjvgE2kO9pjl+cBiuUY9EQWg
X-Gm-Gg: AZuq6aIuz1F/N5dTWFeMsLk3dHIet8groT6PoH94BF8dvulVBLCTd5LPNRxfeiwU2MH
 Ria6gmeLsF9YQYroI9usWDeIT8XxD+/7OA/GkMmNgjZUxmYX/6h9myqCXqu8LCNAZzBQxqFPFWd
 t747TiWg5E2dRWill6NqUarkFpVmReeXrKxuu0gg3bhQHf68RFzEP6zWOJHu20s+/66IcxNp4Ii
 aMOwYKi8Wyx1arPxg6R6ishyoo/42YW+tOSBAFAGAoS9w83OQSa0tkiCfgr9lPAr3FNjPI60r42
 QEa3wyjOdO1whZcFZe00rUSqhBbmYynf+fbyEScUih7ia/ffgzMog0AflB/2fYyBdtVYbjBp0BX
 9N0kTFI32QMdFryd9BgSx6r5BVU7bRGBWOB+giHAxeKuG1U+Da6XjAT2ScXpmH3kRBFnB5+nuUw
 Z2
X-Received: by 2002:a05:6000:24c3:b0:435:95fb:a0f2 with SMTP id
 ffacd0b85a97d-435f3aaf7a1mr4266059f8f.46.1769777406689; 
 Fri, 30 Jan 2026 04:50:06 -0800 (PST)
Received: from xeon ([188.163.112.49]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jan 2026 04:50:06 -0800 (PST)
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
Subject: [PATCH v6 11/15] staging: media: tegra-video: tegra20: set VI HW
 revision
Date: Fri, 30 Jan 2026 14:49:28 +0200
Message-ID: <20260130124932.351328-12-clamor95@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: 3F3F5BAAEC
X-Rspamd-Action: no action

According to TRM Tegra20, Tegra30 and Tegra114 have VI revision 1,
Tegra124 has revision 2 and Tegra210 has revision 3. Set correct revision
in tegra20_vi_soc like tegra210 does.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 4b218b9fbc26..7ceefd920cd6 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -596,6 +596,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.nformats = ARRAY_SIZE(tegra20_video_formats),
 	.default_video_format = &tegra20_video_formats[0],
 	.ops = &tegra20_vi_ops,
+	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
 	.vi_max_clk_hz = 150000000,
 	.has_h_v_flip = true,
-- 
2.51.0

