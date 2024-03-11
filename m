Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC2F877D55
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 10:52:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC46F10EC31;
	Mon, 11 Mar 2024 09:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="aE3mjbrp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 349BE10EF4C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 09:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710150773;
 bh=BqxpTe4H2Cvo2j77akvivULxMNnwKezEQ7N8vUoyCY0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aE3mjbrpVDacihsnvwh/DpulfqLvthpwY2RaoRaUJPRahzt1bPBJerI3mPEVwhQyb
 uruFFX+HX60zlW3ge1TDx5HcpD5HIRtommWmbPU41frQKL2+5PCGNFI19VTjs35H0G
 zv8MhX/ZhZoAOd/VCHtvaPX3+0kXNFngYPX272yeNMyCSJoUkKslFvruIIgAW+QLS7
 Z+LxKPAb2Fn/f8JmE4LnbRYbwM3ONNZdJ2Ex7Q3+l/c9iram6OogIdtnCGVBtM/kZX
 OMu0nQCc2hsGtagDK4yrsFb0rVQTexQIsCeAopbSciUwPL9x4lr+4Rn55i/eZ0al4h
 8x5zX+23CZL3A==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 08CDD37811D4;
 Mon, 11 Mar 2024 09:52:52 +0000 (UTC)
Date: Mon, 11 Mar 2024 10:52:51 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH 0/3] drm/panthor: Fix 3 issues reported by the kernel
 test bot
Message-ID: <20240311105251.1baf6072@collabora.com>
In-Reply-To: <20240304090812.3941084-1-boris.brezillon@collabora.com>
References: <20240304090812.3941084-1-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Mon,  4 Mar 2024 10:08:09 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> Hello,
> 
> Here are three trivial fixes for bugs reported by the intel kernel test
> bot.
> 
> Regards,
> 
> Boris
> 
> Boris Brezillon (3):
>   drm/panthor: Fix panthor_devfreq kerneldoc
>   drm/panthor: Explicitly include page.h for the {virt,__phys)_to_pfn()
>     defs
>   drm/panthor: Fix undefined panthor_device_suspend/resume symbol issue

Queued to drm-misc-next.

> 
>  drivers/gpu/drm/panthor/Kconfig           | 1 +
>  drivers/gpu/drm/panthor/panthor_devfreq.c | 2 +-
>  drivers/gpu/drm/panthor/panthor_device.c  | 4 ++--
>  3 files changed, 4 insertions(+), 3 deletions(-)
> 

