Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D46481216
	for <lists+dri-devel@lfdr.de>; Wed, 29 Dec 2021 12:44:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FBB010E3B8;
	Wed, 29 Dec 2021 11:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B9A10E231;
 Wed, 29 Dec 2021 11:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640778248; x=1672314248;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S5dlMS5Z4YLatrI3JHVBSrv2jaSHfAVhFAa6k7orLgE=;
 b=WjexKrjA5zjv26lhyxX3JyKbxRKKdoVGx+f2zs4M4y61ZfMhvXAuTuMO
 33VF6rgVDlelZFFMMXQQtvv/yLQtJD5WO1k6CHMG37l+h4OrhZbZSIOlU
 oZHuYttWJdikLEFFWFEfLpTDhE0hd5fpjlSDqMKKUrDPUVRaRuFrZWza4
 LSA/ZmS2zDIb3iXGcWkjhDYRP9WU+kCuUFBY+4nCU0P4oWEb0kC+dnwyp
 aj125vDmSU1qMVbLpcoWyldF4DN4WX92eRMfo56rsZVhPZrHM8/eXsLIz
 Ydjl8s5xdChduWEhkuNP2vXBvt7isTEde8gzBJwHPkl1w1rp068sDzhGX w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10211"; a="228336708"
X-IronPort-AV: E=Sophos;i="5.88,245,1635231600"; d="scan'208";a="228336708"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2021 03:44:07 -0800
X-IronPort-AV: E=Sophos;i="5.88,245,1635231600"; d="scan'208";a="523999416"
Received: from jcurran1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.10.44])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2021 03:44:03 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes for v5.17-rc1
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Wed, 29 Dec 2021 13:44:01 +0200
Message-ID: <87ee5vk54u.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Daniel -

A lone FBC fix for drm-next for the merge window.

BR,
Jani.

The following changes since commit 040bf2a9446f6ba267225d34dc4a9b14d11e5092:

  Merge tag 'drm-misc-next-fixes-2021-12-23' of git://anongit.freedesktop.o=
rg/drm/drm-misc into drm-next (2021-12-24 06:24:06 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-202=
1-12-29

for you to fetch changes up to c65fe9cbbfd61dbc12868f9ed4940c80fcb249e8:

  drm/i915/fbc: Remember to update FBC state even when not reallocating CFB=
 (2021-12-27 11:46:48 +0200)

----------------------------------------------------------------
drm/i915 fixes for the v5.17-rc1:
- Update FBC state even when not reallocating CFB

----------------------------------------------------------------
Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915/fbc: Remember to update FBC state even when not reallocating=
 CFB

 drivers/gpu/drm/i915/display/intel_fbc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

--=20
Jani Nikula, Intel Open Source Graphics Center
