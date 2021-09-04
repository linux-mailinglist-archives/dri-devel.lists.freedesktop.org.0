Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A134009D2
	for <lists+dri-devel@lfdr.de>; Sat,  4 Sep 2021 06:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC2F6E8F4;
	Sat,  4 Sep 2021 04:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078486E8F3
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Sep 2021 03:50:50 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id v10so1304170wrd.4
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Sep 2021 20:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DLoqU1aBLuC/Geje/K8KgBE6VCR9aDzoq7xQgMBsv88=;
 b=siQVzGu59vPiLppAuSxOr6mOgne2bA+fuMcHwoSpNrwiG0al3FZ+MsD1tfQiPiAIbb
 9l/tpKwUNRV44XdpBYkiggBbL0iTzRrpndE/04PUz0ZbMr0pmRbw3aHr4jw1T3Rf0H3y
 FHI03kYy6lXXsvW5tkm8SKRana0KXypQlAhNUyHvFr2mcG+ONYl7GRJiuUWMLDTf7gZ8
 A12sezp8xIXmgdjfs/BybNOBOyUqhq8fOLTHIvHiIjmMZLhd1Nkzun+4MClafP+nVLXT
 jC81GCrguYTwoXdUg4bVcp3Bm7UgS+Rt57v71xr29kOKzbgtedIne5KqE/N5fBLX74Ut
 TK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DLoqU1aBLuC/Geje/K8KgBE6VCR9aDzoq7xQgMBsv88=;
 b=NqUnRuUMD1ohShjXx822/DVVEdKpo+tGaIv9YzuAuALUx9/Yh2I2/N7iTDY/5M8KNW
 qEYKksjU1b2908ctekEyWGTjCTkVmi0F1+lDK5vKs9lrsDzCbITROa9rCBFmxUW5+ITc
 JNwwQ6xLhl2d6lA5RH2d8qqF0EATxcgzq44ObtgjTsPLmpJgPcg/wtsGFhK4d9TjRxXI
 4xu02hjplZiECrMSr1w3THLzKzZRe+KgIJhy9MfJBA4Zi7ctwKBPqHx9npvrr5dfIx3V
 0DYk5fkWmfOHgGQNVGxwcwp6+CTsOxpTHj5LGQ7RhUy+kHVrG7emBf63ITdoNIau1CL5
 VRZA==
X-Gm-Message-State: AOAM532PLjUT01rOZjAHS4CHCzY6MlmlTQqi5FeI2YnR3VR2uqwdgD0g
 fvi20hyoOr8wp1CkW0W67RZOLZWtwrEktR1Jo6CfCw==
X-Google-Smtp-Source: ABdhPJx94z5bof7TLNxhDf75keXK4xr/+icabxP4UvPTpEFz3p8iaBnDGVAPVJNM5RBoTwfoltWZPFubFRM8HhmzEkY=
X-Received: by 2002:a5d:58dc:: with SMTP id o28mr1901134wrf.399.1630727448524; 
 Fri, 03 Sep 2021 20:50:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210902020129.25952-1-rdunlap@infradead.org>
 <9faacbc8-3346-8033-5b4d-60543eae959e@cambridgegreys.com>
 <f978cae5-7275-6780-8a17-c6e61247bce7@infradead.org>
 <0887903c-483d-49c7-0d35-f59be2f85bac@cambridgegreys.com>
 <YTDjlixwDWi7Y2uR@phenom.ffwll.local>
In-Reply-To: <YTDjlixwDWi7Y2uR@phenom.ffwll.local>
From: David Gow <davidgow@google.com>
Date: Sat, 4 Sep 2021 11:50:37 +0800
Message-ID: <CABVgOSnvW_H03KjXxK5=j0ApEPh-Me3RxMF9QGFFT3kEtXJ65Q@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: provide default page protection for UML
To: Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Randy Dunlap <rdunlap@infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org, 
 Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, 
 linux-um <linux-um@lists.infradead.org>, David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 04 Sep 2021 04:47:25 +0000
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

On Thu, Sep 2, 2021 at 10:46 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Sep 02, 2021 at 07:19:01AM +0100, Anton Ivanov wrote:
> > On 02/09/2021 06:52, Randy Dunlap wrote:
> > > On 9/1/21 10:48 PM, Anton Ivanov wrote:
> > > > On 02/09/2021 03:01, Randy Dunlap wrote:
> > > > > boot_cpu_data [struct cpuinfo_um (on UML)] does not have a struct
> > > > > member named 'x86', so provide a default page protection mode
> > > > > for CONFIG_UML.
> > > > >
> > > > > Mends this build error:
> > > > > ../drivers/gpu/drm/ttm/ttm_module.c: In function
> > > > > =E2=80=98ttm_prot_from_caching=E2=80=99:
> > > > > ../drivers/gpu/drm/ttm/ttm_module.c:59:24: error: =E2=80=98struct
> > > > > cpuinfo_um=E2=80=99 has no member named =E2=80=98x86=E2=80=99
> > > > >    else if (boot_cpu_data.x86 > 3)
> > > > >                          ^
> > > > >
> > > > > Fixes: 3bf3710e3718 ("drm/ttm: Add a generic TTM memcpy move for
> > > > > page-based iomem")
> > > > > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > > > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > > Cc: Huang Rui <ray.huang@amd.com>
> > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > Cc: Jeff Dike <jdike@addtoit.com>
> > > > > Cc: Richard Weinberger <richard@nod.at>
> > > > > Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> > > > > Cc: linux-um@lists.infradead.org
> > > > > Cc: David Airlie <airlied@linux.ie>
> > > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > > ---
> > > > >   drivers/gpu/drm/ttm/ttm_module.c |    4 ++++
> > > > >   1 file changed, 4 insertions(+)
> > > > >
> > > > > --- linux-next-20210901.orig/drivers/gpu/drm/ttm/ttm_module.c
> > > > > +++ linux-next-20210901/drivers/gpu/drm/ttm/ttm_module.c
> > > > > @@ -53,6 +53,9 @@ pgprot_t ttm_prot_from_caching(enum ttm_
> > > > >       if (caching =3D=3D ttm_cached)
> > > > >           return tmp;
> > > > > +#ifdef CONFIG_UML
> > > > > +    tmp =3D pgprot_noncached(tmp);
> > > > > +#else
> > > > >   #if defined(__i386__) || defined(__x86_64__)
> > > > >       if (caching =3D=3D ttm_write_combined)
> > > > >           tmp =3D pgprot_writecombine(tmp);
> > > > > @@ -69,6 +72,7 @@ pgprot_t ttm_prot_from_caching(enum ttm_
> > > > >   #if defined(__sparc__)
> > > > >       tmp =3D pgprot_noncached(tmp);
> > > > >   #endif
> > > > > +#endif
> > > > >       return tmp;
> > > > >   }
> > > >
> > > > Patch looks OK.
> > > >
> > > > I have a question though - why all of DRM is not !UML in config. No=
t
> > > > like we can use them.
> > >
> > > I have no idea about that.
> > > Hopefully one of the (other) UML maintainers can answer you.
> >
> > Touche.
> >
> > We will discuss that and possibly push a patch to !UML that part of the
> > tree. IMHO it is not applicable.
>
> I thought kunit is based on top of uml, and we do want to eventually adop=
t
> that. Especially for helper libraries like ttm.

UML is not actually a dependency for KUnit, so it's definitely
possible to test things which aren't compatible with UML. (In fact,
there's even now some tooling support to use qemu instead on a number
of architectures.)

That being said, the KUnit tooling does use UML by default, so if it's
not too difficult to keep some level of UML support, it'll make it a
little easier (and faster) for people to run any KUnit tests.

Cheers,
-- David
