Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDAF90F480
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 18:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B7E10ED4B;
	Wed, 19 Jun 2024 16:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GaGkX6FU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C3710ED4C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 16:54:16 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE7DA541;
 Wed, 19 Jun 2024 18:53:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1718816036;
 bh=1Wq7DOJN8DK0tEcTAKWJt8iTdTMDhFjkz13wY8KenZI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GaGkX6FU/MEN7hXeGfXxsJx1Y7yA2BWRl801DL74lh74GTCLY5kmcyf4BoiNNmzfD
 3czJfPB0qgIlh73BUfpEK+m6cvXGGZNRu2zgV6pxzfOPwc2I5nVfvtBDDsFWuy5hx1
 uBslDE6J1J0NE5ZloRjNS8/Fma1novn0aF+ZSQ24=
Date: Wed, 19 Jun 2024 19:53:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 kieran.bingham+renesas@ideasonboard.com, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH] drm: Remove unused function rcar_cmm_write
Message-ID: <20240619165351.GA4219@pendragon.ideasonboard.com>
References: <20240619075436.86407-1-jiapeng.chong@linux.alibaba.com>
 <bd98f345-5c71-188a-b3af-a8ef9d205ce6@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bd98f345-5c71-188a-b3af-a8ef9d205ce6@omp.ru>
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

On Wed, Jun 19, 2024 at 12:16:47PM +0300, Sergey Shtylyov wrote:
> On 6/19/24 10:54 AM, Jiapeng Chong wrote:
> 
> > The function are defined in the rcar_cmm.c file, but not called
> 
>    s/are/is/.
> 
> > elsewhere, so delete the unused function.
> 
>    Anywhere, maybe?

I'll fix those.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> > drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c:35:19: warning: unused function 'rcar_cmm_read'.
> > 
> > Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> > Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9364
> > Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> 
> [...]

-- 
Regards,

Laurent Pinchart
