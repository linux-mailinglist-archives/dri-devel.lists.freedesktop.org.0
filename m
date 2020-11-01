Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9A72A1CCC
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 10:19:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D6B8994A;
	Sun,  1 Nov 2020 09:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7731897D4
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Nov 2020 09:19:21 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id D6B9380507;
 Sun,  1 Nov 2020 10:19:18 +0100 (CET)
Date: Sun, 1 Nov 2020 10:19:17 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/ast: Support 1600x900 with 108MHz PCLK
Message-ID: <20201101091917.GA1166694@ravnborg.org>
References: <20201030074212.22401-1-kuohsiang_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201030074212.22401-1-kuohsiang_chou@aspeedtech.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=V2NxCb60AAAA:8 a=e5mUnYsNAAAA:8
 a=O1EgNBWlHPeyu-rmxSkA:9 a=CjuIK1q_8ugA:10 a=3L6qF29SlnrayQqPM2jZ:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: eich@suse.com, dri-devel@lists.freedesktop.org, tommy_huang@aspeedtech.com,
 jenmin_yuan@aspeedtech.com, airlied@redhat.com, arc_sung@aspeedtech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi KuoHsiang

On Fri, Oct 30, 2020 at 03:42:12PM +0800, KuoHsiang Chou wrote:
> [New] Create the setting for 1600x900 @60Hz refresh rate
>       by 108MHz pixel-clock.
> 
> Signed-off-by: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>

Thomas Zimmermann <tzimmermann@suse.de> is listed as reviewer
in MAINTAINERS, so included him in the list of receiver.
get_maintainer.pl should have told you that.

	Sam

> ---
>  drivers/gpu/drm/ast/ast_tables.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ast/ast_tables.h b/drivers/gpu/drm/ast/ast_tables.h
> index d665dd5af5dd..8414e543f260 100644
> --- a/drivers/gpu/drm/ast/ast_tables.h
> +++ b/drivers/gpu/drm/ast/ast_tables.h
> @@ -282,6 +282,8 @@ static const struct ast_vbios_enhtable res_1360x768[] = {
>  };
> 
>  static const struct ast_vbios_enhtable res_1600x900[] = {
> +	{1800, 1600, 24, 80,1000,  900, 1, 3, VCLK108,		/* 60Hz */
> +	 (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo), 60, 3, 0x3A },
>  	{1760, 1600, 48, 32, 926, 900, 3, 5, VCLK97_75,		/* 60Hz CVT RB */
>  	 (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo |
>  	  AST2500PreCatchCRT), 60, 1, 0x3A },
> --
> 2.18.4
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
