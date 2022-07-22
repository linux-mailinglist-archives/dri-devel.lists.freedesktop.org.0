Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F4057DED2
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 11:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB52928C8;
	Fri, 22 Jul 2022 09:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D98928C2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 09:48:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3A4F861CBE;
 Fri, 22 Jul 2022 09:48:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BD7CC341C6;
 Fri, 22 Jul 2022 09:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658483318;
 bh=zqyxHm2IT834QgHNgluqGebEd9cxm9eIOwtg4tyJnnE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tkDfLlq9RARf1Fq5klYQL9R1fcypGt7a+2+XTrzB5bBXsCwhIZhjtJjrLiMKTb4rO
 T2qhINVNCn87eAkrLm8YgRdgZacjnn+s+9bXfDybuM7zuaScNLks6qzZZduK8TDcvY
 TGFP/ruRoZ6oFsvHNqkxSykxIHOBDktb7dRn5gckLYq8ejHEz/O1JuGOuU42kPECS9
 vlEn+28zXAzUQc/V+hd1jq8O09Gj+03+ECTNTjaotxbSrPKuNdqu+zOJ4PN3WXfe/f
 3JJ0vgqiLI0BOUrM8ESUEDU6Y4xx+bXjjYvaMc9mefD+QpmLAuq8xkH6ny0XEcCYPL
 BJ5HL4pwhKCLA==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1oEpGy-0007TA-Gm; Fri, 22 Jul 2022 11:48:41 +0200
Date: Fri, 22 Jul 2022 11:48:40 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm/panel-edp: add AUO B133UAN02.1 panel entry
Message-ID: <YtpyeCHojFovBKxv@hovoldconsulting.com>
References: <20220711075202.21775-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220711075202.21775-1-johan+linaro@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 11, 2022 at 09:52:02AM +0200, Johan Hovold wrote:
> Add an eDP panel entry for AUO B133UAN02.1.
> 
> Due to lack of documentation, use the delay_200_500_e50 timings like
> some other AUO entries for now.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Any comments to this one?

It looks like it hasn't shown up in the dri-devel patchwork and just
want to make sure it isn't lost.

Rob Clark mentioned something about a spam filter on IRC.

> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index fe3897b86665..30f69cd8f9ee 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1845,6 +1845,7 @@ static const struct panel_delay delay_100_500_e200 = {
>   * Sort first by vendor, then by product ID.
>   */
>  static const struct edp_panel_entry edp_panels[] = {
> +	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1e9b, &delay_200_500_e50, "B133UAN02.1"),
>  	EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01"),
>  	EDP_PANEL_ENTRY('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116XAN06.1"),
>  	EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50, "B133UAN01.0"),

Johan
