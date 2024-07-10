Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC25292C7A0
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 02:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7DC10E0CA;
	Wed, 10 Jul 2024 00:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XqJzBwKI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2909C10E0CA;
 Wed, 10 Jul 2024 00:25:47 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id
 a1e0cc1a2514c-8100ff1cec5so1721533241.3; 
 Tue, 09 Jul 2024 17:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720571146; x=1721175946; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GLMMCTOEE4C+kE7P1kVc+ZnjaPA7yhchwaYpxbxPQqg=;
 b=XqJzBwKIAdJoQ27fre5x8zjosKrYF91f7V/6+3QYSxeGYPUrh8PKK8RakKZzmuviql
 rlyytoCLs069a3nOnbw9z6IJ2159Z6+d36LAUNXjREiVSFXXGqgjZjNCCIx+DxvzKzTx
 YdWOHy+6rxSMUtPNqNZp9hFo4Kn3jF4xXofICitl117Ejp74j5s5WpEupRchxCLNzT8M
 QAsbY3UDafm1RJ2iIk7dY6HIwwbv3qLgnK/pVTpalXPNX8H30+FNTabGrPXjw0+MKKL7
 JiN/32zxTrsmJA21EBN5Mvg4FoFeVzReycSV7QT1rOIyA6w7dpX+rVpSgs1Mv2v23fL1
 Pvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720571146; x=1721175946;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GLMMCTOEE4C+kE7P1kVc+ZnjaPA7yhchwaYpxbxPQqg=;
 b=g6q736Qa6gq7BIKs26we5XYYO7Ur+x9j7vtQwloUMxnobD1vDm5pIw8+/4p5pZ78mp
 Wei/qnebt5YzPyKHDBZfQMYXfxn1gntXpHd1lpCzvQUOR5RNTQI+L1q7HBAwQbK/ALAQ
 PcL3LENFy4sIGOfF1lUOypZqJ/zLnvOsnwyDYWJD2We41fu22WMFdVPedMRzMx/Gdjd+
 lkyHR027azJago4wxEeBL6RzQT9CTtfmWulWbjCYfuLZIaU/fbDQDCHsRJwozmogrooy
 ur0saol4hLjISQhSQeNxY++HHqEyHsDn5Rbr81wxcwhhU5hLEBVHARVJmd1Qb4He3Fh/
 0WPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKqBpAbjokn8sjXjhMH9m41oKnhRSwJ0/9ibSPS2bTmRh9bYE3SR73p7vuzA7hFS6SIA8A6YXOhpyYhiRpkJ8ueOMUJCCoNT1VyEgHuAiGXD2eXs0FGS1G+2gq+x8o5Au12Aw7aATmSq97M+s4jZatDzb2Gx48eE0a4vIJZ/OSKZS0U4z+dDsEAgTMmhHaGWqMnGDJeX64oNj6UbE28FmcdwWLl0ingUOr7/rcHsu49As9ga0=
X-Gm-Message-State: AOJu0Yx4OKGe095w6mRg3KoVHJONljLQLnsEVnvBHBAF8D6Whm/9N37Q
 bAPelCSvgeOzeJOmRIkaAWxmTKFtQMKjWJaBbBQu7WkGSm/+oCbQgZ7Az1nhKxewBibnV8B1Lrp
 KXuSIP4vHrN6s9acav/txqiuk2eo=
X-Google-Smtp-Source: AGHT+IGECqipxoMr9LXTGLmRKFz4B8Xc35pmBX/LCXPTFZurDCgbtol3fdXdT6TkXYh5nKfDM1iSxmkL5helPLunxBc=
X-Received: by 2002:a05:6102:5123:b0:48f:5b4c:bb0a with SMTP id
 ada2fe7eead31-49031dc8f16mr4627169137.0.1720571145737; Tue, 09 Jul 2024
 17:25:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
 <20240702215804.2201271-31-jim.cromie@gmail.com> <ZoSOMClB0MeWeokU@intel.com>
 <CAJfuBxzsZUpO-Q_uAfMhzXs0WHYMTnj1F8ju7af-kQZKQjLvNQ@mail.gmail.com>
 <ZoU7kR2aYwVDvd_G@intel.com>
 <CAJfuBxwVWbJ9TdgH0ARmxUy+_DfNVKrTewjkqWKmCQtfOKQEAg@mail.gmail.com>
In-Reply-To: <CAJfuBxwVWbJ9TdgH0ARmxUy+_DfNVKrTewjkqWKmCQtfOKQEAg@mail.gmail.com>
From: jim.cromie@gmail.com
Date: Tue, 9 Jul 2024 18:25:19 -0600
Message-ID: <CAJfuBxx1wz=bMOyfiRRhrGyZTqnqZsUmi9Vubs23Yi1px9sZ-g@mail.gmail.com>
Subject: Re: [PATCH v9 30/52] drm-dyndbg: adapt drm core to use dyndbg
 classmaps-v2
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com, 
 jani.nikula@intel.com, jbaron@akamai.com, gregkh@linuxfoundation.org, 
 ukaszb@chromium.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 linux@rasmusvillemoes.dk, joe@perches.com, mcgrof@kernel.org
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

On Wed, Jul 3, 2024 at 10:11=E2=80=AFAM <jim.cromie@gmail.com> wrote:
>
> Got it.
> I had some mental block about passing designated intializers as macro arg=
s.
> it just worked, I needed to eyeball the .i file just to be sure.
> thanks.
> I have a fixup patch.
> whats the best thing to do with it, squash it in for later ? send in
> reply here ?
>

I have to retract on designated-initializers into DYNDBG_CLASSMAP_DEFINE

While it works for DRM, and looks good, and self-documenting,
it only works cuz DRM_UT_CORE =3D 0,
and breaks when I used it 2x in test-dynamic-debug.ko.
the 2nd _DEFINE needs a _base > DRM_UT_LAST.


With designated-init exprs passed in thru the macro, I get:

    1st classmap below is bad - the length should be 8, but is 28 cuz
init started at 20.

    (gdb) p *di->classes@di->num_classes
    $2 =3D {{mod =3D 0xffffffffc0203740, mod_name =3D 0xffffffffc0206220
"test_dynamic_debug",
        class_names =3D 0xffffffffc0203080, length =3D 28, base =3D 20,
map_type =3D DD_CLASS_TYPE_LEVEL_NUM}, {
        mod =3D 0xffffffffc0203740, mod_name =3D 0xffffffffc0206220
"test_dynamic_debug",
        class_names =3D 0xffffffffc0203160, length =3D 10, base =3D 0,
map_type =3D DD_CLASS_TYPE_DISJOINT_BITS}}
    (gdb)

    so 1st 20 classnames are empty, and classnames -> index -> classid
translation fails later.

    (gdb) p *di->classes[0]->class_names@di->classes[0]->length
    $4 =3D {0x0 <fixed_percpu_data> <repeats 20 times>,
0xffffffffc0206356 "V0", 0xffffffffc0206359 "V1",
      0xffffffffc020635c "V2", 0xffffffffc020635f "V3",
0xffffffffc0206362 "V4", 0xffffffffc0206365 "V5",
      0xffffffffc0206368 "V6", 0xffffffffc020636b "V7"}
    (gdb)

Basically, when designated-inits are passed in, the _base param is redundan=
t,
and the once guaranteed contiguous 0-based classnames list is now
guaranteed sparse.

the macro could be altered to expect designated-inits,
but I couldnt distinguish between the 2 different uses,
so theres a mis-use potential either way.

Id prefer to keep the _DEFINE the way it is,
and better kdoc & howto this to explain away the potential.

BTW: Im aware I failed to delete some v9*patch files before git send-email,
Im considering my penance, will resend soon.
