Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A7970ED27
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 07:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6204810E060;
	Wed, 24 May 2023 05:35:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D41910E060
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 05:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684906555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sYWSCZWSoZ/yhfINuAN5NPLl1eSeL3h1FfSVoHk+QUw=;
 b=h2bH5Y+DPCUz2HNnkTJg/ykBdz9dvEgbfDHATvngDVuyVFoPF1AVGmBRS9ZNHEWVfoQwPd
 FSJDFxuiPWc1BQrz01XVDYXLG49+3Qx6Pv/kYeYBNYdpAZ1C55BQuGOid3TEL4PPZzt7N2
 9SHcmOaFIWv7yPWK1sQq0r9A9XO/u4Y=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-lKw_jJBYNa-qoPTpT4r1xQ-1; Wed, 24 May 2023 01:35:54 -0400
X-MC-Unique: lKw_jJBYNa-qoPTpT4r1xQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-3f39abae298so3774421cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 22:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684906553; x=1687498553;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sYWSCZWSoZ/yhfINuAN5NPLl1eSeL3h1FfSVoHk+QUw=;
 b=HsMTvPJP2B3zFxIzPocFyB+UBz9psc/zoAOcJcjMmMBKFEYUZRGn7z7gNvufB6etsu
 qhzqKiQ0HLEsEuB1pauLJ6JMI6LlUjZqg4MMx/uP0IreDJsP747w7VyxPHltxYMNoI3q
 lCWK7vAi+5dTWr1UYU1J29VcsBYjG72YCCAdzn5ZtkfNKZAf5a5FZKBaWtL0QYGhlkIu
 LhYwi5qxsmclKmELXAo9seGbE/Jb5VjnEnoNcadR4LfV06UOibvsV+enm63uHuV+ZcvS
 MOtBMbXD9uxRoe1htYt9gFFLa5ScwtG+NQBuyIXrIN9mGI1fLJr0xWsffb24v8hYKDz4
 P44Q==
X-Gm-Message-State: AC+VfDxFVXtT2WlA/XG8Zh7VzD7Umkk9aNKe1keDOnFVz5hCfb1lSqBx
 PqNys/9jTu91pfJGYucPpCSTphXG4Yozbu+2fW23AEX2HaMSZt8BDY4x+XX0BquRRXoaNdTycm5
 FtTR6rfgxiLRNUOy6PfdJo3dplZZu18cfbIp/vbLVaqmu
X-Received: by 2002:ac8:5f0d:0:b0:3ea:bac1:a5a0 with SMTP id
 x13-20020ac85f0d000000b003eabac1a5a0mr19403626qta.37.1684906553580; 
 Tue, 23 May 2023 22:35:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4zoHUTXzLdb1Nxh2pNoR/xydQsi1zuA0cn/ITqVkoEy+kEK/SZQChxAk6qBXDSg2cjFosMJuogOiOThzMtK7o=
X-Received: by 2002:ac8:5f0d:0:b0:3ea:bac1:a5a0 with SMTP id
 x13-20020ac85f0d000000b003eabac1a5a0mr19403618qta.37.1684906553312; Tue, 23
 May 2023 22:35:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230419043652.1773413-1-airlied@gmail.com>
 <ck2dzxvllhhh74oa3vjlacutc7rdmgl7cfrfq7vgx4w3jcufrz@7jbgxcat42yn>
 <CAPM=9tw0Y2A4DvuTHT_yd58Eit+tUmo63pbEOHwRJ66LeqznEQ@mail.gmail.com>
 <fsleccud43leoioli6bj4xoydwbdcjb5qr4denuf6morhgtqki@t6xya2mygon5>
 <ZEcJNcz+ArLfUSJ1@bombadil.infradead.org>
 <n6gwizwt26ucpuva2kt35rprth6iqeibi3inq2qrn5qhs3aa3b@4hjbhgnskutq>
 <CAPM=9txLf2NbuZSM5CLYT4wA5mbQ=+ssm9tdzh6JJ=gtEBeqAA@mail.gmail.com>
 <ZG2gBJbwX73owRYu@bombadil.infradead.org>
In-Reply-To: <ZG2gBJbwX73owRYu@bombadil.infradead.org>
From: David Airlie <airlied@redhat.com>
Date: Wed, 24 May 2023 15:35:41 +1000
Message-ID: <CAMwc25poqP-S2DSXLZuRA7F20fHsiq7uACbxUvYHCEkpY7BoHA@mail.gmail.com>
Subject: Re: [PATCH] modules/firmware: add a new option to denote a firmware
 group to choose one.
To: Luis Chamberlain <mcgrof@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, linux-modules@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 24, 2023 at 3:26=E2=80=AFPM Luis Chamberlain <mcgrof@kernel.org=
> wrote:
>
> On Wed, May 03, 2023 at 01:19:31PM +1000, Dave Airlie wrote:
> > >
> > > >
> > > >> > the GROUP until after the FIRMWARE, so this can't work, as it al=
ready
> > > >> > will have included all the ones below, hence why I bracketed top=
 and
> > > >> > bottom with a group.
> > > >>
> > > >> well... that is something that can be adapted easily by using a 2 =
pass
> > > >> approach, filtering out the list based on the groups.
> > > >>
> > > >> I agree that yours is simpler though.  If we can rely on the
> > > >> order produced by the compiler and we document the expectations of
> > > >> MODULE_FIRMWARE_GROUP_ONLY_ONE, then I believe we can stay with th=
e
> > > >> simpler approach.
> > > >>
> > > >> Luis, any thoughts here?
> > > >
> > > >I see the Dracut code indicates that the order says now that you sho=
uld
> > > >put the preferred firmware last, and that seems to match most coding
> > > >conventions, ie, new firmwares likely get added last, so it's a nice
> > >
> > > not all. i915 for example keeps it newest first so when attempting
> > > multiple firmware versions it starts from the preferred version.  It
> > > will be harder to convert since it also uses a x-macro to make sure t=
he
> > > MODULE_FIRMWARE() and the the platform mapping are actually using the=
 same
> > > firmware.
> > >
> > > >coincidence. Will this always work? I don't know. But if you like to
> > >
> > > short answer: it depends if your compiler is gcc *and* -O2 is used
> > > Longer debug ahead. Simple test with the expansion of MODULE_FIRMWARE
> > > baked in:
> > >
> > >         $ cat /tmp/a.c
> > >         static const __attribute__((section("__modinfo_manual"), used=
, aligned(1))) char foo[] =3D "modinfo_manual_foo";
> > >         static const __attribute__((section("__modinfo_manual"), used=
, aligned(1))) char bar[] =3D "modinfo_manual_bar";
> > >         $ gcc -c -o /tmp/a.o /tmp/a.c
> > >         $ objcopy -O binary --only-section=3D__modinfo_manual /tmp/a.=
o /tmp/modinfo_manual
> > >         $ strings /tmp/modinfo_manual
> > >         modinfo_manual_foo
> > >         modinfo_manual_bar
> > >
> > > However that doesn't match when building modules. In kmod:
> > >
> > > diff --git a/testsuite/module-playground/mod-simple.c b/testsuite/mod=
ule-playground/mod-simple.c
> > > index 503e4d8..6dd5771 100644
> > > --- a/testsuite/module-playground/mod-simple.c
> > > +++ b/testsuite/module-playground/mod-simple.c
> > > @@ -30,3 +30,9 @@ module_exit(test_module_exit);
> > >
> > >   MODULE_AUTHOR("Lucas De Marchi <lucas.demarchi@intel.com>");
> > >   MODULE_LICENSE("GPL");
> > > +
> > > +
> > > +static const char __UNIQUE_ID_firmware404[] __attribute__((__used__)=
) __attribute__((__section__("__modinfo_cpp"))) __attribute__((__aligned__(=
1))) =3D "modinfo_cpp_foo";
> > > +static const char __UNIQUE_ID_firmware405[] __attribute__((__used__)=
) __attribute__((__section__("__modinfo_cpp"))) __attribute__((__aligned__(=
1))) =3D "modinfo_cpp_bar";
> > >
> > >         $ make ....
> > >         $ objcopy -O binary --only-section=3D__modinfo_cpp testsuite/=
module-playground/mod-simple.ko /tmp/modinfo_cpp
> > >         $ strings /tmp/modinfo_cpp
> > >         modinfo_cpp_bar
> > >         modinfo_cpp_foo
> > >
> > > It doesn't seem to be ./scripts/Makefile.modfinal neither as it's als=
o
> > > inverted in testsuite/module-playground/mod-simple.o
> > >
> > > After checking the options passed to gcc, here is the "culprit": -O2
> > >
> > >         $ gcc -c -o /tmp/a.o /tmp/a.c && objcopy -O binary --only-sec=
tion=3D__modinfo_manual /tmp/a.o /tmp/modinfo_manual && strings /tmp/modinf=
o_manual
> > >         modinfo_manual_foo
> > >         modinfo_manual_bar
> > >         $ gcc -O2 -c -o /tmp/a.o /tmp/a.c && objcopy -O binary --only=
-section=3D__modinfo_manual /tmp/a.o /tmp/modinfo_manual && strings /tmp/mo=
dinfo_manual
> > >         modinfo_manual_bar
> > >         modinfo_manual_foo
> > >
> > > It seems anything but -O0 inverts the section.
> > >
> > >         $ gcc --version
> > >         gcc (GCC) 12.2.1 20230201
> > >
> > > It doesn't match the behavior described in its man page though. Manua=
lly
> > > specifying all the options that -O1 turns on doesn't invert it.
> > >
> > >         $ gcc -fauto-inc-dec -fbranch-count-reg -fcombine-stack-adjus=
tments \
> > >                 -fcompare-elim -fcprop-registers -fdce -fdefer-pop -f=
delayed-branch
> > >                 -fdse -fforward-propagate -fguess-branch-probability =
-fif-conversion \
> > >                 -fif-conversion2 -finline-functions-called-once -fipa=
-modref \
> > >                 -fipa-profile -fipa-pure-const -fipa-reference -fipa-=
reference-addressable \
> > >                 -fmerge-constants -fmove-loop-stores -fomit-frame-poi=
nter -freorder-blocks \
> > >                 -fshrink-wrap -fshrink-wrap-separate -fsplit-wide-typ=
es -fssa-backprop \
> > >                 -fssa-phiopt -ftree-bit-ccp -ftree-ccp -ftree-ch -ftr=
ee-coalesce-vars \
> > >                 -ftree-copy-prop -ftree-dce -ftree-dominator-opts -ft=
ree-dse -ftree-forwprop \
> > >                 -ftree-fre -ftree-phiprop -ftree-pta -ftree-scev-cpro=
p -ftree-sink -ftree-slsr \
> > >                 -ftree-sra -ftree-ter -funit-at-a-time -c -o /tmp/a.o=
 /tmp/a.c \
> > >                 && objcopy -O binary --only-section=3D__modinfo_manua=
l /tmp/a.o /tmp/modinfo_manual && strings /tmp/modinfo_manual
> > >         cc1: warning: this target machine does not have delayed branc=
hes
> > >         modinfo_manual_foo
> > >         modinfo_manual_bar
> > >
> >
> > Thanks Lucas,
> >
> > -ftoplevel-reorder is the one that does it, now that does mean how
> > I've done it isn't going to be robust.
> >
> > I will reconsider but in order to keep backwards compat, it might be
> > easier to add firmware groups as an explicit list, but also spit out
> > the individual names, but not sure how clean this will end up on
> > dracut side.
> >
> > I'll take a look at the other options, but it does seem like reworking
> > dracut is going to be the harder end of this, esp if I still want to
> > keep compat with older ones.
>
> Hey Dave, just curious if there was going to be another follow up patch
> for this or if it was already posted. I don't see it clearly so just
> wanted to double check.

I'm still considering the options here.

I could leave the kernel patch as-is and add explicit sorting in
dracut for anything in the groups, but then we have to name/version
the firmware in a certain way, another option might be to emit the
group bounds and two records, one old, one new per-fw file, then have
some sort of explicit versioning by the driver over what order to load
them.

Dave.

