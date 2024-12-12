Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEA29EE662
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 13:11:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B81610E40D;
	Thu, 12 Dec 2024 12:11:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="frbRjRAE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F3B10E40D;
 Thu, 12 Dec 2024 12:11:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1D719A42145;
 Thu, 12 Dec 2024 12:09:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59249C4CECE;
 Thu, 12 Dec 2024 12:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1734005484;
 bh=z4IR5aQ9BHMU6pLPaRemCvtw3/mCLG8VNTuWpfCN/AU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=frbRjRAEc9YR6sD/8xPGdYfwG5V+e0P74CnQSqB7cvBGcKUMyPUOSg4HkYVm7xqmt
 u6p81YPyIkCsQfMFMibxy+ccs4tYjrYQCaNUPullQU8pFFnuB6W5LHOy5WIDhBPL6E
 J1ghkjfTUTGJI8+DxbJCskR1eBruPGkIDwh0ccd4=
Date: Thu, 12 Dec 2024 13:11:20 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: jianqi.ren.cn@windriver.com
Cc: wayne.lin@amd.com, patches@lists.linux.dev, jerry.zuo@amd.com,
 zaeem.mohamed@amd.com, daniel.wheeler@amd.com,
 alexander.deucher@amd.com, stable@vger.kernel.org,
 harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6.1.y] drm/amd/display: Don't refer to dc_sink in
 is_dsc_need_re_compute
Message-ID: <2024121206-shelve-contusion-6db0@gregkh>
References: <20241211101544.2121147-1-jianqi.ren.cn@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211101544.2121147-1-jianqi.ren.cn@windriver.com>
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

On Wed, Dec 11, 2024 at 06:15:44PM +0800, jianqi.ren.cn@windriver.com wrote:
> From: Wayne Lin <wayne.lin@amd.com>
> 
> [ Upstream commit fcf6a49d79923a234844b8efe830a61f3f0584e4 ]
> 
> [Why]
> When unplug one of monitors connected after mst hub, encounter null pointer dereference.
> 
> It's due to dc_sink get released immediately in early_unregister() or detect_ctx(). When
> commit new state which directly referring to info stored in dc_sink will cause null pointer
> dereference.
> 
> [how]
> Remove redundant checking condition. Relevant condition should already be covered by checking
> if dsc_aux is null or not. Also reset dsc_aux to NULL when the connector is disconnected.
> 
> Reviewed-by: Jerry Zuo <jerry.zuo@amd.com>
> Acked-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
> Signed-off-by: Wayne Lin <wayne.lin@amd.com>
> Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Jianqi Ren <jianqi.ren.cn@windriver.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 4 ++++
>  1 file changed, 4 insertions(+)

You sent this 3 times, all different, so I have no idea what to do.

Ok, I give up.  I'm deleting ALL of your pending stable patches from my
review queue now due to all of the problems that these have had.

Please work with a more experienced kernel developer at your company to
get these backports correct, and complete, and send them as a patch
series with the correct information and documentation as to what is
going on, so that we have a chance to get this right.

thanks,

greg k-h
