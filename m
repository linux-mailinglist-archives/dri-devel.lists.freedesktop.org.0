Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C04BD2D0C3A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:57:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4829289ED3;
	Mon,  7 Dec 2020 08:56:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2846E14F
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 09:48:00 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id s85so2920962vsc.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Dec 2020 01:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DgNzkpYbR088s1hhDlFJ4RLB9IvFauB+JyzYvIvja0Y=;
 b=KIKPH5oETlyEKGWF7EGVZMivf2cX3T1QUigYIo17I8wBcH0CzIwH37YKohmJkD8vUz
 avBRqxk5QhkAc02jAqQmrA+hGg43NARiZ7dqomjMwwBuAKl0nK8zLzN0adKg/fbiLWx+
 Riw6U5cmw6tlxX9eV7eEQe00B8LSq1iY269d4J639khw0hCVjfqtUIg4H24s4U29+/U3
 OLPfaQm0gqHioPhdS0aEzx1xNaXtXti3wUyyCuVGWDid4L4eq5wji4lfPkxf8VhzdmTs
 RFff+vQdWk7edmx90RiJ+dRIN52cyQtVQWnV5zHIhd1vniZGhKlkpyNONKhNOySqEwEG
 zFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DgNzkpYbR088s1hhDlFJ4RLB9IvFauB+JyzYvIvja0Y=;
 b=PB6y0WVT8Vo+25PI2kQzQNqJPIrnL4NNArj3BgaYE96rF5C0lFXb8Io8MNhgrze/Q6
 Tkcdk16kGf0M4qLEFtYfp9lhCaO1E3Qeoit1P5rvevUU8MA0hwBD/aULMldjDq1Uf+Do
 8Ti0jRhSQJOiBc1X3ZBI/WgbSMmg7cXAzuYZAw119VeAnV9bHcnDA9hZrkGTpV4VQnWp
 gnXAO8NBuDtoLmMpm4nE85GM4AleeHA6HYXHmDopXHw9sBYiM/ChQ78C0QzKt04j7jRf
 2qjTD+I21ae78QxA8DtP24uzal3dpN3vZutEVOcCny0LxWPiqohprQBFaG0/R1SrG/yn
 sCZw==
X-Gm-Message-State: AOAM533YrkFVoV8OeVOlAFWtwVPV8m0kifUj7RcqSmLvbxzJJYEClqR9
 ihJtK79oMhDtgl66mopR6F4DwHPjZKBfZJVjGaPSZZX8AFnv4gZf
X-Google-Smtp-Source: ABdhPJyFyzUh7upVAKuJnETLcDmRpBUxki9wuNxRHHG2RJtqW7lmQddpAdFNOaqBSdvZDkl2NM9j0Kq+vOLnubAhPI8=
X-Received: by 2002:a67:7902:: with SMTP id u2mr2117838vsc.41.1607075279917;
 Fri, 04 Dec 2020 01:47:59 -0800 (PST)
MIME-Version: 1.0
References: <CAKMK7uG3JbUuaJ3UUTHgeYCKnD9+n_bbeX=xka9o+TLJHwHJZQ@mail.gmail.com>
 <1607057617-145-1-git-send-email-jpark37@lagfreegames.com>
 <1607057617-145-2-git-send-email-jpark37@lagfreegames.com>
 <kg-gEiynWjY827eEdQ93-QfPdC-z3Odes93NaWXaEts4z4kNu8I5xffAec3LDWfjN5_iUGYrL2ZOP8t597Y8pkEKdxgmC0c8OGzGHuTAgPM=@emersion.fr>
In-Reply-To: <kg-gEiynWjY827eEdQ93-QfPdC-z3Odes93NaWXaEts4z4kNu8I5xffAec3LDWfjN5_iUGYrL2ZOP8t597Y8pkEKdxgmC0c8OGzGHuTAgPM=@emersion.fr>
From: James Park <james.park@lagfreegames.com>
Date: Fri, 4 Dec 2020 01:47:11 -0800
Message-ID: <CABjik9cos_qa-jS2MO0iYPmf7qhuwKRKaKSqeGdhNZoHoQtOkQ@mail.gmail.com>
Subject: Re: [PATCH] drm: Allow drm_fourcc.h without including drm.h
To: Simon Ser <contact@emersion.fr>
X-Mailman-Approved-At: Mon, 07 Dec 2020 08:56:49 +0000
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 James Park <jpark37@lagfreegames.com>
Content-Type: multipart/mixed; boundary="===============0217272361=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0217272361==
Content-Type: multipart/alternative; boundary="0000000000002fe99505b5a05fb6"

--0000000000002fe99505b5a05fb6
Content-Type: text/plain; charset="UTF-8"

The typedefs might also conflict on Linux if DRM_FOURCC_STANDALONE is
enabled with whatever LInux declared __u32/__u64 as, but I think the
implication is that once DRM_FOURCC_STANDALONE has been declared, that's
kind of a promise not to include drm.h.

I'm fine with this, but I'm not married to it if someone has a problem
where they want to define DRM_FOURCC_STANDALONE, but also can't avoid
including drm.h for some reason.

On Fri, Dec 4, 2020 at 12:53 AM Simon Ser <contact@emersion.fr> wrote:

> On Friday, December 4, 2020 5:53 AM, James Park <jpark37@lagfreegames.com>
> wrote:
>
> > +#ifdef DRM_FOURCC_STANDALONE
> > +#include <stdint.h>
> >
> > +typedef uint32_t __u32;
> > +typedef uint64_t __u64;
> > +#else
> > #include "drm.h"
> > +#endif
>
> C11 allows duplicate typedefs, but older versions of the standard
> don't AFAIK. If this is a concern, a solution would be to guard the
> typedefs.
>

--0000000000002fe99505b5a05fb6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The typedefs might also conflict on Linux if DRM_FOURCC_ST=
ANDALONE is enabled with whatever LInux declared __u32/__u64 as, but I thin=
k the implication is that once DRM_FOURCC_STANDALONE has been declared, tha=
t&#39;s kind of a promise not to include drm.h.<br><div><br></div><div>I&#3=
9;m fine with=C2=A0this, but I&#39;m not married to it if someone has a pro=
blem where they want to define DRM_FOURCC_STANDALONE, but also can&#39;t av=
oid including drm.h for some reason.</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 4, 2020 at 12:53 AM S=
imon Ser &lt;<a href=3D"mailto:contact@emersion.fr">contact@emersion.fr</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On F=
riday, December 4, 2020 5:53 AM, James Park &lt;<a href=3D"mailto:jpark37@l=
agfreegames.com" target=3D"_blank">jpark37@lagfreegames.com</a>&gt; wrote:<=
br>
<br>
&gt; +#ifdef DRM_FOURCC_STANDALONE<br>
&gt; +#include &lt;stdint.h&gt;<br>
&gt;<br>
&gt; +typedef uint32_t __u32;<br>
&gt; +typedef uint64_t __u64;<br>
&gt; +#else<br>
&gt; #include &quot;drm.h&quot;<br>
&gt; +#endif<br>
<br>
C11 allows duplicate typedefs, but older versions of the standard<br>
don&#39;t AFAIK. If this is a concern, a solution would be to guard the<br>
typedefs.<br>
</blockquote></div>

--0000000000002fe99505b5a05fb6--

--===============0217272361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0217272361==--
