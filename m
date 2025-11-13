Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F8CC563C2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 09:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83BE410E5EE;
	Thu, 13 Nov 2025 08:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iUKrN/27";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1899910E13A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 07:34:06 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-640aa1445c3so767427a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 23:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763019244; x=1763624044; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=TriPsvX0S1fV8Cc8xg2lFr65U+SxMrFP8wRSHw14tJc=;
 b=iUKrN/27f1rZm1GdxaHr2kgi421beubcOXfrnho+zFwOfxK5ufZePQL8S6L/mfKEkM
 3+ss/kbp8VMGcrspfmgv7qMzCIY5pUzJc3wlBbr2uMnKaWOplIEnIFoxUdiVNSlMqgY6
 gGO4xBS2S1YuWptCyjqtMKYc4CP6ARKPU2JQoBVBwmsimQH9jHOHg0+TNsH07G5lUq2r
 QDGsJA6dcdyjxAL4nL9cWWGXdJ+cVzZwD44UJ/O4jiiqMAcC9paFbC2WjRkbZNbfQf94
 5wsukr1yLSPMnnRW1Ma2pGXZ5bzXOugcigrXT2pQWB3+udG0uvvN3fXjmL4spWHQKTmA
 VxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763019244; x=1763624044;
 h=to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TriPsvX0S1fV8Cc8xg2lFr65U+SxMrFP8wRSHw14tJc=;
 b=kNoyLoEsHlV0FLd4UDIAcVrkavUkLoSxt19k1SE8knZ+dHutySKVR6Z/4xr5ywzLwE
 7Q/4n0RFCkJUMmQwiaNzT8imR6R5+KOqDHXQNAnoXdIbsRlMfpZfrZR04axtCRkYQNeC
 wVjLX0JrGOvpl7gveeesbLwMLWRhNHCnkSI6isPANQgndgm4qTqEq/BnXiA9xD+62bKq
 wAZ+Q89hi0GaJMr1hpQGaV7geSVEekfHq242nMBIbyQqU8u7e0JGo3M4Ha26lHUQ48Oq
 AJBg+oSnGi97e5W5YmxrdQlTz6WSaqAdMUdMNTpOkyCKxuE0Jn10BFv03nCaIMhiE/O1
 FnFA==
X-Gm-Message-State: AOJu0YzO0tv3ATmJeAsMoahoy1UGdhP2FP/WBp79I9n3qrQ7dm8oK5me
 nX58jiYEOL1l2G/6m+fRpfEGHEJM/XvBoqD6y5ps30RP38ihI4D875NxI/n0PrJZiCV2CWGslXf
 sW0eCjAVDuvOPhr3AU4ZKlMAjF/DKlzz63Q==
X-Gm-Gg: ASbGncuJOLxAGYGeP8nuYyiDbp0OR+pqHV7xUg9asCA5/CJ6HOcftezNo1z+QbbzIjT
 tXTxUZnO+IJBwfqYYrIQL8XGDLx2MozN3JyYBzAS7UtGf8EeVZbORMjMuJ0qB8aLVbqYf2QWilt
 xiscTj6Jij5ALwW8jj/j86lz2LyE0w2AZTwuYCrDQF9io1CFgDlVDnFtc7WiKoZoeDw5sbqYq+r
 1o0lZNg/kqznXfQebQxNDVFIKY4pTNS+8K9A653JGLuMQ0KgGWxZPkZZVbbQVPQQsSVmPLjoz+Z
 lLj4lrP8fcpHjopcg8Q=
X-Google-Smtp-Source: AGHT+IFaiVXD7NBvpKys8YpmdXZH7sx8DW3/FOPvNoBaPUjnNtxTgk4BeViMojm/3o839dRJHQxJ9XEOpcM8WBGvkHo=
X-Received: by 2002:a17:907:7249:b0:b70:b13c:3622 with SMTP id
 a640c23a62f3a-b733195f3a7mr648606066b.4.1763019244153; Wed, 12 Nov 2025
 23:34:04 -0800 (PST)
MIME-Version: 1.0
From: rat marrow <ratmarrow@gmail.com>
Date: Thu, 13 Nov 2025 02:33:52 -0500
X-Gm-Features: AWmQ_blKTIfewg8xFCYgRERK4BDqTTaK0mwVasVPLi6GBpBgvvNLrL4vfSx5Se0
Message-ID: <CAP4Oc0n+CHTR+BNrDhLEjHd5+AK73W5qthaPu6d2jSiD1jC=Ug@mail.gmail.com>
Subject: Plea for low-latency cursor rendering functionality.
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000c7ae7c064374e7c2"
X-Mailman-Approved-At: Thu, 13 Nov 2025 08:22:35 +0000
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

--000000000000c7ae7c064374e7c2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I came here from a discussion on the Hyprland repo a few months back:
https://github.com/hyprwm/Hyprland/discussions/10823#discussioncomment-1360=
1563

I was initially planning to just bide my time until maybe, just maybe,
someone with more know-how would have the same issue I have and take action
on it, but I figured maybe reaching out couldn=E2=80=99t hurt?

To preface, I do not have the technical knowledge to fully *understand* wha=
t
I am asking for, as in what would have to be done to support such a
functionality.

I also want to say that I am not coming from the perspective of gaming, as
there have been many strides in conditional tearing control. This is about
the desktop experience.

As I=E2=80=99m sure you all know, in X11, assuming one hasn=E2=80=99t modif=
ied the
functionality in some way, the cursor is updated as soon as possible. This
means minimal latency, at the cost of barely noticeable tearing on the
cursor plane, and artifacts where, as an example, a window you are dragging
will lag behind the cursor.

Now, obviously for a lot of users, the latency trade-off is worth the more
visually perfect frame, but there are some people (Hi!) who would be
willing to sacrifice that perfection for a more responsive system.

What I am asking for, put simply, is functionality that allows an end-user
to enable this behaviour and accept the trade-offs that come with it.

I really hope this can start a discussion, and maybe, hopefully, lead to
this becoming a reality.

--000000000000c7ae7c064374e7c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">I came here from a discussion on the Hyprland repo a=
 few months back:=C2=A0<a href=3D"https://github.com/hyprwm/Hyprland/discus=
sions/10823#discussioncomment-13601563" target=3D"_blank">https://github.co=
m/hyprwm/Hyprland/discussions/10823#discussioncomment-13601563</a>
</div><div dir=3D"auto"><br></div><div dir=3D"auto">I was initially plannin=
g to just bide my time until maybe, just maybe, someone with more know-how =
would have the same issue I have and take action on it, but I figured maybe=
 reaching out couldn=E2=80=99t hurt?</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">To preface, I do not have the technical knowledge to fully <i>=
understand</i><span>=C2=A0what I am asking for, as in what would have to be=
 done to support such a functionality.</span></div><div dir=3D"auto"><span>=
<br></span></div><div dir=3D"auto"><span>I also want to say that I am not c=
oming from the perspective of gaming, as there have been many strides in co=
nditional tearing control. This is about the desktop experience.</span></di=
v><div dir=3D"auto"><span><br></span></div><div dir=3D"auto"><span>As I=E2=
=80=99m sure you all know, in X11, assuming one hasn=E2=80=99t modified the=
 functionality in some way, the cursor is updated as soon as possible. This=
 means minimal latency, at the cost of barely noticeable tearing on the cur=
sor plane, and artifacts where, as an example, a window you are dragging wi=
ll lag behind the cursor.</span></div><div dir=3D"auto"><span><br></span></=
div><div dir=3D"auto"><span>Now, obviously for a lot of users, the latency =
trade-off is worth the more visually perfect frame, but there are some peop=
le (Hi!) who would be willing to sacrifice that perfection for a more respo=
nsive system.</span></div><div dir=3D"auto"><span><br></span></div><div dir=
=3D"auto"><span>What I am asking for, put simply, is functionality that all=
ows an end-user to enable this behaviour and accept the trade-offs that com=
e with it.</span></div><div dir=3D"auto"><br></div><div dir=3D"auto">I real=
ly hope this can start a discussion, and maybe, hopefully, lead to this bec=
oming a reality.</div><div dir=3D"auto"><br></div>
</div>

--000000000000c7ae7c064374e7c2--
