Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 976CA821B4B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 13:01:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874AA10E142;
	Tue,  2 Jan 2024 12:01:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E0410E142
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jan 2024 12:01:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C9B8261005;
 Tue,  2 Jan 2024 12:01:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25894C433C8;
 Tue,  2 Jan 2024 12:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704196914;
 bh=TC2BybdGdhXnRbuf72sR13qpV75OfNbk5lqpu3563QY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=HyhD/PyKiDQMdfAp17SkoG33L29JAnarUg7RqDDXfDFWYXcZdJ23QqMx3uv/eO757
 I4QGGZIgbgdxjytqQQ46pKVWpcuhyQWSE3SHM/X7QsQDv3RNZVaLwMWzNXLNaMvuy+
 3P9PVhGs2fq7i/YaThNwHtMrOJAPpnkGqmoOKK18OZluVBKVNH8VT5xWlOB2cViaPa
 bbQqtQGHwsARkhgur40N4gce6W8yxUx5EsG0WBlVKdfad2/gT3VpHgfI9NRY+4AuXu
 Sm9ddOD7fJWXJH/ZWpxH8kRbyEUGMmZ15TQM8y7uO5BA4ipOjAOL+QryPoWnsifN3H
 WnjHfmrYOBwiA==
From: Maxime Ripard <mripard@kernel.org>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231231054856.31786-1-rdunlap@infradead.org>
References: <20231231054856.31786-1-rdunlap@infradead.org>
Subject: Re: (subset) [PATCH] drm/gpuvm: fix all kernel-doc warnings in
 include/drm/drm_gpuvm.h
Message-Id: <170419691176.40444.10974951335864168789.b4-ty@kernel.org>
Date: Tue, 02 Jan 2024 13:01:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: Vegard Nossum <vegard.nossum@oracle.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 30 Dec 2023 21:48:56 -0800, Randy Dunlap wrote:
> Update kernel-doc comments in <drm/drm_gpuvm.h> to correct all
> kernel-doc warnings:
> 
> drm_gpuvm.h:148: warning: Excess struct member 'addr' description in 'drm_gpuva'
> drm_gpuvm.h:148: warning: Excess struct member 'offset' description in 'drm_gpuva'
> drm_gpuvm.h:148: warning: Excess struct member 'obj' description in 'drm_gpuva'
> drm_gpuvm.h:148: warning: Excess struct member 'entry' description in 'drm_gpuva'
> drm_gpuvm.h:148: warning: Excess struct member '__subtree_last' description in 'drm_gpuva'
> drm_gpuvm.h:192: warning: No description found for return value of 'drm_gpuva_invalidated'
> drm_gpuvm.h:331: warning: Excess struct member 'tree' description in 'drm_gpuvm'
> drm_gpuvm.h:331: warning: Excess struct member 'list' description in 'drm_gpuvm'
> drm_gpuvm.h:331: warning: Excess struct member 'list' description in 'drm_gpuvm'
> drm_gpuvm.h:331: warning: Excess struct member 'local_list' description in 'drm_gpuvm'
> drm_gpuvm.h:331: warning: Excess struct member 'lock' description in 'drm_gpuvm'
> drm_gpuvm.h:331: warning: Excess struct member 'list' description in 'drm_gpuvm'
> drm_gpuvm.h:331: warning: Excess struct member 'local_list' description in 'drm_gpuvm'
> drm_gpuvm.h:331: warning: Excess struct member 'lock' description in 'drm_gpuvm'
> drm_gpuvm.h:352: warning: No description found for return value of 'drm_gpuvm_get'
> drm_gpuvm.h:545: warning: Excess struct member 'fn' description in 'drm_gpuvm_exec'
> drm_gpuvm.h:545: warning: Excess struct member 'priv' description in 'drm_gpuvm_exec'
> drm_gpuvm.h:597: warning: missing initial short description on line:
>  * drm_gpuvm_exec_resv_add_fence()
> drm_gpuvm.h:616: warning: missing initial short description on line:
>  * drm_gpuvm_exec_validate()
> drm_gpuvm.h:623: warning: No description found for return value of 'drm_gpuvm_exec_validate'
> drm_gpuvm.h:698: warning: Excess struct member 'gpuva' description in 'drm_gpuvm_bo'
> drm_gpuvm.h:698: warning: Excess struct member 'entry' description in 'drm_gpuvm_bo'
> drm_gpuvm.h:698: warning: Excess struct member 'gem' description in 'drm_gpuvm_bo'
> drm_gpuvm.h:698: warning: Excess struct member 'evict' description in 'drm_gpuvm_bo'
> drm_gpuvm.h:726: warning: No description found for return value of 'drm_gpuvm_bo_get'
> drm_gpuvm.h:738: warning: missing initial short description on line:
>  * drm_gpuvm_bo_gem_evict()
> drm_gpuvm.h:740: warning: missing initial short description on line:
>  * drm_gpuvm_bo_gem_evict()
> drm_gpuvm.h:698: warning: Excess struct member 'evict' description in 'drm_gpuvm_bo'
> drm_gpuvm.h:844: warning: Excess struct member 'addr' description in 'drm_gpuva_op_map'
> drm_gpuvm.h:844: warning: Excess struct member 'range' description in 'drm_gpuva_op_map'
> drm_gpuvm.h:844: warning: Excess struct member 'offset' description in 'drm_gpuva_op_map'
> drm_gpuvm.h:844: warning: Excess struct member 'obj' description in 'drm_gpuva_op_map'
> 
> [...]

Applied to drm/drm-misc (drm-misc-next-fixes).

Thanks!
Maxime

