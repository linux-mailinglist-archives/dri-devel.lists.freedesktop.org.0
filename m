Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E628C4C8BED
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 13:45:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C1510E94D;
	Tue,  1 Mar 2022 12:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC05F10E8A2
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 12:45:04 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id i20so7456281wmc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 04:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vVkDLDktF1NJ9W5pxZGteLQiXPtYz4QvqpHL8HfSgw0=;
 b=Ly23InJsarN0c8lW9n6BqRnQoZXO6uhUx+iFgQRtqL0fbo/KO78/tC0dA81HXKuyZU
 ZfhASA/BQj/jacTHdgQMOVkSVezfqiFZbHXlAcT6hSYxHxtpFakk3YSQD/BTUdrZMj/D
 nHCDcGrffrfX46NuDsoqZpkutTJTns3b2zWy1IFxABNml5FJbz/dyFi1oWirxU5YMI9F
 YZI+SRa8o10rqeVlgowu2BcLyXgQtUI9fiq1Sq93sIRduco06Ayh0gidnV6XatWkR0pR
 FqCRCl3TXT6SjuvzD0oI2wNI+/CM1IJqKnpuPe7NWWL6rKFgn05ci8DrzoWT6tz6/tj/
 pvbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vVkDLDktF1NJ9W5pxZGteLQiXPtYz4QvqpHL8HfSgw0=;
 b=V3Bg/7/GcMyaU+BfoFEokxu2DlG8iWYKuyz3BKzc7rVKtcT56xhxd490pemQ6URXIk
 wk85wsgM6D04Ih2hm4w79y3R3E8Q5gj33IZYOcUvMpa5m2Getu7wRi0buX5ilqqZNAoP
 djjXxhEkISHjSRP6gY9Nn5+ynrHsY+I5MSKAt4HXYc2kk1rwgJ+R/yxeoN4favzIL500
 dYOPu+u3DO9pl8NygjwdTf6prBLo9WAEABvgr820eTbyBSxNMjxhdaG9odxlUcts++Nh
 uAhZqjwb52wkksVa0ePWcPWx9t8Mgwq4a5M5Gmif3O4KZJ0qTdDrtLJQr3xbsY7h+ayl
 sL1A==
X-Gm-Message-State: AOAM5322gNLPMWGd5PK0SQzjK+ncuuSDkGoKo/u5pmIPFnO9bA/KNkUq
 eLsJf3kl5oXpt9+lkCpInL4ykJqvKYQ=
X-Google-Smtp-Source: ABdhPJywC8YXo+zt45LkAYRRmneKn10kApwWhiB5/AayLAA+CYj8PUsfWsvxUj2wLmjavkXBdTP8pA==
X-Received: by 2002:a05:600c:3503:b0:345:858e:cbe8 with SMTP id
 h3-20020a05600c350300b00345858ecbe8mr17148371wmq.73.1646138703180; 
 Tue, 01 Mar 2022 04:45:03 -0800 (PST)
Received: from orome ([62.96.65.119]) by smtp.gmail.com with ESMTPSA id
 m10-20020adfe94a000000b001ef57f562ccsm13767800wrn.51.2022.03.01.04.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 04:45:01 -0800 (PST)
Date: Tue, 1 Mar 2022 13:45:00 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [GIT PULL] drm/tegra: Changes for v5.18-rc1
Message-ID: <Yh4VTKcJPm8IC38r@orome>
References: <20220225163250.1063101-1-thierry.reding@gmail.com>
 <CAPM=9tzr0LSnkHHwP0rUOz+AFwQwtTs38vu+6B-d8VAN=x+BPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wWYfb0W2agy2UDs5"
Content-Disposition: inline
In-Reply-To: <CAPM=9tzr0LSnkHHwP0rUOz+AFwQwtTs38vu+6B-d8VAN=x+BPg@mail.gmail.com>
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)
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
Cc: linux-tegra@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wWYfb0W2agy2UDs5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2022 at 04:51:22PM +1000, Dave Airlie wrote:
> Hi Thierry,
>=20
> dim: d65e338027e7 ("gpu: host1x: Fix an error handling path in
> 'host1x_probe()'"): SHA1 in fixes line not found:
> dim:     e3166698a8a0 ("drm/tegra: Implement buffer object cache")
>=20
> not the same as
>=20
>  1f39b1dfa53c84b56d7ad37fed44afda7004959d
> Author: Thierry Reding <treding@nvidia.com>
> Date:   Fri Feb 7 16:50:52 2020 +0100
>=20
>     drm/tegra: Implement buffer object cache
>=20
> Please fix that up.

Good catch. I sent up an updated version of the PR.

Thanks,
Thierry

--wWYfb0W2agy2UDs5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmIeFUwACgkQ3SOs138+
s6HAiw/+LMPw4Gg1CT1MPuljUaQb9yxW4TPoJIusARcNaIwGwpViYD5EXBuibhK4
c/6nbXStHQkQEC+mgXh7RndAdNqinTGcpidnN2Kw5YvYsDxnVEc4L0xmc62FNHcH
aVJGVBTInfdg2KRGxBIUhTUXxEV505JV/RaKNqe+W0FHST5L2ueBsAs2Izu8ADa2
V6ktwtWbq0nxslAAjVx29BeT2fgSy0gKN/AGGiv9ggclP2WdQj4sto5F26bHnHu1
TritSWIcff9NWq/2l4OG1mmPz55iUr9OKA479bUUSAXCZuvmdXleFJSMy8kD5S0D
zHnAunCtkugCBRYSaOCP1tyb7ir7C/Ewbhqgag4mdG5xriXE7v1KXFtG3DVKALt7
CvlJ6eqmjaKdCdPuEIvO1BrNgWZ+AkuG3m0ims90bn99ZLOuE1r0M5c/EtUCwRaG
dQK5T7rHogNndPNgd8jeBPOEM7IWaCZ2YQ+0FLHHJQAIgpYcMzqCYkPPYBHWhFof
0sR3zDz2lYrNU4h7KgcuEIHmpRjS2Lg/3Xd8mMhbV/PU7lX/k8MOJ98cSOmEy5y1
v2pS3ugb8roNilUvtHGkmMM+DavgbI/cO++u/AiRvkIdHPQcvOSjrS2nJCvHk0J2
cYZIiCXxeMWqcWUobWmpEGyOETszc7SGH9vYeTbhTAvxnORV6TA=
=6hPg
-----END PGP SIGNATURE-----

--wWYfb0W2agy2UDs5--
