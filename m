Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5DF14D0BA
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 19:52:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83FD06E43A;
	Wed, 29 Jan 2020 18:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC8E6E43A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 18:52:40 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id BC3A12004B;
 Wed, 29 Jan 2020 19:52:37 +0100 (CET)
Date: Wed, 29 Jan 2020 19:52:36 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: Add bindings for EDT panel
Message-ID: <20200129185236.GA25273@ravnborg.org>
References: <1580317318-32071-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
 <1580317318-32071-2-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1580317318-32071-2-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=yC-0_ovQAAAA:8
 a=e5mUnYsNAAAA:8 a=sU1EIm_IwOu4RIBN1oEA:9 a=CjuIK1q_8ugA:10
 a=QsnFDINu91a9xkgZirup:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Chris Paterson <chris.paterson2@renesas.com>,
 prabhakar.mahadev-lad.rj@bp.renesas.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marian-Cristian

On Wed, Jan 29, 2020 at 05:01:57PM +0000, Marian-Cristian Rotariu wrote:
> Document the Emerging Display Technology Corp. (EDT) ETM043080DH6-GP
> display, which is a 480x272 4.3" TFT display with capacitive touchscreen.
> 
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The compatibles for simple panels - like this - are all moved to a single file:

Documentation/devicetree/bindings/display/panel/panel-simple.yaml

And the file you patch here no logner exists.

Please redo your patch on top of drm-misc-next.

	Sam

> ---
>  Documentation/devicetree/bindings/display/panel/edt,et-series.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/edt,et-series.txt b/Documentation/devicetree/bindings/display/panel/edt,et-series.txt
> index b7ac1c7..cedbbe6 100644
> --- a/Documentation/devicetree/bindings/display/panel/edt,et-series.txt
> +++ b/Documentation/devicetree/bindings/display/panel/edt,et-series.txt
> @@ -22,6 +22,9 @@ simple-panel.txt
>  +=================+=====================+=====================================+
>  | ETM0430G0DH6    | edt,etm0430g0dh6    | 480x272 TFT Display                 |
>  +-----------------+---------------------+-------------------------------------+
> +| ETM043080DH6-GP | edt,etm043080dh6gp  | 480x272 TFT Display with capacitive |
> +|                 |                     | Touchscreen                         |
> ++-----------------+---------------------+-------------------------------------+
>  
>  5,7" WVGA TFT Panels
>  --------------------
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
