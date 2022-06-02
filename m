Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7398A53B783
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 12:50:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD2DE10E2B6;
	Thu,  2 Jun 2022 10:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3650010E2B6
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 10:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654167042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DrhV5vnxv6SRuKZJ5gBXpRv/4ZhVI+1PkR2Fak5zt3E=;
 b=a5QsIyZo1RFq6OzvkqkD4zvl3GNi9UAohGqNHkNSrKOAQ4B7sHsbwAV4PY5JfXdarxIq3O
 x8lt7zKQaPGkFuGSX9Zl/Wsvowy63JmoBry2GjVXH/cC1S+T8Z3PFbadHEmEIJGZxvENpA
 SnBB/z2+aTHQK4pNRu7a5KyjYhTTypQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-G9h19cCaMp2V94LR8-CESA-1; Thu, 02 Jun 2022 06:50:41 -0400
X-MC-Unique: G9h19cCaMp2V94LR8-CESA-1
Received: by mail-ed1-f70.google.com with SMTP id
 f9-20020a056402354900b0042ded146259so3207501edd.20
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 03:50:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DrhV5vnxv6SRuKZJ5gBXpRv/4ZhVI+1PkR2Fak5zt3E=;
 b=pY/rCcLTpBOEVOY1GVaRaFG0pttcAmFq8+wfBPOS4AZy0RZsTYTvvxjGHByO8n+hr8
 uQiACsaJbdwJr1Z4Z4mQLZradERSzyG+GtrK/EwKRbF6bhxcFm/5NGBPUpqrcR1fGOLJ
 eNm/HHQRprl7Is2C4yqbzgyfvrd+aBq4P3hYMQIg8tgmFiR4Gt2i8Eq/Ya+S079Mk12b
 kctbUwBPwox0SWyMKM0Pp36FeUqfN/LUfUGzCzodMYVGk07/X3vJfj+W2H/3J2iZffxA
 vGuyI7X/fXkSVluxLXEENWx1K+vcjdXy5yotV48YGg/diCidKoLCB2mRTB0SP3nxzMC1
 GUjw==
X-Gm-Message-State: AOAM531Tu1qCc8rZavgUXpPRnAsJBPhJ2UmYOufQFKfzLlcF/B7NmhwZ
 QNdv86QyxeLwHp7e8g12kOMwujfroyuGsOElYMTQJ39a3cdxdUYI5/Hc2bbQWVlcvVcNd5u3pAs
 0fa73pmIVJVYAfw/iTzhNN675DBlN
X-Received: by 2002:aa7:c852:0:b0:42d:70d8:2864 with SMTP id
 g18-20020aa7c852000000b0042d70d82864mr4622039edt.379.1654167038351; 
 Thu, 02 Jun 2022 03:50:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxagkCoICyD4tyHlyBtfQJTn2p3Yp2BOSbtulSpElsl0xzECJsO+qskjhWefExGoeHv99aQBQ==
X-Received: by 2002:aa7:c852:0:b0:42d:70d8:2864 with SMTP id
 g18-20020aa7c852000000b0042d70d82864mr4622024edt.379.1654167038205; 
 Thu, 02 Jun 2022 03:50:38 -0700 (PDT)
Received: from [192.168.42.54] ([109.38.144.46])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a170906374100b006f3ef214da8sm1651719ejc.14.2022.06.02.03.50.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 03:50:37 -0700 (PDT)
Message-ID: <84aa3225-d514-4c08-f6d3-ed8f0423e513@redhat.com>
Date: Thu, 2 Jun 2022 12:50:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] fbdev: simplefb: Check before clk_put() not needed
To: Yihao Han <hanyihao@vivo.com>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20220602094219.13024-1-hanyihao@vivo.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220602094219.13024-1-hanyihao@vivo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 6/2/22 11:42, Yihao Han wrote:
> clk_put() already checks the clk ptr using !clk and IS_ERR()
> so there is no need to check it again before calling it.
> 
> Signed-off-by: Yihao Han <hanyihao@vivo.com>
> ---
>  drivers/video/fbdev/simplefb.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
> index 2c198561c338..f96ce8801be4 100644
> --- a/drivers/video/fbdev/simplefb.c
> +++ b/drivers/video/fbdev/simplefb.c
> @@ -237,8 +237,7 @@ static int simplefb_clocks_get(struct simplefb_par *par,
>  		if (IS_ERR(clock)) {
>  			if (PTR_ERR(clock) == -EPROBE_DEFER) {
>  				while (--i >= 0) {
> -					if (par->clks[i])
> -						clk_put(par->clks[i]);
> +					clk_put(par->clks[i]);
>  				}
>  				kfree(par->clks);
>  				return -EPROBE_DEFER;

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

