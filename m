Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7BCAE8C31
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 20:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1F910E23D;
	Wed, 25 Jun 2025 18:20:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LPU68Xsr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695A810E23D;
 Wed, 25 Jun 2025 18:20:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C6AC361151;
 Wed, 25 Jun 2025 18:20:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EFE7C4CEEA;
 Wed, 25 Jun 2025 18:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750875653;
 bh=gaGzM2w31GMpScgpRrG0d0Qo6Bc7JT43U7e3UXyWTKM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LPU68XsrchUxw1g90Sarr0/D8SscqUfjU+zuO2UD6AB4xks+uZDrHkg3I88U1k6pE
 fq7x6zr23fEel7icKbPOcniuzE4H/bAUykpOFW1r7G+5wa2wLW1aazG9AjfHEivGvc
 xmS1kxGZb4Oi3/T2E6LBIX7g23Q4bPRX51cIO1rUZYlRMn2P1Hdf5TfY1XcVf9k10U
 /E/BrIPtdXzPB578hB0Qhi0t7uq1Bbbr4+sV58eG9nByFr5IsEwOig7sWPDIxtJK5+
 zNEbRHpZOhr/JB857o6FfpX1dN26dfwTavdMLleETWi8ny4NhX15UGPuTyOciFA5mu
 Nx3WQCEbVa+8w==
Message-ID: <cdaa3640-64ac-4fb0-ba6b-52dc65988d70@kernel.org>
Date: Wed, 25 Jun 2025 20:20:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova-core: replace `Duration` with `Delta`
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250624-nova-delta-v1-1-b37d75a593ac@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250624-nova-delta-v1-1-b37d75a593ac@nvidia.com>
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

On 6/24/25 2:59 PM, Alexandre Courbot wrote:
> The kernel's `Delta` type was not available when the `wait_on` function
> was introduced. Now that it is, switch to it as it is more compact than
> `Duration` and cannot panic.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Applied to nova-next, thanks!
