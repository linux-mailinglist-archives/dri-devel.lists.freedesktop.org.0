Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9025F18B9B6
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 15:48:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B604A6EA27;
	Thu, 19 Mar 2020 14:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E49F6EA1A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 14:48:14 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id j15so1857842lfk.6
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 07:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=eewuH2ejh9GUrR0Sfq2g0byFpCd5JQG7tGRUQT4kMOM=;
 b=E1VVcZwFog7GNxvPLoAdw9dNw+MNf7VRHNRNOUAn6/HdjCgdA2D8ywrTVQ9C7yRgly
 Ls1puYHmdjCytxp3Abi0hOf56AljY+A8Su6LNLi2TSS90fGeNZDz98uMDXWze07ACi9X
 6As76gXwRUecSOuTZd4XJ2lRGdb2Xtrb52qPlAp7SreE+C1kD4Sk47dKqTpthY3FD7D1
 jsMOt9Gh6vhqJUwoYKhqAP6bBW7cknaVHzCwrmMSG/BXjkQejM1v71XXfnq4zyx2wRHG
 LtcDE9JJnBvKq0I9RRgV+gJib+fOg5eagHs0A8xZ21e4IksZoHgl/sWhESwSOLRSC97l
 ZZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=eewuH2ejh9GUrR0Sfq2g0byFpCd5JQG7tGRUQT4kMOM=;
 b=ZyZIxSZc+btcmcVYlMmkG0l1kZj4BVmHoC5JJyZKMkDEKPoEFHyrY5fWDmyE1+5hkd
 rUBcS0aE1k9vsqoSuqEilyQ1P0NHN3QGc8gYkZK/YeAA3d5HjFzE1It5YTn57JxGzhsz
 ZwBbKEKiq2QM3NG3E0WTjpKi0L0257DM39exKmhg45J/2rNvVBYiUo5wJIWcaNhPGjpj
 Q3/8i/59ZM7t2+KMYAD+ERUYODYI1YACpjmcax+AzqvOzMatsmhwZGFg0cC0vKq5HdQk
 /hg8CFyOX36og+GeeRzYbf+HuxxZQu1Oc/pcZ4YdOhxfUmDM8/cjlVHBkPqDwxrOVnkv
 S2Mw==
X-Gm-Message-State: ANhLgQ2VL5fIiF9nEa1b+VlEklaSqSYZZu/37uCqCzvsdyYbfrxsdEaw
 5Bn+LIWR/Yv0T7WL/76rhdo=
X-Google-Smtp-Source: ADFU+vubl7Kf8YYQG+E2a3/wkiE08Wavl8yj6xoxn1rgimjHsSBojeG7aq5LZG1iFMii+nAZWvUdOg==
X-Received: by 2002:ac2:4433:: with SMTP id w19mr2379579lfl.53.1584629292633; 
 Thu, 19 Mar 2020 07:48:12 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id 8sm1703273lfy.21.2020.03.19.07.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 07:48:12 -0700 (PDT)
Date: Thu, 19 Mar 2020 16:48:02 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Michel =?UTF-8?B?RMOkbnplcg==?= <michel@daenzer.net>
Subject: Re: Atomic KMS API lacks the ability to set cursor hot-spot
 coordinates
Message-ID: <20200319164802.1ef342dd@eldfell.localdomain>
In-Reply-To: <c7a98456-d4fc-e4d2-640f-d70a35619445@daenzer.net>
References: <9d86bbe4-70cf-273d-4d61-aec06011d441@redhat.com>
 <ADrBkiVj05c2ZYEz46BNJrrChY-PCxme8HOeHHGOLjIR5XpBZoyIY5aUnSfXCm0wrYr0-Iuh80vnZqmRQ_jZaslv2Q2P7N6q5yCG0AeWovU=@emersion.fr>
 <5c9f7c0e-e225-dfbf-f5bf-cb1c1cc4ac08@redhat.com>
 <iUavRfIpwgaFwGrZtIM7seVfRwrvb2QVXC0KLN5wXLT7t_kX04NYFj2T5r0awLNPbIx2rO3UUO0BYH_HX1jMtJTQzBjInkghkF7WxkzxrII=@emersion.fr>
 <e0c0cb57-8a37-f70e-045f-3243411cbf03@daenzer.net>
 <8db6e079-c88a-6b11-b77b-337059a139ba@redhat.com>
 <20200319145440.51773af8@eldfell.localdomain>
 <c7a98456-d4fc-e4d2-640f-d70a35619445@daenzer.net>
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1767781850=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1767781850==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/x.n9EVbBHDGRI.dhJK3buJH"; protocol="application/pgp-signature"

--Sig_/x.n9EVbBHDGRI.dhJK3buJH
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 19 Mar 2020 14:51:41 +0100
Michel D=C3=A4nzer <michel@daenzer.net> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 2020-03-19 1:54 p.m., Pekka Paalanen wrote:
> > On Thu, 19 Mar 2020 12:52:14 +0100 Hans de Goede
> > <hdegoede@redhat.com> wrote: =20
> >> On 3/19/20 12:35 PM, Michel D=C3=A4nzer wrote: =20
> >>> On 2020-03-18 4:22 p.m., Simon Ser wrote: =20
> >>>>>
> >>>>> On 3/18/20 3:38 PM, Simon Ser wrote: =20
> >>>>>> =20
> >>>>>>> 1) Letting the VM-viewer window-system draw the cursor
> >>>>>>> as it normally would draw it. =20
> >>>>>>
> >>>>>> Why is this important? Can't the VM viewer hide the
> >>>>>> cursor and use a sub-surface to manually draw the cursor
> >>>>>> plane configured by the guest? =20
> >>>>>
> >>>>> Because then moving the cursor as seen by the user requires
> >>>>> a round trip through the VM and that adds latency, esp.
> >>>>> when the VM viewer is viewing a VM which is running
> >>>>> somewhere else over the network. =20
> >>>>
> >>>> The video output has latency anyway. =20
> >>>
> >>> Sounds like you've never tried the two different modes
> >>> yourself? :) IME it makes a big difference even with a local
> >>> VM. Even very little latency can make the cursor feel awkward,
> >>> like it's being held back by a rubber band or something. =20
> >>
> >> Right not to mention that the latency may be variable, so the
> >> cursor moves in a jittery fashion instead of having it move
> >> smoothly matching the smooth way a user normally moves the
> >> mouse.
> >>
> >> This totally wrecks hand-eye coordination and is just plain
> >> awefull. =20
> >
> > I have experienced it, and while it is painful, I prefer that pain
> > over the pain of accidentally clicking something that was not
> > transmitted to the remote display yet. =20
>=20
> Unless you mean clicking something while the cursor is moving, not
> sure how seamless vs not affects this, since the delay of something
> appearing on the remote display should be the same in both cases?

How do you know if the cursor is still moving or not, if you don't see
the real cursor but only the fake cursor?

I move the mouse, then it takes 0.1 - 10 seconds for the real cursor
to reach where I moved it. Only after that I see what the motion
caused. Then I can do the next thing.

The mouse motion / cursor response gives me continuous feedback, so
that I don't run too far ahead of the remote end.

> > Therefore I think the best user experience is to use both types of
> > cursor at the same time: the remote desktop or VM viewer paints
> > the local cursor as an aid, like a phantom, and the cursor from
> > inside the VM is also visible with the latency it naturally has.
> > That means I could actually see that the screen has caught up with
> > my motions before I click something. =20
>=20
> I'd expect that to result in "duplicate cursor" bug reports =E2=80=94 I'd
> certainly consider it a bug with my user hat on.

The point is to make the phantom cursor look like a phantom cursor, so
it cannot be mistaken as the real cursor. It doesn't even need to use
the same cursor image as the real cursor, it could be just a
translucent spot.


Thanks,
pq

--Sig_/x.n9EVbBHDGRI.dhJK3buJH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl5zhiIACgkQI1/ltBGq
qqewbA//ckqociQgZ1d65BET/5SmbNaJNAKaA4AeZrWYfcNt2zb8PhudoYHlDqZ9
qEfDNMAEuQMbRMOokO+v4maNBGrdOB7oJvXDIYKnXm6jX/ar3v0EpKNivm1vgrU8
9GOWThKyEmbRAgi7zb/0XUZA+xn2F2vjlsltzNl7cc66x/WOPVIMyoNWlEe8wM1q
Oj3oJnZjlBSNPWqE9kDgCi/kAfSS5L9pkFmXMNVcI6uBmR5yaq3kR7Bfpl/HSCh9
GgLpGkPXefUYBD1AtSeclBIesHyN418vkYXc/1ZGLC6JMnTWW4pEMIA5sCCvcf+/
Hw2GWl/jmmVjG+iu1Hs/bnXRcDdsNq1+p+H2HeJCBxhCtBQMlTHBui9CYOlySxCw
VrnI/swo2YvHsnMGqC2VJtsjjnQ9cmgw38NUoJ0Rbo9rkvHR0+ku3mwa+UFs04wh
Jotxeuiq0qACifuMVap01piRXH10ogd1i6WBFEXKPFfC61a9vpUBhp5gcgX/AV/p
o0Ewd4UR/pS+9BYLeCEh5l6KX+m/5VoQdYlNuKH+PeA6lBabtV7nS+jQlPioCW0l
cSyZXpLIZMyOxnV+CsXhaHNuh0COeNur5JzhV4sa62UIiV/RcZ2CC++nP/S4UdxO
FuLlnFHIQPE7CXXcgBoMekLBbd6zochDmo3Fm/nFDAATX8TvUY0=
=EIc6
-----END PGP SIGNATURE-----

--Sig_/x.n9EVbBHDGRI.dhJK3buJH--

--===============1767781850==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1767781850==--
