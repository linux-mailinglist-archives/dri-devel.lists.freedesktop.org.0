Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B73043D3609
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 10:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0686D6E93F;
	Fri, 23 Jul 2021 08:02:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E37DD6E93F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 08:02:54 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id h14so682172lfv.7
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 01:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=ge5QrUtQCHkW8lg9TzdN3403LcCU4yxmcnWuDciY6jM=;
 b=euTC0eG29A52zMMoK6PPYs2b/8/K6eQ0a9VCqD4cuO2GQq1TmZfdnfHsK5zvMLDXxh
 wr3ri6gn+1y4WAG3EL7YcIGnRTH3GgirvBaDZOLH3TZAZYviqTG8r6gF20jtt6ZQkb3+
 NYnCsEZf/kAuuomHZqXz34+Z+bupCkl/8FYv5HrTBDP4eLBdBGDXzTpaWJji7ZNx8Mys
 2K6f8lqjHaCpsnTo1H4i0x8sbxMzHTWSs4aswNxAjuLXOzhXkPzbgOqBWpG2To5O4HoZ
 exFvhPt+cZeritc5wdMDHr9qo+fz/Vs7OmSe1FwHdTrtd2IggoBCCY1ee2eanx4Fpvkw
 pgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=ge5QrUtQCHkW8lg9TzdN3403LcCU4yxmcnWuDciY6jM=;
 b=GWf9oKZ+C5nl9busWl18Ea7e71TmCL81yVFuNLnmP3XCrNIdmx20LRlnh7NL/QRPw1
 k/g8kKEpWj6j9LGqTNvTp6VYq4mmTpCVM3qpu9J+1oi51iUnsXIOGGESjsy0Ur7f/pFM
 RxNwn2888Lvobkvr3nRNixh50lDrWLNXKMkSn94K2kRLpIslT3OX3W0peR2FopBKYOve
 4b98OVNcchWVy67u4q8ha+81pve7sTmCQWssFt3YbZuFna3+1ZqIGSkigZXtdHqQ6+nL
 jT96hHNF8Yji80XW42iPWfaJg6x5TBdDedlChs2yfsipp0dDXLCADVP/FAFN1ovY3wul
 5KaQ==
X-Gm-Message-State: AOAM531ERV1B+E9y+vcOVRNj7pbfdMdIB5twOpwMZ+clWmGdp7KEf4v5
 pT2pYHl9yA47/Scw1g6lwwg=
X-Google-Smtp-Source: ABdhPJzPBYdQdSW0jQn2Ekr4OqrCvF4eycHuRP4Qh761Af8phFHgRUmlEDHg8cvI6LbFCqG4mkcYGQ==
X-Received: by 2002:ac2:5d28:: with SMTP id i8mr2360292lfb.430.1627027373053; 
 Fri, 23 Jul 2021 01:02:53 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id m6sm712758lfo.0.2021.07.23.01.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 01:02:52 -0700 (PDT)
Date: Fri, 23 Jul 2021 11:02:38 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [RESEND PATCH v6 00/14] drm/trace: Mirror DRM debug logs to
 tracefs
Message-ID: <20210723110238.7ed55475@eldfell>
In-Reply-To: <CAMavQKKSHTjYfbEAqNSy-TeRy=qURGbCNi2vBdZq7UgVrrS0yQ@mail.gmail.com>
References: <20210721175526.22020-1-sean@poorly.run>
 <20210722104921.594d604c@eldfell>
 <CAMavQKKSHTjYfbEAqNSy-TeRy=qURGbCNi2vBdZq7UgVrrS0yQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=kxII8.fIW4qpZBi06HUJu/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/=kxII8.fIW4qpZBi06HUJu/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 22 Jul 2021 09:48:00 -0400
Sean Paul <sean@poorly.run> wrote:

> On Thu, Jul 22, 2021 at 3:49 AM Pekka Paalanen <ppaalanen@gmail.com> wrot=
e:
> >
> > On Wed, 21 Jul 2021 13:55:07 -0400
> > Sean Paul <sean@poorly.run> wrote:
> > =20
> > > From: Sean Paul <seanpaul@chromium.org>
> > >
> > > Hi all,
> > > I just had the pleasure of rebasing this set on our CrOS downstream
> > > kernel and wanted to resend it for consideration once again. There
> > > hasn't been any resistence to the set AFAIK, just perhaps not enough
> > > motivation for anyone to hit the go bit. There was some interest from
> > > the msm folks about a month ago, and it has been an invaluable tool
> > > on CrOS for the past ~year. Hopefully someone can dig into this and
> > > provide some feedback so we can move this forward.
> > >
> > > Thanks!
> > >
> > > Sean
> > >
> > > Changes since last v6:
> > > -Rebased on drm-tip
> > >
> > > Original v6 of the set available here:
> > > https://patchwork.freedesktop.org/series/78133/
> > > https://lore.kernel.org/dri-devel/20200818210510.49730-1-sean@poorly.=
run/
> > > =20
> >
> > Woo! Yes!
> >
> > Do you have a link to your userspace?
> > =20
>=20
> Hi Pekka,
> Probably less interesting that you're hoping for, but here are the
> CrOS patches to enable and collect tracing:
>=20
> https://chromium-review.googlesource.com/c/chromiumos/platform2/+/2354674
> https://chromium-review.googlesource.com/c/chromiumos/platform/crosutils/=
+/2354392
>=20
>=20
> > You wouldn't happen to have already written a privileged userspace
> > service that would deliver on request the logs to non-privileged actors
> > like a compositor to be dumped in an error report? =20
>=20
> Our feedback report generation (log_tool.cc above) collects the logs
> (depending on user log preferences) from across the system and
> packages them up for submission when requested by the user. For
> drm_trace, we grab them from debugfs since we don't have tracefs
> mounted.
>=20
> You could adapt this code to change the delivery method, but I'm not
> sure how much value it would add beyond writing your own purpose-built
> service.

Indeed. Thanks anyway! :-)
pq

--Sig_/=kxII8.fIW4qpZBi06HUJu/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmD6d54ACgkQI1/ltBGq
qqfkMw//W6IJLMB+qxSf8poQR9mFawU9w5GuU/65lNRKtvsU/3lZdFSnZ6h5dbJw
3g3Ef070mLXRQjueyNmP7Yv7rfC7mov93VR6ErdhOptQkSTLD2556jTcKGO1y7D1
pTX9mAc4/5r6c4NGqk7dExejCMurmxKXP3DT3/IkylPoI+4QL/j9hkzgGbP3uUEi
8iVmoRtE0XAclYMuUuzMGuw303/5RBzoI3JddTbn5Vr9gnE5Nz1X1N6xiAkNb701
uNa5C4VaRKY2bqHwJ8rVVOO0xE1pAnBMEWEbP2EHrKI3p2sWSMhau66gPv+J/rSJ
X0nEIBn5SKpUNGLotzL6n4aWeXWtCxk+tY7RJ1E9VvWzcZJwvNCfbYS03tXRD3k5
cILJs41t62p/x7Zng5q0N27EROqqP72OWASkWgQuzCxszOMjYbK9a7jGpKlpNVqH
QbjCawJpGURjj5wh9t2hw94Ais7fItWPBiU7DLbJpdsMF7QCLVUu5WXtnTMso86m
rJxrzUx9+2DYKCmHpizCF+xma8wnL+p+JeOe8Gyy6I9rgSj1Qz0R3Zr/50GSYegd
V2+qOHaqd8AAmrUkV7lAhrcVb+Paev72hmwwlmcUxO4bePlzmPyQVOuCUvlWP6me
wEoPTxrNGNSFDmNmj8ae6LFeUkQZ8eEJApK3uxgeAHJEJEZWiH8=
=ZYUt
-----END PGP SIGNATURE-----

--Sig_/=kxII8.fIW4qpZBi06HUJu/--
