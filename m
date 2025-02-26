Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E57A4588E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 09:39:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7E910E88F;
	Wed, 26 Feb 2025 08:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="X7s44fF0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB33410E885
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 08:29:49 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-abbac134a19so996708466b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 00:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1740558588; x=1741163388; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qd/P01QUb5F02hWZoi0IIwP5a5sgbN5wVj3NeUV9KKE=;
 b=X7s44fF0lEjC0GctUZfi5lf4av/8rdDCNWsyF5nC4brtiFdccu5vkwRT563e7SMGM+
 iUZKtn7Ms0k6Wy3gLF422rNY/mPGyK7w18qTbJqWEQS16NVcccJGPwelDvdfAhjjCrd3
 URovSeDC15zJrhw2VlIvZR8WwlLXR8khH6U/KGbbFa8wlYA3MlkYjIXdOcfOX/qdUQye
 vlkaRZCY/qSUhc/h7BJWiQRlYhTGDNP8chFU0g5r43nWLkYYPDkc0Az7f4iZO8vwtkyd
 lNINDH610tV3C4UObNOIA6R9qJF4KKWSqGUjraDauvXR4wg9PqPaNMW5wjxRBJr7c2SN
 XfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740558588; x=1741163388;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qd/P01QUb5F02hWZoi0IIwP5a5sgbN5wVj3NeUV9KKE=;
 b=ZCiuMKI2r6qua1euEvWENfWaXWQ/DNvOGaCyT8043O7Add+IeK4a+MlmjEr8c+k/41
 jWqargOOoTIDxmWIV/75FVVsy5A3XvCaGtDJE6XPG3/3Cfinbz/vWG+wgeIrSGwB/K+5
 59zzdtU7JT1iMk0DZ3ciG2d/KLysQ3uv0rzE1bA8NyaTHNPNzT03MU/ytgKxAueIOHl0
 5ncMWpxSvf9dJQroGPHcWGh4SHfrBDmftRKuHj+hwh2+8dYcP3yt7KRBP9ap9w54wz+T
 HzCw1vHsYlATHjnRfJhaBfKCS9KV0P2CCEiNLTs3DG8Y28IO/bEfdvENXwi17eqtpA9c
 BSTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0c/zGJr6gJRs8O9MilOIqGavSq/rX+2F62IwwQRAjE77yi3zCqInmJe0IS0igMzqykMtSo8v2OuU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw55HhH510vYkdZXGm0gCudgsRoNGFDOcOPG5HHvcRxyv+J6hw3
 ArYIkqPj1IcF60PoA7Ybyt2PnApeIbWscgvZH13pt3j7d3P+ys7u1tzElYydOVUzuDJ1rb6Xftl
 jYm3KHWP4jpNDvKsvq1XaQM+Oipc2EtkKwKx1BA==
X-Gm-Gg: ASbGncsjD2AbMsJoPsQwbPLpIS5U8Qn/aJGCQDPIXHxCAdIHOtm8huV9PWFSyT0A8Gb
 G9M0NYg7QSzZp+9JJ1V+YN9WtOZ3lZkQaMFZjzDLQc00mBQqWXERmVsjBr+DoadCkz5ilrKQ6TA
 lTpdCepw==
X-Google-Smtp-Source: AGHT+IHCBmf3hFVyDRWrbNjNMJpg3u3tAe5Gkum3edJXg5+W5jYzpdGCY2CkRcaqBj3q4FkgF3ZBCF2Ur/l8ZS65ls8=
X-Received: by 2002:a17:907:7711:b0:ab7:c152:a3ca with SMTP id
 a640c23a62f3a-abed0c66952mr598124866b.6.1740558587743; Wed, 26 Feb 2025
 00:29:47 -0800 (PST)
MIME-Version: 1.0
References: <20250225-converge-secs-to-jiffies-part-two-v3-0-a43967e36c88@linux.microsoft.com>
 <20250225-converge-secs-to-jiffies-part-two-v3-6-a43967e36c88@linux.microsoft.com>
 <e53d7586-b278-4338-95a2-fa768d5d8b5e@wanadoo.fr>
 <CAPjX3Fcr+BoMRgZGbqqgpF+w-sHU+SqGT8QJ3QCp8uvJbnaFsQ@mail.gmail.com>
 <7b8346a1-8a7d-4fcf-a026-119d77f2ca85@wanadoo.fr>
In-Reply-To: <7b8346a1-8a7d-4fcf-a026-119d77f2ca85@wanadoo.fr>
From: Daniel Vacek <neelx@suse.com>
Date: Wed, 26 Feb 2025 09:29:36 +0100
X-Gm-Features: AQ5f1Jrr13SgxwVjT6ysFNM9oHlwZl6dEEKFUrutAasFQHuednVFm1EELk7zLLU
Message-ID: <CAPjX3Fc1UuWvih_krriaF32aPCbGP0SPg2TSrBA8Xb7a=Ozc5Q@mail.gmail.com>
Subject: Re: [PATCH v3 06/16] rbd: convert timeouts to secs_to_jiffies()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Frank.Li@nxp.com, James.Bottomley@hansenpartnership.com, 
 Julia.Lawall@inria.fr, Shyam-sundar.S-k@amd.com, akpm@linux-foundation.org, 
 axboe@kernel.dk, broonie@kernel.org, cassel@kernel.org, cem@kernel.org, 
 ceph-devel@vger.kernel.org, clm@fb.com, cocci@inria.fr, 
 dick.kennedy@broadcom.com, djwong@kernel.org, dlemoal@kernel.org, 
 dongsheng.yang@easystack.cn, dri-devel@lists.freedesktop.org, 
 dsterba@suse.com, eahariha@linux.microsoft.com, festevam@gmail.com, 
 hch@lst.de, hdegoede@redhat.com, hmh@hmh.eng.br, 
 ibm-acpi-devel@lists.sourceforge.net, idryomov@gmail.com, 
 ilpo.jarvinen@linux.intel.com, imx@lists.linux.dev, james.smart@broadcom.com, 
 jgg@ziepe.ca, josef@toxicpanda.com, kalesh-anakkur.purayil@broadcom.com, 
 kbusch@kernel.org, kernel@pengutronix.de, leon@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
 linux-btrfs@vger.kernel.org, linux-ide@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-rdma@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-xfs@vger.kernel.org, 
 martin.petersen@oracle.com, nicolas.palix@imag.fr, ogabbay@kernel.org, 
 perex@perex.cz, platform-driver-x86@vger.kernel.org, s.hauer@pengutronix.de, 
 sagi@grimberg.me, selvin.xavier@broadcom.com, shawnguo@kernel.org, 
 sre@kernel.org, tiwai@suse.com, xiubli@redhat.com, yaron.avizrat@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 26 Feb 2025 08:39:53 +0000
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

On Wed, 26 Feb 2025 at 09:10, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Le 26/02/2025 =C3=A0 08:28, Daniel Vacek a =C3=A9crit :
> > On Tue, 25 Feb 2025 at 22:10, Christophe JAILLET
> > <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org> wrote:
> >>
> >> Le 25/02/2025 =C3=A0 21:17, Easwar Hariharan a =C3=A9crit :
> >>> Commit b35108a51cf7 ("jiffies: Define secs_to_jiffies()") introduced
> >>> secs_to_jiffies().  As the value here is a multiple of 1000, use
> >>> secs_to_jiffies() instead of msecs_to_jiffies() to avoid the multipli=
cation
> >>>
> >>> This is converted using scripts/coccinelle/misc/secs_to_jiffies.cocci=
 with
> >>> the following Coccinelle rules:
> >>>
> >>> @depends on patch@ expression E; @@
> >>>
> >>> -msecs_to_jiffies(E * 1000)
> >>> +secs_to_jiffies(E)
> >>>
> >>> @depends on patch@ expression E; @@
> >>>
> >>> -msecs_to_jiffies(E * MSEC_PER_SEC)
> >>> +secs_to_jiffies(E)
> >>>
> >>> While here, remove the no-longer necessary check for range since ther=
e's
> >>> no multiplication involved.
> >>
> >> I'm not sure this is correct.
> >> Now you multiply by HZ and things can still overflow.
> >
> > This does not deal with any additional multiplications. If there is an
> > overflow, it was already there before to begin with, IMO.
> >
> >> Hoping I got casting right:
> >
> > Maybe not exactly? See below...
> >
> >> #define MSEC_PER_SEC    1000L
> >> #define HZ 100
> >>
> >>
> >> #define secs_to_jiffies(_secs) (unsigned long)((_secs) * HZ)
> >>
> >> static inline unsigned long _msecs_to_jiffies(const unsigned int m)
> >> {
> >>          return (m + (MSEC_PER_SEC / HZ) - 1) / (MSEC_PER_SEC / HZ);
> >> }
> >>
> >> int main() {
> >>
> >>          int n =3D INT_MAX - 5;
> >>
> >>          printf("res  =3D %ld\n", secs_to_jiffies(n));
> >>          printf("res  =3D %ld\n", _msecs_to_jiffies(1000 * n));
> >
> > I think the format should actually be %lu giving the below results:
> >
> > res  =3D 18446744073709551016
> > res  =3D 429496130
> >
> > Which is still wrong nonetheless. But here, *both* results are wrong
> > as the expected output should be 214748364200 which you'll get with
> > the correct helper/macro.
> >
> > But note another thing, the 1000 * (INT_MAX - 5) already overflows
> > even before calling _msecs_to_jiffies(). See?
>
> Agreed and intentional in my test C code.
>
> That is the point.
>
> The "if (result.uint_32 > INT_MAX / 1000)" in the original code was
> handling such values.

I see. But that was rather an unrelated side-effect. Still you're
right, it needs to be handled carefully not to remove additional
guarantees which were implied unintentionally. At least in places
where these were provided in the first place.

> >
> > Now, you'll get that mentioned correct result with:
> >
> > #define secs_to_jiffies(_secs) ((unsigned long)(_secs) * HZ)
>
> Not looked in details, but I think I would second on you on this, in
> this specific example. Not sure if it would handle all possible uses of
> secs_to_jiffies().

Yeah, I was referring only in context of the example you presented,
not for the rest of the kernel. Sorry about the confusion.

> But it is not how secs_to_jiffies() is defined up to now. See [1].
>
> [1]:
> https://elixir.bootlin.com/linux/v6.14-rc4/source/include/linux/jiffies.h=
#L540
>
> >
> > Still, why unsigned? What if you wanted to convert -5 seconds to jiffie=
s?
>
> See commit bb2784d9ab495 which added the cast.

Hmmm, fishy. Maybe a function would be better than a macro?

> >
> >>          return 0;
> >> }
> >>
> >>
> >> gives :
> >>
> >> res  =3D -600
> >> res  =3D 429496130
> >>
> >> with msec, the previous code would catch the overflow, now it overflow=
s
> >> silently.
> >
> > What compiler options are you using? I'm not getting any warnings.
>
> I mean, with:
>         if (result.uint_32 > INT_MAX / 1000)
>                 goto out_of_range;
> the overflow would be handled *at runtime*.

Got it. But that may still fail if you configure HZ to 5000 or
anything above 1000. Not that anyone should go this way but...

> Without such a check, an unexpected value could be stored in
> opt->lock_timeout.
>
> I think that a test is needed and with secs_to_jiffies(), I tentatively
> proposed:
>         if (result.uint_32 > INT_MAX / HZ)
>                 goto out_of_range;

Right, that should correctly handle any HZ value. Looks good to me.

> CJ
>
> >
> >> untested, but maybe:
> >>          if (result.uint_32 > INT_MAX / HZ)
> >>                  goto out_of_range;
> >>
> >> ?
> >>
> >> CJ
> >>
>
> ...
