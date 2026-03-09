Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QG/OE298rmnoFAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 08:53:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C43235119
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 08:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6610A10E4A3;
	Mon,  9 Mar 2026 07:53:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RBLrANPe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B8B10E49B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 07:53:12 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-48370174e18so69089105e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2026 00:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773042791; x=1773647591; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hQSj4yb9M7hPwSpBxDj8hHK3jRimcbsKCK5DUSyRAe0=;
 b=RBLrANPeBKnq42jDELckzffFkS8I2JB7SZyE1QrP1Bpec4uqNAOS/GeQL2r794cpYn
 GhfxkEiABCFba58HlYhaS41z4SoFcODH39qx8bL8jVEKDFaGjicCwx67CyLClr8cMddp
 Th6MUljxG6DJerZBXJn+pDUjeT7msxNzLtjMHjNwWzBNfz3dIUdc1WAVg5PDwP+Xk73R
 lCANo0j5SIG/BhfAVicUaqvRxRgM4zVGqc00BYC3yu44JnxNyFVv+wmPmtKLhTciCZ0V
 aFIPGomqrp3yyfhJB9Ed5JRNkGX0an49w7FBtTrCXC+MT1uAeIjYu5vyg3Bb6jkQukJX
 y7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773042791; x=1773647591;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hQSj4yb9M7hPwSpBxDj8hHK3jRimcbsKCK5DUSyRAe0=;
 b=cS5+08D6uogX16UN3gYSFPs4XIJ57caCBUHl1RvlRMbN0KYEKlhEc6naP0GVcb1MIL
 B48O8XshSMIrgizIjDYTO+cVGdM/c1J2ExquOSItGhuqN9QmoDCuA+XDmWkrX4bi7J2Z
 McXLZ1v8JrFEWQIFMvUpw00EGDnAqgi5TqlmqUuH7UViP7p2gOL+njxoLqxmOKCIQxic
 FjtFqeW9uqOc+uSGfF6eErGexnFwQo9qwJgI66tP84kw5O38NPHQK3ic4BOrB+lNwNQD
 5CWBR+tuLJXhMOtOjTkM15x74Iof/wkXnE5r1OK+APmpfwRQni6wS3Xw68v5/6JrUmpm
 udYQ==
X-Gm-Message-State: AOJu0Yxt3X6BvH8dE/3Lyvh6KsVh7+1foLYLoMa7dMm2YH8xDQy4l5C9
 XQhfrtRd6greOI9ZGLd4tAUGPNFAfRO7UrouEyJGueOmvbDrVSgw3bzW
X-Gm-Gg: ATEYQzznUU6ibNFWlpU0Nacnhu1NhluHY07vljdMwccolxJiKumwxAs61uQTp4v2/B5
 7CERgsjFUexqSg7u2QL0PGrwiLonMzkOz+XDyXNBvFzu1RVJ7Uq9WI3EASI8HI/weYLbQMKR619
 v9d5JTnAGcKfA9joLKoRXPVvwrjbmY25FPT7ynErjdOcH2smHP3s/U8+ZvGHVp73yYlUMqYKKy9
 CVv9FnyjuJeVOeygII3uAGi98LDryhh5rDq5myqnI7rIG48MzR4iHmp5DC9RNofpZpYzMeiCas/
 1C/883LQ7ApCKc5/aEackmQJEYUFF+sdqdileBJMhkOvlBKcRHPHU/gIIx338ZCd2r0EafZIxm7
 fk9k1LrU49Wj8haUTMIF8NlVG5XNHKCe31ylTBydcWRRBZC4pimg6tlaB3stWGajLOs5XJ/QZJ5
 Tydz7v2ZtzNZUF
X-Received: by 2002:a05:600c:a403:b0:485:2969:cd9f with SMTP id
 5b1f17b1804b1-4852969d02emr123760865e9.12.1773042790689; 
 Mon, 09 Mar 2026 00:53:10 -0700 (PDT)
Received: from xeon ([188.163.112.72]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485245dbd87sm97799975e9.16.2026.03.09.00.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 00:53:10 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] gpu/drm: tegra: add DSI support for Tegra20/Tegra30
Date: Mon,  9 Mar 2026 09:52:46 +0200
Message-ID: <20260309075248.47730-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
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
X-Rspamd-Queue-Id: 01C43235119
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@gmail.com,m:mperttunen@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:diogo.ivo@tecnico.ulisboa.pt,m:clamor95@gmail.com,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,tecnico.ulisboa.pt];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Tegra20/Tegra30 DSI is quite similar to Tegra114+ apart MIPI calibration
logic and clocks. With a few minor tweaks, existing tegra DSI driver
should work on Tegra20/Tegra30 devices just fine. Tested on
Motorola Atrix 4G (T20) and ASUS VivoTab RT TF600T (T30).

This patchset depends on Tegra20/Tegra30 CSI bringup since both share
MIPI calibration logic. Ideally these patches should be picked after
CSI bringup but they will not break anything even if picked before
CSI patches.

---
Changes in v2:
- removed all MIPI calibration, it is handled within CSI bringup
- added per-soc structures into of_match
- added fix for hang caused by register access with uninited hw

Changes in v3:
- switched from version DSI to boolean flags
- added comment regarding Tegra30 clock configuration
- commits were picked:
  "clk: tegra20: reparent dsi clock to pll_d_out0"
  "ARM: tegra: adjust DSI nodes for Tegra20/Tegra30"
- commit adapted to recent DSI changes:
  "gpu/drm: tegra: dsi: move prepare function at the top of encoder
    enable" > "gpu/drm: tegra: dsi: re-add clear enable register if
    DSI was powered by bootloader"

Changes in v4:
- switched to device_get_match_data and added check
- added comment regarding Tegra124+ quirk
- adjusted commit titles and message formatting
---

Svyatoslav Ryhel (2):
  drm/tegra: dsi: add support for Tegra20/Tegra30
  drm/tegra: dsi: re-add clear enable register if DSI was powered by
    bootloader

 drivers/gpu/drm/tegra/drm.c |   2 +
 drivers/gpu/drm/tegra/dsi.c | 126 +++++++++++++++++++++++++++---------
 drivers/gpu/drm/tegra/dsi.h |  10 +++
 3 files changed, 107 insertions(+), 31 deletions(-)

-- 
2.51.0

