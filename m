Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5101F681F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 14:47:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895C56E1BA;
	Thu, 11 Jun 2020 12:47:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC816E17E;
 Thu, 11 Jun 2020 12:47:52 +0000 (UTC)
IronPort-SDR: Wree4RUZrXwYxsQfoOn17EbpwWs4QXPRYoQXquWnyNeAjzP820mNVpobICx6UDEXhFdIYXpdul
 zTh92K3rV9hg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2020 05:47:52 -0700
IronPort-SDR: zpQgPbJxTTn7Z9zwrMkpwx5c0W6ObfN7d4JvVjnupWAKq6pZ1+OTaRP7TDx14ESoYbRM+5l/v8
 XPkU3ba591ng==
X-IronPort-AV: E=Sophos;i="5.73,499,1583222400"; d="scan'208";a="350174871"
Received: from ideak-desk.fi.intel.com ([10.237.72.183])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2020 05:47:49 -0700
Date: Thu, 11 Jun 2020 15:47:39 +0300
From: Imre Deak <imre.deak@intel.com>
To: Jose Souza <jose.souza@intel.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>
Subject: Re: =?utf-8?B?4pyTIEZpLkNJLklHVDogc3VjY2Vz?=
 =?utf-8?Q?s_for_series_starting_with_=5BRESEND=2Cv3=2C1=2F3?=
 =?utf-8?Q?=5D?= drm/i915/dp_mst: Fix disabling MST on a port (rev6)
Message-ID: <20200611124739.GD17512@ideak-desk.fi.intel.com>
References: <20200603211040.8190-1-imre.deak@intel.com>
 <159136523293.18507.17008252253062518394@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159136523293.18507.17008252253062518394@emeril.freedesktop.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: imre.deak@intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 05, 2020 at 01:53:52PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [RESEND,v3,1/3] drm/i915/dp_mst: Fix disabling MST on a port (rev6)
> URL   : https://patchwork.freedesktop.org/series/77969/
> State : success

Thanks for the reviews, pushed patch 1 to -dinq and patches 2,3 to
drm-misc-next.

> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_8590_full -> Patchwork_17882_full
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in Patchwork_17882_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_exec_whisper@basic-forked-all:
>     - shard-glk:          [PASS][1] -> [DMESG-WARN][2] ([i915#118] / [i915#95])
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-glk7/igt@gem_exec_whisper@basic-forked-all.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-glk2/igt@gem_exec_whisper@basic-forked-all.html
> 
>   * igt@gem_mmap_gtt@cpuset-big-copy-odd:
>     - shard-iclb:         [PASS][3] -> [DMESG-WARN][4] ([i915#1982])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-iclb6/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-iclb2/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
> 
>   * igt@gem_workarounds@suspend-resume:
>     - shard-apl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-apl2/igt@gem_workarounds@suspend-resume.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-apl1/igt@gem_workarounds@suspend-resume.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-180:
>     - shard-skl:          [PASS][7] -> [DMESG-WARN][8] ([i915#1982]) +9 similar issues
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-skl6/igt@kms_big_fb@linear-32bpp-rotate-180.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-skl5/igt@kms_big_fb@linear-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-180:
>     - shard-glk:          [PASS][9] -> [DMESG-FAIL][10] ([i915#118] / [i915#95]) +1 similar issue
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-glk2/igt@kms_big_fb@linear-64bpp-rotate-180.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
>     - shard-glk:          [PASS][11] -> [DMESG-WARN][12] ([i915#1982])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-glk5/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-glk4/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
> 
>   * igt@kms_cursor_crc@pipe-c-cursor-256x85-offscreen:
>     - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#95]) +17 similar issues
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-256x85-offscreen.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-256x85-offscreen.html
> 
>   * igt@kms_cursor_crc@pipe-c-cursor-suspend:
>     - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180]) +4 similar issues
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
> 
>   * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled:
>     - shard-snb:          [PASS][17] -> [TIMEOUT][18] ([i915#1958])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-snb6/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-snb1/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
>     - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#93] / [i915#95])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
>     - shard-skl:          [PASS][21] -> [FAIL][22] ([i915#49])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-skl9/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-skl9/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html
> 
>   * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-min:
>     - shard-skl:          [PASS][23] -> [FAIL][24] ([fdo#108145] / [i915#265]) +1 similar issue
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-skl6/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-min.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-skl2/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-min.html
> 
>   * igt@kms_plane_lowres@pipe-a-tiling-x:
>     - shard-snb:          [PASS][25] -> [SKIP][26] ([fdo#109271]) +1 similar issue
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-snb2/igt@kms_plane_lowres@pipe-a-tiling-x.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-snb1/igt@kms_plane_lowres@pipe-a-tiling-x.html
> 
>   * igt@kms_psr@psr2_cursor_blt:
>     - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109441]) +3 similar issues
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-iclb4/igt@kms_psr@psr2_cursor_blt.html
> 
>   * igt@kms_universal_plane@universal-plane-gen9-features-pipe-c:
>     - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#1982])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-kbl3/igt@kms_universal_plane@universal-plane-gen9-features-pipe-c.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-kbl4/igt@kms_universal_plane@universal-plane-gen9-features-pipe-c.html
> 
>   * igt@syncobj_wait@invalid-multi-wait-unsubmitted-submitted:
>     - shard-tglb:         [PASS][31] -> [DMESG-WARN][32] ([i915#402])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-tglb6/igt@syncobj_wait@invalid-multi-wait-unsubmitted-submitted.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-tglb7/igt@syncobj_wait@invalid-multi-wait-unsubmitted-submitted.html
> 
>   
> #### Possible fixes ####
> 
>   * {igt@gem_ctx_isolation@preservation-s3@rcs0}:
>     - shard-apl:          [DMESG-WARN][33] ([i915#180]) -> [PASS][34] +2 similar issues
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-apl2/igt@gem_ctx_isolation@preservation-s3@rcs0.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-apl1/igt@gem_ctx_isolation@preservation-s3@rcs0.html
> 
>   * igt@gem_exec_whisper@basic-queues-forked-all:
>     - shard-glk:          [DMESG-WARN][35] ([i915#118] / [i915#95]) -> [PASS][36] +1 similar issue
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-glk9/igt@gem_exec_whisper@basic-queues-forked-all.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-glk9/igt@gem_exec_whisper@basic-queues-forked-all.html
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-kbl:          [DMESG-WARN][37] ([i915#1436] / [i915#716]) -> [PASS][38]
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-kbl1/igt@gen9_exec_parse@allowed-all.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-kbl3/igt@gen9_exec_parse@allowed-all.html
> 
>   * igt@i915_suspend@debugfs-reader:
>     - shard-kbl:          [INCOMPLETE][39] ([i915#155]) -> [PASS][40]
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-kbl2/igt@i915_suspend@debugfs-reader.html
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-kbl6/igt@i915_suspend@debugfs-reader.html
> 
>   * igt@kms_color@pipe-c-ctm-red-to-blue:
>     - shard-kbl:          [DMESG-WARN][41] ([i915#93] / [i915#95]) -> [PASS][42]
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-kbl7/igt@kms_color@pipe-c-ctm-red-to-blue.html
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-kbl7/igt@kms_color@pipe-c-ctm-red-to-blue.html
> 
>   * igt@kms_color@pipe-d-ctm-0-5:
>     - shard-tglb:         [DMESG-WARN][43] ([i915#1149] / [i915#402]) -> [PASS][44]
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-tglb2/igt@kms_color@pipe-d-ctm-0-5.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-tglb1/igt@kms_color@pipe-d-ctm-0-5.html
> 
>   * igt@kms_cursor_legacy@all-pipes-torture-move:
>     - shard-skl:          [DMESG-WARN][45] ([i915#128]) -> [PASS][46]
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-skl10/igt@kms_cursor_legacy@all-pipes-torture-move.html
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-skl3/igt@kms_cursor_legacy@all-pipes-torture-move.html
> 
>   * {igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2}:
>     - shard-glk:          [DMESG-WARN][47] ([i915#1982]) -> [PASS][48]
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-glk6/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-glk8/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html
> 
>   * igt@kms_flip_tiling@flip-x-tiled:
>     - shard-apl:          [DMESG-WARN][49] ([i915#95]) -> [PASS][50] +26 similar issues
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-apl7/igt@kms_flip_tiling@flip-x-tiled.html
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-apl3/igt@kms_flip_tiling@flip-x-tiled.html
> 
>   * igt@kms_hdr@bpc-switch-suspend:
>     - shard-skl:          [FAIL][51] ([i915#1188]) -> [PASS][52]
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-skl10/igt@kms_hdr@bpc-switch-suspend.html
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-skl3/igt@kms_hdr@bpc-switch-suspend.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
>     - shard-kbl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54] +3 similar issues
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-pipe-c-planes:
>     - shard-skl:          [DMESG-WARN][55] ([i915#1982]) -> [PASS][56] +2 similar issues
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-skl6/igt@kms_plane@plane-panning-bottom-right-pipe-c-planes.html
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-skl5/igt@kms_plane@plane-panning-bottom-right-pipe-c-planes.html
> 
>   * igt@kms_psr@psr2_primary_mmap_cpu:
>     - shard-iclb:         [SKIP][57] ([fdo#109441]) -> [PASS][58] +2 similar issues
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
> 
>   * igt@kms_setmode@basic:
>     - shard-apl:          [FAIL][59] ([i915#31]) -> [PASS][60]
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-apl6/igt@kms_setmode@basic.html
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-apl3/igt@kms_setmode@basic.html
>     - shard-kbl:          [FAIL][61] ([i915#31]) -> [PASS][62]
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-kbl6/igt@kms_setmode@basic.html
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-kbl3/igt@kms_setmode@basic.html
> 
>   * {igt@perf@polling-parameterized}:
>     - shard-hsw:          [FAIL][63] ([i915#1542]) -> [PASS][64]
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-hsw6/igt@perf@polling-parameterized.html
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-hsw5/igt@perf@polling-parameterized.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_pm_dc@dc3co-vpb-simulation:
>     - shard-snb:          [SKIP][65] ([fdo#109271]) -> [INCOMPLETE][66] ([i915#82]) +1 similar issue
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-snb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-snb5/igt@i915_pm_dc@dc3co-vpb-simulation.html
>     - shard-iclb:         [SKIP][67] ([i915#658]) -> [SKIP][68] ([i915#588])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-iclb6/igt@i915_pm_dc@dc3co-vpb-simulation.html
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-apl:          [FAIL][69] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][70] ([i915#1319] / [i915#1635])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-apl6/igt@kms_content_protection@atomic.html
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-apl3/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-kbl:          [DMESG-FAIL][71] ([fdo#110321]) -> [TIMEOUT][72] ([i915#1319] / [i915#1958])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-kbl3/igt@kms_content_protection@legacy.html
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-kbl4/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@lic:
>     - shard-apl:          [DMESG-FAIL][73] ([fdo#110321] / [i915#95]) -> [TIMEOUT][74] ([i915#1319] / [i915#1635]) +1 similar issue
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-apl2/igt@kms_content_protection@lic.html
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-apl1/igt@kms_content_protection@lic.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-kbl:          [DMESG-FAIL][75] ([fdo#110321] / [i915#95]) -> [TIMEOUT][76] ([i915#1319])
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-kbl2/igt@kms_content_protection@srm.html
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-kbl3/igt@kms_content_protection@srm.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-kbl:          [DMESG-WARN][77] ([i915#180] / [i915#93] / [i915#95]) -> [DMESG-WARN][78] ([i915#93] / [i915#95])
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
>     - shard-apl:          [DMESG-WARN][79] ([i915#180] / [i915#95]) -> [DMESG-WARN][80] ([i915#95])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-apl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-apl8/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms_plane_alpha_blend@pipe-b-coverage-7efc:
>     - shard-skl:          [DMESG-WARN][81] ([i915#1982]) -> [DMESG-FAIL][82] ([fdo#108145] / [i915#1982])
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-skl2/igt@kms_plane_alpha_blend@pipe-b-coverage-7efc.html
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-skl2/igt@kms_plane_alpha_blend@pipe-b-coverage-7efc.html
> 
>   * igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping:
>     - shard-snb:          [SKIP][83] ([fdo#109271]) -> [TIMEOUT][84] ([i915#1958]) +1 similar issue
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8590/shard-snb6/igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping.html
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/shard-snb1/igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>   [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
>   [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
>   [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
>   [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
>   [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
>   [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
>   [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
>   [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
>   [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
>   [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#1928]: https://gitlab.freedesktop.org/drm/intel/issues/1928
>   [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
>   [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
>   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>   [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
>   [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
>   [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
>   [i915#46]: https://gitlab.freedesktop.org/drm/intel/issues/46
>   [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
>   [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
>   [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
>   [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
>   [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
>   [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
> 
> 
> Participating hosts (11 -> 11)
> ------------------------------
> 
>   No changes in participating hosts
> 
> 
> Build changes
> -------------
> 
>   * Linux: CI_DRM_8590 -> Patchwork_17882
> 
>   CI-20190529: 20190529
>   CI_DRM_8590: 91c6f0274b54c89679cd23f6fc65e9fe5922971f @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGT_5695: 53e8c878a6fb5708e63c99403691e8960b86ea9c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
>   Patchwork_17882: 23fe5e3ae83585e3d4ad9ecdfea368dd42ff6dfb @ git://anongit.freedesktop.org/gfx-ci/linux
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17882/index.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
