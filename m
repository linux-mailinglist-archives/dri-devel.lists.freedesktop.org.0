Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8253126C053
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 11:19:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B8D6E049;
	Wed, 16 Sep 2020 09:19:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755BD6E049
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 09:19:07 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c18so6084327wrm.9
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 02:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=NetssDfLMpPwZ1ag5RCqykVyQO38ofbrcIBQ7qHK6pY=;
 b=Ih8d12tnCiF6uwywXnhdLjx6PI2H06LVi+m03GEr/Fd5oZX3vRtgoINf4zGiJAx6En
 +lEqQy/dRUhekUTDbyU8OneJwf6mBEvC3CkUJ9949+GgQWa8WTsnEosxFyW4bOcBQCS2
 L8wlwN++fkiZjGTf3XXc61r+HXl/RTToPMm/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=NetssDfLMpPwZ1ag5RCqykVyQO38ofbrcIBQ7qHK6pY=;
 b=d9bKre/uBMQHpYVAdy3WasNQXSUxoqa0out31EzKzBJ326YaqODv/Om5uWbhYmhmWg
 vRb45/PlZ6nsksBRdnNHsSa+Ex8hODw2U52LIK/Jh/ggo3v77nCSRmYu7qPIcPrkxbnS
 ZNCgM5SnA5FQyUZECZC10LtaqyYKsDD4ogCk0ApeyCtJ1ABQIUK1OvNgZNPBtbhGzida
 w1cNP6/4R3Gqp+wEG8cRQ/NsLT1eb54hfOedYpWaqTqMn+Haim4iyBw/6zSkuAk1NgwD
 x6qaLhwV7ANvCXwL8f/EA2MAvGZv8HKcj6jWpHxwyZ2OJ5359CT+doEsE2+b0+9Puxtf
 DJgA==
X-Gm-Message-State: AOAM532sJOmYBes/tzdRRvKUwdjE/Dw16O2Na3P/apCsQuX6rUMGMwR1
 hjgyBfwCEM1ebXXLI9Sd0ITcsA==
X-Google-Smtp-Source: ABdhPJxQZxpUmYxi0pmhuEEug8N7pJYz8tL3t/YNJnSm6QP+Q5v8ZqUWUl++HQ2YBXkGzAVTeiMD6w==
X-Received: by 2002:adf:f80a:: with SMTP id s10mr27111493wrp.351.1600247946114; 
 Wed, 16 Sep 2020 02:19:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r14sm31759089wrn.56.2020.09.16.02.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 02:19:05 -0700 (PDT)
Date: Wed, 16 Sep 2020 11:19:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: make linux-aspeed list remarks consistent
Message-ID: <20200916091903.GZ438822@phenom.ffwll.local>
Mail-Followup-To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Joel Stanley <joel@jms.id.au>, David Airlie <airlied@linux.ie>,
 linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
 Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20200912183334.22683-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200912183334.22683-1-lukas.bulwahn@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: linux-aspeed@lists.ozlabs.org, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Joel Stanley <joel@jms.id.au>, Joe Perches <joe@perches.com>,
 Pia Eichinger <pia.eichinger@st.oth-regensburg.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Sep 12, 2020 at 08:33:34PM +0200, Lukas Bulwahn wrote:
> Commit f15a3ea80391 ("MAINTAINERS: Add ASPEED BMC GFX DRM driver entry")
> does not mention that linux-aspeed@lists.ozlabs.org is moderated for
> non-subscribers, but the other three entries for
> linux-aspeed@lists.ozlabs.org do.
> 
> By 'majority vote' among entries, let us assume it was just missed here and
> adjust it to be consistent with others.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on master and next-20200911
> 
> Joel, please ack.
> David, Daniel, please pick this minor non-urgent clean-up patch.

Pushed to drm-misc-next, thanks.
-Daniel

> This patch submission will also show me if linux-aspeed is moderated or
> not. I have not subscribed to linux-aspeed and if it shows up quickly in
> the archive, the list is probably not moderated; and if it takes longer,
> it is moderated, and hence, validating the patch.
> 
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 26af84f97353..f2561c3fc9db 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5448,7 +5448,7 @@ F:	drivers/gpu/drm/panel/panel-arm-versatile.c
>  
>  DRM DRIVER FOR ASPEED BMC GFX
>  M:	Joel Stanley <joel@jms.id.au>
> -L:	linux-aspeed@lists.ozlabs.org
> +L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
>  S:	Supported
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	Documentation/devicetree/bindings/gpu/aspeed-gfx.txt
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
