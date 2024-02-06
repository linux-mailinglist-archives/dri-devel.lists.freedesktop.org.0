Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E142184AE2F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 06:53:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C74112961;
	Tue,  6 Feb 2024 05:53:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="yWtPDNoN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDE111295F;
 Tue,  6 Feb 2024 05:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=w3Q42N/e2eCew/j8uEMfyElkzHhqrTXgEIBh4kRIFbk=; b=yWtPDNoN5tJ5DYCV9E0cJbndTg
 SwomS3W/+jZdg3CoGSYr41fxanlYFkt7NXd0Z/Hq5DFyn9lyKxXS/hUtEBTi6fXb28L3NZ5XKHhGM
 BJRUc9RzGxK0qnMI5LXW2p0CKXmY6q8M390rtXsbYyGsNWQasIF+BkCPIzDZzvpeEIbOlspQYLaI1
 wnUvTVgu87H6eE475HMRPxEMjsa9B+AhT3UKtDABS9zzCSQJGBYB3C0MB2epLIEu1oIn4Cyrbs75o
 6P3mm5BNXqlr7HOQDeGZb0P4r2xN7bckWmlAMPQmZ29/yHOBG7HfWe3IxgWTqIaCXHIbPqQNT7BJZ
 7OZ7v/Pw==;
Received: from [50.53.50.0] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rXEOI-000000069rh-2Xul; Tue, 06 Feb 2024 05:53:06 +0000
Message-ID: <1b36c0aa-8a41-48e1-b21b-65f0ad521bcb@infradead.org>
Date: Mon, 5 Feb 2024 21:53:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Feb 6 (gpu/drm/amd/display/ kernel-doc
 warnings)
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20240206154329.6a8464fd@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240206154329.6a8464fd@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/5/24 20:43, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20240205:
> 

Hi Rodrigo,

Are you aware of these kernel-doc warnings?
I think they are due to

commit b8c1c3a82e75
Author: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Date:   Mon Jan 22 14:24:57 2024 -0700
    Documentation/gpu: Add kernel doc entry for MPC



../drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h:1: warning: no structured comments found
../drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h:1: warning: no structured comments found
../drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h:1: warning: no structured comments found
../drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h:1: warning: no structured comments found
../drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h:1: warning: no structured comments found
../drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h:1: warning: no structured comments found
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:1: warning: no structured comments found
../drivers/gpu/drm/amd/display/dc/inc/hw/opp.h:1: warning: no structured comments found
../drivers/gpu/drm/amd/display/dc/inc/hw/opp.h:1: warning: no structured comments found
../drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.h:1: warning: no structured comments found
../drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.h:1: warning: no structured comments found

../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:132: warning: Incorrect use of kernel-doc format:          * @@overlap_only: Whether overlapping of different planes is allowed.
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:132: warning: Incorrect use of kernel-doc format:          * @@overlap_only: Whether overlapping of different planes is allowed.
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:132: warning: Incorrect use of kernel-doc format:          * @@overlap_only: Whether overlapping of different planes is allowed.
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:162: warning: Function parameter or struct member 'pre_multiplied_alpha' not described in 'mpcc_blnd_cfg'
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:162: warning: Function parameter or struct member 'overlap_only' not described in 'mpcc_blnd_cfg'
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function parameter or struct member 'read_mpcc_state' not described in 'mpc_funcs'
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function parameter or struct member 'mpc_init_single_inst' not described in 'mpc_funcs'
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function parameter or struct member 'get_mpcc_for_dpp_from_secondary' not described in 'mpc_funcs'
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function parameter or struct member 'get_mpcc_for_dpp' not described in 'mpc_funcs'
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function parameter or struct member 'wait_for_idle' not described in 'mpc_funcs'
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function parameter or struct member 'assert_mpcc_idle_before_connect' not described in 'mpc_funcs'
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function parameter or struct member 'init_mpcc_list_from_hw' not described in 'mpc_funcs'
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function parameter or struct member 'set_denorm' not described in 'mpc_funcs'
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function parameter or struct member 'set_denorm_clamp' not described in 'mpc_funcs'
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function parameter or struct member 'set_output_csc' not described in 'mpc_funcs'
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function parameter or struct member 'set_ocsc_default' not described in 'mpc_funcs'
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function parameter or struct member 'set_output_gamma' not described in 'mpc_funcs'
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function parameter or struct member 'power_on_mpc_mem_pwr' not described in 'mpc_funcs'
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function parameter or struct member 'set_dwb_mux' not described in 'mpc_funcs'
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function parameter or struct member 'disable_dwb_mux' not described in 'mpc_funcs'
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function parameter or struct member 'is_dwb_idle' not described in 'mpc_funcs'
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function parameter or struct member 'set_out_rate_control' not described in 'mpc_funcs'
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function parameter or struct member 'set_gamut_remap' not described in 'mpc_funcs'
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function parameter or struct member 'program_1dlut' not described in 'mpc_funcs'
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function parameter or struct member 'program_shaper' not described in 'mpc_funcs'
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function parameter or struct member 'acquire_rmu' not described in 'mpc_funcs'
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function parameter or struct member 'program_3dlut' not described in 'mpc_funcs'
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function parameter or struct member 'release_rmu' not described in 'mpc_funcs'
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function parameter or struct member 'get_mpc_out_mux' not described in 'mpc_funcs'
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function parameter or struct member 'set_bg_color' not described in 'mpc_funcs'
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function parameter or struct member 'set_mpc_mem_lp_mode' not described in 'mpc_funcs'
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:132: warning: Incorrect use of kernel-doc format:          * @@overlap_only: Whether overlapping of different planes is allowed.
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:162: warning: Function parameter or struct member 'pre_multiplied_alpha' not described in 'mpcc_blnd_cfg'
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:162: warning: Function parameter or struct member 'overlap_only' not described in 'mpcc_blnd_cfg'
../drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:132: warning: Incorrect use of kernel-doc format:          * @@overlap_only: Whether overlapping of different planes is allowed.



Can you address these, please?

Thanks.

-- 
#Randy
