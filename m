Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F29202619
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jun 2020 21:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895126E34A;
	Sat, 20 Jun 2020 19:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3CF26E34A
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jun 2020 19:10:38 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 0D5A520021;
 Sat, 20 Jun 2020 21:10:31 +0200 (CEST)
Date: Sat, 20 Jun 2020 21:10:30 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
Subject: Re: [PATCH v4 0/4] dt-bindings: display: ti,tfp410.txt: convert to
 yaml
Message-ID: <20200620191030.GB27870@ravnborg.org>
References: <20200617094633.19663-1-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200617094633.19663-1-ricardo.canuelo@collabora.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=edQTgYMH c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=8nJEP1OIZ-IA:10 a=e5mUnYsNAAAA:8 a=g4gMLcP0b6Kv2YKJtkEA:9
 a=wPNLvfGTeEIA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: devicetree@vger.kernel.org, jason@lakedaemon.net, airlied@linux.ie,
 tomi.valkeinen@ti.com, dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ricardo.

On Wed, Jun 17, 2020 at 11:46:29AM +0200, Ricardo Ca=F1uelo wrote:
> This series converts the DT binding for the TI TFP410 DPI-to-DVI encoder
> to json-schema.
> =

> It also fixes a minor bug in the ti-tfp410 driver that causes a
> wrong calculation of the setup and hold times when the de-skew feature
> is enabled. The retrieval of the de-skew value from the DT has also been
> updated to reflect the binding changes.
> =

> Changes in v4:
> =

>   - ti,tfp410.yaml:
>     - "ports" node set back as required (Laurent Pinchart). This means
>       that dove-sbc-a510.dts will not comply with the binding and will
>       have to be fixed at some point.
> =

> The bindings have been tested with:
> =

>   make dt_binding_check ARCH=3D<arch> DT_SCHEMA_FILES=3D<...ti,tfp410.yam=
l>
>   make dtbs_check ARCH=3D<arch> DT_SCHEMA_FILES=3D<...ti,tfp410.yaml>
> =

> for <arch> =3D arm and arm64.
> This uncovered a number of dts files that use the TFP410 but not through
> I2C and don't define the ti,deskew property. These should also be fixed.
> =

> Ricardo Ca=F1uelo (4):
>   dt-bindings: display: ti,tfp410.txt: convert to yaml
>   dt-bindings: display: ti,tfp410.yaml: Redefine ti,deskew property
>   drm/bridge: tfp410: fix de-skew value retrieval from DT
>   drm/bridge: tfp410: Fix setup and hold time calculation

Thanks for following up and this.
Applied to drm-misc-next.

	Sam

> =

>  .../bindings/display/bridge/ti,tfp410.txt     |  66 ---------
>  .../bindings/display/bridge/ti,tfp410.yaml    | 131 ++++++++++++++++++
>  drivers/gpu/drm/bridge/ti-tfp410.c            |  10 +-
>  3 files changed, 136 insertions(+), 71 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/ti,t=
fp410.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,t=
fp410.yaml
> =

> -- =

> 2.18.0
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
