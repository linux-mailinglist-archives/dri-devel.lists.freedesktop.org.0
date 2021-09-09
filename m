Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F25A4046EA
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 10:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 784F06E48E;
	Thu,  9 Sep 2021 08:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4694E6E48E
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 08:20:07 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id m4so1702042ljq.8
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Sep 2021 01:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=YodMWorVkWM/WRTR0rAFwmHBf5P8kXVymB5ggHYzka8=;
 b=ci/w4QlBUnSKViMPeV6QABcTpaYwaoBFR+1Esp+1Sho90gEDWgmPWvg/C5CHWtFZTg
 oaPwGQ7r6oXEoCkw87TvOJv+XwQXDVVwQdeEO1DX6BWqKaQ8jqWdEWOsW+Gnsoe1krB8
 jPj0quCPKdqBSIcd8kPxigKC7rPhIRbb7RxfLA5x05G/xlQxss1/H6sJGJ8I3NXMfWsV
 m0dpeH7KGgFzkK33T/tx2GTeVpnRzK9qH69VpPFbI9iRcSfi+/XoTNbbXx3O0VP6+o17
 OK4UTAK1s9hQ5Eatd4jivM2EtBlKeDwSpYxUESjYh+Ztz6L9EIywL53Yclw4masxzagA
 Vo0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=YodMWorVkWM/WRTR0rAFwmHBf5P8kXVymB5ggHYzka8=;
 b=GQoM8kPBGXYWz3pao9ChEq/ZKWElhHRD63wcxgESn+pB2H+ShxcKic6eAUORH9To64
 7ehPNgKpUVFa2XQUpW/qj71JAfYO7jMMCbu3QRMcHg1AB8HrdJxCkU+tyEduOhIlFng8
 +1UlpJuHB3u8D78P8oX059j503Y739WCC8nySPRm4+G9LrdEBe8ZlnwfIzO1QmO41XmJ
 BHfIWQkifyMvP0TG9EZx9lwtMOfiPxPaTOqaBa0UGVRFtq6O4I9a5jjHMDARPw+5by2y
 owlIW32cUOCKOOCZV5MNVL/j589WF2bdEtVYYJIE0m8IiJTojxMr5JBOHtONbEbZklQZ
 wZWQ==
X-Gm-Message-State: AOAM530aG2ZUNvvShzRL4oDHgGbj+hM/4E6ul+ww/qaXbiWBlWMBYeb6
 8B5jmunIFcFe446cTfB3Ht0=
X-Google-Smtp-Source: ABdhPJyuixX5eW9cTz2jO/YHUUUy5ftF64y3XDTS3gEScAhsI+v8oyo8dK9IvxqFpEbYz8tNDIXw1Q==
X-Received: by 2002:a2e:b88a:: with SMTP id r10mr1284644ljp.362.1631175605340; 
 Thu, 09 Sep 2021 01:20:05 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id x124sm120784lff.107.2021.09.09.01.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 01:20:05 -0700 (PDT)
Date: Thu, 9 Sep 2021 11:20:01 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Dennis Filder <d.filder@web.de>
Cc: Sebastian Wick <sebastian@sebastianwick.net>,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>, Simon
 Ser <contact@emersion.fr>
Subject: Re: Handling DRM master transitions cooperatively
Message-ID: <20210909112001.7a83b2f4@eldfell>
In-Reply-To: <YTji+NWmLsluyV+1@reader>
References: <20210907155214.285b3561@eldfell>
 <0e9edc155c2621e607543316a0220312@sebastianwick.net>
 <YTji+NWmLsluyV+1@reader>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mkjRsodCcZBJ=/+U6K1qio+";
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

--Sig_/mkjRsodCcZBJ=/+U6K1qio+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Sep 2021 18:21:12 +0200
Dennis Filder <d.filder@web.de> wrote:

> The idea was that since you would have to have some IPC mechanism in
> user space anyway to quickly effect a flicker-free transition from
> Plymouth to the display manager (since, as de Goede reiterates in the
> other message, both processes must have the device already open and
> call drmSetMaster/drmDropMaster coordinatedly) you might just as well
> look for ways how it could be designed for the benefit of everyone.
> Using "implicit protocols" for things like this is usually the go-to
> way, not because it's good design, but because it is easy to
> implement.  But these "implicit protocols" have a tendency to greatly
> limit what can be done and to not be easily adaptable once the use
> cases become more complicated or refined, and thus they force
> contortions on everyone eventually.
>=20
> How such a protocol could look?  I don't know.  Maybe some DBus
> interface for a broker/multiplexer for shared devices that would keep
> track of the current DRM master and tell any process interested in
> obtaining it what process to talk to.

Hi,

such broker daemon exists already. It is called systemd-logind, and
maybe some of the logind replacements as well. Currently it handles
session switching, the D-Bus API replacing the legacy VT switching API
and drmSetMaster/drmDropMaster. It's also independent of the VT
subsystem, so it can be used on all physical seats.

The existing D-Bus API there is probably not flexible enough for the
best hand-over experience though, as Simon said.

Since session switching is what the logind API does, hand-over protocols
would fit there IMO.

>  It could then contact it either
> via DBus or over a separate socket, communicate its capabilities,
> negotiate the modalities for the transition and acquire the necessary
> resources in the form of file descriptors passed over DBus/the socket.
> Then both processes could set themselves up for the transition and
> effect it, which could involve e.g. unlocking a locked mutex/semaphore
> in shared memory.  Alternatively, the donor could refuse the handover,
> e.g. if a screen locker is configured to prohibit release of the
> device.  Complexitywise the sky would be the limit, of course, but it
> needn't be this complicated from the beginning.  An initial version of
> such a protocol could be held just as simple as the status quo.
>=20
> As for the point raised by Paalanen that implementing something like
> this would require a lot of effort I must state that, while certainly
> true, many of the things I mentioned here are already implemented
> somehow somewhere.  Plymouth has a control socket and protocol with
> which the state of the splash screen can be controlled from the
> outside to make the transition to gdm smoother.  The xlease project
> apparently was designed with the intent that DRM devices should be
> leased (and subleased) out to processes, and cross-process
> coordination would be governed this way.

DRM leasing was not designed for permanent hand-over. Instead, it was
designed for temporarily leasing some KMS resources to another process,
where the lessor can forcibly revoke them at any time.

That said, I'm not sure what happens to the lessee if the lessor quits.
I would expect the lease to get revoked, since how else would the next
display server instance gain control if the lessor e.g. crashed.

I'd keep the DRM leasing out of the permanent whole-device hand-off
design, it seems like a detour to me.

>  The kmscon project also had
> to come up with something to govern device access since it could no
> longer piggy-back on the VT-API.  systemd-logind also draws up a
> framework for governance over a shared device and how to tie them to
> sessions/seats (with such peculiarities that you cannot auto-spawn a
> getty on tty1 since that is "reserved" for Wayland).  Then there is
> the VT console, and probably lots of other little things I don't even
> know about.
>=20
> All this effort is already being expended, and IMO it proves the need
> for some way to gracefully coordinate access to shared devices that
> offers more than what can be done with current "implicit protocols".
> The community should consider acknowledging this need and trying to
> answer the question what such a subsystem should and should not look
> like.  Once the nature of the problem is understood better
> implementational questions will become easier.

Your initial email came out a bit ranty rather than a technical
question. I think it would help if you had a tangible goal, some
specific behaviour you want to implement, and write that down in detail.
Then it would be easier to discuss how to achieve that while not making
the solution excessively single-purpose or hacky. Imaginary use cases
are both fairly abstract so hard to discuss, and uncertain if they would
ever actually be done - putting the effort needed at risk of being
wasted, reducing interest.

I acknowledge a lot of needs all over, but there are only so many hours
in a day. My wish for a "KMS state reset" feature is in the same
position. First I am working towards userspace features (color
management and HDR) that I expect to highlight the need for the
feature, and then see if the wish gets more traction - unless one day I
would be able to work on it myself. It is also perfectly possible that
KMS state reset feature will never happen, since it is too easy to fix
KMS clients to just program more KMS properties.


Thanks,
pq

--Sig_/mkjRsodCcZBJ=/+U6K1qio+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmE5w7EACgkQI1/ltBGq
qqfbyhAApVCZB9IXCVQZkhr1Ngm35Pre7gn0HvbgyZNnyh57Pe7sHXBmErBRmU8e
G0ZJJab02YabVu1Qder7OfHYIiwhEcFYasIKO6UUEW9ILZxQJgklxXu1bJj0Ijvu
TFoOFvHgM6buxjic2NdEG60yh1bgkGiTYgPWlhHFNFCyGUm9NmY3Ky3HS4qXkKZg
6PqoIQau21FOjbzSNer/NH0Ni3K26uiuJ5JnFHI4+W/wzcPcS3ShO+RKYAVYcMU8
7z4W8rKZ8OncLOw5FAknAhxwa1rMC0ZBcqxAjtPrcisMuSF+hQyC3q9ShzzEd7w8
quIriRDq0QBXmx7odmuraKYjl8/EJhZiRuLodJFlBuM00jdu1sQtzzmox9T7pTLX
qjzSOloLdTO08ZO0gD6ZVSZf81jAbrLey+nwbc0syd6vwuWaa7yjipWldPKOReNw
gOClegAEZtOkfiURet0Su3fp2vs+METSZ47w/2Fhhnbyx0yMTtz83N4r4loDN8K0
l34g4GbPxfJwmXo5AZMGRfhLlKm8vt7WYpYRq4LqXRNtgG2o7JB19HekMb10/ipv
l/SZ5eXY3cr9dlV73SWsUwZpigrpqUz854GIzZK+mlLUF1GbyY/aaM9KXykkYltv
0VkseXPEPhwvxOdFjOB5C+4vDRvE6qdqRqZe8ZVy+sjDe4lq7tI=
=oVAf
-----END PGP SIGNATURE-----

--Sig_/mkjRsodCcZBJ=/+U6K1qio+--
