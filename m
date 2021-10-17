Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C504430B3F
	for <lists+dri-devel@lfdr.de>; Sun, 17 Oct 2021 19:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059756E5D1;
	Sun, 17 Oct 2021 17:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F35C6E5D1
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Oct 2021 17:33:09 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 4bbf31ab-2f70-11ec-9c3f-0050568c148b;
 Sun, 17 Oct 2021 17:33:09 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 45709194B21;
 Sun, 17 Oct 2021 19:33:15 +0200 (CEST)
Date: Sun, 17 Oct 2021 19:33:05 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/panel/tianma-tl057fvxp01: add panel for Motorola
 Moto G6
Message-ID: <YWxeUd6PALatP7z/@ravnborg.org>
References: <20210808200854.187648-1-julianbraha@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210808200854.187648-1-julianbraha@gmail.com>
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

Hi Julian,

On Sun, Aug 08, 2021 at 04:08:54PM -0400, Julian Braha wrote:
> This is a 5.7" 2160x1080 panel found on the Motorola Moto G6.
> There may be other smartphones using it, as well.
> 
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

Sorry for coming back so late. Driver looks good and is almost
ready to apply. One detail you need to fix, see below.

	Sam

> ---
> +
> +static const struct of_device_id tianma_tl057fvxp01_of_match[] = {
> +	{ .compatible = "tianma,tl057fvxp01" },
> +	{ /* sentinel */ }
> +};
The compatible needs to be documented before I can include the driver in
the kernel. Please add a patch that document the compatible - maybe as a
new binding file but preferably as part of one of the existing binding
files.

	Sam
