Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D35632AE99F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6BD89C0A;
	Wed, 11 Nov 2020 07:20:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC4B89C0A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 07:20:42 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 2252C2003B;
 Wed, 11 Nov 2020 08:20:39 +0100 (CET)
Date: Wed, 11 Nov 2020 08:20:37 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH] drm/panel: add missing platform_driver_unregister() on
 error path
Message-ID: <20201111072037.GA2950611@ravnborg.org>
References: <20201111064425.3395558-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111064425.3395558-1-yangyingliang@huawei.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=i0EeH86SAAAA:8 a=-Gbx0BpZB59qaVUEe18A:9
 a=CjuIK1q_8ugA:10 a=-RoEEKskQ1sA:10
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
Cc: thierry.reding@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yang,

On Wed, Nov 11, 2020 at 02:44:25PM +0800, Yang Yingliang wrote:
> If mipi_dsi_driver_register() failed, platform_driver_unregister()
> need be called.
> 
> Fixes: 210fcd9d9cf1 ("drm/panel: Add support for Panasonic VVX10F004B0")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Thanks for the patch but this is already fixed in drm-misx-next.
See:

    commit f2e66f212a9de04afc2caa5ec79057c0ac75c728
    drm: panel: simple: add missing platform_driver_unregister() in panel_simple_init

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
