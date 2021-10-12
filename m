Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 542FB42AD6E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 21:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36EF06E9C9;
	Tue, 12 Oct 2021 19:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF25E6E9C9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 19:45:46 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id f463f86b-2b94-11ec-ac3c-0050568cd888;
 Tue, 12 Oct 2021 19:45:29 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 2B74A194B25;
 Tue, 12 Oct 2021 21:45:30 +0200 (CEST)
Date: Tue, 12 Oct 2021 21:45:40 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Stefan Mavrodiev <stefan@olimex.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] drm/panel: olimex-lcd-olinuxino: select CRC32
Message-ID: <YWXl5CaKThuSURLt@ravnborg.org>
References: <20211012115242.10325-1-vegard.nossum@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211012115242.10325-1-vegard.nossum@oracle.com>
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

Hi Vegard,

On Tue, Oct 12, 2021 at 01:52:42PM +0200, Vegard Nossum wrote:
> Fix the following build/link error by adding a dependency on the CRC32
> routines:
> 
>   ld: drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.o: in function `lcd_olinuxino_probe':
>   panel-olimex-lcd-olinuxino.c:(.text+0x303): undefined reference to `crc32_le'
> 
> Fixes: 17fd7a9d324fd ("drm/panel: Add support for Olimex LCD-OLinuXino panel")
> Cc: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>

thanks. Applied to drm-misc-fixes. It will turn up in master in a week
or two.

	Sam
