Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8D21410D1
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 19:31:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38486F899;
	Fri, 17 Jan 2020 18:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F7C66F899
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 18:31:49 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 8CDEC20026;
 Fri, 17 Jan 2020 19:31:47 +0100 (CET)
Date: Fri, 17 Jan 2020 19:31:46 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v9 0/5] add driver for "boe, tv101wum-nl6", "boe,
 tv101wum-n53", "auo, kd101n80-45na" and "auo, b101uan08.3" panels
Message-ID: <20200117183146.GB14298@ravnborg.org>
References: <20200116021511.22675-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200116021511.22675-1-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8
 a=3tjGstHQEWMJ4ujXvacA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
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
Cc: srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cawa.cheng@mediatek.com,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jitao.

Thanks for your perseverance on this.
With the minor issue on the binding file resolved everything is now fine
and patches are all applied to drm-misc-next.

Thanks,

	Sam

On Thu, Jan 16, 2020 at 10:15:06AM +0800, Jitao Shi wrote:
> Changes since v8:
>  - merge the panel documents to one.
>  - delay move the drm_panel_of_backlight after drm_panel_init
> 
> Changes since v7:
>  - base drm-misc-next branch
>  - fix document pass dt_binding_check
>  - remove backlight from panel driver
> 
> Changes since v6:
>  - fix boe_panel_init err uninit.
>  - adjust the delay of backlight on.
> 
> Changes since v5:
>  - covert the documents to yaml
>  - fine tune boe, tv101wum-n53 panel video timine
> 
> Changes since v4:
>  - add auo,b101uan08.3 panel for this driver.
>  - add boe,tv101wum-n53 panel for this driver.
> 
> Changes since v3:
>  - remove check enable_gpio.
>  - fine tune the auo,kd101n80-45na panel's power on timing.
> 
> Changes since v2:
>  - correct the panel size
>  - remove blank line in Kconfig
>  - move auo,kd101n80-45na panel driver in this series.
> 
> Changes since v1:
>  - update typo nl6 -> n16.
>  - update new panel config and makefile are added in alphabetically order.
>  - add the panel mode and panel info in driver data.
>  - merge auo,kd101n80-45a and boe,tv101wum-nl6 in one driver
> 
> Jitao Shi (5):
>   dt-bindings: display: panel: Add boe tv101wum-n16 panel bindings
>   drm/panel: support for boe tv101wum-nl6 wuxga dsi video mode panel
>   drm/panel: support for auo,kd101n80-45na wuxga dsi video mode panel
>   drm/panel: support for boe,tv101wum-n53 wuxga dsi video mode panel
>   drm/panel: support for auo,b101uan08.3 wuxga dsi video mode panel
> 
>  .../display/panel/boe,tv101wum-nl6.yaml       |  81 ++
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 854 ++++++++++++++++++
>  4 files changed, 945 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
>  create mode 100644 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> 
> -- 
> 2.21.0
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
