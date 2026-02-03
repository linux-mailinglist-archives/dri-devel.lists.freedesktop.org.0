Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cM+2ImukgWnuIAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 08:31:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3430D5B6E
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 08:31:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D567F10E318;
	Tue,  3 Feb 2026 07:31:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="grKwTYOR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2278810E553
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 07:31:50 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-8220bd582ddso3111081b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 23:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770103909; x=1770708709; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f1PNOi1oh0/Zk5XEHIqvUN6ECXvN0Y2KoNmyJjB7WcQ=;
 b=grKwTYOR23LQTLpuIMu5kNiy0e7ZGqO1QTCMWGm+f/l2VEM/AcctZICyQ57JG+szWM
 YWDppChlQMy7uNCPTONtov2a6I4myWEnehRUXJfr69sHQGZG9DSR+M2d4lRda5oMjaYc
 2AE5fzECzEWtAEyaiZCUZegfsKs1O9exrUNnx6BIkmUyrUNyhRJXVQGQUOFSdhof44Np
 f0UkvqM+WSGEAh+gIuJn3QIbMreNLop/PR3ZGWHfJ9CQoTZVXYq0P296iXe9+r0S4Ih+
 whj0fgE9bVlbISvyk9U5KtLFzsT+iZvn3GtKr+xxKIXv1HlMjvuRd1HcTLe2CP9IoJr5
 ha+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770103909; x=1770708709;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f1PNOi1oh0/Zk5XEHIqvUN6ECXvN0Y2KoNmyJjB7WcQ=;
 b=L3mJ7EMP6kiDKZosj35p9dbJm54kvIu+JXowGQjrer1RhQQhGezOQs6FshXM1h+Yex
 OPvEtLkFbh0A7UWDKeTKD7Plwz1nVAxJonM/RpPc69VPis2woLHa1d/SP5jgBv7844rZ
 mqsh8W+yeadUeeN5C7BNjNXjSCJv8VPmuNlm5oNNMGbx8VOpO6LdmKL1TDWVIqOC8rfK
 aRhDJKf1d1S9vHs4jJYxUACjJuWgljCAg488FoRqaQzGhZcYdVrYybe58fdtivdcW669
 IuWKlwphfHF8u5TSXcUcNP1gbCM1qh9RFm6yabNEi8I1x17plt2iuigreOKv7QIT9tD5
 Vemg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRIK981yFpPyr1ihfNUON51Ws8Y+irxW4KP/silWcV/Sx/0I+6uQmApkWAPZQ6m95s+Lagi+dDZmg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAyEQ/sJ4KizgT8eH4Kx3OdUOTEFOhdj5lVDXbqxxI1kfGOXP0
 UfWUL5XZhFRt9pMvsv5V4EG0NeWlKPwjEfuCnDaD4x1WLlKKoTklamQ=
X-Gm-Gg: AZuq6aKmhDtT+8kTWYgWrAH584iDo85nr+xlvfbtY6xCQEHE9F3g+ILzrmksTgL6EKK
 c+cB8BPzuplbAh/wVfk/mOFmObFnAX9/MOJmHrgjyavtKkHjl4dExEQZ6hThxP1WrvurGKv87bb
 ADzJLvqmleJCYBw/FraWqNmxK+FvsXfjFtHvFbJLuY71h8ymBF71NronivvAr+Gza1JFOuk5gCh
 bTBftYR9UU7Z5nRaAvX+0CLohfLgAR3VfCVcLrhhq09t4/spEqOtQCkJku+Tx10JuGxgwAzDzH5
 n28TqLTpPbC2rfIrExakOXH9flwYVODaYx/jXYp/iQgfgaRZd22eUHj8BDAvvj+wxlEuHPfzeak
 TiBiDe/i8rGuCnBWC/7tubRxjlc7aX6l+GNEfSbp47R6Ti8DqsGQ2O0JHLeYe8B5Q/s08M5SdhG
 8OJ6K9GvWCAoT8ZAk=
X-Received: by 2002:a05:6300:4093:b0:38d:e674:b5ef with SMTP id
 adf61e73a8af0-392e01aa144mr12357123637.75.1770103909557; 
 Mon, 02 Feb 2026 23:31:49 -0800 (PST)
Received: from at.. ([171.61.163.171]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a8dc225534sm108280865ad.68.2026.02.02.23.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 23:31:49 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Francesco Pompo <francescopompo2@gmail.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>,
 Lenny Szubowicz <lszubowi@redhat.com>, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/2] Add support for eGPUs on Apple Products
Date: Tue,  3 Feb 2026 07:31:16 +0000
Message-ID: <20260203073130.1111-1-atharvatiwarilinuxdev@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:atharvatiwarilinuxdev@gmail.com,m:ardb@kernel.org,m:jani.nikula@linux.intel.com,m:rodrigo.vivi@intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:airlied@gmail.com,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:javierm@redhat.com,m:francescopompo2@gmail.com,m:bp@alien8.de,m:lszubowi@redhat.com,m:linux-efi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[atharvatiwarilinuxdev@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux.intel.com,intel.com,ursulin.net,ffwll.ch,suse.de,redhat.com,alien8.de,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[atharvatiwarilinuxdev@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D3430D5B6E
X-Rspamd-Action: no action

This series adds support for eGPUs on Apple products, by
enabling apple-set-os on all apple devices.

A side effect of this patch is that the iGPU becomes enabled on iMacs.
However, iMacs can’t use the iGPU to drive the display
(They can't link-train the internal display),
so displays must be disabled on iMacs.

Changes in v3:
- Disabled apple-set-os on MacBookAir6,1 and 7,1 to avoid regressions
- Reworded 1st patch
Changes in v2:
- Reworded cover-letter
- Transferred logic to has_no_display in the 2nd patch

Link to v2:
https://lore.kernel.org/all/20260128145855.1071-1-atharvatiwarilinuxdev@gmail.com/#t

Link to v1:
https://lore.kernel.org/all/20260125001111.1269-1-atharvatiwarilinuxdev@gmail.com/

Atharva Tiwari (2):
  efi/libstub: Enable apple-set-os for most apple devices
  drm/i915/display: Disable display for iMac's

 drivers/firmware/efi/libstub/x86-stub.c       | 20 +++++++------------
 .../drm/i915/display/intel_display_device.c   | 14 ++++++++++++-
 2 files changed, 20 insertions(+), 14 deletions(-)

-- 
2.43.0

