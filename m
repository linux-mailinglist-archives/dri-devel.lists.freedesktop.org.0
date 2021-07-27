Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7A23D7263
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 11:54:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AAAC6E881;
	Tue, 27 Jul 2021 09:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC0B6E881
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 09:54:17 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 o5-20020a1c4d050000b02901fc3a62af78so1408974wmh.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 02:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=beCJH86xLgh+PWnNDTz2W15pZAK6+7n66A1y132I0nI=;
 b=f7AFRSWhC09PBHv+qyLOMMDLZJ13+hH2by60JWMPPbV4z75ecfV1M6W1xDNrqmryQ1
 LjwmGYl9ZsrNuM5gb+ejAkOGbLCjv7NL2n4A7ecfBHkMu0P7unNSSQWnZUU3gL+7OKMP
 aNdN3zGa/6KNJYnA5+0uBll9QAHvb9wviXzcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=beCJH86xLgh+PWnNDTz2W15pZAK6+7n66A1y132I0nI=;
 b=hsAgtfQuwsf+ur7jTwd68CYKnSHo0Qyqq3IjRc6z37hmA0EJEdCg+op9suGqJz1su0
 fALcKxBBesc4YzrdPdJD+LeDjMcXkY+22Rj/eP6JD0puJRzuhO5ZM37/L4EpoNvsCbA9
 5mEjYz6zmnEHlnkq7Hh8D13xTONbK55za04+xx4sIJR/0oUEd6hQLozAb+WHVMwCANph
 zBLN8Aj4/i0PrBBBurX6u7tbDyDsU3O/qZY0BDvksaziPJMKmWdqq5UOYizqLkgglpsz
 VFgskTwNki47ac/n0S4mvnm7rw+M6rE+0WObA9Fnc+QA5aVMc51AsBXYDLNbkq++pfV2
 eZ4w==
X-Gm-Message-State: AOAM532A3HgtPPbPqktDJHLuBbdiojMqf/9H0mF6dsUnIi/e50H44P2f
 wS5REZulnTVAdQvaY28sjnAVVg==
X-Google-Smtp-Source: ABdhPJzEnmDDN+fwKw7zeJfkVh9bazThBixQhbCRCRYnNIf9WLciebF4U1y3nRTy0MnKsR1OZ/a2kA==
X-Received: by 2002:a7b:ce8b:: with SMTP id q11mr20626894wmj.80.1627379656560; 
 Tue, 27 Jul 2021 02:54:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r18sm2664196wrt.96.2021.07.27.02.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 02:54:16 -0700 (PDT)
Date: Tue, 27 Jul 2021 11:54:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] efi: sysfb_efi: fix build when EFI is not set
Message-ID: <YP/XxqHz83qBU4Sv@phenom.ffwll.local>
Mail-Followup-To: Thomas Zimmermann <tzimmermann@suse.de>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 linux-efi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>
References: <20210727050447.7339-1-rdunlap@infradead.org>
 <aefba212-1e08-9994-6d6e-6db292bf9db6@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aefba212-1e08-9994-6d6e-6db292bf9db6@suse.de>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: linux-efi@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>, Mark Brown <broonie@kernel.org>,
 linux-next@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 27, 2021 at 11:15:36AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 27.07.21 um 07:04 schrieb Randy Dunlap:
> > When # CONFIG_EFI is not set, there are 2 definitions of
> > sysfb_apply_efi_quirks(). The stub from sysfb.h should be used
> > and the __init function from sysfb_efi.c should not be used.
> > 
> > ../drivers/firmware/efi/sysfb_efi.c:337:13: error: redefinition of ‘sysfb_apply_efi_quirks’
> >   __init void sysfb_apply_efi_quirks(struct platform_device *pd)
> >               ^~~~~~~~~~~~~~~~~~~~~~
> > In file included from ../drivers/firmware/efi/sysfb_efi.c:26:0:
> > ../include/linux/sysfb.h:65:20: note: previous definition of ‘sysfb_apply_efi_quirks’ was here
> >   static inline void sysfb_apply_efi_quirks(struct platform_device *pd)
> >                      ^~~~~~~~~~~~~~~~~~~~~~
> > 
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Cc: Ard Biesheuvel <ardb@kernel.org>
> > Cc: linux-efi@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: Javier Martinez Canillas <javierm@redhat.com>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Mark Brown <broonie@kernel.org>
> > Cc: linux-next@vger.kernel.org
> 
> Thanks for the patch. It should have a fixes line
> 
> > dim fixes 8633ef82f101c040427b57d4df7b706261420b94
> 
> Fixes: 8633ef82f101 ("drivers/firmware: consolidate EFI framebuffer setup
> for all arches")

Added this and pushed to drm-next (because atm drm-next isn't in
linux-next because of this).

drm-next also has -rc3 backmerge for the nouveau fix, so I think a good
time to backmerge the entire pile into drm-misc-next?
-Daniel

> 
> 
> ... and maybe a few more of the CCs below
> 
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> 
> Cc: Borislav Petkov <bp@suse.de>
> 
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Cc: Ard Biesheuvel <ardb@kernel.org>
> 
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> 
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> 
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> 
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> Cc: John Stultz <john.stultz@linaro.org>
> 
> Cc: Colin Ian King <colin.king@canonical.com>
> 
> Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>
> 
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> 
> Cc: Maxime Ripard <maxime@cerno.tech>
> 
> Cc: linux-efi@vger.kernel.org
> 
> Cc: linux-riscv@lists.infradead.org
> 
> 
> Best regards
> Thomas
> 
> > ---
> >   drivers/firmware/efi/sysfb_efi.c |    2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > --- linext-20210726.orig/drivers/firmware/efi/sysfb_efi.c
> > +++ linext-20210726/drivers/firmware/efi/sysfb_efi.c
> > @@ -332,6 +332,7 @@ static const struct fwnode_operations ef
> >   	.add_links = efifb_add_links,
> >   };
> > +#ifdef CONFIG_EFI
> >   static struct fwnode_handle efifb_fwnode;
> >   __init void sysfb_apply_efi_quirks(struct platform_device *pd)
> > @@ -354,3 +355,4 @@ __init void sysfb_apply_efi_quirks(struc
> >   		pd->dev.fwnode = &efifb_fwnode;
> >   	}
> >   }
> > +#endif
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Felix Imendörffer
> 




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
