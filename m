Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2998B1F496
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 14:38:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F6310E0EC;
	Sat,  9 Aug 2025 12:38:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oIRviGx2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D25610E0EC;
 Sat,  9 Aug 2025 12:38:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 26B60601E0;
 Sat,  9 Aug 2025 12:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7C23C4CEE7;
 Sat,  9 Aug 2025 12:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754743104;
 bh=mfj8l/jji6+mSWO4VqUyU4IwT2ivmhxapsG2ScXQlVk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oIRviGx2luQmHQHen1bqtwnjHv1Q83WQRePmFTPW0SBC6RlaGPQ6JakssQU0dhmv4
 Dfw7q5GjSiQkEUKxXtJjvky3lBmBJgtX+xEbISAqz28S3kYip7/w73Phh/DrSNuYnz
 6SwIoFqGl8fsFEDEyKZl2nIWh//AzziUEKFwxU8Yv5xUbCdztMkhfo3EZsLwk33HhK
 WkmRWtsYepNvxEjSnQFbVgy8e6sJD7PZUncof8ZqcFTQikfuMbM1cOCMrUkN36/ZAG
 y3TuQmg1lpPzyUkZpmsNIvIEc6r4v5+l2XdqB4sCILsTHvZfOQqCW6TtcBQ28C6cy3
 cKoQRHsJnPehg==
Message-ID: <689070db-1afc-42dd-857d-4edd0ee3d040@kernel.org>
Date: Sat, 9 Aug 2025 14:38:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: fix typos in comments
To: Madhur Kumar <madhurkumar004@gmail.com>
Cc: lyude@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
References: <20250808073840.376764-1-madhurkumar004@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250808073840.376764-1-madhurkumar004@gmail.com>
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

On 8/8/25 9:38 AM, Madhur Kumar wrote:
> Fixed three spelling mistakes in nouveau_exec.c comments:
>   - alloctor -> allocator
>   - exectued -> executed
>   - depent -> depend
> 
> No functional changes.
> 
> Signed-off-by: Madhur Kumar <madhurkumar004@gmail.com>

Applied to drm-misc-fixes, thanks!
