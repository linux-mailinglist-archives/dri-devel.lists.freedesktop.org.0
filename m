Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C3BB2860A
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 20:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3790C10E031;
	Fri, 15 Aug 2025 18:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FNZOkHKY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E05A10E031
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 18:53:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 27AF6613FD;
 Fri, 15 Aug 2025 18:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65E20C4CEF5;
 Fri, 15 Aug 2025 18:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755284013;
 bh=88A8SsAWlEkSBITeV1u5QVhR5tRMTyKUnag0c/Hm5iA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FNZOkHKY7WcR1aE2fILAlDHtK4Ln/hCOrZPlGbDn8ZPv49T7LM9zf6YHKbOr1TSYf
 JanVedJY9glCi2I7qcKcp7HXZx+zZyDbLx0B2pujOA+dm0Wz+OAHLOTPjIPC4Y3JQL
 X7zVF9xbwJSsQRIr87pPdS0M+keXPH0ocn0R30axL72i9C8uLMUQQvyPtVlnutMAjH
 J4XCzaN9lPS4667TWDgaLWiEXuWKBIekYobQKX25RdsA7O3qfhEFP/3l6dULDSRWB3
 pSu/HIjxaV+Cn5pJ3bkf/q9HqMOQ2KyW9Cgf11gf+4EXkB1OyBHOcRfAzyn+bn0pfw
 CdC8P0OcuMZTQ==
Message-ID: <f3b13797-07a0-4b2f-897a-e4ef2a11d6cc@kernel.org>
Date: Fri, 15 Aug 2025 20:53:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm: Add directive to format code in comment
To: Javier Garcia <rampxxxx@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 robin.clark@oss.qualcomm.com, antomani103@gmail.com,
 dmitry.baryshkov@oss.qualcomm.com, me@brighamcampbell.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <DBYS3FAEVMHC.178SXO45NIBI8@kernel.org>
 <20250810150706.305040-1-rampxxxx@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250810150706.305040-1-rampxxxx@gmail.com>
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

On 8/10/25 5:07 PM, Javier Garcia wrote:
> Add formating directive line in function `drm_gpuvm_sm_map_exec_lock()`
> comment to clear warning messages shown bellow that appears generating
> documentation `make htmldocs`.
> 
>    Warning: ./drivers/gpu/drm/drm_gpuvm.c:2444: Unexpected indentation.
>    Warning: ./drivers/gpu/drm/drm_gpuvm.c:2446: Block quote ends without a blank line; unexpected unindent.
>    Warning: ./drivers/gpu/drm/drm_gpuvm.c:2450: Definition list ends without a blank line; unexpected unindent.
>    Warning: ./drivers/gpu/drm/drm_gpuvm.c:2451: Definition list ends without a blank line; unexpected unindent.
>    Warning: ./drivers/gpu/drm/drm_gpuvm.c:2455: Unexpected indentation.
>    Warning: ./drivers/gpu/drm/drm_gpuvm.c:2456: Definition list ends without a blank line; unexpected unindent.
>    Warning: ./drivers/gpu/drm/drm_gpuvm.c:2457: Definition list ends without a blank line; unexpected unindent.
>    Warning: ./drivers/gpu/drm/drm_gpuvm.c:2458: Definition list ends without a blank line; unexpected unindent.
> 
> Fixes: 471920ce25d5 ("drm/gpuvm: Add locking helpers")
> Signed-off-by: Javier Garcia <rampxxxx@gmail.com>

Applied to drm-misc-fixes, thanks!
