Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Jb+Adb5m2l5+gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 07:55:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF3617266E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 07:55:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB1510E197;
	Mon, 23 Feb 2026 06:55:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lHyG4V/O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C8610E197
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 06:55:13 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id
 2adb3069b0e04-59e6c181402so5044091e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Feb 2026 22:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771829712; x=1772434512; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7+Y6ydg7opucreYTF6TTLBCsji184axNL5GpZ3ETSys=;
 b=lHyG4V/O/ZYgzk33w6S0L3oMiWCWPycm3zt9Wtecpn2Hd39++ka8dEvWC7LCgd6WOd
 WT1+hUMsddbEStspSZwsfuGOSGcbthbB/K4HOImDytq1MKH15e1aRYKu5B9ZOO0YaGCB
 tQO0ut1dLr3VVvwZVCSTVl7MRzuN7vta/yEeTVdIMuN46UdFSbdIM0Kz9qyyPtqrqjlr
 vmF/BvqrZGuja4PPg/AqhBp9k2oASuGIQ0Lw13oOGS94xkridaWuo0YhaO+xMpVrAPQ6
 oIbi2/PbUvrPANz210684U6D/pr4+qlwo3JAzWh3L/yLinKySo4FU58CzvqsyS/E97Em
 McMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771829712; x=1772434512;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7+Y6ydg7opucreYTF6TTLBCsji184axNL5GpZ3ETSys=;
 b=eJqj+liTf9eFptiBB2x1HxdDhnhzhOKxfCuZqrwYTy88DcB6/7hPMv7mlAxsTYnX0M
 3YmkaRuCIMxWLQMUUtu8ZPVqca8kS1DHvbtFZRZf0hDywy9E2QbHjpfVX8LRys4/WM38
 UknodGnRJ+tDUSu4NaSOQu8xDhCd7418QEIJAyzONOQLI7vJJFrJSsTJ40iYwdZckuVQ
 Zow1VUebgC547KMgMFr/9ZwLIuhLNVBv7GrsDsa1DvNj1UuB40+Rn+jTLtFg+NOErQjG
 VOku1PPOi+WfEX2FjURiB6ky6Ve6DXTHXGO1FB2V2o1MIW8qEXvwM2Eeew/AP9ScJyD4
 v1Ww==
X-Gm-Message-State: AOJu0YyrnETgniB9yBU8V1nZ1s0uXRtOqtl505Ot4EFCy7G9wAAPhzPM
 HSltABzkTRYjI+jRv6gvI0Gg4pg18kFSC/0UZ1qXursSDK0MihGXsqQA
X-Gm-Gg: AZuq6aJD0mgK73ELUkYUMrh1ntMXsF6P1wonox9zwmavGZLwpr1sWpswQ2tTXRzIvFh
 DZ7iRHaQIiQVkvXZsibwSNNGZ6+4aq+yduYcSSVQwVaDpVMDzsiZCe+hqL84ZE30jYznin7eBl6
 MRFzkrj9DHUI2LpBnu4OyLnEhd7e5WYryEmoLT9B0l6PYwqVKYgwj0RO0Nt9FxWmNJBn4Hwr3Ck
 ymQPdrzTTl6x4UU5N4OdVIia1nuCNfAMqjZgLODIOh7q8JdP7nwGBdXoouS23SYSzprmGix/09A
 jMg/ZG19KgsGHjYyyPPDatfy8obUpqo4JsfU+W4j3zUHNUCfcmq/KAEyLe7uOAJ1KrWtq1tAd5T
 4K3qUByu+nYl2CyUMTFNOa1jF1ZBJA+DSfq2nEdhDIHtTK+xZxn2pICg0naunMSHyo5iqdf3VlT
 Zux+AJI66dzBZd
X-Received: by 2002:a05:6512:3053:b0:59e:6006:62bf with SMTP id
 2adb3069b0e04-5a0ed8a6736mr2448098e87.37.1771829711746; 
 Sun, 22 Feb 2026 22:55:11 -0800 (PST)
Received: from xeon ([188.163.112.76]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a0eeb4c60bsm1373802e87.84.2026.02.22.22.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Feb 2026 22:55:11 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] ARM: tegra: document Tegra20 HDMI port
Date: Mon, 23 Feb 2026 08:54:58 +0200
Message-ID: <20260223065500.13357-1-clamor95@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:thierry.reding@gmail.com,m:treding@nvidia.com,m:jonathanh@nvidia.com,m:clamor95@gmail.com,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
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
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 8BF3617266E
X-Rspamd-Action: no action

Document port which can be used in the HDMI to model it using OF
graph.

---
Changes in v2:
- fixed intendation
- adjusted port description
---

Svyatoslav Ryhel (2):
  dt-bindings: display: tegra: document Tegra20 HDMI port
  ARM: tegra: transformers: add connector node

 .../display/tegra/nvidia,tegra20-hdmi.yaml    | 13 ++++++++++--
 .../boot/dts/nvidia/tegra30-asus-tf600t.dts   | 21 +++++++++++++++++--
 2 files changed, 30 insertions(+), 4 deletions(-)

-- 
2.51.0

