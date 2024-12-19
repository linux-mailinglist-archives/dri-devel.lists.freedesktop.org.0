Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 483E79F7304
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 03:54:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB61B10EC6B;
	Thu, 19 Dec 2024 02:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YXMsacAM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE79110EC69;
 Thu, 19 Dec 2024 02:54:34 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5d0bf4ec53fso57529a12.0; 
 Wed, 18 Dec 2024 18:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734576873; x=1735181673; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cW+l3LAytY5cTxfccPGmPT3WxrsdlT1ELBqVbj1Ew1w=;
 b=YXMsacAM/omrI1AbeMf9l65RveUekcpxtOfSL9Njee9x+bsAHex3jaMr9MTlBg1h9j
 vmhKHrFQewCUVtQdwkCL90V5ISAwLy9ViOGnVg17AcgPrZNdJa8GTqxcVEX7EGFqdlht
 zaVhcUR3MoWUQlqXy6q8CuLvvXBXFef9P8KSNpVvMjSpB8YzI5E44qqaLcKiM0DbvSoI
 HJ2WGC3SUkm5VKS1zgCJYgtmfdeydH+YKCsjDmEJ2GWS1URQyIweIMIdRcE+hqpv3LOm
 nwdJ7kay3K220Y20RUAVq7Ho0rzl7aT+KubXAMdD+3ss+t1I+sWVgRChXuF768/swfh4
 SoIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734576873; x=1735181673;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cW+l3LAytY5cTxfccPGmPT3WxrsdlT1ELBqVbj1Ew1w=;
 b=ldZ8hPpF3rGZ+FiKtvhB43v0tdWr7efNI653Y78/qKd1a6qXh9stKi0+xIi7S+uoHa
 IEO/wqf+31A1xcebDK6QniwD14cVrqGfCuhGefW1qFp2OIdTAzzeHqcM+auo3V7fKxO6
 zNtIPiILYihBjVqTt6nSiT6qD2CevDPQO/hTg0kAXINdPQZ39r7MHF7QbKk+nWGnlLcI
 WJTo1xtsTHC3nACwfRrFx5mlqhaISRZ1VS0x0rA4rHFWyxlUexVKesJ1CpzL/eJVohWf
 Y4J/2607vFB88dxM7/8HcrutBn/5WHvks5ZpVI1D0zT/EGZ4IQjmTOzVmYi1Of3mBytU
 2nVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7TuYNSWF3615XxyCmJaut4xCNmRgs2yE6ZoJ3gTSyD1pkR9haoxT1MD9w1PB/zH9eaaipFTPxLVw=@lists.freedesktop.org,
 AJvYcCUcawGBBDHnVsCVmRCnY+hVLAEo5t+iuSNzxMK23/HCuoYaEH9Lc7+Bc46GIXrGKYDIZulmDXxr@lists.freedesktop.org,
 AJvYcCV2Dxgt5TXb1zhpaJpKNX8nFgT3WtUxEUWUN67HEsmkEuV500cfFsVJPK/JZD8ODwsi+6tIyAgitizN@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysUtbSiiODwvUdiKQ5KYwhY4GtIbRoCaOnZao1+RZ16LOCt9dh
 qmx3WvPUNvygtYzupw0At8ZDfV5DVowKdMqj4gz5zLVirunSSESWLu83P0p4UBMl8J8wP4p+W4d
 arTBINIbVWm7wFFUzdZoq8JAoBhGvQQ==
X-Gm-Gg: ASbGncuKxDW9Q845XAFKQzZjeD62fwMpwc1HwpBa4OYw3eIt51yAC68xQGJpfoIhFvT
 IIIX7nn4Tu9Yfubv5GK+SWsZ91Vo4NLmYbIsXvX5/
X-Google-Smtp-Source: AGHT+IFTy02yaoPOAM4JVLxLffqNcSgp9Ed/xg5icGQuddN4Q6HRBhrGO4jhsdc+qnS3VvDshz7mWXjHuhvr/Vvs6rg=
X-Received: by 2002:a05:6402:524d:b0:5d3:e79b:3b4f with SMTP id
 4fb4d7f45d1cf-5d7ee3f3e72mr1901626a12.8.1734576873011; Wed, 18 Dec 2024
 18:54:33 -0800 (PST)
MIME-Version: 1.0
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
 <uffsfaps6a75zmkyshkwfxgybcslqrnfqqtjzekegdptvwpugc@2ndpcuxyfp3f>
 <c64cb9d8-5ea7-4644-93c8-04a97b758fa0@mailbox.org>
 <h26quuebhpxwkc3fl4vtfteoqyvingnddgxbnzptfnxfg6xgkd@kkkmeqwplomv>
 <8dae97c9-9286-451a-8122-b309eb21b2f4@mailbox.org>
 <Z2Ki-lQH4Fbch6RO@phenom.ffwll.local>
 <q45c43j5kwwvemec7mcs4kqzt54pa3nz3jlhkcky2v63s2vfie@him4q253uw4p>
In-Reply-To: <q45c43j5kwwvemec7mcs4kqzt54pa3nz3jlhkcky2v63s2vfie@him4q253uw4p>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Wed, 18 Dec 2024 21:53:56 -0500
Message-ID: <CAAxE2A5+=QVAFXXCbe3qEgY-Mzb-5XW73CYdANEO+N_xA+ivaw@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
To: Brian Starkey <brian.starkey@arm.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, 
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>, nd@arm.com
Content-Type: multipart/alternative; boundary="0000000000005a02cc062996a6d4"
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

--0000000000005a02cc062996a6d4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 5:32=E2=80=AFAM Brian Starkey <brian.starkey@arm.co=
m> wrote:

> On Wed, Dec 18, 2024 at 11:24:58AM +0000, Simona Vetter wrote:
> >
> > For that reason I think linear modifiers with explicit pitch/size
> > alignment constraints is a sound concept and fits into how modifiers wo=
rk
> > overall.
> > -Sima
>
> Could we make it (more) clear that pitch alignment is a "special"
> constraint (in that it's really a description of the buffer layout),
> and that constraints in-general shouldn't be exposed via modifiers?
>

Modifiers uniquely identify image layouts. That's why they exist and it's
their only purpose.

It doesn't matter how many modifiers we have. No app should ever parse the
modifier bits. All apps must treat modifiers as opaque numbers. Likewise,
documentation of all modifiers in drm_fourcc.h is only meant for driver
developers. No developers of apps should ever use the documentation. There
can be a million modifiers and a million different devices, and the whole
system of modifiers would fall apart if every app developer had to learn
all of them.

The only thing applications are allowed to do is query modifier lists from
all clients, compute their intersection, and pass it to one of the clients
for allocation. All clients must allocate the exact same layout, otherwise
the whole system of modifiers would fall apart. If the modifier dictates
that the pitch and alignment are not variables, but fixed values derived
from width/height/bpp, then that's what all clients must allocate.

If any app uses DRM_FORMAT_MOD_LINEAR directly instead of querying
supported modifiers from clients, it's a misuse of the API.

DRM_FORMAT_MOD_LINEAR will be deprecated because it's the only modifier
that is generally non-functional (it's only functional in special cases).
After new linear modifiers land, drivers will stop
supporting DRM_FORMAT_MOD_LINEAR if they can't support all pitches and
alignments because we only want to have functional software.

Marek

--0000000000005a02cc062996a6d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Dec 18, 2024 at 5:32=E2=80=AFAM Brian Stark=
ey &lt;<a href=3D"mailto:brian.starkey@arm.com" target=3D"_blank">brian.sta=
rkey@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Wed, Dec 18, 2024 at 11:24:58AM +0000, Simona Vetter wrote:<=
br>
&gt; <br>
&gt; For that reason I think linear modifiers with explicit pitch/size<br>
&gt; alignment constraints is a sound concept and fits into how modifiers w=
ork<br>
&gt; overall.<br>
&gt; -Sima<br>
<br>
Could we make it (more) clear that pitch alignment is a &quot;special&quot;=
<br>
constraint (in that it&#39;s really a description of the buffer layout),<br=
>
and that constraints in-general shouldn&#39;t be exposed via modifiers?<br>=
</blockquote><div><br></div>Modifiers uniquely identify image layouts. That=
&#39;s why they exist and it&#39;s their only purpose.</div><div class=3D"g=
mail_quote"><br></div><div class=3D"gmail_quote">It doesn&#39;t matter how =
many modifiers we have. No app should ever parse the modifier bits.=C2=A0Al=
l apps must treat modifiers as opaque numbers. Likewise, documentation of a=
ll modifiers in drm_fourcc.h is only meant for driver developers. No develo=
pers of apps should ever use the documentation. There can be a million modi=
fiers and a million different devices, and the whole system of modifiers wo=
uld fall apart if every app developer had to learn all of them.<br></div><d=
iv class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">The only thin=
g applications are allowed to do is query modifier lists from all clients, =
compute their intersection, and pass it to one of the clients for allocatio=
n. All clients must allocate the exact same layout, otherwise the whole sys=
tem of modifiers would fall apart. If the modifier dictates that the pitch =
and alignment are not variables, but fixed values derived from width/height=
/bpp, then that&#39;s what all clients must allocate.</div><div class=3D"gm=
ail_quote"><br></div><div class=3D"gmail_quote">If any app uses DRM_FORMAT_=
MOD_LINEAR directly instead of querying supported modifiers from clients, i=
t&#39;s a misuse of the API.<br></div><div class=3D"gmail_quote"><br></div>=
<div class=3D"gmail_quote">DRM_FORMAT_MOD_LINEAR will be deprecated because=
 it&#39;s the only modifier that is generally non-functional (it&#39;s only=
 functional in special cases). After new linear modifiers land, drivers wil=
l stop supporting=C2=A0DRM_FORMAT_MOD_LINEAR if they can&#39;t support all =
pitches and alignments because we only want to have functional software.</d=
iv><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Marek<br=
></div></div>
</div>

--0000000000005a02cc062996a6d4--
