Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 941FDA7A37C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 15:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4CF10E9AC;
	Thu,  3 Apr 2025 13:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JvbDGYOR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF8F910E9AC;
 Thu,  3 Apr 2025 13:15:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6A56A5C4485;
 Thu,  3 Apr 2025 13:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D4D6C4CEE3;
 Thu,  3 Apr 2025 13:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743686131;
 bh=r4n/nElshuEC+N/oCbbDCl2TaTMzeqJvA0E1GhChm2s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JvbDGYORWxXFYqROzffePhwsr3Gp9fXm75EwuFZpPa1CWJ0B/HHQXNKE8FFykhtuN
 ABrrdG1HJW9UFSzkn5f4amdVgsn1ckORpYuX/JUBNNhEs9HrXaBjefz4+iMoAtTawS
 fQyiuoGferImQDO+gcmNi2laXyu0uc5zrTkAgOAGejOOMBxfXSq4PKt4rdW8kHi8BY
 6fmnxStLeYEjFgssbD5NuRFupOZVAliz+iiyqmZMv1GxzSBDyqCZxa2e4zGdD8P2N9
 RpNGNyf/+fIhKKwCQHfCLtTb5nPcsulrdrPV7rF0Lfy0uvDGl/e5z4So0rA0C+075A
 CxD5w/7dDFVFA==
Date: Thu, 3 Apr 2025 15:15:25 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: phasta@kernel.org
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] drm/nouveau: Prevent signalled fences in pending list
Message-ID: <Z-6J7bngU2JtfMMN@pollux>
References: <20250403101353.42880-2-phasta@kernel.org>
 <c779bc2f-06af-4278-8bb5-08afc074b580@amd.com>
 <2558c9cf0cf28867238eb21950ce2a3f862c15c3.camel@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2558c9cf0cf28867238eb21950ce2a3f862c15c3.camel@mailbox.org>
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

On Thu, Apr 03, 2025 at 02:58:13PM +0200, Philipp Stanner wrote:
> On Thu, 2025-04-03 at 14:08 +0200, Christian König wrote:
> > Am 03.04.25 um 12:13 schrieb Philipp Stanner:
> 
> > BTW: nouveau_fence_no_signaling() looks completely broken as well. It
> > calls nouveau_fence_is_signaled() and then list_del() on the fence
> > head.
> 
> I can assure you that a great many things in Nouveau look completely
> broken.
> 
> The question for us is always the cost-benefit-ratio when fixing bugs.
> There are fixes that solve the bug with reasonable effort, and there
> are great reworks towards an ideal state.

That's just an additional thing that Christian noticed. It isn't really directly
related to what you want to fix with your patch.

I think the function can simply be dropped.
