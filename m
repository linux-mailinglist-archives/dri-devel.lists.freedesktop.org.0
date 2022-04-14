Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D1E500B5B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 12:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AF710F552;
	Thu, 14 Apr 2022 10:44:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796C410F552;
 Thu, 14 Apr 2022 10:44:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2941C61F48;
 Thu, 14 Apr 2022 10:44:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9448BC385A8;
 Thu, 14 Apr 2022 10:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1649933056;
 bh=Mz94gdoUDNEkJ85Gh/in1p/zmuHeIqMJnDLSXV/KynE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QGj2p6iDaSHx+PqsENx5PQ5oERzG81jT5Ta95i5OYiBm/YzhQdDE0WnuP29/4c+KN
 clTwqpVZedAwK/N+/3Wa2XIkOMTmlLxgYZmjSNsDMxHv9EedbyHHKzO3PiNk/El1Tz
 mMqmZ+ZaSfYeHG8rvA+YKociRQlSKaPWrAxZ+IaE=
Date: Thu, 14 Apr 2022 12:44:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 4.19 1/2] drm/amdgpu: Check if fd really is an amdgpu fd.
Message-ID: <Ylf6/aejnw+FWZUc@kroah.com>
References: <20220412153529.1173412-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220412153529.1173412-1-lee.jones@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Felix Kuehling <Felix.Kuehling@amd.com>, stable@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 12, 2022 at 04:35:28PM +0100, Lee Jones wrote:
> From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> 
> [ Upstream commit 021830d24ba55a578f602979274965344c8e6284 ]
> 
> Otherwise we interpret the file private data as drm & amdgpu data
> while it might not be, possibly allowing one to get memory corruption.
> 
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h       |  2 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c   | 16 ++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c | 10 +++++++---
>  3 files changed, 25 insertions(+), 3 deletions(-)

Both now queued up, thanks.

greg k-h
