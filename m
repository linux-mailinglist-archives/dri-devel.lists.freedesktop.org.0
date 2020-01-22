Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFCF145893
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 16:25:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2356F58C;
	Wed, 22 Jan 2020 15:25:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEA96F58B;
 Wed, 22 Jan 2020 15:25:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2020 07:25:46 -0800
X-IronPort-AV: E=Sophos;i="5.70,350,1574150400"; d="scan'208";a="220344542"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2020 07:25:42 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
Subject: [PULL] topic/drm-warn for drm-misc-next
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Wed, 22 Jan 2020 17:25:40 +0200
Message-ID: <87eevrecnf.fsf@intel.com>
MIME-Version: 1.0
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
Cc: , dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Maarten/Maxime,

Please pull the drm_device based drm_WARN* macros from the topic
branch. I'll pull the same to drm-intel-next-queued.

I like to use the topic branch here, because due to timing it'll take
forever for the full feature route through drm-next and backmerges.

The baseline was chosen using 'git merge-base drm-misc/drm-misc-next
drm-intel/drm-intel-next-queued'.


BR,
Jani.

The following changes since commit 3cacb2086e41bbdf4a43e494d47d05db356992b9:

  drm/mgag200: Add module parameter to pin all buffers at offset 0 (2020-01-07 11:53:19 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/topic/drm-warn-2020-01-22

for you to fetch changes up to dc1a73e50f9c63d4dd928df538082200467dc4b1:

  drm/print: introduce new struct drm_device based WARN* macros (2020-01-22 16:17:32 +0200)

----------------------------------------------------------------
struct drm_device based drm_WARN* macros

----------------------------------------------------------------
Pankaj Bharadiya (1):
      drm/print: introduce new struct drm_device based WARN* macros

 include/drm/drm_print.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
