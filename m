Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5514224D34
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jul 2020 18:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA3DA6E191;
	Sat, 18 Jul 2020 16:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECEE06E191
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jul 2020 16:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 95893FB03;
 Sat, 18 Jul 2020 18:53:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oM9Y5MKKCY_p; Sat, 18 Jul 2020 18:53:04 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 63C3142576; Sat, 18 Jul 2020 18:53:04 +0200 (CEST)
Date: Sat, 18 Jul 2020 18:53:04 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH 2/2] dt-binding: display: Allow a single port node on
 rocktech,jh057n00900
Message-ID: <20200718165304.GB26122@bogon.m.sigxcpu.org>
References: <20200703114717.2140832-1-megous@megous.com>
 <20200703114717.2140832-3-megous@megous.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703114717.2140832-3-megous@megous.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Robert Chiras <robert.chiras@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Fri, Jul 03, 2020 at 01:47:17PM +0200, Ondrej Jirman wrote:
> The display has one port. Allow it in the binding.
> =

> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>  .../devicetree/bindings/display/panel/rocktech,jh057n00900.yaml  | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/Documentation/devicetree/bindings/display/panel/rocktech,jh0=
57n00900.yaml b/Documentation/devicetree/bindings/display/panel/rocktech,jh=
057n00900.yaml
> index a6985cd947fb..d5733ef30954 100644
> --- a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n0090=
0.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n0090=
0.yaml
> @@ -24,6 +24,7 @@ properties:
>          # Xingbangda XBD599 5.99" 720x1440 TFT LCD panel
>        - xingbangda,xbd599
>  =

> +  port: true
>    reg:
>      maxItems: 1
>      description: DSI virtual channel

Reviewed-by: Guido G=FCnther <agx@sigxcpu.org>
 -- Guido

> -- =

> 2.27.0
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
