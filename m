Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0E8894CD1
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 09:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E1210FAF8;
	Tue,  2 Apr 2024 07:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LZSOGHQA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2F110F8FB;
 Tue,  2 Apr 2024 07:46:23 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-515d49a6b92so2025145e87.3; 
 Tue, 02 Apr 2024 00:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712043982; x=1712648782; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=taIVd+GK795OjgeG9kSZtx5xbeqa5chcM/860KbJ/J4=;
 b=LZSOGHQAtE65jLe6D1h4ZPV8DNLJ83zMvozcXR2y9eD70tmNvkIY5aCP8atW1DTUJB
 izloZKnML94+bUJhTIYt7H7pZbuu6dVRuCkJoTmUcU9Dt6VPiYfnY3gNWUviPqd/0M0n
 NC6ocv83tZVNd1Oy+a4L9wVCoKJe+dHyyQh5XDGsajZszjKEnq8wZBq+7D3qarSKBjWX
 ATM7cAgy/Zwg4fvOxcPdtUtaKIrZ35cWPQ9EK0XbL/wx6+H+mcs4hg+w+vxUA0rdd+7r
 wRw0QP8pnXFFax0C8jTVT24EbK3GCwOObx3zkRLTfXlTjeMCE7JZBZoo2QIdhkQ5o3mA
 AOEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712043982; x=1712648782;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=taIVd+GK795OjgeG9kSZtx5xbeqa5chcM/860KbJ/J4=;
 b=Rj5XHKzABQyy0L09YXArRVehadqMfcJ+wuuRIUwBc2wc6wOOZMuvds/TMHCx+b3IHn
 cMBVg8c6wDR+MWpTPCf7s8zCx/dPzinc48SV9Dw31p63S4/6qhkinad/aa7ERGmWcWB3
 1hNhrPPb2Z9PVRPaO0KHexLo6AEf2ws53CWcuKlqcM16J5rUu70fMAwgRDJO9GTDZlYs
 cpuIlQnUDT06Ze77t0fuNw3O/5meNTUF8WPEoOkCvOCDF9x10wk7PPI9nAGn+g5Frbh/
 SW+brP+eafMPo0VWB+4p/xRfzLdk3MhtAGgX+h/NCET7nQ2vWQoJMLuTHttSH4+BK+EI
 DHLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVirYMSYHsneup1OBNpMmrmsv7hC4ytIQ+Nz4ybXxpCRCmYC9ytpjAgD58bRccfBu1vu3J1kiQ4EsscFdRRbAwPPUl5WUR4TJWpo0UH+V/ny8vuoL75ZaqubTK9Wiai3UkWkSx3RfXR3L9h257faXITWeE1Qn+lh+L1PLM4ryGUTsDHDYhVTvZMqMlNpDQ+9rmbG2JNKlbegtX2QmAJ3+ia1IJJmGgFiVjCtgtRWNMm7ds9beght7gqFFxHx6i73reKWTjzUv0XW8sbjMPsRdvfsmkTIZS1zN/hWb0mOJSvERE5Hu2R2dkiL/CoWHiArIyNS6zH0oeSwAiPSue17gSqOw2hxrgKj3tI4Upfs2m9vc+36uLOu4jsVngSZ5EPKOipKbBfSpk7eIXi90XxhOnna3zP5y8NpsiztxJbl4s0kIlc/69emqkmudB9e73eJw==
X-Gm-Message-State: AOJu0Yy9Armo7Uh1ofUo8aVa9n+zESxjJKYKES2e40fDFILc5Vyc8eTy
 O/bvcveLwzJ3iaCTh6zhMWUaZa1vY9nPesLhwydxI5reWEqD1oXP
X-Google-Smtp-Source: AGHT+IFxhMLlt5HXgwY6+iG/dDw5dmfT+G01y7F3wTcuXP0RpaiyYX7Mjsf/JJM6iaeXeg29GPoyzw==
X-Received: by 2002:a05:6512:3ca9:b0:515:a417:331 with SMTP id
 h41-20020a0565123ca900b00515a4170331mr8977857lfv.9.1712043981316; 
 Tue, 02 Apr 2024 00:46:21 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 u2-20020ac258c2000000b005134b126f0asm1661430lfo.110.2024.04.02.00.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 00:46:20 -0700 (PDT)
Date: Tue, 2 Apr 2024 10:46:08 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Christopher Michael <cmichael@igalia.com>
Cc: events@lists.x.org, xorg-devel@lists.x.org,
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 libre-soc-dev@lists.libre-soc.org, elections@x.org, members@x.org,
 xorg@lists.freedesktop.org
Subject: Re: 2024 X.Org Foundation Membership deadline for voting in the
 election
Message-ID: <20240402104608.6f6a9121@eldfell>
In-Reply-To: <57dd238b-2b94-4b46-a8be-c53b2f985e46@igalia.com>
References: <0efcdfe3-ea9e-43e5-ab07-6d69dca2c04a@igalia.com>
 <57dd238b-2b94-4b46-a8be-c53b2f985e46@igalia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hnrm2UtMP0gSYd7p5vJ2Svs";
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

--Sig_/hnrm2UtMP0gSYd7p5vJ2Svs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 26 Mar 2024 11:42:48 -0400
Christopher Michael <cmichael@igalia.com> wrote:

> The 2024 X.Org Foundation membership renewal period has been extended=20
> one additional week and elections will start the following week on 01=20
> April 2024.
>=20
> Please note that only current members can vote in the upcoming election,=
=20
> and that the deadline for new memberships or renewals to vote in the=20
> upcoming election is 01 April 2024 at 23:59 UTC.
>=20
> If you are interested in joining the X.Org Foundation or in renewing=20
> your membership, please visit the membership system site at:=20
> https://members.x.org/
>=20
> Christopher Michael, on behalf of the X.Org elections committee

Hi everyone,

given that the year's first email reminding everyone to renew their
memberships was sent on Feb 7 when the renewal was NOT open yet, I
wonder how many people thought they had already renewed and are now
thinking they don't need to do anything?

I fell for that: On Feb 7, I went to members.x.org to check my status,
it said I was registered for "2023-2024" and there was no button to
renew, so I closed the page confident that I was a member for 2024.
After all, it said 2024. This was a mistake I realised only after being
personally poked to renew. I know for sure of one other person falling
for the same.

Now, the members page for this year says "Application for the period:
02/2024-02/2025". Thanks to the people adding the month to reduce
confusion.


Thanks,
pq

--Sig_/hnrm2UtMP0gSYd7p5vJ2Svs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYLt8AACgkQI1/ltBGq
qqe21A/+KxWOfCsyLUHk8qlW8Tx3oH1Jzt0vDySQ0L8A3WxA0v6rp+bSrK5zeDaH
T7xGuivb3MJThnCZQgilHz1K3LT/tawhyuSe/D07yNvfVDLBoduyKV4nVB4toVXG
j/a647wS8yLpNwhnEF1bIfi5yZRi3RyUferr8EyITomb+Yy8KFqpGSz8ikvKujC7
+snP6w988lJ5xf2BSRfaNGZ0Aq9MoVFWTe5z+VGw7aoza6OCN+CGpuFEMxozkOuu
1GoPBMm3mMSSkQ1ImLVrIaoSuUiaRvFCG8NXkUmJzocWVV0uMXJ0BzCb8utWnDlf
L7P99IwIk/2e86IXoqff+D0l2KtAShqhDd8QAx0NA+yVvI/YF22xdlAimrhaSxlC
p7TQlMZY8ViFS8NGb3Qc4evQkYcP63Pd+FwsBLvQKi2RDHEMiptsItdIfCAFV7ug
zp5GAqnBdB90AgcXBMNh3WgM7ea7FAWxFcsE5ef9CBnuKqtoQQUAkA0g4Av01XrU
ibbYTBFcAWQps+p4gWMyyW5n2XoTrd2jgiaG63p3py1LL5C952j8bJHcR46sZ1Z1
PoQI2OVtWXp1WEYn0jYl5aHMBb1Pm3fSsu7AaUdLgLZcEAf2ys3r0ngcPgVpwjF+
na9kYe5s5SJYZfCMxjcB2/FwKHsxVPoPulpCC9cKGhKnMWYnps8=
=mTjt
-----END PGP SIGNATURE-----

--Sig_/hnrm2UtMP0gSYd7p5vJ2Svs--
