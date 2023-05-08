Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 441886FA291
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 10:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F242510E18A;
	Mon,  8 May 2023 08:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D6F10E18A;
 Mon,  8 May 2023 08:49:15 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4eed764a10cso4675925e87.0; 
 Mon, 08 May 2023 01:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683535753; x=1686127753;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=VZvNp/jQ3z7yj56fzGO7+OsXI6/OssjK/PmJYmjw2qQ=;
 b=H750of2L8ug1iFkX9Ubvl5TVqfJklFA+OkO0HgZWjP1BsejNfSIuwBkYk9vb3vdfM2
 MZj2fxzxWQoLHO9G/iO1Yqr7TtPZFh1xu4Qfq9U8S32o7VEnx2MlEPMbot8U/ZnYB+xQ
 GkEodF56D7ZZrfMoR+HfHnuQAmw8YfzMtmLP8mzcEdN/HJk4VFE3BVYqFJw+eNiWFcVo
 2iXPXdJ0RHq/Cw5MqEkMlyNS6rnIgpOn2IBk0yAZ00CnZSGMHjWLEMiQ4YV2YJg6fr9s
 /8Xwqm/4ZmzQkJqvWaR5qgA7oJ6hGjrNSod/EFCDXqw2BH/m82wMQ+n+NjLVpLsZN/mX
 u75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683535753; x=1686127753;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VZvNp/jQ3z7yj56fzGO7+OsXI6/OssjK/PmJYmjw2qQ=;
 b=Od91IHVckdYAEdqWVCvNe9+p/ZLvaB9AYr86okvLYvIyFgrs1FOnacwXB0tz8i0O9y
 O+fmGvdmNZI3ZOnJCqXzX/Gc/KE9z0tWIHatbJcvpOiEIaKpccLvosd0Xh4s98fFQEL7
 qvYWg7QNF6Ime6T0t53TEVaLPyaA7IAv8A+BrMak5qKSrtQRlbPXQEEgFDn/xkE5qkth
 yvieYAEQa0fKbmXDZswMr68hq4MYhvRs0f9YVNwsX41krTkmTdmXcCZcAN7qJmNwTkdO
 8d5ilD5FWfV5HnBMRPm7vbUt5PEwKO6E2U7+mrUjgT0qiH2i1R9VdGgzIOGzjYkJ7pNT
 VM9w==
X-Gm-Message-State: AC+VfDyX4ASBc/wvCFTwekdgZQmtByDkrTYwSqGeb7cjmYKsfmJbcSL4
 EFU4/L/9zc5cj+2upj8pj6o=
X-Google-Smtp-Source: ACHHUZ4TfMbGSW1QX/AV0mXm8BuqbxdCEtQyZLB/8gFerm2Ac1dAwb7PIRz774XrraoLTlDmgYyteA==
X-Received: by 2002:ac2:5199:0:b0:4e9:9e31:5f70 with SMTP id
 u25-20020ac25199000000b004e99e315f70mr2486311lfi.56.1683535752413; 
 Mon, 08 May 2023 01:49:12 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 n11-20020ac2490b000000b004f1406b059asm1219487lfi.219.2023.05.08.01.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 May 2023 01:49:12 -0700 (PDT)
Date: Mon, 8 May 2023 11:49:08 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Steven Kucharzyk <stvr_8888@comcast.net>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
Message-ID: <20230508114908.5db11da9@eldfell>
In-Reply-To: <20230505160435.6e3ffa4a@n2pa>
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <CAPM=9tz54Jc1HSjdh5A7iG4X8Gvgg46qu7Ezvgnmj4N6gbY+Kw@mail.gmail.com>
 <20230505160435.6e3ffa4a@n2pa>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OOgn.BCkolVOoEi148SGY.8";
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
Cc: Aleix Pol <aleixpol@kde.org>, "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 wayland-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <mdaenzer@redhat.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/OOgn.BCkolVOoEi148SGY.8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 5 May 2023 16:04:35 -0500
Steven Kucharzyk <stvr_8888@comcast.net> wrote:

> Hi,
>=20
> I'm new to this list and probably can't contribute but interested, I
> passed your original posting to a friend and have enclosed his thoughts
> ... old hash or food for thought ??? I ask your forgiveness if you find
> this inappropriate. (am of the elk * act first, ask for forgiveness
> afterward)  ;-)

Thanks, but please use reply-to-all, it's a bit painful to add back all
the other mailing lists and people.

>=20
> Steven
>=20
> --------------------- start=20
>=20
> Steven Kucharzyk wrote:
>=20
> > Thought you might find this of interest.   =20
>=20
> Hi,
> 	thanks for sending it to me.
>=20
> Unfortunately I don't know enough about the context to say anything
> specific about it.
>=20
> The best I can do is state the big picture aims I would
> look for, as someone with a background in display systems
> electronic design, rendering software development
> and Color Science. (I apologize in advance if any of this
> is preaching to the choir!)
>=20
> 1) I would make sure that someone with a strong Color Science
> background was consulted in the development of the API.

Where can we find someone like that, who would also not start by saying
we cannot get anything right, or that we cannot change the old software
architecture, and would actually try to understand *our* goals and
limitations as well? Who could commit to long discussions over several
years in a *friendly* manner?

It would take extreme amounts of patience from that person.

> 2) I would be measuring the API against its ability to
> support a "profiling" color management workflow. This workflow
> allows using the full capability of a display, while also allowing
> simultaneous display of multiple sources encoded in any colorspace.
> So the basic architecture is to have a final frame buffer (real
> or virtual) in the native displays colorspace, and use any
> graphics hardware color transform and rendering capability to
> assist with the transformation of data in different source
> colorspaces into the displays native colorspace.
>=20
> 3) The third thing I would be looking for, is enough
> standardization that user mode software can be written
> that will get key benefits of what's available in the hardware,
> without needing to be customized to lots of different hardware
> specifics. For instance, I'd make sure that there was a standard display
> frame buffer to display mode that applied per channel curves
> that are specified in a standard way. (i.e. make sure that there
> is an easy to use replacement for XRRCrtcGamma.)
>=20
> Any API that is specific to a type or model of graphics card,
> will retard development of color management support to a very large
> degree - the financial and development costs of obtaining, configuring
> and testing against multiple graphic card makes and models puts this
> in the too hard basket for anyone other than a corporation.
>=20
> Perhaps little of the above is relevant, if this is a low level API
> that is to be used by other operating system sub-systems such
> as display graphics API's like X11 or Wayland, which will choose
> specific display rendering models and implement them with the hardware
> capabilities that are available.

That is exactly what it is. It is a way to save power and gain
performance when things happen to fit in place just right: what one
needs to do matches what the dedicated color processing hardware blocks
implement.

> From a color management point of view,
> it is the operating system & UI graphics API's that are the ones that
> are desirable to work with, since they are meant to insulate
> applications from hardware details.

Indeed. Anything the display controller hardware cannot do will be
implemented by other means, e.g. on the GPU, by a display server.


Thanks,
pq

--Sig_/OOgn.BCkolVOoEi148SGY.8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmRYt4QACgkQI1/ltBGq
qqfeWA//cWYIznJ5/yVRIRMIzqN5+N/LggGAFaHP+LG9UF6T63OtvKfEeGVvu8Xi
hBQ6eXrTkjydMkRb3P9vs11rMNPphfXtN7KPp3X/lOWsiG4KRvgeBfs8LlOnYfVc
YvK6voIxxn2ybubcbPyIdbWVaGiDY4TKC3VsQWpHuCFxHsys6oFzDMPhm5xIFpUx
Dh+dtniqdvGK9WsdO/FiQQFJRwWt06DC8gZzpMk8IB87uBTOUGJDLxxJMk1+M/Ie
s2AnBKJ1F2NqeuOEnzjnHQ2vlrlkQnLrYwuq/vtnFWo6r2faTaU+6Yol+iWKY1oC
Dmssnlfxw8nvZZ/QA3ywTk/iITjXWuTdrtLwifs4yTuK51EQu6wCWThJL7CH+w9S
kFxBLZwMrTsCo/Pej9W0zsOadkfFzPHJrbDY+GwNZl3IqEYd42UJ3yYm7hHFYAy0
h8C2X5LitJKETTk1mvcPjPhWNDX9KfF8GhDAkDsj3Y9d6Qvu7fOH9mS/D/VcYJHV
Ct50R+BlgF6nb1MxFJDb4/pKezQAw4KnOvE1lEKqNWymOK6eL2hsORzt0cwPEku0
kR3kiNREwLZ5/KP8MbvQyXaCB5bJOaqocyX3LitiUA88j5aSho/fEJNHOjm8nPGt
UYjKvTAeiSBqZbWn1J+mkJn7wde1kjIvfjOLc3Ky2IjJct/r0NE=
=0FJ7
-----END PGP SIGNATURE-----

--Sig_/OOgn.BCkolVOoEi148SGY.8--
