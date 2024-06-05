Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 984B68FC6EF
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 10:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DFEE10E05A;
	Wed,  5 Jun 2024 08:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="haV0aaQZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 761FB10E05A
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 08:49:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CF058CE169A;
 Wed,  5 Jun 2024 08:49:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C212EC3277B;
 Wed,  5 Jun 2024 08:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717577353;
 bh=JjXycMB+UqofoXqKE5vSjfJF5EJSafdp3RsWbH44+Uo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=haV0aaQZMcCfFpvDsWSdlKws6MJkEAYlKF9SwVCgMY5iXvbKdM5aDWyO3qews4MlB
 YlXcHhHL1qFKyH8PXmauJa0aYNI65a0YY1USSTqZKMlXx50hIv8Q/2wEx0YX+sSpPL
 npR+2G1LffhoKJGbJ/jSQSpLbuz3x0gtfBEBbpHixqurRFtg8sFnpjdMgPSe6p8JlD
 3TARNfTqbprNbTjFP11frLXdTZOWxWGvwMurFu9Uu+nDnBDoHBT5gzGKoqP6kOAM8i
 4b5wvBWEvgp6OhiQs90epXonLwlV9pGkFWPt0bSZIDllkaCm/L/fNeSuNNg7yCgQaU
 GJ8gW6bbA152g==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tursulin@igalia.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 kernel test robot <lkp@intel.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>
In-Reply-To: <20240604160210.24073-1-tursulin@igalia.com>
References: <20240604160210.24073-1-tursulin@igalia.com>
Subject: Re: (subset) [PATCH] drm/v3d: Fix perfmon build error/warning
Message-Id: <171757735030.3346529.18146792243875998148.b4-ty@kernel.org>
Date: Wed, 05 Jun 2024 10:49:10 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

On Tue, 04 Jun 2024 17:02:10 +0100, Tvrtko Ursulin wrote:
> Move static const array into the source file to fix the "defined but not
> used" errors.
> 
> The fix is perhaps not the prettiest due hand crafting the array sizes
> in v3d_performance_counters.h, but I did add some build time asserts to
> validate the counts look sensible, so hopefully it is good enough for a
> quick fix.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

