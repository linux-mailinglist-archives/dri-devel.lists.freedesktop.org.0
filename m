Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBFA6D533B
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 23:15:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B7410E564;
	Mon,  3 Apr 2023 21:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [IPv6:2001:4b7e:0:8::81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D014E10E3BB
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 21:15:35 +0000 (UTC)
Received: from francesco-nb.int.toradex.com (unknown
 [IPv6:2a04:ee41:1:104e:5a23:1854:3475:1ad6])
 by mail11.truemail.it (Postfix) with ESMTPA id 07D4920B6B;
 Mon,  3 Apr 2023 23:15:31 +0200 (CEST)
Date: Mon, 3 Apr 2023 23:15:29 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: display: bridge: sn65dsi83: Add DSI
 video mode
Message-ID: <ZCtB8Vu4Brm3G639@francesco-nb.int.toradex.com>
References: <20230330101752.429804-1-francesco@dolcini.it>
 <20230330101752.429804-2-francesco@dolcini.it>
 <20230403210622.GA1740065-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403210622.GA1740065-robh@kernel.org>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Francesco Dolcini <francesco@dolcini.it>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 devicetree@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 03, 2023 at 04:06:22PM -0500, Rob Herring wrote:
> On Thu, Mar 30, 2023 at 12:17:51PM +0200, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > 
> > SN65DSI8[34] device supports burst video mode and non-burst video mode
> > with sync events or with sync pulses packet transmission as described in
> > the DSI specification.
> > 
> > Add property to select the expected mode, this allows for example to
> > select a mode that is compatible with the DSI host interface.
> 
> Why does this need to be in DT?

> The source and sink drivers should know what their capabilities are
> and pick the best common one.

Is there a best mode? Isn't this a decision how do we want the 2 peers
to communicate?

For the MIPI-DSI Linux/DRM experts: am I missing something? Is there
another way to have a DSI video sink to ask for a specific mode?

(I copied this from an existing DSI panel binding).

Francesco

