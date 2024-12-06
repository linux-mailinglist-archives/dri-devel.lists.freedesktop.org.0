Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AFB9E641D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 03:27:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E2F10E17A;
	Fri,  6 Dec 2024 02:27:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="WvNYmjRt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5389110E17A;
 Fri,  6 Dec 2024 02:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=jnj9aUQwKsN4rZkjU7PDO/ZXVs30tp1WVKFP+p29Q+4=; b=WvNYmjRtAI3EnWVr
 LhQOxMRcyYcf9uATo95zmBdxkTrBi9Apj94rO4UFsNHPh+Fmvk91xMR2Mu3+j7aKmEGex6Xkg1W1t
 z2+ftDp1VNE0tHdgV4ywT2KknoudlvKJ5uiMtqRiBHaMg4MiYI5PuBIWIr68LM6APE6GyJRhOYSsc
 VlwaYJNXsw0BeyCPNDK/vtgva1dtW9oq4JVBpeMOh30xm2HJmyZY+wIFDH3cqit6kSHrJ4/d9H7BT
 gwULiUzKkQ5dXbSBwilZUXHBUJWgqoNeYZvojkRRrnhoU4aYhB+qyPFyraj7YelL2bveu5zcE7Bwl
 ppO1LYqW0c+22Y9dIw==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1tJO4D-003mKu-0g;
 Fri, 06 Dec 2024 02:27:41 +0000
Date: Fri, 6 Dec 2024 02:27:41 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: alexander.deucher@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, chaitanya.dhere@amd.com, jun.lei@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] Some more drm/amd/display deadcoding
Message-ID: <Z1JhHcaYZCzKHp-i@gallifrey>
References: <20241104023852.492497-1-linux@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20241104023852.492497-1-linux@treblig.org>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 02:27:09 up 211 days, 13:41,  1 user,  load average: 0.02, 0.06, 0.03
User-Agent: Mutt/2.2.12 (2023-09-09)
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

* linux@treblig.org (linux@treblig.org) wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> Hi,
>   This removes a bunch more functions (and a field) from
> drm/amd/display that are unused.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Hi Alex, Harry,
  Gentle ping on this set - I think you've already pulled in all
of the older ones (Thanks!).

Dave

> Dave
> 
> Dr. David Alan Gilbert (5):
>   drm/amd/display: Remove unused enable_surface_flip_reporting
>   drm/amd/display: Remove unused dwb3_set_host_read_rate_control
>   drm/amd/display: Remove unused dc_stream_warmup_writeback
>   drm/amd/display: Remove unused mmhubbub_warmup field
>   drm/amd/display: Remove unused dcn_find_dcfclk_suits_all
> 
>  .../gpu/drm/amd/display/dc/core/dc_stream.c   |  11 --
>  .../gpu/drm/amd/display/dc/core/dc_surface.c  |   7 -
>  drivers/gpu/drm/amd/display/dc/dc_stream.h    |   4 -
>  .../drm/amd/display/dc/dml/calcs/dcn_calcs.c  | 132 ------------------
>  .../drm/amd/display/dc/dwb/dcn30/dcn30_dwb.c  |  13 --
>  .../drm/amd/display/dc/dwb/dcn30/dcn30_dwb.h  |   1 -
>  .../amd/display/dc/hwss/dcn30/dcn30_init.c    |   1 -
>  .../amd/display/dc/hwss/dcn301/dcn301_init.c  |   1 -
>  .../amd/display/dc/hwss/dcn31/dcn31_init.c    |   1 -
>  .../amd/display/dc/hwss/dcn314/dcn314_init.c  |   1 -
>  .../amd/display/dc/hwss/dcn32/dcn32_init.c    |   1 -
>  .../amd/display/dc/hwss/dcn35/dcn35_init.c    |   1 -
>  .../amd/display/dc/hwss/dcn351/dcn351_init.c  |   1 -
>  .../amd/display/dc/hwss/dcn401/dcn401_init.c  |   1 -
>  .../drm/amd/display/dc/hwss/hw_sequencer.h    |   4 -
>  .../gpu/drm/amd/display/dc/inc/core_types.h   |   3 -
>  .../gpu/drm/amd/display/dc/inc/dcn_calcs.h    |   4 -
>  17 files changed, 187 deletions(-)
> 
> -- 
> 2.47.0
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
