Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BD2288394
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 09:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E796EC57;
	Fri,  9 Oct 2020 07:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FCC16EC1F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 04:27:50 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id h24so11155245ejg.9
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Oct 2020 21:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Wa83KDJqEIQFwYhYvTrdA/0P1iUPtwhqUCll5VkxxTM=;
 b=KpAyRVEAdAaCwD+Yx6pELyeWFCw6hmhbf/6XG6boCoLNgXhlVj/wMaRZggwh/DHdE4
 j3S4ZOtdhpy1LtL36FMR65fmpFwroVpgHhNx7uhiG83woYsoOClVEMA1HKjjoeeuccsU
 0/NvrvJ8ERX5pwDvVZRsKTiD0PkY58wvHun4QomLCeS8574cEHxSJBV1z6KvSIN1Y4rT
 QcmffTwQTIPkXR8zW+e/fdOlr/JPKxERpFbJkvavcQjboyo4h4iMASE9rPDtFKlZi+nv
 jn5k9XVt0Wxk6P+G7ofrS/ZTwz0g9MR2P2gtfbnrflKP6Nie/7/7kX/pK8+D5FuXsS7f
 i9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Wa83KDJqEIQFwYhYvTrdA/0P1iUPtwhqUCll5VkxxTM=;
 b=S7w7oFNoI7MxDK9eenCc2ogYsH5IxiK3FNZgWizZmSrIXsPLhBH1fzOUZsSJBEgoIb
 mKeHN80RxFSHX3nb9m8T6qwLnbuO58PtKFvfdJRuH7uHcqnYb90LeBO0T6AjpDW9b7A5
 VnxvPbf5VJcfaNs1Kv3jz3Dad40a0j7Y66TyFPIKVesxdoG95yvn04ksS8RBgxbNJPGM
 U3Ltb8eJlZFLIQ71/YSldRboSjegL3T0Zs3VrmjnG/uFdZi/nnMlBFro5et6bc1xYWk/
 A2scZ9G/jKiVjeydDoRLAgGnRKDRNsZIFEIc80Ez4nYXBsB9EGOPfPPunYBnoHlGXx8w
 QQLA==
X-Gm-Message-State: AOAM533aR4UXtum5rFiwYRDcy1HsJSFBgcgu3wTIzFhZujX7Y5kkx8Er
 20MSAwpQsKtkOuVmniJi98k=
X-Google-Smtp-Source: ABdhPJwRaS0SMAw1qCu/TiUfeuovMZop0hM7vP4uKj/gyv19otcl5FvQai3oT5+iz6yElSNHMR5snw==
X-Received: by 2002:a17:906:564d:: with SMTP id
 v13mr12954650ejr.217.1602217668965; 
 Thu, 08 Oct 2020 21:27:48 -0700 (PDT)
Received: from felia ([2001:16b8:2d6e:f600:80f1:4ea4:2130:b98])
 by smtp.gmail.com with ESMTPSA id t16sm5463935eje.39.2020.10.08.21.27.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 21:27:48 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Fri, 9 Oct 2020 06:27:46 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH] MAINTAINERS: Update entry for st7703 driver after the
 rename
In-Reply-To: <20200701184640.1674969-1-megous@megous.com>
Message-ID: <alpine.DEB.2.21.2010090623060.15995@felia>
References: <20200701184640.1674969-1-megous@megous.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1811521063-1602217668=:15995"
X-Mailman-Approved-At: Fri, 09 Oct 2020 07:29:53 +0000
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
Cc: Purism Kernel Team <kernel@puri.sm>, David Airlie <airlied@linux.ie>,
 =?ISO-8859-15?Q?Guido_G=FCnther?= <agx@sigxcpu.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1811521063-1602217668=:15995
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Wed, 1 Jul 2020, Ondrej Jirman wrote:

> The driver was renamed, change the path in the MAINTAINERS file.
> 
> Signed-off-by: Ondrej Jirman <megous@megous.com>

This minor non-urgent cleanup patch has not been picked up yet by anyone.

Hence, ./scripts/get_maintainers.pl --self-test=patterns continues to 
complain:

  warning: no file matches  F:	Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.txt
  warning: no file matches  F:	drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c

This patch cleanly applies on next-20201008 and resolves the issue above.

Reviewed-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>


Lukas

> ---
>  MAINTAINERS | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5f186a661a9b..f5183eae08df 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5487,12 +5487,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
>  F:	drivers/gpu/drm/panel/panel-raydium-rm67191.c
>  
> -DRM DRIVER FOR ROCKTECH JH057N00900 PANELS
> +DRM DRIVER FOR SITRONIX ST7703 PANELS
>  M:	Guido Günther <agx@sigxcpu.org>
>  R:	Purism Kernel Team <kernel@puri.sm>
> +R:	Ondrej Jirman <megous@megous.com>
>  S:	Maintained
> -F:	Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.txt
> -F:	drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
> +F:	Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.yaml
> +F:	drivers/gpu/drm/panel/panel-sitronix-st7703.c
>  
>  DRM DRIVER FOR SAVAGE VIDEO CARDS
>  S:	Orphan / Obsolete
> -- 
> 2.27.0
> 
> 
--8323329-1811521063-1602217668=:15995
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--8323329-1811521063-1602217668=:15995--
