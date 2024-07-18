Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E91C934AFD
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 11:31:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B9AB10E164;
	Thu, 18 Jul 2024 09:31:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="chshqFqz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81F210E164;
 Thu, 18 Jul 2024 09:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=otGIYj6sdIuOE0xog76etv8iIdrFS26585Ds53hMkvc=; b=chshqFqzAMnLLpcj/a9npVWLyu
 04ABRSfnKW+i10jrSUHUN5OEtFS6BA7WzocHGmSRHO+S3hm/QucOL+hrgYqULQDQSVrKkyqQl/G3i
 4Ype+4Ij/wOOWiwbaYjqBW2936y2NyWuTtr887ueGPZgmcK3MW0RiyWPmFcyzRubPt4AuZKBCiYK6
 uNqG8bEf7jAfL1WKpp9IOIBrQb+BDERSARXo2GoKnd9LTJqC/rvl341AsQdHP+NE8v1nyGXE/JXX0
 FyjVhHiHedL9AuffJht5+hrz6wM7oc8hjIh4c+7qdV3d4DcfRSTCRyDXaeC64yukqeHj4l+MMdh5s
 KOQidBfQ==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sUNTV-00GiJ7-IX; Thu, 18 Jul 2024 11:30:57 +0200
Date: Thu, 18 Jul 2024 09:30:56 +0000
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
Subject: [PULL] drm-intel-next-fixes
Message-ID: <ZpjgtowjpUZoHvrl@linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

One display fix for the merge window relating to DisplayPort LTTPR. It
fixes at least Dell UD22 dock when used on Intel N100 systems.

Regards,

Tvrtko

drm-intel-next-fixes-2024-07-18:
- Reset intel_dp->link_trained before retraining the link [dp] (Imre Deak)
- Don't switch the LTTPR mode on an active link [dp] (Imre Deak)
The following changes since commit c58c39163a7e2c4c8885c57e4e74931c7b482e53:

  drm/omap: Restrict compile testing to PAGE_SIZE less than 64KB (2024-07-12 13:13:15 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-fixes-2024-07-18

for you to fetch changes up to 509580fad7323b6a5da27e8365cd488f3b57210e:

  drm/i915/dp: Don't switch the LTTPR mode on an active link (2024-07-16 08:14:29 +0000)

----------------------------------------------------------------
- Reset intel_dp->link_trained before retraining the link [dp] (Imre Deak)
- Don't switch the LTTPR mode on an active link [dp] (Imre Deak)

----------------------------------------------------------------
Imre Deak (2):
      drm/i915/dp: Reset intel_dp->link_trained before retraining the link
      drm/i915/dp: Don't switch the LTTPR mode on an active link

 drivers/gpu/drm/i915/display/intel_dp.c            |  2 +
 .../gpu/drm/i915/display/intel_dp_link_training.c  | 55 +++++++++++++++++++---
 2 files changed, 50 insertions(+), 7 deletions(-)
