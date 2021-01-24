Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C288301EDB
	for <lists+dri-devel@lfdr.de>; Sun, 24 Jan 2021 22:05:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F35E89B5F;
	Sun, 24 Jan 2021 21:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E62389B5F
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jan 2021 21:05:07 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id n6so12842454edt.10
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jan 2021 13:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BnUhBLv1IA982w4SwKSAduxtgTp4wmMfVIvf/7rjiNs=;
 b=tcypiV60nekP1pKJlnxHuGT4GnLx0FxY00oxhegwFtEFS8CbMLBy4082YtpsDVSxAH
 RmALXc/J8lUZa561k9x1r2MOBpXHecW7us0wHONfbsEoua/Ffiz/hNn/qh0GLdv203Jr
 RExhbG/I4ufB8AKBvTGJCA1jtHtPnrRbHik2i7LruU1jMeJ4jAYKdSmUb+zcBWQzJJQi
 +s9denxDOYEmH2874PEXh3GwRvAncmt6QvtDA9w35sye+lOk+L+/uQvp4jkvbJ5qqgdv
 CVH2ZAS1j8xyjnd4/V+58fboANgYkm/2VlTQ/bS01eQl7XBttIu/rAuSD9c/N0eQOyg1
 vL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BnUhBLv1IA982w4SwKSAduxtgTp4wmMfVIvf/7rjiNs=;
 b=WrjZszfKxkZ4Z0X3UReFQIjn+xAPTWXWdWZICzZ7vIiwUtXwbjuMaaTGsUNXNHB66q
 chU0FLjIHPQmoTmefreRiARiKyGU++WlbfbDY6bFXoXy8akVWvC7ggfiGYtZsDPfiO3Y
 75dW8NLS1vYcc9OhZWdFbPwkvX7gfWjrecJaJZlucf+0FJpHFtUnCMxXo2guWe+yeMK+
 20ut1/JE41qqqM+Kwo5QDu7nw93AnRY2alB0OJkvaa46Iaxb52hTveXmxVrm99oQZfKb
 ENnsq/lD8slpGGR2FhG9yX6vWLRmsagoK9Fkb/8G72TSLqfNO1zTsD/bc7M7AZmMKKqK
 Lf/A==
X-Gm-Message-State: AOAM53200U5i6k1VZelixxovKjZxHE0VSgZ7+EatJb9uYs0zYkzFqmyx
 +VNZObL5RHxQ22kvw0X0WHsalHlEO2geidYex+Y=
X-Google-Smtp-Source: ABdhPJwJGT0fwV9E0ArsHCYBLWky94J+d1I4fQnwgtE9F1ZNVYrmbxD1yQN7i+kcs8VNN8K5ReN1+yG4tW2J76a1bnY=
X-Received: by 2002:a50:fd19:: with SMTP id i25mr1095103eds.386.1611522305769; 
 Sun, 24 Jan 2021 13:05:05 -0800 (PST)
MIME-Version: 1.0
References: <20210124044010.18678-1-mario.kleiner.de@gmail.com>
 <86DkveYU9PqmKT4KfDgHvFG_SytoDc4EyfmehALDIJBt7oH3Arn8O97o-pQ3yRU-kfHi-RuwA9zdI-Kz1aZUQBuOSnqmz1GdrRUNPNRsEu4=@emersion.fr>
 <CAEsyxyj-dHAk0qkkpOsycqfpPi_FW5zh_58hs1gi+6h1M_b8-Q@mail.gmail.com>
 <yEq1_Ipkzm_vP4BD6cKlonRVfMbfGXrlvxOG4XDkk_wg1UkPCdLj95I8pknonGjf2Bs1zYeErr1WXerrQjprE3k1vswj3E2Nzq-imF58ytM=@emersion.fr>
In-Reply-To: <yEq1_Ipkzm_vP4BD6cKlonRVfMbfGXrlvxOG4XDkk_wg1UkPCdLj95I8pknonGjf2Bs1zYeErr1WXerrQjprE3k1vswj3E2Nzq-imF58ytM=@emersion.fr>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Sun, 24 Jan 2021 22:04:54 +0100
Message-ID: <CAEsyxyhXhJohDYuDDLoQeg-QqhnWQ953GRO0Kf6Puj=f_NkU4w@mail.gmail.com>
Subject: Re: [PATCH] drm: Fix HDMI_STATIC_METADATA_TYPE1 constant.
To: Simon Ser <contact@emersion.fr>
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0374914918=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0374914918==
Content-Type: multipart/alternative; boundary="00000000000095433305b9abc60d"

--00000000000095433305b9abc60d
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 24, 2021 at 9:24 PM Simon Ser <contact@emersion.fr> wrote:

> On Sunday, January 24th, 2021 at 9:10 PM, Mario Kleiner <
> mario.kleiner.de@gmail.com> wrote:
>
> > But it still needs to be fixed if we want working HDR. I thought
> > libdrm copies the definitions from the kernel periodically, so the
> > fix should propagate?
>
> There will always be user-space that sends 1 instead of 0. This
> shouldn't fail on more recent kernels or it will be a regression.
>

Yes, i know, regressing user-space is bad, but in this very specific case a
"good" one, if ever. At the moment, it wouldn't regress userspace simply
because the kernel doesn't actually check for the correct value in its HDR
metadata handling. But the value itself is sent as HDMI HDR metadata to the
attached HDR display monitor, so if the monitors firmware checks, it will
classify the wrong value of 1 as invalid and disable HDR mode on the
display, which is certainly not what a HDR client application wants. And
future HDR standards which will actually allocate the value 1 to a
different mode of HDR operation will switch to the wrong mode /
misinterpret the sent HDR metadata with hillarious results, which is also
not in the interest of a HDR client application, or a HDR capable
compositor.

Iow. if clients continue to use the wrong value 1 then HDR display will
break in various ways on correctly implemented HDR displays, but in a
mystifying and hard to debug way. The kernel rejecting a wrong setting
explicitly and forcing a bug fix in the client would be a blessing in this
case.

I spent weeks last year, going in circles and hunting ghost bugs related to
HDR because much of the HDR stuff, both drivers and monitor firmware seems
to be in not a great shape. "Less wrong" would be a big step forward.
Especially with the cheaper HDR monitors it is difficult to see when things
go wrong, because we don't have good expectations on how proper HDR should
look and the lower end HDR displays don't help.

-mario

--00000000000095433305b9abc60d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, Jan 24, 2021 at 9:24 PM Simon Ser=
 &lt;<a href=3D"mailto:contact@emersion.fr">contact@emersion.fr</a>&gt; wro=
te:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Sunday, January 24th, 2021 at 9:10 PM, Mario Kleiner &lt;=
<a href=3D"mailto:mario.kleiner.de@gmail.com" target=3D"_blank">mario.klein=
er.de@gmail.com</a>&gt; wrote:<br>
<br>
&gt; But it still needs to be fixed if we want working HDR. I thought<br>
&gt; libdrm copies the definitions from the kernel periodically, so the<br>
&gt; fix should propagate?<br>
<br>
There will always be user-space that sends 1 instead of 0. This<br>
shouldn&#39;t fail on more recent kernels or it will be a regression.<br></=
blockquote><div><br></div><div>Yes, i know, regressing user-space is bad, b=
ut in this very specific case a &quot;good&quot; one, if ever. At the momen=
t, it wouldn&#39;t regress userspace simply because the kernel doesn&#39;t =
actually check for the correct value in its HDR metadata handling. But the =
value itself is sent as HDMI HDR metadata to the attached HDR display monit=
or, so if the monitors firmware checks, it will classify the wrong value of=
 1 as invalid and disable HDR mode on the display, which is certainly not w=
hat a HDR client application wants. And future HDR standards which will act=
ually allocate the value 1 to a different mode of HDR operation will switch=
 to the wrong mode / misinterpret the sent HDR metadata with hillarious res=
ults, which is also not in the interest of a HDR client application, or a H=
DR capable compositor.</div><div><br></div><div>Iow. if clients continue to=
 use the wrong value 1 then HDR display will break in various ways on corre=
ctly implemented HDR displays, but in a mystifying and hard to debug way. T=
he kernel rejecting a wrong setting explicitly and forcing a bug fix in the=
 client would be a blessing in this case.</div><div><br></div><div>I spent =
weeks last year, going in circles and hunting ghost bugs related to HDR bec=
ause much of the HDR stuff, both drivers and monitor firmware seems to be i=
n not a great shape. &quot;Less wrong&quot; would be a big step forward. Es=
pecially with the cheaper HDR monitors it is difficult to see when things g=
o wrong, because we don&#39;t have good expectations on how proper HDR shou=
ld look and the lower end HDR displays don&#39;t help.</div><div><br></div>=
<div>-mario</div><div><br></div></div></div>

--00000000000095433305b9abc60d--

--===============0374914918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0374914918==--
