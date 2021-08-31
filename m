Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 095E03FCC31
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 19:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED9989FC9;
	Tue, 31 Aug 2021 17:18:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA52F89FCA
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 17:18:53 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 mj9-20020a17090b368900b001965618d019so2571029pjb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 10:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Y5Uf1K3wDCeqoUx5LFBv8PuASnv8aSshBfO5ZolPGLU=;
 b=BQbVUMseEZiAwjJGXXk5i96hSb+bHz6BSGwUXWvDLpwKT+wD1/RYHV1DXowG1KaUe7
 ft3ajX36YVpgXsT/V7XBYtw+WDxAUTl1TSfx9P4aJ6veywne/evL0JZUt4+YwWAjkos6
 3SATU+WkFaskG5Fi45HfZIBS1uD+oCtTLs6YPjhISyFzHrfxLzXf/KI6RAqdO7kg3cjs
 n2DxerOy2j1vsnKRzLxLjn7BqfAaVCYtkZnwHIEFZiIW0CtBjofNq6jZ56F8JFqujPOI
 TxRxR8Vun1Y0t/LkXtpynQC2Q1GZL2zuMOhxvu20U7AIas33pCoEOnKJimNhhb/t2p+Q
 u/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Y5Uf1K3wDCeqoUx5LFBv8PuASnv8aSshBfO5ZolPGLU=;
 b=Tkpl1IrNEiX0eTpWn5AXsA1rdiZdhEC2W942umnRdKtjKIPtqdsJSbdNfuBGAWj+gs
 GFPVxYc+DGIk9Jp7rh9d7CeAr7HoHdp6fZWAG63YEPLQBoVNwqqqM1zUEqGx72DdEF2g
 nABNmPBDP2G6QV6mfCZ5eGyqgMjlywe//RR0/t2ZNwA7+barZ4NzVGeMSNrt/f2jZsff
 PFJXMr30N32QyFfI4zFqHEOwYUJqUVsZGwSVklVovz+ruHknk0yqQ4E71JtqwTDa1rDL
 ulgnCjXwe5YVaT975gySFH+v9x7JoolaC5WiYCJzWB0QLRv9lLRB0muSOpN5SgW/H/xD
 NuhA==
X-Gm-Message-State: AOAM533U/1yihbGJWA3iX9m7JB8+eiIu/KaRBaWW5hMefS1RgDSdUpBw
 FlJBFRhIzkvCtIcjsJnYMX4tSFmxfO0qviaKwTs=
X-Google-Smtp-Source: ABdhPJxUaW7jmxkndZ20dba6dPiovaVp/eFi2R5ZJX6+QV4tnK1p+ImhEGj9ov0cLcEs6tJwKCG+QcCZ4JFa/qL+7cs=
X-Received: by 2002:a17:90a:2c0c:: with SMTP id
 m12mr6593628pjd.107.1630430333208; 
 Tue, 31 Aug 2021 10:18:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAGphcd=ZR-Gh0zq=y-L9mf9agLwJBiav34q6TqUV+Te_UWFBuA@mail.gmail.com>
 <CAGphcd=L8GazB_io8Guy-0TdPGAt-m+4H38jrwCzNmt4+=moNg@mail.gmail.com>
 <2072790.9m3SFDGqga@kista>
In-Reply-To: <2072790.9m3SFDGqga@kista>
From: Roman Stratiienko <r.stratiienko@gmail.com>
Date: Tue, 31 Aug 2021 20:18:42 +0300
Message-ID: <CAGphcdnAtpFaAtp_QSKhNfQ4HkiL6dwYfP_pfMgNKwNGdyW-sw@mail.gmail.com>
Subject: Re: Re: DE2.0 YV12 playback issues after ea067aee45a8
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Jernej,

=D0=B2=D1=82, 31 =D0=B0=D0=B2=D0=B3. 2021 =D0=B3. =D0=B2 19:52, Jernej =C5=
=A0krabec <jernej.skrabec@gmail.com>:
>
> Hi!
>
> Dne petek, 27. avgust 2021 ob 15:16:03 CEST je Roman Stratiienko napisal(=
a):
> > +CC: jernej.skrabec@gmail.com
> >
> > =D0=BF=D1=82, 27 =D0=B0=D0=B2=D0=B3. 2021 =D0=B3. =D0=B2 16:12, Roman S=
tratiienko <r.stratiienko@gmail.com>:
> > >
> > > Hello Jernej,
> > >
> > > During local testing I faced an issue where YV12 buffers are displaye=
d
> > > all in blue.
> > >
> > > Issue can be fixed by reverting:
> > > ea067aee45a8 ("drm/sun4i: de2/de3: Remove redundant CSC matrices")
> > >
> > > Could you have a look please?
>
> I believe I found the issue. Can you try replacing this line:
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/sun4i/
> sun8i_csc.h#L20
>
> with:
> #define SUN8I_CSC_COEFF(base, i)        (base + 0x10 + 4 * (i))
>
> Note that "i" is in parenthesis.

Thank you for your quick response.
Yeah, that's it. Adding parenthesis solves the issue.

>
> Best regards,
> Jernej
>
> > >
> > > Best regards,
> > > Roman Stratiienko
> >
>
>
