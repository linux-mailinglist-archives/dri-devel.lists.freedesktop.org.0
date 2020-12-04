Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E362D0C49
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:57:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A637D6E7D4;
	Mon,  7 Dec 2020 08:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1771A6E138
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 10:09:14 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id x26so2958876vsq.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Dec 2020 02:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CjgiGPtp7rrNRYAzI1DnO4zsvAGzYxQzoeoz02OGn+w=;
 b=BvybJ3+Yvp0OnG/9CwuviI87kRnQV1MfamE5B+RH8pARE7JRLekwbDtqEHocK1+bAB
 G5IzzlhsSYrslBPGfC96h6tDQCfUo6V12EJx9GsqrR0U+n/UvdWHJ1MGyJWT4UAGTeqG
 3H7p5/kAXwBFlvytF3cF/uOJdC2UQZvCrLXCtXjuYTyNAfRffB89n+1LdhTVbSCLgcwA
 Ndjhm8t2Nsk24EzrW+jMy5xeZqyWKZ6wyKCW5Z4bfZTgMB3Cp08ug3W3X6Yg6BDoIjL+
 FPWMX/YMD7SWOju9jPeYeE309GhADZl0xTNVdc2HzpYW/ljT2UW8IDuzvkFfw4zY2mGl
 WpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CjgiGPtp7rrNRYAzI1DnO4zsvAGzYxQzoeoz02OGn+w=;
 b=PiuU8n5Ut+mXy9KZN6XpxjXvuu6d+3fv/czfNZFxpfptVKl+2WN8gUcJh0sx4MqbMY
 KDDXALjopVrvBU8jkwzhpvrTPGqeCBY8uwDez7fsGolVlKIwSH47KqnT4G08xVDZj40H
 b6arC37usuKi5SybPFn/zDxGNDdQ20yCCTe2Tlc/kO/oFPKDV53LDmOuDHif1q2r2Jpn
 PD357KYJHx3djHXmGLeN2MmKv08cd472hHOrnSfTwkEZY17jQQZykABW6wuwevcciJVm
 7NKC1DOTsZ8Uc7/TN2IdwI/jBKhHunYytermkJwuAEP9TOa0Rpgvpzb/nAHFkyFFA7ab
 GDMg==
X-Gm-Message-State: AOAM532J9tLcvmqKuNfYEA5pWlVm6X5CPQLBZ4jsJam/vKtfdMeRuS9P
 oEHqPjgfnM31LoRTQLe8BCyqZR0q9lajCYwLHPyJgw==
X-Google-Smtp-Source: ABdhPJxETeRM2ihYgYs+VqcMy0CcxsRfBy15uWSHdBh/N67v7tLGu0+T22OZ+o5BBaiti9W4HKnBtyCmOQ4UYzxDOf0=
X-Received: by 2002:a67:7902:: with SMTP id u2mr2168763vsc.41.1607076553211;
 Fri, 04 Dec 2020 02:09:13 -0800 (PST)
MIME-Version: 1.0
References: <CAKMK7uG3JbUuaJ3UUTHgeYCKnD9+n_bbeX=xka9o+TLJHwHJZQ@mail.gmail.com>
 <1607057617-145-1-git-send-email-jpark37@lagfreegames.com>
 <1607057617-145-2-git-send-email-jpark37@lagfreegames.com>
 <kg-gEiynWjY827eEdQ93-QfPdC-z3Odes93NaWXaEts4z4kNu8I5xffAec3LDWfjN5_iUGYrL2ZOP8t597Y8pkEKdxgmC0c8OGzGHuTAgPM=@emersion.fr>
 <CABjik9cos_qa-jS2MO0iYPmf7qhuwKRKaKSqeGdhNZoHoQtOkQ@mail.gmail.com>
In-Reply-To: <CABjik9cos_qa-jS2MO0iYPmf7qhuwKRKaKSqeGdhNZoHoQtOkQ@mail.gmail.com>
From: James Park <james.park@lagfreegames.com>
Date: Fri, 4 Dec 2020 02:08:24 -0800
Message-ID: <CABjik9cWPVFXG6ctb=j3L296fB9xXYQK9JiN29wWLTVmvDsYFw@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1761229225=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1761229225==
Content-Type: multipart/alternative; boundary="00000000000014cbd105b5a0ab8e"

--00000000000014cbd105b5a0ab8e
Content-Type: text/plain; charset="UTF-8"

I suppose I should do this to avoid fighting with <linux/types.h>

#ifdef DRM_FOURCC_STANDALONE
#if defined(__linux__)
#include <linux/types.h>
#else
#include <stdint.h>
typedef uint32_t __u32;
typedef uint64_t __u64;
#endif
#else
#include "drm.h"
#endif

I'll wait for more feedback before updating the patch though.

On Fri, Dec 4, 2020 at 1:47 AM James Park <james.park@lagfreegames.com>
wrote:

> The typedefs might also conflict on Linux if DRM_FOURCC_STANDALONE is
> enabled with whatever LInux declared __u32/__u64 as, but I think the
> implication is that once DRM_FOURCC_STANDALONE has been declared, that's
> kind of a promise not to include drm.h.
>
> I'm fine with this, but I'm not married to it if someone has a problem
> where they want to define DRM_FOURCC_STANDALONE, but also can't avoid
> including drm.h for some reason.
>
> On Fri, Dec 4, 2020 at 12:53 AM Simon Ser <contact@emersion.fr> wrote:
>
>> On Friday, December 4, 2020 5:53 AM, James Park <jpark37@lagfreegames.com>
>> wrote:
>>
>> > +#ifdef DRM_FOURCC_STANDALONE
>> > +#include <stdint.h>
>> >
>> > +typedef uint32_t __u32;
>> > +typedef uint64_t __u64;
>> > +#else
>> > #include "drm.h"
>> > +#endif
>>
>> C11 allows duplicate typedefs, but older versions of the standard
>> don't AFAIK. If this is a concern, a solution would be to guard the
>> typedefs.
>>
>

--00000000000014cbd105b5a0ab8e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I suppose I should do this to avoid fighting with &lt;linu=
x/types.h&gt;<div><br></div><div>#ifdef DRM_FOURCC_STANDALONE<br>#if define=
d(__linux__)</div><div>#include &lt;linux/types.h&gt;<br></div><div>#else<b=
r>#include &lt;stdint.h&gt;<br>typedef uint32_t __u32;<br>typedef uint64_t =
__u64;</div><div>#endif<br>#else<br>#include &quot;drm.h&quot;<br>#endif<br=
></div><div><br></div><div>I&#39;ll wait for more feedback before updating =
the patch though.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Fri, Dec 4, 2020 at 1:47 AM James Park &lt;<a hre=
f=3D"mailto:james.park@lagfreegames.com">james.park@lagfreegames.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr">The typedefs might also conflict on Linux if DRM_FOURCC_STANDALON=
E is enabled with whatever LInux declared __u32/__u64 as, but I think the i=
mplication is that once DRM_FOURCC_STANDALONE has been declared, that&#39;s=
 kind of a promise not to include drm.h.<br><div><br></div><div>I&#39;m fin=
e with=C2=A0this, but I&#39;m not married to it if someone has a problem wh=
ere they want to define DRM_FOURCC_STANDALONE, but also can&#39;t avoid inc=
luding drm.h for some reason.</div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 4, 2020 at 12:53 AM Simon Se=
r &lt;<a href=3D"mailto:contact@emersion.fr" target=3D"_blank">contact@emer=
sion.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Friday, December 4, 2020 5:53 AM, James Park &lt;<a href=3D"mailt=
o:jpark37@lagfreegames.com" target=3D"_blank">jpark37@lagfreegames.com</a>&=
gt; wrote:<br>
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
</blockquote></div>

--00000000000014cbd105b5a0ab8e--

--===============1761229225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1761229225==--
