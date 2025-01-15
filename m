Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E87C3A1187F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 05:29:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D9AA10E4BB;
	Wed, 15 Jan 2025 04:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VxIuCsq9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA9A110E4B7;
 Wed, 15 Jan 2025 04:29:04 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-3ebbde05f6bso245403b6e.2; 
 Tue, 14 Jan 2025 20:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736915284; x=1737520084; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+It6nH5oT1SexjKXk/YXqd5YTz3VL0m/ksXGroOAMDE=;
 b=VxIuCsq97p+gbJl4DC0+B2RTucUE7zF5t04RdESyL9WCsnfWqBGG9QxEWSEEaEKpBS
 KpGsQmQp/NMCqYw2O6bOvjSqrhlEafYcw2jjm8x+HZRIoGfyh6LtOdyFbNajtW73Ylu5
 46SeZSxVMMd1LSU5mmXCExwHRSvHenWXFDdWGk0WYKawW27l1JqRkf39qKZZ0vTi23jT
 eTlGngtoei6xYaLo4tvv43Q0nR+hLTQ4jHxHYaVhJ1GZ2+ikREDFtUaNmiFp/njhlalI
 dlaHHK+nX8NpwF00HeJR9MY1ViMKJRgGHgH8MWZccL4gUKW76uoAdh1UD5ZDdNasnUaZ
 ygig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736915284; x=1737520084;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+It6nH5oT1SexjKXk/YXqd5YTz3VL0m/ksXGroOAMDE=;
 b=q80lZcc2ET7eYGIiESYOVem4GVYN+ULk7x2j+EB+bmNMu6qfFPlyraNykOUk72NCfK
 T0OMJr78T+ocZK6JI6WCsewykwq8H7yntPauHyGPHGofzZNqlbo6c2UGKzNdUSPsZq5q
 Qa2YKrFyx1S0gdvRY3FLATKm74NL5+ObdVR7HHBhcroq4ahjLfY441+0QptpguNMvumh
 /5KE9eTZ1Z3FlvpyFkOtkztW6YX+L7/RZdSeaDHm4wSyWsYVdLrOxFeBexjdpDNOBSgK
 /nCMkVnaNj3HE6fELGrQKZkBu8Kq70IpwxuNv9+IyB2GFzGlm6rwPxDybzzHr1esXc1f
 Qu9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVszIq2ei7upI5EK1Ql+Y7mKF14Zn9kFhmsZX67HQsAfVnrALeK6T2lcLNQ+foV7T2TDiJ0xX6A@lists.freedesktop.org,
 AJvYcCX6q92gyMtTCCSGLhfWVRbUEamQypYn8jQdogSDi7Bzybd6RRnyrx0Bri+YgijFHBihw929CiL7jjOJ@lists.freedesktop.org,
 AJvYcCXvAM39d66eMN/2VsZOgDb4cF3DQFGaSs8AtPn89bMILbpdzVfFqNgFRY9EbtisI9/P+1GosihOrck=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyB+MEsBkMCEABiafpGwx197TcUpXeye3JI/eDnkWN13MPA/kT/
 IUbmc0l+9CZI+y4/I1nkfAEgb3Yf1T9gpQI4CBN2aMqE2Amf7odNHwQBmvLs9kvuNAQjaCBElPF
 othkX4pHDRyniB4ezIbe54ijyfCc=
X-Gm-Gg: ASbGncsX8oPA+rslMXoSuIGeyzmMDubzx9b84WyCLv02VwhXt6BmCXSmqJird+7Rom9
 oyvB2pTUkJlxQ0XSwIh4QToVr5ufjX5IInGm7XvXf
X-Google-Smtp-Source: AGHT+IESH3Yd09VxhUifraxf+mykDqpbbxjz5oxF2QYkDnrA3wFcJHSazzNj8oxdY1XsAMeiX+AKPn3FGQNO6LvIGr8=
X-Received: by 2002:a05:6808:2129:b0:3eb:834f:7769 with SMTP id
 5614622812f47-3ef2ebbb10bmr6489464b6e.2.1736915283947; Tue, 14 Jan 2025
 20:28:03 -0800 (PST)
MIME-Version: 1.0
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
 <uffsfaps6a75zmkyshkwfxgybcslqrnfqqtjzekegdptvwpugc@2ndpcuxyfp3f>
 <c64cb9d8-5ea7-4644-93c8-04a97b758fa0@mailbox.org>
 <h26quuebhpxwkc3fl4vtfteoqyvingnddgxbnzptfnxfg6xgkd@kkkmeqwplomv>
 <8dae97c9-9286-451a-8122-b309eb21b2f4@mailbox.org>
 <Z2Ki-lQH4Fbch6RO@phenom.ffwll.local>
 <q45c43j5kwwvemec7mcs4kqzt54pa3nz3jlhkcky2v63s2vfie@him4q253uw4p>
 <CAPj87rMFJ0JRvsKqZUsw_EGrFWr1VLO4Ne2w_bZ5cH+gs_d=og@mail.gmail.com>
 <Z2Rf7mpSuzZ0ObmT@phenom.ffwll.local>
 <07d08a42-c44a-477e-8057-721b270310cf@nvidia.com>
 <CAAxE2A6N0xtgZmzTR9FXMN79xxy3T8zfhh1sz73h1h8=0ycJ2g@mail.gmail.com>
 <19466180208.28b9.76a0d8c26856b44b62c020e2e9d89f6d@gfxstrand.net>
In-Reply-To: <19466180208.28b9.76a0d8c26856b44b62c020e2e9d89f6d@gfxstrand.net>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Tue, 14 Jan 2025 23:27:27 -0500
X-Gm-Features: AbW1kvarXoZuHfr7hYWjXgVVH7hjT_kuQu76j2zvPRhNbbQsCkE59jYZx5nCbkY
Message-ID: <CAAxE2A7CQWkN_UohysSJEmD7xjNRFZ5dPuANk4G0EkzKpGVj+Q@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
To: Faith Ekstrand <faith@gfxstrand.net>
Cc: James Jones <jajones@nvidia.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Daniel Stone <daniel@fooishbar.org>, Brian Starkey <brian.starkey@arm.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, 
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>, nd@arm.com, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: multipart/alternative; boundary="0000000000008139a7062bb71a54"
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

--0000000000008139a7062bb71a54
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 1:34=E2=80=AFPM Faith Ekstrand <faith@gfxstrand.net=
> wrote:

> On January 14, 2025 03:39:45 Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com> wro=
te:
>
>> I would keep the existing modifier interfaces, API extensions, and
>> expectations the same as today for simplicity.
>>
>> The new linear modifier definition (proposal) will have these fields:
>>    5 bits for log2 pitch alignment in bytes
>>    5 bits for log2 height alignment in rows
>>    5 bits for log2 offset alignment in bytes
>>    5 bits for log2 minimum pitch in bytes
>>    5 bits for log2 minimum (2D) image size in bytes
>>
>
> I'm not strictly opposed to adding a new modifier or two but this seems
> massively over-designed. First off, no one uses anything but simple 2D
> images for WSI and BOs are allocated in units of 4k pages so 2, 4, and 5
> can go. If we assume pitch alignment and offset alignment are the same (a=
nd
> offset is almost always 0 anyway), 3 can go.
>
> Even with that, I'm struggling to see how useful this is. My understandin=
g
> is that you're trying to solve a problem where you need an exact 64-byte
> alignment for some AMD scanout stuff. That's not even possible to support
> on Nvidia (minimum alignment is 128B) so practically you're looking at on=
e
> modifier that's shared between AMD and Intel. Why can't we just add an AM=
D
> modifier, make Intel support it, and move on?
>
> Otherwise we're massively exploding the modifier space for... Why? Intel
> will have to advertise basically all of them. Nvidia will advertise most =
of
> them. AMD will advertise something. And now apps have tens of thousands o=
f
> modifiers to sort through when we could have just added one and solved th=
e
> problem.
>

I don't think I'm being understood. See my reply to Daniel. There is no
exploding of anything. It's the same thing we have today for vendor
modifiers - lots of fields with lots of possible values, but only a few
values are used.

It's most likely under-designed, but it exactly solves the problem. The
minimum requirement for every modifier is that it must exactly identify a
memory layout. Saying that we just need a pitch alignment of 256B (that's
the AMD one) is not enough. Height alignment and image size alignment are
required to make sure that the next plane doesn't start in the padding area
because it can be overwritten randomly OR it can be read and cause a page
fault if the full padding isn't allocated. Offset alignment is also
required for multi plane images. If you want all allocators to allocate
NV12 equally, the 5 fields are required.

Marek

--0000000000008139a7062bb71a54
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Jan 14, 2025 at 1:34=E2=80=AFPM Faith=
 Ekstrand &lt;<a href=3D"mailto:faith@gfxstrand.net">faith@gfxstrand.net</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><u>=
</u>

<div>
<div dir=3D"auto">
<div dir=3D"auto"><span style=3D"font-size:10pt">On January 14, 2025 03:39:=
45 Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:maraeo@gmail.com" target=3D"=
_blank">maraeo@gmail.com</a>&gt; wrote:</span></div><div id=3D"m_-147009351=
912632687aqm-original" style=3D"color:black"><div><div style=3D"color:black=
">
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.75ex;border-left:1px solid rgb(128,128,128);padding-left:0.75ex">
<div dir=3D"ltr"><div>I would keep the existing modifier interfaces, API ex=
tensions, and expectations the same as today for simplicity.</div><div><br>=
</div><div><div>The new linear modifier definition (proposal) will have the=
se fields:</div><div>=C2=A0=C2=A0 5 bits for log2 pitch alignment in bytes<=
/div><div>=C2=A0=C2=A0 5 bits for log2 height alignment in rows<br></div><d=
iv>=C2=A0=C2=A0 5 bits for log2 offset alignment in bytes</div><div><div>=
=C2=A0=C2=A0 5 bits for log2 minimum pitch in bytes<br></div><div><div>=C2=
=A0=C2=A0 5 bits for log2 minimum (2D) image size in bytes</div></div></div=
></div></div></blockquote></div></div></div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">I&#39;m not strictly opposed to adding a new modifier or two=
 but this seems massively over-designed. First off, no one uses anything bu=
t simple 2D images for WSI and BOs are allocated in units of 4k pages so 2,=
 4, and 5 can go. If we assume pitch alignment and offset alignment are the=
 same (and offset is almost always 0 anyway), 3 can go.</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Even with that, I&#39;m struggling to see h=
ow useful this is. My understanding is that you&#39;re trying to solve a pr=
oblem where you need an exact 64-byte alignment for some AMD scanout stuff.=
 That&#39;s not even possible to support on Nvidia (minimum alignment is 12=
8B) so practically you&#39;re looking at one modifier that&#39;s shared bet=
ween AMD and Intel. Why can&#39;t we just add an AMD modifier, make Intel s=
upport it, and move on?=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Otherwise we&#39;re massively exploding the modifier space for... Why=
? Intel will have to advertise basically all of them. Nvidia will advertise=
 most of them. AMD will advertise something. And now apps have tens of thou=
sands of modifiers to sort through when we could have just added one and so=
lved the problem.</div></div></div></blockquote><div></div><div><br></div><=
div></div>I don&#39;t think I&#39;m being understood. See my reply to Danie=
l. There is no exploding of anything. It&#39;s the same thing we have today=
 for vendor modifiers - lots of fields with lots of possible values, but on=
ly a few values are used.<br></div><div class=3D"gmail_quote gmail_quote_co=
ntainer"><br></div><div class=3D"gmail_quote gmail_quote_container">It&#39;=
s most likely under-designed, but it exactly solves the problem. The minimu=
m requirement for every modifier is that it must exactly identify a memory =
layout. Saying that we just need a pitch alignment of 256B (that&#39;s the =
AMD one) is not enough. Height alignment and image size alignment are requi=
red to make sure that the next plane doesn&#39;t start in the padding area =
because it can be overwritten randomly OR it can be read and cause a page f=
ault if the full padding isn&#39;t allocated. Offset alignment is also requ=
ired for multi plane images. If you want all allocators to allocate NV12 eq=
ually, the 5 fields are required.</div><div class=3D"gmail_quote gmail_quot=
e_container"><br></div><div class=3D"gmail_quote gmail_quote_container">Mar=
ek<br></div></div>

--0000000000008139a7062bb71a54--
