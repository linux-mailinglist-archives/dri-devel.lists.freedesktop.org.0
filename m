Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC60963161
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:02:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A074898A3;
	Tue,  9 Jul 2019 07:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A798935A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 23:30:10 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id f9so18897502wre.12
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 16:30:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qzjDhcxeEToT3yZiM8Zy8MizazxKaWl9Nv1zA5ati/Q=;
 b=XdV8DbSHv+/X4PR33LO74yVikS+DOx5dFzOjQJQQWBLsGENf7N8hACuRwTVHP89c7p
 jHRj0ChKZIqVUyg7i9Y18rbVfn8Y1eahjleCJXrvlwqGyTFTP+/O18Xqm1qOdZt+LhD3
 YUPmTWEZ0ZBYSYItgtxyBtyRlWr09i5UlDNVH1koERAlKLmRB0k3FsnLP1zURLZ1mfnA
 N12w88i+EmGz0Fqs/EQ/W/mzbWmCpMhBa+sxVZmRBl0bOOw8uO7wry4zb+JnD8FJhKn7
 TKKJjdEIae1KeDIDOsvWp8PJPQFCh0kuxGcCrnUBtfjNMJ/jK3h4jb4R8taMmzQNAa1d
 jQqw==
X-Gm-Message-State: APjAAAX6obS/H+x3vQjWMGiPASmGXHHloF7LLQuzCha3R/0nwfH4nu5c
 3v87QF0f+HMdcbMxB9bpcxblLoTE7ChKZ08nTmYu
X-Google-Smtp-Source: APXvYqxGUTEBfLOYYBmqkW9Y3gx856YMuwvyw6A0hzZzCwCPtHxlkAMAZUHZelyyYH7vVuf2EXU3s+RYMrnOp0PzyQU=
X-Received: by 2002:a5d:518c:: with SMTP id k12mr10567419wrv.116.1562628608790; 
 Mon, 08 Jul 2019 16:30:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190704003615.204860-1-brendanhiggins@google.com>
 <20190704003615.204860-19-brendanhiggins@google.com>
 <20190705204810.GE19023@42.do-not-panic.com>
 <CAFd5g44j7ECQorYLnDQadAaj+yBki98kFjmjejn+3W4eHtqGDA@mail.gmail.com>
In-Reply-To: <CAFd5g44j7ECQorYLnDQadAaj+yBki98kFjmjejn+3W4eHtqGDA@mail.gmail.com>
From: Iurii Zaikin <yzaikin@google.com>
Date: Mon, 8 Jul 2019 16:29:32 -0700
Message-ID: <CAAXuY3q1==RvAiw+gw5kfFJmjdR9JEUnnxou4Sv0POd88aD41w@mail.gmail.com>
Subject: Re: [PATCH v6 18/18] MAINTAINERS: add proc sysctl KUnit test to PROC
 SYSCTL section
To: Brendan Higgins <brendanhiggins@google.com>
X-Mailman-Approved-At: Tue, 09 Jul 2019 07:01:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=qzjDhcxeEToT3yZiM8Zy8MizazxKaWl9Nv1zA5ati/Q=;
 b=MO5bfPAlo2164tEXOEvoEn31sXFfbxysl8zxg0iDgMtpjB+0Man83rHGrqNJFHU/M4
 k1VmfMxXC0K0GeeM72z0/h9spzCqHd6JkY7mNOgPhYwT4Ko502WKF0znu9jU7i5WnqKn
 ASJUxYwvToF4PvX50xXpcvENyfCKZO/7Bc9zX7/vbUN+GtdRNRzDbnkKEh/Pc8zAscXE
 myH5ic2SM34lM7iHSzlnqQHRVNWjCXbBB3hAZOU2sqZZIGIXVcmAmdDMdw9fXi3IK3nG
 /IzgEZtID5c8nBaWttjeJKuLM+LyFmF2x00q4HCwqsoxT09uVeXtFdDZ5zrLcIHOq7ZW
 0gfw==
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
Cc: Petr Mladek <pmladek@suse.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 shuah <shuah@kernel.org>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Frank Rowand <frowand.list@gmail.com>, Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, "Bird,
 Timothy" <Tim.Bird@sony.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Julia Lawall <julia.lawall@lip6.fr>,
 Josh Poimboeuf <jpoimboe@redhat.com>, kunit-dev@googlegroups.com,
 Theodore Ts'o <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 Stephen Boyd <sboyd@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Kevin Hilman <khilman@baylibre.com>
Content-Type: multipart/mixed; boundary="===============1262615689=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1262615689==
Content-Type: multipart/alternative; boundary="000000000000250521058d33d3a3"

--000000000000250521058d33d3a3
Content-Type: text/plain; charset="UTF-8"

I'm in.

On Mon, Jul 8, 2019 at 4:16 PM Brendan Higgins <brendanhiggins@google.com>
wrote:

> CC'ing Iurii Zaikin
>
> On Fri, Jul 5, 2019 at 1:48 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
> >
> > On Wed, Jul 03, 2019 at 05:36:15PM -0700, Brendan Higgins wrote:
> > > Add entry for the new proc sysctl KUnit test to the PROC SYSCTL
> section.
> > >
> > > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
> > > Acked-by: Luis Chamberlain <mcgrof@kernel.org>
> >
> > Come to think of it, I'd welcome Iurii to be added as a maintainer,
> > with the hope Iurii would be up to review only the kunit changes. Of
> > course if Iurii would be up to also help review future proc changes,
> > even better. 3 pair of eyeballs is better than 2 pairs.
>
> What do you think, Iurii?
>

--000000000000250521058d33d3a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m in.</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Jul 8, 2019 at 4:16 PM Brendan Higgin=
s &lt;<a href=3D"mailto:brendanhiggins@google.com">brendanhiggins@google.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>CC&#39;ing Iurii Zaikin<br>
<br>
On Fri, Jul 5, 2019 at 1:48 PM Luis Chamberlain &lt;<a href=3D"mailto:mcgro=
f@kernel.org" target=3D"_blank">mcgrof@kernel.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Wed, Jul 03, 2019 at 05:36:15PM -0700, Brendan Higgins wrote:<br>
&gt; &gt; Add entry for the new proc sysctl KUnit test to the PROC SYSCTL s=
ection.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Brendan Higgins &lt;<a href=3D"mailto:brendanhiggi=
ns@google.com" target=3D"_blank">brendanhiggins@google.com</a>&gt;<br>
&gt; &gt; Reviewed-by: Greg Kroah-Hartman &lt;<a href=3D"mailto:gregkh@linu=
xfoundation.org" target=3D"_blank">gregkh@linuxfoundation.org</a>&gt;<br>
&gt; &gt; Reviewed-by: Logan Gunthorpe &lt;<a href=3D"mailto:logang@deltate=
e.com" target=3D"_blank">logang@deltatee.com</a>&gt;<br>
&gt; &gt; Acked-by: Luis Chamberlain &lt;<a href=3D"mailto:mcgrof@kernel.or=
g" target=3D"_blank">mcgrof@kernel.org</a>&gt;<br>
&gt;<br>
&gt; Come to think of it, I&#39;d welcome Iurii to be added as a maintainer=
,<br>
&gt; with the hope Iurii would be up to review only the kunit changes. Of<b=
r>
&gt; course if Iurii would be up to also help review future proc changes,<b=
r>
&gt; even better. 3 pair of eyeballs is better than 2 pairs.<br>
<br>
What do you think, Iurii?<br>
</blockquote></div>

--000000000000250521058d33d3a3--

--===============1262615689==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1262615689==--
