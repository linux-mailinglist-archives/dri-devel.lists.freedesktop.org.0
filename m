Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 531353609E3
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 14:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5977C6E505;
	Thu, 15 Apr 2021 12:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76256E504;
 Thu, 15 Apr 2021 12:59:33 +0000 (UTC)
IronPort-SDR: cjefKX4AOK9ElzSGqvu/zj577Zqhrfd3HIZ38wtqC3mN4ZZbrk6w4nRv2N9V9y+PTeI8rtI5l2
 4+6QvKnvVcDw==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="280159586"
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="280159586"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 05:59:15 -0700
IronPort-SDR: YCqPSg8wcaXFJ3rJLwzRlZkuIHat5TcOyq9TJUbqU7jPqfoEecEMInuDRtT+igrylGRK5OYN23
 hHvwm1a4lB2w==
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="418732658"
Received: from rkapur-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.212.63.86])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 05:59:13 -0700
Date: Thu, 15 Apr 2021 08:59:11 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <YHg4nz/ndzDRmPjd@intel.com>
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

Here goes drm-intel-fixes-2021-04-15:

Display panel & power related fixes:

- Backlight fix (Lyude)
- Display watermark fix (Ville)
- VLV panel power fix (Hans)

Thanks,
Rodrigo.

The following changes since commit d434405aaab7d0ebc516b68a8fc4100922d7f5ef:

  Linux 5.12-rc7 (2021-04-11 15:16:13 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2021-04-=
15

for you to fetch changes up to aee6f25e9c911323aa89a200e1bb160c1613ed3d:

  drm/i915/display/vlv_dsi: Do not skip panel_pwr_cycle_delay when disablin=
g the panel (2021-04-12 08:00:33 -0400)

----------------------------------------------------------------
Display panel & power related fixes:

- Backlight fix (Lyude)
- Display watermark fix (Ville)
- VLV panel power fix (Hans)

----------------------------------------------------------------
Hans de Goede (1):
      drm/i915/display/vlv_dsi: Do not skip panel_pwr_cycle_delay when disa=
bling the panel

Lyude Paul (1):
      drm/i915/dpcd_bl: Don't try vesa interface unless specified by VBT

Ville Syrj=E4l=E4 (1):
      drm/i915: Don't zero out the Y plane's watermarks

 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 1 -
 drivers/gpu/drm/i915/display/vlv_dsi.c                | 4 ++--
 drivers/gpu/drm/i915/intel_pm.c                       | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
