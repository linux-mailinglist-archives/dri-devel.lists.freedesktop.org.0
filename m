Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E39AA09B97
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 20:09:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2569610F17D;
	Fri, 10 Jan 2025 19:09:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="ehR+YC5v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E2F010F17D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 19:09:30 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-436a39e4891so17915695e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 11:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1736536169; x=1737140969; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=eyJ5eiXroJK4j6h3F0s2W75qJ+U9VZ21kGelR0QUn3o=;
 b=ehR+YC5vf6tMx/TwDi6BfaHDhTjFioNvB0ZvnV+rLAbQL874PjQTA3PaCd8jAx6T+i
 vYX5jhKQys7AdpEqzCETWBJrr3KZ3xKAkJ0n69QOpNNFClEzUaGz4SgB/weoBG4VA0AQ
 6jn9Kk/RWkqZb2wHammuglWOBxVoOjVh2ZkgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736536169; x=1737140969;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eyJ5eiXroJK4j6h3F0s2W75qJ+U9VZ21kGelR0QUn3o=;
 b=U8cmr3SF/9LWck36zd3JaMrXclbj2EIRmHqJRL0nQNZY6/R0tJNKuNJq8wpaO7Vw5i
 mxoIbCK07kLFxrT5q2WXlFC9TGrrdioyazDnMuWoYBSAeqSobCt7EMDJdZVq52A+cDZn
 pVM9rWGrqm8IErfswz+8/5j/pU+TvGJROO2xQHVyYIOstbBxauFVEWg+QCFOh96k53wv
 Sv5NwldxQhtBUeu+qeLmcz/XrXH6Y+hblhZGaqPLvbmKg8XLka8gTl/5v2r/PWhwmw2S
 TlDrfD2bY8Afr5HWXXgDoDP32i2fX2av/1IMFTdRbDWg5oddgdnDdo6dgXaJhqXdCXg2
 eiSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAbADoIf5m1V3NFndjID6TtxOzsiNBxyINkkXlK5udJkOvrIVt0jaqMSnftsqK9K61bjMXDYx4o08=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVTB/FoLa598HFDmUObRMZBZ2YLaQvFLwfwxT8YaHRjCKp/zoP
 NeUyEOJpwdAWs2SYKJUQJQ4o5lMeNk7lpiOrAmH6eyQ0octxg/xEM1AEJPDkRoA=
X-Gm-Gg: ASbGncuezDDhODJEXKkcq5UwN+MbAT8DFcqLyvL4tOD5xlEWCu3la+2CgNAvtbftRS0
 aFS9gLF6Yh6JtjZlhXVB3nsT7wH/AekwviDb0B5Ku3u9+/jxQb0KIFKq3E+Hg+CeM7+l81kiNGM
 Piv7TRIpKip2rOkzqizaWQiBmfi4mo6MRIgSdO81Rp08wce77SnhH5UJMzRiga6FkQHyEeAi86d
 E+NIL6QCkCu9t60suXVGt7opbigsIHi02GuMbFXJIe1eUGsfILX3OI9c0N1W8MUNbq4
X-Google-Smtp-Source: AGHT+IESstA3yi/1o1L1e+4jR93NIDVw3DtsLUVc6spJm46bIzp4VP+3eNV/05SPBmNsCf7HOT1r3g==
X-Received: by 2002:a05:600c:1da0:b0:434:a923:9310 with SMTP id
 5b1f17b1804b1-436e26a1b4amr119174085e9.15.1736536168767; 
 Fri, 10 Jan 2025 11:09:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2ddcb5bsm96729625e9.23.2025.01.10.11.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 11:09:27 -0800 (PST)
Date: Fri, 10 Jan 2025 20:09:26 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Manasi Navare <navaremanasi@google.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [PATCH] drm/atomic: clarify the rules around
 drm_atomic_state->allow_modeset
Message-ID: <Z4FwZvkZxK8U3i61@phenom.ffwll.local>
References: <20231010170746.617366-1-daniel.vetter@ffwll.ch>
 <20231011092051.640422-1-daniel.vetter@ffwll.ch>
 <edea5e48-2723-49ea-ad03-8cd3d9aa53b3@suse.de>
 <Z360aeAkou2OXMCg@phenom.ffwll.local>
 <f82df11f-97c4-4b6c-a139-90e20e0f2eb0@mailbox.org>
 <CAPj87rPQZk3uDu_Grmzyy_eK1ksoQSbtZorHM0unZE6vU0BVBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPj87rPQZk3uDu_Grmzyy_eK1ksoQSbtZorHM0unZE6vU0BVBw@mail.gmail.com>
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

On Thu, Jan 09, 2025 at 03:45:53PM +0000, Daniel Stone wrote:
> Hi,
> 
> On Thu, 9 Jan 2025 at 15:30, Michel Dänzer <michel.daenzer@mailbox.org> wrote:
> > On 2025-01-08 18:22, Simona Vetter wrote:
> > > Maybe I'm wrong, but my understanding is that English generally doesn't do
> > > compound words connected with dashes, you just line them up with spaces.
> >
> > I hope you don't mind me jumping in, three native German speakers
> > discussing English grammar is merrier than just two. :)
> >
> > FWIW, LWN writes compound words with spaces when used as nouns ("code
> > in user space"), with dashes when used as adjectives ("user-space
> > code"). I don't know if this is an official / general rule, I'm using
> > it as a guideline though.
> 
> To the extent that Australian counts as native English: yes, that's
> exactly the rule.

TIL, thanks a lot.

Pretty sure we never got around to this rule, and I had close to a decade
of English lessons. The one about commas I do remember from school though.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
