Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F4C18ADD2
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 09:00:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2E86E103;
	Thu, 19 Mar 2020 07:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8349F6E0F5;
 Thu, 19 Mar 2020 07:59:54 +0000 (UTC)
IronPort-SDR: rPXNFPT1GyLuELfaNotUIeSXxe3/+Hj/EL5mCIJYezhWsCDayMxkgNKvMZdl3N2rfi308LOoB2
 eiLJH+bGfX3Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 00:59:53 -0700
IronPort-SDR: LiewsrjelXGov4P94MUI6CLumjxF1AjLC3DXhGg7otOlBlQwll21LFqDy9jPwjS7RZXuVKPXLY
 QQ7yXIXmXyiQ==
X-IronPort-AV: E=Sophos;i="5.70,570,1574150400"; d="scan'208";a="418258442"
Received: from jnavarro-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.249.32.36])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 00:59:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 19 Mar 2020 09:59:49 +0200
Message-ID: <877dzgepvu.fsf@intel.com>
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
Cc: , dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Daniel -

Nothing spectacular.


drm-intel-fixes-2020-03-19:
drm/i915 fixes for v5.6-rc7:
- Track active elements during dequeue
- Fix failure to handle all MCR ranges
- Revert unnecessary workaround

BR,
Jani.

The following changes since commit fb33c6510d5595144d585aa194d377cf74d31911:

  Linux 5.6-rc6 (2020-03-15 15:01:23 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2020-03-19

for you to fetch changes up to fe8b7085cac3b0db03cdbb26d9309bc27325df0a:

  drm/i915: Handle all MCR ranges (2020-03-16 12:17:00 +0200)

----------------------------------------------------------------
drm/i915 fixes for v5.6-rc7:
- Track active elements during dequeue
- Fix failure to handle all MCR ranges
- Revert unnecessary workaround

----------------------------------------------------------------
Caz Yokoyama (1):
      Revert "drm/i915/tgl: Add extra hdc flush workaround"

Chris Wilson (1):
      drm/i915/execlists: Track active elements during dequeue

Matt Roper (1):
      drm/i915: Handle all MCR ranges

 drivers/gpu/drm/i915/gt/intel_lrc.c         | 52 +++++++----------------------
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 25 ++++++++++++--
 2 files changed, 34 insertions(+), 43 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
