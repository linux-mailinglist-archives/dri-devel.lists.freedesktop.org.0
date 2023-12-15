Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2D78148CA
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 14:13:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB9E10EA09;
	Fri, 15 Dec 2023 13:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B04B10EA14
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 13:13:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C21E0B826C3;
 Fri, 15 Dec 2023 13:13:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA9AC433C8;
 Fri, 15 Dec 2023 13:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702645993;
 bh=95CxUUbPl1kIpQU5C4sC9NMgOhe+jHAIEUlCPWtuLMY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=q9hDPZOD0ZG7crnWA7ninOmRAjnXcZET6FUJyxW2/SK6lwe/+Oz+CbM3q9KXr6auW
 TwSRowOnABbwoDeYttl6dbRlIYY+hAsZowOE+c/c4wpKH6GH4nmXg2jqSkt+LuAAMW
 GX7kKthJszfrj6vA/W5XXy5mNW/a8vOmHs0p7Mr9FLVUkaSp8rGrPWmZfgn2Y2qnvD
 NGd+NQ7C0vCBFPQCuRKSJrUUW0Ufxm0TJ0Zcbh5HfucwqppRBmvvAffl54Nz7WXnyY
 v+DgaxLVrmGvqlJA4ikDG3VhkF0YILu9iZcComapnwsQ/uHyPgMIyGjfZC9S4lpfR9
 fpzdOooXjG5YQ==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Donald Robson <donald.robson@imgtec.com>
In-Reply-To: <20231213144431.94956-2-donald.robson@imgtec.com>
References: <20231213144431.94956-1-donald.robson@imgtec.com>
 <20231213144431.94956-2-donald.robson@imgtec.com>
Subject: Re: (subset) [PATCH 2/2] drm/imagination: Fix error path in
 pvr_vm_create_context
Message-Id: <170264599089.449619.14263811622575523526.b4-ty@kernel.org>
Date: Fri, 15 Dec 2023 14:13:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: tzimmermann@suse.de, matt.coster@imgtec.com,
 Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Dec 2023 14:44:31 +0000, Donald Robson wrote:
> It is possible to double free the vm_ctx->mmu_ctx object in this
> function.
> 
>     630 err_page_table_destroy:
> --> 631         pvr_mmu_context_destroy(vm_ctx->mmu_ctx);
> 
> The pvr_vm_context_put() function does:
> 
> [...]

Applied to drm/drm-misc (drm-misc-next-fixes).

Thanks!
Maxime

