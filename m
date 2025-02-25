Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF50A4416E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 14:56:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7898E10E6A3;
	Tue, 25 Feb 2025 13:55:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V0in2wbK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881D910E6A3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 13:55:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 13A6A5C62C4;
 Tue, 25 Feb 2025 13:55:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F066C4CEDD;
 Tue, 25 Feb 2025 13:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740491756;
 bh=HeiWbUguAKUYy1aVv0iBfNJLRPPEIGhzLryoTTLyFIs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V0in2wbKSIU1S5+2vstT9d7ZxIjjOSs0YlwaW2tnv/XWu0no/PgMsvAKM4wI+QciP
 vNevM+ZgL5YXC4a0TB6IExzKwo/c8+xkCBuwvSBsI1h9Sa5FZnjUzQap4yh2m3FxhY
 bvajFRqXn46FDxgd64ykCyTtczVGwUH8vQs6MKJ6/PAIYfbiFTAtoBNXrTZ1kr0CWo
 0G3co3+uczamhorX37a5A1hBMsuD59KrKxAE0teGfRHyXVRXGJwqGblV7qnU+GCHnq
 pshmjvXUmbk+OFTLLgqZGc4pDW7RCr2wqDSzYAwOon7UHAqoKZypQ4twjSlpTpgV6B
 pAmqX1Qu0WZkA==
Date: Tue, 25 Feb 2025 14:55:51 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/sched: Remove kthread header
Message-ID: <Z73L5_wrBWudDemZ@cassiopeiae>
References: <20250225131332.83415-2-phasta@kernel.org>
 <20250225131332.83415-4-phasta@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225131332.83415-4-phasta@kernel.org>
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

On Tue, Feb 25, 2025 at 02:13:34PM +0100, Philipp Stanner wrote:
> The kthread header doesn't need to be included anymore. It's a relict
> from the days when the scheduler was still using a kthread instead of
> workqueues.
> 
> Remove the unneeded includes.
> 
> Fixes: a6149f039369 ("drm/sched: Convert drm scheduler to use a work queue rather than kthread")
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> I'm not sure whether we should Cc the stable kernel. It's inconvenient
> and makes build times slower, but isn't really a bug.

I don't think that's needed. Analogous to the previous patch of this series, I
don't even think it should have a 'Fixes' tag.
