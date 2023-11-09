Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A88C7E6AF9
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 14:07:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79CC710E20A;
	Thu,  9 Nov 2023 13:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0053B897FD;
 Thu,  9 Nov 2023 13:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699535251; x=1731071251;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=MV/LBNRocjn0Ihe7CbSO7WVNI/djzRaXdqZKrienFTs=;
 b=Jf2Id6wJrupoyaN1VAJg4hdpyJ6Gmn8aAQ0cYX017U+dRnDxesFll17B
 ODJLMOXosg0FyMrKO0PWJpGVq/tbeSoUdxyFLyjMcOzjlUOmDBpEYQyfF
 wc1y2NH20Xko05lM0Jq/tlONnx1HuVYhUK0wNCOmrP1h94nD5SfJaXlbt
 7PN4Dv3FNSkY+jlWECLAQ04FJN3VB/6anXxujFFP0Rxej+Mwz1CgYc4I+
 1IAojzi7Z4NPFCUkI/bAeudXsr+mccrL4m4ZdNQsVmdj1dtIfADAMEnqA
 jXhbroxbvmNBqR//oDiJ3pQFhAqvcvHMoWjTBNQ1C3IZNQEX6ae7+QXA2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="3008554"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="3008554"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 05:07:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="798314514"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="798314514"
Received: from unknown (HELO localhost) ([10.237.66.162])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 05:07:27 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Animesh Manna <animesh.manna@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v9 1/6] drm/panelreplay: dpcd register definition for
 panelreplay
In-Reply-To: <20231108072303.3414118-2-animesh.manna@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231108072303.3414118-1-animesh.manna@intel.com>
 <20231108072303.3414118-2-animesh.manna@intel.com>
Date: Thu, 09 Nov 2023 15:07:24 +0200
Message-ID: <87wmurvzw3.fsf@intel.com>
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
Cc: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 08 Nov 2023, Animesh Manna <animesh.manna@intel.com> wrote:
> Add DPCD register definition for discovering, enabling and
> checking status of panel replay of the sink.
>
> Cc: Jouni H=C3=B6gander <jouni.hogander@intel.com>
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
> Signed-off-by: Animesh Manna <animesh.manna@intel.com>

You got the ack, please keep track of it.

https://lore.kernel.org/r/elcebygxs432bcj7oez7ndlfvb3lru7m7yznyqp2ei4ocjkvx=
p@23lf2rh45fmt

> ---
>  include/drm/display/drm_dp.h | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index e69cece404b3..fc42b622ef32 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -543,6 +543,10 @@
>  /* DFP Capability Extension */
>  #define DP_DFP_CAPABILITY_EXTENSION_SUPPORT	0x0a3	/* 2.0 */
>=20=20
> +#define DP_PANEL_REPLAY_CAP                 0x0b0  /* DP 2.0 */
> +# define DP_PANEL_REPLAY_SUPPORT            (1 << 0)
> +# define DP_PANEL_REPLAY_SU_SUPPORT         (1 << 1)
> +
>  /* Link Configuration */
>  #define	DP_LINK_BW_SET		            0x100
>  # define DP_LINK_RATE_TABLE		    0x00    /* eDP 1.4 */
> @@ -716,6 +720,13 @@
>  #define DP_BRANCH_DEVICE_CTRL		    0x1a1
>  # define DP_BRANCH_DEVICE_IRQ_HPD	    (1 << 0)
>=20=20
> +#define PANEL_REPLAY_CONFIG                             0x1b0  /* DP 2.0=
 */
> +# define DP_PANEL_REPLAY_ENABLE                         (1 << 0)
> +# define DP_PANEL_REPLAY_UNRECOVERABLE_ERROR_EN         (1 << 3)
> +# define DP_PANEL_REPLAY_RFB_STORAGE_ERROR_EN           (1 << 4)
> +# define DP_PANEL_REPLAY_ACTIVE_FRAME_CRC_ERROR_EN      (1 << 5)
> +# define DP_PANEL_REPLAY_SU_ENABLE                      (1 << 6)
> +
>  #define DP_PAYLOAD_ALLOCATE_SET		    0x1c0
>  #define DP_PAYLOAD_ALLOCATE_START_TIME_SLOT 0x1c1
>  #define DP_PAYLOAD_ALLOCATE_TIME_SLOT_COUNT 0x1c2
> @@ -1105,6 +1116,18 @@
>  #define DP_LANE_ALIGN_STATUS_UPDATED_ESI       0x200e /* status same as =
0x204 */
>  #define DP_SINK_STATUS_ESI                     0x200f /* status same as =
0x205 */
>=20=20
> +#define DP_PANEL_REPLAY_ERROR_STATUS                   0x2020  /* DP 2.1=
*/
> +# define DP_PANEL_REPLAY_LINK_CRC_ERROR                (1 << 0)
> +# define DP_PANEL_REPLAY_RFB_STORAGE_ERROR             (1 << 1)
> +# define DP_PANEL_REPLAY_VSC_SDP_UNCORRECTABLE_ERROR   (1 << 2)
> +
> +#define DP_SINK_DEVICE_PR_AND_FRAME_LOCK_STATUS        0x2022  /* DP 2.1=
 */
> +# define DP_SINK_DEVICE_PANEL_REPLAY_STATUS_MASK       (7 << 0)
> +# define DP_SINK_FRAME_LOCKED_SHIFT                    3
> +# define DP_SINK_FRAME_LOCKED_MASK                     (3 << 3)
> +# define DP_SINK_FRAME_LOCKED_STATUS_VALID_SHIFT       5
> +# define DP_SINK_FRAME_LOCKED_STATUS_VALID_MASK        (1 << 5)
> +
>  /* Extended Receiver Capability: See DP_DPCD_REV for definitions */
>  #define DP_DP13_DPCD_REV                    0x2200

--=20
Jani Nikula, Intel
