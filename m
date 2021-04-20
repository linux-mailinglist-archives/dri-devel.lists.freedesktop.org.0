Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 648D8366022
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 21:19:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7012189DDF;
	Tue, 20 Apr 2021 19:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1C689DDF
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 19:19:10 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 q123-20020a1c43810000b029012c7d852459so1628531wma.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 12:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BKQ6GlCnhGBRQN+zB0U+sY69lgCkrE9Estug3hgCcCI=;
 b=I2JY/N05R3cFKgCUrp9gwMBNsUYPcc4kFSilQ+FJHQh+hngyFRNVrr+2qPsOSErY6v
 k0GR8o3Iu6mkEVPdSJGwZih5BiN9lMH4BNDOh6yCAfyy94PqOcKTuIl30LSTP4p3cAjt
 Z2oYMQNG51amlzcgp0NzZ8s9oPb4TDlJwShP4978KLQodv++eVB/QVJ616VmJC75q6X6
 yqnjCwLP4ap+doVgc4JO8BGSDVOmiAGW1TKGCUhjLxvGf2N172ZHaOC6djQ/LHpicp9g
 c4SX6Y9zX2l3IFeXiBUiaA9qfT8JXwmnZ+xy05s2qgk+CcKt3K48Cj8A5QFMF4smUE44
 vVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BKQ6GlCnhGBRQN+zB0U+sY69lgCkrE9Estug3hgCcCI=;
 b=tRTe4/sT+RRVGzW9tpDF+lCp3a8Bu3xlT3ial/7XB2emoHxPBay5sOIjVNPFV5rXkg
 5QxAIKX969GTfEwzkBrXeP7YQUV9dcYZxWOFbw87h4ULZ1Qeer4I6e24U3kliFGzVNwA
 6JWUXnRW29Ifpidzk3qVubKtrXXhivSznUqTlkbYzxshZxTJ/cb6c3GJFnnEEu+7Eg02
 CopwzxzMUS1Yq4EqeL5lHjeMxtpFrtvKBNND+ENrz6oY69ahhmmW8ej5XMFXwem+IQou
 fjuKIsNyyeO+c9JMffUXAFCX6ogwKcNwedfw8vjyhPYFa0mC5VDLx1KF8XugS4gyeB5y
 nCZA==
X-Gm-Message-State: AOAM5300Y0r0e7ma5gG7GGMmeuJ1g1PalYQG6Zo8StN1InFICy7tU63q
 5FDhWuzbj2SmFaMAYQS2henhFKZFmVPhHcS5pFrQcA==
X-Google-Smtp-Source: ABdhPJw3fJ1p9q6k4Fc1atW7PxcstdYZVSbDXc/9V67SUkxx+xjnwHbGk/PtNiWKZ5TdrN3NMokLw8iSKRxk05WIDdY=
X-Received: by 2002:a7b:c047:: with SMTP id u7mr6007997wmc.98.1618946349521;
 Tue, 20 Apr 2021 12:19:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAPj87rMn_gabTdZpHGQVa16Log8xFe8fvhcL_WSC6tyOMvmY=w@mail.gmail.com>
 <CAOFGe96c1SxHiUBzapbVFx1h0aOwF=X8hcStVZmrw4OjrrG+Zg@mail.gmail.com>
 <CAPj87rPSW13nxz2n5E+n0JYcwGR3mFWJAG2kYaaoav7A-ZVD2g@mail.gmail.com>
 <2ee6acde-5643-0597-017b-7e20bd1a704d@gmail.com>
 <CAPj87rN0hMHVKFzAte-mnPyPT_NUG7z=cmabTw65rJ22eQhYoQ@mail.gmail.com>
 <CAP+8YyHkuABPb46a_LUtrfrsv4fvhMzjALzF+heMpSmf0UWAnQ@mail.gmail.com>
In-Reply-To: <CAP+8YyHkuABPb46a_LUtrfrsv4fvhMzjALzF+heMpSmf0UWAnQ@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 20 Apr 2021 20:18:21 +0100
Message-ID: <CAPj87rM3K=JwiUZ0rN3vw=tTHPYpJ5s2MC0QS8JvD-enoFndxA@mail.gmail.com>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1975671441=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1975671441==
Content-Type: multipart/alternative; boundary="00000000000012f0a505c06c52dd"

--00000000000012f0a505c06c52dd
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, 20 Apr 2021 at 20:03, Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
wrote:

> On Tue, Apr 20, 2021 at 8:16 PM Daniel Stone <daniel@fooishbar.org> wrote:
>
>> It's a jarring transition. If you take a very narrow view and say 'it's
>> all GPU work in shared buffers so it should all work the same', then
>> client<->winsys looks the same as client<->client gbuffer. But this is a
>> trap.
>>
>
> I think this is where I think we have have a serious gap of what a winsys
> or a compositor is. Like if you have only a single wayland server running
> on a physical machine this is easy. But add a VR compositor, an
> intermediate compositor (say gamescope), Xwayland and some containers/VM,
> some video capture  (or, gasp, a browser that doubles as compositor) and
> this story gets seriously complicated. Like who are you protecting from
> who? at what point is something client<->winsys vs. client<->client?
>

As I've said upthread, the line is _seriously_ blurred, and is only getting
less clear. Right now, DRI3 cannot even accept a dma_fence, let alone a
drm_syncobj, let alone a memory fence.

Crossing those boundaries is hard, and requires as much thinking as typing.
That's a good thing.

Conflating every synchronisation desire into a single
userspace-visible primitive makes this harder, because it treats game
threads the same as other game threads the same as VR compositors the same
as embedding browsers the same as compositors etc. Drawing very clear lines
between game threads and the external world, with explicit weakening as
necessary, makes those jarring transitions of privilege and expectation
clear and explicit. Which is a good thing, since we're trying to move away
from magic and implicit.

Cheers,
Daniel

--00000000000012f0a505c06c52dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,</div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Tue, 20 Apr 2021 at 20:03, Bas Nieu=
wenhuizen &lt;<a href=3D"mailto:bas@basnieuwenhuizen.nl">bas@basnieuwenhuiz=
en.nl</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr"><div dir=3D"ltr"><span style=3D"font-size:0.87499rem"=
>On Tue, Apr 20, 2021 at 8:16 PM Daniel Stone &lt;</span><a href=3D"mailto:=
daniel@fooishbar.org" target=3D"_blank" style=3D"font-size:0.87499rem">dani=
el@fooishbar.org</a><span style=3D"font-size:0.87499rem">&gt; wrote:</span>=
<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><span style=3D"font-size:0.87=
499rem">It&#39;s a jarring transition. If you take a very narrow view and s=
ay &#39;it&#39;s all GPU work in shared buffers so it should all work the s=
ame&#39;, then client&lt;-&gt;winsys looks the same as client&lt;-&gt;clien=
t gbuffer. But this is a trap.</span><br></div></div></blockquote><div><br>=
</div><div>I think this is where I think we have have a serious gap of what=
 a winsys or a compositor is. Like if you have only a single wayland server=
 running on a physical machine this is easy. But add a VR compositor, an in=
termediate compositor (say gamescope), Xwayland and some containers/VM, som=
e video capture=C2=A0 (or, gasp, a browser that doubles as compositor) and =
this story gets seriously complicated. Like who are you protecting from who=
? at what point is something client&lt;-&gt;winsys vs. client&lt;-&gt;clien=
t?</div></div></div></blockquote><div><br></div><div>As I&#39;ve said upthr=
ead, the line is _seriously_ blurred, and is only getting less clear. Right=
 now, DRI3 cannot even accept a dma_fence, let alone a drm_syncobj, let alo=
ne a memory fence.</div><div><br></div><div>Crossing those boundaries is ha=
rd, and requires as much thinking as typing. That&#39;s a good thing.</div>=
<div><br></div><div>Conflating every synchronisation desire into a single u=
serspace-visible=C2=A0primitive makes this harder, because it treats game t=
hreads the same as other game threads the same as VR compositors the same a=
s embedding browsers the same as compositors etc. Drawing very clear lines =
between game threads and the external world, with explicit weakening as nec=
essary, makes those jarring transitions of privilege and expectation clear =
and explicit. Which is a good thing, since we&#39;re trying to move away fr=
om magic and implicit.</div><div><br></div><div>Cheers,</div><div>Daniel</d=
iv></div></div>

--00000000000012f0a505c06c52dd--

--===============1975671441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1975671441==--
