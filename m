Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAB73F2EB7
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 17:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7B789BA3;
	Fri, 20 Aug 2021 15:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511FD89BA3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 15:19:22 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id g20so2708753lfr.7
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 08:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yK+7O/v/bijYwmV3v46J0ihfKacLILS/RW0Ybl37+a4=;
 b=Fz2B8iu0vEzn8R/laN8dDgANiruP0ZOs5BfcAftOBlX/aQaR08ei0OSh4qVNLs6mmq
 cIezlIYnyWU8iNhLR91ilJmL6xc6LrWF10eLY6gldOB6I9rm48OHdbWrxX+iA5E+C6zx
 cPsOKE59lnlb8W26GuNm8CkF5rhyQNAgibytw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yK+7O/v/bijYwmV3v46J0ihfKacLILS/RW0Ybl37+a4=;
 b=O5RGTYJ2jFJ8wXWX/zCkn0na6KGD7UHS04Stdw58Eu9fTH49N8+Xbnfk63JanYlDDG
 WWj2Ko7EvKbhUSgCbHfJbcs+RJe3rznxyw+MBQTIU7DoCktDUUS/+oFUXxjnHey6CEaO
 fKQJnhsz1Jn3rm+vWlyPqN+K1DFsWqra2+5C55tR6VhijrIWuX12lA6b0BA1c+opmCd8
 WU8JwIt72WDlXUMiiwdMuRuEZFGFCa0f5+fIJUEc0fwfHywTUUphihe+tnZMYJ3pNZDZ
 weyac101Fbi83yWmTi56r9jnAe5WdXN/2+tssAH1eEDf0IuWC4xfBJEDE233f7+dOZOJ
 wGGA==
X-Gm-Message-State: AOAM531HqWn63TUKgF77slLQA4JDwdQwNUToUP427EhG4z5qTGj/2ohM
 7r3FDckYaFd3dOfS5NLwg8iVbV1aCfKZqF0XBWZHTg==
X-Google-Smtp-Source: ABdhPJzCSNO11J/fl5UjSAJ4GE3nEXhhw7CL/GMJYlDLWta4F5DeQGSEd3ngD8AA3bmQJFzlYF/w4CUL9Ugzxaj6LeA=
X-Received: by 2002:ac2:5dd5:: with SMTP id x21mr7035638lfq.357.1629472760644; 
 Fri, 20 Aug 2021 08:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210818060533.3569517-1-keescook@chromium.org>
 <20210818060533.3569517-56-keescook@chromium.org>
 <nycvar.YFH.7.76.2108201501510.15313@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2108201501510.15313@cbobk.fhfr.pm>
From: Kees Cook <keescook@chromium.org>
Date: Fri, 20 Aug 2021 08:19:08 -0700
Message-ID: <CAJr-aD=6-g7VRw2Hw0dhs+RrtA=Tago5r6Dukfw_gGPB0YYKOQ@mail.gmail.com>
Subject: Re: [PATCH v2 55/63] HID: roccat: Use struct_group() to zero
 kone_mouse_event
To: Jiri Kosina <jikos@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
 Stefan Achatz <erazor_de@users.sourceforge.net>, 
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
Content-Type: multipart/alternative; boundary="00000000000011db8005c9ff3170"
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

--00000000000011db8005c9ff3170
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 20, 2021, 6:02 AM Jiri Kosina <jikos@kernel.org> wrote:

> On Tue, 17 Aug 2021, Kees Cook wrote:
>
> > In preparation for FORTIFY_SOURCE performing compile-time and run-time
> > field bounds checking for memset(), avoid intentionally writing across
> > neighboring fields.
> >
> > Add struct_group() to mark region of struct kone_mouse_event that should
> > be initialized to zero.
> >
> > Cc: Stefan Achatz <erazor_de@users.sourceforge.net>
> > Cc: Jiri Kosina <jikos@kernel.org>
> > Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > Cc: linux-input@vger.kernel.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
>
> Applied, thank you Kees.
>

Eek! No, this will break the build: struct_group() is not yet in the tree.
I can carry this with an Ack, etc.

-Kees

--00000000000011db8005c9ff3170
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Aug 20, 2021, 6:02 AM Jiri Kosina &lt;<a href=
=3D"mailto:jikos@kernel.org">jikos@kernel.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">On Tue, 17 Aug 2021, Kees Cook wrote:<br>
<br>
&gt; In preparation for FORTIFY_SOURCE performing compile-time and run-time=
<br>
&gt; field bounds checking for memset(), avoid intentionally writing across=
<br>
&gt; neighboring fields.<br>
&gt; <br>
&gt; Add struct_group() to mark region of struct kone_mouse_event that shou=
ld<br>
&gt; be initialized to zero.<br>
&gt; <br>
&gt; Cc: Stefan Achatz &lt;<a href=3D"mailto:erazor_de@users.sourceforge.ne=
t" target=3D"_blank" rel=3D"noreferrer">erazor_de@users.sourceforge.net</a>=
&gt;<br>
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
Applied, thank you Kees.<br></blockquote></div></div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Eek! No, this will break the build: struct_group() =
is not yet in the tree. I can carry this with an Ack, etc.</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">-Kees</div></div>

--00000000000011db8005c9ff3170--
