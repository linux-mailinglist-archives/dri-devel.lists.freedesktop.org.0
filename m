Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6776E3806
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 14:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6985310E0E7;
	Sun, 16 Apr 2023 12:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2833E10E0E7
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 12:34:50 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id q5so12409034wmo.4
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 05:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681648485; x=1684240485;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gepVDcgZ63u10tf5D/Mxq+XYlNxqDNlnnomNWJ0Zkyk=;
 b=Yh/6oMntD58gdk+Jxg9Zuuj79vjdYVNa4EJwaI9fSzqkqe7hrYsV5LXnU+8FNfAruw
 llfiBArledcqkjHaWPAhXuF+yyNzGWuWgRLgl0d+/WyK/gg687U1RQfAea/6/jatXcc9
 dYM+6yKEWFg5Lz4329zvf9bDEA4Nu4dSlcKY7DtTIcjo8sTHRSShjeHvFni3LhQA7HJY
 7q+zcIp9ep0svn9hNhnK40TubxcLQYBqcMDFkNtLnmnXLCDnNTlGG6CI20KtP5s6GqgH
 YUrBGiJsyuBlO+24QGiWUVrpJefRB4c843oR3xkdpeyWK1ygyLg38QT6IaPLD2+3rDEb
 8rWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681648485; x=1684240485;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gepVDcgZ63u10tf5D/Mxq+XYlNxqDNlnnomNWJ0Zkyk=;
 b=Z+JONEM+nQ3JYX4/yw/kxb+orrrNRbKk7Qvt3XY1p2uWb2P2pypW82U6GQkeociRkf
 UVSPobkJWLHEPPedwShz5UkBZoR6mZTd1jjhE+QbQODIz09xIqF/Yybg1BvtE+daZQR/
 egKYs0wJabjs+eqnVCAchakjan5Y76/qtIfZZou8f6YHmGf1mg3dio5sZkTOnYSaJfkQ
 RsAij1QndXqbLoCAGjK8jarqCDbzXAGflntrndk87V6IAK8jdl9Xj0T70Dss0xNlnlvN
 s3Xt2wjYBw7fbDM+MrRd1IKzqLm1rd6/pNxdnQsmTEvt7CmTBN7CeJDhEOoXrouaCFqj
 xMsg==
X-Gm-Message-State: AAQBX9evq13rQHqKWvZahBtGLYsBmBed58tU4pRnH2B3UatFhH9rjjRJ
 oMDaJgt7/r5wKBIzIN1Txpk=
X-Google-Smtp-Source: AKy350aWNq62xOQqANII30KV/v65neAOYfc1waQwr0SahK/pCHkD0SbV9i12Lz4Ns/NQAHLIgawAPg==
X-Received: by 2002:a1c:f402:0:b0:3ed:da74:ab0c with SMTP id
 z2-20020a1cf402000000b003edda74ab0cmr8547679wma.19.1681648485237; 
 Sun, 16 Apr 2023 05:34:45 -0700 (PDT)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch.
 [82.192.242.114]) by smtp.gmail.com with ESMTPSA id
 g15-20020a05600c4ecf00b003edc4788fa0sm13028683wmq.2.2023.04.16.05.34.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 05:34:44 -0700 (PDT)
Received: by eldamar.lan (Postfix, from userid 1000)
 id DF91ABE2DE0; Sun, 16 Apr 2023 14:34:43 +0200 (CEST)
Date: Sun, 16 Apr 2023 14:34:43 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Cyril Brulebois <cyril@debamax.com>, regressions@lists.linux.dev
Subject: Re: [PATCH 1/2] fbdev/offb: Update expected device name
Message-ID: <ZDvrY7X9mpJ7WZ3z@eldamar.lan>
References: <20230412095509.2196162-1-cyril@debamax.com>
 <20230412095509.2196162-2-cyril@debamax.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230412095509.2196162-2-cyril@debamax.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Michal Suchanek <msuchanek@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

looping in as well the regressions list (hoping not doing any mistake
with the regzbot commands):

On Wed, Apr 12, 2023 at 11:55:08AM +0200, Cyril Brulebois wrote:
> Since commit 241d2fb56a18 ("of: Make OF framebuffer device names unique"),
> as spotted by Frédéric Bonnard, the historical "of-display" device is
> gone: the updated logic creates "of-display.0" instead, then as many
> "of-display.N" as required.
> 
> This means that offb no longer finds the expected device, which prevents
> the Debian Installer from setting up its interface, at least on ppc64el.
> 
> It might be better to iterate on all possible nodes, but updating the
> hardcoded device from "of-display" to "of-display.0" is confirmed to fix
> the Debian Installer at the very least.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217328
> Link: https://bugs.debian.org/1033058
> Fixes: 241d2fb56a18 ("of: Make OF framebuffer device names unique")
> Cc: stable@vger.kernel.org
> Signed-off-by: Cyril Brulebois <cyril@debamax.com>
> ---
>  drivers/video/fbdev/offb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/offb.c b/drivers/video/fbdev/offb.c
> index b97d251d894b..6264c7184457 100644
> --- a/drivers/video/fbdev/offb.c
> +++ b/drivers/video/fbdev/offb.c
> @@ -698,7 +698,7 @@ MODULE_DEVICE_TABLE(of, offb_of_match_display);
>  
>  static struct platform_driver offb_driver_display = {
>  	.driver = {
> -		.name = "of-display",
> +		.name = "of-display.0",
>  		.of_match_table = offb_of_match_display,
>  	},
>  	.probe = offb_probe_display,

#regzbot ^introduced 241d2fb56a18
#regzbot title: Open Firmware framebuffer cannot find of-display
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=217328
#regzbot link: https://lore.kernel.org/all/20230412095509.2196162-1-cyril@debamax.com/T/#m34493480243a2cad2ae359abfd9db5e755f41add
#regzbot link: https://bugs.debian.org/1033058

Regards,
Salvatore
