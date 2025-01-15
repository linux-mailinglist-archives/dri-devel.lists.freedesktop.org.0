Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76803A1180A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 04:49:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27EDC10E4A2;
	Wed, 15 Jan 2025 03:49:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lHxj9HMd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF0010E4A2;
 Wed, 15 Jan 2025 03:49:48 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3eb82fc512aso129970b6e.2; 
 Tue, 14 Jan 2025 19:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736912988; x=1737517788; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XaNnsiMYCtWAWfw/ONOCfFMOa3heAD/TCcel6fpssjg=;
 b=lHxj9HMdo9puVuR4kIG9vARZQr4HjuH/bN7EZtQsG11qILZqwQNBVE72abFI9qzck/
 Uuyu5HPYfYzyc4qvUa65aZDIIrnajjkHUNCRbTJpSXpDDq3+3HxQDDs5oDAkxKiYGdXX
 1Dxx3PAr9w+h4RKJyuUKyn7KTiksjUeIelzeeHFYLtBSG6Ownf/6km3bVD/UGctT3EEn
 5PjAsh0Bz0XaDigrry1BOdcD5N7l5WnVVxHPWtF0RmNJFchQagvdKvy/HHdZc9IKrYlS
 MVjAz9rdfsFExDhWegZqZeX58jpfx2Cgeiv+MSw6VjyFM9zjroUq65i0ljGLnGtTYCYl
 9d2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736912988; x=1737517788;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XaNnsiMYCtWAWfw/ONOCfFMOa3heAD/TCcel6fpssjg=;
 b=WAS0C4CjONP4lMzks9soj3eACl5B+0yW3VM8eLbthrHMIl872xRt/3yo8GuizUHlyc
 CsTxnZ7QaKq7AvapZDhudaoqtVSBV0mRd5ruI1JdRBc9M0XGqKcVTR68ABdTyIPBo+xd
 YowpdxsCfsppOaA8XA6RAYZdgJM8V6FSzpb20rTTIYzP+LnLo+oK9QUBcswF3CfZeiD7
 5cfYr4YX3NUOrrwcYKGOz1+oeBzaaEhaeBlHuFKzX1po/nt1YRcO89hEYIaO2+XoOBmQ
 sR1KXQ73DtQYPVtcknFTPkZzASBWVcVGuiSZ98nIebJQ1Qyt/LIi7xupexu05bXTsP38
 LLjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcMdmxzVbW/y6gQs6JmpCvuKjrewjlgQEmMEoNNArPlaJ/+YsGYI7C3HjGMpyRyf888RsSEXmHnZI=@lists.freedesktop.org,
 AJvYcCVVmur6+wZZOIHp2zupx32r3wfpRFDLZdZtyphkgJnZZTErSvnIpx1zjuyPm/m54zwSKrUdiwg1xRLu@lists.freedesktop.org,
 AJvYcCWk8Hw5edY1KVGMs5fmN0Omb2MMPYXgUWrkGq8H5mF1qASfKThYUSwXTA5tUqvqI4KG/z+rqhkt@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxitziiME/VCwsjBqlDwAaMbmIOpwuVDtLBjHCUoYoxzIPA1pz5
 2+ItPFMz/BdEloLjEeRfduyy6l3o/is4Ras91jR8Im6BX/3biV9kqTxFnKXLZKpDLNelkNVezpw
 U6YDuRwpYwMvFzuNQmIwlOZccPvk=
X-Gm-Gg: ASbGncvtFTboMKvFSfVfSwaXesZ/HjpgIDwmbcrzcQ47QcDsL09mNkHGMnfLEXRmMmk
 lALTUxx7v9yhV7qASd3M/qUOvsK/6mtYaw5r6DBr+
X-Google-Smtp-Source: AGHT+IG+r0gAaJq+VlzW2/EPf2KP2TBsNWywsecfWE/iAz/6pfZad4nuxaldQjaBjaVD2jnagtSslQRre4DiZP/w/Mc=
X-Received: by 2002:a05:6808:18a2:b0:3eb:639e:707f with SMTP id
 5614622812f47-3ef2ec302f2mr7156703b6e.3.1736912987676; Tue, 14 Jan 2025
 19:49:47 -0800 (PST)
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
 <8dd7405a-0317-4e35-ac66-a35b0bd743a9@nvidia.com>
In-Reply-To: <8dd7405a-0317-4e35-ac66-a35b0bd743a9@nvidia.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Tue, 14 Jan 2025 22:49:11 -0500
X-Gm-Features: AbW1kvbVNx8pLMdHqSqfK_JKI1JEDJoBbWuxHNuDJJJH5hv4Kk0rO9SlqOLFTmo
Message-ID: <CAAxE2A5eH4E6mHgfjNWQFL+r2O10HmvN1ZfEkv7sKwV2kiGjSw@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
To: James Jones <jajones@nvidia.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>,
 Brian Starkey <brian.starkey@arm.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, 
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>, nd@arm.com, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: multipart/alternative; boundary="000000000000a2e8e6062bb6913d"
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

--000000000000a2e8e6062bb6913d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 12:55=E2=80=AFPM James Jones <jajones@nvidia.com> w=
rote:

> I don't see how that fits in the current modifier usage patterns. I'm
> not clear how applications are supposed to programmatically "look at the
> modifiers of other drivers to find commonalities," nor how that "keeps
> "expectations the same as today for simplicity.". I think replacing the
> existing linear modifier would be very disruptive, and I don't think
> this proposal solves a general problem. Is it common for other vendors'
> hardware to have such strict pitch/height alignment requirements? Prior
> to this discussion, I'd only ever heard of minimum alignments.
>

James, no changes to apps are required. Driver developers can _choose_ to
look at other drivers to find commonalities and expose them in their own
drivers.

Marek

--000000000000a2e8e6062bb6913d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Jan 14, 2025 at 12:55=E2=80=AFPM Jame=
s Jones &lt;<a href=3D"mailto:jajones@nvidia.com">jajones@nvidia.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I don&#=
39;t see how that fits in the current modifier usage patterns. I&#39;m <br>
not clear how applications are supposed to programmatically &quot;look at t=
he <br>
modifiers of other drivers to find commonalities,&quot; nor how that &quot;=
keeps <br>
&quot;expectations the same as today for simplicity.&quot;. I think replaci=
ng the <br>
existing linear modifier would be very disruptive, and I don&#39;t think <b=
r>
this proposal solves a general problem. Is it common for other vendors&#39;=
 <br>
hardware to have such strict pitch/height alignment requirements? Prior <br=
>
to this discussion, I&#39;d only ever heard of minimum alignments.<br></blo=
ckquote><div><br></div><div>James, no changes to apps are required. Driver =
developers can _choose_ to look at other drivers to find commonalities and =
expose them in their own drivers.</div><div><br></div><div>Marek</div></div=
></div>

--000000000000a2e8e6062bb6913d--
