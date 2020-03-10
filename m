Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE46180897
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 20:54:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38DF6E39B;
	Tue, 10 Mar 2020 19:54:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A23F6E39B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 19:54:33 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 55CCC804BA;
 Tue, 10 Mar 2020 20:54:26 +0100 (CET)
Date: Tue, 10 Mar 2020 20:54:25 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v8] dt-bindings: display: Add idk-2121wr binding
Message-ID: <20200310195425.GA23440@ravnborg.org>
References: <1583869169-1006-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583869169-1006-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=yC-0_ovQAAAA:8
 a=NcFk6D9gAAAA:8 a=VwQbUJbxAAAA:8 a=7378Ce_uM9WWH4H7eJsA:9
 a=CjuIK1q_8ugA:10 a=gDps05xe3HUA:10 a=-FEs8UIgK8oA:10 a=CojVow1nldcA:10
 a=NWVoK91CQyQA:10 a=QsnFDINu91a9xkgZirup:22 a=dT0RXAwTRpxWjiziVLXF:22
 a=AjGcO6oz07-iQ99wixmX:22
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
 Thierry Reding <thierry.reding@gmail.com>,
 Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Prabhakar

On Tue, Mar 10, 2020 at 07:39:29PM +0000, Lad Prabhakar wrote:
> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Add binding for the idk-2121wr LVDS panel from Advantech.
> 
> Some panel-specific documentation can be found here:
> https://buy.advantech.eu/Displays/Embedded-LCD-Kits-High-Brightness/model-IDK-2121WR-K2FHA2E.htm
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> 
> Hi All,
> This patch is part of series [1] ("Add dual-LVDS panel support to EK874),
> all the patches have been accepted from it except this one. I have fixed
> Rob's comments in this version of the patch.
> 
> [1] https://patchwork.kernel.org/cover/11297589/
> 
> V7->8
>  * Dropped ref to lvds.yaml, since the panel a dual channel LVDS, as a
>    result the root port is called as ports instead of port and the child
>    node port@0 and port@1 are used for even and odd pixels, hence binding
>    has required property as ports instead of port.

Looks good, thanks for your persistence..
Applied and pushed to drm-misc-next.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
