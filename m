Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B99FAB89C3
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 16:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1821710E8D6;
	Thu, 15 May 2025 14:46:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jmV0kZfn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B13B910E8D1;
 Thu, 15 May 2025 14:46:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DA6C0614BC;
 Thu, 15 May 2025 14:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 253DBC4CEEB;
 Thu, 15 May 2025 14:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747320388;
 bh=gjG62P0KJg9wb0PDRXb676J64qlF8OEy7LbdgiIXd/o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jmV0kZfnqbImnaypqTb06/ZzoXhb9tOyznk7YxlUw5auTR/okdycot9MzWtR3Y1zu
 n0VQ4XsErpBYKUpoDSfXPzdzJuoQbfk3YjSyuFpX0mT6b1rsLCGyu/NBsYKZYdJILT
 KoM7EVgll+PczznVlJAUB7JgPUWJsN2kby6Tlcx4bx0cOZOzveAh13T1TA9j1ewqIy
 DXlLrpqWykZpR1t9T2zzZ5kR5rNtlCZYSy6226H5T6G5UHALrvHE18DykOvYJa1wjJ
 ycID4vr172cNk0xuBwkttO2Gg1I0BWj70WLRVS4Pcs6zhPzlyd7EEy/URoBqL/PnDp
 1EA+4PQejXk3Q==
Date: Thu, 15 May 2025 16:46:22 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 amd-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH v4 5/9] drm/i915: Use dma-fence driver and timeline name
 helpers
Message-ID: <gyd2k57ixbkgpogiwm3dyfh24rx74bmi4zn5ftrdnytkfjl34l@moakdhxq3n4d>
References: <20250515095004.28318-1-tvrtko.ursulin@igalia.com>
 <20250515095004.28318-6-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250515095004.28318-6-tvrtko.ursulin@igalia.com>
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

Hi Tvrtko,

On Thu, May 15, 2025 at 10:50:00AM +0100, Tvrtko Ursulin wrote:
> Access the dma-fence internals via the previously added helpers.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
