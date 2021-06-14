Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C013A68F8
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 16:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37308899A5;
	Mon, 14 Jun 2021 14:28:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9689899A5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 14:27:58 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id s22so20459524ljg.5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 07:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:in-reply-to:references:mime-version;
 bh=6LWjkysgc1QM05yIbrkalZe7Ds1U0pDX1SddK/eg25Y=;
 b=ZRgUJ4jxne/FIOVOPe36hvhwc1sswBg5gb7lcggmVBraNJy9tR67+lKk8VR/0Wletb
 d/b9FV1s64KMbp+jcyBJxPr+oZIv/IK/6z/j0qJb/SrUeMb5jeAduK3V8VAASVNGH82t
 XfGTK9IKVTyAHOAlPBeR6vtpfLd04XPYOA+aCxXx7LKtMsWmDo5gJGE9WpnzAXOxnvcF
 wljAYdqL34OyFg7DiRZFwPlRHYi8sUjMnmTaGXADOvDBdRZS9oQewU8CJf1osf/aODPd
 UKPwf9khEObkUla44D4wBAlD81YfgDoIiP01TXhHnuNby3iTAN6R25N2k2hrnN0QzNDO
 GzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:in-reply-to
 :references:mime-version;
 bh=6LWjkysgc1QM05yIbrkalZe7Ds1U0pDX1SddK/eg25Y=;
 b=jcRu1ftWIC8nrih1hP3+44EgxAWIbpn7dGnvyAg3oZp9nEXqMaTBjO/PoXeI+XNzRu
 y+SOg+q0mFNSNJj940hXvHqkEVy7gqcTsheD/3xr0ZzapUXN4dXb/1O6byTptdi7AjJ4
 Amka8pIbSmnmS0yH3HXE6JNq+bxxuST0nRdNNy41cYAY7V2LBXpLac1zFwQj9jdsm57A
 13JUt9f923rePqeEqZK+98M3sodklDBsyid/OTcxhF3cgsLshqhGaozCc3fqHF4QGFRK
 CBdNomdctQs7Rkz7qo7Q7LnRk5heZObjD7vUyofMDIpXoMCbetfDVaOg2N2GLRPEDZHY
 4xIw==
X-Gm-Message-State: AOAM5312hDNQFQeI+ObNlxOOXQUTxJLbnck44PwFy7hqXAhpH7Az/KqL
 blboSD1eLe8BeL1bAkNmp148umBn7Yo=
X-Google-Smtp-Source: ABdhPJwpzrGqIB6hj+fSPTefb9eq0yaU1N/epnVxJPjnEeWWb/A+PeEcAVxuXdZf3n1BZxBzhvUdTA==
X-Received: by 2002:a2e:3508:: with SMTP id z8mr13763492ljz.385.1623680876941; 
 Mon, 14 Jun 2021 07:27:56 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id i5sm1495994lfe.113.2021.06.14.07.27.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 07:27:56 -0700 (PDT)
Date: Mon, 14 Jun 2021 17:27:45 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <20210614172745.60910798@eldfell>
In-Reply-To: <20210611055407.aoeams62wbalodrj@gilmour>
References: <20210610174731.1209188-1-maxime@cerno.tech>
 <CAKMK7uG_Wkko0L6sv0U1bXWdYk4fg3OTcp5=+qfRV0CP9V44=A@mail.gmail.com>
 <20210611055407.aoeams62wbalodrj@gilmour>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/OoTgEFkqJu0u1fwSBr0X8sK"; protocol="application/pgp-signature"
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

--Sig_/OoTgEFkqJu0u1fwSBr0X8sK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 11 Jun 2021 07:54:07 +0200
Maxime Ripard <maxime@cerno.tech> wrote:

> Hi,
>=20
> On Thu, Jun 10, 2021 at 11:00:05PM +0200, Daniel Vetter wrote:
> > On Thu, Jun 10, 2021 at 7:47 PM Maxime Ripard <maxime@cerno.tech> wrote=
: =20
> > >
> > > New KMS properties come with a bunch of requirements to avoid each
> > > driver from running their own, inconsistent, set of properties,
> > > eventually leading to issues like property conflicts, inconsistencies
> > > between drivers and semantics, etc.
> > >
> > > Let's document what we expect.

Sorry for intentionally losing the whole CC list, but I'm not
comfortable CC'ing such a huge list (of lists) with just this.


> > ltdr; I'd go back to v2. And then cc compositor folks on this to get
> > their ack. =20
>=20
> So, Pekka, Simon, is there anyone else I should Cc?

You can find some Wayland compositor contacts in the following. These
are not all compositor projects listed there though. They also signed
up for wayland-protocols rather than DRM UAPI discussions, but maybe
taking a few won't mind:
https://gitlab.freedesktop.org/wayland/wayland-protocols/-/blob/main/MEMBER=
S.md


Thanks,
pq

--Sig_/OoTgEFkqJu0u1fwSBr0X8sK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDHZ2EACgkQI1/ltBGq
qqeUTRAAriov9MRRtTHNZ2xJh5Qc1YoSE5/brYd6qSr22bqRvyB8SIBL675sCAPR
VS5xZaS9SqsNIXFJIXp/RZyQZkhw981wmvHciZTxlpKCazhpwrSq9PPh03r6p/kk
dcQPviZn5r80bLnTIsX5i0mVM8mO+C8fsZB8bkWZA9e7YIlGJTlEOjGKRXwaaOKu
rNyHcWSZ9W6WilqACFArIgiR1DhjZR2X7omvv3JOdJetthY/LchHmZFFTp98zYWw
H9yjVxMABVYUua/Vse6KodsiNWv//rHnEX2hRbHoyZWP3pZhPrejaywHp6+RcgFO
jfuliT3RRUao4uohPVQe/JEVCAPKLggAPc7xrd7Y0xB/u2BijPIF6CUMxh0F45e2
9r6vVVytXkzc33uylrPG3GxaAB1iDzLnZdaXSzMoYwQkgSGtiIyJILqwciM+der/
VXQuJsM05i/vb7aXIoGtN67Pijx6Mr/7ry4X8E1JZzN29yvFNZ8SSDx9Jals0PpR
AiId9RuprChEiSpzsX5ueYBA2O95O3psQ5cwv7sQhqn45tVvrwHiKRzxmLhqwSnm
11Az5huoR8bzjr/z+oRVgKfBTFUkXTis13kwW8sQzlqeB4lJJ+2WZYdgkCdxay3x
N90lVeoRh0MmyZ2i8661LKgycdnbhOKi9D86RoldUr1XvTfqG7I=
=cMIa
-----END PGP SIGNATURE-----

--Sig_/OoTgEFkqJu0u1fwSBr0X8sK--
