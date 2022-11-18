Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D4C630EC0
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 13:39:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3130D10E139;
	Sat, 19 Nov 2022 12:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2684710E20C
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 09:23:51 +0000 (UTC)
Received: from pyrite.rasen.tech (h175-177-042-159.catv02.itscom.jp
 [175.177.42.159])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2595FAF4;
 Fri, 18 Nov 2022 10:23:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668763428;
 bh=7C+athZv7kSEaIkUaRi7GZVI+Rosz/qwDDS/Xg83iGI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HQ8UJrG3TlMuin8TgVJ0u6M3cvqVdWw2apIjy13yeZTzSo6IiGzY1GbVFl9zHk6Lz
 RyD5teiV4pBeed8S2IUmrylWh9Dnnay+nZoCZ1eoiPnwLeV/oEGVz4/SBIPlgQK1op
 Shx2bRghzbFCD/syDUQ/8hZkAfZzgpZFiiOxmQJk=
Date: Fri, 18 Nov 2022 18:23:38 +0900
From: Paul Elder <paul.elder@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v3 0/6] dt-bindings: Add macros for video interface bus
 types
Message-ID: <Y3dPGkFaz/qo/drw@pyrite.rasen.tech>
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
 <YtOyCBOqCR71uG1i@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtOyCBOqCR71uG1i@paasikivi.fi.intel.com>
X-Mailman-Approved-At: Sat, 19 Nov 2022 12:39:05 +0000
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
Cc: devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sakari,

Gentle ping.

On Sun, Jul 17, 2022 at 06:54:00AM +0000, Sakari Ailus wrote:
> Folks,
> 
> > Laurent Pinchart (6):
> >   dt-bindings: media: Add macros for video interface bus types
> >   dt-bindings: Use new video interface bus type macros in examples
> >   ARM: dts: freescale: Use new media bus type macros
> >   ARM: dts: omap: Use new media bus type macros
> >   ARM: dts: renesas: Use new media bus type macros
> >   ARM: dts: stm32: Use new media bus type macros
> 
> What's the preference on the tree through which these would be merged?
> 
> The two first should probably go through the media tree but what about the
> DTS? There's a dependency to the first patch. I can take these all if
> people are fine with that.

How is this going?


Thanks,

Paul
