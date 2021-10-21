Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3460436917
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 19:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58EC46ECDD;
	Thu, 21 Oct 2021 17:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C0A6ECDD
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 17:32:03 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id cfea5b04-3294-11ec-9c3f-0050568c148b;
 Thu, 21 Oct 2021 17:32:06 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 90DED194B52;
 Thu, 21 Oct 2021 19:32:01 +0200 (CEST)
Date: Thu, 21 Oct 2021 19:32:00 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] drm/panel: remove unneeded semicolon
Message-ID: <YXGkEFjhydJkgstb@ravnborg.org>
References: <1634629046-116842-1-git-send-email-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1634629046-116842-1-git-send-email-yang.lee@linux.alibaba.com>
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

Hi Yang,

On Tue, Oct 19, 2021 at 03:37:26PM +0800, Yang Li wrote:
> Eliminate the following coccicheck warning:
> ./drivers/gpu/drm/panel/panel-novatek-nt35950.c:639:2-3: Unneeded
> semicolon
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Fixes: 623a3531e9cf ("drm/panel: Add driver for Novatek NT35950 DSI DriverIC panels")
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Thanks for this fix. As it is not urgent I have applied the patch to
drm-misc-next and it will show up in -next in 1-2 weeks.

I edited the subject to include "novatek-nt35950:" while applying.

	Sam
