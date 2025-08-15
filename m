Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E54FBB28772
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 22:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE1010E97F;
	Fri, 15 Aug 2025 20:57:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uI8Jlx8+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1708D10E280;
 Fri, 15 Aug 2025 20:57:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DF78FA583F9;
 Fri, 15 Aug 2025 20:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22BC2C4CEEB;
 Fri, 15 Aug 2025 20:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755291454;
 bh=BV2i9bTImMy1rgp5jv7+5mpj/pVe7ucb3EUOIBIWTbo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uI8Jlx8+PL29U1PLyI0ROPRaY9QHtX4+Wsa3JxXnae8Pw+1FmS7Gs1pGACscxY9fD
 L5zCivpUGY2ldegPZr1JPbBZlJJNOn3GdfmlrK67VRfJ30Yb7u/42/LKa2Ipg3RV97
 L4K5ejBOvhcFT/+DzXMCEWBZ1HA/+57cP+YyrpXCObBYXUtGZV4At8sJBhaFTQIH+1
 jr/NsI+uGDfWnZhgRNPG9LwJfv9e9HRplYi22piFPcV7aHELIxJefGozx8WyYLQpwa
 HB0wQT6nX5+2JM+iEVpVfjGBzl6E/AtE8e7mkuAvBfJn1Ci106HnpyoKIXVepcXsV+
 vAOQV3SizOBXQ==
Message-ID: <6dfcf686-d212-4768-91d7-992f34932980@kernel.org>
Date: Fri, 15 Aug 2025 22:57:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/nouveau/gsp: fix mismatched alloc/free for
 kvmalloc()
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 Timur Tabi <ttabi@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250813125412.96178-1-rongqianfeng@vivo.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250813125412.96178-1-rongqianfeng@vivo.com>
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

On 8/13/25 2:54 PM, Qianfeng Rong wrote:
> Replace kfree() with kvfree() for memory allocated by kvmalloc().
> 
> Compile-tested only.
> 
> Cc: stable@vger.kernel.org
> Fixes: 8a8b1ec5261f ("drm/nouveau/gsp: split rpc handling out on its own")
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> Reviewed-by: Timur Tabi <ttabi@nvidia.com>
> Acked-by: Zhi Wang <zhiw@nvidia.com>

Applied to drm-misc-fixes, thanks!
