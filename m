Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57ADA8005DA
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 09:38:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4930510E822;
	Fri,  1 Dec 2023 08:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF10C10E80F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 08:37:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 2B743B843E6;
 Fri,  1 Dec 2023 08:37:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30553C433C8;
 Fri,  1 Dec 2023 08:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701419874;
 bh=vitW7sTDA72AlBoRjwnKcCCRY9cZK5Zt7DNCu14No5U=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=tDHcFeSlBHWn+bZNPU1CgK0TyZSiRCjEqzxPacSXeURlJ+qVZBZCbLvlfnshtfhmx
 Lt9d7Rayz86N8yxBWjOoApzR1qq589RQem7zc8gHoz52yq/9frAbsiWVaErqSXGVLZ
 Nuu1WI0972T+7DcoDaQwMxM/BSSs3iPCS45So2p3IZ1xoo/WLXBIv7I+BTFswzbt3A
 W4TFB4cw4khfob8lWSV2IlWyg6oeNBumX3kLRCVI8nhoD2gM6KOdLx9cuxDkLOWNog
 4/F9BvWW7RQ7cpXbGxNxYuMi70qzxWLWW6r+hyypU2W7M7mYkFUsZ0MdYP2Otdz1nb
 0H8Z8CD0IGH0Q==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Donald Robson <donald.robson@imgtec.com>
In-Reply-To: <20231130160017.259902-4-donald.robson@imgtec.com>
References: <20231130160017.259902-1-donald.robson@imgtec.com>
 <20231130160017.259902-4-donald.robson@imgtec.com>
Subject: Re: (subset) [PATCH v2 4/5] drm/imagination: pvr_gpuvm_free() now
 static
Message-Id: <170141987169.3198881.5941706864545367309.b4-ty@kernel.org>
Date: Fri, 01 Dec 2023 09:37:51 +0100
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
Cc: Arnd Bergmann <arnd@arndb.de>, matt.coster@imgtec.com,
 boris.brezillon@collabora.com, tzimmermann@suse.de,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 30 Nov 2023 16:00:16 +0000, Donald Robson wrote:
> The function below is used only within this source file, but is not static.
> 
> drivers/gpu/drm/imagination/pvr_vm.c:542:6: error: no previous prototype for 'pvr_gpuvm_free' [-Werror=missing-prototypes]
>   542 | void pvr_gpuvm_free(struct drm_gpuvm *gpuvm)
> 
> Make it static.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

