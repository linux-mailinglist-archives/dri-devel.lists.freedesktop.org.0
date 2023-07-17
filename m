Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E88755E0E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 10:14:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6800810E201;
	Mon, 17 Jul 2023 08:14:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0395810E201
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 08:14:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 51C3A60FAB;
 Mon, 17 Jul 2023 08:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41158C433C8;
 Mon, 17 Jul 2023 08:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689581651;
 bh=Sl+QltKLEKMYxs1hQQYrVUaWdIlqz3j/k7mSX0+hia0=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=bn7stKdHRnxERh8ChT9k48Nl7RDqA5KiV5mJzKqwKSoLmkNM3DkwItVrNBIRd9lKE
 vOZdKC+OEwIPjKfGIL49v9oGrpKiqZ1s/eIoy5rCDr+4+hJXBmHCaMc9FOUy0MLmcs
 HWFaeD4zwj7R8XPjhP+k3HJacKmw8nRUXtG5DFKtkWu4ooIIrLJRI3gwbcymOVJ763
 pjJhhRHGncO/25zybkV8OWZOatOvVk1u+Q0Rxhd8bEhGkPadQEdCCr26Mr67UL20ly
 4PLlMkWGwMY4jODeWw3bHcn6mr7D/NeqbZWm1e5AhI2ZKk1AHfsWP3azvdu/SWUJYZ
 pgP4exJc8mfBQ==
Message-ID: <c244d1d525c9582899fcf581b0f6078c.mripard@kernel.org>
Date: Mon, 17 Jul 2023 08:14:09 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Sarah Walker" <sarah.walker@imgtec.com>
Subject: Re: [PATCH v4 05/17] drm/imagination: Get GPU resources
In-Reply-To: <20230714142618.111746-1-sarah.walker@imgtec.com>
References: <20230714142618.111746-1-sarah.walker@imgtec.com>
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
Cc: matthew.brost@intel.com, luben.tuikov@amd.com, mripard@kernel.org,
 tzimmermann@suse.de, hns@goldelico.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, afd@ti.com, boris.brezillon@collabora.com,
 dakr@redhat.com, donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 14 Jul 2023 15:26:18 +0100, Sarah Walker wrote:
> Acquire clock and register resources, and enable/map as appropriate.
> 
> Changes since v3:
> - Remove regulator resource (not used on supported platform)
> - Use devm helpers
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
