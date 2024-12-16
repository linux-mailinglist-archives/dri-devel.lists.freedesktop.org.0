Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E739F33AD
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 15:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB7110E6B2;
	Mon, 16 Dec 2024 14:53:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="XuCpks7Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B416D10E6B1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 14:53:14 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-385e1fcb0e1so2272764f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 06:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1734360793; x=1734965593; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nvtZQNjsUp/0qyumQ7GJvg/lQS1KRcG2P1Ae0d/qNzI=;
 b=XuCpks7QKivY8OweV2QoAcFrJwbN+w9UqKd7W6i2VjWSy+r2y7sbGJKtV297lIh6u1
 3CO/BfQCCBxf47RLjVv/vKa8RNxvO7yunxa7PZQqILpSOHycL2zprNCfKM/bLZx13KhP
 ja6fMdnh+aQLIwFX/gsfLc3/7tnAW3xik2HxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734360793; x=1734965593;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nvtZQNjsUp/0qyumQ7GJvg/lQS1KRcG2P1Ae0d/qNzI=;
 b=ChwJ0S3JZoyBzYMWOm6qFRpZa5hOAb+SdzgF1iOeBLuF48YgpySaLDR0zkpuuv4++T
 HoWIY9tk5t54Oy+mDh5JuVm2PIU46E6aPjgfS4hqzdbWi3znuN9otwCQ1UpsU513Qnvt
 oadimfZ7MsDtp8Kmey8qS8Y1SjZBGgJ1k7XEoESWTJEH07ZSLPMb1pozZyG4oSN+xMP7
 QR6bSFg0ZihODROsh0XBZNHQNui2Hfc4vTizyiV7ratDxOajg0H76R9hsW5rfAE5Xoqn
 lv5Qr+eNPsgCRUoHlw7iDXm46ApKgJHDwjyjQIcuZmECGfyaD39DjNSP0V24S+podd2j
 ExsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTlW33/SOGLaOeRnx77zX3LmBoSDOJjIdFfLeBFY2QEuCMgJcEjrboUrL0gxvemww7flP9NRKi+Lg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuFhvBlJ5fddIAaOQOOcHyWmKQbP7AT9r2+yeDWdIEk4nttT97
 fl1AmYfA/2m2qofoYegL6JTz2wBCpEu6+kKQQy5hR9tJveHmm/CI9vqgf97i066yL3Ogz3YGtEz
 /D9k=
X-Gm-Gg: ASbGncudRtC0YiD9FLGqKtglRKo3jw2/DNkIPpZzTU2O/UHTrUdF2G6SPBzd5s1mrAi
 +k8Pt56fivTEbB6Px1wdw79z9pwuy/B8rA6ogJ/vtmBcH2aDpcwz07mbruaNpN4CDGd/P4FcL83
 RTQZgOUijzvgcLZP+5ZNOZ8d51uCScr5lw6COv+rQtCNMrAf806iiNXmLictV/NToaXy5s+HqiB
 0JaTB+fQr16HQA5k1mfeud18xpzeJO40p9kjme4TtNzRehLFcUxvoQseCEo7BbJOS2g
X-Google-Smtp-Source: AGHT+IEvjPJYz4c8lGWIIm6GJn+0v+JxgvLJvrPqQnrbWPeXzvDW40MZd4pgYs8nJb63crnP2t/EaQ==
X-Received: by 2002:a5d:6481:0:b0:386:4277:6cf1 with SMTP id
 ffacd0b85a97d-3888e0b5977mr11529602f8f.39.1734360792842; 
 Mon, 16 Dec 2024 06:53:12 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4362559ec08sm143007345e9.22.2024.12.16.06.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 06:53:12 -0800 (PST)
Date: Mon, 16 Dec 2024 15:53:10 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
Message-ID: <Z2A-1i6YiPSjdUnP@phenom.ffwll.local>
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
 <340ed70a-a576-43c6-86ff-9b58ed513c72@mailbox.org>
 <a42981617e880d48e9614c9ab5a8892f7ae0a315.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a42981617e880d48e9614c9ab5a8892f7ae0a315.camel@pengutronix.de>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Mon, Dec 16, 2024 at 11:46:13AM +0100, Lucas Stach wrote:
> Am Montag, dem 16.12.2024 um 10:27 +0100 schrieb Michel Dänzer:
> > On 2024-12-15 21:53, Marek Olšák wrote:
> > > The comment explains the problem with DRM_FORMAT_MOD_LINEAR.
> > >    
> > > Signed-off-by: Marek Olšák <marek.olsak@amd.com <mailto:marek.olsak@amd.com>>
> > > 
> > > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> > > index 78abd819fd62e..8ec4163429014 100644
> > > --- a/include/uapi/drm/drm_fourcc.h
> > > +++ b/include/uapi/drm/drm_fourcc.h
> > > @@ -484,9 +484,27 @@ extern "C" {
> > >   * modifier (e.g. not setting DRM_MODE_FB_MODIFIERS in the DRM_ADDFB2 ioctl),
> > >   * which tells the driver to also take driver-internal information into account
> > >   * and so might actually result in a tiled framebuffer.
> > > + *
> > > + * WARNING:
> > > + * There are drivers out there that expose DRM_FORMAT_MOD_LINEAR, but only
> > > + * support a certain pitch alignment and can't import images with this modifier
> > > + * if the pitch alignment isn't exactly the one supported. They can however
> > > + * allocate images with this modifier and other drivers can import them only
> > > + * if they support the same pitch alignment. Thus, DRM_FORMAT_MOD_LINEAR is
> > > + * fundamentically incompatible across devices and is the only modifier that
> > > + * has a chance of not working. The PITCH_ALIGN modifiers should be used
> > > + * instead.
> > >   */
> > >  #define DRM_FORMAT_MOD_LINEAR  fourcc_mod_code(NONE, 0)
> > >  
> > > +/* Linear layout modifiers with an explicit pitch alignment in bytes.
> > > + * Exposing this modifier requires that the pitch alignment is exactly
> > > + * the number in the definition.
> > > + */
> > > +#define DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_64B fourcc_mod_code(NONE, 1)
> > 
> > It's not clear what you mean by "requires that the pitch alignment is exactly
> > the number in the definition", since a pitch which is aligned to 256 bytes is
> > also aligned to 128 & 64 bytes. Do you mean the pitch must be exactly the width
> > rounded up to the next / smallest possible multiple of the specified number of bytes?
> 
> I guess that's the intention here, as some AMD GPUs apparently have
> this limitation that they need an exact aligned pitch.
> 
> If we open the can of worms to overhaul the linear modifier, I think it
> would make sense to also add modifiers for the more common restriction,
> where the pitch needs to be aligned to a specific granule, but the
> engine doesn't care if things get overaligned to a multiple of the
> granule. Having both sets would probably make it easier for the reader
> to see the difference to the exact pitch modifiers proposed in this
> patch.

Yeah I think with linear modifiers that sepcificy alignment limitations we
need to be _extremely_ precise in what exactly is required, and what not.
There's all kinds of hilarious stuff that might be incompatible, and if we
don't mind those we're right back to the "everyone agrees on what linear
means" falacy.

So if pitch must be a multiple of 64, but cannot be a multiple of 128
(because the hw does not cope with the padding, then that's important).
Other things are alignment constraints on the starting point, and any
padding you need to add at the bottom (yeah some hw overscans and gets
pissed if there's not memory there). So I think it's best to go overboard
here with verbosity.

There's also really funny stuff like power-of-two alignment and things
like that, but I guess we'll get there if that's ever needed. That's also
why I think we don't need to add all possible linear modifiers from the
start, unless there's maybe too much confusion with stuff like "exactly
64b aligned pitch" and "at least 64b aligned pitch, but you can add lots
of padding if you feel like".
-""ma

> 
> Regards,
> Lucas

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
