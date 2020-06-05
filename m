Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 933881EFCF0
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 17:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3AC6E941;
	Fri,  5 Jun 2020 15:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C3C6E941
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 15:47:17 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id D48C320037;
 Fri,  5 Jun 2020 17:47:13 +0200 (CEST)
Date: Fri, 5 Jun 2020 17:47:12 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 0/2] drm/panel: simple: Add a KOE WUXGA 10.1" LVDS panel
 support
Message-ID: <20200605154712.GA207594@ravnborg.org>
References: <1590991775-24188-1-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1590991775-24188-1-git-send-email-victor.liu@nxp.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=edQTgYMH c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=yWwjhyuKAAAA:8 a=nC4w6PE1AAAA:8
 a=VtqsF2JDXepRWkxURg0A:9 a=CjuIK1q_8ugA:10 a=Af9y4jXI75YbyZfcaVTS:22
 a=6x2acwxlnJam7TDHjV8g:22
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
Cc: devicetree@vger.kernel.org, thierry.reding@gmail.com, linux-imx@nxp.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 01, 2020 at 02:09:35PM +0800, Liu Ying wrote:
> This patch set adds a KOE WUXGA 10.1" LVDS panel support.
> The panel type is TX26D202VM0BWA.
> The panel has dual LVDS channels.
> 
> My panel is manufactured by US Micro Products(USMP).  There is a tag at
> the back of the panel, which indicates the panel type is 'TX26D202VM0BWA'
> and it's made by KOE in Taiwan.
> 
> The panel spec from USMP can be found at:
> https://www.usmicroproducts.com/sites/default/files/datasheets/USMP-T101-192120NDU-A0.pdf
> 
> The below panel spec from KOE is basically the same to the one from USMP.
> However, the panel type 'TX26D202VM0BAA' is a little bit different.
> It looks that the two types of panel are compatible with each other.
> http://www.koe.j-display.com/upload/product/TX26D202VM0BAA.pdf
> 
> Patch 1/2 adds compatible for the panel in the panel-simple DT binding doc.
> Patch 2/2 adds the panel support in the DRM panel-simple driver.

Thanks, both patches applied to drm-misc-next.

	Sam

> 
> Liu Ying (2):
>   dt-bindings: panel-simple: Add koe,tx26d202vm0bwa compatible
>   drm/panel: simple: Add support for KOE TX26D202VM0BWA panel
> 
>  .../bindings/display/panel/panel-simple.yaml       |  2 ++
>  drivers/gpu/drm/panel/panel-simple.c               | 34 ++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
> 
> -- 
> 2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
