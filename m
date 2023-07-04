Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5672F7467AD
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 04:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D1C10E260;
	Tue,  4 Jul 2023 02:44:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4F510E260;
 Tue,  4 Jul 2023 02:44:35 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b5c231c23aso81817341fa.0; 
 Mon, 03 Jul 2023 19:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688438674; x=1691030674;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UmilaBRZuw/PBhJRaUjSlxfW4hvSdwbgxMQ7oNEaN9Q=;
 b=aqRU6v4yFIv/OXevz+dFWGnO0YEePaVvr8M0NDqPi5CygI6sniCQrkkvYTeVtykBqp
 qMMwSFVgtu/Qj0LunwLIkH05/QXs/6+r8f9q7KvAYy/2F1/Pxqwb0XoCBEFX0u1XOf9z
 mX5fkAC8KEPrBj65JWBBFo+Z93MurT0gY1Wddok+H0SATnGuju2uFq+5y6USYzQIsQCH
 dVn8/fBmN9NCnHeXV/aS/axu5xAcPXg4tH6DitC8dhUp0qbtDBhlB0151qGNqi16zIon
 VIpkZ4jqy+/CSjsRZe2LSaDceD9U0KwIw4pUViRD1zZ1881EQDw2mIzxjztni0E4CWhL
 N2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688438674; x=1691030674;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UmilaBRZuw/PBhJRaUjSlxfW4hvSdwbgxMQ7oNEaN9Q=;
 b=hshTyoq3VsZnMoZTnfBBtWH/9xX+VCcpgZra9a6VdSJM6fTq8BwCocwoD8U/DxADwX
 mvsb2L4XeMqujOTAF2mhnL0yjp2C5WJqHyhKQGFvTct9WGT4MhpLO3zzQRT3CQ+rhd5x
 6Wbp/RwUchON350nPJ8+JG1wuOASkKXPgeSC+UtnXM4yur5YLutSG7fkw9YGzm07wOq4
 UX9gDD0P0s4HHM9YDb4lH0/2VCSbNGCgj40GdhJthzOu+e5efOvquAXZqn0SE6614Z8+
 o3GwBitvm3unFoDn3V31hutR5WPXwnVDeARI/UbgqgHKB5M1C8izbcxcr+JHOiVjChYe
 VuCg==
X-Gm-Message-State: ABy/qLYlBBEB61+LocNb66AReOQapRExxJFq5PF6vP48jM4g3jCkQ8Sr
 +9Agk9g2wCLrkuLbAYkQHTRuTrgBlgjtwbKo5Jb5AwCO
X-Google-Smtp-Source: APBJJlHb7Oz0/4R5sagk1I9THHmmlDOSZbR56LaQlNiVw98b81FYMN7L4zPIUuismJE0G7+NxKm2LtWpc9K8EaGdHNk=
X-Received: by 2002:a05:6512:3193:b0:4fb:9e1a:e592 with SMTP id
 i19-20020a056512319300b004fb9e1ae592mr10318254lfe.4.1688438673723; Mon, 03
 Jul 2023 19:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230627132323.115440-1-andrealmeid@igalia.com>
 <CA+hFU4z1pc=KUVVqyqfXEceUqMXQgh-qUnuB=1nkPELghvQO7w@mail.gmail.com>
 <CADnq5_MNVdtdcWKSz6dgmsjg+kEu8p5FVE+fkw_5BaXeG3QGow@mail.gmail.com>
 <afab1f5a-e581-3416-e2c2-238ea120655b@mailbox.org>
 <CAAxE2A5C96k5ua+r938VA_+w7gHHNTdF3n8LwDb98W0Bf9wCVA@mail.gmail.com>
 <7c1e6df5-1ad4-be3c-b95d-92dc62a8c537@mailbox.org>
 <CAAxE2A7RGDY4eRC85CsqfszNzyKvMU2MX1wa+3HZ1hgNeAw3cQ@mail.gmail.com>
 <ca7ec187-ffbc-0779-0dbe-21238a566e7b@infradead.org>
In-Reply-To: <ca7ec187-ffbc-0779-0dbe-21238a566e7b@infradead.org>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Mon, 3 Jul 2023 22:44:20 -0400
Message-ID: <CAAxE2A5UizddTTBWtuL480bDxgniVcBq7fjRGQhoC-5FG9vKpA@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] drm/doc: Document DRM device reset expectations
To: Randy Dunlap <rdunlap@infradead.org>
Content-Type: multipart/alternative; boundary="0000000000005f551d05ffa04305"
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
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
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

--0000000000005f551d05ffa04305
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 3, 2023, 22:38 Randy Dunlap <rdunlap@infradead.org> wrote:

>
>
> On 7/3/23 19:34, Marek Ol=C5=A1=C3=A1k wrote:
> >
> >
> > On Mon, Jul 3, 2023, 03:12 Michel D=C3=A4nzer <michel.daenzer@mailbox.o=
rg
> <mailto:michel.daenzer@mailbox.org>> wrote:
> >
>
> Marek,
> Please stop sending html emails to the mailing lists.
> The mailing list software drops them.
>
> Please set your email interface to use plain text mode instead.
> Thanks.
>

The mobile Gmail app doesn't support plain text, which I use frequently.

Marek


> --
> ~Randy
>

--0000000000005f551d05ffa04305
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Jul 3, 2023, 22:38 Randy Dunlap &lt;<a href=3D=
"mailto:rdunlap@infradead.org">rdunlap@infradead.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><br>
<br>
On 7/3/23 19:34, Marek Ol=C5=A1=C3=A1k wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Mon, Jul 3, 2023, 03:12 Michel D=C3=A4nzer &lt;<a href=3D"mailto:mi=
chel.daenzer@mailbox.org" target=3D"_blank" rel=3D"noreferrer">michel.daenz=
er@mailbox.org</a> &lt;mailto:<a href=3D"mailto:michel.daenzer@mailbox.org"=
 target=3D"_blank" rel=3D"noreferrer">michel.daenzer@mailbox.org</a>&gt;&gt=
; wrote:<br>
&gt; <br>
<br>
Marek,<br>
Please stop sending html emails to the mailing lists.<br>
The mailing list software drops them.<br>
<br>
Please set your email interface to use plain text mode instead.<br>
Thanks.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D=
"auto">The mobile Gmail app doesn&#39;t support plain text, which I use fre=
quently.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Marek</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
<br>
-- <br>
~Randy<br>
</blockquote></div></div></div>

--0000000000005f551d05ffa04305--
