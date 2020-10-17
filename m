Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6CB2910B3
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 10:11:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B496E1B8;
	Sat, 17 Oct 2020 08:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478766E1B8
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Oct 2020 08:11:37 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 1817680613;
 Sat, 17 Oct 2020 10:11:34 +0200 (CEST)
Date: Sat, 17 Oct 2020 10:11:32 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Bernard Zhao <bernard@vivo.com>
Subject: Re: [PATCH] drm/via: reduce no need mutex_lock area
Message-ID: <20201017081132.GD2568873@ravnborg.org>
References: <20200814083021.8962-1-bernard@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200814083021.8962-1-bernard@vivo.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fu7ymmwf c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=1WtWmnkvAAAA:8 a=LC9wdpaYjE8W-MlJmK4A:9
 a=CjuIK1q_8ugA:10 a=-_UHfarfsM-RsASml2Jt:22
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
Cc: David Airlie <airlied@linux.ie>, opensource.kernel@vivo.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bernard.

On Fri, Aug 14, 2020 at 01:30:19AM -0700, Bernard Zhao wrote:
> In function via_mem_alloc`s error branch, DRM_ERROR is protected
> in the mutex_lock(&dev->struct_mutex) area.
> >From the code, we see that DRM_ERROR is just an error log print
> without any struct element, there is no need to protect this.
> 
> Signed-off-by: Bernard Zhao <bernard@vivo.com>

Thanks, applied to drm-misc-next.

The patch will show up in -next in a few weeks.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
