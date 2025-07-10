Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C40E6B002D8
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 15:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C1810E8CF;
	Thu, 10 Jul 2025 13:04:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PP2eagOu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD7110E8C8;
 Thu, 10 Jul 2025 13:04:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6AB185C6DCF;
 Thu, 10 Jul 2025 13:04:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D82CC4CEED;
 Thu, 10 Jul 2025 13:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752152666;
 bh=BHOC+TSzhCIVcZOw1VLJxp7vsQPBk3FHoqJH1ZVtsmk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PP2eagOuc8IoRtNsmCjaToKfVumdA4viRj1tH5reOUDGB9E7A1QU7EmdMGJCX2J+f
 tZ+1X7IsGl6tDNR5vm6glWzd7D4zvstdMS7UzlcA6CCZFHYZKIi5Q5JQgVmR3ZPWes
 WwGJ0IeYTSkBT0ROWSoXAjlvafNE4ETR9jt3fMp+ybfbLqM+EYj5NzkPmXy5tBtv9E
 X8PmSYzKF5mpgsG4WLH7eUhtW5Q6thaMz6l3KEQU7A6a8xn66clQx/pJj1Az+VZjAI
 /tYFj1UEEfL33BqfBw6onSzJj3wACTtUzUyoBiK2lCU+XocpL52IynxguROiXZms1o
 5wVJ+w1qy4xqw==
Message-ID: <eb83c9ec-47cc-4f56-b5fe-d912d3a085fe@kernel.org>
Date: Thu, 10 Jul 2025 15:04:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] drm/sched: Warn if pending_list is not empty
To: Philipp Stanner <phasta@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250710125412.128476-2-phasta@kernel.org>
 <20250710125412.128476-7-phasta@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250710125412.128476-7-phasta@kernel.org>
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

On 7/10/25 2:54 PM, Philipp Stanner wrote:
> drm_sched_fini() can leak jobs under certain circumstances.
> 
> Warn if that happens.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Acked-by: Danilo Krummrich <dakr@kernel.org>
