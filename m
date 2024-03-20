Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D80E888197C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 23:35:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6451D10FFAC;
	Wed, 20 Mar 2024 22:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="uZJrGpJ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED9210FFAC
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 22:35:41 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2d2505352e6so4657841fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 15:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1710974139; x=1711578939;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n/Eqc8JOcHZY7IXZvTiJ/8bJTfQGWaXx+KUSs3MCDdw=;
 b=uZJrGpJ6JbXMb2YtJLrl2z/n8Jc3fMc63+dNwMYQEzuPM4MJqorsIrM3NqjeBrw8UP
 6FBWLJNaLJzQi/wl0RisafLfpF3smedDAOYwJfrp/hr6DNXiJl3rhuoHB/AvwCRnwjIm
 p6/zH29pSG30yOeBEXWCx566iuvMGBojHGOvOGePRPdjLAp2y6ZqMuF24Nuu43pNETMW
 mgGRoOeLBn0AxSI8Iu5twKJc6tRjgaZpPtBtyO8e8roLFhHleLkrLF2OlCkp/4T/yMJ2
 JOcOTaEUuL9Jupl3Dz4Ll7Or0+/RHWLkEsv7y04R31R/qCwcT9Sy5rxNPG13SQRPi3h1
 5yow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710974139; x=1711578939;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n/Eqc8JOcHZY7IXZvTiJ/8bJTfQGWaXx+KUSs3MCDdw=;
 b=RNVkQKXF7TnmoV1WlXSY/Zon+j630T6KvXoYa4kJgq9kS4nQzwf7UHubL4HfkKPEP5
 BtTyilVG9nw1rWiOzVAhYUaWadEQsI5elhhWSXRJsXex96OAPtDgvexg21Ffkc1pfJ9o
 QSApJC9FaBNpzY8se63Nzpo2ggJ1Uo8fbEZLz3DIrqBxWelqOONp0ELXfcpUESFJ2zYD
 JPfYejFdl4a3ND8E3Sr8OgFF8kw/jhmrSHPggF22l5K+Y+cb9LOJ1rUKA1fZq/nXUV1t
 4iIR2enqcixM/BVCAvSvKNs/bf1hBBVI5ELhBpAlo6YNnAYQtmqjzH7qODhMKZ783Ht+
 U3hQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9Ht8PkT/LczwSHR/H94XuY7ycnDn20AnZWM/zkYElqMIuBQnaWlvKGlMCritjKtqZrN5BJeZfd9AmxQXkxTVsMdptG01jblb2bRWQ1Wkl
X-Gm-Message-State: AOJu0Yyn86LrDeaHw8iurrToQTarEIU4QV6OF59hxS+U1kUyU8hQxxTa
 sQGNNTSEVbFiAjArjakEX1v1ZBN69mWW96JHH6msdecWPx9CEflLWaK4zNK7HmKMrJoujHZfWth
 AuQCUeNNVHHJcbWPoSJ3m6wZ9Pg/veOKCbYTz
X-Google-Smtp-Source: AGHT+IEn5Owi2sPtfaUxycTRYFwNeKA+Pm2rq41oCVa8/UT2ciC5oEejXaO971X27DHZCT9SSJ+kpz2ClHcFLTEpRno=
X-Received: by 2002:a19:431c:0:b0:513:e17d:cf3c with SMTP id
 q28-20020a19431c000000b00513e17dcf3cmr8896729lfa.1.1710974138867; Wed, 20 Mar
 2024 15:35:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240318-strncpy-drivers-video-fbdev-au1200fb-c-v1-1-680802a9f10a@google.com>
 <53670007-edbc-4762-9e57-0b3c29220d9e@gmx.de>
In-Reply-To: <53670007-edbc-4762-9e57-0b3c29220d9e@gmx.de>
From: Justin Stitt <justinstitt@google.com>
Date: Wed, 20 Mar 2024 15:35:26 -0700
Message-ID: <CAFhGd8ppVq9aGbfFLeL30jQ15KHS=FoLh0c1udXo=Z+pCfXL1g@mail.gmail.com>
Subject: Re: [PATCH] video: fbdev: au1200fb: replace deprecated strncpy with
 strscpy
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Mar 20, 2024 at 12:56=E2=80=AFAM Helge Deller <deller@gmx.de> wrote=
:
>
> On 3/19/24 00:46, Justin Stitt wrote:
> > strncpy() is deprecated for use on NUL-terminated destination strings
> > [1] and as such we should prefer more robust and less ambiguous string
> > interfaces.
> >
> > Let's use the new 2-argument strscpy() which guarantees NUL-termination
> > on the destination buffer while also simplifying the syntax. Note that
> > strscpy() will not NUL-pad the destination buffer like strncpy() does.
> >
> > However, the NUL-padding behavior of strncpy() is not required since
> > fbdev is already NUL-allocated from au1200fb_drv_probe() ->
> > frameuffer_alloc(), rendering any additional NUL-padding redundant.
> > |     p =3D kzalloc(fb_info_size + size, GFP_KERNEL);
> >
> > Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#st=
rncpy-on-nul-terminated-strings [1]
> > Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en=
.html [2]
> > Link: https://github.com/KSPP/linux/issues/90
> > Cc: linux-hardening@vger.kernel.org
> > Signed-off-by: Justin Stitt <justinstitt@google.com>
> > ---
> > Note: build-tested only.
> >
> > Found with: $ rg "strncpy\("
> > ---
> >   drivers/video/fbdev/au1200fb.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/video/fbdev/au1200fb.c b/drivers/video/fbdev/au120=
0fb.c
> > index 6f20efc663d7..e718fea63662 100644
> > --- a/drivers/video/fbdev/au1200fb.c
> > +++ b/drivers/video/fbdev/au1200fb.c
> > @@ -1557,7 +1557,7 @@ static int au1200fb_init_fbinfo(struct au1200fb_d=
evice *fbdev)
> >               return ret;
> >       }
> >
> > -     strncpy(fbi->fix.id, "AU1200", sizeof(fbi->fix.id));
> > +     strscpy(fbi->fix.id, "AU1200");
>
> I wonder if you really build-tested this, as this driver is for the mips =
architecture...
> And I don't see a strscpy() function which takes just 2 arguments.
> But I might be wrong....

I did build successfully :thumbs_up:

Commit e6584c3964f2f ("string: Allow 2-argument strscpy()") introduced
this new strscpy() form; it is present in string.h on Linus' tree.

>
> Helge

Thanks
Justin
