Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8164282AC
	for <lists+dri-devel@lfdr.de>; Sun, 10 Oct 2021 19:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30EB46E3AC;
	Sun, 10 Oct 2021 17:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F006E3AC
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Oct 2021 17:35:25 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 6b5d2bcc-29f0-11ec-9c3f-0050568c148b;
 Sun, 10 Oct 2021 17:35:11 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 2ADED194BA6;
 Sun, 10 Oct 2021 19:35:10 +0200 (CEST)
Date: Sun, 10 Oct 2021 19:35:21 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: thierry.reding@gmail.com, matthias.bgg@gmail.com, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [v2] drm/panel: panel-simple: Add delay for LG LP120UP1
Message-ID: <YWMkWSi83118QMrz@ravnborg.org>
References: <20211007110547.455-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211007110547.455-1-rex-bc.chen@mediatek.com>
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

Hi Rex-BC
On Thu, Oct 07, 2021 at 07:05:47PM +0800, Rex-BC Chen wrote:
> Add power sequence for LG LP120UP1.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Patch failed to apply to drm-misc-next.
Please fix and resend.

	Sam

> ---
>  drivers/gpu/drm/panel/panel-simple.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 9b6c4e6c38a1..9f6544450b56 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3045,6 +3045,11 @@ static const struct panel_desc lg_lp120up1 = {
>  		.width = 267,
>  		.height = 183,
>  	},
> +	.delay = {
> +		.prepare = 200,
> +		.enable = 50,
> +		.unprepare = 500,
> +	},
>  	.connector_type = DRM_MODE_CONNECTOR_eDP,
>  };
>  
> -- 
> 2.18.0
