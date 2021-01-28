Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 581B7307B7D
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 17:58:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 763796E9C7;
	Thu, 28 Jan 2021 16:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 496BC6E9C7
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 16:58:43 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id a1so3076496qvd.13
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 08:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=gHcVm3LzoeirJMfb91X8XWvVNfWwYGXDQyXbX2buZ+U=;
 b=XRHjzbLIbb/aA9dWsnLaIV+6Ma0BcA9pyalLIyBnpjm0yxY/JZcdCdzXgk2xQl+SxY
 K2hyspV5eeNufauj6/n+jsYCc6XbtPQ66pJdRNRwIsb0dNzlqm1yp/hzYD/s0mKXEsfs
 TXaccMSY/eI86QY1ABGSbb3O86+ULHvvBQ6qo0j6EUKdrV0T8D5rGEB4TUZNFO8tImkS
 4maF/GXli0T6xeleoSm61uEBv6ds3DCSyl2TUQFysyEsfDsYld4zkZH4R2iesIsMfCKe
 iOsjvlqrG3X8Yrgb4oCQuwvWPJioCq8s5b2RjpPhnoUWNIPy94SOv6ZmDcJoqi7z+/kW
 MJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gHcVm3LzoeirJMfb91X8XWvVNfWwYGXDQyXbX2buZ+U=;
 b=lAYfijyl+moXNaU7BxPLkTtAPpIazxAGG0Agk9Wd/snbhQVkI3QPFVpNs9kez9O3cT
 C9JxrSSXFHWiwSuTsTQ0JcJ/mi1koYJtWJoL1/kynzueHE9THSQ27jzSOxh7hsm4SDVt
 Ipg+VXr78a2zj9I0mEILfaA+KuCowD1Y1OqfVYjRNGsxAvqmGJWtEzB+2S9kD3y4COzA
 FRnIF2hz5GcycChae46vDoGOSn4doy2xunoZtOqs3efHf73sbeQo6/Gxh4ZANbCevRrL
 Yix+RMVmSOninjXgx2PoagigFI1VbFAaPcqSpw6FVLzxEo+MCoTVIdlJb33ODrvD7uDF
 /E9A==
X-Gm-Message-State: AOAM530yIR5d74E4KoYfIXIdtZURSZPAY+L6dvXO56cRMdz8Cpoe9up6
 ZZg9EI6f+e4KW14d3Oc6S6TUevDOAO0=
X-Google-Smtp-Source: ABdhPJx83PJG8471aY357/g3bpTyPalBK8KqGwdq94+BlrRWfmC7GFCdB+0KQqGdpAGMaVWCqVOy6g==
X-Received: by 2002:a0c:a366:: with SMTP id u93mr423097qvu.53.1611853122481;
 Thu, 28 Jan 2021 08:58:42 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id k12sm3823184qkj.72.2021.01.28.08.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 08:58:41 -0800 (PST)
Date: Thu, 28 Jan 2021 17:58:38 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH v5 00/21] Host1x sync point UAPI should not be used for
 tracking DRM jobs
Message-ID: <YBLtPv/1mGXwtibX@ulmo>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <da085c38-4ac1-19dd-7706-caf323c969d2@gmail.com>
 <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
 <2ee12338-bd5a-4b99-f86d-13da0d2a899b@gmail.com>
 <8504c239-d5df-3033-934c-7b3fab52e387@kapsi.fi>
MIME-Version: 1.0
In-Reply-To: <8504c239-d5df-3033-934c-7b3fab52e387@kapsi.fi>
User-Agent: Mutt/2.0.5 (da5e3282) (2021-01-21)
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 talho@nvidia.com, bhuntsman@nvidia.com, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: multipart/mixed; boundary="===============1835046427=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1835046427==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Xkf+6X5ZqcTOqHZi"
Content-Disposition: inline


--Xkf+6X5ZqcTOqHZi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 28, 2021 at 01:08:54PM +0200, Mikko Perttunen wrote:
> On 1/27/21 11:20 PM, Dmitry Osipenko wrote:
> > 26.01.2021 05:45, Mikko Perttunen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > > 2. We will probably need a dedicated drm_tegra_submit_cmd for sync =
point
> > > > increments.=C2=A0 The job's sync point will be allocated dynamicall=
y when job
> > > > is submitted.=C2=A0 We will need a fag for the sync_incr and wait_s=
yncpt
> > > > commands, saying "it's a job's sync point increment/wait"
> > >=20
> > > Negative. Like I have explained in previous discussions, with the
> > > current way the usage of hardware resources is much more deterministic
> > > and obvious. I disagree on the point that this is much more complicat=
ed
> > > for the userspace. Separating syncpoint and channel allocation is one=
 of
> > > the primary motivations of this series for me.
> >=20
> > Sync points are a limited resource. The most sensible way to work around
> > it is to keep sync points within kernel as much as possible. This is not
> > only much simpler for user space, but also allows to utilize DRM API
> > properly without re-inventing what already exists and it's easier to
> > maintain hardware in a good state.
>=20
> I've spent the last few years designing for automotive and industrial
> products, where we don't want to at runtime notice that the system is out=
 of
> free syncpoints and because of that we can only process the next camera
> frame in a second or two instead of 16 milliseconds. We need to know that
> once we have allocated the resource, it is there. The newer chips are also
> designed to support this.
>=20
> Considering Linux is increasingly being used for such applications, and t=
hey
> are important target markets for NVIDIA, these need to be supported.
>=20
> Because of the above design constraint the userspace software that runs in
> these environments also expects resources to be allocated up front. This
> isn't a matter of having to design that software according to what kind of
> allocation API we decide do at Linux level -- it's no use designing for
> dynamic allocation if it leads to you not meeting the safety requirement =
of
> needing to ensure you have all resources allocated up front.
>=20
> This isn't a good design feature just in a car, but in anything that needs
> to be reliable. However, it does pose some tradeoffs, and if you think th=
at
> running out of syncpoints on T20-T114 because of upfront allocation is an
> actual problem, I'm not opposed to having both options available.

I think that's a fair point. I don't see why we can't support both
implicit and explicit syncpoint requests. If most of the use-cases can
work with implicit syncpoints and let the kernel handle all aspects of
it, that's great. But there's no reason we can't provide more explicit
controls for cases where it's really important that all the resources
are allocated upfront.

Ultimately this is very specific to each use-case, so I think having
both options will provide us with the most flexibility.

Thierry

--Xkf+6X5ZqcTOqHZi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAS7ToACgkQ3SOs138+
s6HbyA/9HY1VFtBi5g8bpKT9ybG+D3FozymsGxDhDXAa+T7J1aHlX2cB1ZLjeXh1
ujQfrEzOnivTF+sXHIFI3W/4qTLK5EgTLVhYWPb/9C5basucK/Dsp0NaGJfuuuVg
G6ft8zn3XnUhRE93GzSglMsewk0MZTG+L1v++u/YN+/QSiUq2eZPyPVXOY94kB7y
teLLVxikZsdbf+8Nh2u8t7KJOdcTjssO/v0N2M6bsyGUrJ/mdHH8t2Fj/63w80eJ
ovoYk5opqf5WmLWEeOCZSYgkhPylEMDrxhS+c3Hv5es4PLmjmuvWg3KNQAGDWwZZ
n/+mIetE41gmV3NHy9DCTrjdaaKsFXOOs5ixtxO3nmPPe+w1f29/9fzVMhfGhJTn
J4alVG9tb/yh3eYrxJVFiLhkeJfi2dTNpHnq/N7mETd8QhElRnabDeIC/NvMYOTr
VOtpWSjhLfHuu0i1G3d6swD9r3ML8ayDLwefpYiqtLRwRPFxQzbwf2bmRmcaoMhH
DbzHJDWUdUrZF7LZPKETfFShhYAR4MijxILlHRVxfNHJaOGKTPP6hPtOLcr3+7py
Obajt8UM7qlg/bBEE7q8LVp++a95JMid9JsbzJp3Y9j693+LeVpEeOMPpIoqWVD8
k6r+3S8Zm4lIeb/qpvUDeu58ckIwTAqSIrzR7tLAW+MN90AsQeI=
=fXd7
-----END PGP SIGNATURE-----

--Xkf+6X5ZqcTOqHZi--

--===============1835046427==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1835046427==--
