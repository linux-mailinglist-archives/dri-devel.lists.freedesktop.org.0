Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 735136299F7
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 14:22:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1DE10E3D3;
	Tue, 15 Nov 2022 13:21:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B7310E3D2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 13:21:50 +0000 (UTC)
Received: from arch-x395 (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net
 [82.24.248.100])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: evelikov)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 75B2666003EF;
 Tue, 15 Nov 2022 13:21:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1668518509;
 bh=BNoow0j7QMUxdrOEMXcWhhs19pNb2d5d8ygH+4pUjdA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=deySgWFYr6qC3/lIH40Lh5J3vC9PCiuKhKY/BDKzkNqNoYMUjsgNz3u5OOXnwIUwJ
 d3okgjA5IcPN3xUgnD/UoNEbuLG130QTWWco9n8ZbhIPk2qcMJg8gqlM0IpkH6lcr3
 HFkAelEb1qHoeXNajATW9bcJqDTVtK6QDFFVB04/k7N5r5SCbqiQfDTd96nMBuZDFb
 S6VaIfoT76+IAaJEEe2LdKZIPLl0I2jkCMx1yGCSiAU/yaotAUT/6HhDZOKdyfUdmp
 Kk6JUybmatz7Z2UsBSjKccXIf7xHiAb/M2C4N0+4qWxmBjgumy8Pi/3b73P3GQneTW
 K/cBuZ2Fn2LOA==
Date: Tue, 15 Nov 2022 13:21:44 +0000
From: Emil Velikov <emil.velikov@collabora.com>
To: Robert Swindells <rjs@fdy2.co.uk>
Subject: Re: [PATCH 1/1] drm/shmem: Dual licence the files as GPL-2 and MIT
Message-ID: <Y3OSaM1zsht9fdTI@arch-x395>
References: <20221112194210.7657-1-rjs@fdy2.co.uk>
 <20221112194210.7657-2-rjs@fdy2.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221112194210.7657-2-rjs@fdy2.co.uk>
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
Cc: dri-devel@lists.freedesktop.org, sfr@canb.auug.org.au,
 marcel.ziswiler@toradex.com, daniel.vetter@ffwll.ch, liuzixian4@huawei.com,
 lucas.demarchi@intel.com, boris.brezillon@collabora.com, nroberts@igalia.com,
 noralf@tronnes.org, cai.huoqing@linux.dev, kraxel@redhat.com,
 tzimmermann@suse.de, kuba@kernel.org, airlied@redhat.com, sam@ravnborg.org,
 dan.carpenter@oracle.com, m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022/11/12, Robert Swindells wrote:
> Contributors to these files are:
> 
> Noralf Trønnes <noralf@tronnes.org>
> Liu Zixian <liuzixian4@huawei.com>
> Dave Airlie <airlied@redhat.com>
> Thomas Zimmermann <tzimmermann@suse.de>
> Lucas De Marchi <lucas.demarchi@intel.com>
> Gerd Hoffmann <kraxel@redhat.com>
> Rob Herring <robh@kernel.org>
> Jakub Kicinski <kuba@kernel.org>
> Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Stephen Rothwell <sfr@canb.auug.org.au>
> Daniel Vetter <daniel.vetter@ffwll.ch>
> Cai Huoqing <cai.huoqing@linux.dev>
> Neil Roberts <nroberts@igalia.com>
> Marek Szyprowski <m.szyprowski@samsung.com>
> Emil Velikov <emil.velikov@collabora.com>
> Sam Ravnborg <sam@ravnborg.org>
> Boris Brezillon <boris.brezillon@collabora.com>
> Dan Carpenter <dan.carpenter@oracle.com>
> 
> Signed-off-by: Robert Swindells <rjs@fdy2.co.uk>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 2 +-
>  include/drm/drm_gem_shmem_helper.h     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

As far as my changes are concerned, this patch is:
Acked-by: Emil Velikov <emil.velikov@collabora.com>

HTH
Emil
