Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 505EB8324B6
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 07:38:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9DA910E95C;
	Fri, 19 Jan 2024 06:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7AED10E95C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 06:38:04 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id
 ada2fe7eead31-467010c1c72so337065137.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 22:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705646224; x=1706251024; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0CBsSf2GusSmS6xZY4BHueRPOq+WwIB7U2vjzFqOSNs=;
 b=VyiU2tF4cvRM31+/Lq3yN2Pox6byOPuS2dvBSD94l6WrwR3AX2/jp0OL7oSPYTvvuZ
 OFqBktipQvuG/MLSkkXBkr2J5aRBn3K/0wk3+VIA6h9CSg6d4Fst6NLygUQJfLtk77u0
 Q+MSIemq8tqii6asKreM1JkYwuMDQ0ZYiam5rlkIbF5be9yjionHA/LB92I/+vHBxHgh
 gppYXLfkTOVP1XQfqhbCCXJ3c+QE0Vzje2gub5we34rGJnT1dkCUsutyxn3dWMGn3QZ9
 OFxljswRkjUkjbn223GipVdzGlPzJrqClB/qEVJyEq0jYvDhTKb3D2MuyBhDMdDNDN3P
 w71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705646224; x=1706251024;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0CBsSf2GusSmS6xZY4BHueRPOq+WwIB7U2vjzFqOSNs=;
 b=QwvPhB9R0f1GrhxQSuccVXr47Ru1nUi4YjcfGk3b9cS9J36yBUIbwD5jSgeRcvToaF
 sZHWGqLIp4UMFAjT8PLU7A/E+Yj/mgFEU9KfztbDVj63BuO7DBfGj1UXPq9XzJnaSPL3
 bnHQIwmeXPDnLf0ULLMhilqovx6efn5j7vrb+IS6v4uew0mSKEofo975pA+AqwdIExQe
 247Rzzgmp+c5pEAcyxz4GLZ8xR9LttVra2Ux3G+kA0vxLXmj7jFI/D+2tqHALkFj/gRG
 l9vyZb5RKulCHBok2FeKGx2cUK8dnKPtPETOZ6dpwTU5QepNU6+AxX0U7ySsrU6+qN11
 NQiQ==
X-Gm-Message-State: AOJu0YyMKplxTq88z7YNEeHy6p9Qbg+iugfgfIBVPjl8qfgduHOGbAug
 mlSlZaTPAMRSRiw8GMh66x4Khkh51RR/FVts9vCorSuiGUCMr1zzL5G1Fmr9HeGz109OXPRgNr1
 jkC7ttE0gVzMaLd81moNC1u5OLdo=
X-Google-Smtp-Source: AGHT+IF4zGlvICPFJg/oOdD7gNtXsvsCZEs/0i4s+Gj8xTeawqHyuCbGypm7vc2ARAY5c5ZxVU64zXoBwK6qrFDPplk=
X-Received: by 2002:a05:6102:3749:b0:469:824a:53f0 with SMTP id
 u9-20020a056102374900b00469824a53f0mr312241vst.32.1705646222938; Thu, 18 Jan
 2024 22:37:02 -0800 (PST)
MIME-Version: 1.0
References: <20231113164344.1612602-1-mwalle@kernel.org>
 <631fe35a2a3b00781231e4f3f5094fae@kernel.org>
 <1ef3dad2-5f55-40e5-bba7-3c71d71c12e4@kontron.de>
 <CAAQKjZMccDwa63_PNJCP0rNOaHjTwcOz8AbKa=JXLQi-b0QVVw@mail.gmail.com>
 <2400535875c353ff7208be2d86d4556f@kernel.org>
 <ZZ1BBO2nNSp3g-gT@phenom.ffwll.local>
In-Reply-To: <ZZ1BBO2nNSp3g-gT@phenom.ffwll.local>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 19 Jan 2024 15:36:51 +0900
Message-ID: <CAAQKjZNnJQDn_r1+WNmsxM-2O48O0+yWAUAqpjZRjMYMT3xGwg@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: samsung-dsim: Don't use FORCE_STOP_STATE
To: Michael Walle <mwalle@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 David Airlie <airlied@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Robert Foss <rfoss@kernel.org>, Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Tim Harvey <tharvey@gateworks.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, linux-kernel@vger.kernel.org,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Inki Dae <daeinki@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000003b17a7060f46b52b"
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
Cc: Daniel Vetter <daniel@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000003b17a7060f46b52b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Really sorry for late. Will pick it up.

Thanks,
Inki Dae

2024=EB=85=84 1=EC=9B=94 9=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 9:50, Da=
niel Vetter <daniel@ffwll.ch>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:

> On Tue, Jan 09, 2024 at 09:47:20AM +0100, Michael Walle wrote:
> > Hi,
> >
> > > > Inki, are you picking this up? Or if not, who will?
> > >
> > > I can pick it up but it would be better to go to the drm-misc tree. I=
f
> > > nobody cares about it then I will pick it up. :)
> > >
> > > acked-by : Inki Dae <inki.dae@samsung.com>
> >
> > Who is going to pick this up? Who has access to the drm-misc tree?
>
> Inki has, so I'm assuming since he acked he'll also merge.
> -Sima
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--0000000000003b17a7060f46b52b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Really sorry for late. Will pick it up.<div dir=3D"auto">=
<br></div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">Inki Dae</div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">20=
24=EB=85=84 1=EC=9B=94 9=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 9:50, Dani=
el Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch">daniel@ffwll.ch</a>&gt;=EB=
=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>On Tue, Jan 09, 2024 at 09:47:20AM +0100, Michael Walle wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; &gt; &gt; Inki, are you picking this up? Or if not, who will?<br>
&gt; &gt; <br>
&gt; &gt; I can pick it up but it would be better to go to the drm-misc tre=
e. If<br>
&gt; &gt; nobody cares about it then I will pick it up. :)<br>
&gt; &gt; <br>
&gt; &gt; acked-by : Inki Dae &lt;<a href=3D"mailto:inki.dae@samsung.com" t=
arget=3D"_blank" rel=3D"noreferrer">inki.dae@samsung.com</a>&gt;<br>
&gt; <br>
&gt; Who is going to pick this up? Who has access to the drm-misc tree?<br>
<br>
Inki has, so I&#39;m assuming since he acked he&#39;ll also merge.<br>
-Sima<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">http://blog.ffwll.ch</a><br>
</blockquote></div>

--0000000000003b17a7060f46b52b--
