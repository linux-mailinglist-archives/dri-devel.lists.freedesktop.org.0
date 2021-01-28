Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 273D2307EC0
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 20:39:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A1B6E9F2;
	Thu, 28 Jan 2021 19:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD216E9E2;
 Thu, 28 Jan 2021 19:38:53 +0000 (UTC)
IronPort-SDR: pEspU6h5NyjDVJ9V13KEVEP6ONtSJOijjhfSIBptNF49sIgwzvNi/tmAQa5WoT0tKBkfge3Nty
 EQ5jul10DD8A==
X-IronPort-AV: E=McAfee;i="6000,8403,9878"; a="199136442"
X-IronPort-AV: E=Sophos;i="5.79,383,1602572400"; d="scan'208";a="199136442"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2021 11:38:52 -0800
IronPort-SDR: HMh5TEyzJcGBm36eISjaWWELKujlPOdQSTG4P378nGWfAsSqUDIrjROS8FilT7PC4ks5LQ9t+T
 RoNdUwo0D66A==
X-IronPort-AV: E=Sophos;i="5.79,383,1602572400"; d="scan'208";a="388975982"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2021 11:38:50 -0800
Date: Thu, 28 Jan 2021 21:38:47 +0200
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: =?utf-8?B?4pyTIEZpLkNJLklHVDogc3VjY2Vz?=
 =?utf-8?Q?s_for_series_startin?= =?utf-8?Q?g?= with [1/2] drm/dp/mst: Export
 drm_dp_get_vc_payload_bw()
Message-ID: <20210128193847.GA150458@ideak-desk.fi.intel.com>
References: <20210125173636.1733812-1-imre.deak@intel.com>
 <161162448941.9812.557941677738544923@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <161162448941.9812.557941677738544923@emeril.freedesktop.org>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 26, 2021 at 01:28:09AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [1/2] drm/dp/mst: Export drm_dp_get_vc_payload_bw()
> URL   : https://patchwork.freedesktop.org/series/86267/
> State : success

Patchset pushed to -din with the docbook fix, thanks for the review.

> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_9680_full -> Patchwork_19491_full
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
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_9680_full and Patchwork_19491_full:
> 
> ### New IGT tests (1749) ###
> 
>   * igt@core_auth@many-magics:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.15, 0.85] s
> 
>   * igt@core_getclient:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.07, 0.18] s
> 
>   * igt@core_getstats:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.07, 0.19] s
> 
>   * igt@core_getversion:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.07, 0.18] s
> 
>   * igt@core_setmaster_vs_auth:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.06, 0.18] s
> 
>   * igt@debugfs_test@read_all_entries_display_off:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.07, 1.13] s
> 
>   * igt@debugfs_test@read_all_entries_display_on:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@drm_import_export@flink:
>     - Statuses : 7 pass(s)
>     - Exec time: [10.74, 10.75] s
> 
>   * igt@drm_import_export@import-close-race-flink:
>     - Statuses : 7 pass(s)
>     - Exec time: [10.74, 10.75] s
> 
>   * igt@drm_import_export@import-close-race-prime:
>     - Statuses : 7 pass(s)
>     - Exec time: [10.74] s
> 
>   * igt@drm_import_export@prime:
>     - Statuses : 7 pass(s)
>     - Exec time: [10.74] s
> 
>   * igt@drm_read@empty-block:
>     - Statuses : 2 pass(s)
>     - Exec time: [1.0] s
> 
>   * igt@drm_read@empty-nonblock:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@drm_read@fault-buffer:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@drm_read@invalid-buffer:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@drm_read@short-buffer-block:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@drm_read@short-buffer-nonblock:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@dumb_buffer@create-clear:
>     - Statuses : 7 pass(s)
>     - Exec time: [37.43, 47.67] s
> 
>   * igt@dumb_buffer@create-valid-dumb:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@dumb_buffer@invalid-bpp:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@dumb_buffer@map-invalid-size:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@dumb_buffer@map-uaf:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.02, 0.10] s
> 
>   * igt@dumb_buffer@map-valid:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@gem_bad_reloc@negative-reloc-bltcopy:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.36, 4.37] s
> 
>   * igt@gem_blits@basic:
>     - Statuses : 7 pass(s)
>     - Exec time: [1.44, 14.28] s
> 
>   * igt@gem_busy@close-race:
>     - Statuses : 7 pass(s)
>     - Exec time: [21.71, 22.45] s
> 
>   * igt@gem_caching@read-writes:
>     - Statuses : 7 pass(s)
>     - Exec time: [4.43, 22.74] s
> 
>   * igt@gem_caching@reads:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.66, 5.61] s
> 
>   * igt@gem_caching@writes:
>     - Statuses : 7 pass(s)
>     - Exec time: [2.31, 13.42] s
> 
>   * igt@gem_close@basic:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@gem_close@many-handles-one-vma:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.02, 0.10] s
> 
>   * igt@gem_create@create-invalid-size:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@gem_create@create-valid-nonaligned:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@gem_ctx_bad_destroy@double-destroy:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@gem_ctx_bad_destroy@invalid-ctx:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@gem_ctx_bad_destroy@invalid-default-ctx:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@gem_ctx_bad_destroy@invalid-pad:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@gem_ctx_exec@basic-invalid-context:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@gem_ctx_freq@sysfs:
>     - Statuses : 7 pass(s)
>     - Exec time: [4.80, 4.99] s
> 
>   * igt@gem_ctx_param@basic:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@gem_ctx_param@basic-default:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@gem_ctx_param@get-priority-new-ctx:
>     - Statuses : 5 pass(s) 2 skip(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@gem_ctx_param@invalid-ctx-get:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@gem_ctx_param@invalid-ctx-set:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@gem_ctx_param@invalid-param-get:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@gem_ctx_param@invalid-param-set:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@gem_ctx_param@invalid-size-get:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@gem_ctx_param@invalid-size-set:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@gem_ctx_param@non-root-set:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.01, 0.04] s
> 
>   * igt@gem_ctx_param@non-root-set-no-zeromap:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.01, 0.04] s
> 
>   * igt@gem_ctx_param@root-set:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@gem_ctx_param@root-set-no-zeromap-disabled:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@gem_ctx_param@root-set-no-zeromap-enabled:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@gem_ctx_param@set-priority-invalid-size:
>     - Statuses : 5 pass(s) 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@gem_ctx_param@set-priority-not-supported:
>     - Statuses : 2 pass(s) 5 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@gem_ctx_param@set-priority-range:
>     - Statuses : 5 pass(s) 2 skip(s)
>     - Exec time: [0.0, 0.06] s
> 
>   * igt@gem_eio@banned:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.05, 0.43] s
> 
>   * igt@gem_eio@execbuf:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.02, 0.07] s
> 
>   * igt@gem_eio@hibernate:
>     - Statuses : 7 pass(s)
>     - Exec time: [12.60, 18.97] s
> 
>   * igt@gem_eio@in-flight-10ms:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.46, 2.39] s
> 
>   * igt@gem_eio@in-flight-1us:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.38, 2.63] s
> 
>   * igt@gem_eio@in-flight-contexts-10ms:
>     - Statuses : 7 pass(s)
>     - Exec time: [1.07, 36.51] s
> 
>   * igt@gem_eio@in-flight-contexts-1us:
>     - Statuses : 7 pass(s)
>     - Exec time: [1.11, 36.51] s
> 
>   * igt@gem_eio@in-flight-contexts-immediate:
>     - Statuses : 6 pass(s)
>     - Exec time: [2.02, 36.49] s
> 
>   * igt@gem_eio@in-flight-external:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.03, 0.24] s
> 
>   * igt@gem_eio@in-flight-immediate:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.41, 2.13] s
> 
>   * igt@gem_eio@in-flight-internal-10ms:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.04, 0.26] s
> 
>   * igt@gem_eio@in-flight-internal-1us:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.03, 0.26] s
> 
>   * igt@gem_eio@in-flight-internal-immediate:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.03, 0.26] s
> 
>   * igt@gem_eio@in-flight-suspend:
>     - Statuses : 7 pass(s)
>     - Exec time: [1.26, 2.44] s
> 
>   * igt@gem_eio@reset-stress:
>     - Statuses : 7 pass(s)
>     - Exec time: [28.42, 39.36] s
> 
>   * igt@gem_eio@suspend:
>     - Statuses : 7 pass(s)
>     - Exec time: [10.82, 12.64] s
> 
>   * igt@gem_eio@throttle:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.02, 0.07] s
> 
>   * igt@gem_eio@unwedge-stress:
>     - Statuses : 7 pass(s)
>     - Exec time: [28.41, 40.12] s
> 
>   * igt@gem_eio@wait-10ms:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.04, 0.16] s
> 
>   * igt@gem_eio@wait-1us:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.02, 0.14] s
> 
>   * igt@gem_eio@wait-immediate:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.03, 0.16] s
> 
>   * igt@gem_eio@wait-wedge-10ms:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.05, 0.27] s
> 
>   * igt@gem_eio@wait-wedge-1us:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.03, 0.27] s
> 
>   * igt@gem_eio@wait-wedge-immediate:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.03, 0.27] s
> 
>   * igt@gem_exec_alignment@single:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_await@wide-all:
>     - Statuses : 7 pass(s)
>     - Exec time: [21.80, 22.56] s
> 
>   * igt@gem_exec_await@wide-contexts:
>     - Statuses : 7 pass(s)
>     - Exec time: [21.61, 22.35] s
> 
>   * igt@gem_exec_balancer@bonded-chain:
>     - Statuses : 4 pass(s) 2 skip(s)
>     - Exec time: [0.0, 7.10] s
> 
>   * igt@gem_exec_balancer@bonded-semaphore:
>     - Statuses : 5 pass(s) 2 skip(s)
>     - Exec time: [0.0, 4.55] s
> 
>   * igt@gem_exec_balancer@hang:
>     - Statuses : 5 pass(s) 2 skip(s)
>     - Exec time: [0.0, 4.56] s
> 
>   * igt@gem_exec_capture@userptr:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.05] s
> 
>   * igt@gem_exec_create@forked:
>     - Statuses : 7 pass(s)
>     - Exec time: [20.06, 20.13] s
> 
>   * igt@gem_exec_create@madvise:
>     - Statuses : 7 pass(s)
>     - Exec time: [20.03, 20.76] s
> 
>   * igt@gem_exec_fence@basic-busy-all:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.01, 0.03] s
> 
>   * igt@gem_exec_fence@basic-wait-all:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.01, 0.04] s
> 
>   * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
>     - Statuses : 4 pass(s) 3 skip(s)
>     - Exec time: [0.0, 5.89] s
> 
>   * igt@gem_exec_flush@basic-batch-kernel-default-uc:
>     - Statuses : 6 pass(s)
>     - Exec time: [5.62, 6.09] s
> 
>   * igt@gem_exec_flush@basic-batch-kernel-default-wb:
>     - Statuses : 7 pass(s)
>     - Exec time: [5.56, 6.00] s
> 
>   * igt@gem_exec_flush@basic-uc-pro-default:
>     - Statuses : 2 pass(s)
>     - Exec time: [5.41, 5.43] s
> 
>   * igt@gem_exec_flush@basic-uc-prw-default:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_flush@basic-uc-ro-default:
>     - Statuses : 7 pass(s)
>     - Exec time: [5.41, 5.50] s
> 
>   * igt@gem_exec_flush@basic-uc-rw-default:
>     - Statuses : 7 pass(s)
>     - Exec time: [5.41, 5.49] s
> 
>   * igt@gem_exec_flush@basic-uc-set-default:
>     - Statuses : 7 pass(s)
>     - Exec time: [5.41, 5.46] s
> 
>   * igt@gem_exec_flush@basic-wb-pro-default:
>     - Statuses : 7 pass(s)
>     - Exec time: [5.41, 5.49] s
> 
>   * igt@gem_exec_flush@basic-wb-prw-default:
>     - Statuses : 7 pass(s)
>     - Exec time: [5.41, 5.46] s
> 
>   * igt@gem_exec_flush@basic-wb-ro-before-default:
>     - Statuses : 7 pass(s)
>     - Exec time: [5.41, 5.46] s
> 
>   * igt@gem_exec_flush@basic-wb-ro-default:
>     - Statuses : 7 pass(s)
>     - Exec time: [5.41, 5.48] s
> 
>   * igt@gem_exec_flush@basic-wb-rw-before-default:
>     - Statuses : 7 pass(s)
>     - Exec time: [5.41, 5.46] s
> 
>   * igt@gem_exec_flush@basic-wb-rw-default:
>     - Statuses : 7 pass(s)
>     - Exec time: [5.42, 5.47] s
> 
>   * igt@gem_exec_flush@basic-wb-set-default:
>     - Statuses : 7 pass(s)
>     - Exec time: [5.40, 5.47] s
> 
>   * igt@gem_exec_nop@basic-parallel:
>     - Statuses : 7 pass(s)
>     - Exec time: [2.78, 3.34] s
> 
>   * igt@gem_exec_nop@basic-sequential:
>     - Statuses : 7 pass(s)
>     - Exec time: [2.77, 3.35] s
> 
>   * igt@gem_exec_nop@basic-series:
>     - Statuses : 7 pass(s)
>     - Exec time: [2.75, 3.29] s
> 
>   * igt@gem_exec_parallel@basic:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_parallel@contexts:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_parallel@fds:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_params@batch-first:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@gem_exec_params@cliprects-invalid:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@gem_exec_params@cliprects_ptr-dirt:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@gem_exec_params@dr1-dirt:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@gem_exec_params@dr4-dirt:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@gem_exec_params@invalid-bsd-ring:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0, 0.01] s
> 
>   * igt@gem_exec_params@invalid-bsd1-flag-on-blt:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@gem_exec_params@invalid-bsd1-flag-on-render:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@gem_exec_params@invalid-bsd1-flag-on-vebox:
>     - Statuses : 6 pass(s) 1 skip(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@gem_exec_params@invalid-bsd2-flag-on-blt:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@gem_exec_params@invalid-bsd2-flag-on-render:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@gem_exec_params@invalid-bsd2-flag-on-vebox:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_params@invalid-fence-in:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@gem_exec_params@invalid-flag:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@gem_exec_params@invalid-ring:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@gem_exec_params@invalid-ring2:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@gem_exec_params@no-blt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_params@no-bsd:
>     - Statuses : 7 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@gem_exec_params@no-vebox:
>     - Statuses : 1 pass(s) 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@gem_exec_params@rel-constants-invalid:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@gem_exec_params@rel-constants-invalid-rel-gen5:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@gem_exec_params@rel-constants-invalid-ring:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@gem_exec_params@rs-invalid:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.00, 0.02] s
> 
>   * igt@gem_exec_params@rsvd2-dirt:
>     - Statuses : 7 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@gem_exec_params@secure-non-master:
>     - Statuses : 7 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@gem_exec_params@secure-non-root:
>     - Statuses : 7 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@gem_exec_params@sol-reset-invalid:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@gem_exec_params@sol-reset-not-gen7:
>     - Statuses : 6 pass(s) 1 skip(s)
>     - Exec time: [0.0, 0.01] s
> 
>   * igt@gem_exec_reloc@basic-active:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_reloc@basic-cpu:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.02] s
> 
>   * igt@gem_exec_reloc@basic-cpu-active:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.11, 0.17] s
> 
>   * igt@gem_exec_reloc@basic-cpu-gtt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_exec_reloc@basic-cpu-gtt-active:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.11, 0.16] s
> 
>   * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@gem_exec_reloc@basic-cpu-noreloc:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@gem_exec_reloc@basic-cpu-read:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.03] s
> 
>   * igt@gem_exec_reloc@basic-cpu-read-active:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.11, 0.17] s
> 
>   * igt@gem_exec_reloc@basic-cpu-read-noreloc:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@gem_exec_reloc@basic-cpu-wc:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.03] s
> 
>   * igt@gem_exec_reloc@basic-cpu-wc-active:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.11, 0.21] s
> 
>   * igt@gem_exec_reloc@basic-cpu-wc-noreloc:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.03] s
> 
>   * igt@gem_exec_reloc@basic-gtt:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.02] s
> 
>   * igt@gem_exec_reloc@basic-gtt-active:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.11, 0.18] s
> 
>   * igt@gem_exec_reloc@basic-gtt-cpu:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.02] s
> 
>   * igt@gem_exec_reloc@basic-gtt-cpu-active:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.11, 0.16] s
> 
>   * igt@gem_exec_reloc@basic-gtt-cpu-noreloc:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@gem_exec_reloc@basic-gtt-noreloc:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.02] s
> 
>   * igt@gem_exec_reloc@basic-gtt-read:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.03] s
> 
>   * igt@gem_exec_reloc@basic-gtt-read-active:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.11, 0.16] s
> 
>   * igt@gem_exec_reloc@basic-gtt-read-noreloc:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@gem_exec_reloc@basic-gtt-wc:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.00, 0.02] s
> 
>   * igt@gem_exec_reloc@basic-gtt-wc-active:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.11, 0.16] s
> 
>   * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@gem_exec_reloc@basic-range:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.01, 0.11] s
> 
>   * igt@gem_exec_reloc@basic-range-active:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.01, 0.26] s
> 
>   * igt@gem_exec_reloc@basic-softpin:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@gem_exec_reloc@basic-wc:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.02] s
> 
>   * igt@gem_exec_reloc@basic-wc-active:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.11, 0.16] s
> 
>   * igt@gem_exec_reloc@basic-wc-cpu:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.03] s
> 
>   * igt@gem_exec_reloc@basic-wc-cpu-active:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.11, 0.16] s
> 
>   * igt@gem_exec_reloc@basic-wc-cpu-noreloc:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@gem_exec_reloc@basic-wc-gtt:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.02] s
> 
>   * igt@gem_exec_reloc@basic-wc-gtt-active:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.11, 0.16] s
> 
>   * igt@gem_exec_reloc@basic-wc-gtt-noreloc:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@gem_exec_reloc@basic-wc-noreloc:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@gem_exec_reloc@basic-wc-read:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.02] s
> 
>   * igt@gem_exec_reloc@basic-wc-read-active:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.11, 0.16] s
> 
>   * igt@gem_exec_reloc@basic-wc-read-noreloc:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@gem_exec_reloc@basic-write-cpu:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.02] s
> 
>   * igt@gem_exec_reloc@basic-write-cpu-active:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.11, 0.17] s
> 
>   * igt@gem_exec_reloc@basic-write-cpu-noreloc:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@gem_exec_reloc@basic-write-gtt:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.02] s
> 
>   * igt@gem_exec_reloc@basic-write-gtt-active:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.11, 0.16] s
> 
>   * igt@gem_exec_reloc@basic-write-gtt-noreloc:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.01, 0.02] s
> 
>   * igt@gem_exec_reloc@basic-write-read:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.02] s
> 
>   * igt@gem_exec_reloc@basic-write-read-active:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.11, 0.16] s
> 
>   * igt@gem_exec_reloc@basic-write-read-noreloc:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@gem_exec_reloc@basic-write-wc:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.02] s
> 
>   * igt@gem_exec_reloc@basic-write-wc-active:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.11, 0.16] s
> 
>   * igt@gem_exec_reloc@basic-write-wc-noreloc:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@gem_exec_schedule@smoketest-all:
>     - Statuses : 5 pass(s) 2 skip(s)
>     - Exec time: [0.0, 32.32] s
> 
>   * igt@gem_exec_suspend@basic:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.23, 1.52] s
> 
>   * igt@gem_exec_suspend@basic-s3-devices:
>     - Statuses : 7 pass(s)
>     - Exec time: [6.06, 10.64] s
> 
>   * igt@gem_exec_suspend@basic-s4-devices:
>     - Statuses : 7 pass(s)
>     - Exec time: [7.05, 11.82] s
> 
>   * igt@gem_fence_thrash@bo-copy:
>     - Statuses : 7 pass(s)
>     - Exec time: [1.13, 1.70] s
> 
>   * igt@gem_fence_thrash@bo-write-verify-none:
>     - Statuses : 7 pass(s)
>     - Exec time: [1.09, 1.23] s
> 
>   * igt@gem_fence_thrash@bo-write-verify-threaded-none:
>     - Statuses : 7 pass(s)
>     - Exec time: [1.21, 3.08] s
> 
>   * igt@gem_fence_thrash@bo-write-verify-threaded-x:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_fence_thrash@bo-write-verify-threaded-y:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_fence_thrash@bo-write-verify-x:
>     - Statuses : 7 pass(s)
>     - Exec time: [1.10, 1.30] s
> 
>   * igt@gem_fence_thrash@bo-write-verify-y:
>     - Statuses : 7 pass(s)
>     - Exec time: [1.08, 1.34] s
> 
>   * igt@gem_fenced_exec_thrash@2-spare-fences:
>     - Statuses : 7 pass(s)
>     - Exec time: [2.15, 2.16] s
> 
>   * igt@gem_fenced_exec_thrash@no-spare-fences:
>     - Statuses : 7 pass(s)
>     - Exec time: [2.15, 2.16] s
> 
>   * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
>     - Statuses : 7 pass(s)
>     - Exec time: [2.15, 2.18] s
> 
>   * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
>     - Statuses : 7 pass(s)
>     - Exec time: [2.15, 2.20] s
> 
>   * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
>     - Statuses : 7 pass(s)
>     - Exec time: [2.15, 2.16] s
> 
>   * igt@gem_fenced_exec_thrash@too-many-fences:
>     - Statuses : 7 pass(s)
>     - Exec time: [2.15, 2.17] s
> 
>   * igt@gem_flink_race@flink_close:
>     - Statuses : 7 pass(s)
>     - Exec time: [5.01, 5.03] s
> 
>   * igt@gem_flink_race@flink_name:
>     - Statuses : 7 pass(s)
>     - Exec time: [5.37] s
> 
>   * igt@gem_gpgpu_fill:
>     - Statuses : 1 pass(s) 1 skip(s)
>     - Exec time: [0.09, 0.10] s
> 
>   * igt@gem_gtt_cpu_tlb:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.09, 0.32] s
> 
>   * igt@gem_linear_blits@interruptible:
>     - Statuses : 7 pass(s)
>     - Exec time: [1.64, 24.88] s
> 
>   * igt@gem_linear_blits@normal:
>     - Statuses : 7 pass(s)
>     - Exec time: [1.46, 19.07] s
> 
>   * igt@gem_madvise@dontneed-after-mmap:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.02] s
> 
>   * igt@gem_madvise@dontneed-before-exec:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@gem_madvise@dontneed-before-mmap:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@gem_madvise@dontneed-before-pwrite:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00] s
> 
>   * igt@gem_media_fill:
>     - Statuses : 6 pass(s) 1 skip(s)
>     - Exec time: [0.08, 0.29] s
> 
>   * igt@gem_mmap@bad-object:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@gem_mmap@basic-small-bo:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.58, 2.17] s
> 
>   * igt@gem_mmap@big-bo:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.67, 2.52] s
> 
>   * igt@gem_mmap@short-mmap:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@gem_mmap_gtt@basic-copy:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.14, 0.89] s
> 
>   * igt@gem_mmap_gtt@basic-read:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.04, 0.12] s
> 
>   * igt@gem_mmap_gtt@basic-read-write:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.01, 0.05] s
> 
>   * igt@gem_mmap_gtt@basic-read-write-distinct:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.01, 0.05] s
> 
>   * igt@gem_mmap_gtt@basic-short:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.02, 0.07] s
> 
>   * igt@gem_mmap_gtt@basic-small-bo:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_mmap_gtt@basic-small-bo-tiledx:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.23, 0.86] s
> 
>   * igt@gem_mmap_gtt@basic-small-bo-tiledy:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.23, 0.79] s
> 
>   * igt@gem_mmap_gtt@basic-small-copy:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.40, 3.18] s
> 
>   * igt@gem_mmap_gtt@basic-small-copy-odd:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.70, 4.22] s
> 
>   * igt@gem_mmap_gtt@basic-small-copy-xy:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.98, 4.56] s
> 
>   * igt@gem_mmap_gtt@basic-wc:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.64] s
> 
>   * igt@gem_mmap_gtt@basic-write:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.09, 0.50] s
> 
>   * igt@gem_mmap_gtt@basic-write-cpu-read-gtt:
>     - Statuses : 5 pass(s) 2 skip(s)
>     - Exec time: [0.0, 0.31] s
> 
>   * igt@gem_mmap_gtt@basic-write-gtt:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.11, 0.81] s
> 
>   * igt@gem_mmap_gtt@basic-write-read:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.01, 0.05] s
> 
>   * igt@gem_mmap_gtt@basic-write-read-distinct:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.01, 0.06] s
> 
>   * igt@gem_mmap_gtt@big-bo:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.27, 1.03] s
> 
>   * igt@gem_mmap_gtt@big-bo-tiledx:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.49, 1.92] s
> 
>   * igt@gem_mmap_gtt@big-bo-tiledy:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.31, 1.18] s
> 
>   * igt@gem_mmap_gtt@big-copy:
>     - Statuses : 7 pass(s)
>     - Exec time: [1.37, 11.29] s
> 
>   * igt@gem_mmap_gtt@big-copy-odd:
>     - Statuses : 7 pass(s)
>     - Exec time: [1.54, 12.40] s
> 
>   * igt@gem_mmap_gtt@big-copy-xy:
>     - Statuses : 7 pass(s)
>     - Exec time: [1.54, 16.49] s
> 
>   * igt@gem_mmap_gtt@coherency:
>     - Statuses : 3 pass(s) 4 skip(s)
>     - Exec time: [0.0, 0.09] s
> 
>   * igt@gem_mmap_gtt@fault-concurrent:
>     - Statuses : 7 pass(s)
>     - Exec time: [2.69, 3.85] s
> 
>   * igt@gem_mmap_gtt@hang:
>     - Statuses : 7 pass(s)
>     - Exec time: [5.42, 5.47] s
> 
>   * igt@gem_mmap_gtt@medium-copy:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.94, 6.70] s
> 
>   * igt@gem_mmap_gtt@medium-copy-odd:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.83, 6.26] s
> 
>   * igt@gem_mmap_gtt@medium-copy-xy:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.82, 8.28] s
> 
>   * igt@gem_mmap_gtt@zero-extend:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@gem_mmap_offset@bad-extensions:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@gem_mmap_offset@bad-flags:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_mmap_offset@bad-object:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@gem_mmap_offset@basic-uaf:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00] s
> 
>   * igt@gem_mmap_offset@clear:
>     - Statuses : 7 pass(s)
>     - Exec time: [25.59, 35.15] s
> 
>   * igt@gem_mmap_offset@close-race:
>     - Statuses : 7 pass(s)
>     - Exec time: [20.06, 20.18] s
> 
>   * igt@gem_mmap_offset@isolation:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@gem_mmap_offset@open-flood:
>     - Statuses : 7 pass(s)
>     - Exec time: [21.50, 21.58] s
> 
>   * igt@gem_mmap_offset@pf-nonblock:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.00, 0.01] s
> 
>   * igt@gem_mmap_wc@close:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.04, 0.14] s
> 
>   * igt@gem_mmap_wc@coherency:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.09, 0.28] s
> 
>   * igt@gem_mmap_wc@copy:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.14, 0.41] s
> 
>   * igt@gem_mmap_wc@fault-concurrent:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.54, 2.32] s
> 
>   * igt@gem_mmap_wc@invalid-flags:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@gem_mmap_wc@read:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.05, 0.20] s
> 
>   * igt@gem_mmap_wc@read-write:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.01, 0.10] s
> 
>   * igt@gem_mmap_wc@read-write-distinct:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.01, 0.06] s
> 
>   * igt@gem_mmap_wc@set-cache-level:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.00] s
> 
>   * igt@gem_mmap_wc@write:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.07, 0.26] s
> 
>   * igt@gem_mmap_wc@write-cpu-read-wc:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.10, 0.35] s
> 
>   * igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.11, 0.34] s
> 
>   * igt@gem_mmap_wc@write-gtt-read-wc:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.10, 0.56] s
> 
>   * igt@gem_mmap_wc@write-read:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.01, 0.05] s
> 
>   * igt@gem_mmap_wc@write-read-distinct:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.01, 0.05] s
> 
>   * igt@gem_partial_pwrite_pread@reads:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.65, 5.63] s
> 
>   * igt@gem_partial_pwrite_pread@reads-display:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.65, 6.58] s
> 
>   * igt@gem_partial_pwrite_pread@reads-snoop:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.66, 5.92] s
> 
>   * igt@gem_partial_pwrite_pread@reads-uncached:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.64, 5.85] s
> 
>   * igt@gem_partial_pwrite_pread@write:
>     - Statuses : 7 pass(s)
>     - Exec time: [3.19, 13.22] s
> 
>   * igt@gem_partial_pwrite_pread@write-display:
>     - Statuses : 2 pass(s)
>     - Exec time: [3.24, 3.25] s
> 
>   * igt@gem_partial_pwrite_pread@write-snoop:
>     - Statuses : 6 pass(s)
>     - Exec time: [3.21, 13.62] s
> 
>   * igt@gem_partial_pwrite_pread@write-uncached:
>     - Statuses : 7 pass(s)
>     - Exec time: [3.21, 13.38] s
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads:
>     - Statuses : 7 pass(s)
>     - Exec time: [3.85, 19.19] s
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads-display:
>     - Statuses : 7 pass(s)
>     - Exec time: [3.82, 19.06] s
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
>     - Statuses : 6 pass(s)
>     - Exec time: [3.88, 19.63] s
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
>     - Statuses : 7 pass(s)
>     - Exec time: [3.82, 19.01] s
> 
>   * igt@gem_pipe_control_store_loop@fresh-buffer:
>     - Statuses : 7 pass(s)
>     - Exec time: [2.15] s
> 
>   * igt@gem_pipe_control_store_loop@reused-buffer:
>     - Statuses : 2 pass(s)
>     - Exec time: [2.15] s
> 
>   * igt@gem_ppgtt@blt-vs-render-ctx0:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_ppgtt@blt-vs-render-ctxn:
>     - Statuses : 7 pass(s)
>     - Exec time: [32.68, 33.73] s
> 
>   * igt@gem_ppgtt@flink-and-close-vma-leak:
>     - Statuses : 5 pass(s) 2 skip(s)
>     - Exec time: [0.0, 0.01] s
> 
>   * igt@gem_pread@display:
>     - Statuses : 7 pass(s)
>     - Exec time: [3.71, 16.13] s
> 
>   * igt@gem_pread@snoop:
>     - Statuses : 7 pass(s)
>     - Exec time: [3.64, 15.81] s
> 
>   * igt@gem_pread@uncached:
>     - Statuses : 7 pass(s)
>     - Exec time: [3.60, 15.72] s
> 
>   * igt@gem_pwrite_snooped:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.11, 0.29] s
> 
>   * igt@gem_readwrite@beyond-eob:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@gem_readwrite@new-obj:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@gem_readwrite@read-bad-handle:
>     - Statuses : 7 pass(s)
>     - Exec time: [0
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_19491/index.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
