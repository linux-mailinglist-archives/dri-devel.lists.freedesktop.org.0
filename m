Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D88AFB4FD
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 15:46:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C0C10E496;
	Mon,  7 Jul 2025 13:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KETZBJ2v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD2B10E496;
 Mon,  7 Jul 2025 13:46:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6697661472;
 Mon,  7 Jul 2025 13:46:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3DA5C4CEE3;
 Mon,  7 Jul 2025 13:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751895960;
 bh=qBEShQcOVBCT9+1/5YtR3gvw/34cw/qld5Qg4vz6MZ4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KETZBJ2vFpvziF6BdYUYQ8slMZxelmN7tj51PMoa6IqADIf38mlncS8xruFhpc3Ek
 kXh38/FSCZWuPP4F3RfQJl0ss8iWr1MUWUKM8SfGd9hCAjc6jtngoxebzRmq1MbEgy
 H45wutLE0KwSh+98I+WT3qDh4fNtaYzwqTYXfOlqyVCs/58gS93mVCRs3sRf2eZhWN
 b4Y344eNve0wvsj1En1VKe1nUPV9vXSgsomNoPcsqOL/y5F7apvfRlxbhrkB8PN0Bf
 xJmc4XwxJg+eN9kQ4B0JZInbee5wI7j9ORNunH2spm7HbkD2gMRfwi06TjsxJTIwDZ
 gM/vJmtYM8s6Q==
Message-ID: <41cb0bb2-8459-4051-b826-d231c3cbfdd3@kernel.org>
Date: Mon, 7 Jul 2025 15:45:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] drm/nouveau: Make fence container helper usable
 driver-wide
To: Philipp Stanner <phasta@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250707134221.34291-2-phasta@kernel.org>
 <20250707134221.34291-7-phasta@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250707134221.34291-7-phasta@kernel.org>
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

On 7/7/25 3:42 PM, Philipp Stanner wrote:
> In order to implement a new DRM GPU scheduler callback in Nouveau, a
> helper for obtaining a nouveau_fence from a dma_fence is necessary. Such
> a helper exists already inside nouveau_fence.c, called from_fence().
> 
> Make that helper available to other C files with a more precise name.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Acked-by: Danilo Krummrich <dakr@kernel.org>
