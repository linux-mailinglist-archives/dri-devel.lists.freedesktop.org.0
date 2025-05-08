Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 871FAAAF15D
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 05:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C4610E15A;
	Thu,  8 May 2025 03:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cOGBHFta";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7823510E15A;
 Thu,  8 May 2025 03:01:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5DB39629E7;
 Thu,  8 May 2025 03:01:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F03DC4CEE2;
 Thu,  8 May 2025 03:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746673291;
 bh=Xrh96RoA/f/NJpZEpoIgqKMhNzj7nFGY7CfMX0FrR/U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cOGBHFta6HOVJNokUXV8bLxjXnILVj9OzrQFZEGC2yEpAUCjPI4splRyNHrLdkNLC
 OulWNRTLMYEie7nb7ZBJeN2QGxNwCg5gGp0/R8B/r+kYJjRVHkah/ex8BnrJdLt1QV
 3pOWvO+rPKJ/y8piy9bxj7nVjqZ7lL+Yx5PvLyHcxZllIXkNhcx1zhJ3E1aVuiyiv5
 3DHPKW8TT2o3mGceXYLh7PRYUudwOYC+XYQR8mddRW5c1EHGmfD8k4WWyEVBi7JaRb
 4be8uXdHfhh/abghEsNWlf4WtBvVWFKnFN7CtfSvJldN0KQSd7KTq48dCNqpSjrLO3
 0GCKv7LHzxnZw==
Date: Wed, 7 May 2025 20:01:29 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Kuniyuki
 Iwashima <kuniyu@amazon.com>, Qasim Ijaz <qasdev00@gmail.com>, Nathan
 Chancellor <nathan@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v8 10/10] ref_tracker: eliminate the ref_tracker_dir
 name field
Message-ID: <20250507200129.677dc67a@kernel.org>
In-Reply-To: <20250507-reftrack-dbgfs-v8-10-607717d3bb98@kernel.org>
References: <20250507-reftrack-dbgfs-v8-0-607717d3bb98@kernel.org>
 <20250507-reftrack-dbgfs-v8-10-607717d3bb98@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 07 May 2025 09:06:35 -0400 Jeff Layton wrote:
> + * @quarantime_count: max number of entries to be tracked

quarantime
        ^
:(
-- 
pw-bot: cr
