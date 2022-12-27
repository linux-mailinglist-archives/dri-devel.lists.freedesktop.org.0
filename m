Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A57656DDE
	for <lists+dri-devel@lfdr.de>; Tue, 27 Dec 2022 19:10:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFDD010E327;
	Tue, 27 Dec 2022 18:10:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com
 (mailrelay6-1.pub.mailoutpod2-cph3.one.com [46.30.211.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3364110E327
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 18:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=KI9iD44piwOpBV52n8OpH29GyNQO91VabKgAppUD7IY=;
 b=P2s64QcldiviamGQN7U8GXah8wChnjisqppwmj8RrqIOtzHP/dfWXgKw1HslrQDg6CZx89B31RYdQ
 6ZrafWmgxlhNz8srHyw6SNkqnmLchpoMIRelJhvDRpgiuZ20K7ZEt7argYzTBp7qpx50Io8eXbKK3e
 Mxik95eUC0vUs5H41dyjP0KnrZKcBs8kyGGhRg5niDOa/1aPha/rRHSo4nsWpIUoPFa5ZoK+gdR5Fx
 ntG/svgXmcI/HK3288PRdR79W3e2Nz0vqp1vDvyLB1WZeNEOPPK0xYBhYSTjFKMjNig6+qkMHyFG6K
 xLju5i9gv7o4hGUlBY0q+DA93yOjIBQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=KI9iD44piwOpBV52n8OpH29GyNQO91VabKgAppUD7IY=;
 b=ctTAO7FNvLNqUCI6AWLVNzjzEuGtizrNhJkVLAhKgy/nY09ZZ6EtrGIRXt1rkLN8cVbSpNI/eJ/gf
 FhpCvufCw==
X-HalOne-ID: 84f55dba-8611-11ed-a921-cde5ad41a1dd
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay6 (Halon) with ESMTPSA
 id 84f55dba-8611-11ed-a921-cde5ad41a1dd;
 Tue, 27 Dec 2022 18:08:54 +0000 (UTC)
Date: Tue, 27 Dec 2022 19:08:53 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3 3/4] MAINTAINERS: Add entry for Himax HX8394 panel
 controller driver
Message-ID: <Y6s0tWEvqDqR4c54@ravnborg.org>
References: <20221227110335.2923359-1-javierm@redhat.com>
 <20221227110335.2923359-4-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221227110335.2923359-4-javierm@redhat.com>
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
Cc: Robert Mader <robert.mader@posteo.de>,
 Onuralp Sezer <thunderbirdtr@fedoraproject.org>,
 Neal Gompa <ngompa13@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
 Martijn Braam <martijn@brixit.nl>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Ondrej Jirman <megi@xff.cz>, Peter Robinson <pbrobinson@gmail.com>,
 Kamil =?utf-8?Q?Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 27, 2022 at 12:03:34PM +0100, Javier Martinez Canillas wrote:
> Add myself as maintainer for the driver and devicetree bindings schema.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> 
> (no changes since v1)
> 
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2e832cf29bec..175d72203fb6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6480,6 +6480,13 @@ S:	Maintained
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	drivers/gpu/drm/tiny/gm12u320.c
>  
> +DRM DRIVER FOR HIMAX HX8394 MIPI-DSI LCD panels
> +M:	Javier Martinez Canillas <javierm@redhat.com>
> +S:	Maintained
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
> +F:	drivers/gpu/drm/panel/panel-himax-hx8394.c
> +
>  DRM DRIVER FOR HX8357D PANELS
>  M:	Emma Anholt <emma@anholt.net>
>  S:	Maintained
> -- 
> 2.38.1
