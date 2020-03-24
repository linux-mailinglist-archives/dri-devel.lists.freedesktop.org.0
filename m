Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 912C0191B44
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 21:45:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442706E54C;
	Tue, 24 Mar 2020 20:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1DE96E542
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 20:45:25 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id l20so21260wmi.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 13:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=IXTMQkJ5+rGIRXyFRn2dpDyKMm30Z0L9/Y4UKQodmuM=;
 b=XsbFwoILxMKcZdz37dHEuosq733I4y/GkVUwE3Ks/oGgxQIuhMcgJQ+j1AHHMx00qa
 iBGiBj1V0+Yb2+bP8VryBHadvf3LASdLt9ZlUGU16dLFqszLw4MX1jpy+BeXp85NfjJy
 H4L4vIc73H/yZQ3d6vVRr3Ch/zGJ+bCoUqIqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=IXTMQkJ5+rGIRXyFRn2dpDyKMm30Z0L9/Y4UKQodmuM=;
 b=E5dWloM73jChhVKGoUHDnkXV5kpIGLO62cyVIZbN6n7LebyBvG3albJabPjwkyecQX
 f7BIWyIkaRhf4iC9c+sM1RY76SBLDd0Gs0AOriNdt38HAz2wIeO2bnvg2Mug9gJKJGP1
 DopVKetyGvOnpJZOvvKVlbl0bLAfMjSoH1F+f9lfDYSBsfaYEzDvLtPptcpF/ooghKq+
 jG0tphGADoN1YoX4Kuy0y8Di5pJevxPUJvKSmfOVkTXo83Qyq9CpNSZCG/tkaixge5Rp
 qwrO3G02VFwg06FEkW4zC9N+xMAyDUFomMlhjxSJdB9+H7NhvLoHmgwjbs72zjhoQJ8f
 tVkA==
X-Gm-Message-State: ANhLgQ2aJL76wHaeAnYQmrMDvK5S2SUbmjx7bBJFoaTlL0IgXtcuxLnk
 fwbQc/goexwnyULg53rIM3z4Hy3uiAggo8N2
X-Google-Smtp-Source: ADFU+vszfqEuuH6nexMj7L+36UtUSlCzZQx/S5+rMyLLsVooforcJdZKmTiZefaW7LZ9e0eRD4QV/Q==
X-Received: by 2002:a05:600c:2051:: with SMTP id
 p17mr7516494wmg.153.1585082724489; 
 Tue, 24 Mar 2020 13:45:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z188sm5992134wme.46.2020.03.24.13.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 13:45:23 -0700 (PDT)
Date: Tue, 24 Mar 2020 21:45:21 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v2 1/6] video: fbdev: controlfb: fix sparse warning about
 using incorrect type
Message-ID: <20200324204521.GL2363188@phenom.ffwll.local>
Mail-Followup-To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20200324134508.25120-1-b.zolnierkie@samsung.com>
 <CGME20200324134518eucas1p16e1a39c14dfd101f5a6d86218a9e19af@eucas1p1.samsung.com>
 <20200324134508.25120-2-b.zolnierkie@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200324134508.25120-2-b.zolnierkie@samsung.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Andrzej Hajda <a.hajda@samsung.com>, linux-fbdev@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 24, 2020 at 02:45:03PM +0100, Bartlomiej Zolnierkiewicz wrote:
> Use in_le32() instead of le32_to_cpup() to fix sparse warning about
> improper type of the argument.
> 
> Also add missing inline keyword to control_par_to_var() definition
> (to match function prototype).
> 
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> ---
>  drivers/video/fbdev/controlfb.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/controlfb.c b/drivers/video/fbdev/controlfb.c
> index 38b61cdb5ca4..9625792f4413 100644
> --- a/drivers/video/fbdev/controlfb.c
> +++ b/drivers/video/fbdev/controlfb.c
> @@ -313,7 +313,7 @@ static int controlfb_blank(int blank_mode, struct fb_info *info)
>  		container_of(info, struct fb_info_control, info);
>  	unsigned ctrl;
>  
> -	ctrl = le32_to_cpup(CNTRL_REG(p,ctrl));
> +	ctrl = in_le32(CNTRL_REG(p, ctrl));
>  	if (blank_mode > 0)
>  		switch (blank_mode) {
>  		case FB_BLANK_VSYNC_SUSPEND:
> @@ -952,7 +952,8 @@ static int control_var_to_par(struct fb_var_screeninfo *var,
>   * Convert hardware data in par to an fb_var_screeninfo
>   */
>  
> -static void control_par_to_var(struct fb_par_control *par, struct fb_var_screeninfo *var)
> +static inline void control_par_to_var(struct fb_par_control *par,

Just quick drive-by bikeshed, feel free to ignore: static inline within a
.c file imo doesn't make sense anymore, compilers are smart enough
nowadays. I'd just drop this.
-Daniel

> +	struct fb_var_screeninfo *var)
>  {
>  	struct control_regints *rv;
>  	
> -- 
> 2.24.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
