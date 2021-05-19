Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8C3389317
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 17:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104EE6EE0D;
	Wed, 19 May 2021 15:56:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4EB6EE0B;
 Wed, 19 May 2021 15:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=GCiO5jtPmcXxtuD2cYz4lG/3Yt3JBlECnMVfp0AvOxQ=; b=RAptUpFt5PkVRnPKRgjbxl9670
 5WPlJcxK0CFHlUd7Z+x2UZeVDeCeXQxPUyJj+WPPAFZkU5UAv+8NrGBdwPcft52DICFAmwXACMFNs
 ZLzimhPgjudhWjPWLzf+0N+D6YsKw8lFG9Js43cvA3Osh97QRPOt8hzV6E6Gqu0F8K9QE0IO759Kf
 AdNJHdPPtDmLA/mOyIhXzqWVrPlZaLFc+eewZ87vS5NRb2Vhr0UifYAjKULtIjLVu4Pkr4Yh1o2cl
 oogv7P4f1wVw2aRewWVZ1H3aAPehsezMVcJXH/dpGBLIXcrkSpjc8ZZzFNwVpabKx17STrUzJy98j
 KKJTJ7hg==;
Received: from [2601:1c0:6280:3f0::7376]
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1ljOYk-00Fbf9-Fy; Wed, 19 May 2021 15:56:34 +0000
Subject: Re: [PATCH 1/3] gpu: drm: replace occurrences of invalid character
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 David Airlie <airlied@linux.ie>
References: <e606930c73029f16673849c57acac061dd923866.1621412009.git.mchehab+huawei@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f0589aff-a776-0715-e421-0d9a8cf2cc25@infradead.org>
Date: Wed, 19 May 2021 08:56:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <e606930c73029f16673849c57acac061dd923866.1621412009.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>,
 amd-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 intel-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/19/21 1:15 AM, Mauro Carvalho Chehab wrote:
> There are some places at drm that ended receiving a
> REPLACEMENT CHARACTER U+fffd ('�'), probably because of
> some bad charset conversion.
> 
> Fix them by using what it seems	to be the proper
> character.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/gpu/drm/amd/include/atombios.h       | 10 +++++-----
>  drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  2 +-
>  drivers/gpu/drm/i915/i915_gpu_error.h        |  2 +-
>  drivers/gpu/drm/r128/r128_drv.h              |  2 +-
>  4 files changed, 8 insertions(+), 8 deletions(-)
> 

-- 
~Randy

