Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB74E9BA3D9
	for <lists+dri-devel@lfdr.de>; Sun,  3 Nov 2024 05:05:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE9010E0C6;
	Sun,  3 Nov 2024 04:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mKzyDr2m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A73A10E0C6
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Nov 2024 04:05:20 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-2887326be3dso1418433fac.1
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Nov 2024 21:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730606719; x=1731211519; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Q3NbQqHGavlGKaUtOquClqL6oZ5jwUgWkkB2nQy7c60=;
 b=mKzyDr2m1BnRypAXiTUSYBs6LWsOLqsNjkp++AQmClF6nZs7Kpdky7CW7yCqAzfW0/
 hdLI6WIPFIT480iKRhZOFWwPwg0xv7gKappTwrFzmjK4zV87ESw9+a7/eTaIvg+qxirf
 yBHnePK1sjgB/C5nQztE9gvuRuj6M7WD207QFEnADRkh5LUqW3r1vr0FX623z0ZzcXUP
 kDivnF+1MMFgk/OGBDoxhrrsBeUS0MC7HV7U0ow6hXdhAhB60vR/vDM79eDsUOhAo6pY
 1LKoLqeqkBmPsvlIr4CREKp3tzvGNlbkRyJOg/bNwJxAh9diaevcvRbT4zELchwzkf3H
 ILNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730606719; x=1731211519;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q3NbQqHGavlGKaUtOquClqL6oZ5jwUgWkkB2nQy7c60=;
 b=gTgzeARLaRdAjnXSRWgJIHgoXVzjmcFosycHhILADA5cROXoeUvEAuTl+Vv+6s/CS/
 9pIFvTiQDOM979hsaepmh5UUzwCk0M9W+K9hvbue9bByRUPiSFJQyq+H2XxZU/Zy7OA+
 NCaiLe/DRZHgY9h/Nf4JeI/SMLk9MxmLb5FNSRu7kgrA38RT/VVOqQ+HlFSAKEvZ1CDb
 RgStbzgsIUBEC8uQBa/cjCE64YzGeoKlvuPdjMuDjMdZ+Ls7xit2KUd/OC9aFbFHr5Eo
 oh4GGXoaEligCpQENRTA9/XDw9NH2uMdXiMD66EPY2RwkmyFgvw/lHhyddp02nxZIA1K
 6hEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0VusOqNPE/54Tso2k5bXIer09It6jGUYWJU8VfQhW25YrOLdwNll9RnjS6AkugQzT/mvzqBATKy4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1JABAbU3KK/9AQkqIa8wZO+iigB9/A5CJSaOsSxqTAqmVSKpd
 D7ZEGngjdwWmG6GEJ0yQCYKxNjqxEvGpR4IaIZR9SrO58TDCpvHS
X-Google-Smtp-Source: AGHT+IH1IuMJjXidoZxnvbOq8EhauNN2fyc1gFkAHH1Y5mnVtlVIMI/Co/2ogwXyqrLdvm8tOuNG6w==
X-Received: by 2002:a05:6870:498f:b0:277:eea4:a436 with SMTP id
 586e51a60fabf-2948442b3e7mr9572727fac.7.1730606719281; 
 Sat, 02 Nov 2024 21:05:19 -0700 (PDT)
Received: from illithid ([2600:1700:957d:1d70::49])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-294874880c7sm2151154fac.22.2024.11.02.21.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2024 21:05:17 -0700 (PDT)
Date: Sat, 2 Nov 2024 23:05:14 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: Ian Rogers <irogers@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-man@vger.kernel.org, cjwatson@debian.org, groff@gnu.org
Subject: Re: [PATCH v2 1/3] proc_pid_fdinfo.5: Reduce indent for most of the
 page
Message-ID: <20241103040514.6wo54kf7smiqf4yg@illithid>
References: <20241015211719.1152862-1-irogers@google.com>
 <20241101132437.ahn7xdgvmqamatce@devuan>
 <CAP-5=fXo5XjxUXshm9eRX-hCcC5VWOv0C5LBZ3Z0_wQb+rdnsw@mail.gmail.com>
 <20241101200729.6wgyksuwdtsms3eu@devuan>
 <20241102100837.anfonowxfx4ekn3d@illithid>
 <20241102103937.ose4y72a7yl3dcmz@devuan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pscddhjqsar3tshn"
Content-Disposition: inline
In-Reply-To: <20241102103937.ose4y72a7yl3dcmz@devuan>
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


--pscddhjqsar3tshn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 1/3] proc_pid_fdinfo.5: Reduce indent for most of the
 page
MIME-Version: 1.0

Hi Alex,

At 2024-11-02T11:39:37+0100, Alejandro Colomar wrote:
> And diffs are a real win for text.  Thus, semantic newlines are a real
> win for text.  "Write poems, not prose."  (Any chance we may get that
> warning added to groff(1)?  :D)

Yes, but I've kicked it out to groff 1.25 because a gift-wrapped
opportunity came along.  We get to retire a warning category and its
number.

groff(7) [1.23.0]:

Warnings
...
       el             16   The el request was encountered with no prior
                           corresponding ie request.

groff 1.24.0 [in preparation] NEWS:

*  The "el" warning category has been withdrawn.  If enabled (which it
   was not by default), the formatter would emit a diagnostic if it
   inferred an imbalance between `ie` and `el` requests.  Unfortunately
   its technique wasn't reliable and sometimes spuriously issued these
   warnings, and making it perfectly reliable did not look tractable.
   We recommend using brace escape sequences `\{` and `\}` to ensure
   that your control flow structures remain maintainable.

This was a 35-year-old bug (or incomplete feature) in GNU troff that as
far as I know first came to attention 10 years ago when the
then-Heirloom Doctools maintainer pointed out an incompatibility between
AT&T troff (from which Heirloom Doctools descends) and GNU troff.

https://savannah.gnu.org/bugs/?45502

More recently, Paul Eggert scored big-time grognard points by actually
depending on the AT&T troff behavior in the zic(8) man page.

https://savannah.gnu.org/bugs/?65474

We therefore _had_ to fix it.

The consequence is that the warning category `el` and bit 4 in the
warning mask integer are undefined for groff 1.24.

This was irresistible serendipity, because this warning category was (1)
not enabled by default and (2) probably used only by people who wouldn't
object to style warnings anyway.

In groff 1.25, I want to revive bit 4 as new warning category `style`.

Ending sentences before the end of a text line is something we can warn
about as discussed a while back, and I plan to do so.

https://lists.gnu.org/archive/html/groff/2022-06/msg00052.html

I've been collecting specimens of other contemplated style warnings.

https://savannah.gnu.org/bugs/?62776

Regards,
Branden

--pscddhjqsar3tshn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmcm9nIACgkQ0Z6cfXEm
bc5ZnRAAqhIZQOmVX214qFJPNcP4uF/DYd1DJjyabBQb/MwJd/KVO1kM/n2bsaAG
F/alGpXKF+6oJ2mlz05zkC/I0qMQ7JxB6jDxtSRTivQyT2zf0pHFIZTrOj/7Po5S
SnmRJk354RKLXJF6JtjG6Wtymyg/hbnQEMzOCl8c6p46vwcg7b+cK8G5G5dsZRKY
bH1pjEPunVQEFeQKnVTmulirbSYduhWk07q2j6VMM8E3JaX2zSSQf4EyHutCTGoP
VztycC1344QDk2w00PdgDAEKLIclzTQpttqatlCy2rBcLhAvDrimeqmA7H4weQlo
xrJNz7mxYYGdEGJiFdBpRygvdmkAvbqVpPn8hbv0Y8cFSnisnHdMfWluaVEnSCm8
hYRDHcRx7ZwQeP/d+AL8B9uHQrLoA53iZLqt6RnzZZyRqae8L0ayTQnoRjGVACDR
XGFhl85oisMEd4eJeMihq2qV60UXz2tUWFpd9BApWdtj7ySKKe0Ul+0BOesXnJw9
5abyFC6NTt/FlhUJRi85GR97AavxYLwPGOjkDOiqf3pelY0JrF4QmS3dH2I2zIka
+DslpTR0aEyWNwUsNxIACSmvmE4UXKKoYX1fqGpAwUlPXssRsz283TGSlxUdSisK
f2aND1zHzp/1WFkK2FQ5fCPmC/7BX+wslaVFrMBan/9QTRDcvDc=
=GEH3
-----END PGP SIGNATURE-----

--pscddhjqsar3tshn--
