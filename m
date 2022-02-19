Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5B74BC70C
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 10:17:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FEA10F578;
	Sat, 19 Feb 2022 09:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A19910F578
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 09:17:33 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id d067ead0-9164-11ec-baa1-0050568c148b;
 Sat, 19 Feb 2022 09:17:52 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 6AF7F194BBA;
 Sat, 19 Feb 2022 10:17:33 +0100 (CET)
Date: Sat, 19 Feb 2022 10:17:29 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] drm/panel: nt35560: Support more panel IDs
Message-ID: <YhC1qfd3SSrzTN+E@ravnborg.org>
References: <20220103113822.654592-1-linus.walleij@linaro.org>
 <20220103113822.654592-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220103113822.654592-2-linus.walleij@linaro.org>
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
Cc: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 03, 2022 at 12:38:21PM +0100, Linus Walleij wrote:
> These IDs were found in the wild in a Sony Xperia vendor tree.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-novatek-nt35560.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35560.c b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
> index 620876225384..41dc278faf80 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt35560.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
> @@ -32,13 +32,14 @@
>  /*
>   * Sony seems to use vendor ID 0x81
>   */
> -#define DISPLAY_SONY_ACX424AKP_ID1	0x811b
> +#define DISPLAY_SONY_ACX424AKP_ID1	0x8103
>  #define DISPLAY_SONY_ACX424AKP_ID2	0x811a
> +#define DISPLAY_SONY_ACX424AKP_ID3	0x811b
>  /*
>   * The third ID looks like a bug, vendor IDs begin at 0x80
>   * and panel 00 ... seems like default values.
>   */
This comment needs adjustment s/third/fourth/
With the comment fixed:
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> -#define DISPLAY_SONY_ACX424AKP_ID3	0x8000
> +#define DISPLAY_SONY_ACX424AKP_ID4	0x8000
>  
>  struct nt35560 {
>  	struct drm_panel panel;
> @@ -225,6 +226,7 @@ static int nt35560_read_id(struct nt35560 *nt)
>  	case DISPLAY_SONY_ACX424AKP_ID1:
>  	case DISPLAY_SONY_ACX424AKP_ID2:
>  	case DISPLAY_SONY_ACX424AKP_ID3:
> +	case DISPLAY_SONY_ACX424AKP_ID4:
>  		dev_info(nt->dev, "MTP vendor: %02x, version: %02x, panel: %02x\n",
>  			 vendor, version, panel);
>  		break;
> -- 
> 2.31.1
