Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6CDAB8A44
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 17:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C6810E8ED;
	Thu, 15 May 2025 15:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="t+CWyul2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8050410E8ED;
 Thu, 15 May 2025 15:08:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 60D8643FB8;
 Thu, 15 May 2025 15:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8735C4CEE7;
 Thu, 15 May 2025 15:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747321715;
 bh=T5kkul3BV/QRdJCmvk/2TGfIferyKnWXjHhzw3j3+nQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t+CWyul29adiQPxbMua9d+kdRwATeyVhkYU+3SwDW0I66ifkeamziYp9N9Fw8DEAw
 GMAyA73di3gUImvFXL2p3bc2kml5NqP8jlvj2vN0f31d/+uZhBJE7IXr6NR40/59Wz
 9OyEcFqQi/HzagO8H16rjt4y4NO/sJKlgQ45TW0EyzFyHdqERgrlu1A3OhYjsC4pc6
 avqnoanQ9XGgGJg+VDXQQpI4gyWsqqWNLQb8vyBZpP0Hso+7ezm9nXH9EXL1MWY3AU
 BWh7rjkPTL8ip6qOCY5qRZp1E/cCdzReuDTxa7JH4pO0c1ALHHLzbfej4x7JUSss7Y
 Priro14hBexoA==
Date: Thu, 15 May 2025 17:08:29 +0200
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
Subject: Re: [PATCH v4 8/9] drm/i915: Protect access to driver and timeline
 name
Message-ID: <zlpoo6ve2tpzmooliqodcmobntgzjamzrco4amn6mnxf473roc@xv473ar3qcec>
References: <20250515095004.28318-1-tvrtko.ursulin@igalia.com>
 <20250515095004.28318-9-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515095004.28318-9-tvrtko.ursulin@igalia.com>
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

On Thu, May 15, 2025 at 10:50:03AM +0100, Tvrtko Ursulin wrote:
> Protect the access to driver and timeline name which otherwise could be
> freed as dma-fence exported is signalling fences.
> 
> Now that the safe access is handled in the dma-fence API, the external
> callers such as sync_file, and our internal code paths, we can drop the
> similar protection from i915_fence_get_timeline_name().
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
