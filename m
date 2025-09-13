Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A206B55FD5
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 11:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C9E710E0EE;
	Sat, 13 Sep 2025 09:20:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="O1CiecMP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E78C10E0EE
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Sep 2025 09:20:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CA8DD40B4C;
 Sat, 13 Sep 2025 09:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E0E1C4CEEB;
 Sat, 13 Sep 2025 09:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757755245;
 bh=VhNgzjWhFHAY0JxD/ASuTUD+uwaVreOCvGCE2RaFaI4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=O1CiecMPE8eFgu/Sd3KKqnFogWYsshlSz9xI54uJMp/XIShlKPDTZTA7m7M9NRwVF
 BXzo6HDsGOPlW/30698/zkMXLgsPudEk8ZgCV+etF4E1YfFGl520Gr6DlBon3gbU4f
 KvC+iAc/pSFtxV9lg8eTNr5Qa5Dzc+1yAI3nZKyz++uYQed62aICPZAxg051t1hNAH
 QR7vrlBymqccnURbj7Zyhp74nNp3kuKm9Jldmab+aFL25EFlCO1EKdQe9r+M+WoZPG
 8J1M7xLZQAhNvwvPXFPFVcaiFoC/BXqBd8m5LF1pqsl0QM3KyNTp2LYoHzOVC/eLj6
 RgLTe5jnt77dg==
Message-ID: <3c6ebf82-c3cd-47e7-b8c7-21c767b08722@kernel.org>
Date: Sat, 13 Sep 2025 11:20:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm: Add directive to format code in comment"
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Javier Garcia <rampxxxx@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>
References: <20250912130649.27623-2-bagasdotme@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250912130649.27623-2-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On 9/12/25 3:06 PM, Bagas Sanjaya wrote:
> Commit 6cc44e9618f03f ("drm: Add directive to format code in comment")
> fixes original Sphinx indentation warning as introduced in
> 471920ce25d50b ("drm/gpuvm: Add locking helpers"), by means of using
> code-block:: directive. It semantically conflicts with earlier
> bb324f85f72284 ("drm/gpuvm: Wrap drm_gpuvm_sm_map_exec_lock() expected
> usage in literal code block") that did the same using double colon
> syntax instead. These duplicated literal code block directives causes
> the original warnings not being fixed.
> 
> Revert 6cc44e9618f03f to keep things rolling without these warnings.
> 
> Fixes: 6cc44e9618f0 ("drm: Add directive to format code in comment")
> Fixes: 471920ce25d5 ("drm/gpuvm: Add locking helpers")
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Applied to drm-misc-fixes, thanks!
