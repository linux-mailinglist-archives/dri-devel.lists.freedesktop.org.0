Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B48F747D12
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 08:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC8010E329;
	Wed,  5 Jul 2023 06:31:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A5EA10E323;
 Wed,  5 Jul 2023 06:31:05 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fb5bcb9a28so9792332e87.3; 
 Tue, 04 Jul 2023 23:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688538663; x=1691130663;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ENVU5rhLcbNb4sfdXfcQRrj/z4ttTeOc6AJbnk4T/7A=;
 b=d5k70x8p8f7LDLfugj6iazgvx70bHzCyjDrpxLgdILEMZ6phVQk4tBOyS3hhLIMKMT
 Zgey+2pRXCyWq9Wna+H8MSTRHZOzr0BqnJGTApHqNPGwXntLcxUi21pgLy+QZXBX4/m1
 yZCtq2OtcRuAqbr9iwT7iS+YSFo+zJEHGoHfhy6alpH9ZyVRLqAIW24nntKaPZGQnu/K
 /P2O3/xhisrtUD8u90TJ4aVEsVkscXtorjnAuuwJW4lRMq3FpB2s87cbcbWcNNfRzUT6
 j2MavBw83sNSxveHg386Ul5HPSIDzRWzEJ2F0ZpvtC01xsA+MQE+kOxsoxKwiZOVVTs3
 ouGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688538663; x=1691130663;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ENVU5rhLcbNb4sfdXfcQRrj/z4ttTeOc6AJbnk4T/7A=;
 b=UwJW917BckfPenTC95S+B2g/2PHwqe/t0sRdWTM4pyRjB5MDfb3jIEkFjs2shffTqQ
 McEr4q3Av4qrX5aUnpZ12DryRF43pvB9N6CB0yG/TJtrDs6o7KEv3zV+L3tMRLEG1KRg
 El4dYhiUYrp3vEplcIYKn+vKkZdalquqtJbwn0ngLQcIih7mk93CM4cG1L2wnb49cRWi
 Edz0LJbJTXS9dPOb7Jed4PUKWfJzuAKgxEctPUTcMAqApb+rXS2hHp808WueVYZmru+A
 MVRheMJpnnZQ/XU6QJ8rutTh+VAcyyUFuS6o3FzaJJFUoIr/7TSm85IyuLIQYSpmhoLh
 vr/A==
X-Gm-Message-State: ABy/qLYw0YAw2S+C0GBMasnXC9wiYDEqyvkPrkYgPTXL99NQSp6euLH3
 R0uDQT6TRFKAvFFkpvnopExs8D8U41BASN1g5lGIRu6L
X-Google-Smtp-Source: APBJJlHyovQJekxtYcxMG+/3fi/cSVE2X2faEjPnkHqEy1FybwmtE62Ib30LWchGX+GtqLPI4xg93lXdNvhrrnBHiO0=
X-Received: by 2002:a05:6512:2811:b0:4fb:92df:a27b with SMTP id
 cf17-20020a056512281100b004fb92dfa27bmr13016876lfb.39.1688538662588; Tue, 04
 Jul 2023 23:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230627132323.115440-1-andrealmeid@igalia.com>
 <CA+hFU4z1pc=KUVVqyqfXEceUqMXQgh-qUnuB=1nkPELghvQO7w@mail.gmail.com>
 <CADnq5_MNVdtdcWKSz6dgmsjg+kEu8p5FVE+fkw_5BaXeG3QGow@mail.gmail.com>
 <afab1f5a-e581-3416-e2c2-238ea120655b@mailbox.org>
 <CAAxE2A5C96k5ua+r938VA_+w7gHHNTdF3n8LwDb98W0Bf9wCVA@mail.gmail.com>
 <7c1e6df5-1ad4-be3c-b95d-92dc62a8c537@mailbox.org>
 <CAAxE2A7RGDY4eRC85CsqfszNzyKvMU2MX1wa+3HZ1hgNeAw3cQ@mail.gmail.com>
 <cb0b6b51-3a94-481b-26a1-89ff398d7835@mailbox.org>
In-Reply-To: <cb0b6b51-3a94-481b-26a1-89ff398d7835@mailbox.org>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Wed, 5 Jul 2023 02:30:49 -0400
Message-ID: <CAAxE2A7tNCWkL_M2YcE=RN+nqqcokgBR4hcD2sR3fGAY2t4uLg@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] drm/doc: Document DRM device reset expectations
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Type: multipart/alternative; boundary="0000000000002c53c305ffb78bc0"
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000002c53c305ffb78bc0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 4, 2023, 03:55 Michel D=C3=A4nzer <michel.daenzer@mailbox.org> =
wrote:

> On 7/4/23 04:34, Marek Ol=C5=A1=C3=A1k wrote:
> > On Mon, Jul 3, 2023, 03:12 Michel D=C3=A4nzer <michel.daenzer@mailbox.o=
rg
> <mailto:michel.daenzer@mailbox.org>> wrote:
> >     On 6/30/23 22:32, Marek Ol=C5=A1=C3=A1k wrote:
> >     > On Fri, Jun 30, 2023 at 11:11=E2=80=AFAM Michel D=C3=A4nzer <
> michel.daenzer@mailbox.org <mailto:michel.daenzer@mailbox.org> <mailto:
> michel.daenzer@mailbox.org <mailto:michel.daenzer@mailbox.org>>> wrote:
> >     >> On 6/30/23 16:59, Alex Deucher wrote:
> >     >>> On Fri, Jun 30, 2023 at 10:49=E2=80=AFAM Sebastian Wick
> >     >>> <sebastian.wick@redhat.com <mailto:sebastian.wick@redhat.com>
> <mailto:sebastian.wick@redhat.com <mailto:sebastian.wick@redhat.com>>>
> wrote:
> >     >>>> On Tue, Jun 27, 2023 at 3:23=E2=80=AFPM Andr=C3=A9 Almeida <
> andrealmeid@igalia.com <mailto:andrealmeid@igalia.com> <mailto:
> andrealmeid@igalia.com <mailto:andrealmeid@igalia.com>>> wrote:
> >     >>>>>
> >     >>>>> +Robustness
> >     >>>>> +----------
> >     >>>>> +
> >     >>>>> +The only way to try to keep an application working after a
> reset is if it
> >     >>>>> +complies with the robustness aspects of the graphical API
> that it is using.
> >     >>>>> +
> >     >>>>> +Graphical APIs provide ways to applications to deal with
> device resets. However,
> >     >>>>> +there is no guarantee that the app will use such features
> correctly, and the
> >     >>>>> +UMD can implement policies to close the app if it is a
> repeating offender,
> >     >>>>> +likely in a broken loop. This is done to ensure that it does
> not keep blocking
> >     >>>>> +the user interface from being correctly displayed. This
> should be done even if
> >     >>>>> +the app is correct but happens to trigger some bug in the
> hardware/driver.
> >     >>>>
> >     >>>> I still don't think it's good to let the kernel arbitrarily ki=
ll
> >     >>>> processes that it thinks are not well-behaved based on some
> heuristics
> >     >>>> and policy.
> >     >>>>
> >     >>>> Can't this be outsourced to user space? Expose the information
> about
> >     >>>> processes causing a device and let e.g. systemd deal with
> coming up
> >     >>>> with a policy and with killing stuff.
> >     >>>
> >     >>> I don't think it's the kernel doing the killing, it would be th=
e
> UMD.
> >     >>> E.g., if the app is guilty and doesn't support robustness the
> UMD can
> >     >>> just call exit().
> >     >>
> >     >> It would be safer to just ignore API calls[0], similarly to what
> is done until the application destroys the context with robustness. Calli=
ng
> exit() likely results in losing any unsaved work, whereas at least some
> applications might otherwise allow saving the work by other means.
> >     >
> >     > That's a terrible idea. Ignoring API calls would be identical to =
a
> freeze. You might as well disable GPU recovery because the result would b=
e
> the same.
> >
> >     No GPU recovery would affect everything using the GPU, whereas this
> affects only non-robust applications.
> >
> > which is currently the majority.
>
> Not sure where you're going with this. Applications need to use robustnes=
s
> to be able to recover from a GPU hang, and the GPU needs to be reset for
> that. So disabling GPU reset is not the same as what we're discussing her=
e.
>
>
> >     > - non-robust contexts: call exit(1) immediately, which is the bes=
t
> way to recover
> >
> >     That's not the UMD's call to make.
> >
> > That's absolutely the UMD's call to make because that's mandated by the
> hw and API design
>
> Can you point us to a spec which mandates that the process must be killed
> in this case?
>
>
> > and only driver devs know this, which this thread is a proof of. The
> default behavior is to skip all command submission if a non-robust contex=
t
> is lost, which looks like a freeze. That's required to prevent infinite
> hangs from the same context and can be caused by the side effects of the
> GPU reset itself, not by the cause of the previous hang. The only way out
> of that is killing the process.
>
> The UMD killing the process is not the only way out of that, and doing so
> is overreach on its part. The UMD is but one out of many components in a
> process, not the main one or a special one. It doesn't get to decide when
> the process must die, certainly not under circumstances where it must be
> able to continue while ignoring API calls (that's required for robustness=
).
>

You're mixing things up. Robust apps don't any special action from a UMD.
Only non-robust apps need to be killed for proper recovery with the only
other alternative being not updating the window/screen, which is not
user-friendly because the user who's never heard of GPU hangs has no
fucking idea why it's frozen and what do with it. It doesn't matter that
you can debug it because you're not the average user. Also it's already
used and required by our customers on Android because killing a process
returns the user to the desktop screen and can generate a crash dump
instead of keeping the app output frozen, and they agree that this is the
best user experience given the circumstances.

Also if the ML ignores html, that's fine.

Marek


>
> >     >>     [0] Possibly accompanied by a one-time message to stderr
> along the lines of "GPU reset detected but robustness not enabled in
> context, ignoring OpenGL API calls".
>
>
> --
> Earthling Michel D=C3=A4nzer            |                  https://redhat=
.com
> Libre software enthusiast          |         Mesa and Xwayland developer
>
>

--0000000000002c53c305ffb78bc0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Jul 4, 2023, 03:55 Michel D=C3=A4nzer &lt;<a h=
ref=3D"mailto:michel.daenzer@mailbox.org">michel.daenzer@mailbox.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">On 7/4/23 04:34, Marek Ol=
=C5=A1=C3=A1k wrote:<br>
&gt; On Mon, Jul 3, 2023, 03:12 Michel D=C3=A4nzer &lt;<a href=3D"mailto:mi=
chel.daenzer@mailbox.org" target=3D"_blank" rel=3D"noreferrer">michel.daenz=
er@mailbox.org</a> &lt;mailto:<a href=3D"mailto:michel.daenzer@mailbox.org"=
 target=3D"_blank" rel=3D"noreferrer">michel.daenzer@mailbox.org</a>&gt;&gt=
; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0On 6/30/23 22:32, Marek Ol=C5=A1=C3=A1k wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On Fri, Jun 30, 2023 at 11:11=E2=80=AFAM Miche=
l D=C3=A4nzer &lt;<a href=3D"mailto:michel.daenzer@mailbox.org" target=3D"_=
blank" rel=3D"noreferrer">michel.daenzer@mailbox.org</a> &lt;mailto:<a href=
=3D"mailto:michel.daenzer@mailbox.org" target=3D"_blank" rel=3D"noreferrer"=
>michel.daenzer@mailbox.org</a>&gt; &lt;mailto:<a href=3D"mailto:michel.dae=
nzer@mailbox.org" target=3D"_blank" rel=3D"noreferrer">michel.daenzer@mailb=
ox.org</a> &lt;mailto:<a href=3D"mailto:michel.daenzer@mailbox.org" target=
=3D"_blank" rel=3D"noreferrer">michel.daenzer@mailbox.org</a>&gt;&gt;&gt; w=
rote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; On 6/30/23 16:59, Alex Deucher wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; On Fri, Jun 30, 2023 at 10:49=E2=80=AF=
AM Sebastian Wick<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; &lt;<a href=3D"mailto:sebastian.wick@r=
edhat.com" target=3D"_blank" rel=3D"noreferrer">sebastian.wick@redhat.com</=
a> &lt;mailto:<a href=3D"mailto:sebastian.wick@redhat.com" target=3D"_blank=
" rel=3D"noreferrer">sebastian.wick@redhat.com</a>&gt; &lt;mailto:<a href=
=3D"mailto:sebastian.wick@redhat.com" target=3D"_blank" rel=3D"noreferrer">=
sebastian.wick@redhat.com</a> &lt;mailto:<a href=3D"mailto:sebastian.wick@r=
edhat.com" target=3D"_blank" rel=3D"noreferrer">sebastian.wick@redhat.com</=
a>&gt;&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt; On Tue, Jun 27, 2023 at 3:23=E2=80=
=AFPM Andr=C3=A9 Almeida &lt;<a href=3D"mailto:andrealmeid@igalia.com" targ=
et=3D"_blank" rel=3D"noreferrer">andrealmeid@igalia.com</a> &lt;mailto:<a h=
ref=3D"mailto:andrealmeid@igalia.com" target=3D"_blank" rel=3D"noreferrer">=
andrealmeid@igalia.com</a>&gt; &lt;mailto:<a href=3D"mailto:andrealmeid@iga=
lia.com" target=3D"_blank" rel=3D"noreferrer">andrealmeid@igalia.com</a> &l=
t;mailto:<a href=3D"mailto:andrealmeid@igalia.com" target=3D"_blank" rel=3D=
"noreferrer">andrealmeid@igalia.com</a>&gt;&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; +Robustness<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; +----------<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; +The only way to try to keep a=
n application working after a reset is if it<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; +complies with the robustness =
aspects of the graphical API that it is using.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; +Graphical APIs provide ways t=
o applications to deal with device resets. However,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; +there is no guarantee that th=
e app will use such features correctly, and the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; +UMD can implement policies to=
 close the app if it is a repeating offender,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; +likely in a broken loop. This=
 is done to ensure that it does not keep blocking<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; +the user interface from being=
 correctly displayed. This should be done even if<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;&gt; +the app is correct but happen=
s to trigger some bug in the hardware/driver.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt; I still don&#39;t think it&#39;s g=
ood to let the kernel arbitrarily kill<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt; processes that it thinks are not w=
ell-behaved based on some heuristics<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt; and policy.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt; Can&#39;t this be outsourced to us=
er space? Expose the information about<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt; processes causing a device and let=
 e.g. systemd deal with coming up<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;&gt; with a policy and with killing stu=
ff.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; I don&#39;t think it&#39;s the kernel =
doing the killing, it would be the UMD.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; E.g., if the app is guilty and doesn&#=
39;t support robustness the UMD can<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; just call exit().<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; It would be safer to just ignore API calls=
[0], similarly to what is done until the application destroys the context w=
ith robustness. Calling exit() likely results in losing any unsaved work, w=
hereas at least some applications might otherwise allow saving the work by =
other means.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; That&#39;s a terrible idea. Ignoring API calls=
 would be identical to a freeze. You might as well disable GPU recovery bec=
ause the result would be the same.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0No GPU recovery would affect everything using the G=
PU, whereas this affects only non-robust applications.<br>
&gt; <br>
&gt; which is currently the majority.<br>
<br>
Not sure where you&#39;re going with this. Applications need to use robustn=
ess to be able to recover from a GPU hang, and the GPU needs to be reset fo=
r that. So disabling GPU reset is not the same as what we&#39;re discussing=
 here.<br>
<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; - non-robust contexts: call exit(1) immediatel=
y, which is the best way to recover<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0That&#39;s not the UMD&#39;s call to make.<br>
&gt; <br>
&gt; That&#39;s absolutely the UMD&#39;s call to make because that&#39;s ma=
ndated by the hw and API design<br>
<br>
Can you point us to a spec which mandates that the process must be killed i=
n this case?<br>
<br>
<br>
&gt; and only driver devs know this, which this thread is a proof of. The d=
efault behavior is to skip all command submission if a non-robust context i=
s lost, which looks like a freeze. That&#39;s required to prevent infinite =
hangs from the same context and can be caused by the side effects of the GP=
U reset itself, not by the cause of the previous hang. The only way out of =
that is killing the process.<br>
<br>
The UMD killing the process is not the only way out of that, and doing so i=
s overreach on its part. The UMD is but one out of many components in a pro=
cess, not the main one or a special one. It doesn&#39;t get to decide when =
the process must die, certainly not under circumstances where it must be ab=
le to continue while ignoring API calls (that&#39;s required for robustness=
).<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto=
">You&#39;re mixing things up. Robust apps don&#39;t any special action fro=
m a UMD. Only non-robust apps need to be killed for proper recovery with th=
e only other alternative being not updating the window/screen, which is not=
 user-friendly because the user who&#39;s never heard of GPU hangs has no f=
ucking idea why it&#39;s frozen and what do with it. It doesn&#39;t matter =
that you can debug it because you&#39;re not the average user. Also it&#39;=
s already used and required by our customers on Android because killing a p=
rocess returns the user to the desktop screen and can generate a crash dump=
 instead of keeping the app output frozen, and they agree that this is the =
best user experience given the circumstances.</div><div dir=3D"auto"><br></=
div><div dir=3D"auto">Also if the ML ignores html, that&#39;s fine.</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Marek</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0[0] Possibly accompanie=
d by a one-time message to stderr along the lines of &quot;GPU reset detect=
ed but robustness not enabled in context, ignoring OpenGL API calls&quot;.<=
br>
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

--0000000000002c53c305ffb78bc0--
