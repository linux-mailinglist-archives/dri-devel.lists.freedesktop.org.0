Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1A418B0A8
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 10:58:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652CC6E9CC;
	Thu, 19 Mar 2020 09:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EAE36E9CC
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 09:57:59 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id j11so1087824lfg.4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 02:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=5yDKx2vcs7FdVZe9tj/1l124JSh+a+wa//bAaQGAtLY=;
 b=bkupmHk0yx3QFt72HY20151Xq2Gy3Q9CzWOK1ahdgmlOPfYRsqzTWH7cLMKknK8ciz
 gtHWf6Mly8k9N6aCCgWpkFWsrqceMokuhaMV6EixKG4lAEldo0R5f3w0HRd2IEDN5w71
 6QilTYuggnzn1W9NMaM4wRKg+Eb/XgZul9ozPmeArtzpM9Zp8R+QIFaORj+Ug2+WMi9y
 vf4bUHoFAN4qGcw5V2VZ8OsZtRldntFFLHm3lJ1ay+wQiSE0Y9Tp26qoblJqeqIUa6P7
 kGyTBthWsDvaDRbrp/uNCcQ4e5iNPjlpNUQLwvW1gxTBhOG5Xp5wADZLlwZMiP/mUx12
 lrXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=5yDKx2vcs7FdVZe9tj/1l124JSh+a+wa//bAaQGAtLY=;
 b=rzZdh5ZfcYSOXNARsmQ+hEHxM+IFanLSxiZXg4nTtgzusDzPJbjN0+K1yVomWkE2VF
 Z6j4ODp6ZLnfKfK+ZEipj/rEV8HtBKdTNpQ18gMvV5HYvSHcn9gaU7ie438Zy1qp3jhO
 RTDjO3BwX0m9Z/3LqkRXfsVtPW9bkS8HPPgAX/M+SHVpFpP0qEEMYJl4iznJ5omRWb9i
 dSc49OaqlpfKIjJnPmn93AoKW9gt/Sg2rVN5Tyou0izSA1ufOvCDSHMXZ8QPEPgWAof2
 8uUVssZd5uLjYAq/ZJ839jDqUTeZLHPzB74H1/wS0hcxJiCXkDfTZ3SUlyPokqJq5mU+
 vDnQ==
X-Gm-Message-State: ANhLgQ0dyAgIaOQeQKl96yoVmxVb0zjAVtNdFpkOdBD0zDw6NAY0oEWj
 VvbVoqIjHTbCipDVlj+OhGQ=
X-Google-Smtp-Source: ADFU+vtH5GqNggMWiUUUXnC6Ae9uRgAP5vViGkZmCjkGYUSQwOLp0SYSpP9tMmaE6BFZxwXX98hbvg==
X-Received: by 2002:ac2:596d:: with SMTP id h13mr1403542lfp.146.1584611877966; 
 Thu, 19 Mar 2020 02:57:57 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id b3sm1110814ljj.46.2020.03.19.02.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 02:57:57 -0700 (PDT)
Date: Thu, 19 Mar 2020 11:57:48 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: Atomic KMS API lacks the ability to set cursor hot-spot
 coordinates
Message-ID: <20200319115748.276d8f32@eldfell.localdomain>
In-Reply-To: <ADrBkiVj05c2ZYEz46BNJrrChY-PCxme8HOeHHGOLjIR5XpBZoyIY5aUnSfXCm0wrYr0-Iuh80vnZqmRQ_jZaslv2Q2P7N6q5yCG0AeWovU=@emersion.fr>
References: <9d86bbe4-70cf-273d-4d61-aec06011d441@redhat.com>
 <ADrBkiVj05c2ZYEz46BNJrrChY-PCxme8HOeHHGOLjIR5XpBZoyIY5aUnSfXCm0wrYr0-Iuh80vnZqmRQ_jZaslv2Q2P7N6q5yCG0AeWovU=@emersion.fr>
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
Content-Type: multipart/mixed; boundary="===============1503088738=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1503088738==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/QyM/2EZCLRizIHLYb=AFDrA"; protocol="application/pgp-signature"

--Sig_/QyM/2EZCLRizIHLYb=AFDrA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 18 Mar 2020 14:38:48 +0000
Simon Ser <contact@emersion.fr> wrote:

> Hi,
>=20
> > 1) Letting the VM-viewer window-system draw the cursor as it normally
> > would draw it. =20
>=20
> Why is this important? Can't the VM viewer hide the cursor and use a
> sub-surface to manually draw the cursor plane configured by the guest?
>=20
> This would also allow the compositor running inside the VM to correctly
> have control over the cursor position, which is necessary for pointer
> constraints.

Aren't pointer motion events delivered in absolute and not relative
coordinates in the "seamless mode"?

Do we do pointer constraints also with absolute motion?


Thanks,
pq

--Sig_/QyM/2EZCLRizIHLYb=AFDrA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl5zQhwACgkQI1/ltBGq
qqeWPQ//c3kQwPJF8jveHd9vvk1hoMDOtbSfuknnO6jWDD0Ys1etojkRGHJCMeFD
GaYEQbSalefVBiw/eVHDD0oU80uEDjTjS+6+rZB+IiNeqfaI5xaHzCBU3hbtb0bT
EJUH/tkP19ErOAkv5+j0k6+2t2bLBoa2uNIb/Z+sI+b0me3A9nfNBfFs+Mitr178
5g6fVg3MEFDLrH5SstOa3Py7zuHTkD4QUZXmnL3A3cl631YNTbhPeAeoy0XWVlIE
dV6stzDY7VM3cGtpNQR5jK6W+AHwrelZD8n4EX9yIyOM6IcRtahCpO5STxURpoT8
2B18Inz2QbsFy3QyQYrl5uyGntZ2iaJ5Us2S9xkROf6zNpaLzjOxYY5vayHIiizg
uPm+9ZYvgKfmckHOSzA+UCXm6ojg5yQvfULrxcgEriZBwBO0lhQyPU2qAjWG6/4i
4K8Mtl8qouKrO1dq/JwJqxE2HzdrJx/MX9YVMmtQVaDNZN6COKbTvvQxALHmyqzE
3wGJhTaHQHh0TRjw4wPSOzDndvddG/7x92+NuJmvjUxmxSy7kGBL2jb5aE4FXyXz
IAbGKpJndBr4zMeqgpjxWXhlARGPcuhyoPGsVRjkqkvToXPakz3Ia7qYPEddGxov
mEl3Y7Yobo3Biy8TxG7nyX6wJVnSO0UrCRZ5LoXCgYBWJz8kTEg=
=B/MI
-----END PGP SIGNATURE-----

--Sig_/QyM/2EZCLRizIHLYb=AFDrA--

--===============1503088738==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1503088738==--
