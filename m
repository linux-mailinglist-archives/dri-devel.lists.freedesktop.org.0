Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 529D9744331
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 22:33:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1632110E192;
	Fri, 30 Jun 2023 20:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F7410E192;
 Fri, 30 Jun 2023 20:33:12 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fba8e2aa52so25777995e9.1; 
 Fri, 30 Jun 2023 13:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688157190; x=1690749190;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EcdF/6fyXoCel57zXUGGjxHCncr0l7PpKqOEZtpYrpY=;
 b=gKcKV4rdxFUMwM7EIjl97teRG1SVQYkR5e479nULRSfLuRDXcKKccntzxUkh6nEEwU
 rqoNMTDfBnw5147B8u39Sv9pjlOSuBEZ2rz5GJdWfVQnI2Fi6k8wuO54fwXK95qyowaT
 e2aERNIgSrwW9Ktb+FRc6hgBZI7obfDnB1f9hCRXY5//gvhec+reXFLGRk8+Ko/qe/oi
 E27qoPGkNS9FG1tV0cM9UuNSseDlyR4ldA6WFG5gJ0KeFxPXc/iZPAbxPzX/2Z9u8uib
 HdoK/NeUTyX5gFDlKr8hdHKSeP/PPsqlEIcN1AmFgrD39DGUPMnj2GHJT5izirgwAGLG
 YPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688157190; x=1690749190;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EcdF/6fyXoCel57zXUGGjxHCncr0l7PpKqOEZtpYrpY=;
 b=D8lduxkkhfrW/akIUgQ8raO6yn+ojDlgVijp4V+Q5EKq2+qvpm7ZRFRfbuSQy4pelf
 ivOGahtlF5sVVQcpi+Z2Bvq7eSIZ6TWtWl798nvS6ha1olIeSRi1q/4V1YGBOmXmleye
 udHneiDxZZxrwbiye10Z1BwM80B0ijnQ4YdVEEN5HMHzdWosBciB66/4eoRolYtF8zki
 1L/DTf+l9Q/fA6lWR5AyNVkO8q5zK+cCP4FV4s/yRcrhhTs419DN4tBcIJjq6mLI0YqY
 reLwYz2D6ZqYkDiP6IowXAAeltAJL/YQqy9LKHSXcvJuJze0MVGNEuUnv5X7OzkpNhhQ
 CzLw==
X-Gm-Message-State: AC+VfDygrCewkkYtUHCpDmxf/pKW9XZ1FFHuksnFTuKDw9NBdVd+0Ff9
 B6xz7COoDMYVVbTJ5i6fZJnkYkv02J/uQ7+ANWM=
X-Google-Smtp-Source: ACHHUZ4CCRu+32eXGdZT9Eu7EW+/FQwl8xNQTdwRCFny7A9jyWFiH0CJH1AaI+fljG7stqwhf1MfZ2sgczOLmvmnoZE=
X-Received: by 2002:a05:600c:b55:b0:3fa:8040:27f6 with SMTP id
 k21-20020a05600c0b5500b003fa804027f6mr2916420wmr.11.1688157189959; Fri, 30
 Jun 2023 13:33:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230627132323.115440-1-andrealmeid@igalia.com>
 <CA+hFU4z1pc=KUVVqyqfXEceUqMXQgh-qUnuB=1nkPELghvQO7w@mail.gmail.com>
 <CADnq5_MNVdtdcWKSz6dgmsjg+kEu8p5FVE+fkw_5BaXeG3QGow@mail.gmail.com>
 <afab1f5a-e581-3416-e2c2-238ea120655b@mailbox.org>
In-Reply-To: <afab1f5a-e581-3416-e2c2-238ea120655b@mailbox.org>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Fri, 30 Jun 2023 16:32:33 -0400
Message-ID: <CAAxE2A5C96k5ua+r938VA_+w7gHHNTdF3n8LwDb98W0Bf9wCVA@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] drm/doc: Document DRM device reset expectations
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Type: multipart/alternative; boundary="000000000000a1f3c205ff5eb93b"
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 Sebastian Wick <sebastian.wick@redhat.com>, amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com,
 Pekka Paalanen <pekka.paalanen@collabora.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000a1f3c205ff5eb93b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That's a terrible idea. Ignoring API calls would be identical to a freeze.
You might as well disable GPU recovery because the result would be the same=
.

There are 2 scenarios:
- robust contexts: report the GPU reset status and skip API calls; let the
app recreate the context to recover
- non-robust contexts: call exit(1) immediately, which is the best way to
recover

Marek

On Fri, Jun 30, 2023 at 11:11=E2=80=AFAM Michel D=C3=A4nzer <michel.daenzer=
@mailbox.org>
wrote:

> On 6/30/23 16:59, Alex Deucher wrote:
> > On Fri, Jun 30, 2023 at 10:49=E2=80=AFAM Sebastian Wick
> > <sebastian.wick@redhat.com> wrote:
> >> On Tue, Jun 27, 2023 at 3:23=E2=80=AFPM Andr=C3=A9 Almeida <andrealmei=
d@igalia.com>
> wrote:
> >>>
> >>> +Robustness
> >>> +----------
> >>> +
> >>> +The only way to try to keep an application working after a reset is
> if it
> >>> +complies with the robustness aspects of the graphical API that it is
> using.
> >>> +
> >>> +Graphical APIs provide ways to applications to deal with device
> resets. However,
> >>> +there is no guarantee that the app will use such features correctly,
> and the
> >>> +UMD can implement policies to close the app if it is a repeating
> offender,
> >>> +likely in a broken loop. This is done to ensure that it does not kee=
p
> blocking
> >>> +the user interface from being correctly displayed. This should be
> done even if
> >>> +the app is correct but happens to trigger some bug in the
> hardware/driver.
> >>
> >> I still don't think it's good to let the kernel arbitrarily kill
> >> processes that it thinks are not well-behaved based on some heuristics
> >> and policy.
> >>
> >> Can't this be outsourced to user space? Expose the information about
> >> processes causing a device and let e.g. systemd deal with coming up
> >> with a policy and with killing stuff.
> >
> > I don't think it's the kernel doing the killing, it would be the UMD.
> > E.g., if the app is guilty and doesn't support robustness the UMD can
> > just call exit().
>
> It would be safer to just ignore API calls[0], similarly to what is done
> until the application destroys the context with robustness. Calling exit(=
)
> likely results in losing any unsaved work, whereas at least some
> applications might otherwise allow saving the work by other means.
>
>
> [0] Possibly accompanied by a one-time message to stderr along the lines
> of "GPU reset detected but robustness not enabled in context, ignoring
> OpenGL API calls".
>
> --
> Earthling Michel D=C3=A4nzer            |                  https://redhat=
.com
> Libre software enthusiast          |         Mesa and Xwayland developer
>
>

--000000000000a1f3c205ff5eb93b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>That&#39;s a terrible idea. Ignoring API calls would =
be identical to a freeze. You might as well disable GPU recovery because th=
e result would be the same.</div><div><br></div><div>There are 2 scenarios:=
</div><div>- robust contexts: report the GPU reset status and skip API call=
s; let the app recreate the context to recover<br></div><div>- non-robust c=
ontexts: call exit(1) immediately, which is the best way to recover<br></di=
v><div></div><div></div><div><br></div><div>Marek<br></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 30, =
2023 at 11:11=E2=80=AFAM Michel D=C3=A4nzer &lt;<a href=3D"mailto:michel.da=
enzer@mailbox.org">michel.daenzer@mailbox.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">On 6/30/23 16:59, Alex Deucher=
 wrote:<br>
&gt; On Fri, Jun 30, 2023 at 10:49=E2=80=AFAM Sebastian Wick<br>
&gt; &lt;<a href=3D"mailto:sebastian.wick@redhat.com" target=3D"_blank">seb=
astian.wick@redhat.com</a>&gt; wrote:<br>
&gt;&gt; On Tue, Jun 27, 2023 at 3:23=E2=80=AFPM Andr=C3=A9 Almeida &lt;<a =
href=3D"mailto:andrealmeid@igalia.com" target=3D"_blank">andrealmeid@igalia=
.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; +Robustness<br>
&gt;&gt;&gt; +----------<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +The only way to try to keep an application working after a re=
set is if it<br>
&gt;&gt;&gt; +complies with the robustness aspects of the graphical API tha=
t it is using.<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +Graphical APIs provide ways to applications to deal with devi=
ce resets. However,<br>
&gt;&gt;&gt; +there is no guarantee that the app will use such features cor=
rectly, and the<br>
&gt;&gt;&gt; +UMD can implement policies to close the app if it is a repeat=
ing offender,<br>
&gt;&gt;&gt; +likely in a broken loop. This is done to ensure that it does =
not keep blocking<br>
&gt;&gt;&gt; +the user interface from being correctly displayed. This shoul=
d be done even if<br>
&gt;&gt;&gt; +the app is correct but happens to trigger some bug in the har=
dware/driver.<br>
&gt;&gt;<br>
&gt;&gt; I still don&#39;t think it&#39;s good to let the kernel arbitraril=
y kill<br>
&gt;&gt; processes that it thinks are not well-behaved based on some heuris=
tics<br>
&gt;&gt; and policy.<br>
&gt;&gt;<br>
&gt;&gt; Can&#39;t this be outsourced to user space? Expose the information=
 about<br>
&gt;&gt; processes causing a device and let e.g. systemd deal with coming u=
p<br>
&gt;&gt; with a policy and with killing stuff.<br>
&gt; <br>
&gt; I don&#39;t think it&#39;s the kernel doing the killing, it would be t=
he UMD.<br>
&gt; E.g., if the app is guilty and doesn&#39;t support robustness the UMD =
can<br>
&gt; just call exit().<br>
<br>
It would be safer to just ignore API calls[0], similarly to what is done un=
til the application destroys the context with robustness. Calling exit() li=
kely results in losing any unsaved work, whereas at least some applications=
 might otherwise allow saving the work by other means.<br>
<br>
<br>
[0] Possibly accompanied by a one-time message to stderr along the lines of=
 &quot;GPU reset detected but robustness not enabled in context, ignoring O=
penGL API calls&quot;.<br>
<br>
-- <br>
Earthling Michel D=C3=A4nzer=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http=
s://redhat.com" rel=3D"noreferrer" target=3D"_blank">https://redhat.com</a>=
<br>
Libre software enthusiast=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0Mesa and Xwayland developer<br>
<br>
</blockquote></div>

--000000000000a1f3c205ff5eb93b--
