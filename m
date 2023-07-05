Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A0E747FB3
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 10:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC6410E338;
	Wed,  5 Jul 2023 08:30:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0043810E338
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 08:30:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 596A76146E;
 Wed,  5 Jul 2023 08:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34F30C433C8;
 Wed,  5 Jul 2023 08:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688545805;
 bh=inI8/R9rjlpS8WoQRdgWwn9LNmLYX2ehc+aDS9lds/g=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=FqTP4LDEpnhDeEtkgK2BtMujf9EHlCs7NwLo/eNXIIgsOY2PG6mOxnnjPrFUvpgQQ
 YOzCplHIGTqKKKahnFTL+QHmmgFMC6vB4i24I+2chMd2X44j2aiZGTd+MieAx9MVOK
 vO3MEHxI/28PWNJC30gteb7nnWuouXlKpLt/BDBqTA3MEj4HDeMkqbfpp5jCx6tkQw
 iLjMB+I34PYLJqKsdmFvdWjvKSgNG7h120ozqVM6BcHlnZ8j/3jfafvQB39Yg+sZiK
 9LWp+kzAVHYfls5/YdXFMdZvpVcc/I+LJVWo5DkpRAYvuGMLhVXe+eMlUugYyeOpEZ
 ml13KW8lUnObQ==
Message-ID: <edd1978c81650a04eddc3ee144153fc2.mripard@kernel.org>
Date: Wed, 05 Jul 2023 08:30:02 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Subject: Re: [PATCH 00/10] drm: Improve fbdev emulation for DMA-able
 framebuffers
In-Reply-To: <20230704160133.20261-1-tzimmermann@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, mripard@kernel.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 4 Jul 2023 17:49:57 +0200, Thomas Zimmermann wrote:
> Add fbdev helpers for framebuffers in DMA-able memory and update
> fbdev emulation in the respective DRM drivers. DMA memory used to
> handled as system memory. Improve this and prepare for possible
> future changes.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
