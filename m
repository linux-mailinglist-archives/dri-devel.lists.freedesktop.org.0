Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EEA22D98E
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jul 2020 21:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B8E16E2E3;
	Sat, 25 Jul 2020 19:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93EBE6E2E3
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jul 2020 19:19:59 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id f5so13227964ljj.10
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jul 2020 12:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g4J6dkRqHFKiKhjcRC8q/JmeC/kbD2LNmS8StOCmtOU=;
 b=mvXHuh6jpM3ry5QoR34JW1d8FG1E/6i19D+6eHevdB/BJD97IyC8wD2xC+bM8l5Ujc
 48KF5bxobuUlIlCULXPavhfxF3h1KYr8QgsIyILVedJSXIv54uInP6GcUT1iXSG+ayYu
 EUD7recqFSD++W9kn404rRgoXuFpxT5nBnjmX6YS6TX57Bn99MxgL9v8Ty2mxycVSlz9
 lFPJy/ecKwv3YkQic14JYKpV3fDDMlwGCrzbXwY0ocmBn8/Wkw7sQcmAuR6xMs5JLrnE
 TvooKIp0/sJ+Z9iwMaWOvHuMMjRAhrsvnR6k1debndHhInU3NvFu9JxZ3LxaPSPWVaS3
 e1Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g4J6dkRqHFKiKhjcRC8q/JmeC/kbD2LNmS8StOCmtOU=;
 b=QzF+1HS8gzIKSdrA77HpUhu48xZzPqQxaaGM0U41hnDvK39blkU7eJPssIPGj5346k
 5oF/c2YlUT2BmS0f9msCZ3Bc+bHNOXMQ6yPG/QzlZiuP1iHpN+LQ9TUGTv2z+Zm2kRUH
 sgDRAbVktt5uL5dyzMuQvnGtsK4fe5gegAzIqWg6Ziwqp0EbxoHMMfqecXyPhWvXkuyP
 6JdDw7xjd42hUPgDXCjlofRRxqk8IeAAEEcuoaV5TqRzl11h0KW2icIiAGRhznYnHBWh
 Fu9jNEfZJPe4LIQcsA1vG8NW7hBnWoelQTX6XT2TLXFWMFuT93phWM9OhX15TBoLrE+g
 3ehw==
X-Gm-Message-State: AOAM533OdKijgaTL0mFBI1tK7sHND+7DxDq3qKJU2jvQOgUMKtezcjkS
 61jRc1EdfFHr777sfOM26Nro25YY6sl8Asc67wA=
X-Google-Smtp-Source: ABdhPJwX2YWaS3FX13+Q0LtCtGPNZAsAPnsJBOyVicKVnyzv1PltkImBXj4c5goex61U5pVCv5ilQrP7FYqxDuxoALY=
X-Received: by 2002:a2e:9d0b:: with SMTP id t11mr589477lji.365.1595704797729; 
 Sat, 25 Jul 2020 12:19:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200722110411.ebkv6knvc6mzw5uf@smtp.gmail.com>
 <20200722120502.GK6419@phenom.ffwll.local>
 <20200722140604.27dfzfnzug5vb75r@smtp.gmail.com>
 <CAKMK7uHWCnJ+3YnP2FwVGH6cEDkmPnH9ALjY_1R51QVs0HPG0Q@mail.gmail.com>
 <20200725011737.GA2851@realwakka>
 <CAKMK7uEWPCzx+K=+nJsLT5HRBVJ+s8tqx30Ljkr4BCBDComyWQ@mail.gmail.com>
 <20200725174514.esh4gqek6oddizvh@smtp.gmail.com>
 <CAKMK7uEi0UFSwYTO7h6_YKN+UykOuVcmhMSG_ySy9uyo_7Pz-g@mail.gmail.com>
 <20200725184918.togb54bxuifrq77c@smtp.gmail.com>
In-Reply-To: <20200725184918.togb54bxuifrq77c@smtp.gmail.com>
From: Melissa Wen <melissa.srw@gmail.com>
Date: Sat, 25 Jul 2020 16:19:46 -0300
Message-ID: <CAJeY4oEr1mDASzdjfyeXqfqUmM6n1ULgnedM7dif6db6Qk-r2g@mail.gmail.com>
Subject: Re: [PATCH] drm/vkms: add missing drm_crtc_vblank_put to the get/put
 pair on flush
To: Daniel Vetter <daniel@ffwll.ch>
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
 David Airlie <airlied@linux.ie>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, kernel-usp@googlegroups.com,
 Sidong Yang <realwakka@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> No, this very first warning continues (only once) :(
> From here (drm_crtc_vblank_on):
>         if (atomic_read(&vblank->refcount) != 0 || drm_vblank_offdelay == 0)
>                 drm_WARN_ON(dev, drm_vblank_enable(dev, pipe));

Sorry, not sure when this warning is triggered.

>
> > But I'm still wondering why after step 3 we don't get -EINVAL from
> > vblank_get() - after vblank_off() vblank->enabled should be false
> > again, getting us back to the same state as after 1. Is that not
> > happening?
>
> Yes (sorry if it got confused), we got -EINVAL after setp 3:
>
> In step 3, at the end of the 2nd running, we have:
> atomic_disable
> --> vblank_off [!vblank->inmodeset + refcount going 0->1 + inmodeset=1]
> and then in next vblank_get: -EINVAL (!vblank->enabled + refcount ends 1)
> as in the first step.
>
> Melissa
>
> > -Daniel
> >
> > >
> > > > >
> > > > > Thanks
> > > > > -Sidong
> > > > >
> > > > > > > >
> > > > > > > > >             crtc->state->event = NULL;
> > > > > > > > >     }
> > > > > > > > >
> > > > > > > > > --
> > > > > > > > > 2.27.0
> > > > > > > > >
> > > > > > > >
> > > > > > > > --
> > > > > > > > Daniel Vetter
> > > > > > > > Software Engineer, Intel Corporation
> > > > > > > > http://blog.ffwll.ch
> > > > > >
> > > > > >
> > > > > >
> > > > > > --
> > > > > > Daniel Vetter
> > > > > > Software Engineer, Intel Corporation
> > > > > > http://blog.ffwll.ch
> > > > > > _______________________________________________
> > > > > > dri-devel mailing list
> > > > > > dri-devel@lists.freedesktop.org
> > > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > >
> > > >
> > > >
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
