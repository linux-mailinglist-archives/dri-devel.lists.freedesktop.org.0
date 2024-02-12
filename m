Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 224A28515DA
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 14:51:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7ED110EB2B;
	Mon, 12 Feb 2024 13:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lWbqPBIS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6CD10EB2B
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 13:51:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 20DE260FE8;
 Mon, 12 Feb 2024 13:51:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84FA2C433F1;
 Mon, 12 Feb 2024 13:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707745870;
 bh=vwLwBT4PRTHSH4eQcxrNxB/+A7bhKLT0iSEbHHKStwA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lWbqPBISLWqLCCQsSISnhqS5B0JJ+u3JqDjUvp20+YJW126GKqVSAdg0/188lLqg+
 mYAJBNyxQlzK8uBPcnvSlvCpAQbVj1rYnJ3C+DeiNG8p4tY2+JoT3hRL4Hr+IPonpq
 DVLsOm7F7tNE+8eAKwh/WlVFxGufg8OX2nspwEZy8Q0NeUrvzgzPv/5iMugAAzuP9w
 6XZbfkuy4fDzWVkeFAN1sOC907V3Wzp+Xpq9RBYAthzdQPStvNMJkdZ3FsobIslb73
 KWXrHwy6522vkMOdid4xR1rni2S/GGsHi0IOspHn0WrMQQzUx7YP9hASJeLhmH5OL3
 cic65NngPkM8w==
Date: Mon, 12 Feb 2024 07:51:08 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Simha BN <simhavcs@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Michael Walle <mwalle@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v3 03/10] dt-bindings: display: bridge: tc358775: Add
 support for tc358765
Message-ID: <20240212135108.GA49008-robh@kernel.org>
References: <20240211095144.2589-1-tony@atomide.com>
 <20240211095144.2589-4-tony@atomide.com>
 <adeb3ebb-76ed-4f00-8b46-a1b9c36cfc64@linaro.org>
 <20240212081744.GE5299@atomide.com>
 <d6ecc1aa-419d-4f3c-8ba2-b124e5423293@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6ecc1aa-419d-4f3c-8ba2-b124e5423293@linaro.org>
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

On Mon, Feb 12, 2024 at 12:30:12PM +0100, Krzysztof Kozlowski wrote:
> On 12/02/2024 09:17, Tony Lindgren wrote:
> > * Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [240212 08:06]:
> >> On 11/02/2024 10:51, Tony Lindgren wrote:
> >>> The tc358765 is similar to tc358775. The tc358765 just an earlier version
> >>> of the hardware, and it's pin and register compatible with tc358775 for
> >>> most part.
> >>>
> >>> From the binding point of view the only difference is that the tc358765
> >>> does not have stdby-gpios.
> >>>
> >>> Signed-off-by: Tony Lindgren <tony@atomide.com>
> >>> ---
> >>
> >> It does not look like you tested the bindings, at least after quick
> >> look. Please run `make dt_binding_check` (see
> >> Documentation/devicetree/bindings/writing-schema.rst for instructions).
> >> Maybe you need to update your dtschema and yamllint.
> > 
> > I did.. But I did not notice that this no longer works:
> > 
> > $ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
> >   LINT    Documentation/devicetree/bindings
> > usage: yamllint [-h] [-] [-c CONFIG_FILE | -d CONFIG_DATA] [--list-files] [-f {parsable,standard,colored,github,auto}] [-s] [--no-warnings] [-v] [FILE_OR_DIR ...]
> > yamllint: error: one of the arguments FILE_OR_DIR - is required
> >   CHKDT   Documentation/devicetree/bindings/processed-schema.json
> >   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
> > 
> > After removing the ">2&1" from the Makefile, there's some more info:
> > 
> > yamllint: error: one of the arguments FILE_OR_DIR - is required
> > 
> > Where DT_SCHEMA_FILES ends up empty. I guess dt_binding_check needs
> > to be now run with just:
> > 
> > $ make dt_binding_check DT_SCHEMA_FILES=toshiba,tc358775.yaml
> > 
> 
> Yes, since June last year. Rob later brought (in July) backwards
> compatible way, but apparently something changed now in Makefile.

It broke in 6.8-rc1. I have a fix in my tree which I'll send to Linus 
this week.

Rob
