Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 941BEE13C3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 10:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E196E9B3;
	Wed, 23 Oct 2019 08:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83FE48800B
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 00:15:26 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id c4so3971847lja.11
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 17:15:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LOiG1lHBlmqkkDnKg/r6AuxYdtWjj92CgBtMcfhEoU4=;
 b=BF5JnnNKBGfOVc3YGVNMb+rr+NHlqanlWaOAOqfKOSVH+/xQ1qUnJHw+5od2jTiyVf
 HIqHMpn4i85+BlwW2raVRPWL3NnXyfZGWZ8GIqQf1bz6Z+cu7NQvlxxmJS+GQmCStxpe
 /RR0S522JwxnwllOzAbQfpnCd+fi8iProdbDNVVcTizqicAIHCYIJXayi0FvBp5/WuhX
 yHwppTK4+zDEJGFXTVD7HhyCEgXvAw1XveENxL9HvwRFUlbeDt0AcZMhc3FWB342c1lf
 BEZR2zP6EdPNyDC54oLbMbPKiGWuqqT2P0GWOdfyrxc5pk/RVZ5YY9R0Um3Dfpq9fi3G
 5sYg==
X-Gm-Message-State: APjAAAU/EXIHoyQ2+8K5MB2LTnYjhlM+37e2J4eIlwYhTXPJH3s/YQOB
 cN+QdqoQCi4SuiIwRbp9iXb5B8j+XPdBUUGIbDhDbQ==
X-Google-Smtp-Source: APXvYqzhUk+7CgADTS0dpvEIYlmKTvdCszOKgS0JUg8QihS8pf6mgF3K1gtTxlQC9brYhVbhOm217AnUQr8DddbWByo=
X-Received: by 2002:a2e:9d3:: with SMTP id 202mr17727621ljj.112.1571789724211; 
 Tue, 22 Oct 2019 17:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAL_quvRknSSVvXN3q_Se0hrziw2oTNS3ENNoeHYhvciCRq9Yww@mail.gmail.com>
 <87h84rbile.fsf@intel.com> <20191002102428.zaid63hp6wpd7w34@holly.lan>
 <8736gbbf2b.fsf@intel.com>
 <CAL_quvQkFjkBjJC5wH2t5XmyEq9OKWYSbAv39BJWT1hrKO7j8g@mail.gmail.com>
 <87h84q9pcj.fsf@intel.com>
 <CAL_quvQoWnWqS5OQAqbLcBO-bR9_obr1FBc6f6mA1T00n1DJNQ@mail.gmail.com>
 <CAOw6vbJ7XX8=nrJDENfn2pacf4MqQOkP+x8JV0wbqzoMfLvZWQ@mail.gmail.com>
 <CAL_quvTe_v9Vsbd0u4URitojmD-_VFeaOQ1BBYZ_UGwYWynjVA@mail.gmail.com>
 <87sgo3dasg.fsf@intel.com>
In-Reply-To: <87sgo3dasg.fsf@intel.com>
From: Rajat Jain <rajatja@google.com>
Date: Tue, 22 Oct 2019 17:14:47 -0700
Message-ID: <CACK8Z6FF1CBmti797sYWS51j-8ag-pSL9RJ2r9NDibXk2M=tEQ@mail.gmail.com>
Subject: Re: New sysfs interface for privacy screens
To: Jani Nikula <jani.nikula@linux.intel.com>
X-Mailman-Approved-At: Wed, 23 Oct 2019 08:09:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=LOiG1lHBlmqkkDnKg/r6AuxYdtWjj92CgBtMcfhEoU4=;
 b=I27wD+PnXxUX43+njmN5oraLC/D2IEWjPZ1HcvygF3zx9VaP3uULZdcMj9fUrbsbNV
 PoKuankX3vvUUThZ3xSVh5fg/gB8evyIAk4C1IjOAtyXs1QKimgdSC2TtNNrIb3EeKxW
 wc47amhgBfeSjrFdtrRC9U2PVTSNI2m9YMcnrwYzRVmH17PyIVv98bC0By7T1CcFgDyu
 9m9ZSgfLjJM72tCBQiIBgWao/nHA5J5YM7OPl97D7H06Bivl/qJ4dgNEhYTvPSjCSzLW
 hB22Fa1QcFczK6Iycs7/XbMnxxqxiX3h6gDtogwdAuQpN51M/9GoExoVUW725wAh1jj2
 uUJA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Ross Zwisler <zwisler@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Mat King <mathewk@google.com>,
 Sean Paul <seanpaul@chromium.org>, Jingoo Han <jingoohan1@gmail.com>,
 David Airlie <airlied@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Alexander Schremmer <alex@alexanderweb.de>
Content-Type: multipart/mixed; boundary="===============0350225397=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0350225397==
Content-Type: multipart/alternative; boundary="0000000000002cb1cd059588d03f"

--0000000000002cb1cd059588d03f
Content-Type: text/plain; charset="UTF-8"

Hi Folks,

On Mon, Oct 7, 2019 at 11:13 PM Jani Nikula <jani.nikula@linux.intel.com>
wrote:

> On Mon, 07 Oct 2019, Mat King <mathewk@google.com> wrote:
> > That makes sense; just to confirm can a property be added or removed
> > after the connector is registered?
>
> You need to create the property before registering the drm device. You
> can attach/detach the property later, but I should think you know by the
> time you're registering the connector whether it supports the privacy
> screen or not.
>

I just posted a patch for this here:

https://lkml.org/lkml/2019/10/22/967

Would appreciate review and comments.

Thanks & Best Regards,

Rajat


>
> BR,
> Jani.
>
> --
> Jani Nikula, Intel Open Source Graphics Center
>

--0000000000002cb1cd059588d03f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Folks,</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, Oct 7, 2019 at 11:13 PM Jani Nikula =
&lt;<a href=3D"mailto:jani.nikula@linux.intel.com">jani.nikula@linux.intel.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Mon, 07 Oct 2019, Mat King &lt;<a href=3D"mailto:mathewk@google.com" =
target=3D"_blank">mathewk@google.com</a>&gt; wrote:<br>
&gt; That makes sense; just to confirm can a property be added or removed<b=
r>
&gt; after the connector is registered?<br>
<br>
You need to create the property before registering the drm device. You<br>
can attach/detach the property later, but I should think you know by the<br=
>
time you&#39;re registering the connector whether it supports the privacy<b=
r>
screen or not.<br></blockquote><div><br></div><div>I just posted a patch fo=
r this here:</div><div><br></div><div><a href=3D"https://lkml.org/lkml/2019=
/10/22/967">https://lkml.org/lkml/2019/10/22/967</a><br></div><div><br></di=
v><div></div><div>Would appreciate review and comments.</div><div><br></div=
><div>Thanks &amp; Best Regards,</div><div><br></div><div>Rajat</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
BR,<br>
Jani.<br>
<br>
-- <br>
Jani Nikula, Intel Open Source Graphics Center<br>
</blockquote></div></div>

--0000000000002cb1cd059588d03f--

--===============0350225397==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0350225397==--
