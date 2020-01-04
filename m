Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FA71302F3
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 16:17:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 235C66E441;
	Sat,  4 Jan 2020 15:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260D86E441
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jan 2020 15:17:07 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id A784A805F7;
 Sat,  4 Jan 2020 16:17:03 +0100 (CET)
Date: Sat, 4 Jan 2020 16:17:02 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH 0/6] dt-bindings: display: Update few panel bindings with
 YAML
Message-ID: <20200104151702.GC17768@ravnborg.org>
References: <20200101112444.16250-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200101112444.16250-1-jagan@amarulasolutions.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=TC1aGOGHLOKMx2fu2ooA:9 a=CjuIK1q_8ugA:10 a=pHzHmUro8NiASowvMSCR:22
 a=6VlIyEUom7LUIeUMNQJH:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan.
On Wed, Jan 01, 2020 at 04:54:38PM +0530, Jagan Teki wrote:
> These panel bindings are owned by me, so updated all of them into
> YAML DT schema.
> 
> Any inputs?
Thanks for doing the conversion.

dt_binding_check was not happy:
Documentation/devicetree/bindings/display/panel/rocktech,rk070er9427.example.dt.yaml: panel: 'backlight', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
  DTC     Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.example.dt.yaml
  CHECK   Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.example.dt.yaml
Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.example.dt.yaml: panel: 'backlight', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.example.dt.yaml: panel: compatible: Additional items are not allowed ('simple-panel' was unexpected)
Documentation/devicetree/bindings/display/panel/friendlyarm,hd702e.example.dt.yaml: panel: compatible: ['friendlyarm,hd702e', 'simple-panel'] is too long
  DTC     Documentation/devicetree/bindings/display/panel/sitronix,st7701.example.dt.yaml
Error: Documentation/devicetree/bindings/display/panel/sitronix,st7701.example.dts:22.42-43 syntax error
FATAL ERROR: Unable to parse input tree

Please fix and check the bindings using dt_binding_check before
resubmit.

I had to install libyaml-dev (as least I recall this was the name)
before dt_binding_check worked OK for me.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
