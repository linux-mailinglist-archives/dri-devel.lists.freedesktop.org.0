Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E57ABDB34
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 16:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1651B10E536;
	Tue, 20 May 2025 14:07:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FhPfhdPm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E8A10E500;
 Tue, 20 May 2025 14:07:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2C5025C5523;
 Tue, 20 May 2025 14:05:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9B65C4CEE9;
 Tue, 20 May 2025 14:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747750067;
 bh=LSCg1WtZiijRBQPQNeV6HQ3meIGHPHi5xW3N/tJxwKY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FhPfhdPmp2r2S7/maxTkCUhqOKs6wqRP2tJXDr41s4uQ30rwwCfFCHh14mB777rua
 6me++dEJQX7EPUHHuF0JwWs2C0SF9MEMKaK2D4rM9MvCJozy4od20TpghXrlhnjS81
 e+SJJ4myQfzFDM6VdI67ETDzz5f5+UeEGqOYtx3cSR/ypMwwQHpGxT5ns1OVHx6Gze
 TBNdCtksbBTjCKuPlS8n8viFJJNT0JpcG00EV4IcwvUSZvT2K559/FFZc9tJrAgkeD
 Fxkx1gV9RNVMnuiK0hxR4ifjyKCyFp3YQPirQ1RNPjrC4IQNymJSdp5j0AcAiKC4da
 PhDwwv6/Ads/g==
Date: Tue, 20 May 2025 10:07:45 -0400
From: Sasha Levin <sashal@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, sunpeng.li@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH AUTOSEL 6.6 229/294] drm/amd/display/dc: enable oem i2c
 support for DCE 12.x
Message-ID: <aCyMsX3_LQXsUuE4@lappy>
References: <20250505225634.2688578-1-sashal@kernel.org>
 <20250505225634.2688578-229-sashal@kernel.org>
 <CADnq5_OGPGwbKfFSP6BpNAhtOXnZ+L3Vmga9TxLDAAub=bu9JA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_OGPGwbKfFSP6BpNAhtOXnZ+L3Vmga9TxLDAAub=bu9JA@mail.gmail.com>
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

On Tue, May 06, 2025 at 11:02:34AM -0400, Alex Deucher wrote:
>On Mon, May 5, 2025 at 7:04 PM Sasha Levin <sashal@kernel.org> wrote:
>>
>> From: Alex Deucher <alexander.deucher@amd.com>
>>
>> [ Upstream commit 2ed83f2cc41e8f7ced1c0610ec2b0821c5522ed5 ]
>>
>> Use the value pulled from the vbios just like newer chips.
>>
>> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>This is a new feature not a bug fix and this change only makes sense
>with the other changes in kernel 6.15.

I'll drop it, thanks!

-- 
Thanks,
Sasha
