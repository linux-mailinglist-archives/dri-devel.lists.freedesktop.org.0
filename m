Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBPEEkYkemmv2wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 15:59:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 841CAA362C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 15:59:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B186910E1C2;
	Wed, 28 Jan 2026 14:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BSJUV3aw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E97610E1C2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 14:59:13 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2a12ebe4b74so68086965ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 06:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769612353; x=1770217153; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zohHYUiSSiWv89YYYBiAoIYe/d4kRFJrNEy84GzqibY=;
 b=BSJUV3awKpOUUKVs7/md9JOhmVnwpbt6+lFzhoMiuh6MO611G7SYqlH2f6QjMgVQ18
 zdi3sBEuxTM8BbL/jbUq2o69ENRxL6uArJANpzE6pYRPwMdzgsEArYqLpPKwNHL4M7h6
 vq1+A2WChpBhUlRlnzH+xFXlBe/4zyKrq780CLOLY+v4wFhG7ji4e931vzXJSdw8EBqt
 pGukOdlJhNJ/UcMWR3+jJd986qLjcKYU5qXWBz+WMiZ+poWs5L3UAkYZP2LvG82jRGcb
 GMYmZdR44QJOa2s2dlTJnhv4qszw7zCBXuefSJciN8GPiDme+ld7rOt44+dR04KYdxrQ
 muCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769612353; x=1770217153;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zohHYUiSSiWv89YYYBiAoIYe/d4kRFJrNEy84GzqibY=;
 b=JhXwQLkXQ2qtm4g0sqMBAopTHQvRJqgzqSq0t8v0IPvLUPqEfGr+6X9TrEfgefnL+u
 R8NGFaMxetVRTuqrPUrFzxc6XBbunOWOTsSjbGMARqI++G+RXrMM2CIhZAUi+ii0Q8c/
 TNSOFkSVmDAu5aMSGLi69K1iDzdoiG6rfz9+62ajRCcaqj3+eaqoVveqZSdGZkCUU9/z
 8FdkzlTSxW3rvPLJ2H3ozNzWvg6FDxnskZX3uTst0V9vZ0jmPorqgEVnfTGz0+socQXE
 PTPtUNDGWqQ4mK34U1VdcKKvpoGP6wzYPbzDzQh4W+/I3NF/UbbkjPKsbVLbNbP8fpIj
 BfLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQFk9SxNx+PDXRuylK4nxyjEurqG5CqwD0I7EpTj61Tc8fVrvOFvpRoJ9JZzZcHYyGfvPM9H7y49k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw90Ptfnz59tBIfiiadGeAu0zVmkCuGLbL5qHGpXJ+YZy66EiCN
 wy1H2WqTQ/oJcIqbzArPgc6qSkrDjHljdI/dTK5joOYwLYSogNAIgNs=
X-Gm-Gg: AZuq6aKeSrIv2zPAZ5z2Zs1USHkngq14+9LcGck5ZhF9zE+RRjwWoBCkUyaRJhPbVre
 L4D/HApfAuz1OyukZj5tRBWGpr//YcA/n+cUOuWm1aDtyIHVHO7oPqIvaA04YfN+xsliBsTiiD8
 z+Isu5t4frLoO8QRs1gwJ2ZeR5b5Wpvxwd3TqFTCgmYZ9FAK1k0ZylOPEykdH0qbJKe4tDMI0O0
 1XpRAYDs8Xh7r3aUiuMyIlii5P1PYxRLtRvOfM80AGp4jPxB3M+MShZvWYXQK6dnENckuDyZDKn
 XhowSC+7f7uVoaCsoHwJggXzAkuHk3b/u2xJMzR5+nevg2LAVQK8Ahc+nXqrNCCwEJy35+Sn/ms
 Oudg0f/WNY8fHRYx5vWg+hAeQvg//jKH8mdCwtBrkQlhdldoXCwG49J7j4Xd4aTeQfDrFQ9051Z
 tRRfG5GGuo7frZ
X-Received: by 2002:a17:903:1a88:b0:2a3:e7b6:ab53 with SMTP id
 d9443c01a7336-2a870db403amr54053765ad.22.1769612352864; 
 Wed, 28 Jan 2026 06:59:12 -0800 (PST)
Received: from at.. ([171.61.161.8]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a88b5d9a7bsm25820235ad.79.2026.01.28.06.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 06:59:12 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lenny Szubowicz <lszubowi@redhat.com>, Ingo Molnar <mingo@kernel.org>,
 Francesco Pompo <francescopompo2@gmail.com>, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] Add support for eGPUs on Apple Products
Date: Wed, 28 Jan 2026 14:58:36 +0000
Message-ID: <20260128145855.1071-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:atharvatiwarilinuxdev@gmail.com,m:ardb@kernel.org,m:jani.nikula@linux.intel.com,m:rodrigo.vivi@intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:airlied@gmail.com,m:simona@ffwll.ch,m:javierm@redhat.com,m:tzimmermann@suse.de,m:lszubowi@redhat.com,m:mingo@kernel.org,m:francescopompo2@gmail.com,m:linux-efi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[atharvatiwarilinuxdev@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux.intel.com,intel.com,ursulin.net,ffwll.ch,redhat.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[atharvatiwarilinuxdev@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 841CAA362C
X-Rspamd-Action: no action

This series adds support for eGPUs on Apple products, by
enabling apple-set-os on all apple devices.

A side effect of this patch is that the iGPU becomes enabled on iMacs.
However, iMacs can’t use the iGPU to drive the display
(They can't link-train the internal display),
so displays must be disabled on iMacs.

Changes in v2:
- Reworded cover-letter
- Transferred logic to has_no_display in the 2nd patch

Link to v1:
https://lore.kernel.org/all/20260125001111.1269-1-atharvatiwarilinuxdev@gmail.com/

Atharva Tiwari (2):
  efi/libstub: enable apple-set-os for all apple devices
  drm/i915/display: Disable display for iMac's

 drivers/firmware/efi/libstub/x86-stub.c       | 22 +++++--------------
 .../drm/i915/display/intel_display_device.c   | 13 ++++++++++-
 2 files changed, 17 insertions(+), 18 deletions(-)

-- 
2.43.0

