Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4B9AFB5F0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 16:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE8910E4AD;
	Mon,  7 Jul 2025 14:26:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WXgFnxf4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566D310E4AA;
 Mon,  7 Jul 2025 14:26:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9C033A54046;
 Mon,  7 Jul 2025 14:26:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44423C4CEE3;
 Mon,  7 Jul 2025 14:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751898385;
 bh=pxxSWw0ZaWXiIlPKV16cK66booNTkS+AQKK4//X9m6Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WXgFnxf49GUpq2xaGWsdgdw4o1mY2SGZjxw6Us19b5sh+qMPCUI4lV+8zMyKuqdFV
 K92lGix+rpjEtR3gM1oiZGNBPOA0ntfV+PCqKVMDAQHK/J9cVGqxqscMKMnxuZOcfi
 XjXMgkl5B5QbVwLPcPBe5/XweUBWYAXvHgGqFtwK+ajs7dQ2egbnS7G817K8Kfb/vN
 Z3Ywrz9Qs7BukE3GhziisRwLurpR7Qjtqqm7+bSV8838hzQgCt8RRQdAuYY9PXdevZ
 UByzCvf/rPm2kSpc7TPOtk4CmqW1pTyNUJ+E2IjCwr9BXkjqm0qtIi26xVtvz/L67S
 cB9yBqb8qSXXA==
Message-ID: <91a3d9ca-0420-4f80-893d-708db57b3d13@kernel.org>
Date: Mon, 7 Jul 2025 16:26:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] drm/nouveau: Add new callback for scheduler
 teardown
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
 <20250707134221.34291-8-phasta@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250707134221.34291-8-phasta@kernel.org>
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
> There is a new callback for always tearing the scheduler down in a
> leak-free, deadlock-free manner.
> 
> Port Nouveau as its first user by providing the scheduler with a
> callback that ensures the fence context gets killed in drm_sched_fini().
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Acked-by: Danilo Krummrich <dakr@kernel.org>

