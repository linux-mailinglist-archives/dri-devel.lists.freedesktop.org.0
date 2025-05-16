Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC1BAB9E47
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 16:10:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B681010EAD3;
	Fri, 16 May 2025 14:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X3FjzwdT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556D210EAD0;
 Fri, 16 May 2025 14:10:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 37CD94A7F6;
 Fri, 16 May 2025 14:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1CE9C4CEF0;
 Fri, 16 May 2025 14:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747404619;
 bh=ufg0qaE/qIE5yWtOVN11g0Zxbb2Wd04AflOuDLEMAq8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=X3FjzwdTgX/7pWNU7P01oSOCATpsEBcg4K4FqDs1ksWsig9g+eCjJWst/7xA7wynt
 k+2HudgqC2EvKyOJ1MIneG9d7gDLEEOGHU8mE/zw+J6IvSjWbupc7ucWauvdzDPoCf
 HUB9w+lAU4yNfp26OtJemVPTtScZuCU+IcP9T4H/vnPFpZuPWwIeEpGEaOLAIbp/vL
 UmHZInl5av2M6EItSkTX8+0HFoqXofgP2CPHr110jT3HVdrJNBiKA2J/NmWi7lBr/0
 Gx/dBQ5sac2QT7Q5rxuFhGwsRhHCi2upLOtRmm0KWSLf2bewwV7OSSlOtq+0SHu/mA
 MPvQ7qdyq0/Dw==
Message-ID: <8afbeffb-93c4-4f0b-8f3f-3b7ff7bc8147@kernel.org>
Date: Fri, 16 May 2025 16:10:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] drm/nouveau: Simplify nouveau_fence.c
To: Philipp Stanner <phasta@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20250424130254.42046-2-phasta@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250424130254.42046-2-phasta@kernel.org>
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

On 4/24/25 3:02 PM, Philipp Stanner wrote:
> Just some minor attempts at improving the readability of
> nouveau_fence.c

Applied to drm-misc-next, thanks!
