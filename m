Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 150011C1F10
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 22:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 913B46E060;
	Fri,  1 May 2020 20:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5586E060
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 20:54:45 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 729062002A;
 Fri,  1 May 2020 22:54:39 +0200 (CEST)
Date: Fri, 1 May 2020 22:54:38 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Konrad Dybcio <konradybcio@gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: display: Document TM5P5 NT35596 panel
 compatible
Message-ID: <20200501205438.GA26726@ravnborg.org>
References: <20200501204825.146424-1-konradybcio@gmail.com>
 <20200501204825.146424-3-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200501204825.146424-3-konradybcio@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=8nJEP1OIZ-IA:10 a=pGLkceISAAAA:8 a=nsjD_eZvI9l_Tp8ZG94A:9
 a=wPNLvfGTeEIA:10
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
Cc: devicetree@vger.kernel.org, skrzynka@konradybcio.pl,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Konrad.

Thanks for the new panel binding.
But you need to redo this as panel bindings today must be in DT Schema
format (.yaml).
Please see other bindings in the same dir for examples.

	Sam

On Fri, May 01, 2020 at 10:48:23PM +0200, Konrad Dybcio wrote:
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> ---
>  .../devicetree/bindings/display/panel/tm5p5,nt35596.txt    | 7 +++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/tm5p5=
,nt35596.txt
> =

> diff --git a/Documentation/devicetree/bindings/display/panel/tm5p5,nt3559=
6.txt b/Documentation/devicetree/bindings/display/panel/tm5p5,nt35596.txt
> new file mode 100644
> index 0000000000000..6be56983482bf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/tm5p5,nt35596.txt
> @@ -0,0 +1,7 @@
> +TM5P5 NT35596 5.5" 1080=D71920 LCD Panel
> +
> +Required properties:
> +  - compatible: "tm5p5,nt35596"
> +  - reset-gpios: GPIO spec for reset pin
> +  - vdd-supply: VDD regulator
> +  - vddio-supply: VDDIO regulator
> -- =

> 2.26.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
