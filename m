Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0BF398569
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 11:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 170F56E5BB;
	Wed,  2 Jun 2021 09:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F516E5BB;
 Wed,  2 Jun 2021 09:39:27 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id t28so1712910pfg.10;
 Wed, 02 Jun 2021 02:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UoqfQasLN0pZ00mRIInlwQ56qBNCyjrvVbN90p7EI58=;
 b=kdXFzSq+Og4JjpWrwbfWDW+BJgr5KKzHJZcpprrqzrd3iepnUEPQsBoqEeoyGYoI3E
 2z5ZVZWUWxVChlcqfuKuFuovtyJLAL+0dbzRsl8cRAP8lVagFIWoXEtHxGV4t0cQ5a7Y
 6v4iC1Fwv7KPl4zT9e5eqUvw5ICfpQkUv7G+tznQGkj3v45F5DkEuR7l7wHklYICDV0/
 5U1nANEcGG+lz/S2boote+bEUDl7XyhBbHbyLy/KDDbkWcYfmjiIjb+u+/Sv4jpvTIPg
 JLx0bglSzIuL1dHdYwNWlaMffUivTT+T16GcwEKkDjmSxaX4Q8nnuM+6qZOdn4hArBZY
 UOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UoqfQasLN0pZ00mRIInlwQ56qBNCyjrvVbN90p7EI58=;
 b=H+sOEJ+dBtHTiNgClYNYgY98flSPWgSQy66eMozt+PIxE0g1gXJFJk8ybEaVG4SZhl
 KbZ4tygVo5Q2N9pyJvg/cr484P68PfQDpZL20NM0w+vYogsDNBWT3/HzVbfh5wsmGEsV
 uP7b+42i2vxGxOF7fbq23AHCr9+yzZ8+0seRZo43V9gMN/3Dx5JJnArsbjBWb1xAvU/R
 1bX3AuQQXuFDFsXyo2Cl+HNpE+gSNS2eGxlJW/e43DhRzyw7M1np/5zmYFB9eWmrb6eh
 QJ7/D2969PqMYbItXouHN+CA3pnQd+GRP00Je9Ks5IbxiWbKC31csny5ymFyIoRabMOB
 kGaQ==
X-Gm-Message-State: AOAM531X2z1u0iV8MmuGDLVUGIrrn3xJMVvdi83UbKbBK6uXkKnHHbET
 4nZzKKow0J2wJW7fEMIGhKyoV8ThKvfKmi0yrlM=
X-Google-Smtp-Source: ABdhPJzcq3eoBhDZ2b5+lw46fl0RPclCovg50g49UBs5csgPlYIiJ8kjVdePKg32AJBpb1t+cUsAuBCS4wokwTDWp6U=
X-Received: by 2002:a63:4e4f:: with SMTP id o15mr33045814pgl.208.1622626767063; 
 Wed, 02 Jun 2021 02:39:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A4XS2mCXOdvxm1ZAhG2OY9w1P0X2E1ac1TXNFKDekog5g@mail.gmail.com>
 <e7cb9833-1044-0426-5ce4-5b5fc32a3603@daenzer.net>
 <327e4008-b29f-f5b7-bb30-532fa52c797f@gmail.com>
 <7f19e3c7-b6b2-5200-95eb-3fed8d22a6b3@daenzer.net>
 <b0d65f94-cc56-a4db-3158-7b1de3952792@gmail.com>
 <CAKMK7uGaD_LuX-SZDALuDuEOMZNX=Q3FAq0xYf_pTVtNe6VUaw@mail.gmail.com>
 <c7190219-c185-3b7e-42a6-691934f79fb3@gmail.com>
 <CAPj87rPbiFf3qDo35gmirAoTOOJ5fEE6UxQdJKtfjX_VTqc6pg@mail.gmail.com>
 <CAAxE2A4kC4A9gV_V-W3eRW20O=9S1pv8=KMBdJxdLQ-ZXGa37Q@mail.gmail.com>
In-Reply-To: <CAAxE2A4kC4A9gV_V-W3eRW20O=9S1pv8=KMBdJxdLQ-ZXGa37Q@mail.gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Wed, 2 Jun 2021 05:38:51 -0400
Message-ID: <CAAxE2A7FJSaYfrYRpoCr-3h-AqBjOOJerhMVCcQZzQu0a+J0zg@mail.gmail.com>
Subject: Re: [Mesa-dev] Linux Graphics Next: Userspace submission update
To: Daniel Stone <daniel@fooishbar.org>
Content-Type: multipart/alternative; boundary="0000000000000dcfbf05c3c53ca4"
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
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000000dcfbf05c3c53ca4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 2, 2021 at 5:34 AM Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com> wro=
te:

> Yes, we can't break anything because we don't want to complicate things
> for us. It's pretty much all NAK'd already. We are trying to gather more
> knowledge and then make better decisions.
>
> The idea we are considering is that we'll expose memory-based sync object=
s
> to userspace for read only, and the kernel or hw will strictly control th=
e
> memory writes to those sync objects. The hole in that idea is that
> userspace can decide not to signal a job, so even if userspace can't
> overwrite memory-based sync object states arbitrarily, it can still decid=
e
> not to signal them, and then a future fence is born.
>

This would actually be treated as a GPU hang caused by that context, so it
should be fine.

Marek

--0000000000000dcfbf05c3c53ca4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Wed, Jun 2, 2021 at 5:34 AM Marek Ol=C5=A1=C3=A1k &lt;<a href=
=3D"mailto:maraeo@gmail.com">maraeo@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Yes, we =
can&#39;t break anything because we don&#39;t want to complicate things for=
 us. It&#39;s pretty much all NAK&#39;d already. We are trying to gather mo=
re knowledge and then make better decisions.</div><div><br></div><div>The i=
dea we are considering is that we&#39;ll expose memory-based sync objects t=
o userspace for read only, and the kernel or hw will strictly control the m=
emory writes to those sync objects. The hole in that idea is that userspace=
 can decide not to signal a job, so even if userspace can&#39;t overwrite m=
emory-based sync object states arbitrarily, it can still decide not to sign=
al them, and then a future fence is born.</div></div></blockquote><div><br>=
</div><div>This would actually be treated as a GPU hang caused by that cont=
ext, so it should be fine.</div><div><br></div><div>Marek</div></div></div>

--0000000000000dcfbf05c3c53ca4--
