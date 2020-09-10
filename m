Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F53B263EF1
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 09:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F3A46E2AF;
	Thu, 10 Sep 2020 07:48:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912D36E2AF;
 Thu, 10 Sep 2020 07:48:55 +0000 (UTC)
IronPort-SDR: kXeJYkgbkFBaYiTzKDeB1VivIJBB3nK8vepMMsO6VF6y7qMHa9z3DutONswVvqd3u4FcHV67Un
 7oiDI3YiJiOQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="159439185"
X-IronPort-AV: E=Sophos;i="5.76,412,1592895600"; d="scan'208";a="159439185"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 00:48:54 -0700
IronPort-SDR: 95UwI1dZ4/4wD1haq7DCFQmXQoukHAi8ipiWX/u31da6bdQ1E04T1kM79e/XRy50TB3rs457LF
 S2t4YJTGVc1w==
X-IronPort-AV: E=Sophos;i="5.76,412,1592895600"; d="scan'208";a="505750819"
Received: from nfhickey-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.81.64])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 00:48:49 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 10 Sep 2020 10:48:51 +0300
Message-ID: <875z8m2hss.fsf@intel.com>
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

drm-intel-fixes-2020-09-10:
drm/i915 fixes for v5.9-rc5:
- Fix regression leading to audio probe failure

BR,
Jani.

The following changes since commit f4d51dffc6c01a9e94650d95ce0104964f8ae822:

  Linux 5.9-rc4 (2020-09-06 17:11:40 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2020-09-10

for you to fetch changes up to 0c4c801b31f89cfc1b97207abbab687f43d8e258:

  drm/i915: fix regression leading to display audio probe failure on GLK (2020-09-08 14:38:46 +0300)

----------------------------------------------------------------
drm/i915 fixes for v5.9-rc5:
- Fix regression leading to audio probe failure

----------------------------------------------------------------
Kai Vehmanen (1):
      drm/i915: fix regression leading to display audio probe failure on GLK

 drivers/gpu/drm/i915/display/intel_display.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
