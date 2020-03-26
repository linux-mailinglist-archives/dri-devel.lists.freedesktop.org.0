Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4344E193BFC
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 10:36:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82F389718;
	Thu, 26 Mar 2020 09:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4381E89718
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 09:36:41 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id r24so5672709ljd.4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 02:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=KWNJ9nKqdX2PYz2rRTz5fzXvUp45Mc3ytYvD3OtT0eE=;
 b=g2VcgcN9pYclqWggLp7CVml2ARuue1zY3ZGNd0Nz9IfJ18RRG5X/PKdmetO4U9l9LY
 WhtGQasEFMiqy3Qzk9DkCR5j67NkRPP2ZchKPr/hJ6Ba4c4AzQ8BikkPIyaLlH2zC9+t
 IE4SEkSf46fR+ridPgoJNr7mu50wECxASwNRJBia9nKSWj+mGnkt3kYS7Ix8duZFbG7L
 QewWqyhDFLmpFvIgXjjyCaYWA/Ex/zkm6iolWFieXcejNzMnIwY2xHMCfu/Trj6NYSNH
 Gjg6w03dbJ3gN/YlWrKMCKh4535RyNeN//pKfIoJ0GwK7lfStRNMdOEWfSUR2DhDM3Ok
 rthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=KWNJ9nKqdX2PYz2rRTz5fzXvUp45Mc3ytYvD3OtT0eE=;
 b=cY7XJy5c8/DIgQB2u8dWGeKO4aMNczcllmIq9VvxiyEhfFrTn7zDMmWQFhrrQhrm76
 s5UWQI5XqxUBKrYVltPlhz8PyYOlQvOSDkpnWRL/mXdTiJLeyr9+pWLy/r0tq4PGuhsT
 klkpuiuhAxlJ7NZPM4QBFfyAxGye5DbC1kUlSZ4pXhaEf/LMLWOOxk5ZOXGM69FJ8x7K
 eZ8mD9TuMor8mt63HnuffWpxVmX0dWBSoqdQKIWCPii+dfZhE6bb3NJe9goXON+Hgsmu
 cEiQTajRuwBBs85vzaclzxRaXcB4RaT9OXPVZI4m0dDSpsyZc1hWT0VcweOvTk/H2mdn
 tXDQ==
X-Gm-Message-State: AGi0PubbBzzq4xhtRxGop2/RELamlz5GVyICWO4ZuDI6JVMpA9g/UhOD
 xsX1JfrCoQBCszZUOeCq+3o=
X-Google-Smtp-Source: ADFU+vu3vZ8AvLNRzSZLJOZzi/DjZPgsWfluY5a03XJz/5PI9hSC8DSZ5HGxQHx+PXRxeE6OqJN8fw==
X-Received: by 2002:a2e:a412:: with SMTP id p18mr4848583ljn.39.1585215399334; 
 Thu, 26 Mar 2020 02:36:39 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id x128sm1087236lff.67.2020.03.26.02.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 02:36:39 -0700 (PDT)
Date: Thu, 26 Mar 2020 11:36:32 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v4 7/8] drm/fourcc: amlogic: Add modifier definitions
 for the Scatter layout
Message-ID: <20200326113632.6585cf7b@eldfell.localdomain>
In-Reply-To: <a385e2f6-52fa-e195-15e0-2132befc9f35@baylibre.com>
References: <20200325085025.30631-1-narmstrong@baylibre.com>
 <20200325085025.30631-8-narmstrong@baylibre.com>
 <JgBZ7eZYMgXRNu_-E4ItS1bud9mEe15xptZEX_XhsM_h8_iIZTOmPokEVxPJYwX0wP0pmb5p-ymubyyZP3kVbcfuDNdmM0__L8wBR5IykfE=@emersion.fr>
 <b1386ef5-c3e3-c07b-5982-e3f02441b431@baylibre.com>
 <20200325154921.2a87930c@eldfell.localdomain>
 <a385e2f6-52fa-e195-15e0-2132befc9f35@baylibre.com>
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
Cc: "mjourdan@baylibre.com" <mjourdan@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Kevin Hilman <khilman@baylibre.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============0461172846=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0461172846==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/F2Ih.eNxkQvUVkW9+CfEnKJ"; protocol="application/pgp-signature"

--Sig_/F2Ih.eNxkQvUVkW9+CfEnKJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 25 Mar 2020 17:18:15 +0100
Neil Armstrong <narmstrong@baylibre.com> wrote:

> Hi,
>=20
> On 25/03/2020 14:49, Pekka Paalanen wrote:
> > On Wed, 25 Mar 2020 11:24:15 +0100
> > Neil Armstrong <narmstrong@baylibre.com> wrote:
> >  =20
> >> Hi,
> >>
> >> On 25/03/2020 10:04, Simon Ser wrote: =20
> >>> On Wednesday, March 25, 2020 9:50 AM, Neil Armstrong <narmstrong@bayl=
ibre.com> wrote:
> >>>    =20
> >>>> Amlogic uses a proprietary lossless image compression protocol and f=
ormat
> >>>> for their hardware video codec accelerators, either video decoders or
> >>>> video input encoders.
> >>>>
> >>>> This introduces the Scatter Memory layout, means the header contains=
 IOMMU
> >>>> references to the compressed frames content to optimize memory access
> >>>> and layout.
> >>>>
> >>>> In this mode, only the header memory address is needed, thus the con=
tent
> >>>> memory organization is tied to the current producer execution and ca=
nnot
> >>>> be saved/dumped neither transferrable between Amlogic SoCs supportin=
g this
> >>>> modifier.   =20
> >>>
> >>> I don't think this is suitable for modifiers. User-space relies on
> >>> being able to copy a buffer from one machine to another over the
> >>> network. It would be pretty annoying for user-space to have a blackli=
st
> >>> of modifiers that don't work this way.
> >>>
> >>> Example of such user-space:
> >>> https://gitlab.freedesktop.org/mstoeckl/waypipe/
> >>>    =20
> >>
> >> I really understand your point, but this is one of the use-cases we ne=
ed solve.
> >> This is why I split the fourcc patch and added an explicit comment.
> >>
> >> Please point me a way to display such buffer, the HW exists, works lik=
e that and
> >> it's a fact and can't change.
> >>
> >> It will be the same for secure zero-copy buffers we can't map from use=
rspace, but
> >> only the HW decoder can read/write and HW display can read. =20
> >=20
> > The comparison to secure buffers is a good one.
> >=20
> > Are buffers with the DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_SCATTER modifier
> > meaningfully mmappable to CPU always / sometimes / never /
> > varies-and-cannot-know? =20
>=20
> mmappable, yes in our WIP V4L2 driver in non-secure path, meaningful, abs=
olutely never.
>=20
> So yeah, these should not be mmappable since not meaningful.

Ok. So we have a modifier that means there is no point in even trying to
mmap the buffer.

Not being able to mmap automatically makes things like waypipe not be
able to work on the buffer, so the buffer cannot be replicated over a
network, hence there is no compatibility issue. However, it still
leaves the problem that, since waypipe is "just" a message relay that
does not participate in the protocol really, the two end points might
still negotiate to use a modifier that waypipe cannot handle.

Secure buffers have the same problem: by definition, one must not be
able to replicate the buffer elsewhere.

To me it seems there needs to be a way to identify buffers that cannot
be mmapped. mmap() failing is obvious, but in waypipe's case it is too
late - the end points have already negotiated the formats and modifiers
and they cannot handle failures afterwards.

> >=20
> > Maybe this type should be handled similar to secure buffers, with the
> > exception that they are not actually secured but only mostly
> > inaccessible. Then again, I haven't looked at any of the secure buffer
> > proposals. =20
>=20
> Actually, the Amlogic platforms offers secure video path using these exact
> modifiers, AFAIK it doesn't support the NV12 dual-write output in secure.
>=20
> AFAIK last submission is from AMD, and it doesn't talk at all about mmapa=
bility
> of the secure BOs.

To me, a secure buffer concept automatically implies that there cannot
be CPU access to it. The CPU is not trusted, right? Not even the kernel.
I would assume secure implies no mmap. So I wonder, how does the secure
buffers proposal manage userspace like waypipe?

Or, is the secure buffer proposal allowing mmap, but the content is
indecipherable? Maybe they shouldn't allow mmap?

I think much of the criticism against this modifier should also be
presented to a secure buffers proposal and see how that turns out. If
they have the same problem, maybe you could use their solution?


Thanks,
pq

--Sig_/F2Ih.eNxkQvUVkW9+CfEnKJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl58d6AACgkQI1/ltBGq
qqfv1g//d/m5shjV09aO55+5dizEtNZQS5y+iI9nVhzwBaiiaWEHq1dQrBza/73Y
gy3Gh0ML0Al/kUy9oQYdYwKhlAiO/Hx1HEPxANiqCKkikf7mhnTftkLUXuMrGA38
O/+vq1v+srGKLpAznNXNE5qIl98/yWP3MJXTe7Kenl4hUrIjZLz3bx8+93WZvpOZ
Tbh9uJuTouKTeQ//Yt7EG2wpkERQv21wGGFFOdSPBLkl3O/DiyDP50WKHEqVzBNB
CWFdQgFMi+k/MVxB7xDswMxxwzaDRcFfQpUCF441mYsV/glMrH5gVbbaT7T8ZTfu
azojy8CRM5ZbBB4wdd98ta75EL9PkXnNQBW6SVdZsT4i2utoc7lq0bLkDdrpIicC
1E7Zuxmu/wQ9Pm7Kob+2ZqvFKR7Ey9thbeSsoZlzX7hgpO1XfgHramWPkR/eUh5x
3hczryq9Zenlkv1EzOHWGUUsUPaiJh0HW+9Yc07h9WTuGkOgJkkP7Ll0R0hNQxiv
1DAkBB5SBE+DSDyUXpd0ucZMTr3v0Fin9SxeeX0rQIKfUWNoyYn+QTnD/xYmtTqF
3JrP3swNnaHKLB2p25K4N32ggHamAl0Roc0ohPlh5Z7ZleVW95va5ttP6jdawObq
6R1xVH6EsJ0wtsGjxNvRO2Bod4W6v2UDcM/IjXHA0WWwm4bar2k=
=zAly
-----END PGP SIGNATURE-----

--Sig_/F2Ih.eNxkQvUVkW9+CfEnKJ--

--===============0461172846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0461172846==--
