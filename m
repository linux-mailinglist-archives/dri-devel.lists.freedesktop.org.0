Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C249F2D2EA9
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 16:54:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65D089BD5;
	Tue,  8 Dec 2020 15:54:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DC889B33
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 15:54:42 +0000 (UTC)
From: Will Deacon <will@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu/io-pgtable: Remove tlb_flush_leaf
Date: Tue,  8 Dec 2020 15:54:31 +0000
Message-Id: <160744101816.3622130.16266834943434854326.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <9844ab0c5cb3da8b2f89c6c2da16941910702b41.1606324115.git.robin.murphy@arm.com>
References: <9844ab0c5cb3da8b2f89c6c2da16941910702b41.1606324115.git.robin.murphy@arm.com>
MIME-Version: 1.0
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
Cc: tomeu.vizoso@collabora.com, Will Deacon <will@kernel.org>,
 catalin.marinas@arm.com, joro@8bytes.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, iommu@lists.linux-foundation.org, yong.wu@mediatek.com,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 25 Nov 2020 17:29:39 +0000, Robin Murphy wrote:
> The only user of tlb_flush_leaf is a particularly hairy corner of the
> Arm short-descriptor code, which wants a synchronous invalidation to
> minimise the races inherent in trying to split a large page mapping.
> This is already far enough into "here be dragons" territory that no
> sensible caller should ever hit it, and thus it really doesn't need
> optimising. Although using tlb_flush_walk there may technically be
> more heavyweight than needed, it does the job and saves everyone else
> having to carry around useless baggage.

Applied to arm64 (for-next/iommu/core), thanks!

[1/1] iommu/io-pgtable: Remove tlb_flush_leaf
      https://git.kernel.org/arm64/c/fefe8527a1e0

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
