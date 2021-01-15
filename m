Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6381C2F86F9
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 21:58:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904AE6E47A;
	Fri, 15 Jan 2021 20:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D5566E47A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 20:58:46 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id d13so10563274wrc.13
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 12:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JNPQQq0esyAUv0SaJP9M+5H+0D0Ooff203N1KcpXtkI=;
 b=bjN1pCMQoob0hn1vxVNxALaWBggxOr0JAwGKdyH4dFjGsCcgrrK67crS2mMfYlL4R4
 Z3uHdnlcFVoiBpQom4yFMSCP7L+UPAsy2QS+pyl/BUjm+PT89w8JRFtGjNC127fwC/1F
 Pl9hGF3H/dzAsSAn+BSplb2+LKZ+JjIUCTYi7KrhnjElKScVeSOnpzX9xSn8TEw4eZRE
 n6EObZ+TIPvIr8aYbNRZuj3J01f47zRfn2wGL0uU8d/7VenVI7xG1GAQ8XVAg/a98aZj
 DXprMuplm5mNOn/u3HhgeuNA9YNUBGxWfS3cCllex8x+0w7uGhz6vh/XKSPOdHLkerX5
 7Qqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JNPQQq0esyAUv0SaJP9M+5H+0D0Ooff203N1KcpXtkI=;
 b=jK58+9YYB1xFw4XLTG2mp+Ubs2KI3Cd+Yp1M+RpNSozN2z5Z+0iTq2tGo7mf405vgp
 vSrUga9aHpBBHmiYVIIB+G2jHc1/qqjANbg2ZnLu9/XZrbeQlDzhtcfWE5FUb0olvsi2
 4yOC9PwL2b6vFMwWcddy3oG386nVe9VOFsIxlM5n4h3o+bp5dY9m9M3qgYhZDnr4DkSf
 o76JpmidVv9A0+/ZpPLbCy7S1gl+JlvufdektciGLclN/RxQeIiFkE3qp4aXq2BAX3FH
 MFs/RLHZdNfwLVhh2SjmFJO+R3U1IoT3X87FPV3soV32VV1Ya+SLUYUN8uVY8xXVnVR8
 jqSA==
X-Gm-Message-State: AOAM532s0isP/3/IT6yNZCI4/s7rYeJHG4l6GNhJGNjGynkkipe2aABg
 7ydTKw751h26+fD6ErDlozM=
X-Google-Smtp-Source: ABdhPJxBjBNQ3eVsS6Me/YyVKPaoeFY86umXQH74NxE82tUEBDOT0B3bzYaEh4RJgUVktwEZLs4QyQ==
X-Received: by 2002:a5d:4e51:: with SMTP id r17mr15130734wrt.94.1610744325301; 
 Fri, 15 Jan 2021 12:58:45 -0800 (PST)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id h14sm16016927wrx.37.2021.01.15.12.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 12:58:44 -0800 (PST)
Date: Fri, 15 Jan 2021 17:58:38 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Sumera Priyadarsini <sylphrenadin@gmail.com>
Subject: Re: [PATCH][next] drm/vkms: Fix missing kmalloc allocation failure
 check
Message-ID: <20210115205838.7hff6mmyyl55pgek@smtp.gmail.com>
References: <20210115130911.71073-1-colin.king@canonical.com>
 <CACAkLuqG+4cq9w9=JEjB-5KPcxu==2+Sen6GMknM495vELgEFA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACAkLuqG+4cq9w9=JEjB-5KPcxu==2+Sen6GMknM495vELgEFA@mail.gmail.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Colin King <colin.king@canonical.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/15, Sumera Priyadarsini wrote:
> On Fri, Jan 15, 2021 at 6:39 PM Colin King <colin.king@canonical.com> wrote:
> >
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > Currently the kmalloc allocation for config is not being null
> > checked and could potentially lead to a null pointer dereference.
> > Fix this by adding the missing null check.
> >
> > Addresses-Coverity: ("Dereference null return value")
> > Fixes: 2df7af93fdad ("drm/vkms: Add vkms_config type")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Good catch, thank you!
> 
> Reviewed-by: Sumera Priyadarsini <sylphrenadin@gmail.com>

Applied to drm-misc-next.

Thanks,
Melissa Wen
> > ---
> >  drivers/gpu/drm/vkms/vkms_drv.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> > index 708f7f54001d..2173b82606f6 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > @@ -188,7 +188,11 @@ static int vkms_create(struct vkms_config *config)
> >
> >  static int __init vkms_init(void)
> >  {
> > -       struct vkms_config *config = kmalloc(sizeof(*config), GFP_KERNEL);
> > +       struct vkms_config *config;
> > +
> > +       config = kmalloc(sizeof(*config), GFP_KERNEL);
> > +       if (!config)
> > +               return -ENOMEM;
> >
> >         default_config = config;
> >
> > --
> > 2.29.2
> >
> regards,
> Sumera
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
