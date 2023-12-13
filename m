Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD066811617
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 16:22:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56FC10E79F;
	Wed, 13 Dec 2023 15:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C614710E79F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 15:22:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D6765CE1F66;
 Wed, 13 Dec 2023 15:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 945C5C433C7;
 Wed, 13 Dec 2023 15:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702480959;
 bh=g9AfdMsMWQPrTFn3Rfxxtm16T5CwU3D5GqboUlkSxB8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=GDrZI2XBTh3hJVVSXnxYxcQ4Ww8ny4IzmGeEg2lCyPdTBuIsmFvcdHOOWb3OtN+sK
 Tois1SqVzSuh4dUcqTnrm6GeKSz2YO2M+zSACcHSe0kaK2xIDt21NRwR5vhw9AFhaN
 oOWOyxDTSykwywZ7/ug2xhYAC1x58VCuQkgHji75L/2zZdCu9wGzUx+m0hLEdOnjty
 MR9/mY93zS4jpNKKATj/S1wq7Lv2Qdto6ywA3JCiSKgGgLTyPgGohLQ0YcKBw1GjxE
 62s77VFc1bViQj0yc3xnuDiL9x+2Jp0315SB85Qy+InXIFG9zFEPAYk4JOu/zZBjJA
 n9F+eN/wC2Dmw==
From: Maxime Ripard <mripard@kernel.org>
To: Frank Binns <frank.binns@imgtec.com>, 
 Donald Robson <donald.robson@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Alex Bee <knaerzche@gmail.com>
In-Reply-To: <20231208170856.1748413-1-knaerzche@gmail.com>
References: <20231208170856.1748413-1-knaerzche@gmail.com>
Subject: Re: (subset) [PATCH] drm/imagination: vm: Fix heap lookup
 condition
Message-Id: <170248095546.191897.14747854434891174089.b4-ty@kernel.org>
Date: Wed, 13 Dec 2023 16:22:35 +0100
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
Cc: Sarah Walker <sarah.walker@imgtec.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 08 Dec 2023 18:08:56 +0100, Alex Bee wrote:
> When conditionally checking for heap existence of a certian address in
> pvr_vm_bind_op_map_init the condition whether the map request comes from a
> user is incorrect: The context must not be the kernel-context to be a
> user(space) context and should be looked up in pvr_heaps.
> 
> That makes addresses coming from userspace not being verfied against the
> defined ranges and prevents firmware loading for meta cores.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

