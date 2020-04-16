Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DC91ABBB5
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 10:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466646EB2C;
	Thu, 16 Apr 2020 08:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864476EB2C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 08:51:40 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id m8so6972569lji.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 01:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=Oj8CO79GmgoMjf3mDRvC0Xpejq+j2q1zOk/MHLgn30k=;
 b=twaWoLlbwoY5rzJwlyhNSLneRRsIx+ROreiDWOR/JzXRwV4lJ4A7W9+KESbsMpa+/t
 o4p4ybbrJUuE5Vy2Nm9f+WDiezRtUiHFBqauU8HCZ7y1rvrRSbrhj3sTxF0g0MSQdq1G
 P2wdQNvXJZXULzwzIKWOivYr6B+AW7zs6wEpKWYSgGGZa902FV9x1mh8WHpDRw1vTeRl
 CKzm1GLiyW8VMtcVa+F9g8WZtR2BJAum+KQ6fKsie55fJpwA5/1R94irdSeByyndv1RR
 TM6Vw8FchYV4DBMIaiVVAMXdPdn6eIkxZPEKeq1g5P+nJ5Ea5tlJ9D+nFO26hbad+VF9
 Y84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Oj8CO79GmgoMjf3mDRvC0Xpejq+j2q1zOk/MHLgn30k=;
 b=IPaIHHoPT9uSTPCUzTFolrCYnsc9ne/DDF5YG8NSJ1V0Y6Mnfi4w9eYpoL16KpDdaY
 bSGE7dWo6oeDAscw+l/poarEYTqPThF1/VY36bi+VDY8vNcaiFO2XHkRH5f0gMgt3jQV
 eaG/+obanhqbXSd5XIb0JpK0wcIsjFnA/lWiZUgdvpUcT5oAVPe4TKZkDZy10HU8x1GB
 ufrtTmNx284xcnSubP+VvdrRn9oSiRlgRvMHNZsR3HowlA8G6TLZFhdTHHrPovGOAPF7
 7Nfr550YS6XLHQlyLdYpMOTreL5+omRqx9kIfBLvLhAZBWPmCcPmA+feuII16V0HbRr4
 LWyg==
X-Gm-Message-State: AGi0Pual56yEmiOQM7eLqbzNx3YTSVnC+ocmhi1Kb4Tr4rEjUHaeqNw2
 mu0wxU96zKQQyy7Xr8tnOxk=
X-Google-Smtp-Source: APiQypLRqVRGstyySyH92XbU/9azZx05s3LK2LwT/hs7j7Xx46ppcw3bpmYo50QLcaeg+wE2FLeyug==
X-Received: by 2002:a2e:9bc9:: with SMTP id w9mr5828165ljj.213.1587027098896; 
 Thu, 16 Apr 2020 01:51:38 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id v64sm3828698lfa.54.2020.04.16.01.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 01:51:38 -0700 (PDT)
Date: Thu, 16 Apr 2020 11:51:29 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: UAPI doc (Re: KMS enums and bitfields UAPI)
Message-ID: <20200416115029.07c77934@eldfell.localdomain>
In-Reply-To: <nsJj9jOaea1lsr2WyN7m7luf0Xbiu1RQCCSVq04M1NGy7Co9yO2mUvciYJjVC69xOUz5ceiRJBpY7NwkftIJorA-GfOf01r42bVIr9LX6B8=@emersion.fr>
References: <VmzN-pGfjaXAFb8aZXOnS2ibasRIsvB-EbfvxyvjLs07m-PBv4pTcX5hsB7yyrt78pxQQ6Bbu3I-hTtFSXEadxm8CkS60FLccIsZycguSfA=@emersion.fr>
 <u5X6K68v0waX25yZHLng0H_WDIFjNU-MgmnbLCoBZN7bqys3ofRm203wrYKdMnR1f4CStz3q5a12Y0ou8lCZWNMuhRmCCZ1dkTCSuDZjdy4=@emersion.fr>
 <20200414122402.GS3456981@phenom.ffwll.local>
 <gpwDGBjR8hMLhneuVUgofPTRR5r79EHlaSULKoTmIvavvl52qCQS7bXfqihSRC_ABzsDO1xmG0GSbU1d6DPanLEfW0IcsCBqbN0SFvd7gv4=@emersion.fr>
 <20200414123945.GU3456981@phenom.ffwll.local>
 <sxighAwzjE_uFWBRdafDj7J1HgLR_yV0SwWQKMpqZGgD1p0yaeeRvmw9rOUCLEMXoARE99aAm5YSGENfTsA3PK9qADKweKPeE6uGguhxpLU=@emersion.fr>
 <CAKMK7uH+xY4DroWyB6J4+M8rZrNACDde8sbFAO1dFFWvR146kA@mail.gmail.com>
 <nsJj9jOaea1lsr2WyN7m7luf0Xbiu1RQCCSVq04M1NGy7Co9yO2mUvciYJjVC69xOUz5ceiRJBpY7NwkftIJorA-GfOf01r42bVIr9LX6B8=@emersion.fr>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1877260796=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1877260796==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/UApD3+l_ZaYLIvvSaEigGCE"; protocol="application/pgp-signature"

--Sig_/UApD3+l_ZaYLIvvSaEigGCE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 15 Apr 2020 10:40:36 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Tuesday, April 14, 2020 3:33 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
>=20
> > > What I'm suggesting isn't to make all enum values UAPI. I'm suggesting
> > > to add standard enum values as #defines in the UAPI headers to make
> > > these values UAPI. Non-standard properties wouldn't be in the UAPI
> > > headers, so user-space would need to query values from KMS just like
> > > they do now. =20
> >
> > Hm that sounds like the half-way that wont work. Because then some
> > compositors will only use the hard-coded versions, and if they don't
> > have them, nag us to add them. And then be really disappointed if we
> > don't (or we screw up and add them where we shouldn't). That's the
> > status quo "let's have it both ways" that I think is the worst of all
> > options we have. So I guess from that pov the "userspace needs to
> > decode from symbolic values, always" as the only consistent one. =20
>=20
> Fair enough. Let's just continue using symbolic names then.

Hi,

I'm happy to see a decision made that is clear and simple, even if it
makes userspace need a little more code.

We as userspace programmers have a huge responsibility of figuring out
exactly how KMS UAPI is supposed to be used, and use it correctly,
because the UAPI is largely undocumented and whatever documentation
exists is not easily discoverable to a non-kernel developer.

Libdrm has a few man-pages that seem to have been left to rot. If I
could, bringing them up-to-date and extending to cover everything about
driver-agnostic KMS UAPI would seem like a nice idea. It would be the
obvious place for userspace oriented docs. After all, UAPI docs cannot
become incorrect over time (the stable UAPI promise), so the
maintenance effort would be just adding the new stuff and if necessary,
clarifying old stuff. No confusion with any kernel internal API that is
subject to change at any time.

https://www.kernel.org/doc/html/latest/ is really hard to find anything
in it when you need it. Often the terms you need to search for are not
the ones used in the UAPI or have far too many hits, assuming you know
what UAPI you would want to use in the first place.

Another disconnect is that libdrm API is not the UAPI exactly. So
documenting libdrm API with the kernel UAPI in mind would be the best.
People use libdrm more than kernel UAPI.


Thanks,
pq

--Sig_/UApD3+l_ZaYLIvvSaEigGCE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl6YHJEACgkQI1/ltBGq
qqcaug/9FQwTLYwWsfH8vkCeV8yYJdrbr0WUSKz37Q+ar52BYEA+LjWJb2coZ8M0
lhxf9TIlZfSfae5HYG/jl9V5FoK1RPV3Xi6sA+K3eaHruMWRbyn9D5qAgyFeptMX
dAZSPvHuTx/8S14/hExGa9HsNBga9tXRXvKMSy6zDAuKZPdXIJvvM29XHnlTUcM8
dcqJ7mqYt1wSSgU4QdYotY1JOQ+wQKS9yqi8geD1nvoVkUvjpALBO1dtPrJWOqLJ
NgX2qyIR3RJ3ymLdMTN6x9HiTrJe/5p7Wh/WToi9GTwlvmITFR54YbRV0V/vBTY/
MHc6dN2DWDRN5BUcTquBnrV7eviZzIw3syBEpIjQFB/IUTwTYYeAZu+mvM2lY6kW
4aubgTG1+bTUSCM6yMxriL50vxyI67bUPv1dv5I1Ro7/63P+h5Ubdefmp5/viyCM
3w3pE5O1+C6Moawmd7d2QC98p8JvwrrwPZkgd0OvJIicQCXplo/Q/OQu5ki08My+
HMRVuQEofRTvIQ+N/ZqMTMATrnFWiCovj926Cc9Ql5PTGubkJX5O9Nb37SLQcC4Z
Gy3lun/5Di3baiy/AuCWVvPJOzowLvM8pAoj3Ul+4Z/WltkPOa91aEKNJ6iyzh3p
8PzD8UgFhoihv6DTk54M1vSYLxx1V0eCKlKIgOM4K3c4TzUG/F8=
=ZGsz
-----END PGP SIGNATURE-----

--Sig_/UApD3+l_ZaYLIvvSaEigGCE--

--===============1877260796==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1877260796==--
