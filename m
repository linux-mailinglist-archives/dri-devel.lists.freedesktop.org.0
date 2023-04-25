Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8C26EE80E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 21:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5085910E510;
	Tue, 25 Apr 2023 19:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD0810E50C;
 Tue, 25 Apr 2023 19:12:02 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-506bdf29712so46398278a12.0; 
 Tue, 25 Apr 2023 12:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682449921; x=1685041921;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=koLeSmQ6T/ZFSMFTMgeC2b39G3yHJgYS3Qiqh6oZeic=;
 b=LF8VcsekifJXXCm99CHUj2iA+9fYU5z2FXaVTdQ/Sq2Y70r8jm0Gokbf2kIWnUHnrZ
 j6VjkimmlLu7jKC+9KiZhfwsYHc3boCRbcI33IlhxZynci8j4uNjfV6tP16PBUc9rQ7y
 GHwAmcdCwimzH+ZrCnCUWUiVSOOGCIkdb9dEtpV8CEiaziPMEBV8+pTeKVlD+xzY80Qt
 TEJ7zpqlZHsIJnhlzYUbzOjDx4T/DLQ6IdGB/Kyg+YWsJ6Fy/buhDxwNWw0UJ6M/fZqe
 5+ScluLTyIsBWqTwAupyjjwqqTcjc0A3x9BLeTC5I8RMletAYfGW+odItxWYfvw8Y/uk
 8VQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682449921; x=1685041921;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=koLeSmQ6T/ZFSMFTMgeC2b39G3yHJgYS3Qiqh6oZeic=;
 b=dCrF1CwefHH1mDAij5kd4FVL2TrVKEYfrYxtK4LMDAW8JvmXX3QAR4ZlszUDNNT3na
 /l+wYIgvaR50OUhXJAc1+NLYx+OHMQ7TgKiMAyo/yO1MT3ZP4j8VJpZynp8N7FMqWYL/
 ibWKIev8l8sSLr3AaOMJ+s5Snl73lVax0IQEItdpkbjXR2HFXF0uakhOtISyfqF1LhvM
 gRUvk4TK8JoQpD4cPWNbna/7AcVEvnl8ONK71VFGV+FguXvfoOT2MIrWXWhmaauWnbka
 r8M5MmHMapGRBuuCSfNZ99ZJWXIEm1yLUco3ot7iBalqg531vjusNgbyoz1KPXWimJ3z
 Tqhg==
X-Gm-Message-State: AC+VfDwqrYuC+saguWdDSq/RyyRXFA6fhBWH9NuC99245aPoB/W7SO1y
 jVf8hf/1BT20MRElTzUhKvo7woAHb6Eq1J7nyc8=
X-Google-Smtp-Source: ACHHUZ57E9PmqEm7V5OyMvmjXnRK6oJMyiSPsnGN6MxKcIMgafM7cCJgZElgN+VtLKcZINF2U8O2byrAaWZEV4/3XRM=
X-Received: by 2002:a05:6402:1911:b0:506:72f8:eb10 with SMTP id
 e17-20020a056402191100b0050672f8eb10mr29497edz.0.1682449920665; Tue, 25 Apr
 2023 12:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230424014324.218531-1-andrealmeid@igalia.com>
 <d7264c5a-29b4-0fb3-153b-673a8a73d635@amd.com>
 <CAAxE2A6Soq28ACV-m1OzG8CA-_VWp+N2wapsABzm2Nda=Qe+yA@mail.gmail.com>
 <784561bb-0937-befc-3774-892d6f6a4318@mailbox.org>
 <CAAxE2A6iuuVA7zjHM8YcTGMpEWuYV=hGRR1YW6W-qXHwAg9w7w@mail.gmail.com>
 <19406ec5-79d6-e9e6-fbdd-eb2f4a872fc4@amd.com>
 <5262c73e-e77c-91f7-e49e-a9c3571e2cc9@mailbox.org>
 <f5bf590a-5d3f-03f2-531c-057cf8760000@amd.com>
In-Reply-To: <f5bf590a-5d3f-03f2-531c-057cf8760000@amd.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Tue, 25 Apr 2023 15:11:47 -0400
Message-ID: <CAAxE2A4capwpc40F49cgZBC9jJisODqNjTe0cM_pS7si5EkW3g@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Mark contexts guilty for any reset type
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: multipart/alternative; boundary="000000000000dfabe605fa2de571"
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
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, kernel-dev@igalia.com,
 "Deucher, Alexander" <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000dfabe605fa2de571
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The last 3 comments in this thread contain arguments that are false and
were specifically pointed out as false 6 comments ago: Soft resets are just
as fatal as hard resets. There is nothing better about soft resets. If the
VRAM is lost completely, that's a different story, and if the hard reset is
100% unreliable, that's also a different story, but other than those two
outliers, there is no difference between the two from the user point view.
Both can repeatedly hang if you don't prevent the app that caused the hang
from using the GPU even if the app is not robust. The robustness context
type doesn't matter here. By definition, no guilty app can continue after a
reset, and no innocent apps affected by a reset can continue either because
those can now hang too. That's how destructive all resets are. Personal
anecdotes that the soft reset is better are just that, anecdotes.

Marek

On Tue, Apr 25, 2023, 08:44 Christian K=C3=B6nig <christian.koenig@amd.com>
wrote:

> Am 25.04.23 um 14:14 schrieb Michel D=C3=A4nzer:
> > On 4/25/23 14:08, Christian K=C3=B6nig wrote:
> >> Well signaling that something happened is not the question. We do this
> for both soft as well as hard resets.
> >>
> >> The question is if errors result in blocking further submissions with
> the same context or not.
> >>
> >> In case of a hard reset and potential loss of state we have to kill th=
e
> context, otherwise a follow up submission would just lockup the hardware
> once more.
> >>
> >> In case of a soft reset I think we can keep the context alive, this wa=
y
> even applications without robustness handling can keep work.
> >>
> >> You potentially still get some corruption, but at least not your
> compositor killed.
> > Right, and if there is corruption, the user can restart the session.
> >
> >
> > Maybe a possible compromise could be making soft resets fatal if user
> space enabled robustness for the context, and non-fatal if not.
>
> Well that should already be mostly the case. If an application has
> enabled robustness it should notice that something went wrong and act
> appropriately.
>
> The only thing we need to handle is for applications without robustness
> in case of a hard reset or otherwise it will trigger an reset over and
> over again.
>
> Christian.
>
> >
> >
> >> Am 25.04.23 um 13:07 schrieb Marek Ol=C5=A1=C3=A1k:
> >>> That supposedly depends on the compositor. There may be compositors
> for very specific cases (e.g. Steam Deck) that handle resets very well, a=
nd
> those would like to be properly notified of all resets because that's how
> they get the best outcome, e.g. no corruption. A soft reset that is
> unhandled by userspace may result in persistent corruption.
> >
>
>

--000000000000dfabe605fa2de571
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>The last 3 comments in this thread contain arguments=
 that are false and were specifically pointed out as false 6 comments ago: =
Soft resets are just as fatal as hard resets. There is nothing better about=
 soft resets. If the VRAM is lost completely, that&#39;s a different story,=
 and if the hard reset is 100% unreliable, that&#39;s also a different stor=
y, but other than those two outliers, there is no difference between the tw=
o from the user point view. Both can repeatedly hang if you don&#39;t preve=
nt the app that caused the hang from using the GPU even if the app is not r=
obust. The robustness context type doesn&#39;t matter here. By definition, =
no guilty app can continue after a reset, and no innocent apps affected by =
a reset can continue either because those can now hang too. That&#39;s how =
destructive all resets are. Personal anecdotes that the soft reset is bette=
r are just that, anecdotes.</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">Marek</div><div dir=3D"auto"><br><div class=3D"gmail_quote" dir=3D"auto=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 25, 2023, 08:44 Christi=
an K=C3=B6nig &lt;<a href=3D"mailto:christian.koenig@amd.com" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">christian.koenig@amd.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Am 25.04.23 um 14:14 schrieb Michel=
 D=C3=A4nzer:<br>
&gt; On 4/25/23 14:08, Christian K=C3=B6nig wrote:<br>
&gt;&gt; Well signaling that something happened is not the question. We do =
this for both soft as well as hard resets.<br>
&gt;&gt;<br>
&gt;&gt; The question is if errors result in blocking further submissions w=
ith the same context or not.<br>
&gt;&gt;<br>
&gt;&gt; In case of a hard reset and potential loss of state we have to kil=
l the context, otherwise a follow up submission would just lockup the hardw=
are once more.<br>
&gt;&gt;<br>
&gt;&gt; In case of a soft reset I think we can keep the context alive, thi=
s way even applications without robustness handling can keep work.<br>
&gt;&gt;<br>
&gt;&gt; You potentially still get some corruption, but at least not your c=
ompositor killed.<br>
&gt; Right, and if there is corruption, the user can restart the session.<b=
r>
&gt;<br>
&gt;<br>
&gt; Maybe a possible compromise could be making soft resets fatal if user =
space enabled robustness for the context, and non-fatal if not.<br>
<br>
Well that should already be mostly the case. If an application has <br>
enabled robustness it should notice that something went wrong and act <br>
appropriately.<br>
<br>
The only thing we need to handle is for applications without robustness <br=
>
in case of a hard reset or otherwise it will trigger an reset over and <br>
over again.<br>
<br>
Christian.<br>
<br>
&gt;<br>
&gt;<br>
&gt;&gt; Am 25.04.23 um 13:07 schrieb Marek Ol=C5=A1=C3=A1k:<br>
&gt;&gt;&gt; That supposedly depends on the compositor. There may be compos=
itors for very specific cases (e.g. Steam Deck) that handle resets very wel=
l, and those would like to be properly notified of all resets because that&=
#39;s how they get the best outcome, e.g. no corruption. A soft reset that =
is unhandled by userspace may result in persistent corruption.<br>
&gt;<br>
<br>
</blockquote></div></div></div>

--000000000000dfabe605fa2de571--
