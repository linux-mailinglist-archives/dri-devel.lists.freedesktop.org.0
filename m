Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FA92AD817
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 14:55:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BD6893A7;
	Tue, 10 Nov 2020 13:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9E0893A7
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 13:55:14 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id w4so10194785pgg.13
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 05:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tuDMy+iN/NZ/U/XMn7m7h6ztvG8bpQuonUkFjpduYg0=;
 b=fk7RE+5W4RtH2sfW6GeeGC+y9ug+te2P5xp7Rr544DQQQ6Mhd1qHY/aiGRbieXrFfQ
 m0/Y0PWifOgTfmdIUFdQRg0lwg4zP94tJDS7108rRZTFfWecofHxI2Zj7ei8iYiGf9Ys
 bTgmxZjOyzFiTGf2mN3bylUXs6d7BVgs2iHSaejw4PNAbjVss1mfQlOdN3yLqISPSW/6
 G4gNUcea4RgUBuT7fsk59DwBdyAUWkcUmKkmA4fjLgdGEc/3a6PYdyERmcPF2a9m2gp2
 toNlPWXx4pikIumD3cK/ZmW07kGCWoeOgTvAf6Z0iYRY/qTwY2P308K46QfhUB7CkZvE
 qxaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tuDMy+iN/NZ/U/XMn7m7h6ztvG8bpQuonUkFjpduYg0=;
 b=kyUqFPU4ZRESxxf8PG01kL+uEEG9j3TpqDXYCeJ2LoWR8fIIatFN6UsSVDKJsPbZ67
 Tmxzjm0PY3igbZaGGEmOeV4SxrxJke1agdM01YMCUVu5G5/Vagr5KHc38dit20boXERl
 EbKaYBwhDjswoUdZlQsLn+lwu4uyZ3bDLjqn4Hmuv49lwPWe4uTYZz0cMoh3dtzmCZxN
 FA1AnXXnHULasU8rfm6aBYe400iKoVvRu3kPSls9E5O+RvOR4TifKhT+9P+j//nYByCU
 TDUrkbQk0MmrlwU2jg2LbFrda7iYJSWBxyIcoqcAtP36ta2viPy12ZZl6TFZdahH947B
 f+TA==
X-Gm-Message-State: AOAM531cWC9cqmof0Dpd9b04XXZZOVq7LoiMYleqGzLKaktWaGL45CrW
 lqWe4IBHx/qqPAmJZ40/Nw==
X-Google-Smtp-Source: ABdhPJxpknnDPzLcIlfsAZoWTOzvr0K2yQz18ucWIcJsbGk6GKdy/ZWv6XiDw/O3mgX9wBTKkZMaDA==
X-Received: by 2002:a63:3346:: with SMTP id z67mr17193856pgz.111.1605016514261; 
 Tue, 10 Nov 2020 05:55:14 -0800 (PST)
Received: from PWN (59-125-13-244.HINET-IP.hinet.net. [59.125.13.244])
 by smtp.gmail.com with ESMTPSA id j11sm14221319pfe.80.2020.11.10.05.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 05:55:13 -0800 (PST)
Date: Tue, 10 Nov 2020 08:55:00 -0500
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/2] console: Remove dummy con_font_op() callback
 implementations
Message-ID: <20201110135500.GA2484495@PWN>
References: <c5563eeea36aae7bd72ea2e985bc610d585ece40.1604128639.git.yepeilin.cs@gmail.com>
 <20201106105058.GA2801856@kroah.com>
 <20201110124946.GF401619@phenom.ffwll.local>
 <20201110132445.GA2483842@PWN>
 <CAKMK7uFiCTu9bz1uJqmCvwBSUK4XmuVyRf2C-U=zoArZMb0Pgg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFiCTu9bz1uJqmCvwBSUK4XmuVyRf2C-U=zoArZMb0Pgg@mail.gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 USB list <linux-usb@vger.kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 George Kennedy <george.kennedy@oracle.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 10, 2020 at 02:46:20PM +0100, Daniel Vetter wrote:
> On Tue, Nov 10, 2020 at 2:24 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> > Oh, are we doing an -rc3 backmerge soon? At the moment I can base these
> > patches on neither drm-misc (due to the font_copy removal), nor mainline
> > (due to the signedness issue in font_desc we've talked about), so I'm
> > waiting for a backmerge to rebase everything properly. Sorry that I
> > didn't mention earlier.
> 
> linux-next has all the trees, so you can always use that. And yes I'm
> pushing the backmerge through, so in a few days at most I can pull in
> all your patches. Meanwhile you can base your work of linux-next.
> 
> > > Greg, ok if I just pull these in through drm-misc-next? It's a pretty bad
> > > hairball anyway and that avoids the tree coordination issues. Only thing
> > > that might get in the way is the vt font_copy removal, but that's in -rc3
> > > so easy to backmerge.
> >
> > I will rebase and send everything (including the font_copy
> > garbage-collecting) in a v3 series after the backmerge. Thanks,
> 
> No need to be blocked on a backmerge, this is only needed for merging
> the patches. Development should not be blocked like this.

I see. Thanks!

Peilin Ye

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
