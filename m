Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14461B40A13
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 18:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC4510E7D7;
	Tue,  2 Sep 2025 16:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HzbY+U4j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E58610E7D6;
 Tue,  2 Sep 2025 16:02:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 777C96000A;
 Tue,  2 Sep 2025 16:02:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEC43C4CEED;
 Tue,  2 Sep 2025 16:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756828976;
 bh=WD5QoiSFvm8FXaT2EJFv8YYAQhHRSKqn05M5i5Mz+EM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HzbY+U4j6voVv+KrLHsqxwrKrTfsLH6REHFC5I2RRYxOH/WP8K0++Sy0O/YAykah6
 NZKkHnJskDv2qURIqXSnFeVb5fH4CYSNotm821tH2cwfdSStUXgjBbKRYkQ6lE4z5x
 S1E3nSuVZ8dhJsTORh3jpibyuRvDrQguAx64h883ziwg5NW8Ez+U7Sr5VfQhBFFUKU
 ZQMkEr5WUXUYofZQu66e6uub6ETpz23h3V7Xe8cq4MJYD85+FX/VNvabx1fxRQF5uS
 N2jDOQI6j63kxatcqHZYYPQt9pJJz2m4m/A0hpgXQRV0ejuvwHJ8YTSh1prd5K6XO2
 J8YPQT7Hhpvbg==
Date: Tue, 2 Sep 2025 18:02:53 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Nitin Gote <nitin.r.gote@intel.com>, 
 =?utf-8?Q?Miko=C5=82aj?= Wasiak <mikolaj.wasiak@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>, 
 Andi Shyti <andi.shyti@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915: Replace kmalloc() + copy_from_user() with
 memdup_user()
Message-ID: <xbqfj4owftg2fwbxhj6zgajzzb2kgmgzk7dr6xcn2nudojl7sp@rulvri7zbwdf>
References: <20250902081046.35463-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902081046.35463-2-thorsten.blum@linux.dev>
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

Hi Thorsten,

On Tue, Sep 02, 2025 at 10:10:42AM +0200, Thorsten Blum wrote:
> Replace kmalloc() followed by copy_from_user() with memdup_user() to
> improve and simplify set_context_image(), and to silence the following
> Coccinelle/coccicheck warning reported by memdup_user.cocci:
> 
>   WARNING opportunity for memdup_user
> 
> No functional changes intended.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
