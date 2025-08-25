Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DD4B34BEC
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 22:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96BE10E35D;
	Mon, 25 Aug 2025 20:30:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GC8gFRgr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B4B10E35D
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 20:30:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0EDE1435AE;
 Mon, 25 Aug 2025 20:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9B62C4CEED;
 Mon, 25 Aug 2025 20:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756153817;
 bh=0kTs8u7XOu5hziZIWSqcPnlVhzZIFyIGWTdZxZ8r0ZY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GC8gFRgrWVeIdDe4Q5ntB8ZqjhXF2RUqA5f+29BaJ4aSJosIF2u1dogbBSjQNwOGB
 k5YPE95zF7XkIkWq117fqydHAjrqkWwoggRUmkZMJot3BYu4aU7Jg5YtL4IFdkHBQS
 cxtPh04pDDykMhnhrfnt3OcmPXLJluGc9bzk07mttFbsoidGNNX2NvZoXahWf08r2W
 sk1jhNTJ0vRxN8MmsHy68gNh91Dpeo16er3H4Ayl3gZB/xDbZxGCPGbHKaGnGJ3ZnA
 vQq6akvkTCe3ZzglO58waiV5+cuGrVBfdaFVlU9ZMQaDzVCv5UhNqgixMMdb44YNp4
 ZcSgFizD+0EPA==
Message-ID: <7b4bd666-3f74-4c99-b073-03cd2a090eab@kernel.org>
Date: Mon, 25 Aug 2025 22:30:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gpuvm: fix various typos in .c and .h gpuvm file
To: Alice Ryhl <aliceryhl@google.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250825-gpuvm-typo-fix-v1-1-14e9e78e28e6@google.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250825-gpuvm-typo-fix-v1-1-14e9e78e28e6@google.com>
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

On 8/25/25 11:22 AM, Alice Ryhl wrote:
> After working with this code for a while, I came across several typos.
> This patch fixes them.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to drm-misc-fixes, thanks!

