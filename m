Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB5990DADD
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 19:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A327010E75A;
	Tue, 18 Jun 2024 17:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Oz/XvZ3a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F365410E755
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 17:43:34 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52bc29c79fdso7758994e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 10:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718732613; x=1719337413; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UW3m3IVDCbgoGWkqOyhGrTXzXIbL2Q1j7KVjTgGLhLg=;
 b=Oz/XvZ3aaLhCHtRh2L0NhJI6Fpt/TcNB7jvIaDZWEg/r9T5kSCJapISHcIZ2YYiYXN
 hqt6AB7gyyO5BdGCZgDKlrEdcpMOUosJQXTFefWpXN9a/JnnaCoNmnWvyKVxnDyfbOCN
 cCu8s+JJz4lMx641EnJbQaqnrIFkV0KApsNnFwCStakEVMAxU760Sdr7NNzjhHza0eKZ
 00CFP/u0c4jf0F90VpzLLLiReOCoBSRsOgapXTJgt9de6tGq6KXvzgmiNvmSqWOUyo/C
 1xy4Rk4lgqhMXHridyY6FcrzBqXdv4Ll2PPNecLe8hBuSIMwFMSIFtrB2P2ltRc0uo1p
 IBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718732613; x=1719337413;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UW3m3IVDCbgoGWkqOyhGrTXzXIbL2Q1j7KVjTgGLhLg=;
 b=lxZmblBNJXhmvfIQYO5FnLsjJGa8aPqfyWR7eD8bHC2epsJZpAnQcoxLV8R0ZUo4Li
 orUZ8gM3brKUR2zRN8fvrOZayXR/XLViHxNyrjZJPvkcHcvdcVKRoU0UmSgF4hpy9XV9
 v47Qvzo89HKY20rjzufd2BkYW2SkI32EF3EF7WTvvyT5mQEQwbRKrcL4uJkWAhdUh9Fa
 QozXMxkfjZAavyTQmrFMfAdD0yuhrlI0X+/Lav5KYJu5Ely9m9Z2sOEGYu0DD4rihm5K
 9+A5BRB31KmULQ9/yq9J/wwVKt2RNP02Z0zGODMcOzL5BS2s2OCahaHm7pF3xDaTCw1A
 ewuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtbry77VUMYJDsA3/119QbFM0jrnX7TTVihQnq0uEnJvb55QGU2vWcbMEojKTC578JDAFEYQJx9WcqHXMewO1ZTTdy7tvbLfQwOtksvh5a
X-Gm-Message-State: AOJu0Yze3goXQoc3slUS9qHIZKwETtrNo8dgwpF+eIPFXpBfV3Rk7U0X
 EknNaj6qaiJ2ihrcTQHcjU2zsRrO1ZDv3CTiOrI38tyUvY8h3HzBZuzvUfHr5mg=
X-Google-Smtp-Source: AGHT+IHqgDsYBrSMyIeMIZAipBnP2CCm4mOxj6zvMMUSinXZl5+Bwzr+RzB97A5TqXTmpBeosa9Onw==
X-Received: by 2002:ac2:59db:0:b0:51d:9f10:71b7 with SMTP id
 2adb3069b0e04-52ccaa33e25mr244374e87.28.1718732611978; 
 Tue, 18 Jun 2024 10:43:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2884064sm1619765e87.242.2024.06.18.10.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 10:43:31 -0700 (PDT)
Date: Tue, 18 Jun 2024 20:43:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 kernel-dev@igalia.com, Melissa Wen <mwen@igalia.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Simon Ser <contact@emersion.fr>, 
 Pekka Paalanen <ppaalanen@gmail.com>, daniel@ffwll.ch,
 Daniel Stone <daniel@fooishbar.org>, 
 Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
 Dave Airlie <airlied@gmail.com>, ville.syrjala@linux.intel.com, 
 Xaver Hugl <xaver.hugl@gmail.com>, Joshua Ashton <joshua@froggi.es>, 
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v7 2/9] drm: Support per-plane async flip configuration
Message-ID: <aflfggx2dc2p3y2a76yecjgmahozmbpnkk2qpekrnkpvviih6i@g2uuxeubozbo>
References: <20240618030024.500532-1-andrealmeid@igalia.com>
 <20240618030024.500532-3-andrealmeid@igalia.com>
 <878qz2h9pp.fsf@intel.com>
 <CAA8EJpqM4iaG3PKM5c0Op7Y7c1SRDrOCk_oOnwG8YfdCxC8w6g@mail.gmail.com>
 <fc67b552-6f61-4f30-9e34-dd6b2364d155@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fc67b552-6f61-4f30-9e34-dd6b2364d155@igalia.com>
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

On Tue, Jun 18, 2024 at 01:18:10PM GMT, André Almeida wrote:
> Em 18/06/2024 07:07, Dmitry Baryshkov escreveu:
> > On Tue, 18 Jun 2024 at 12:38, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > > 
> > > On Tue, 18 Jun 2024, André Almeida <andrealmeid@igalia.com> wrote:
> > > > Drivers have different capabilities on what plane types they can or
> > > > cannot perform async flips. Create a plane::async_flip field so each
> > > > driver can choose which planes they allow doing async flips.
> > > > 
> > > > Signed-off-by: André Almeida <andrealmeid@igalia.com>
> > > > ---
> > > >   include/drm/drm_plane.h | 5 +++++
> > > >   1 file changed, 5 insertions(+)
> > > > 
> > > > diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> > > > index 9507542121fa..0bebc72af5c3 100644
> > > > --- a/include/drm/drm_plane.h
> > > > +++ b/include/drm/drm_plane.h
> > > > @@ -786,6 +786,11 @@ struct drm_plane {
> > > >         * @kmsg_panic: Used to register a panic notifier for this plane
> > > >         */
> > > >        struct kmsg_dumper kmsg_panic;
> > > > +
> > > > +     /**
> > > > +      * @async_flip: indicates if a plane can do async flips
> > > > +      */
> > > 
> > > When is it okay to set or change the value of this member?
> > > 
> > > If you don't document it, people will find creative uses for this.
> > 
> > Maybe it's better to have a callback instead of a static field? This
> > way it becomes clear that it's only relevant at the time of the
> > atomic_check().
> > 
> 
> So we would have something like bool (*async_flip) for struct
> drm_plane_funcs I suppose. Then each driver will implement this function and
> check on runtime if it should flip or not, right?
> 
> I agree that it makes more clear, but as far as I can see this is not
> something that is subject to being changed at runtime at all, so it seems a
> bit overkill to me to encapsulate a static information like that. I prefer
> to improve the documentation on the struct member to see if this solves the
> problem. What do you think of the following comment:

It looks like I keep on mixing async_flips as handled via the
DRM_MODE_PAGE_FLIP_ASYNC and the plane flips that are governed by
.atomic_async_check / .atomic_async_update / drm_atomic_helper_check()
and which end up being used just for legacy cursor updates.

So, yes, those are two different code paths, but with your changes I
think it becomes even easier to get confused between
atomic_async_check() and .async_flip member.


> /**
>  * @async_flip: indicates if a plane can perform async flips. The
>  * driver should set this true only for planes that the hardware
>  * supports flipping asynchronously. It may not be changed during
>  * runtime. This field is checked inside drm_mode_atomic_ioctl() to
>  * allow only the correct planes to go with DRM_MODE_PAGE_FLIP_ASYNC.
>  */

-- 
With best wishes
Dmitry
