Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E98B255BE
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 23:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C443410E7D0;
	Wed, 13 Aug 2025 21:43:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ngSkj8sN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CDBF10E661;
 Wed, 13 Aug 2025 21:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s0RkmzLcubcjM877N4Ky3zIaEdEBhfkqTGTar4HrYJ8=; b=ngSkj8sNSEUdrzqhz8mZfYARA7
 vOns3ROb3dVohKk1qdrcsrGlS8f15uPUiJ2evKh6ecruuxC/0awZNIuZvc7yOVCTb5W3/ybSrql6X
 fz+A51lUOuwDsWolZlJ/jsHMeJLDQ2vcIjwykieMBL9naXrpIneh1IZ8UK4qOINJKUzRY5QBYuUAC
 Y4QABmMbFhzJk1hUJ8hJxObKn3jIrqdq18anjSRGSIJrjKa55DaQGRyT2DtlnpyRorhUSVIZbLNiq
 oRxgFtv1L8JguL86UFVAcPUY80jf3RjC7OXLNC3aJ9EUHML1ZRR7ZNNFlB6YYiUf8VwM+oloKJIGr
 0U4vfFvg==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1umJFr-00Dr1r-IQ; Wed, 13 Aug 2025 23:43:31 +0200
Date: Wed, 13 Aug 2025 22:43:30 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-fixes
Message-ID: <aJ0HAh06VHWVdv63@linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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

Hi Dave, Sima,

Two display fixes for the RC cycle this week - one for FBC and one for PSR
handling.

Regards,

Tvrtko

drm-intel-fixes-2025-08-13:
- Fix the implementation of wa_18038517565 [fbc] (Vinod Govindapillai)
- Do not trigger Frame Change events from frontbuffer flush [psr] (Jouni Högander)
The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-08-13

for you to fetch changes up to 184889dfe0568528fd6d14bba864dd57ed45bbf2:

  drm/i915/psr: Do not trigger Frame Change events from frontbuffer flush (2025-08-12 09:05:11 +0100)

----------------------------------------------------------------
- Fix the implementation of wa_18038517565 [fbc] (Vinod Govindapillai)
- Do not trigger Frame Change events from frontbuffer flush [psr] (Jouni Högander)

----------------------------------------------------------------
Jouni Högander (1):
      drm/i915/psr: Do not trigger Frame Change events from frontbuffer flush

Vinod Govindapillai (1):
      drm/i915/fbc: fix the implementation of wa_18038517565

 drivers/gpu/drm/i915/display/intel_fbc.c |  8 ++++----
 drivers/gpu/drm/i915/display/intel_psr.c | 14 +++++++++-----
 2 files changed, 13 insertions(+), 9 deletions(-)
