Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 107C78677A6
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 15:04:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1842110E2E0;
	Mon, 26 Feb 2024 14:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cYXHsrjh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471A510E2E0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 14:04:35 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a43037e40dcso219048566b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 06:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708956273; x=1709561073; darn=lists.freedesktop.org;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tAiN0detzWZ3hHmBt5uFja5IC1NM7+otJ/WL2NRqHYo=;
 b=cYXHsrjhJ1U8ixTns+rLPiqGURdU6GkGuB8l8k4lmsU5Lb/9MzbcUGpQ+Iq4lzLThr
 ncZSjqWeMrqVNvge4ZEI7eGb43ouE5eSefMkdTWpwNTEPKuqYjwJ2HuxuY4oLREcW8ji
 1fZOHzFU2wPj7Eco0py6wqIEayLwZWAfmo4kRl/Q3kTdGauHDrDN1UVXnq7qTk+Wmk03
 LYTlaTCHpOtr6IRAYvfXP0qQESLs2/0+Ofmf0mL7LRSm4VlYpU2dKQTLloCuROIXdRDk
 Exp8pf011RPwOwYGSTYv19DftxH3bR+0RjN5t7HYKaXGyLJw9dfg0rQ4j9yiZ9Yt6ce3
 2dug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708956273; x=1709561073;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tAiN0detzWZ3hHmBt5uFja5IC1NM7+otJ/WL2NRqHYo=;
 b=HiqR1BcGnVy39+oACFx9jww4mqWZoloiGGyOvtZxnQqAoqlwOfPDVQ4X7DDiSswNRd
 QfqhAv6lulMD30zM/I4LvXSB5ofob+WxiOmwgr1pB5vJ44kBQuZVUEODBB2DIkC7HQaE
 8/McWfXYh0iTMsUl4G7Il2MsFYi+ntHBYmgc1Ys/K1Q4KclNBNWnJmlToj5T/Dyk3i0n
 aBCbSXfIpZlNZ+wCazBxyWt1vj88VVVTWZY6+AAm/fNxRFGf63xW3qHBK45TjIZvQDTc
 xlB1W+c5mDDX8kFyybEgrowJBmxaY8Dt5VJp/YgPadzamkoTALm3ZYbrwNxCSkB+znBi
 EFoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqeIVO9TZDwIIo8aNPaaUVPxFKju2cXhloMbMoe0SWxNVy1/Q4eN04QGKzner91qa5jzOxsn9SP+u6+T8VXOuRhDmNSTa4CKOO8qP8jxDI
X-Gm-Message-State: AOJu0YxfAuO/iBzyFjxcz/U22HaVWfXUegP52O+/xw631ZFQ0nuX5Ktm
 v4EhJlSTgTwwtYNnJWLuaVCHM1LC9dPHClS/zhungSUYcmSU5Kh5
X-Google-Smtp-Source: AGHT+IEI/VOZwZG+uUCEpb3XjAbwgzrT73wyba5zBMiTXClBxtfyLvOkEpHrmbHUOL6NxHjkY0ooLA==
X-Received: by 2002:a17:906:3609:b0:a3e:f00c:ee25 with SMTP id
 q9-20020a170906360900b00a3ef00cee25mr4143311ejb.25.1708956272948; 
 Mon, 26 Feb 2024 06:04:32 -0800 (PST)
Received: from localhost
 (p200300e41f222300f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f22:2300:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 vx10-20020a170907a78a00b00a42eb84c7c2sm2433810ejc.142.2024.02.26.06.04.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 06:04:32 -0800 (PST)
Content-Type: multipart/signed;
 boundary=21fd96626809da916ba0f390cabfbc1b4443582b04b01fefba0f3fde58c9;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Mime-Version: 1.0
Date: Mon, 26 Feb 2024 15:04:31 +0100
Message-Id: <CZF2FT4A3ZT8.1DMY9VF0YQVKU@gmail.com>
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Robert Foss" <rfoss@kernel.org>, "Javier Martinez Canillas"
 <javierm@redhat.com>
Cc: "Thomas Zimmermann" <tzimmermann@suse.de>, "Jon Hunter"
 <jonathanh@nvidia.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v2] drm/tegra: Remove existing framebuffer only if we
 support display
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240223150333.1401582-1-thierry.reding@gmail.com>
 <a6e73f3f-9bd6-40c4-abfa-84a22de07c23@suse.de>
 <877cirpidw.fsf@minerva.mail-host-address-is-not-set>
 <CAN6tsi4b+77udoHNhKjo8PFo9hdgrPYPz62D3f+rBqqw4Oymzg@mail.gmail.com>
In-Reply-To: <CAN6tsi4b+77udoHNhKjo8PFo9hdgrPYPz62D3f+rBqqw4Oymzg@mail.gmail.com>
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

--21fd96626809da916ba0f390cabfbc1b4443582b04b01fefba0f3fde58c9
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Feb 26, 2024 at 1:08 PM CET, Robert Foss wrote:
> On Mon, Feb 26, 2024 at 12:36=E2=80=AFPM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
> >
> > Thomas Zimmermann <tzimmermann@suse.de> writes:
> >
> > > Hi
> > >
> > > Am 23.02.24 um 16:03 schrieb Thierry Reding:
> > >> From: Thierry Reding <treding@nvidia.com>
> > >>
> > >> Tegra DRM doesn't support display on Tegra234 and later, so make sur=
e
> > >> not to remove any existing framebuffers in that case.
> > >>
> > >> v2: - add comments explaining how this situation can come about
> > >>      - clear DRIVER_MODESET and DRIVER_ATOMIC feature bits
> > >>
>
> Fixes: 6848c291a54f ("drm/aperture: Convert drivers to aperture interface=
s")
>
> Maybe this is more of a philosophical question, but either the
> introduction of this hardware generation is where this regression was
> introduced or this possibly this commit.
>
> Either way, I'd like to get this into the drm-misc-fixes branch.

That commit looks about right. Technically Tegra234 support was
introduced in Linux 5.10 but the first platform where you we would've
seen this wasn't added until 5.17. The above commit is from 5.14, which
puts it about right in between there, so I think that's fine.

Backporting to anything before 5.14 would need to be manual and isn't
worth it.

Thierry

--21fd96626809da916ba0f390cabfbc1b4443582b04b01fefba0f3fde58c9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmXcmnAACgkQ3SOs138+
s6G7GxAAoGo5C81PAEchitwz+i2g1btUbe/YFjwV0DcgY7hFm9S7f91RcPzKP3wE
G0BcpmT4hYwEOxJzoz6awk4O6P5riWUXGzwuiSSY0FYbKU3WGJfVsQJ5gRsI2Y9U
n2+xwCn8XBQwfoWk9yGWA0ngOGxEDlehhWZpfJ/cUGu+6c7FHrNF0MSNJy2BKseZ
05/pzfZLkR4zOw/5yQg+RPGOwUqyuOeyeD2KHHCE99Pzm8XdnMs7rkfjY6/W6FGr
EY9vkkG/9yK1Vh+3/3Fn7DEnVi5ToOzby/ckRL3SYs+LHRyIjks3NjqX3eP7fOsp
eYxv6RmZ8xlQ+EBoZP49i/ICyVinkjsFu9YLjwYFZSC7x9oCkQNaGmI0uPxr96ab
kAS5fSDJZKNtBSLZiFyxRiBKFBMCu+AnERYK9dfqfEott+txmKyWQ2smAXQBtYNp
q9CY310+/RJH9bNQf8Xr08c41x1rCm8usKrN8BAJ9kMryCUmYz4RDYa8vFPeXs8w
87mc3LhJ2FYkTs5WhkG1thYUQ8gWm3yKmVj+2ahr2QVCYIZFPT0WxtrCfR6eeNrE
/tMIy0jzVCGzrcjumWGJlshpOzHn6wVPOFkzvhu8WxIk324U9Y8iVfwzBu5Zuq02
j9aMrfk9JZQq8ONiHVWjCPBWFhuASQitLnr60JIubLCTQ4DNhTc=
=QwiT
-----END PGP SIGNATURE-----

--21fd96626809da916ba0f390cabfbc1b4443582b04b01fefba0f3fde58c9--
