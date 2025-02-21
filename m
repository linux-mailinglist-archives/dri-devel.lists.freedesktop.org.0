Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4F5A3ECBA
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 07:15:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 595B610E0F3;
	Fri, 21 Feb 2025 06:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gVifSG+f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9386810E0F3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 06:15:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9FF465C4B05;
 Fri, 21 Feb 2025 06:14:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD440C4CEE2;
 Fri, 21 Feb 2025 06:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1740118514;
 bh=TNEPPBEWgJ1Kqz7U9WT5DXUrTiqsvq3N42p4JeVhfvo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gVifSG+f0bxi6tkq9WGtsxqoZkGLInTFdg5jmOduZAx8ebkuCQdysZekvfztvFCm3
 QB02DbBzyg2CPIaIg1SK04s/BUyG/Cj/reO6qE+B+WHJqYimvryS3TjuxutXp08Nnw
 +eePKs2csULAR6GdtygHf6F5aUAjxUkVuqL7aoAE=
Date: Fri, 21 Feb 2025 07:14:07 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: rafael@kernel.org, dakr@kernel.org, hjc@rock-chips.com,
 andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, quentin.schulz@cherry.de
Subject: Re: [PATCH 1/2] drivers: base: component: add function to query the
 bound status
Message-ID: <2025022153-outdoors-snugly-3967@gregkh>
References: <20250220234141.2788785-1-heiko@sntech.de>
 <20250220234141.2788785-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220234141.2788785-2-heiko@sntech.de>
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

On Fri, Feb 21, 2025 at 12:41:40AM +0100, Heiko Stuebner wrote:
> The component helpers already expose the bound status in debugfs, but at
> times it might be necessary to also check that state in the kernel and
> act differently depending on the result.
> 
> For example the shutdown handler of a drm-driver might need to stop
> a whole output pipeline if the drm device is up and running, but may
> run into problems if that drm-device has never been set up before,
> for example because the binding deferred.
> 
> So add a little helper that returns the bound status for a componet
> device.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  drivers/base/component.c  | 14 ++++++++++++++
>  include/linux/component.h |  4 +++-
>  2 files changed, 17 insertions(+), 1 deletion(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
