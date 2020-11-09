Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC082AB1B4
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 08:21:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F51893B9;
	Mon,  9 Nov 2020 07:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84EAA893B9
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 07:21:29 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 1D01780538;
 Mon,  9 Nov 2020 08:21:26 +0100 (CET)
Date: Mon, 9 Nov 2020 08:21:25 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] video: hyperv_fb: include vmalloc.h
Message-ID: <20201109072125.GB1715181@ravnborg.org>
References: <20201106183941.9751-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201106183941.9751-1-olaf@aepfle.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=gAzNO5xu912kzqTqD5cA:9 a=CjuIK1q_8ugA:10
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
Cc: linux-hyperv@vger.kernel.org, Stephen Hemminger <sthemmin@microsoft.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Olaf.

On Fri, Nov 06, 2020 at 07:39:41PM +0100, Olaf Hering wrote:
> hvfb_getmem uses vzalloc, therefore vmalloc.h should be included.
> 
> Fixes commit d21987d709e807ba7bbf47044deb56a3c02e8be4 ("video: hyperv:
> hyperv_fb: Support deferred IO for Hyper-V frame buffer driver")
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Thanks.
Applied to drm-misc-fixes - as it smells like a build fix in some
configurations.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
