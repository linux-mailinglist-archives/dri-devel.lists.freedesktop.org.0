Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 471FA25D991
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 15:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803AD6E11F;
	Fri,  4 Sep 2020 13:23:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123896E11F;
 Fri,  4 Sep 2020 13:23:27 +0000 (UTC)
IronPort-SDR: cEFil7QJmpiY3vteO85TWPQJ5WNMOvmaq6fhSzQZErD+/lYrY/YBBsDNKPQKL2ffI6L5718nnB
 7uPHU4oWJVLQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="221948883"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="221948883"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 06:23:26 -0700
IronPort-SDR: qQheL7zfJYrOyLT4fdkDSR4R1NIzlOzf30Mg4ODmUT8PMPkE/Kob8WNKskmuDTkCf4gB1Oo7Tk
 35MGGaRFq0EA==
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="502921427"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.201])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 06:23:25 -0700
Date: Fri, 4 Sep 2020 09:24:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PULL] topic/nouveau-i915-dp-helpers-and-cleanup
Message-ID: <20200904132434.GA586737@intel.com>
References: <11e59ebdea7ee4f46803a21fe9b21443d2b9c401.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <11e59ebdea7ee4f46803a21fe9b21443d2b9c401.camel@redhat.com>
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
Cc: dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 31, 2020 at 07:38:57PM -0400, Lyude Paul wrote:
> topic/nouveau-i915-dp-helpers-and-cleanup-2020-08-31-1:
> UAPI Changes:
> 
> None
> 
> Cross-subsystem Changes:
> 
> * Moves a bunch of miscellaneous DP code from the i915 driver into a set
>   of shared DRM DP helpers
> 
> Core Changes:
> 
> * New DRM DP helpers (see above)
> 
> Driver Changes:
> 
> * Implements usage of the aforementioned DP helpers in the nouveau
>   driver, along with some other various HPD related cleanup for nouveau

was this picked-up on the nouveau side already?
whenever that happens, please ping me so I can pull this to dinq.

But a reminder that it has my ack to go to drm-misc or only to nouveau
directly.

> The following changes since commit bfacb84993eb173c0ab53ca4dd6180f76f4dc176:
> 
>   drm: virtio: fix kconfig dependency warning (2020-08-31 08:55:02 +0200)
> 
> are available in the Git repository at:
> 
>   git://anongit.freedesktop.org/drm/drm-misc tags/topic/nouveau-i915-dp-helpers-and-cleanup-2020-08-31-1
> 
> for you to fetch changes up to 79416e97dda0118b137302575a70a14259a27d7d:
> 
>   drm/nouveau/kms: Start using drm_dp_read_dpcd_caps() (2020-08-31 19:10:09 -0400)
> 
> ----------------------------------------------------------------
> UAPI Changes:
> 
> None
> 
> Cross-subsystem Changes:
> 
> * Moves a bunch of miscellaneous DP code from the i915 driver into a set
>   of shared DRM DP helpers
> 
> Core Changes:
> 
> * New DRM DP helpers (see above)
> 
> Driver Changes:
> 
> * Implements usage of the aforementioned DP helpers in the nouveau
>   driver, along with some other various HPD related cleanup for nouveau
> 
> ----------------------------------------------------------------
> Lyude Paul (20):
>       drm/nouveau/kms: Fix some indenting in nouveau_dp_detect()
>       drm/nouveau/kms/nv50-: Remove open-coded drm_dp_read_desc()
>       drm/nouveau/kms/nv50-: Just use drm_dp_dpcd_read() in nouveau_dp.c
>       drm/nouveau/kms/nv50-: Use macros for DP registers in nouveau_dp.c
>       drm/nouveau/kms: Don't clear DP_MST_CTRL DPCD in nv50_mstm_new()
>       drm/nouveau/kms: Search for encoders' connectors properly
>       drm/nouveau/kms/nv50-: Use drm_dp_dpcd_(readb|writeb)() in nv50_sor_disable()
>       drm/nouveau/kms/nv50-: Refactor and cleanup DP HPD handling
>       drm/i915/dp: Extract drm_dp_read_mst_cap()
>       drm/nouveau/kms: Use new drm_dp_read_mst_cap() helper for checking MST caps
>       drm/nouveau/kms: Move drm_dp_cec_unset_edid() into nouveau_connector_detect()
>       drm/nouveau/kms: Only use hpd_work for reprobing in HPD paths
>       drm/i915/dp: Extract drm_dp_read_downstream_info()
>       drm/nouveau/kms/nv50-: Use downstream DP clock limits for mode validation
>       drm/i915/dp: Extract drm_dp_read_sink_count_cap()
>       drm/i915/dp: Extract drm_dp_read_sink_count()
>       drm/nouveau/kms/nv50-: Add support for DP_SINK_COUNT
>       drm/nouveau/kms: Don't change EDID when it hasn't actually changed
>       drm/i915/dp: Extract drm_dp_read_dpcd_caps()
>       drm/nouveau/kms: Start using drm_dp_read_dpcd_caps()
> 
>  drivers/gpu/drm/drm_dp_helper.c             | 187 ++++++++++++++++-
>  drivers/gpu/drm/drm_dp_mst_topology.c       |  22 ++
>  drivers/gpu/drm/i915/display/intel_dp.c     | 124 +++--------
>  drivers/gpu/drm/i915/display/intel_dp.h     |   1 -
>  drivers/gpu/drm/i915/display/intel_lspcon.c |   2 +-
>  drivers/gpu/drm/nouveau/dispnv04/dac.c      |   2 +-
>  drivers/gpu/drm/nouveau/dispnv04/dfp.c      |   7 +-
>  drivers/gpu/drm/nouveau/dispnv04/disp.c     |  24 ++-
>  drivers/gpu/drm/nouveau/dispnv04/disp.h     |   4 +
>  drivers/gpu/drm/nouveau/dispnv04/tvnv04.c   |   2 +-
>  drivers/gpu/drm/nouveau/dispnv04/tvnv17.c   |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/disp.c     | 305 ++++++++++++++++------------
>  drivers/gpu/drm/nouveau/nouveau_connector.c | 132 +++++-------
>  drivers/gpu/drm/nouveau/nouveau_connector.h |   1 +
>  drivers/gpu/drm/nouveau/nouveau_display.c   |  72 ++++++-
>  drivers/gpu/drm/nouveau/nouveau_display.h   |   3 +-
>  drivers/gpu/drm/nouveau/nouveau_dp.c        | 210 +++++++++++++++----
>  drivers/gpu/drm/nouveau/nouveau_drm.c       |   4 +-
>  drivers/gpu/drm/nouveau/nouveau_drv.h       |   2 +
>  drivers/gpu/drm/nouveau/nouveau_encoder.h   |  48 ++++-
>  include/drm/drm_dp_helper.h                 |  15 +-
>  include/drm/drm_dp_mst_helper.h             |   3 +-
>  22 files changed, 779 insertions(+), 393 deletions(-)
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
