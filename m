Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D52F4437109
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 06:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92BF89B51;
	Fri, 22 Oct 2021 04:47:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9A889B51
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 04:47:41 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E8BCB51D;
 Fri, 22 Oct 2021 06:47:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1634878060;
 bh=G7T6wZkmrWLHbctwp4ctx4alzTbYKzVDezqLPHMiKe0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W/brV8VOxlPHQ0b1U9/XRwEUOyfHjdMY4JDujpx8mPXzYg5xVSgKfzmsKSAuwwwFy
 QOi7CMXVQ7mwa+GKOGLFLyNKrrXMlNLpJIrL3VLDjnF8Gc67OI6V9kqBUcNGppL4+D
 gjclIMtiN9UXtpkwcGjk4a6vBAYPf/e4cZ9qRLKU=
Date: Fri, 22 Oct 2021 07:47:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/7] of: Make of_graph_get_port_by_id take a const
 device_node
Message-ID: <YXJCV6Qxl7HwSM1j@pendragon.ideasonboard.com>
References: <20210929084234.1271915-1-maxime@cerno.tech>
 <20210929084234.1271915-2-maxime@cerno.tech>
 <YW6zxW3KdlpLQe/m@pendragon.ideasonboard.com>
 <20211021074843.yxbzoasfyxmzmukf@gilmour>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211021074843.yxbzoasfyxmzmukf@gilmour>
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

Hi Maxime,

On Thu, Oct 21, 2021 at 09:48:43AM +0200, Maxime Ripard wrote:
> On Tue, Oct 19, 2021 at 03:02:13PM +0300, Laurent Pinchart wrote:
> > On Wed, Sep 29, 2021 at 10:42:28AM +0200, Maxime Ripard wrote:
> > > of_graph_get_port_by_id doesn't modify the device_node pointer it takes
> > > as argument, so we can make it const.
> > 
> > From a C point of view that's right, but conceptually speaking, is it
> > right to return a non-const child port node of a const device_node ?
> 
> I mean, I guess not, but you're the one that asked for it:
> https://lore.kernel.org/dri-devel/YBAiztjg0Jji9voK@pendragon.ideasonboard.com/

Oops. Looks like I must be wrong with at least one of the two comments.
Please pick the option you like best.

> I can change it if you want, but certainly not if the only comment I get
> on this series for the next year is going to be over whether or not
> arguments of functions unrelated to the main intent should be constified
> or not.

DRM/KMS seems to suffer from a deficit of reviewers in all non-desktop
areas :-(

-- 
Regards,

Laurent Pinchart
