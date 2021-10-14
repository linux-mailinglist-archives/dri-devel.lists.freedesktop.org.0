Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8669942E134
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 20:27:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E23B66EC03;
	Thu, 14 Oct 2021 18:26:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3ACC6EC03
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 18:26:56 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 4efd2a23-2d1c-11ec-9c3f-0050568c148b;
 Thu, 14 Oct 2021 18:26:54 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 65A4E194B76;
 Thu, 14 Oct 2021 20:27:02 +0200 (CEST)
Date: Thu, 14 Oct 2021 20:26:52 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Cc:  linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org;
Subject: Re: [PATCH] video: omapfb: Fix fall-through warning for Clang
Message-ID: <YWh2bKnY0Z75g0S3@ravnborg.org>
References: <20211014165320.GA1145571@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211014165320.GA1145571@embeddedor>
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

Hi Gustavo,
On Thu, Oct 14, 2021 at 11:53:20AM -0500, Gustavo A. R. Silva wrote:
> Fix the following fallthrough warnings:
> 
> drivers/video/fbdev/omap/omapfb_main.c:1558:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
>            case 0:
>            ^
>    drivers/video/fbdev/omap/omapfb_main.c:1558:2: note: insert 'break;' to avoid fall-through
>            case 0:
>            ^
>            break;
>    1 warning generated.
> 
> This helps with the ongoing efforts to globally enable
> -Wimplicit-fallthrough for Clang.
> 
> Link: https://github.com/KSPP/linux/issues/115
> Link: https://lore.kernel.org/lkml/202110141005.hUjaYMEi-lkp@intel.com/
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
applied to drm-misc-next. It will show up in -next in 1-2 weeks time.
Thanks,
	Sam
