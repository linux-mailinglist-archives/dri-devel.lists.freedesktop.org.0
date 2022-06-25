Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E1455ACEF
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 00:32:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D1E10E717;
	Sat, 25 Jun 2022 22:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9FF10E717
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 22:32:44 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id h23so11565672ejj.12
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 15:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IXf+WbaJuS2Bb87BujjYgL896zC/ZCd1RBvWLCakLdc=;
 b=Oxeo5QjMAk23HITB2bxZmHBSZFiCJHF9YxPAz785OIUhuBGa/UDpne6/1GZisaNfou
 8OWfOQIELPJ3CDJl5JHM6gh4SPk9hUEUms+WSDgXIG0bnnsPcrR9dHP62R5ck2ki3jke
 /RhZaotCSc8qC56RaJHMr4sifryCEq7S92hgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IXf+WbaJuS2Bb87BujjYgL896zC/ZCd1RBvWLCakLdc=;
 b=SqULKo/A4kFZLatRBYuJpxZ8/TV1JWm+lmsJBNMm9VgYvfIjdS4fBF52SSW7jxnvZ7
 RiCoeyseP4Nrvwpb0EAYvXojWNtvQnN7PhGaJbLvoOQimewhjhgeRXhV7OX+6eVqpmWY
 mnTXFtTGOdzKjk89KYgebQjRsX7/dFmPv7xI8juMjb+DjxRPpa6eR+FG2kLUFHMnZJuL
 LeszpjhD9cF0otTM4LcxTR8ezUcwF44/9FuLu5nereJl+qtCs0GfEt7wj0YsjynbMzP0
 6Ib3mZqNP2ntzTkw83JVR/ecTEY7ASC6M4F3BqmI7BSVUI5oExJPcCCo0Cg6sSh+5KhW
 V93g==
X-Gm-Message-State: AJIora99sWrFitkiBLglyzulndQPHOUirX5FSEFYZZdQK5SNj2sCyBJa
 lp1nbu9a0iO6eRGu2+vZCuBDBw==
X-Google-Smtp-Source: AGRyM1sxNI9PB7OWv2D5fDLPuwHw6RGxH6DgLPfJolnMZUgW7in9QkkqOQogaeooi/01ukdmQViZpQ==
X-Received: by 2002:a17:907:6e8b:b0:726:2b16:d1b4 with SMTP id
 sh11-20020a1709076e8b00b007262b16d1b4mr5944750ejc.27.1656196363169; 
 Sat, 25 Jun 2022 15:32:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a170906454200b006fe9ec4ba9esm3142244ejq.52.2022.06.25.15.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jun 2022 15:32:42 -0700 (PDT)
Date: Sun, 26 Jun 2022 00:32:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2 1/4] fbcon: Disallow setting font bigger than screen
 size
Message-ID: <YreNCepKsGNAIAxF@phenom.ffwll.local>
References: <20220625122502.68095-1-deller@gmx.de>
 <20220625122502.68095-2-deller@gmx.de>
 <YrcDgjpgeqSZtSOE@phenom.ffwll.local>
 <feee43e4-fad3-b8c8-852b-ab85804416b6@gmx.de>
 <YreL5+HQdicqwfcj@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YreL5+HQdicqwfcj@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 26, 2022 at 12:27:51AM +0200, Daniel Vetter wrote:
> On Sat, Jun 25, 2022 at 04:53:25PM +0200, Helge Deller wrote:
> > On 6/25/22 14:45, Daniel Vetter wrote:
> > > On Sat, Jun 25, 2022 at 02:24:59PM +0200, Helge Deller wrote:
> > >> Prevent that users set a font size which is bigger than the physical screen.
> > >> It's unlikely this may happen (because screens are usually much larger than the
> > >> fonts and each font char is limited to 32x32 pixels), but it may happen on
> > >> smaller screens/LCD displays.
> > >>
> > >> Signed-off-by: Helge Deller <deller@gmx.de>
> > >> Cc: stable@vger.kernel.org # v4.14+
> > >> ---
> > >>  drivers/video/fbdev/core/fbcon.c | 5 +++++
> > >>  1 file changed, 5 insertions(+)
> > >>
> > >> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> > >> index c4e91715ef00..e162d5e753e5 100644
> > >> --- a/drivers/video/fbdev/core/fbcon.c
> > >> +++ b/drivers/video/fbdev/core/fbcon.c
> > >> @@ -2469,6 +2469,11 @@ static int fbcon_set_font(struct vc_data *vc, struct console_font *font,
> > >>  	if (charcount != 256 && charcount != 512)
> > >>  		return -EINVAL;
> > >>
> > >> +	/* font bigger than screen resolution ? */
> > >> +	if (font->width  > FBCON_SWAP(info->var.rotate, info->var.xres, info->var.yres) ||
> > >> +	    font->height > FBCON_SWAP(info->var.rotate, info->var.yres, info->var.xres))
> > >> +		return -EINVAL;
> > >
> > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> > Thanks!
> > 
> > > Maybe as a safety follow up patch, we have a few copies of the below:
> > >
> > > 	cols = FBCON_SWAP(ops->rotate, info->var.xres, info->var.yres);
> > > 	rows = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
> > > 	cols /= vc->vc_font.width;
> > > 	rows /= vc->vc_font.height;
> > >
> > > Might be good to extract that into a helper and also add
> > >
> > > 	WARN_ON(!cols);
> > > 	WARN_ON(!rows);
> > 
> > That's not needed then.
> > The checks I added above will ensure that cols and rows are both greater than 0.
> 
> Yeah I reviewed it too, but I don't trust review all over the place.
> Especially with something like fbcon with entry points from everywhere.

Also the other motivation is that a bit of common code extraction refactor
for non-trivial math like the above is simply the right thing to do.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
