Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F9973BAFD
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 17:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05CFF10E64F;
	Fri, 23 Jun 2023 15:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1768E10E651
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 15:04:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 202E0838;
 Fri, 23 Jun 2023 17:03:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687532624;
 bh=nnn3dttM0EmRsUW9dmWfGhqshG0TP5/h0YR9x1tnh7o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YoDVayLlqviOTiLWT330yGnLW0k7iTia1yZEOxdt343ykRjwB5hmHN8ep1LTknXQZ
 mdQEBm7Hf+/ep3+K7D6BjU7GEjPT66tekWDveWtm87vWaFYrJoZZUTjWJcbvmLqeLO
 K0HH8RFSopGo7lFcO5u+ZcQoO8ki4gFYSq4fv6kk=
Date: Fri, 23 Jun 2023 18:04:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 07/39] drm: renesas: shmobile: Restore indentation of
 shmob_drm_setup_clocks()
Message-ID: <20230623150419.GI2112@pendragon.ideasonboard.com>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <3739c76fca025e6b5d901ff29676146a45a545c2.1687423204.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3739c76fca025e6b5d901ff29676146a45a545c2.1687423204.git.geert+renesas@glider.be>
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
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the patch.

On Thu, Jun 22, 2023 at 11:21:19AM +0200, Geert Uytterhoeven wrote:
> Commit 56550d94cbaeaa19 ("Drivers: gpu: remove __dev* attributes.")
> forgot to realign the continuation of the parameter section of
> shmob_drm_setup_clocks().
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> index 4f01caa119637032..d272e6273c782178 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> @@ -67,7 +67,7 @@ static int shmob_drm_init_interface(struct shmob_drm_device *sdev)
>  }
>  
>  static int shmob_drm_setup_clocks(struct shmob_drm_device *sdev,
> -					    enum shmob_drm_clk_source clksrc)
> +				  enum shmob_drm_clk_source clksrc)
>  {
>  	struct clk *clk;
>  	char *clkname;

-- 
Regards,

Laurent Pinchart
