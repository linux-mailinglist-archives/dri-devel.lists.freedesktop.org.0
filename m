Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1CF710DF4
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 16:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00DD210E168;
	Thu, 25 May 2023 14:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F098810E168;
 Thu, 25 May 2023 14:05:58 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-64d3578c25bso2595213b3a.3; 
 Thu, 25 May 2023 07:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685023558; x=1687615558;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nPgjNadYh8O7MO97+r7j/d1jHMHXaP+jYO/Oxgqowkw=;
 b=ommVYYHtLu2Vj/VFDhve63ednPa4iUIK0BRPyAFZDujd9Xt3JeLe+O3NF8Q8zlzkb3
 aAXyFBFxNP7JQq+72gNtmddn2k/TBovdx3V+3Yz9YMyNttqh+BBSrX9Zfb+xSFw/gPcr
 BySOJjvCUI6vMlc6mRMYWDZ+Bz5xuY2eUtxI3YpE7E65jL0TVHE+nwtzVcrukf3bLDrr
 aYfWvmJT/hI+RvF9yWEnRe3yTezD0hZVbSYP6jgO+d8W8pYSJmwv8Pa6LscCpMrOyENV
 GSXMHLuYp0SDMYbwBePjskTW1ktJ+ZlqbpP6qGOjnYHcjksb8MXfpQE2C4NJhDVIE7dj
 sYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685023558; x=1687615558;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nPgjNadYh8O7MO97+r7j/d1jHMHXaP+jYO/Oxgqowkw=;
 b=Nly4vt03zi9SP+Omwr+pSRtBtOvJUxskostDMkOP6fa84MKZVBBuXP4WJdSwtijZXo
 TqQn+rRpfPP5Oy6QuTvWDuN+M7iO1SMMQul62EQo5pk8bSmkyFxzSDkJnzbARkOfkmt4
 Lm2HEA61LfUKOPPNWZaFt1CFszvYxjFYwbEFuT3Q0wWFN7wr0UOZWPdg1M+zveIiJDmF
 DcQY0SVEY/w6qo+UqWcCH36GfQ6ql1RiEbJgUVBYxd4KqjNvc+VK9IKm7/R17PrzA6w+
 wgMH9HXowzMXhJRWYdz7Kcxwq3VkgjwoELcR3+eEyz50XtjrIYT09ETbNCxdijyQ5eZz
 u6jg==
X-Gm-Message-State: AC+VfDwp2darOrXsysHKv/uCzH3NTmoRPiEZOMy+eOKHu0tNxeGwvRAo
 ejbsGZbdPMkTREo3zu3yqR8=
X-Google-Smtp-Source: ACHHUZ47Dl0L7k8F6DW64BTj9LkTtrQ2DbW8Gx4wNp/sPCbMg+J5frhhwcYCQPMqLQmTxkr+7BdQlQ==
X-Received: by 2002:a05:6a00:1a0f:b0:64d:42f6:4c7b with SMTP id
 g15-20020a056a001a0f00b0064d42f64c7bmr8027787pfv.27.1685023557843; 
 Thu, 25 May 2023 07:05:57 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-28.three.co.id. [180.214.233.28])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a62e705000000b0063b7f3250e9sm1242426pfh.7.2023.05.25.07.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 07:05:57 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id BF66B1068F8; Thu, 25 May 2023 21:05:54 +0700 (WIB)
Date: Thu, 25 May 2023 21:05:54 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Framebuffer <linux-fbdev@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Nouveau/NVIDIA <nouveau@lists.freedesktop.org>,
 Linux Stable <stable@vger.kernel.org>
Subject: Re: [Nouveau] Fwd: absent both plymouth, and video= on linu lines,
 vtty[1-6] framebuffers produce vast raster right and bottom borders on the
 larger resolution of two displays
Message-ID: <ZG9rQmIs1W8IcEcY@debian.me>
References: <e8f93560-a2f6-8e9f-031a-88d333482a31@gmail.com>
 <585f36f8-431a-e929-0a04-ffb65f02e9df@gmail.com>
 <d4879ff1-b9ac-0373-ceb2-beaa645fba23@leemhuis.info>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="grvaiosJJE1u57Uo"
Content-Disposition: inline
In-Reply-To: <d4879ff1-b9ac-0373-ceb2-beaa645fba23@leemhuis.info>
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
Cc: Helge Deller <deller@gmx.de>, Felix Miata <mrmazda@earthlink.net>,
 Ben Skeggs <bskeggs@redhat.com>, Antonino Daplas <adaplas@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--grvaiosJJE1u57Uo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 25, 2023 at 01:24:42PM +0200, Thorsten Leemhuis wrote:
> Bagas, thx again for your efforts, much appreciated. But I guess for drm
> drivers that have a line like
>=20
> B: https://gitlab.freedesktop.org/drm/[...]
>=20
> in MAINTAINERS (which includes all the popular drm drivers) this just
> creates a lot of confusion for everyone, as one issue will likely end up
> being discussed in two or three places in parallel (bugzilla,
> freedesktop, email). Better tell reporters to move their issue to the
> freedesktop drm tracker and close the ticket in bugzilla. And don't get
> regzbot involved, as it for now it sadly is unable to monitor the
> freedesktop drm tracker (sooner or later I'll fix that, but for now it's
> a blind spot :-/).
>=20
> Pretty sure none of the DRM developers will disagree, but if I'm wrong,
> please holler.

OK, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--grvaiosJJE1u57Uo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZG9rQgAKCRD2uYlJVVFO
o2q1AP0at4ur6rVluyiWwI+vlx6EPDtqu5dzAi4NoyxwtVFJuwEArRNKmZCx78ih
F/NmfUXKN6TG2PwPATDa1cn4Qwp+9g8=
=9SOh
-----END PGP SIGNATURE-----

--grvaiosJJE1u57Uo--
