Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2856342E2D5
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 22:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0506EC6D;
	Thu, 14 Oct 2021 20:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9506EC6D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 20:34:32 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 271d616c-2d2e-11ec-ac3c-0050568cd888;
 Thu, 14 Oct 2021 20:34:38 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id BE344194B5B;
 Thu, 14 Oct 2021 22:34:35 +0200 (CEST)
Date: Thu, 14 Oct 2021 22:34:26 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: lichenyang <lichenyang@loongson.cn>
Cc: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, devel@linuxdriverproject.org,
 Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH v5 1/3] drm/loongson: Add DRM Driver for Loongson 7A1000
 bridge chip
Message-ID: <YWiUUmCRVdxpZrCz@ravnborg.org>
References: <20210911023133.851311-1-lichenyang@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210911023133.851311-1-lichenyang@loongson.cn>
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

Hi lichenyang,
On Sat, Sep 11, 2021 at 10:31:31AM +0800, lichenyang wrote:
> From: Chenyang Li <lichenyang@loongson.cn>
> 
> This patch adds an initial DRM driver for the Loongson LS7A1000
> bridge chip(LS7A). The LS7A bridge chip contains two display
> controllers, support dual display output. The maximum support for
> each channel display is to 1920x1080@60Hz.
> At present, DC device detection and DRM driver registration are
> completed, the crtc/plane/encoder/connector objects has been
> implemented.
> On Loongson 3A4000 CPU and 7A1000 system, we have achieved the use
> of dual screen, and support dual screen clone mode and expansion
> mode.
> 
> v11:
> - Remove a lot of useless code.
> - Add help information.
> - Delete unnecessary header files.
Looks much better now, thanks.

Can you provide some kind of overview of the HW?
It is confusing that you talk about a bridge for a display driver - is
this something from the HW?
And please look into usign the drm_bridge_connector - as this is what
any modern DRM display driver needs to use today.

Also the connector type needs to be specified - unknown is not
acceptable here.

The mail you sent did not show up at https://lore.kernel.org/dri-devel/
Please fix what is required to make it visible there.
This is where we point people to see the original mails.

Also a cover letter that explains what has been done - and what has not
been done - would be nice.

I look forward to v12,

	Sam
