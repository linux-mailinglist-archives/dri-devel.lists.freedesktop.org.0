Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAE13DC380
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jul 2021 07:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D4DB6E529;
	Sat, 31 Jul 2021 05:24:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401E96E529
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 05:24:55 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id yk17so12988333ejb.11
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 22:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YEgCm4JhlnACGjsReq3911tZZqqK95oTT5L5S4irUGQ=;
 b=M54my0VJWrS0MlMjR87qIN1RYTpJjO8jYp6mKyZkdLsj71baqlteoRCEHRJi5ak6Zu
 B5UGunJqrC/mXzSvdbZ3fvxo+j8TLNHiCiMUncLmd2+nfZW6DSTEGLSqYerMemy7LhLZ
 hbQHixddvCiLbVYbbJl+3kUwKDGFO13d8JU1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YEgCm4JhlnACGjsReq3911tZZqqK95oTT5L5S4irUGQ=;
 b=o3ipsF8/r8bNFHn8KPvVmIzH8IMXjSSlhe7G6RSmBV/OG2Wt1bArSJs56HP+RyOA/T
 MTIMcaP4t96bODQ3v3biyuKe8BXCJWNCpzML19sdtJjtOJ7Ji4tQY/XRBatJHPWDhOWd
 zWJxsnEnGBpc6ckRC5Y3al3ObUddDABwkTAMeniPP6T3+521J3fJP+scxlL/lMBGJiJQ
 uW3C95hgZDh+0xF+Kppd5rNSMv8HI13IB+IZ8SGEkTTJ0NXaz5SYv5JUUqGujqSmMUER
 xVQumGEveQMMLj1Rb15I0KnQN2QGlSUJqcNcdK6YYsiBzIz4lyYoKRQWOpV0e1AueZjK
 T0dQ==
X-Gm-Message-State: AOAM53099RE+XSouRizU9mav6Gjc44f656+x/IgWeVzX+iwiL2n2zOgB
 bfTDDbzRW8FZNEfImHtlj8hGTkVZEIusuxBQBHT/jA==
X-Google-Smtp-Source: ABdhPJxtIS+zmTEfxuD7bFYYmeU5ZkHWCRUgK+kE0TWknFcva3oKkMVhWBpHc0vj39F6/spj1aqgdR5jvqFJ5t1BozQ=
X-Received: by 2002:a17:906:dfe5:: with SMTP id
 lc5mr5992437ejc.20.1627709093865; 
 Fri, 30 Jul 2021 22:24:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-5-keescook@chromium.org>
 <41183a98-bdb9-4ad6-7eab-5a7292a6df84@rasmusvillemoes.dk>
 <202107281456.1A3A5C18@keescook>
 <1d9a2e6df2a9a35b2cdd50a9a68cac5991e7e5f0.camel@intel.com>
 <202107301952.B484563@keescook>
In-Reply-To: <202107301952.B484563@keescook>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Date: Sat, 31 Jul 2021 07:24:44 +0200
Message-ID: <CAKwiHFheDv2pwsm6Fa+-KnOFyvk7bfZQjb2BQ-CSwH61gxgVYg@mail.gmail.com>
Subject: Re: [PATCH 04/64] stddef: Introduce struct_group() helper macro
To: Kees Cook <keescook@chromium.org>
Cc: "Williams, Dan J" <dan.j.williams@intel.com>, keithpac@amazon.com, 
 clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org, 
 akpm@linux-foundation.org, gregkh@linuxfoundation.org, 
 dri-devel@lists.freedesktop.org, linux-cxl@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, linux-hardening@vger.kernel.org, 
 gustavoars@kernel.org, linux-staging@lists.linux.dev, 
 linux-block@vger.kernel.org
Content-Type: multipart/alternative; boundary="00000000000056806b05c8648e84"
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

--00000000000056806b05c8648e84
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 31, 2021, 04:59 Kees Cook <keescook@chromium.org> wrote:

> On Fri, Jul 30, 2021 at 10:19:20PM +0000, Williams, Dan J wrote:
> > On Wed, 2021-07-28 at 14:59 -0700, Kees Cook wrote:
>
> >  /**
> >   * struct_group(NAME, MEMBERS)
> >   *
> > @@ -67,7 +73,10 @@ enum {
> >   * @NAME: The name of the mirrored sub-struct
> >   * @MEMBERS: The member declarations for the mirrored structs
> >   */
> > -#define struct_group(NAME, MEMBERS)    \
> > +#define struct_group(NAME, MEMBERS...) \
> >         struct_group_attr(NAME, /* no attrs */, MEMBERS)
> >
> > +#define struct_group_typed(TYPE, NAME, MEMBERS...) \
> > +       struct_group_attr_typed(TYPE, NAME, /* no attrs */, MEMBERS)
> > +
> >  #endif
>
> Awesome! My instinct is to expose the resulting API as:
>
> __struct_group(type, name, attrs, members...)
>
> struct_group(name, members...)
> struct_group_attr(name, attrs, members...)
> struct_group_typed(type, name, members...)
>

Bikeshed: can we use proper nomenclature please. s/type/tag/,
s/typed/tagged.

Rasmus

--00000000000056806b05c8648e84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Sat, Jul 31, 2021, 04:59 Kees Cook &lt;<a href=3D"mailto:ke=
escook@chromium.org">keescook@chromium.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">On Fri, Jul 30, 2021 at 10:19:20PM +0000, Williams, =
Dan J wrote:<br>
&gt; On Wed, 2021-07-28 at 14:59 -0700, Kees Cook wrote:<br><br>
&gt;=C2=A0 /**<br>
&gt;=C2=A0 =C2=A0* struct_group(NAME, MEMBERS)<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; @@ -67,7 +73,10 @@ enum {<br>
&gt;=C2=A0 =C2=A0* @NAME: The name of the mirrored sub-struct<br>
&gt;=C2=A0 =C2=A0* @MEMBERS: The member declarations for the mirrored struc=
ts<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt; -#define struct_group(NAME, MEMBERS)=C2=A0 =C2=A0 \<br>
&gt; +#define struct_group(NAME, MEMBERS...) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct_group_attr(NAME, /* no attrs *=
/, MEMBERS)<br>
&gt;=C2=A0 <br>
&gt; +#define struct_group_typed(TYPE, NAME, MEMBERS...) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct_group_attr_typed(TYPE, NAME, /* no =
attrs */, MEMBERS)<br>
&gt; +<br>
&gt;=C2=A0 #endif<br>
<br>
Awesome! My instinct is to expose the resulting API as:<br>
<br>
__struct_group(type, name, attrs, members...)<br>
<br>
struct_group(name, members...)<br>
struct_group_attr(name, attrs, members...)<br>
struct_group_typed(type, name, members...)<br></blockquote></div></div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Bikeshed: can we use proper nomen=
clature please. s/type/tag/, s/typed/tagged.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">Rasmus</div></div>

--00000000000056806b05c8648e84--
