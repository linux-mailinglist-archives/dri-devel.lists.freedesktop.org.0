Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D753B3C28B
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 20:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2FCC10EC2D;
	Fri, 29 Aug 2025 18:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ahto970C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3574910E1FA;
 Fri, 29 Aug 2025 18:37:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1536560146;
 Fri, 29 Aug 2025 18:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04B7BC4CEF0;
 Fri, 29 Aug 2025 18:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756492637;
 bh=W5n8+hlytq7ASISeL9ErQDXq9duSkQKAbex6L2az1Zg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ahto970C/IhOm3AhaKx816EtPJ7M9zGDDCIDpKL6rHNFXRV1GhSqstdsV5RGVkT7k
 xHEF1moRLHaYs1oiTevVS3/I4BtP5AdeIvPSboc0Mv8bNWEUnP6P/h6Hr8j/aAyaWa
 md+OX6wLVBxCC9J+CC5Nztr5VRrlKESrqImMluVENAvXijHYy69L/unxe3S9+91w3L
 O39W6lfrqgjT9zfyfmNeL0VCiT6aajE/Z2S3WE3XLVdJIhSCFhts85Zv2X1oxVy2BX
 22WyN2BJlcXldCUF9+WPGqLJsyZ6eXIenfzRtIJecEjzuyrE12Zh7HZhOxPQ0K7hP7
 vJkaX3o1zyfSQ==
Message-ID: <a84b3b1e-7095-4411-8ee9-53caa1b18962@kernel.org>
Date: Fri, 29 Aug 2025 20:37:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm/nouveau: Remove waitque for sched teardown"
To: Philipp Stanner <phasta@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250829183044.213380-2-phasta@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250829183044.213380-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 8/29/25 8:30 PM, Philipp Stanner wrote:
> This reverts:

Thanks for sending the revert!

> commit bead88002227 ("drm/nouveau: Remove waitque for sched teardown")
> commit 5f46f5c7af8c ("drm/nouveau: Add new callback for scheduler teardown")
> commit 89b2675198ab ("drm/nouveau: Make fence container helper usable driver-wide")

I think we only need to revert the first two patches, we can keep the last one.

Eventually, we'll take advantage of the scheduler callback for EXEC jobs only,
so we can keep this.
