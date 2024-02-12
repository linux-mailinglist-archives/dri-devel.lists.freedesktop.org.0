Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D169850EBF
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 09:18:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2BA510E4DE;
	Mon, 12 Feb 2024 08:18:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=atomide.com header.i=@atomide.com header.b="rU9losSW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671B210E4DE
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 08:18:32 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id 090026036A;
 Mon, 12 Feb 2024 08:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1707725909;
 bh=o1J8VBOyGLyYjF4hp5r2x8I5a4dOkXgfTSRK3XqSHgc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rU9losSWbWS9//3FMBSOy8jZGW1JynDEyZONP43YCZYddn/0cTvncDj9P3h58UlR1
 C8mxCcwvdr/+7nfKnU+qjJEX2tOBtGP9eRyIiFAUGw9P41sNIM1u5MGhrxSY7oT4Fc
 QRi6wGGrnjYNOp1XMbrwHHGvswjDmUs/5lf+xAl/gGnaUWodxnl7Pj4QMYwGpVUgRU
 iWPZQOIiCcugEtWqaDtjM206+tdFoBKnIQULzTPUtISKuSJIA/JJREH7wLGA/SmPOP
 uzP58cZIBcjBP/Pgeo9+AwenUm5LGjZIWXHTxPYgREdCTpHcxUPquLydE/GA2uj6nX
 Qy7oRgZqs5yXw==
Date: Mon, 12 Feb 2024 10:17:44 +0200
From: Tony Lindgren <tony@atomide.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Simha BN <simhavcs@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Michael Walle <mwalle@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v3 03/10] dt-bindings: display: bridge: tc358775: Add
 support for tc358765
Message-ID: <20240212081744.GE5299@atomide.com>
References: <20240211095144.2589-1-tony@atomide.com>
 <20240211095144.2589-4-tony@atomide.com>
 <adeb3ebb-76ed-4f00-8b46-a1b9c36cfc64@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adeb3ebb-76ed-4f00-8b46-a1b9c36cfc64@linaro.org>
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

* Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [240212 08:06]:
> On 11/02/2024 10:51, Tony Lindgren wrote:
> > The tc358765 is similar to tc358775. The tc358765 just an earlier version
> > of the hardware, and it's pin and register compatible with tc358775 for
> > most part.
> > 
> > From the binding point of view the only difference is that the tc358765
> > does not have stdby-gpios.
> > 
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > ---
> 
> It does not look like you tested the bindings, at least after quick
> look. Please run `make dt_binding_check` (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).
> Maybe you need to update your dtschema and yamllint.

I did.. But I did not notice that this no longer works:

$ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
  LINT    Documentation/devicetree/bindings
usage: yamllint [-h] [-] [-c CONFIG_FILE | -d CONFIG_DATA] [--list-files] [-f {parsable,standard,colored,github,auto}] [-s] [--no-warnings] [-v] [FILE_OR_DIR ...]
yamllint: error: one of the arguments FILE_OR_DIR - is required
  CHKDT   Documentation/devicetree/bindings/processed-schema.json
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json

After removing the ">2&1" from the Makefile, there's some more info:

yamllint: error: one of the arguments FILE_OR_DIR - is required

Where DT_SCHEMA_FILES ends up empty. I guess dt_binding_check needs
to be now run with just:

$ make dt_binding_check DT_SCHEMA_FILES=toshiba,tc358775.yaml

Regards,

Tony
