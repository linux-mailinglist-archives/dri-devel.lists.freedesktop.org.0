Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17ED81AE044
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 16:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294A36E839;
	Fri, 17 Apr 2020 14:54:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C426E40F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 14:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587135271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pYmeS57tTDUASATfniFOfmJDVBAaeuSIlwe+qMC1FpE=;
 b=Vh+9FhFk3POTPqBHIwkqgE/2+JftWz6xmqqfGrMWutt03l8AEYE2Zz7oHN9RTo/9SRw5Pr
 KnYPOofh1hdxGkr/NqvGSkv04HbeXMhnp0oImpOe/WIPJBzEOVOeRKECJ0uEp5bLJbkeXs
 mAnKRXmnRfqe5ZQW2iX0fm6c3fEBwpg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-cmJOGLWyNeSZmpjHHqX1Pg-1; Fri, 17 Apr 2020 10:54:29 -0400
X-MC-Unique: cmJOGLWyNeSZmpjHHqX1Pg-1
Received: by mail-wr1-f69.google.com with SMTP id o10so1122300wrj.7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 07:54:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version;
 bh=Dd2wmr39LDxh+IlhqXuy12drhno4F3kJsYZKUqC9Pb8=;
 b=nvAE9+mWsi6DpgGqhZiGE7GwlCVkLrO9KCCPNqZ9bZ8FDRgcwkhOoeQL34sYatwpGB
 6YWBEO0/UvJ0C7FAmioyxzDfSETcM7oEKq9CJOJ5aeCRXBWMVFfsuUOjJXmrm8b1dVlH
 9k530F0yNX12I5llQI8wYC07TFSC8t+KjW2znzGTE8s9XucpLaRNcpLpOJLGrQHGZ0mQ
 gMR4eEy8krydJzeEHxyBVlFd1Uy/HYPBrIMrxWrL/dI+NBEa951XNXTpUCRCpDLvMbwO
 PD++vAAMFSLizXAJKki62OGx6EGCbIC4tpDnNAyZsLL0P8RcrIjRO1/KchkgKJWfH7/P
 RyKw==
X-Gm-Message-State: AGi0PubuQC6uGRwTAv102xT2q7iDYy4JIVdj2GO5MIaRAbty8o6H+AA7
 0XgjkiUSeK+79im+6v9JataaNuEdxe4qUJsoumBioJ2wIwiQwE7/p/+lLhZXMv1VFqmJBfa7ffl
 fA1EHJ1fr5fAwUFy12Z9/QYaAZYHl
X-Received: by 2002:a5d:6985:: with SMTP id g5mr743487wru.398.1587135268228;
 Fri, 17 Apr 2020 07:54:28 -0700 (PDT)
X-Google-Smtp-Source: APiQypLECpzk6MgSUvBfAD1Fu9IQU1zSMm1/iMf4zZPH0eqE5c2+MoUudzqiSueuXt+3sPjQlE8sPw==
X-Received: by 2002:a5d:6985:: with SMTP id g5mr743454wru.398.1587135267979;
 Fri, 17 Apr 2020 07:54:27 -0700 (PDT)
Received: from 200116b82688d1f00000000000000381.dip.versatel-1u1.de
 (200116b82688d1f00000000000000381.dip.versatel-1u1.de.
 [2001:16b8:2688:d1f0::381])
 by smtp.gmail.com with ESMTPSA id c1sm32297164wrc.4.2020.04.17.07.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 07:54:26 -0700 (PDT)
Message-ID: <6325ac81a6c6d987f4fdee0471e33b3e17a2aae4.camel@redhat.com>
Subject: Re: RFC: Drm-connector properties managed by another driver /
 privacy screen support
From: Benjamin Berg <bberg@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>
Date: Fri, 17 Apr 2020 16:54:24 +0200
In-Reply-To: <CAKMK7uHKXTqwvyr3ocU4N+kpAnUBBZTjULSofqjP+0PcvGcFNQ@mail.gmail.com>
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <87tv1k4vl6.fsf@intel.com>
 <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
 <20200417120226.0cd6bc21@eldfell.localdomain> <87k12e2uoa.fsf@intel.com>
 <CAKMK7uHKXTqwvyr3ocU4N+kpAnUBBZTjULSofqjP+0PcvGcFNQ@mail.gmail.com>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: David Airlie <airlied@linux.ie>, Christian Kellner <ckellner@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Hans de Goede <hdegoede@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Nitin Joshi1 <njoshi1@lenovo.com>,
 Rajat Jain <rajatja@google.com>, Mark Pearson <mpearson@lenovo.com>
Content-Type: multipart/mixed; boundary="===============1551295601=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1551295601==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-rlQvbwycrlyFoNu+rjIJ"

--=-rlQvbwycrlyFoNu+rjIJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-04-17 at 16:18 +0200, Daniel Vetter wrote:
> > I suppose rf-kill is a bit similar.

RfKill is actually much more complicated, and I don't really see how it
is related. We may be in the situation where we cannot control the
hardware state, but RfKill has two entirely separate "block" states and
the real value is the logical OR of both.

Also, RfKill key handling is a mess as userspace needs to tell the
kernel it is handling the keys.

> > You'd have a userspace controlled property to state what the userspace
> > wants, and a kernel controlled property to show the hardware
> > state. Userspace can ask for one or the other, and usually this happens=
,
> > but the hardware hotkey bypasses the whole thing.
> >
> > It's not perfect. But I think just one property changed nilly-willy by
> > both the kernel and userspace (especially when it's really not in the
> > kernel's full control either) is going to be a PITA.
>=20
> Yeah that's what we've done in other cases where both kernel and
> userspace can change stuff. These where just tri-states, but this here
> sounds like we need all for, so best to just have 2 properties.

As I see it, the requirements here are:
 * Userspace needs to be able to query the current state
   (possibly unavailable?)
 * Userspace needs to know whether it can set the property
 * Userspace needs to be notified about changes
   (by the firmware or possibly any other reason)

But, should never get into the situation that both the firmware and
software are trying to toggle the state in response to the same event.
In the case of the Fn-key, we'll either deliver a key-press to
userspace or just update the attribute because the firmware has already
handled it. Only one of these two possibilities may happen.

Benjamin

--=-rlQvbwycrlyFoNu+rjIJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEED2NO4vMS33W8E4AFq6ZWhpmFY3AFAl6ZwyAACgkQq6ZWhpmF
Y3CVMQ/+P/qq0rXyAEp1UECbiee+9uKhIX+wWFAlKOg2zj5FYy61W25SwL0npfK1
PzRbv9hrqsKjDXtTU0f2r4gNTrR8OZbcxZ+TTm3bvKF/CthYu+HrQ/QNSldIJwRn
ZgiJbMOjjMhrHSh5/cJ6vUsnJoYlVPheOIZ/NaGC4O3lYB2n8I5GlIz2pViGF3of
cTus+i2TRq2jFVIJvYZ5M+GUGI/sWtUJXmA2aOZclRwU2EOOqhtQJkn/mZHrhvMq
0+ArjIYQOYR7OOguZT0MzAO8cikT80CTWcGhm55PGGQJX0vb+8Jwt9cND2aclGfd
COcyhmqN2MulB8H9mhhEYmM4rdGqIi6gXIRQo2Ar47tZ/Qzxt9azGRW5gtuNAlSy
nJjEquAfwmvjdLARaEVG+HyMYg/93wkAndX0nsnF7oIsKznfSWEyDLSjK3ipfvek
Tee+AK1Ajt1h5V/Q3g3TS83Bdb+NJq3SdlEBP/7gmqI94DFf/DR1KlpMCDyxzXHO
HLnUYcw+FnPfCDmi5SQ4A/QCpfV8vKf2io/zBcKmkPMSZWN7GxmFxghLyMxG9X8b
zB44/URMixB3aYrLNPRqej2eEuysVLGROA31UILDUyDXIdQnr4eIxoQWQYy77zm8
8sPRAHSsDB9VEeKDIF0hBK0CUBqb9y0XKtDBpQB99pcjxFZ0dRI=
=0VNE
-----END PGP SIGNATURE-----

--=-rlQvbwycrlyFoNu+rjIJ--


--===============1551295601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1551295601==--

