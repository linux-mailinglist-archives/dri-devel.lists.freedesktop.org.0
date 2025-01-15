Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0F2A12827
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 17:07:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD54C10E762;
	Wed, 15 Jan 2025 16:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Ts45NPZA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8820A10E745;
 Wed, 15 Jan 2025 16:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wy9jwwaTgLWWE93CU2geKsMOU5PfOaBBkf88ciSqsU0=; b=Ts45NPZAWjqzc8W9P5VSofgazI
 DcGnLulkZETHHrprsV/6PefH2R4BYW20Lu2hImRuufdze6qZzdE7VuTeBp7QnkFelXSznPllKPBa6
 eVoniK8EeMq4vIHR+Lml2LBfNFZdlD0xBo0Yv9ZH4LkZ7fJ4KpKUOjdQlhLOZ04cXcg0ItOhPbEcu
 O/LkxH1p7CYUBimsX4ElGn7Yr/fbWmBfhpUqdBxOSBpexY+b4GOLfdxp/ouHFuGQXt0VLT6c3PrVk
 TLmMXZbHX261dO3tirLipTPOsALFjrBvOHgU8bleL/oFE7wC3CCowOGd4HbkNiZ/QkgH69Ib1CY8a
 PIrEcOZg==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tY5v0-00G9UZ-Ck; Wed, 15 Jan 2025 17:06:58 +0100
Date: Wed, 15 Jan 2025 16:06:57 +0000
From: Tvrtko Ursulin <tursulin@igalia.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
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
Message-ID: <Z4fdIVf68qsqIpiN@linux>
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

Another one fix week - this time round a kernel workaround for a temporary
breakage in Mesa, or actually a relaxation of an overly strict alignment
requirement for clear colour buffers.

Regards,

Tvrtko

drm-intel-fixes-2025-01-15:
- Relax clear color alignment to 64 bytes [fb] (Ville Syrjälä)
The following changes since commit 5bc55a333a2f7316b58edc7573e8e893f7acb532:

  Linux 6.13-rc7 (2025-01-12 14:37:56 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-01-15

for you to fetch changes up to 1a5401ec3018c101c456cdbda2eaef9482db6786:

  drm/i915/fb: Relax clear color alignment to 64 bytes (2025-01-14 08:15:51 +0000)

----------------------------------------------------------------
- Relax clear color alignment to 64 bytes [fb] (Ville Syrjälä)

----------------------------------------------------------------
Ville Syrjälä (1):
      drm/i915/fb: Relax clear color alignment to 64 bytes

 drivers/gpu/drm/i915/display/intel_fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
