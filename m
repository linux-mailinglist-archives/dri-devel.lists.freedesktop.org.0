Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9184942B8FD
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 09:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B3A6E096;
	Wed, 13 Oct 2021 07:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA0B6E096;
 Wed, 13 Oct 2021 07:26:02 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id r19so7532786lfe.10;
 Wed, 13 Oct 2021 00:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=mDp7NGBddKorQjWvvsNdj9CZE+1x05FeYQmX1nZe3GQ=;
 b=S69TCSi1pQaM0mZx1pMaXuzYV+8KPMqSAxQAr7K5YRbi75D32yRKVBVtURUCscqLjX
 vYzlDeDn4cTuO8n5V1mQDXe3YpsiyInfDWuwV99oVauVgEaoK4aFiuVJZCPNRtf76GAj
 ArjL5Sa0vjpJFd2azRxm4sh+b6Huiws5m8WullkcIIA7S/BpfuVvhXnMHeJ+PNFNG6a2
 R7KLudsBQEgKTGuYqpwNaSUd+JeKonwqJAg3yHfWkyhz/ugMcO1zxb1nC/z7AHCvQc4C
 uhtGCA860lcvYrvrt8rXhRb0O7jAdpUxyIGkYRi8QXRDptPz3OUJnp21X0zxHgViA43Y
 J1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=mDp7NGBddKorQjWvvsNdj9CZE+1x05FeYQmX1nZe3GQ=;
 b=rthf4I/S2lQFBhtJZvRsJIO511xtoGcdpdHdMyN/Mi4sTNXIiJ1hv/d4B/XeGXecbc
 Pjmqsj4ND+f6kGtpF/vSYhzn1c+pu7T8s0b9VTZksO9KQJwdcewq0yiJMWcIedHCQm6o
 D3w9gEVJgigVm53B+Ln15D+yslZV+YeNzYnJ1hizEdTiuLuLqOVmjCUXLFme3OAi440H
 CYhdLrTbYQofOEjtEIbCKha5mmAgj+fehaTXjzrZ+a+YC+/1OOL56i++9UR2Z0jj77zw
 +XZ0wu0j5QVD0xRxqSO8NXlX2eJb1WDXu3rlmnDpPLLyBxtNRY10qKW+hFMBdxk74EY5
 dZiw==
X-Gm-Message-State: AOAM530w0uEV11enc78dYRu2MgfOtgzW9vuVxUwesdnJBYcHyoO1R3Jf
 NaN+1JnhCKPj6P5/mPU35YI=
X-Google-Smtp-Source: ABdhPJwu9W8J9wL6WvOVn7BkKeAky+5NhjMzijaplQgW8HSqWWplxA6E1Pae2JeScDm/hcxfiLCavw==
X-Received: by 2002:a19:4950:: with SMTP id l16mr5644976lfj.248.1634109961028; 
 Wed, 13 Oct 2021 00:26:01 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id v17sm1489676ljk.117.2021.10.13.00.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 00:26:00 -0700 (PDT)
Date: Wed, 13 Oct 2021 10:25:49 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: "Shankar, Uma" <uma.shankar@intel.com>
Cc: Simon Ser <contact@emersion.fr>, "daniel.vetter@ffwll.ch"
 <daniel.vetter@ffwll.ch>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "brian.starkey@arm.com"
 <brian.starkey@arm.com>, "sebastian@sebastianwick.net"
 <sebastian@sebastianwick.net>, "Shashank.Sharma@amd.com"
 <Shashank.Sharma@amd.com>
Subject: Re: [RFC v2 01/22] drm: RFC for Plane Color Hardware Pipeline
Message-ID: <20211013102532.32da12c4@eldfell>
In-Reply-To: <917a5ffa4e00446a8469cf571458db7b@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-2-uma.shankar@intel.com>
 <20211006155559.606521de@eldfell>
 <vBmviRgvVBT-q8HSsJLnRc5CfOMr5rFRj6oeIqwh8QJSicQzQxu8_ORxE3OffANSSyF3wUF9_QFRk1uzrggdx_dcI-1WGzmruI4kIFdZQcU=@emersion.fr>
 <20211012150011.6ca63157@eldfell>
 <917a5ffa4e00446a8469cf571458db7b@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hW2uA1zV5SpAwG0yk2ACg.7";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/hW2uA1zV5SpAwG0yk2ACg.7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 12 Oct 2021 19:11:29 +0000
"Shankar, Uma" <uma.shankar@intel.com> wrote:

> > -----Original Message-----
> > From: Pekka Paalanen <ppaalanen@gmail.com>
> > Sent: Tuesday, October 12, 2021 5:30 PM
> > To: Simon Ser <contact@emersion.fr>
> > Cc: Shankar, Uma <uma.shankar@intel.com>; intel-gfx@lists.freedesktop.o=
rg; dri-
> > devel@lists.freedesktop.org; harry.wentland@amd.com;
> > ville.syrjala@linux.intel.com; brian.starkey@arm.com;
> > sebastian@sebastianwick.net; Shashank.Sharma@amd.com
> > Subject: Re: [RFC v2 01/22] drm: RFC for Plane Color Hardware Pipeline
> >=20
> > On Tue, 12 Oct 2021 10:35:37 +0000
> > Simon Ser <contact@emersion.fr> wrote:
> >  =20
> > > On Tuesday, October 12th, 2021 at 12:30, Pekka Paalanen =20
> > <ppaalanen@gmail.com> wrote: =20
> > > =20
> > > > is there a practise of landing proposal documents in the kernel? How
> > > > does that work, will a kernel tree carry the patch files?
> > > > Or should this document be worded like documentation for an accepted
> > > > feature, and then the patches either land or don't? =20
> > >
> > > Once everyone agrees, the RFC can land. I don't think a kernel tree is
> > > necessary. See:
> > >
> > > https://dri.freedesktop.org/docs/drm/gpu/rfc/index.html =20
> >=20
> > Does this mean the RFC doc patch will land, but the code patches will r=
emain in the
> > review cycles waiting for userspace proving vehicles?
> > Rather than e.g. committed as files that people would need to apply the=
mselves? Or
> > how does one find the code patches corresponding to RFC docs? =20
>=20
> As I understand, this section was added to finalize the design and debate=
 on the UAPI,
> structures, headers and design etc. Once a general agreement is in place =
with all the
> stakeholders, we can have ack on design and approach and get it merged. T=
his hence
> serves as an approved reference for the UAPI, accepted and agreed by comm=
unity at large.
>=20
> Once the code lands, all the documentation will be added to the right dri=
ver sections and
> helpers, like it's been done currently.

I'm just wondering: someone browses a kernel tree, and discovers this
RFC doc in there. They want to see or test the latest (WIP) kernel
implementation of it. How will they find the code / patches?


Thanks,
pq

--Sig_/hW2uA1zV5SpAwG0yk2ACg.7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmFmif0ACgkQI1/ltBGq
qqdTFRAAhpY7wOqg1uVTVMXjzAr+OXQaejK1ClTgHWPMpR6wbo0goTR4bxY3qmhg
nrWQzGsj6nVKJ7wmElNnC0F6iabWiZ68SHuJa3c4zPJP1am5xft/9I+JKMMF/7Iw
/wtGJscMw0mW4mnqT1hGZ4UycMP0h1aPmeqExRA/7XxYSz6H9OPuFTUJdCBSuz1t
yamJFzQOqcoIknzTkyt4S2KEAbgbt22jWl/s5Y2VigkdbZo4FhDPlownVbbvtwyC
FjAJt/OsL8+SF7QR52m1fKhHqrfgc5J8QAFLzJbt2oCJkxCt8BQSAtlAVOpqjQVi
63+SoOl1X42Ldz9HyD7RDTKNDDwndROlsnbDmyWm7EghMJbkVkTwBMKz3HK0AwpK
iQ4RxDdJIzFPXZOLNX2th2k/hErInNnkfRaH87WRxcKmkQlEBMemkzxP1fpCAhuS
AXCF/svH1rKKlhHXbyDujirTtWwUsAoPE377pYeNnAQM915VEiKEKPGZ+1NZP0Gb
wYXs1LT46pd8+9owkeokKZljIly4UNG/ALbJDc07mbqgUgtF4A4VAuYAAbkCIAoI
PgOAmNzONePTOXIrY92o/VG4gdahksa3St9RxfcPSanKVKD/yT97i0/z1jl1j9W8
NUFp1RUKLlprpSE71uKQAxxs1SLP+Z93rPna2bR8cM4J35zynr8=
=kROA
-----END PGP SIGNATURE-----

--Sig_/hW2uA1zV5SpAwG0yk2ACg.7--
