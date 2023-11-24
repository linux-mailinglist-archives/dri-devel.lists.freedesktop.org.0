Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C12F27F71C4
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 11:41:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274A210E1AB;
	Fri, 24 Nov 2023 10:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1F810E1AB
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 10:41:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3077962158;
 Fri, 24 Nov 2023 10:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80675C433C8;
 Fri, 24 Nov 2023 10:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700822486;
 bh=mx8zbhH9XuRFKow8SMM4vIllq541PDHZLX4FbTHewh0=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=qqxW+0tALhs6DPa50m/V0TDQBDRvKe6AVAWJNKYhn3V8Pyho0tFULZ7QAjdBeRiZs
 z4IodWvCbcDaqeIplw2I2Xc2q8vxPJthU8sMsFBRxH84qNOAAcVKkvX+7I+Jf8Ayhk
 xQgh62ZjZ6Pu++q35Yb86wsxRDAHjNS/zPkcvoe64CKbbrntFpNE8JAD2Dyi5zt8zc
 7p6INUCsxodERYJmS0t19p1m4z+XuNfeLutyVZAdO6sd+LhZ149p0PauBQOORB2tNT
 B+99y/nbY4HyeN/CCRge+Hye2knoWDH8DTYY/DzC9J6G3gMVGVWo54JR8EPhmC80tf
 YnE554xIeHfCA==
Message-ID: <5ebb290e629a83f12525c2ddf0ca2082.mripard@kernel.org>
Date: Fri, 24 Nov 2023 10:41:24 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Osipenko" <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v18 07/26] drm/shmem-helper: Use refcount_t for
 pages_use_count
In-Reply-To: <20231029230205.93277-8-dmitry.osipenko@collabora.com>
References: <20231029230205.93277-8-dmitry.osipenko@collabora.com>
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
Cc: Maxime Ripard <mripard@kernel.org>, Thomas
 Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 Steven Price <steven.price@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Melissa Wen <mwen@igalia.com>, Boris
 Brezillon <boris.brezillon@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Gerd
 Hoffmann <kraxel@redhat.com>, kernel@collabora.com, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 30 Oct 2023 02:01:46 +0300, Dmitry Osipenko wrote:
> Use atomic refcount_t helper for pages_use_count to optimize pin/unpin
> functions by skipping reservation locking while GEM's pin refcount > 1.
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
