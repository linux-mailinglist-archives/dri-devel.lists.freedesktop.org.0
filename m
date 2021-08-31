Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E133FCD14
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 20:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 860F16E02C;
	Tue, 31 Aug 2021 18:49:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D856E02C
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 18:49:32 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id m2so122914wmm.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 11:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ttx6bMAS94NZgVYt3K54B5DCBv1SzFZ1QKmkOM0BMAg=;
 b=Dq4GrPtWYnjI7PdaRg1IumGNlB44PZSucGm9dkqcxaFRVTtR7mBHN0AWl7woAcYqVa
 SpVwV3DJp67FH2aL7ESf87/ZHT4YX9a0dWmiL6wsA90raBTueNXG3y/s+LuJOybUPv0S
 nhyItsTCAonsIFzohuEh6tIzkb3lDSoiwOmo0wgUJp74UZorJ0mUvTs0l0rlFbGRoCil
 Al86cXeBVzIcTLWC716gBirbwVpbEHr8ARyrLhY+Qt4W6r6JVD5y/Cpu7ej3qLTmVpxa
 iR8Gq9CF1ogUW1TQENSq0YD9gGt1SNG2zTrga4D+yGCEKca/GW/WJ+B1gOCoVK7uc+tU
 NtTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ttx6bMAS94NZgVYt3K54B5DCBv1SzFZ1QKmkOM0BMAg=;
 b=EBw0jA3siUE3ZJeu9fBv4EE6rSYP0psvFxy2PPxbtFRc4sql+y/EW8XaOJDoYzvg4q
 oWZ3TznQGxxb6pLgzXiRMY54dMbrXbtH7chUkZLGDV7OKITFL95OBkhQC2NQkxCLplbn
 DoPZN/kHNi/YpbL4rEdfonjPmwW0srPP8OJKdWiXhJkZNLkN7gnWiaw89NPVrhp3oVTN
 zoCOU7UB8KkZint49e8C267qghpixPbQ/bqZYUPhMJ4U4Udvszpx3VnW5TDNDrNY1CLw
 DMSnZZ603z29lPfV2KZv1YENd6ysF7yXby88KtZcZhao/QK3Fhm9DAzHctF5M7aJUqKT
 AEkg==
X-Gm-Message-State: AOAM5304vpVdMYertd+bcRR5c8lZTYodq9UGM9x+nrJSExjxT+x9mc3O
 5wqwFuwIGc2pETZn93hptkY=
X-Google-Smtp-Source: ABdhPJwAEe8emf73MKBgtwUTkWNiQwV7+aOlGc21X5WxoUr2WhNG7cEgbtVvKlNEZqofi4z1CN+rYw==
X-Received: by 2002:a7b:c255:: with SMTP id b21mr5745302wmj.44.1630435771581; 
 Tue, 31 Aug 2021 11:49:31 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net.
 [86.58.29.253])
 by smtp.gmail.com with ESMTPSA id a133sm3354391wme.5.2021.08.31.11.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 11:49:31 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Roman Stratiienko <r.stratiienko@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
Subject: Re: Re: Re: DE2.0 YV12 playback issues after ea067aee45a8
Date: Tue, 31 Aug 2021 20:49:30 +0200
Message-ID: <8627733.mJVyAx2qjc@kista>
In-Reply-To: <CAGphcdnAtpFaAtp_QSKhNfQ4HkiL6dwYfP_pfMgNKwNGdyW-sw@mail.gmail.com>
References: <CAGphcd=ZR-Gh0zq=y-L9mf9agLwJBiav34q6TqUV+Te_UWFBuA@mail.gmail.com>
 <2072790.9m3SFDGqga@kista>
 <CAGphcdnAtpFaAtp_QSKhNfQ4HkiL6dwYfP_pfMgNKwNGdyW-sw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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

Dne torek, 31. avgust 2021 ob 19:18:42 CEST je Roman Stratiienko napisal(a):
> Hi Jernej,
>=20
> =D0=B2=D1=82, 31 =D0=B0=D0=B2=D0=B3. 2021 =D0=B3. =D0=B2 19:52, Jernej =
=C5=A0krabec <jernej.skrabec@gmail.com>:
> >
> > Hi!
> >
> > Dne petek, 27. avgust 2021 ob 15:16:03 CEST je Roman Stratiienko=20
napisal(a):
> > > +CC: jernej.skrabec@gmail.com
> > >
> > > =D0=BF=D1=82, 27 =D0=B0=D0=B2=D0=B3. 2021 =D0=B3. =D0=B2 16:12, Roman=
 Stratiienko=20
<r.stratiienko@gmail.com>:
> > > >
> > > > Hello Jernej,
> > > >
> > > > During local testing I faced an issue where YV12 buffers are displa=
yed
> > > > all in blue.
> > > >
> > > > Issue can be fixed by reverting:
> > > > ea067aee45a8 ("drm/sun4i: de2/de3: Remove redundant CSC matrices")
> > > >
> > > > Could you have a look please?
> >
> > I believe I found the issue. Can you try replacing this line:
> > https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/sun4i/
> > sun8i_csc.h#L20
> >
> > with:
> > #define SUN8I_CSC_COEFF(base, i)        (base + 0x10 + 4 * (i))
> >
> > Note that "i" is in parenthesis.
>=20
> Thank you for your quick response.
> Yeah, that's it. Adding parenthesis solves the issue.

Thanks for reporting & testing!

Best regards,
Jernej

>=20
> >
> > Best regards,
> > Jernej
> >
> > > >
> > > > Best regards,
> > > > Roman Stratiienko
> > >
> >
> >
>=20


