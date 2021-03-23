Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D873A346456
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 17:04:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D69036E8B6;
	Tue, 23 Mar 2021 16:04:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E046E8B6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 16:04:49 +0000 (UTC)
Date: Tue, 23 Mar 2021 16:04:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1616515487;
 bh=ao9KQDzsVqgk8WazG/XoLS+MV25cCULLmwp/C3GPD+U=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=K/+BqLOU3o/qmwr88rIuaR7JGgM3+1Nc1Xptp8b5mLR39a1baNskPMMIyPOHn9up7
 I9aq+q1zhVqZmASTAfGKwzF8Vo7OSItKkbDSJnfVeOC+kuBRQuBVe2unCLl9xcm8Ly
 IA6ZWgZOOGTaU6x+gN8c4LKiaPLx6Txkjt4G2HSMFb63b1PRCpfa+pIFtvmcWsJjvK
 Ze2we/id4LuyFyNNlT6YAqbrt9Sm9hJV0umCc4sn0C6GJn46tZQLahK1/LDVBaA9rF
 HM9CHJbEV5Vz6zjOm1giv7Tz+rZ0Y88eZ2ACslnkpg7ayWvqxFrwKVUPUKVYlGMk3i
 H2TMDHTIVjkhw==
To: Thierry Reding <thierry.reding@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/9] drm/fourcc: Add macro to check for the modifier vendor
Message-ID: <cEyRtluqBdulJxqLBLGpza4_rFKfTtmboo04l2mUFzjOcxGcILAbxPsLVmqQrMrAC0--VT7V_9rgVtvgbW3jLejGf-V8gpnMO10QHK9GtSQ=@emersion.fr>
In-Reply-To: <20210323155437.513497-2-thierry.reding@gmail.com>
References: <20210323155437.513497-1-thierry.reding@gmail.com>
 <20210323155437.513497-2-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: David Airlie <airlied@linux.ie>, linux-tegra@vger.kernel.org,
 James Jones <jajones@nvidia.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Can we instead have a macro/function to get the vendor? This would be
useful elsewhere as well, see drmGetFormatModifierVendor in a recent-ish
libdrm patch [1].

[1]: https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/108/diffs#91ecb12b27c7154b26013bb95e17a5cc24ea443e_947_947
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
