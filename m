Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7A07BD58C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 10:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0205C10E22D;
	Mon,  9 Oct 2023 08:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E8B310E22D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 08:45:50 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1c60a514f3aso35319145ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 01:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696841150; x=1697445950; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+UYiBL6SRbLOPgrNzGh3TGoyVQnJviY/7sooyahS/D8=;
 b=Kq/CybjBgxLfFzW4SVmcU5qNepIsBu3g4cKChSSVJRum/2IXMacNGmqlu42+tiW2V1
 IjCbKpiO+1HbDCOVIWOYR+w5s1zmQINYx6c8KGwdr93De0fuJOp0gyV17mVaeXP2yjFJ
 cePFed9pAAZaEOujdXTTWvlz6/tZYdlmzwVPwSP2TtElra+8m56qv5iRAyoAFObpjI/i
 7MLlr8qvIHe4rw3dOoiEb4Mjfiy8O6prFeSNFOWFXp2Q56E2+KlNjx+VNQW4h83alKrn
 Fn4EnY27RYCE79PwbfN+gjqYPBvlNCHaHiviwCnteT7aEa3EyCB9p7farNecMUz121Y0
 FHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696841150; x=1697445950;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+UYiBL6SRbLOPgrNzGh3TGoyVQnJviY/7sooyahS/D8=;
 b=eZwZgC4Iyj4iOl7eplGl0R6/2EphbuNB5gpmUNcBUvX8Oueoj29IOWH878w0Btl5tz
 Nv5m6QovBuEw5JYMik5sTGYX1fdfIibrGy2u6bFMXVyxMy8Sp7hNAhOb3FNbQj0xVJ6z
 VNLhBzqSLIo8Mo1/cP6f4Luca7Ga8CjOSH+uzcloywZpNEuuyf5sa2HX2udAz09kyYqy
 rKnSvKnX8Rt5uG15VofRxw5M/LIh6T2nbtg8v/HaHVJI1WQHgg5i3oFhKHemcmB+dCAK
 eWSbfshBRdAynFoj/sG7ORdi+oBtuIQXWWh64CNvuX6tBRfggcA4aVPY7Wi9evapimih
 ty+A==
X-Gm-Message-State: AOJu0YzHoJgqI729QhD1/1okLSJ9vnTVKhBHtNtny9hRqTcVcptmYNCk
 iHZoQ0sZ1wwmYyytp9wuB34=
X-Google-Smtp-Source: AGHT+IF05H4q63Cso7kjB1N3kLjdHmG3CmMzZbm0KtDP2GgiRIwTZqg0Tsw0un0gXDUMCRkfRhFrHw==
X-Received: by 2002:a17:902:d349:b0:1c5:e527:68b0 with SMTP id
 l9-20020a170902d34900b001c5e52768b0mr15337660plk.62.1696841149660; 
 Mon, 09 Oct 2023 01:45:49 -0700 (PDT)
Received: from debian.me ([103.131.18.64]) by smtp.gmail.com with ESMTPSA id
 a12-20020a170902ee8c00b001bde65894c8sm8936969pld.268.2023.10.09.01.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 01:45:48 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id D98058FE13DF; Mon,  9 Oct 2023 15:45:44 +0700 (WIB)
Date: Mon, 9 Oct 2023 15:45:44 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Huacai Chen <chenhuacai@kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Blank screen on boot of Linux 6.5 and later on Lenovo ThinkPad
 L570
Message-ID: <ZSO9uArAtsPMPeTP@debian.me>
References: <7c50e051-eba2-09fc-da9f-023d592de457@ristioja.ee>
 <31bdf7b1-0ed9-4217-b459-1d857e53120b@leemhuis.info>
 <CAAhV-H7fRpykesVUEyaTpVnFiGwpP+fPbtdrp6JwfgD=bDp06Q@mail.gmail.com>
 <CAAhV-H7XCmbgS=N4-SE8FnASAws8hnDRZsQJgXE+dwyARaqzNw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="e+saoYv3HPZRi7+a"
Content-Disposition: inline
In-Reply-To: <CAAhV-H7XCmbgS=N4-SE8FnASAws8hnDRZsQJgXE+dwyARaqzNw@mail.gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Jaak Ristioja <jaak@ristioja.ee>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--e+saoYv3HPZRi7+a
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 09, 2023 at 09:27:02AM +0800, Huacai Chen wrote:
> Hi, all,
>=20
> On Tue, Sep 26, 2023 at 10:31=E2=80=AFPM Huacai Chen <chenhuacai@kernel.o=
rg> wrote:
> >
> > Hi, all,
> >
> > On Tue, Sep 26, 2023 at 7:15=E2=80=AFPM Linux regression tracking (Thor=
sten
> > Leemhuis) <regressions@leemhuis.info> wrote:
> > >
> > > [CCing the regression list, as it should be in the loop for regressio=
ns:
> > > https://docs.kernel.org/admin-guide/reporting-regressions.html]
> > >
> > > Hi, Thorsten here, the Linux kernel's regression tracker.
> > >
> > > On 13.09.23 14:02, Jaak Ristioja wrote:
> > > >
> > > > Upgrading to Linux 6.5 on a Lenovo ThinkPad L570 (Integrated Intel =
HD
> > > > Graphics 620 (rev 02), Intel(R) Core(TM) i7-7500U) results in a bla=
nk
> > > > screen after boot until the display manager starts... if it does st=
art
> > > > at all. Using the nomodeset kernel parameter seems to be a workarou=
nd.
> > > >
> > > > I've bisected this to commit 60aebc9559492cea6a9625f514a8041717e3a2=
e4
> > > > ("drivers/firmware: Move sysfb_init() from device_initcall to
> > > > subsys_initcall_sync").
> > >
> > > Hmmm, no reaction since it was posted a while ago, unless I'm missing
> > > something.
> > >
> > > Huacai Chen, did you maybe miss this report? The problem is apparently
> > > caused by a commit of yours (that Javier applied), you hence should l=
ook
> > > into this.
> > I'm sorry but it looks very strange, could you please share your config=
 file?
> As confirmed by Jaak, disabling DRM_SIMPLEDRM makes things work fine
> again. So I guess the reason:

Did Jaak reply privately? It should have been disclosed in public
ML here instead.

>=20
> When SIMPLEDRM takes over the framebuffer, the screen is blank (don't
> know why). And before 60aebc9559492cea6a9625f ("drivers/firmware: Move
> sysfb_init() from device_initcall to subsys_initcall_sync") there is
> no platform device created for SIMPLEDRM at early stage, so it seems
> also "no problem".

I don't understand above. You mean that after that commit the platform
device is also none, right?

Confused...

--=20
An old man doll... just what I always wanted! - Clara

--e+saoYv3HPZRi7+a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZSO9swAKCRD2uYlJVVFO
oydtAQCjpra6tsxV4/98CtIBJeEv9SPFN/GBEOiRr+a0amnAaAD9HnpgYUQGuUI3
Li7bRmsGwGPIno+QwWiW2fiZl9ZcOwM=
=bSd7
-----END PGP SIGNATURE-----

--e+saoYv3HPZRi7+a--
