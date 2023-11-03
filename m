Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C82217DFFFB
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 10:25:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0E810E525;
	Fri,  3 Nov 2023 09:25:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6FA10E525;
 Fri,  3 Nov 2023 09:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699003536; x=1730539536;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=wK0ki3PELq13IeWNsVt++35qR4r7ncgfOree5AObB8Y=;
 b=fOMYiVfVaMMERqw0ibWBQyNLzujc/rsDmrq3cLTHs4XLXc9m6Hobe/R7
 gLtoDuEPAXx31H+J5VsJ6a1iJ2Uq3nsZ5h9ow8R87AEvsBGVwNoYc+m23
 ZzcPdK94r6UFFT7/OWgU0Qa1DfswVugPyHaC9BQ1XhWldxDWPryNY/ZJX
 L3twiqr/j52dN58iWj5LV6pomTFeA4shOsHefIxnCqNExehSEsfMBmCP4
 Laj7NknRo0yc1EcMaB7ftXBRwPkDW/b7FVF9We9VvNbhrceH9/oNkiiE3
 FnAfw9TxMCv/Gjy3YvY/CXApHkSQnHVzMlHfZblIfGtwJKp4od0nX0VnX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="368258824"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="368258824"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 02:25:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="885177578"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="885177578"
Received: from bublath-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.34.179])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 02:25:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Animesh Manna <animesh.manna@intel.com>,
 intel-gfx@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v7 1/6] drm/panelreplay: dpcd register definition for
 panelreplay
In-Reply-To: <20231011110936.1851563-2-animesh.manna@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231011110936.1851563-1-animesh.manna@intel.com>
 <20231011110936.1851563-2-animesh.manna@intel.com>
Date: Fri, 03 Nov 2023 11:25:19 +0200
Message-ID: <87jzqz194w.fsf@intel.com>
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
 Arun R Murthy <arun.r.murthy@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 11 Oct 2023, Animesh Manna <animesh.manna@intel.com> wrote:
> Add DPCD register definition for discovering, enabling and
> checking status of panel replay of the sink.
>
> Cc: Jouni H=C3=B6gander <jouni.hogander@intel.com>
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
> Signed-off-by: Animesh Manna <animesh.manna@intel.com>

Maarten, Maxime, Thomas -

Ack for merging this via drm-intel-next?

Thanks,
Jani.

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
