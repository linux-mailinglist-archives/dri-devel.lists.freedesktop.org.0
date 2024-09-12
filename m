Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC6C977452
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 00:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D1D10E0D8;
	Thu, 12 Sep 2024 22:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZwGoyoAy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF1C10E0D8
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 22:30:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-229-8-243.static.upcbusiness.at
 [213.229.8.243])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8D104AD;
 Fri, 13 Sep 2024 00:29:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1726180165;
 bh=X/ACVZ2yMqEp+K0nA3WcyXwPm35BI17vNhlKzvwVbIQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZwGoyoAyObEXRGPlAyDMyhN/oeNZ0NcQyaWj4EAhf9+vIzIwWN/dBisgAHZybjCiB
 il9eGJb+YCPTFs+CnmrVPuOibFZ3lvdTq/VCZx9Bdgpc8pPy6FqO3oHxFYQQJY/ICb
 XkvBs0JgPffoCsoCfd7rch8svHxwoFYm11NVydWI=
Date: Fri, 13 Sep 2024 01:30:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maxime Ripard <mripard@kernel.org>, Devarsh Thakkar <devarsht@ti.com>,
 ahalaney@redhat.com, airlied@gmail.com, cai.huoqing@linux.dev,
 caihuoqing@baidu.com, colin.i.king@gmail.com, dakr@redhat.com,
 daniel@ffwll.ch, dmitry.baryshkov@linaro.org,
 dri-devel@lists.freedesktop.org, geert+renesas@glider.be,
 grandmaster@al2klimov.de, j-choudhary@ti.com, javierm@redhat.com,
 jyri.sarha@iki.fi, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, nm@ti.com, praneeth@ti.com,
 r-ravikumar@ti.com, robh@kernel.org, sam@ravnborg.org,
 simona.vetter@ffwll.ch, tzimmermann@suse.de,
 u.kleine-koenig@pengutronix.de, vigneshr@ti.com,
 ville.syrjala@linux.intel.com, wangxiaojun11@huawei.com,
 yuanjilin@cdjrlc.com, yuehaibing@huawei.com
Subject: Re: [PATCH] drm/tidss: Add MIT license along with GPL-2.0
Message-ID: <20240912223007.GA9669@pendragon.ideasonboard.com>
References: <20240912171142.3241719-1-devarsht@ti.com>
 <993bbe0a1b503505dd2e9b33b94e2b83@kernel.org>
 <20240912-unyielding-mottled-bumblebee-6bb69f@houat>
 <19f291d7-cb64-49b3-88e7-8541029cdf0d@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <19f291d7-cb64-49b3-88e7-8541029cdf0d@ideasonboard.com>
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

On Thu, Sep 12, 2024 at 09:21:19PM +0300, Tomi Valkeinen wrote:
> On 12/09/2024 21:08, Maxime Ripard wrote:
> > On Thu, Sep 12, 2024 at 06:04:11PM GMT, Maxime Ripard wrote:
> >> On Thu, 12 Sep 2024 22:41:42 +0530, Devarsh Thakkar wrote:
> >>> Modify license to include dual licensing as GPL-2.0-only OR MIT license for
> >>> tidss display driver. This allows other operating system ecosystems such as
> >>> Zephyr and also the commercial firmwares to refer and derive code from this
> >>> display driver in a more permissive manner.
> >>>
> >>>
> >>> [ ... ]
> >>
> >> Acked-by: Maxime Ripard <mripard@kernel.org>
> > 
> > Also, we need the ack of all contributors to that driver, so my ack
> > isn't enough to merge that patch.
> 
> IANAL, maybe a silly question: if someone from company XYZ has sent a 
> patch for tidss, don't we then need an ack from someone in XYZ who's 
> high enough in XYZ to allow changing the license for their code?

This patch needs to be acked by all copyright holders indeed. For
contributions whose copyright has been assigned to other entities (such
as work performed by employees for their employers), those other
entities have to ack the license change. What constitutes a substantial
enough contribution to be copyrightable is a question I won't attempt to
answer.

-- 
Regards,

Laurent Pinchart
