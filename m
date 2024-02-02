Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA7C847D3C
	for <lists+dri-devel@lfdr.de>; Sat,  3 Feb 2024 00:40:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E09210E8E3;
	Fri,  2 Feb 2024 23:40:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VFOBftGh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E2B10E8E3;
 Fri,  2 Feb 2024 23:40:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CE8CA628ED;
 Fri,  2 Feb 2024 23:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62351C433F1;
 Fri,  2 Feb 2024 23:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1706917204;
 bh=unXX6g1ZBdLO7Jo440DSlmm54n4Lw76NBjvoeQ7FaE4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VFOBftGhrsfDFpKWZBkIB1P38BKvccfhxGFGhhIf5FMj4IMKNUNVcGgdgcai9P7s4
 o19DBLwmAhnnpBuH69hZvj/Xi9FfZpSd9G1qP/4pf2pBkb5hFzXGzgnTCZgnnUWsNM
 z0uc3O1fBgeW+mDAUcgA34IIRPjkVLYHtm38mHiA=
Date: Fri, 2 Feb 2024 15:40:03 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, Le Ma <le.ma@amd.com>,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 James Zhu <James.Zhu@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Alex Shi <alexs@kernel.org>, Jerry Snitselaar <jsnitsel@redhat.com>,
 Wei Liu <wei.liu@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/amdgpu: wire up the can_remove() callback
Message-ID: <2024020225-faceless-even-e3f8@gregkh>
References: <20240202222603.141240-1-hamza.mahfooz@amd.com>
 <20240202222603.141240-3-hamza.mahfooz@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240202222603.141240-3-hamza.mahfooz@amd.com>
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

On Fri, Feb 02, 2024 at 05:25:56PM -0500, Hamza Mahfooz wrote:
> Removing an amdgpu device that still has user space references allocated
> to it causes undefined behaviour.

Then fix that please.  There should not be anything special about your
hardware that all of the tens of thousands of other devices can't handle
today.

What happens when I yank your device out of a system with a pci hotplug
bus?  You can't prevent that either, so this should not be any different
at all.

sorry, but please, just fix your driver.

greg k-h
