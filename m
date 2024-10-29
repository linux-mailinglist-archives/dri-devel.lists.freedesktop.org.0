Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C91A9B4C03
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 15:20:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F0B10E28B;
	Tue, 29 Oct 2024 14:20:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NYjzEArB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AABAE10E28B;
 Tue, 29 Oct 2024 14:20:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C2AD05C5E44;
 Tue, 29 Oct 2024 14:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D36FC4CECD;
 Tue, 29 Oct 2024 14:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730211643;
 bh=Ncqu84eUIoV/noeY6jmyqqV/eVZFpGTtgpv7Q0T0B5g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NYjzEArBIeXR63S0DAJiAxxbzhzEZIV8QivhpU5ANCtLSGwqTZ1nm45/4qn6niL0d
 m9uEuR081kn8tzG0jdN0ZyFKyOLtRKWMAcjyVMeRMAVgogWoSvIM/r+TUy/LkyouX1
 fnMShynZ9vA6BpE5TTeut1rS7u2olD5uvk+oYxlkBVuHcsA3sZ8bLTVD2eK3TohywQ
 jIpt1n3IOm8zAcejWENEaSB7/D/zbPV58HCiosAAaWDTXM6KSX4LOcuCNgSb0Lzi66
 3YYhrwc+gBGc4Bth8M2VRrK+KOjqYs+cJbO5+C2Be+/v/rYlI6pec3N7anHClUdtQB
 blwO7HzGIiEXw==
Date: Tue, 29 Oct 2024 10:20:41 -0400
From: Sasha Levin <sashal@kernel.org>
To: Fedor Pchelkin <pchelkin@ispras.ru>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 Alexey Khoroshilov <khoroshilov@ispras.ru>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Jonathan Gray <jsg@jsg.id.au>
Subject: Re: [PATCH 0/1] On DRM -> stable process
Message-ID: <ZyDvOdEuxYh7jK5l@sashalap>
References: <20241029133141.45335-1-pchelkin@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20241029133141.45335-1-pchelkin@ispras.ru>
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

On Tue, Oct 29, 2024 at 04:31:40PM +0300, Fedor Pchelkin wrote:
>BTW, a question to the stable-team: what Git magic (3-way-merge?) let the
>duplicate patch be applied successfully? The patch context in stable trees
>was different to that moment so should the duplicate have been expected to
>fail to be applied?

Just plain git... Try it yourself :)

$ git checkout 282f0a482ee6
HEAD is now at 282f0a482ee61 drm/amd/display: Skip Recompute DSC Params if no Stream on Link

$ git cherry-pick 7c887efda1
Auto-merging drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
[detached HEAD 2a1c937960abd] drm/amd/display: Skip Recompute DSC Params if no Stream on Link
  Author: Fangzhi Zuo <Jerry.Zuo@amd.com>
  Date: Fri Jul 12 16:30:03 2024 -0400
  1 file changed, 3 insertions(+)

$ git log -2 --oneline
2a1c937960abd (HEAD) drm/amd/display: Skip Recompute DSC Params if no Stream on Link
282f0a482ee61 drm/amd/display: Skip Recompute DSC Params if no Stream on Link

-- 
Thanks,
Sasha
