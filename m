Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD8F18B3C7
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 13:54:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C7F56E159;
	Thu, 19 Mar 2020 12:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE146E1EC
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 12:54:52 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id s13so2363446ljm.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 05:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=x0KH1NuT+BFzhDW89LMQ8yFqa2uuRjfA99WLXPPfOJg=;
 b=aL0cdpEWXCEANAdzQ1Bl7kJWipMCRsKW8jkpgyrPIT3Rvywz35GJvvQ6PgmD4wDzUk
 Nyl13sTfmmfzTZ23wDRpFNuXCxmhj/hzOyOcqxnlQnhIHjFdcZSXU3XN20CLTRDAiYTh
 5K4aJk28PBvvp8KmdQkPr3tdNRvUNTIeFnmJMYqxYOvQ/RuPQIzflVJUFJeM5NBeYCu2
 bM54gL2jyVjeYuybX80ubQAPz1U7d/UoC6135LEKtk/zZNtyHrYnRwRyT68i743ejff3
 JJnuXRz5RbqGeIsPY2yjueNIXlLpc/wx6Bk8j11E/ZGwrky2sfXEYKLsXl676UcCEhom
 ngVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=x0KH1NuT+BFzhDW89LMQ8yFqa2uuRjfA99WLXPPfOJg=;
 b=gOlwvZpwx3ZuI9/VgJ6F3hyqzZbk+W2EXZbuxQMTMoDNY5jI2kkN3I7DtUB3A9UJjE
 YtT8lctmdCE1LkgAkmpxoC98t5uFLUfScJu7LGpp9LNEqpOz4QlWbnvy7xZQmVzTy2nX
 Otr2RDbRxoDD5uxBPCFd5EAfN/Pn9iY6AtseGGMShQ0rZjmlCJQatuQqrSI56EkZ/8si
 ZEu48hPxP7n6ERH8dd7QasSk3j0ooVkB5ZPr21MaFF07W85uW88i2JC1578Ak0NhTA7j
 U868LpFPDzl6oTbDG29L/qYMhEObU0bbZdSEK05+H7FLujYKsa4ec6pz/NN821J1jmeR
 fhug==
X-Gm-Message-State: ANhLgQ0c1NLzsw8vVMN1w28raqxiXAjM2bnX+BhyMxOet7vY6rBFNmLx
 rw0GGOKnRET1ja2JzFhYd4o=
X-Google-Smtp-Source: ADFU+vsfO4dL84uC6dSD6GGPBFP6gli187pSaoJB1xDe60hESwYWmc7J8WrJ5wK0Z1bCEdQbAxetEA==
X-Received: by 2002:a2e:9605:: with SMTP id v5mr2152646ljh.0.1584622490459;
 Thu, 19 Mar 2020 05:54:50 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id r21sm1632803ljp.29.2020.03.19.05.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 05:54:50 -0700 (PDT)
Date: Thu, 19 Mar 2020 14:54:40 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: Atomic KMS API lacks the ability to set cursor hot-spot
 coordinates
Message-ID: <20200319145440.51773af8@eldfell.localdomain>
In-Reply-To: <8db6e079-c88a-6b11-b77b-337059a139ba@redhat.com>
References: <9d86bbe4-70cf-273d-4d61-aec06011d441@redhat.com>
 <ADrBkiVj05c2ZYEz46BNJrrChY-PCxme8HOeHHGOLjIR5XpBZoyIY5aUnSfXCm0wrYr0-Iuh80vnZqmRQ_jZaslv2Q2P7N6q5yCG0AeWovU=@emersion.fr>
 <5c9f7c0e-e225-dfbf-f5bf-cb1c1cc4ac08@redhat.com>
 <iUavRfIpwgaFwGrZtIM7seVfRwrvb2QVXC0KLN5wXLT7t_kX04NYFj2T5r0awLNPbIx2rO3UUO0BYH_HX1jMtJTQzBjInkghkF7WxkzxrII=@emersion.fr>
 <e0c0cb57-8a37-f70e-045f-3243411cbf03@daenzer.net>
 <8db6e079-c88a-6b11-b77b-337059a139ba@redhat.com>
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
Cc: Michel =?UTF-8?B?RMOkbnplcg==?= <michel@daenzer.net>,
 Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1405117665=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1405117665==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6/ViPqJyeNm1M8tVVStLAst"; protocol="application/pgp-signature"

--Sig_/6/ViPqJyeNm1M8tVVStLAst
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 19 Mar 2020 12:52:14 +0100
Hans de Goede <hdegoede@redhat.com> wrote:

> Hi,
>=20
> On 3/19/20 12:35 PM, Michel D=C3=A4nzer wrote:
> > On 2020-03-18 4:22 p.m., Simon Ser wrote: =20
> >>>
> >>> On 3/18/20 3:38 PM, Simon Ser wrote: =20
> >>>> =20
> >>>>> 1) Letting the VM-viewer window-system draw the cursor as it normal=
ly
> >>>>> would draw it. =20
> >>>>
> >>>> Why is this important? Can't the VM viewer hide the cursor and use a
> >>>> sub-surface to manually draw the cursor plane configured by the gues=
t? =20
> >>>
> >>> Because then moving the cursor as seen by the user requires a round t=
rip
> >>> through the VM and that adds latency, esp. when the VM viewer is view=
ing
> >>> a VM which is running somewhere else over the network. =20
> >>
> >> The video output has latency anyway. =20
> >=20
> > Sounds like you've never tried the two different modes yourself? :) IME
> > it makes a big difference even with a local VM. Even very little latency
> > can make the cursor feel awkward, like it's being held back by a rubber
> > band or something. =20
>=20
> Right not to mention that the latency may be variable, so the cursor
> moves in a jittery fashion instead of having it move smoothly
> matching the smooth way a user normally moves the mouse.
>=20
> This totally wrecks hand-eye coordination and is just plain awefull.

I have experienced it, and while it is painful, I prefer that pain over
the pain of accidentally clicking something that was not transmitted to
the remote display yet.

Therefore I think the best user experience is to use both types of
cursor at the same time: the remote desktop or VM viewer paints the
local cursor as an aid, like a phantom, and the cursor from inside the
VM is also visible with the latency it naturally has. That means I
could actually see that the screen has caught up with my motions before
I click something.


Thanks,
pq

--Sig_/6/ViPqJyeNm1M8tVVStLAst
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl5za5AACgkQI1/ltBGq
qqfhXBAAlkZm2WsbcTn1+1mQJFGO6lVhbrcFalHFG1O59VGDfZXwjpKa98D5yZmB
LrXuRB/ISmnFrfdjpbgB04ux/fqJgU/iUA3awZiglmmv+ouPn5lzA4JO42a8AvAU
CiVzyrTjLHN0B+S3pG6krEqNdIGqgN3tR4LxGO4ps0ut4bzSWRMD99hgWAQWVNy2
oy7+9ZvrNYuLBkL6XSc/Yjtf8QpEvdNw4wwqqrTPW99f81qMKVpdlK+dAViVm7z5
wx8mJ+o1p0w2MJMlcPdEno/61kVLl+PVAwAc4XPE/tJkmIPFYPXs1z+U3x/JzIDA
BbcBzZB3bJ6c5ZMqiRbj457BHuG3prnJc6+Yivfh1Z6GqevYmydLJPfmQC3a/1i8
trF97bkAaqjkiRHt+z+86b7JF+Mz3CADjVYGEneu/sBTzFqbGeMl69psLacbkk//
fuovEKqQchrK1udIfqmA98cb3ptDj7upNTBXSB23jKh6VpJNDqe5unVveT4UITH2
rPG+59wLwp/GGWIM/Mc+x1ZGcZiPA+8r8s5ze6irFLsQyppfMrSzt0UE/KwiOOTV
c+MlgQzvJRzTw0kUK6+FOD0qJrCQVCRvxnxsWdB3eeYwaBhgytPKZ4Mr8nntxFzG
WgdSTpFD928QwpkOSiyOCfzUscrFMNP7sRh4bSbkLZzwl9pe0lg=
=JtC+
-----END PGP SIGNATURE-----

--Sig_/6/ViPqJyeNm1M8tVVStLAst--

--===============1405117665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1405117665==--
