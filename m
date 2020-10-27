Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA7229C7C8
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 19:51:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9760F6EC16;
	Tue, 27 Oct 2020 18:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDA16EC16
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 18:51:02 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j7so3069668wrt.9
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 11:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=xZvOPp8kVilTXiarx7tF8Az0EBe1RW6Y/QV8MotyV8s=;
 b=E+QQVJ6LfsGiPw+sjgvs9YvBaCMf1GKIz7ybqinbvbTMr1KW7mqY4QeBxNzuBdpThA
 5nblxw4cSCvxn53HUmGzrWW56wSRcZpEwRo8h3Il6vyoNnQIHYZG/9MPA2jqo8IOuzOL
 8MTCtvJdUGydgE1zIBJMJEYdbTnFiHIdKO51I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=xZvOPp8kVilTXiarx7tF8Az0EBe1RW6Y/QV8MotyV8s=;
 b=Bo2hVoyp62sF2WOg8d7eeLoOZg0RbylVijqRRlX3PwvYnpa5TVzM2RNKrnHhIWDL4S
 HFWqKaTjFNtz72r2CAkUfDeOzq0LPM15/B3xZQR+UDhLO0WXftQe6nncovK0fVgggOjy
 FN4z3X8Fdeo24f/tNXK5qGu/jaDxN5FEbsT6hvo+dpfZOx0gXFJDRP+a7RoFoxR6WTle
 WGr4eUr5j5o1zU7VOxkhQ6BmzR/LKH9dhcA9E3SAOKx0GgDi5QFtcAD1UTvCuZcePW54
 BYHM4WnDicgK47a1IBA9Rv1St5LdTUw5Y5heOu9ED1V1fYk0VWxfZWbfUcYyS28pxsSk
 UuEw==
X-Gm-Message-State: AOAM533fbTQEbh50aeinKoTRcddkkm8u/XAkl7UvK3Yr8fPj6IFDPt/6
 Ok3j8r9Mt9SSgQaLsJHdxYVEFg==
X-Google-Smtp-Source: ABdhPJynFNg4Z7kz02rR4kjthPaTiI0vcEd436zZEQWyrQ9iXhwvzQ88EYNHIKOIDvTpL9kSzGn5Jg==
X-Received: by 2002:adf:e446:: with SMTP id t6mr4255615wrm.46.1603824661583;
 Tue, 27 Oct 2020 11:51:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 24sm2884131wmg.8.2020.10.27.11.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 11:51:00 -0700 (PDT)
Date: Tue, 27 Oct 2020 19:50:58 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [PATCH 2/5] Fonts: Make font size unsigned in font_desc
Message-ID: <20201027185058.GM401619@phenom.ffwll.local>
Mail-Followup-To: Peilin Ye <yepeilin.cs@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jiri Slaby <jirislaby@kernel.org>, linux-parisc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1603788511.git.yepeilin.cs@gmail.com>
 <cb5bb49a33ff54fef41e719ee9d301a6a73c5f9c.1603788512.git.yepeilin.cs@gmail.com>
 <54f7d42e07eca2a2f13669575a9de88023ebc1ac.1603788512.git.yepeilin.cs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <54f7d42e07eca2a2f13669575a9de88023ebc1ac.1603788512.git.yepeilin.cs@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-parisc@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 27, 2020 at 12:33:05PM -0400, Peilin Ye wrote:
> It is improper to define `width` and `height` as signed in `struct
> font_desc`. Make them unsigned. Also, change the corresponding printk()
> format identifiers from `%d` to `%u`, in sti_select_fbfont().
> 
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>

I'm not entirely sure of the motivation here ... height/width should never
ever be even close to the limit here. Or have you seen integer math that
could potentially go wrong if we go with unsigned instead of int?
-Daniel

> ---
> Build-tested.
> 
>  drivers/video/console/sticore.c | 2 +-
>  include/linux/font.h            | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/console/sticore.c b/drivers/video/console/sticore.c
> index 6a26a364f9bd..d1bb5915082b 100644
> --- a/drivers/video/console/sticore.c
> +++ b/drivers/video/console/sticore.c
> @@ -502,7 +502,7 @@ sti_select_fbfont(struct sti_cooked_rom *cooked_rom, const char *fbfont_name)
>  	if (!fbfont)
>  		return NULL;
>  
> -	pr_info("STI selected %dx%d framebuffer font %s for sticon\n",
> +	pr_info("STI selected %ux%u framebuffer font %s for sticon\n",
>  			fbfont->width, fbfont->height, fbfont->name);
>  			
>  	bpc = ((fbfont->width+7)/8) * fbfont->height; 
> diff --git a/include/linux/font.h b/include/linux/font.h
> index b5b312c19e46..4f50d736ea72 100644
> --- a/include/linux/font.h
> +++ b/include/linux/font.h
> @@ -16,7 +16,7 @@
>  struct font_desc {
>      int idx;
>      const char *name;
> -    int width, height;
> +    unsigned int width, height;
>      const void *data;
>      int pref;
>  };
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
