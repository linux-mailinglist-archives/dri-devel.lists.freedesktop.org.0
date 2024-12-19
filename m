Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4259E9F87CF
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 23:24:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 399D510EDFA;
	Thu, 19 Dec 2024 22:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pUWTKEmo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC59E10EDF9;
 Thu, 19 Dec 2024 22:24:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EFD815C6971;
 Thu, 19 Dec 2024 22:23:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E19AC4CECE;
 Thu, 19 Dec 2024 22:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734647059;
 bh=UgzTqvP2dfEeqbbMHjO7eSorkfEDNRHWyWU6cs3OKfg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pUWTKEmojfSgQmATVLAc3CHm7A3E0MxE7rcFIiBbkXLxC3j2SavmBFn5ZHVxxyubm
 /OnmfDTYyWA/x9RrzrvA4XY7FEJd+RrymcThGyZz+RIrVhcd2lw0LQNMKWasen62Y9
 ec1Ubzic+vTUU4SmKqzhoP4stNbCrWINMbTuMbfC7TKlMtr2o2BdkuTYBlh/QvDyC9
 cZ3FMmCcjurqe6A08GYeeNFS68WiExgcDLjzEHVeC1pNDLltgBqY2xByh+jgZZovDK
 RuiVT67DoVvQ6XAZV30TU1735sziLarF74AyGiNXiU/AO6hn8cB/qJbJRcR9K5nYSH
 IS8I8xFf7sS7w==
Date: Thu, 19 Dec 2024 15:24:13 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Chaitanya Dhere <chaitanya.dhere@amd.com>, Jun Lei <jun.lei@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Austin Zheng <Austin.Zheng@amd.com>,
 Dillon Varone <dillon.varone@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH] drm/amd/display: Disable -Wenum-float-conversion for
 dml2_dpmm_dcn4.c
Message-ID: <20241219222413.GC1259354@ax162>
References: <20241219-amdgpu-fix-enum-float-conversion-again-again-v1-1-ef2c619724b1@kernel.org>
 <CADnq5_NKWH7UC_ow825aAtF1tZXJTVOwDWaqDR8_4Y6EmPXUiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_NKWH7UC_ow825aAtF1tZXJTVOwDWaqDR8_4Y6EmPXUiA@mail.gmail.com>
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

On Thu, Dec 19, 2024 at 05:21:41PM -0500, Alex Deucher wrote:
> On Thu, Dec 19, 2024 at 12:23 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > If you would prefer reapplying the local fix, feel free to do so, but I
> > would like for it to be in the upstream source so it does not have to
> > keep being applied.
> 
> I've reapplied the original fix and I've confirmed that the fix will
> be pushed to the DML tree as well this time.

Thanks a lot!
