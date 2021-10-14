Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F7742E1AE
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 20:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6256E1ED;
	Thu, 14 Oct 2021 18:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8266E1ED
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 18:52:36 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id e4e737a1-2d1f-11ec-9c3f-0050568c148b;
 Thu, 14 Oct 2021 18:52:34 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id CD46C194B57;
 Thu, 14 Oct 2021 20:52:41 +0200 (CEST)
Date: Thu, 14 Oct 2021 20:52:32 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Nikola Pavlica <pavlica.nikola@gmail.com>
Cc: dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel-simple: Add Vivax TPC-9150 panel v6
Message-ID: <YWh8cDO7n/okeCRM@ravnborg.org>
References: <20211011212731.77763-1-pavlica.nikola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211011212731.77763-1-pavlica.nikola@gmail.com>
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

Hi Nikola,
On Mon, Oct 11, 2021 at 11:27:31PM +0200, Nikola Pavlica wrote:
> The model and make of the LCD panel of the Vivax TPC-9150 is unknown,
> hence the panel settings that were retrieved with a FEX dump are named
> after the device NOT the actual panel.
> 
> The LCD in question is a 50 pin MISO TFT LCD panel of the resolution
> 1024x600 used by the aforementioned device.
> 
> Version 2, as Thierry kindly suggested that I fix the order in which the
> panel was ordered compared to others.
> 
> Version 3, filling in the required info suggested by Sam. Plus some
> factual issues that I've corrected myself (tested working)
> 
> Version 4, rearranged the display parameters and fix invalid bit format
> issue. (Thanks Sam)
> 
> Version 5, referred to FEX file instead of manual debugging for
> information.
> 
> Version 6, same as above. This time, it'll be documented.
Looks good now, applied to drm-misc-next.
There was an extra line I deleted while applying - checkpatch --strict
complained.
Patch will show up in -next in 1-2 weeks.

	Sam
