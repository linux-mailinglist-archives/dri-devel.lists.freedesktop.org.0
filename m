Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 112156F5188
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 09:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F40F10E1BE;
	Wed,  3 May 2023 07:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5483110E325;
 Tue,  2 May 2023 09:12:50 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-5286311be47so2351759a12.1; 
 Tue, 02 May 2023 02:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683018769; x=1685610769;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=H3w7c4El8iCPq2ddF0Pau+ST5kcfCowvjLufx9X5W50=;
 b=TKrzdYnQNAObiX+Pz4pLPp5BneFr6PE+YnRk8zFIJ6+DTdh1gmQ508Y24dMofh9KWO
 cTquDSLIqzKJwXMDdLa3+EQbzeAlbf1SqdJ8YqcD/guYENqKgd5+Q2MYlDSHCkXCwvDj
 1XKeQvyJfBTmlDfX9OBaF4p8lg3RV4+2OT2uKHQac9lA1Gt4oIJrPGQjiEwDVGYdo282
 P2f1xTJGZgLDN2RY21XPkXlTk14TJvMniywgU3Y7+BdoT8pYuOs7Urey8vn2AUW/7/bZ
 cfM1PB0QRc/hNSPIBw+6XO2xz4C5YuoWLXVG0cy85A4d69/4MzdmAF+w6OrYwfl7F+sd
 2Wag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683018769; x=1685610769;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H3w7c4El8iCPq2ddF0Pau+ST5kcfCowvjLufx9X5W50=;
 b=HwIGr8wfVgZDiPwcN6oqR1UuGauI+d5ICSt7d3EAtG4vGHjSszoNBW09CdA/AUGzmo
 sA23n1vEDt3K9Of3jkVkrlaaJxDF+18xJ/t41Go+X7SKCdn0hpNX16ssdJ+SVtnMPa6Z
 68aXwaT0aoxS8RgRfCritJECvNJDn2pxZuowDiU33TXZEqglJQNdZ/g81w9p8i9O/q5A
 ZGhOPULyOSg5sTTkHTIBm8kgnTlRMDLJy8bFvk3FSQJFe4YVDwR/rZj3mCDanDtzI5BG
 IL3nhXQJ4VM8bxTC7H0+PVEGck7LXfutfiGQzeoYvwN9+BquJ8HWz0eXkCODJfhhYCwc
 b9hQ==
X-Gm-Message-State: AC+VfDyy1h57TIK6TlaJZZzLs4Oetvg7RaYwYeULZnVRPt2AkFWNKjBH
 Tey70J7XMWd/yPh4l/klRnYPq9Ii3W0FOb7moE0=
X-Google-Smtp-Source: ACHHUZ6kB2OXmbUTvVn+r9UQjZoQ3gaziRJCiUImRSwNpOPHMIs1GCxlL5dzFPmgsN8rhjABr9Kv/s/z0hd6krxWp6o=
X-Received: by 2002:a17:90a:2b8b:b0:24e:26f4:4b22 with SMTP id
 u11-20020a17090a2b8b00b0024e26f44b22mr1628442pjd.16.1683018768876; Tue, 02
 May 2023 02:12:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230501185747.33519-1-andrealmeid@igalia.com>
 <CADnq5_NXj4W44F_etRQ7HWdVTnf5zARCM3Y_o3EiwWiHj8QMpA@mail.gmail.com>
 <6ab2ff76-4518-6fac-071e-5d0d5adc4fcd@igalia.com>
 <cb3d2590-a1f8-fe7e-0bba-638ee80719af@amd.com>
In-Reply-To: <cb3d2590-a1f8-fe7e-0bba-638ee80719af@amd.com>
From: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>
Date: Tue, 2 May 2023 11:12:36 +0200
Message-ID: <CAFF-SiV0=WNmRW-D9uYUuj68Zq0APxtGLya9KR6FfZ7v0Zf2RQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Add AMDGPU_INFO_GUILTY_APP ioctl
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: multipart/alternative; boundary="000000000000de8b9e05fab2578d"
X-Mailman-Approved-At: Wed, 03 May 2023 07:30:49 +0000
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
Cc: "Pelloux-Prayer, Pierre-Eric" <pierre-eric.pelloux-prayer@amd.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 michel.daenzer@mailbox.org, linux-kernel@vger.kernel.org,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000de8b9e05fab2578d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

Christian K=C3=B6nig <christian.koenig@amd.com> ezt =C3=ADrta (id=C5=91pont=
: 2023. m=C3=A1j.
2., Ke 9:59):

> Am 02.05.23 um 03:26 schrieb Andr=C3=A9 Almeida:
> > Em 01/05/2023 16:24, Alex Deucher escreveu:
> >> On Mon, May 1, 2023 at 2:58=E2=80=AFPM Andr=C3=A9 Almeida <andrealmeid=
@igalia.com>
> >> wrote:
> >>>
> >>> I know that devcoredump is also used for this kind of information,
> >>> but I believe
> >>> that using an IOCTL is better for interfacing Mesa + Linux rather
> >>> than parsing
> >>> a file that its contents are subjected to be changed.
> >>
> >> Can you elaborate a bit on that?  Isn't the whole point of devcoredump
> >> to store this sort of information?
> >>
> >
> > I think that devcoredump is something that you could use to submit to
> > a bug report as it is, and then people can read/parse as they want,
> > not as an interface to be read by Mesa... I'm not sure that it's
> > something that I would call an API. But I might be wrong, if you know
> > something that uses that as an API please share.
> >
> > Anyway, relying on that for Mesa would mean that we would need to
> > ensure stability for the file content and format, making it less
> > flexible to modify in the future and probe to bugs, while the IOCTL is
> > well defined and extensible. Maybe the dump from Mesa + devcoredump
> > could be complementary information to a bug report.
>
> Neither using an IOCTL nor devcoredump is a good approach for this since
> the values read from the hw register are completely unreliable. They
> could not be available because of GFXOFF or they could be overwritten or
> not even updated by the CP in the first place because of a hang etc....
>
> If you want to track progress inside an IB what you do instead is to
> insert intermediate fence write commands into the IB. E.g. something
> like write value X to location Y when this executes.
>
> This way you can not only track how far the IB processed, but also in
> which stages of processing we where when the hang occurred. E.g. End of
> Pipe, End of Shaders, specific shader stages etc...
>

Currently our biggest challenge in the userspace driver is debugging
"random" GPU hangs. We have many dozens of bug reports from users which are
like: "play the game for X hours and it will eventually hang the GPU". With
the currently available tools, it is impossible for us to tackle these
issues. Andr=C3=A9's proposal would be a step in improving this situation.

We already do something like what you suggest, but there are multiple
problems with that approach:

1. we can only submit 1 command buffer at a time because we won't know
which IB hanged
2. we can't use chaining because we don't know where in the IB it hanged
3. it needs userspace to insert (a lot of) extra commands such as extra
synchronization and memory writes
4. It doesn't work when GPU recovery is enabled because the information is
already gone when we detect the hang

Consequences:

A. It has a huge perf impact, so we can't enable it always
B. Thanks to the extra synchronization, some issues can't be reproduced
when this kind of debugging is enabled
C. We have to ask users to disable GPU recovery to collect logs for us

In my opinion, the correct solution to those problems would be if the
kernel could give userspace the necessary information about a GPU hang
before a GPU reset. To avoid the massive peformance cost, it would be best
if we could know which IB hung and what were the commands being executed
when it hung (perhaps pointers to the VA of the commands), along with which
shaders were in flight (perhaps pointers to the VA of the shader binaries).

If such an interface could be created, that would mean we could easily
query this information and create useful logs of GPU hangs without much
userspace overhead and without requiring the user to disable GPU resets etc=
.

If it's not possible to do this, we'd appreciate some suggestions on how to
properly solve this without the massive performance cost and without
requiring the user to disable GPU recovery.

Side note, it is also extremely difficult to even determine whether the
problem is in userspace or the kernel. While kernel developers usually
dismiss all GPU hangs as userspace problems, we've seen many issues where
the problem was in the kernel (eg. bugs where wrong voltages were set,
etc.) - any idea for tackling those kind of issues is also welcome.

Thanks & best regards,
Timur

>

--000000000000de8b9e05fab2578d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Christian,<br><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">Christian K=C3=B6nig &lt;<a href=3D"mailt=
o:christian.koenig@amd.com">christian.koenig@amd.com</a>&gt; ezt =C3=ADrta =
(id=C5=91pont: 2023. m=C3=A1j. 2., Ke 9:59):<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">Am 02.05.23 um 03:26 schrieb Andr=C3=A9 Almeida:<br>
&gt; Em 01/05/2023 16:24, Alex Deucher escreveu:<br>
&gt;&gt; On Mon, May 1, 2023 at 2:58=E2=80=AFPM Andr=C3=A9 Almeida &lt;<a h=
ref=3D"mailto:andrealmeid@igalia.com" target=3D"_blank" rel=3D"noreferrer">=
andrealmeid@igalia.com</a>&gt; <br>
&gt;&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I know that devcoredump is also used for this kind of informat=
ion, <br>
&gt;&gt;&gt; but I believe<br>
&gt;&gt;&gt; that using an IOCTL is better for interfacing Mesa + Linux rat=
her <br>
&gt;&gt;&gt; than parsing<br>
&gt;&gt;&gt; a file that its contents are subjected to be changed.<br>
&gt;&gt;<br>
&gt;&gt; Can you elaborate a bit on that?=C2=A0 Isn&#39;t the whole point o=
f devcoredump<br>
&gt;&gt; to store this sort of information?<br>
&gt;&gt;<br>
&gt;<br>
&gt; I think that devcoredump is something that you could use to submit to =
<br>
&gt; a bug report as it is, and then people can read/parse as they want, <b=
r>
&gt; not as an interface to be read by Mesa... I&#39;m not sure that it&#39=
;s <br>
&gt; something that I would call an API. But I might be wrong, if you know =
<br>
&gt; something that uses that as an API please share.<br>
&gt;<br>
&gt; Anyway, relying on that for Mesa would mean that we would need to <br>
&gt; ensure stability for the file content and format, making it less <br>
&gt; flexible to modify in the future and probe to bugs, while the IOCTL is=
 <br>
&gt; well defined and extensible. Maybe the dump from Mesa + devcoredump <b=
r>
&gt; could be complementary information to a bug report.<br>
<br>
Neither using an IOCTL nor devcoredump is a good approach for this since <b=
r>
the values read from the hw register are completely unreliable. They <br>
could not be available because of GFXOFF or they could be overwritten or <b=
r>
not even updated by the CP in the first place because of a hang etc....<br>
<br>
If you want to track progress inside an IB what you do instead is to <br>
insert intermediate fence write commands into the IB. E.g. something <br>
like write value X to location Y when this executes.<br>
<br>
This way you can not only track how far the IB processed, but also in <br>
which stages of processing we where when the hang occurred. E.g. End of <br=
>
Pipe, End of Shaders, specific shader stages etc...<br></blockquote></div><=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Currently our biggest ch=
allenge in the userspace driver is debugging &quot;random&quot; GPU hangs. =
We have many dozens of bug reports from users which are like: &quot;play th=
e game for X hours and it will eventually hang the GPU&quot;. With the curr=
ently available tools, it is impossible for us to tackle these issues. Andr=
=C3=A9&#39;s proposal would be a step in improving this situation.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">We already do something like wha=
t you suggest, but there are multiple problems with that approach:</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">1. we can only submit 1 command =
buffer at a time because we won&#39;t know which IB hanged</div><div dir=3D=
"auto">2. we can&#39;t use chaining because we don&#39;t know where in the =
IB it hanged</div><div dir=3D"auto">3. it needs userspace to insert (a lot =
of) extra commands such as extra synchronization and memory writes</div><di=
v dir=3D"auto">4. It doesn&#39;t work when GPU recovery is enabled because =
the information is already gone when we detect the hang<br></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Consequences:</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">A. It has a huge perf impact, so we can&#39;t e=
nable it always</div><div dir=3D"auto">B. Thanks to the extra synchronizati=
on, some issues can&#39;t be reproduced when this kind of debugging is enab=
led</div><div dir=3D"auto">C. We have to ask users to disable GPU recovery =
to collect logs for us</div><div dir=3D"auto"><br></div><div dir=3D"auto">I=
n my opinion, the correct solution to those problems would be if the kernel=
 could give userspace the necessary information about a GPU hang before a G=
PU reset. To avoid the massive peformance cost, it would be best if we coul=
d know which IB hung and what were the commands being executed when it hung=
 (perhaps pointers to the VA of the commands), along with which shaders wer=
e in flight (perhaps pointers to the VA of the shader binaries).</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">If such an interface could be crea=
ted, that would mean we could easily query this information and create usef=
ul logs of GPU hangs without much userspace overhead and without requiring =
the user to disable GPU resets etc.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">If it&#39;s not possible to do this, we&#39;d appreciate some s=
uggestions on how to properly solve this without the massive performance co=
st and without requiring the user to disable GPU recovery.</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">Side note, it is also extremely difficul=
t to even determine whether the problem is in userspace or the kernel. Whil=
e kernel developers usually dismiss all GPU hangs as userspace problems, we=
&#39;ve seen many issues where the problem was in the kernel (eg. bugs wher=
e wrong voltages were set, etc.) - any idea for tackling those kind of issu=
es is also welcome.<br></div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Thanks &amp; best regards,</div><div dir=3D"auto">Timur</div><div dir=3D"au=
to"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000de8b9e05fab2578d--
