Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id lFS4A0VbmWkCTAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 08:14:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB1116C57D
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 08:14:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B03EC10E12F;
	Sat, 21 Feb 2026 07:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mOzMPp9t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F4210E12F
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 07:14:06 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2aaf9191da3so17272025ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 23:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771658046; x=1772262846; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6IKOTzapiakFq4HtZzwyVzRQJQvCqcV3Mpo3AQvBCcY=;
 b=mOzMPp9teQPlVIs7jdfib45zfjzFL60FQ9qcsQm6YelAfSEvL1MHV381/M35HpLH+O
 cLvQgRTozWvRVMuS++EZe6B9/3XoJLMfgfSx7wmJFHc3aCqV9c9KUtToMehq9TC/oTfx
 TU5gH2rbH3V3p8Mh88dQ2oH8Dh2iDQOmSM9QlLQViVFhxhVSuLCP/kl2l+I4MhSEzWhp
 mEGRZ5Pq/bPjR9pryij5rnBaBaca4YSDlwJoxvpgXWloyPnmXn02ZGhFXmDboyL8Umnz
 koH2+mTqXpaOAkCHyMPnV/PeUvW6ckJu7WsU2kLb7xTFc8Xq9IZhWw44iKrXJFL5Byja
 wvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771658046; x=1772262846;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6IKOTzapiakFq4HtZzwyVzRQJQvCqcV3Mpo3AQvBCcY=;
 b=Xkvy5aTLFWSTN8Muq/Z9Axnr8MIYQUBrjCHirh74dZueILBN2vm0HOutzW/2DWz8rg
 Bzpx9dG5mRV91bRV68QZWtwSGPXDGSLaiLHkHkYf3pln/anCNTYw2sa9K0TLaCuGNamF
 x4g1saE/MvqhrMye3JICZRLwzXpK9D2wShy0Gq7izck7Hb7CI9bFf5Xrlo4NfZpjuBY7
 z+ol/pI9pkXCKp0MdgGnZVv3s1sN+rW5fdTijt2/aID4idCey20ZOfRTEHao7zTFqjuR
 IRTsH85D68NvbkLwVH3XKHAObB1wxIizizoSMVV9qgmKAu0M9l9E8K0knRKeVcvH6RO0
 HBYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlioKgt1WW3lN3mr9W7Nve5+DgyDVRJU4QLXfzMSRR1PXobUtdaD2PAI6DTNKhQZPl+ObwHKUeAIY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxd4GJ5MqJ0YzE1bg1u6lUfsmNnhV8YuMqzJ1jiNX6ebEwWK2G+
 aA1YYVbFY1IGc8yFzv8aqgoYYoQuX9PFQZbBbLWxnqeT5fhwLSggh45l
X-Gm-Gg: AZuq6aL4HlUGHKUPuxJ3hGQ1yCR8pT67x+uKbmUzRoPTSd0oTIaBE1rUrRXVyrV91nL
 +l+eo4t8Jcq7P924hkS8iABwjKvBRTsajCtMVBvuevoEwlwoU/niCjKggUJ1ixTma5u7P15od/X
 WTuJn30SMxsU5cUZNe1aenTz6PpeB1fWsPF5RS9r3WxXgwm1PO5vaiztCvOEh1pMj77UQjdGYu1
 6A9bXhIgcuKDVPhviC6lZiXF574++fGllbAoPcsNCzBXWqVfkS3fXvBmIfk78m4ZrgMdr+VT8b3
 f0qL/3Fk4pxhBZYD2/tSzjxCsFYR/po3wjs65f73d4xKfXCWKnUX/ikbzqkIHZ1dk/bKHZtaxTF
 OMG1SLwdpIoEZ4DBuKQXhGkchgMufMKN2eGF2XrolJpwJf4B9Lz55aOoiQ8W4UytSAWnwIxe8V4
 6OQpO/NQ227BMjz+7Nlt8skxC7eNwEUK6cPuUfoeSemA==
X-Received: by 2002:a17:903:1a2d:b0:2aa:e817:1bd3 with SMTP id
 d9443c01a7336-2ad744e1731mr23124425ad.29.1771658046239; 
 Fri, 20 Feb 2026 23:14:06 -0800 (PST)
Received: from debian.ari ([152.58.178.174]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad7500e2a7sm12657355ad.46.2026.02.20.23.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 23:14:05 -0800 (PST)
From: Archit Anant <architanant5@gmail.com>
To: neil.armstrong@linaro.org, jesszhan0024@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: sebastian.reichel@collabora.com, gerald.loacker@wolfvision.net,
 michael.riesch@collabora.com, miquel.raynal@bootlin.com, wens@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, architanant5@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 0/3] drm/panel: sitronix-st7789v: Convert to mipi_dbi
 and add tinydrm
Date: Sat, 21 Feb 2026 12:43:48 +0530
Message-Id: <20260221071351.22772-1-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:sebastian.reichel@collabora.com,m:gerald.loacker@wolfvision.net,m:michael.riesch@collabora.com,m:miquel.raynal@bootlin.com,m:wens@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:architanant5@gmail.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[architanant5@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[collabora.com,wolfvision.net,bootlin.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[architanant5@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5BB1116C57D
X-Rspamd-Action: no action

This series modernizes the ST7789V display driver by converting it to
the mipi_dbi framework and adding standalone display support.

Patches 1 and 2 (by Chen-Yu Tsai) refactor the driver to use the
mipi_dbi helpers for register access. This enables support for 8-bit SPI
+ D/C GPIO configurations, removing the previous 9-bit SPI restriction.

Patch 3 (my contribution) builds upon Chen-Yu's work to add the
drm_simple_display_pipe infrastructure. This allows the panel driver
to register as a full DRM device (tinydrm) when a master display
controller is not present.

Hardware Testing Status:
Like Chen-Yu, I do not currently possess the ST7789V hardware wired for
these configurations. This series is compile-tested only. I am sending
this as an RFC to get feedback on the hybrid (Panel + TinyDRM)
architecture while we wait/search for hardware testers.

Device Tree Bindings:
Note: The Device Tree bindings for the newly introduced 'hannstar,hsd20-ips' 
compatible string are currently undocumented. I intend to submit the 
accompanying YAML schema as a follow-up patch once the C-level 
architecture is reviewed and confirmed to be the preferred direction.

Changes in v3:
- Combined Chen-Yu's mipi_dbi conversion patches with the tinydrm extension.
- Added support for the HannStar HSD20-IPS panel.
- Refactored the architecture into a "Hybrid" driver that supports both 
standalone SPI and external display controllers.

Archit Anant (1):
  drm/panel: sitronix-st7789v: add standalone tinydrm support

Chen-Yu Tsai (2):
  drm/mipi-dbi: Provide option to invert reset GPIO logic
  drm/panel: sitronix-st7789v: Convert to mipi_dbi

 drivers/gpu/drm/drm_mipi_dbi.c                |   4 +-
 drivers/gpu/drm/panel/Kconfig                 |   1 +
 .../gpu/drm/panel/panel-sitronix-st7789v.c    | 417 +++++++++---------
 include/drm/drm_mipi_dbi.h                    |   9 +
 4 files changed, 227 insertions(+), 204 deletions(-)

-- 
2.39.5

