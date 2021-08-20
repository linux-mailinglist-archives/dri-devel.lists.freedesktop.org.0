Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DA33F2EB9
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 17:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 569726EAA4;
	Fri, 20 Aug 2021 15:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D43936EAA4
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 15:20:09 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id i9so21295510lfg.10
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 08:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jArOH9DWJtEL7rGhDNvTMieQo+4wLtaclY4qBgWzUME=;
 b=b2X4xbCiJ+FVIxapM+IhY5nMtojqEJ3bvRER9uqdFu9TeeMnkoFuWzlcer078NJHI/
 d/6KUacpzgleF0WQG/DGvw/osGWBA9t9N95dvaptFmbI1+pwIeDdaqf05mX63W9HKWX0
 O2pZ4Lr8ibKx7bjK86MU9S92WdW0H67Gq18P0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jArOH9DWJtEL7rGhDNvTMieQo+4wLtaclY4qBgWzUME=;
 b=PMfAKEMGvxll1XKVXfSQyhkcyEJvIBd3mudaELXvtKxplA8saGBWMfVFKoobloU0V5
 h/b9kWFt3f5Bgqk18UE19L4P4/N8ZmuDVxbL0oiPf3K3/nO3ieHKdWDzAtYGJ+eL7cTP
 taEMNbxo3b/hSP1zb7a0v0hhTHSU9VMibIqc+OIoZrqr6WUhXmEp2Vgvb1e4umnchq4D
 tjMrvR58fqxquDaCN2Fy91Ycj6ylKoFkT55pDFrSTNm2GGM8zFGZHPF0D9JYYYoUZa1L
 FAlnNVvFVMJFPmmq4WBQE04urUReJ5XeG5xL6bPzT6sQO94D9qWt1KetaTgvbXUsJD+b
 KH8w==
X-Gm-Message-State: AOAM532xmMVpwzH2mS72PwvVDtxfgCqyRZ0rfX8GtpWEqFj2e/q313ls
 7i7T9tWU+mng/QY9QWAame4jAzSbFA8r/iR3eMXAlg==
X-Google-Smtp-Source: ABdhPJw7SEiRa5rNUiisUlbHbfTj5wq0b3L76CsxPaRW25uzc53UKbB4StUVR91L0dgXLUYh+8t9yWUAeYsJb26fK/0=
X-Received: by 2002:ac2:5d4a:: with SMTP id w10mr15468565lfd.529.1629472808224; 
 Fri, 20 Aug 2021 08:20:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210818060533.3569517-1-keescook@chromium.org>
 <20210818060533.3569517-23-keescook@chromium.org>
 <nycvar.YFH.7.76.2108201501340.15313@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2108201501340.15313@cbobk.fhfr.pm>
From: Kees Cook <keescook@chromium.org>
Date: Fri, 20 Aug 2021 08:19:55 -0700
Message-ID: <CAJr-aD=QOc=78Dn0kQwDfuv=uW7WuWReLVr=vFBXRhHDkth0BQ@mail.gmail.com>
Subject: Re: [PATCH v2 22/63] HID: cp2112: Use struct_group() for memcpy()
 region
To: Jiri Kosina <jikos@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-input <linux-input@vger.kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andrew Morton <akpm@linux-foundation.org>,
 linux-wireless <linux-wireless@vger.kernel.org>, 
 Network Development <netdev@vger.kernel.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linux-staging@lists.linux.dev, linux-block <linux-block@vger.kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, 
 clang-built-linux <clang-built-linux@googlegroups.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-hardening@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000e7de6205c9ff337d"
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

--000000000000e7de6205c9ff337d
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 20, 2021, 6:01 AM Jiri Kosina <jikos@kernel.org> wrote:

> On Tue, 17 Aug 2021, Kees Cook wrote:
>
> > In preparation for FORTIFY_SOURCE performing compile-time and run-time
> > field bounds checking for memcpy(), memmove(), and memset(), avoid
> > intentionally writing across neighboring fields.
> >
> > Use struct_group() in struct cp2112_string_report around members report,
> > length, type, and string, so they can be referenced together. This will
> > allow memcpy() and sizeof() to more easily reason about sizes, improve
> > readability, and avoid future warnings about writing beyond the end of
> > report.
> >
> > "pahole" shows no size nor member offset changes to struct
> > cp2112_string_report.  "objdump -d" shows no meaningful object
> > code changes (i.e. only source line number induced differences.)
> >
> > Cc: Jiri Kosina <jikos@kernel.org>
> > Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > Cc: linux-input@vger.kernel.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
>
> Applied, thanks.
>

Same for this one: it's part of the larger series.

-Kees

>

--000000000000e7de6205c9ff337d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Aug 20, 2021, 6:01 AM Jiri Kosina &lt;<a href=
=3D"mailto:jikos@kernel.org">jikos@kernel.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">On Tue, 17 Aug 2021, Kees Cook wrote:<br>
<br>
&gt; In preparation for FORTIFY_SOURCE performing compile-time and run-time=
<br>
&gt; field bounds checking for memcpy(), memmove(), and memset(), avoid<br>
&gt; intentionally writing across neighboring fields.<br>
&gt; <br>
&gt; Use struct_group() in struct cp2112_string_report around members repor=
t,<br>
&gt; length, type, and string, so they can be referenced together. This wil=
l<br>
&gt; allow memcpy() and sizeof() to more easily reason about sizes, improve=
<br>
&gt; readability, and avoid future warnings about writing beyond the end of=
<br>
&gt; report.<br>
&gt; <br>
&gt; &quot;pahole&quot; shows no size nor member offset changes to struct<b=
r>
&gt; cp2112_string_report.=C2=A0 &quot;objdump -d&quot; shows no meaningful=
 object<br>
&gt; code changes (i.e. only source line number induced differences.)<br>
&gt; <br>
&gt; Cc: Jiri Kosina &lt;<a href=3D"mailto:jikos@kernel.org" target=3D"_bla=
nk" rel=3D"noreferrer">jikos@kernel.org</a>&gt;<br>
&gt; Cc: Benjamin Tissoires &lt;<a href=3D"mailto:benjamin.tissoires@redhat=
.com" target=3D"_blank" rel=3D"noreferrer">benjamin.tissoires@redhat.com</a=
>&gt;<br>
&gt; Cc: <a href=3D"mailto:linux-input@vger.kernel.org" target=3D"_blank" r=
el=3D"noreferrer">linux-input@vger.kernel.org</a><br>
&gt; Signed-off-by: Kees Cook &lt;<a href=3D"mailto:keescook@chromium.org" =
target=3D"_blank" rel=3D"noreferrer">keescook@chromium.org</a>&gt;<br>
<br>
Applied, thanks.<br></blockquote></div></div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Same for this one: it&#39;s part of the larger series.</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">-Kees</div><div dir=3D"auto"=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000e7de6205c9ff337d--
