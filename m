Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A6228F835
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 20:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A846E04E;
	Thu, 15 Oct 2020 18:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 088EE6E04E;
 Thu, 15 Oct 2020 18:13:08 +0000 (UTC)
IronPort-SDR: l6tkwMMeKIKxJtpJxDeFbSxoICpxPJevfJqof8WKs8Wkh1ZFmgrPqZ48yMQAJpzeqx9hXN5gvV
 032Viu5oNC+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9775"; a="166538713"
X-IronPort-AV: E=Sophos;i="5.77,379,1596524400"; d="scan'208";a="166538713"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2020 11:13:08 -0700
IronPort-SDR: +bj52lYTgWY1yAzANFCeLhywHSXyl6qHbTx+LEUQsrcH7bowuPwqNSn9W5lMC9qwIYoqMoVfzh
 NvjlzAsfGkgA==
X-IronPort-AV: E=Sophos;i="5.77,379,1596524400"; d="scan'208";a="464392747"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.201])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2020 11:13:08 -0700
Date: Thu, 15 Oct 2020 14:14:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <20201015181453.GA2905280@intel.com>
MIME-Version: 1.0
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

here goes couple display fixes for this last round of fixes before -rc1

drm-intel-next-fixes-2020-10-15:
- Set all unused color plane offsets to ~0xfff again (Ville)
- Fix TGL DKL PHY DP vswing handling (Ville)
The following changes since commit c60b93cd4862d108214a14e655358ea714d7a12a:

  drm/i915: Avoid mixing integer types during batch copies (2020-09-30 14:2=
4:54 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-202=
0-10-15

for you to fetch changes up to 214bba50616f65264dfc30d095daef3ab7500f52:

  drm/i915: Set all unused color plane offsets to ~0xfff again (2020-10-12 =
14:23:22 -0400)

----------------------------------------------------------------
- Set all unused color plane offsets to ~0xfff again (Ville)
- Fix TGL DKL PHY DP vswing handling (Ville)

----------------------------------------------------------------
Ville Syrj=E4l=E4 (2):
      drm/i915: Fix TGL DKL PHY DP vswing handling
      drm/i915: Set all unused color plane offsets to ~0xfff again

 drivers/gpu/drm/i915/display/intel_ddi.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_display.c | 17 +++++------------
 2 files changed, 6 insertions(+), 13 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
