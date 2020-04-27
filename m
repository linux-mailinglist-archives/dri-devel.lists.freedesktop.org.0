Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D06E1BAD45
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 20:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8116D89F43;
	Mon, 27 Apr 2020 18:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877D189F43
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 18:53:27 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 806EE20026;
 Mon, 27 Apr 2020 20:53:21 +0200 (CEST)
Date: Mon, 27 Apr 2020 20:53:20 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH v8 0/2] Add initial support for slimport anx7625
Message-ID: <20200427185320.GB15880@ravnborg.org>
References: <cover.1587880280.git.xji@analogixsemi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1587880280.git.xji@analogixsemi.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=4VXvCluUGrq-ykwb4MwA:9
 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: devel@driverdev.osuosl.org, Nicolas Boichat <drinkcat@google.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pi-Hsun Shih <pihsun@chromium.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Xin Ji

On Mon, Apr 27, 2020 at 02:16:49PM +0800, Xin Ji wrote:
> Hi all,
> 
> The following series add support for the Slimport ANX7625 transmitter, a
> ultra-low power Full-HD 4K MIPI to DP transmitter designed for portable device.
> 
> This is the v8 version, any mistakes, please let me know, I will fix it in
> the next series. This series fix several coding format and description.


It would be great if you can add a summary of changes like this:

v8:
  - fix several coding format
  - update description

v7:
  - Bla bla

I see no reason to dig out the old changelog, but start from now on.
The cover letter (this mail) should give a general intro to the changes.
The individual patches the detailed changelog.
For each entry is is also a good practice to tell who gave the feedback
that triggered the changes.

There are many ways to handle this, take a look at a few submissions 
to dri-devel to be inspired.

	Sam

> 
> Thanks,
> Xin
> 
> 
> 
> Xin Ji (2):
>   dt-bindings: drm/bridge: anx7625: MIPI to DP transmitter binding
>   drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP bridge driver
> 
>  .../bindings/display/bridge/anx7625.yaml           |   91 +
>  drivers/gpu/drm/bridge/Makefile                    |    2 +-
>  drivers/gpu/drm/bridge/analogix/Kconfig            |    6 +
>  drivers/gpu/drm/bridge/analogix/Makefile           |    1 +
>  drivers/gpu/drm/bridge/analogix/anx7625.c          | 2158 ++++++++++++++++++++
>  drivers/gpu/drm/bridge/analogix/anx7625.h          |  410 ++++
>  6 files changed, 2667 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/anx7625.yaml
>  create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.c
>  create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.h
> 
> -- 
> 2.7.4
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
