Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 688FAE8342
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 09:33:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C846E10D;
	Tue, 29 Oct 2019 08:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A2B6E10D
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 08:33:25 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id a21so14256334ljh.9
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 01:33:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=kpZNZyckDz3FX+7scK0RzXf3C6ZUZUz2onvVAmMbptM=;
 b=Epk1aDK5xOQa/fA4UTgcGKUCy4pn02iGavmhX5nEWv1rqIwGdQQ93ogVLGHyTgQfzL
 F0+tjYWoIF5A1ypFSckWGxgqZq9yGQkAULJm3QKUk2if64dLHKmAgcSKgSLkEA7O1A/u
 kpTxs0SpsNBfZtF05bCg6zBMa+yWLbxVZuD166nHUpKCkTnZ2+ANivnkTxHGxgXP+U9C
 LK7qd/rprC7/+CGMevJpA/FR71JYUwEfRJSl8/76qyQbUM7bY3wsuDSgbi8mUaed+8AU
 EGacjthxK/3xtXQa1jXUUjA0LVFdjHqxF8D3J3L15tTfts1kZdMv2kWkW4Th5ngshsYP
 ZKHA==
X-Gm-Message-State: APjAAAWxXG6qt1HYyP4b3cuNaxhIcgJFGY1jRs6v82d93lEozpC9z/il
 7L5576C7c51KDclr5QzkMXA=
X-Google-Smtp-Source: APXvYqxxv7ipxw2+cRej6obgouZkcd1fFVPbx39dWxFOYr+tzvCLAkjo8kusV7Cg3pMyXMilj3lNZg==
X-Received: by 2002:a2e:6817:: with SMTP id c23mr1569200lja.91.1572338003518; 
 Tue, 29 Oct 2019 01:33:23 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id h21sm6902748ljl.20.2019.10.29.01.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 01:33:23 -0700 (PDT)
Date: Tue, 29 Oct 2019 10:33:04 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Yiwei Zhang <zzyiwei@google.com>
Subject: Re: Proposal to report GPU private memory allocations with sysfs
 nodes [plain text version]
Message-ID: <20191029103304.29142c34@eldfell.localdomain>
In-Reply-To: <CAKT=dDnXwa76_aOVhTaKyE2=2HT2qGHvP9HGqnMzArr-Jt3A+Q@mail.gmail.com>
References: <CAKT=dDk0sNAXxz-angd5WvQXXLF8p3sPLEzOt=wVSLhuaP8dkQ@mail.gmail.com>
 <20191028152602.GA5057@redhat.com>
 <CAKT=dDnXwa76_aOVhTaKyE2=2HT2qGHvP9HGqnMzArr-Jt3A+Q@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=kpZNZyckDz3FX+7scK0RzXf3C6ZUZUz2onvVAmMbptM=;
 b=Sh0LClv+W1wv058xOiFI3k1Uw8g02N3T2aSeS6zx2Vm/BJVmseJ/hBukZaK/uzr2EQ
 lCeqamyKQgkk+O/MxfYvE+AUzmQY1lCjg3gQSXpcfEF44E/u9XClooma2AqMVFNn/0LH
 IQWJWO6LljBL5Gm3edveURZ/qCexdt9QVdKRD6l96jV3ilWbXwLrWR9NJh3CK+F9FMk/
 XNVj7oT7xydCjYZVQafTH52DktgIQ6WLinaD9SwPDIPA1Lez634opCI565HQzzSpE2ta
 MlVgvKynKWz7wjsMlABlepgp0J0fqon1eqmn+spsvgUT2SHwBlZwOje4qoRDIsyTG8j0
 lSRg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Alistair Delva <adelva@google.com>, Prahlad Kilambi <prahladk@google.com>,
 dri-devel@lists.freedesktop.org, Jerome Glisse <jglisse@redhat.com>,
 Sean Paul <seanpaul@chromium.org>, kraxel@redhat.com,
 Chris Forbes <chrisforbes@google.com>, kernel-team@android.com
Content-Type: multipart/mixed; boundary="===============1029016723=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1029016723==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/N_Rfw4g3_/gC=rkH3_SlJNw"; protocol="application/pgp-signature"

--Sig_/N_Rfw4g3_/gC=rkH3_SlJNw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 28 Oct 2019 11:33:57 -0700
Yiwei Zhang <zzyiwei@google.com> wrote:

> On Mon, Oct 28, 2019 at 8:26 AM Jerome Glisse <jglisse@redhat.com> wrote:
>=20
> > On Fri, Oct 25, 2019 at 11:35:32AM -0700, Yiwei Zhang wrote: =20
> > > Hi folks,
> > >
> > > This is the plain text version of the previous email in case that was
> > > considered as spam.

Hi,

you still had a HTML attachment. More comments below.

> > >
> > > --- Background ---
> > > On the downstream Android, vendors used to report GPU private memory
> > > allocations with debugfs nodes in their own formats. However, debugfs=
 =20
> > nodes =20
> > > are getting deprecated in the next Android release. =20

...

> > For the 2nd level "pid", there are usually just a couple of them per =20
> > > snapshot, since we only takes snapshot for the active ones. =20
> >
> > ? Do not understand here, you can have any number of applications with
> > GPU objects ? And thus there is no bound on the number of PID. Please
> > consider desktop too, i do not know what kind of limitation android
> > impose.
> > =20
>=20
> We are only interested in tracking *active* GPU private allocations. So
> yes, any
> application currently holding an active GPU context will probably has a
> node here.
> Since we want to do profiling for specific apps, the data has to be per
> application
> based. I don't get your concerns here. If it's about the tracking overhea=
d,
> it's rare
> to see tons of application doing private gpu allocations at the same time.
> Could
> you help elaborate a bit?

Toolkits for the Linux desktop, at least GTK 4, are moving to
GPU-accelerated rendering by default AFAIK. This means that every
application using such toolkit will have an active GPU context created
and used at all times. So potentially every single end user application
running in a system may have a GPU context, even a simple text editor.

In my opinion tracking per process is good, but you cannot sidestep the
question of tracking performance by saying that there is only few
processes using the GPU.

What is an "active" GPU private allocation? This implies that there are
also inactive allocations, what are those?


Let's say you have a bunch of apps and the memory consumption is spread
out into sysfs files like you propose. How would one get a coherent
view of total GPU private memory usage in a system? Iterating through
all sysfs files in userspace and summing up won't work, because each
file will be sampled at a different time, which means the result is not
coherent. Separate files for accumulated statistics perhaps?

What about getting a coherent view of the total GPU private memory
consumption of a single process? I think the same caveat and solution
would apply.


Thanks,
pq

--Sig_/N_Rfw4g3_/gC=rkH3_SlJNw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl23+UEACgkQI1/ltBGq
qqdCug//fhBN/79N7lySyNwfFTyBnBmsbiOf952GftwvK4yaBdphJzIXX5KJ7owY
TgCFMq+rlZXB50w9Ez+Lzz0RbSPb1bkzKBm/k+sO41JB653ryzjYZZkyQzqawucH
WL7VWjCEct1sYAUJtSd1KqZ/kper0sevstKK8ZArXPzEJ6JviUiYjIENVIp20rge
W7Q4SLsxTwaKSn0q219B1wAf9ZfvPyvsMOrVoXkV43eeeNmtc0zuFCWeHvycsBO6
XOXIACUkjuk1FjSUXRHBwfmwyn3RSZ3tZ33dXQI91q+vZNtR1P+Or40ICvHB3/dk
k6cn9yQJIqW+MDrUsuUJbakBBCpUXz3fru7g+6eBEfWE1pWVY1d+/HtqWxblcbXq
twEfy4tb1L4kbxdU2J60qlL64Y3oMlm9kI2zu6tSJNuWZ0vZBcDEP9NgkjF/b1pO
O69h61rOmeaSrWfL8BqsUj6Kld6uJW/z4dGLKYLRjGSGgXXGmYZT0obmu6oozC9t
xfDPWhiCjY1G66ab67lBzv99BytRo8ThF+bNURn0n1+ldgDcXrW4Cw+rNsmwYSNg
0LO8fIWoeB6GvV64IW6eEU9ooi5xtiDYTC6hqAm6EJKFBF77b0Q/osTRSZV8VUqw
/ciblxHNtm4FTQ7EEY+odba2FDV/gh0Ol0oDqHiHA7OuuS1TfD8=
=KqqE
-----END PGP SIGNATURE-----

--Sig_/N_Rfw4g3_/gC=rkH3_SlJNw--

--===============1029016723==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1029016723==--
