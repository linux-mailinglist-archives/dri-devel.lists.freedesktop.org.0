Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 702AB3B0FF0
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 00:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C6896E1F1;
	Tue, 22 Jun 2021 22:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D736E1F1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 22:14:31 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AEEDC9AA;
 Wed, 23 Jun 2021 00:14:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624400069;
 bh=KJaM06corl+qbZ9gtAZ4VVNt6jd4v4LQ6a4cbtNys4U=;
 h=From:Subject:To:Cc:References:Date:In-Reply-To:From;
 b=BZJA4DDZmQCDd4huKIkz8hY4n5QFAsVCHI2UaYZT+Xabyn6siIS1GoFlhp09hvua4
 MfurY3f00lb6W8V9Rf4Q3k3mCr2VP9/tfCGPPgpwSGZOveJwUYLWRC2yOpQgPNO+NP
 +cj5HNen1QgNvbshpFHBdUv1vFKBRDWaeQNZpzzU=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v3 3/4] drm: rcar-du: dw-hdmi: Set output port number
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20210520065046.28978-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210520065046.28978-4-laurent.pinchart+renesas@ideasonboard.com>
Message-ID: <ef966b6b-e367-0986-9ef6-66fff799c205@ideasonboard.com>
Date: Tue, 22 Jun 2021 23:14:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520065046.28978-4-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: linux-renesas-soc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On 20/05/2021 07:50, Laurent Pinchart wrote:
> Report the DT output port number in dw_hdmi_plat_data to connect to the
> next bridge in the dw-hdmi driver.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
> index 7b8ec8310699..18ed14911b98 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
> @@ -75,6 +75,7 @@ static int rcar_hdmi_phy_configure(struct dw_hdmi *hdmi, void *data,
>  }
>  
>  static const struct dw_hdmi_plat_data rcar_dw_hdmi_plat_data = {
> +	.output_port = 1,

I presume this matches the bindings at "port@1:HDMI output port"

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

>  	.mode_valid = rcar_hdmi_mode_valid,
>  	.configure_phy	= rcar_hdmi_phy_configure,
>  };
> 
