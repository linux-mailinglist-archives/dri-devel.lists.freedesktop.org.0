Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMDCMn6Se2nOGAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 18:01:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA02B292D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 18:01:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC3810E28F;
	Thu, 29 Jan 2026 17:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z9kRArO1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107EC10E2AC;
 Thu, 29 Jan 2026 17:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769706106; x=1801242106;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=COUeNXezoot5hHSoYeek1JCCGkRvQwOzVer6CimPFEY=;
 b=Z9kRArO1RbyayF7snuT7IST5yrPTAWg9Y1Lz1MAPheU1Gbf4wuASpCrC
 viYDr1gXW8G5WRLbbx87pG51XRMtC+oz2YgViMBUtbZrY3bDCw85E938+
 W3t11dvOCsnTpgO5BIVCV66t3DH2VLIIVEql04CiwA0u38EsO9KbHnytY
 pFapiOHY8gqqjJfJI6RMyvaM9nBYkDAOgvrt58Jxl6FzuxSNcnkzBL76U
 paFRykSPZnrdiq/ECls/4Wi8Q5JxvjdKwOl86TRmzVHD4vLZeSuPT1aRN
 UgDlsATkkmIp2lsw2YFpitT1vsE8crPNACiz0L2hFB2oFQr+eos/ZTOIE w==;
X-CSE-ConnectionGUID: xKMq4SebT6ivMk7X3JqH6Q==
X-CSE-MsgGUID: +1WiO5LfTqKO/Jppd204jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="73546942"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="73546942"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 09:01:45 -0800
X-CSE-ConnectionGUID: QmK4vWY/TN2yqcEmz8sveQ==
X-CSE-MsgGUID: wzPqhYGAQaa3oBpTTU7kvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="208412919"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.203])
 ([10.245.245.203])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 09:01:41 -0800
Message-ID: <a34d967e-b111-4b29-8c97-af3e77b5d33e@linux.intel.com>
Date: Thu, 29 Jan 2026 18:01:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Cc: dim-tools@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Oded Gabbay <ogabbay@kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PULL] drm-misc-fixes
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maarten.lankhorst@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 3CA02B292D
X-Rspamd-Action: no action

Hi Dave, Simona,

2 small fixes for the next rc/final.

The WARN_ON() fix seemed noticeable enough to send a pull request.

Kind regards,
~Maarten Lankhorst

drm-misc-fixes-2026-01-29:
drm-misc-fixes for v6.19-rc8:
- Fix a WARN_ON() when passing an invalid handle to
  drm_gem_change_handle_ioctl()
- drop ddc device reference when unloading in imx/tve.
The following changes since commit 0a095b64fa5b4b1edfeb2e9b1751e044230c5d73:

  drm/i915/display: Fix color pipeline enum name leak (2026-01-22 10:26:55 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2026-01-29

for you to fetch changes up to e535c23513c63f02f67e3e09e0787907029efeaf:

  drm/imx/tve: fix probe device leak (2026-01-28 10:53:19 +0100)

----------------------------------------------------------------
drm-misc-fixes for v6.19-rc8:
- Fix a WARN_ON() when passing an invalid handle to
  drm_gem_change_handle_ioctl()
- drop ddc device reference when unloading in imx/tve.

----------------------------------------------------------------
Johan Hovold (1):
      drm/imx/tve: fix probe device leak

Tvrtko Ursulin (1):
      drm: Do not allow userspace to trigger kernel warnings in drm_gem_change_handle_ioctl()

 drivers/gpu/drm/drm_gem.c           | 18 ++++++++++++------
 drivers/gpu/drm/imx/ipuv3/imx-tve.c | 13 +++++++++++++
 2 files changed, 25 insertions(+), 6 deletions(-)
