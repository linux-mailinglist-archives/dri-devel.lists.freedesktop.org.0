Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6652D1411CF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 20:32:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6B56F8DE;
	Fri, 17 Jan 2020 19:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3DA6F8DE
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 19:32:26 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id D152F803F0;
 Fri, 17 Jan 2020 20:32:24 +0100 (CET)
Date: Fri, 17 Jan 2020 20:32:23 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 0/6] video: fbdev: controlfb: small cleanup
Message-ID: <20200117193223.GD24812@ravnborg.org>
References: <CGME20200116140914eucas1p1a62794ad40589e818614176ea8e817ff@eucas1p1.samsung.com>
 <20200116140900.26363-1-b.zolnierkie@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200116140900.26363-1-b.zolnierkie@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=e5mUnYsNAAAA:8 a=52nNHdF23vC62uqb84gA:9 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bartlomiej

On Thu, Jan 16, 2020 at 03:08:54PM +0100, Bartlomiej Zolnierkiewicz wrote:
> Hi,
> 
> Small cleanup for controlfb driver:
> 
> - fix sparse warnings
> - remove not working module support
> - add COMPILE_TEST support
> - remove redundant function prototypes

Nice cleanup - with a few comments.
The last three patches are the good ones.

With my comments considered - and then up to you if you cahnge anything
- then all patches are:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> 
> Best regards,
> --
> Bartlomiej Zolnierkiewicz
> Samsung R&D Institute Poland
> Samsung Electronics
> 
> 
> Bartlomiej Zolnierkiewicz (6):
>   video: fbdev: controlfb: fix sparse warning about using incorrect type
>   video: fbdev: controlfb: remove obsolete module support
>   video: fbdev: controlfb: add COMPILE_TEST support
>   video: fbdev: controlfb: remove function prototypes part #1
>   video: fbdev: controlfb: remove function prototypes part #2
>   video: fbdev: controlfb: remove function prototypes part #3
> 
>  drivers/video/fbdev/Kconfig     |   2 +-
>  drivers/video/fbdev/controlfb.c | 810 +++++++++++++++-----------------
>  2 files changed, 383 insertions(+), 429 deletions(-)
> 
> -- 
> 2.24.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
