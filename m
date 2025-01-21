Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A31CA18599
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 20:22:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DB010E20B;
	Tue, 21 Jan 2025 19:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ctDdrFCV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4492B10E20B;
 Tue, 21 Jan 2025 19:22:34 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3eb8583e9f0so988737b6e.1; 
 Tue, 21 Jan 2025 11:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737487353; x=1738092153; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0NK3hXMftqmRUpwUCPGcGtU49DbTM35z8//m0dfrfNA=;
 b=ctDdrFCVhgtkK5XJR5g+xtqFnub7083uuwJOhf2c/iiZzCDaGyVByU4d0bqwksOgiF
 I+XuX5rhoUB6divQ24FvFD+Tp5KPki4iDZ7U8CLPX/8m7G353kZbfxjYW0S6EDocj+AZ
 yXu67Tvg++KfaG5AJukokXSmJ9ax0EuG9ypkEtbsUdxtpMX6VRbRsGydjiyb/NGOON2m
 F4yIKBo8cDRqVH9/9igK/WLYSPa3Q7CMlcj97U+e1DqLL7P2JWd8SgQwTq9qYi/EPPcv
 PldGmOkhJUExHLF+2ESF7VDhCZwpEVsNennKw3ZZZEcvx1xPgEt/IP50DnB3bA4tHsnR
 zZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737487353; x=1738092153;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0NK3hXMftqmRUpwUCPGcGtU49DbTM35z8//m0dfrfNA=;
 b=g5juTiNBPsAGUblDKDMw2pOUCxApH9XG0yfatHUZNCiCVXgRCMFF24skbjPAsVz7LK
 ysxVpa0MDLzUhwbLHoC6sSViyRvbwhs59e7L3bDxD7oVnmAHIEckdpdSImPgFcozT42V
 chNMqfw0AulcTC/l4rJmoRmI5id7y7aWnifr19X+MGnMH0bNKtngrGWYWLqF2qxHJjlx
 0cKpsPgd7E6/THFqaOBfZUHm0pD3BM5aZhQeQ27H/JSbiGscu2d/NEnLoQ7ZioGvPvCo
 0uNbq9nSR7YclFnie8YBOKmLtn/hnXwY1jlk89nVGz+OCz6SrJ4wTIPWKfZgyBaI9/XM
 Pg9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+KHh9iMFyom4fsUMgOXkPjMlMP+eBAC4vJRNWHbdz2SiiXVZWzu5Dy/xHOTqxcNtgkgXGszLX@lists.freedesktop.org,
 AJvYcCWJlG2RQA+EIU+p1Pvrh59655llaTh5WQUcDuwXnrdC9OeWjTwcaKhJYx0ix2wzMEjiD6Ypn9apt4E=@lists.freedesktop.org,
 AJvYcCWbhZUsSJAtSbqGLAqLVa9cZubA2y13DN0TTdTwwFkYxCUiiMdWa4LxDnfTn0nou3q7azZu+Bx8t3fK@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmsAWFggayQYTsN8lCfwRdNJpxmfILOtyhHQ9ITX2hf6GHPx0U
 vayrn5pcQzZjK3fueapJGRy4RycHVjRFJr2IMGXTzeRernqM33YILFQ8DIwURWM0MKAXYRaAoVr
 JfAuEquQvF+qtjR/eOvcPqwBYZTA=
X-Gm-Gg: ASbGncvOCdNRau1I7gGHz4Z5d9To4X4hu22P5uoclmRgk6MK26nIVZWXHpf9/q5Dlyq
 pqaC3LJH0nvEAy/4KFDBc8Ejm272KDsS5sK8ksWib5Xi3EfngsXCq
X-Google-Smtp-Source: AGHT+IHA/2aKVDb9MnLNMISmiXlIQLOj5O9vo/FNQ78whCjnbqn1MP/5R/NIx7wAyxsbhxv+PQT+UB8wLxuQ1ej8eSs=
X-Received: by 2002:a05:6820:2106:b0:5f5:2d91:da4c with SMTP id
 006d021491bc7-5fa737d474dmr251727eaf.2.1737487353242; Tue, 21 Jan 2025
 11:22:33 -0800 (PST)
MIME-Version: 1.0
References: <CAPj87rMFJ0JRvsKqZUsw_EGrFWr1VLO4Ne2w_bZ5cH+gs_d=og@mail.gmail.com>
 <Z2Rf7mpSuzZ0ObmT@phenom.ffwll.local>
 <07d08a42-c44a-477e-8057-721b270310cf@nvidia.com>
 <CAAxE2A6N0xtgZmzTR9FXMN79xxy3T8zfhh1sz73h1h8=0ycJ2g@mail.gmail.com>
 <CAPj87rP4r4q-wBx1dHsEkZ7=S2c2XsbA1Pz4Skw1ETt_2yD2Ag@mail.gmail.com>
 <CAAxE2A6ghBK2VTLkNXgk1c61UG1ZQAzWQ4q=wO-OShAUC9eRmQ@mail.gmail.com>
 <CAPj87rNFy7GLAjjxDYGLN-f8M0F7yMX6PED94O4kBJ=pwtPVyA@mail.gmail.com>
 <Z4pmnTy1NYD3rLwS@phenom.ffwll.local>
 <CAAxE2A6iDsN=YKW2F7WyyZxn4Sw4Dr5CxZminQGwf8awBivovQ@mail.gmail.com>
 <0e9aee49-aa69-4fb6-bab8-4624143f5267@suse.de>
 <Z46Y4EME7T6yejWP@phenom.ffwll.local>
In-Reply-To: <Z46Y4EME7T6yejWP@phenom.ffwll.local>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Tue, 21 Jan 2025 14:21:57 -0500
X-Gm-Features: AbW1kvZTQuqa6Lm9Yr9zisb2n7ShkvxMdxRVKcMr3x4M_nubLEMqZNa8Qn8YvzA
Message-ID: <CAAxE2A7T0ho42j_a1XbqA1wdCTECZs_MjBb-THv3c+HudWAULQ@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Stone <daniel@fooishbar.org>, 
 James Jones <jajones@nvidia.com>, Brian Starkey <brian.starkey@arm.com>, 
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, 
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>, nd@arm.com, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: multipart/alternative; boundary="0000000000007dec76062c3c4ca7"
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

--0000000000007dec76062c3c4ca7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2025 at 1:41=E2=80=AFPM Simona Vetter <simona.vetter@ffwll.=
ch>
wrote:

> On Mon, Jan 20, 2025 at 08:58:20AM +0100, Thomas Zimmermann wrote:
> > Hi
> >
> >
> > Am 18.01.25 um 03:37 schrieb Marek Ol=C5=A1=C3=A1k:
> > [...]
> > >
> > > 3) Implementing DRM_FORMAT_MOD_LINEAR as having 256B pitch and offset
> > > alignment. This is what we do today. Even if Intel and some AMD chips
> > > can do 64B or 128B alignment, they overalign to 256B. With so many
> > > AMD+NV laptops out there, NV is probably next, unless they already do
> > > this in the closed source driver.
>
> I don't think this works, or at least not any better than the current
> linear modifier. There's way too many users of that thing out there that =
I
> think you can realistically redefine it.
>

DRM_FORMAT_MOD_LINEAR was redefined on PC a long time ago to mean 256B
pitch alignment because of laptops with AMD+Intel. Drivers redefined it
because that's what happens when it's under-defined. As you say,
DRM_FORMAT_MOD_LINEAR can't be removed, but then it can't work with any
other pitch alignment on all PC hw either, so there is no other choice.

The options for PC are either a new parameterized linear modifier (with
properly defined addressing and size equations) or DRM_FORMAT_MOD_LINEAR
with 256B pitch alignment. There is no 3rd option. Even if you totally
disregard AMD, you won't get it below 128B or 64B on the rest of PC hw
anyway, and that's the same problem.

Marek

--0000000000007dec76062c3c4ca7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Jan 20, 2025 at 1:41=E2=80=AFPM Simon=
a Vetter &lt;<a href=3D"mailto:simona.vetter@ffwll.ch">simona.vetter@ffwll.=
ch</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On Mon, Jan 20, 2025 at 08:58:20AM +0100, Thomas Zimmermann wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; <br>
&gt; Am 18.01.25 um 03:37 schrieb Marek Ol=C5=A1=C3=A1k:<br>
&gt; [...]<br>
&gt; &gt; <br>
&gt; &gt; 3) Implementing DRM_FORMAT_MOD_LINEAR as having 256B pitch and of=
fset<br>
&gt; &gt; alignment. This is what we do today. Even if Intel and some AMD c=
hips<br>
&gt; &gt; can do 64B or 128B alignment, they overalign to 256B. With so man=
y<br>
&gt; &gt; AMD+NV laptops out there, NV is probably next, unless they alread=
y do<br>
&gt; &gt; this in the closed source driver.<br>
<br>
I don&#39;t think this works, or at least not any better than the current<b=
r>
linear modifier. There&#39;s way too many users of that thing out there tha=
t I<br>
think you can realistically redefine it.<br></blockquote><div><br></div>DRM=
_FORMAT_MOD_LINEAR was redefined on PC a long time ago to mean 256B pitch a=
lignment because of laptops with AMD+Intel. Drivers redefined it because th=
at&#39;s what happens when it&#39;s under-defined. As you say, DRM_FORMAT_M=
OD_LINEAR can&#39;t be removed, but then it can&#39;t work with any other p=
itch alignment on all PC hw either, so there is no other choice.</div><div =
class=3D"gmail_quote gmail_quote_container"><br></div><div class=3D"gmail_q=
uote gmail_quote_container">The options for PC are either a new=C2=A0parame=
terized linear modifier (with properly defined addressing and size equation=
s) or DRM_FORMAT_MOD_LINEAR with 256B pitch alignment. There is no 3rd opti=
on. Even if you totally disregard AMD, you won&#39;t get it below 128B or 6=
4B on the rest of PC hw anyway, and that&#39;s the same problem.<br></div><=
div class=3D"gmail_quote gmail_quote_container"><br></div><div class=3D"gma=
il_quote gmail_quote_container">Marek<br></div></div>

--0000000000007dec76062c3c4ca7--
