Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EFB74679D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 04:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75CDA10E262;
	Tue,  4 Jul 2023 02:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3553010E25B;
 Tue,  4 Jul 2023 02:34:37 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fbc0981733so49409005e9.3; 
 Mon, 03 Jul 2023 19:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688438075; x=1691030075;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3ZpuRGLQE/bK4mtGNb7SYLUMr+T8sLb7hXLmN8pQrEM=;
 b=hYUpryYzJu2MUnc++hWV/9e+vJ0o9fsRUAJkjJSmEjHpr35s9tw2O6WpxT841fZYmr
 rSNROpyTz+yyRQRVdAIGlrgTzikNGKHuwSS5HVv7aGXCBkmcWsMR2a2rvrC2bLD39bk9
 DrHxUz5u6aaHsRvjiFvkhPSQLlc8tmkGcLwiAzE7r4MEOHVriUG+2rDqRDtQpY+UMR70
 ExETwqjht3OzRq0VDk8y89TciW0Ta3B/FI0nMKOLndIdB4Lw72Qka2ffFZk9kYXvnduZ
 l7Z1qnAcX27Ri2AEAcr4c6/o+UJeA/XNoz3UPSeGhac8m4m1EcL2E+J68J5f8dv0ZE6S
 VwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688438075; x=1691030075;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3ZpuRGLQE/bK4mtGNb7SYLUMr+T8sLb7hXLmN8pQrEM=;
 b=MeDRi3cHhSvLFL8psXjX6Omg+DFjrtc1/l2vkPG4lsEXgIoyVPf09tcGTs3QMUyZQe
 RJK/qbpBU42FfHMZ5qczuj17E7ZbQOdxUlcXk2E4GHtOkbRRJSPOPnfwOAx75c0sUW5J
 ErIp16FKvc/ik9DW8BMsuQXlHpGvPG+WoyvwgaqX45ozhASbeeJ9HEsGQmg2OAdV/qU/
 WToWWuq7wNuZbGcxP8DJjxz/TTxHorBZQtE5z3nFhpBh/OdlY5Sh/qPn0rnRJ21o0XTl
 z1m/3fu+5yDDV6OCOFxFIUag3QewGb4wRZ4hShlKTuMdw9Mo4gPMxU/lav3zmKvwR8nt
 BGpA==
X-Gm-Message-State: AC+VfDx4WSG/M3VV6pPwPeO9xmk6h3FXa1db4s3Y/oogfSN+oPYhzJfa
 U+k7ZeTBH4bBwR6GG/5vUfkek0Y/SmyvBNqTn4g=
X-Google-Smtp-Source: ACHHUZ7Q0aj3sJlNb4F9luFDJcTyHeZA1VyIjNS2iaAgP2GGg+NHs7SvZLxPRKZr6dHFqO5/85bAm7LwNb98p3BGDc0=
X-Received: by 2002:a05:600c:22c3:b0:3fb:a1d0:a882 with SMTP id
 3-20020a05600c22c300b003fba1d0a882mr9218907wmg.20.1688438074831; Mon, 03 Jul
 2023 19:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230627132323.115440-1-andrealmeid@igalia.com>
 <CA+hFU4z1pc=KUVVqyqfXEceUqMXQgh-qUnuB=1nkPELghvQO7w@mail.gmail.com>
 <CADnq5_MNVdtdcWKSz6dgmsjg+kEu8p5FVE+fkw_5BaXeG3QGow@mail.gmail.com>
 <afab1f5a-e581-3416-e2c2-238ea120655b@mailbox.org>
 <CAAxE2A5C96k5ua+r938VA_+w7gHHNTdF3n8LwDb98W0Bf9wCVA@mail.gmail.com>
 <7c1e6df5-1ad4-be3c-b95d-92dc62a8c537@mailbox.org>
In-Reply-To: <7c1e6df5-1ad4-be3c-b95d-92dc62a8c537@mailbox.org>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Mon, 3 Jul 2023 22:34:21 -0400
Message-ID: <CAAxE2A7RGDY4eRC85CsqfszNzyKvMU2MX1wa+3HZ1hgNeAw3cQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] drm/doc: Document DRM device reset expectations
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Type: multipart/alternative; boundary="000000000000acf4ba05ffa01f08"
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, kernel-dev@igalia.com, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000acf4ba05ffa01f08
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 3, 2023, 03:12 Michel D=C3=A4nzer <michel.daenzer@mailbox.org> =
wrote:

> On 6/30/23 22:32, Marek Ol=C5=A1=C3=A1k wrote:
> > On Fri, Jun 30, 2023 at 11:11=E2=80=AFAM Michel D=C3=A4nzer <
> michel.daenzer@mailbox.org <mailto:michel.daenzer@mailbox.org>> wrote:
> >> On 6/30/23 16:59, Alex Deucher wrote:
> >>> On Fri, Jun 30, 2023 at 10:49=E2=80=AFAM Sebastian Wick
> >>> <sebastian.wick@redhat.com <mailto:sebastian.wick@redhat.com>> wrote:
> >>>> On Tue, Jun 27, 2023 at 3:23=E2=80=AFPM Andr=C3=A9 Almeida <andrealm=
eid@igalia.com
> <mailto:andrealmeid@igalia.com>> wrote:
> >>>>>
> >>>>> +Robustness
> >>>>> +----------
> >>>>> +
> >>>>> +The only way to try to keep an application working after a reset i=
s
> if it
> >>>>> +complies with the robustness aspects of the graphical API that it
> is using.
> >>>>> +
> >>>>> +Graphical APIs provide ways to applications to deal with device
> resets. However,
> >>>>> +there is no guarantee that the app will use such features
> correctly, and the
> >>>>> +UMD can implement policies to close the app if it is a repeating
> offender,
> >>>>> +likely in a broken loop. This is done to ensure that it does not
> keep blocking
> >>>>> +the user interface from being correctly displayed. This should be
> done even if
> >>>>> +the app is correct but happens to trigger some bug in the
> hardware/driver.
> >>>>
> >>>> I still don't think it's good to let the kernel arbitrarily kill
> >>>> processes that it thinks are not well-behaved based on some heuristi=
cs
> >>>> and policy.
> >>>>
> >>>> Can't this be outsourced to user space? Expose the information about
> >>>> processes causing a device and let e.g. systemd deal with coming up
> >>>> with a policy and with killing stuff.
> >>>
> >>> I don't think it's the kernel doing the killing, it would be the UMD.
> >>> E.g., if the app is guilty and doesn't support robustness the UMD can
> >>> just call exit().
> >>
> >> It would be safer to just ignore API calls[0], similarly to what is
> done until the application destroys the context with robustness. Calling
> exit() likely results in losing any unsaved work, whereas at least some
> applications might otherwise allow saving the work by other means.
> >
> > That's a terrible idea. Ignoring API calls would be identical to a
> freeze. You might as well disable GPU recovery because the result would b=
e
> the same.
>
> No GPU recovery would affect everything using the GPU, whereas this
> affects only non-robust applications.
>

which is currently the majority.


>
> > - non-robust contexts: call exit(1) immediately, which is the best way
> to recover
>
> That's not the UMD's call to make.
>

That's absolutely the UMD's call to make because that's mandated by the hw
and API design and only driver devs know this, which this thread is a proof
of. The default behavior is to skip all command submission if a non-robust
context is lost, which looks like a freeze. That's required to prevent
infinite hangs from the same context and can be caused by the side effects
of the GPU reset itself, not by the cause of the previous hang. The only
way out of that is killing the process.

Marek


>
> >>     [0] Possibly accompanied by a one-time message to stderr along the
> lines of "GPU reset detected but robustness not enabled in context,
> ignoring OpenGL API calls".
>
>
> --
> Earthling Michel D=C3=A4nzer            |                  https://redhat=
.com
> Libre software enthusiast          |         Mesa and Xwayland developer
>
>

--000000000000acf4ba05ffa01f08
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Jul 3, 2023, 03:12 Michel D=C3=A4nzer &lt;<a h=
ref=3D"mailto:michel.daenzer@mailbox.org">michel.daenzer@mailbox.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">On 6/30/23 22:32, Marek Ol=
=C5=A1=C3=A1k wrote:<br>
&gt; On Fri, Jun 30, 2023 at 11:11=E2=80=AFAM Michel D=C3=A4nzer &lt;<a hre=
f=3D"mailto:michel.daenzer@mailbox.org" target=3D"_blank" rel=3D"noreferrer=
">michel.daenzer@mailbox.org</a> &lt;mailto:<a href=3D"mailto:michel.daenze=
r@mailbox.org" target=3D"_blank" rel=3D"noreferrer">michel.daenzer@mailbox.=
org</a>&gt;&gt; wrote:<br>
&gt;&gt; On 6/30/23 16:59, Alex Deucher wrote:<br>
&gt;&gt;&gt; On Fri, Jun 30, 2023 at 10:49=E2=80=AFAM Sebastian Wick<br>
&gt;&gt;&gt; &lt;<a href=3D"mailto:sebastian.wick@redhat.com" target=3D"_bl=
ank" rel=3D"noreferrer">sebastian.wick@redhat.com</a> &lt;mailto:<a href=3D=
"mailto:sebastian.wick@redhat.com" target=3D"_blank" rel=3D"noreferrer">seb=
astian.wick@redhat.com</a>&gt;&gt; wrote:<br>
&gt;&gt;&gt;&gt; On Tue, Jun 27, 2023 at 3:23=E2=80=AFPM Andr=C3=A9 Almeida=
 &lt;<a href=3D"mailto:andrealmeid@igalia.com" target=3D"_blank" rel=3D"nor=
eferrer">andrealmeid@igalia.com</a> &lt;mailto:<a href=3D"mailto:andrealmei=
d@igalia.com" target=3D"_blank" rel=3D"noreferrer">andrealmeid@igalia.com</=
a>&gt;&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; +Robustness<br>
&gt;&gt;&gt;&gt;&gt; +----------<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +The only way to try to keep an application working af=
ter a reset is if it<br>
&gt;&gt;&gt;&gt;&gt; +complies with the robustness aspects of the graphical=
 API that it is using.<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +Graphical APIs provide ways to applications to deal w=
ith device resets. However,<br>
&gt;&gt;&gt;&gt;&gt; +there is no guarantee that the app will use such feat=
ures correctly, and the<br>
&gt;&gt;&gt;&gt;&gt; +UMD can implement policies to close the app if it is =
a repeating offender,<br>
&gt;&gt;&gt;&gt;&gt; +likely in a broken loop. This is done to ensure that =
it does not keep blocking<br>
&gt;&gt;&gt;&gt;&gt; +the user interface from being correctly displayed. Th=
is should be done even if<br>
&gt;&gt;&gt;&gt;&gt; +the app is correct but happens to trigger some bug in=
 the hardware/driver.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I still don&#39;t think it&#39;s good to let the kernel ar=
bitrarily kill<br>
&gt;&gt;&gt;&gt; processes that it thinks are not well-behaved based on som=
e heuristics<br>
&gt;&gt;&gt;&gt; and policy.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Can&#39;t this be outsourced to user space? Expose the inf=
ormation about<br>
&gt;&gt;&gt;&gt; processes causing a device and let e.g. systemd deal with =
coming up<br>
&gt;&gt;&gt;&gt; with a policy and with killing stuff.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I don&#39;t think it&#39;s the kernel doing the killing, it wo=
uld be the UMD.<br>
&gt;&gt;&gt; E.g., if the app is guilty and doesn&#39;t support robustness =
the UMD can<br>
&gt;&gt;&gt; just call exit().<br>
&gt;&gt;<br>
&gt;&gt; It would be safer to just ignore API calls[0], similarly to what i=
s done until the application destroys the context with robustness. Calling =
exit() likely results in losing any unsaved work, whereas at least some app=
lications might otherwise allow saving the work by other means.<br>
&gt; <br>
&gt; That&#39;s a terrible idea. Ignoring API calls would be identical to a=
 freeze. You might as well disable GPU recovery because the result would be=
 the same.<br>
<br>
No GPU recovery would affect everything using the GPU, whereas this affects=
 only non-robust applications.<br></blockquote></div></div><div dir=3D"auto=
"><br></div><div dir=3D"auto">which is currently the majority.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">
<br>
<br>
&gt; - non-robust contexts: call exit(1) immediately, which is the best way=
 to recover<br>
<br>
That&#39;s not the UMD&#39;s call to make.<br></blockquote></div></div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">That&#39;s absolutely the UMD&#39=
;s call to make because that&#39;s mandated by the hw and API design and on=
ly driver devs know this, which this thread is a proof of. The default beha=
vior is to skip all command submission if a non-robust context is lost, whi=
ch looks like a freeze. That&#39;s required to prevent infinite hangs from =
the same context and can be caused by the side effects of the GPU reset its=
elf, not by the cause of the previous hang. The only way out of that is kil=
ling the process.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Marek<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
<br>
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0[0] Possibly accompanied by a one-time message =
to stderr along the lines of &quot;GPU reset detected but robustness not en=
abled in context, ignoring OpenGL API calls&quot;.<br>
<br>
<br>
-- <br>
Earthling Michel D=C3=A4nzer=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http=
s://redhat.com" rel=3D"noreferrer noreferrer" target=3D"_blank">https://red=
hat.com</a><br>
Libre software enthusiast=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0Mesa and Xwayland developer<br>
<br>
</blockquote></div></div></div>

--000000000000acf4ba05ffa01f08--
