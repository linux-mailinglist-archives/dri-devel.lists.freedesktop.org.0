Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EB53D4D52
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 14:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29BE6E342;
	Sun, 25 Jul 2021 12:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9BEF6E342
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 12:24:26 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 43371ee4-ed43-11eb-9082-0050568c148b;
 Sun, 25 Jul 2021 12:24:31 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 60C70194B37;
 Sun, 25 Jul 2021 14:24:44 +0200 (CEST)
Date: Sun, 25 Jul 2021 14:24:23 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH resend v2] dt-bindings: display: ssd1307fb: Convert to
 json-schema
Message-ID: <YP1X99kPYbkzX260@ravnborg.org>
References: <20210714145122.2530176-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714145122.2530176-1-geert@linux-m68k.org>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,
On Wed, Jul 14, 2021 at 04:51:22PM +0200, Geert Uytterhoeven wrote:
> Convert the Solomon SSD1307 Framebuffer Device Tree binding
> documentation to json-schema.
> 
> Fix the spelling of the "pwms" property.
> Document default values.
> Make properties with default values not required.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

No need to wait for the next version of the driver patch, so I went ahed
and applied this to drm-misc-next.

	Sam
