Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD32A88BDB
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 20:57:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6623F10E302;
	Mon, 14 Apr 2025 18:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Gl9b0Krk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F1310E253;
 Mon, 14 Apr 2025 18:57:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 93C89A4A15E;
 Mon, 14 Apr 2025 18:51:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13541C4CEE2;
 Mon, 14 Apr 2025 18:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744657039;
 bh=3m/OjbvoXCmWtUPCO5DT7hKbScsBNwmgSHzIzeZQduI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Gl9b0KrkF7gLlm1Sw/F91MC/Tci96/UK3zzE4KF6pDvXaOgIRxfrlQDP+VlJLDKkJ
 KBf/qDpA7JygfXbWJQ17k8/vf2JC5XCiYQugj+wvGP2QMKXO6JUZExOVprvPptJ01j
 +B4VMkP+TH2KS/IOJ3ivObbFc8ostKbdpcRw2ATasehD7TiJiLBLoYJVB351q3LeNH
 /4q8jbRPc/aOwgrw+xREx4OLObn4UxPnEHVW1steOGg9cvSUt3KXN5mF7V4+koKvzC
 Vp6yZKV8+ne/DFeI4weYTzNJ/Vva9j58rARtY7KAYiYYAe9EXF4NwVuHwI92mn7iUF
 6JMM2xbF3N9ww==
Message-ID: <95c3c3d9-3997-4eda-abd8-223e5bfe60d7@kernel.org>
Date: Mon, 14 Apr 2025 20:57:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] drm/nouveau: Test for imported buffers with
 drm_gem_is_imported()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@gmail.com, simona@ffwll.ch, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org,
 Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org
References: <20250414134821.568225-11-tzimmermann@suse.de>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250414134821.568225-11-tzimmermann@suse.de>
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

On 4/14/25 3:48 PM, Thomas Zimmermann wrote:
> Instead of testing import_attach for imported GEM buffers, invoke
> drm_gem_is_imported() to do the test. The helper tests the dma_buf
> itself while import_attach is just an artifact of the import. Prepares
> to make import_attach optional.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org

Acked-by: Danilo Krummrich <dakr@kernel.org>
