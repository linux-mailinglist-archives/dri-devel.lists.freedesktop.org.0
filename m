Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FFE3C9B2A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 11:10:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF306E5BE;
	Thu, 15 Jul 2021 09:10:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5EA46E5BD;
 Thu, 15 Jul 2021 09:10:07 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id t17so8683688lfq.0;
 Thu, 15 Jul 2021 02:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=9gvzqDIemci/icf/CrYzh97il3z5m8X8hyJ/qIYo0Os=;
 b=euuQfcNwchFF0Y8fNGufYfpPZ7625E3ZZdMSRWqNhXJGkDZ0lpXM65j0xjEIfGNKsL
 PpLtyhuq5ND+/sndpzLBaseILlcl5J00OcImMuRgKA3k2tLQkMXlfUBbnwWfcjguwh57
 hv4WzebAdnrET9I62mAljQ9qEjROYz9EIpvSu9+PSgP/8BBHJCcdMdr2nOhqp9BdJ5wW
 k2vK/eP97V8fWrvdMZUr5/h6tXgYPhydkiIjwvV1nY7ESjTWFidDSv+coknKxoivzJO+
 njxn+ijYPmYKCwVY5IQ8n9kjJKQzwrh5w3F+kBYQ6JblAM4fwgFRD2mbXCNvZrTWismb
 V9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=9gvzqDIemci/icf/CrYzh97il3z5m8X8hyJ/qIYo0Os=;
 b=ivY5G5emXA1kpsF+KCwuXDBk3/Ho6cicWPBMMLGibXYOi71HK4Ni0xfe0NWKBnMugq
 FaFbas8loSr6vQJRrUwKPYnv1qLoDFIuVKPRbk0Cm/X8RBNYFQneXYFjr65LHo8WWsvU
 2FI4Y0jkDFl6wu1NIawQ2C9CBL5nWVC2iLKBt2CaFR4WHgcHwNiI/fR4BqoXonIWjMyk
 yTT+FbeDb14C63hqlIHT2pj8Ryy4FJWD0aP+ilhwl/qQf36iapYVcSgR172VAgh/c8xn
 MiRlJs3WzVCvwRmHWxYQjVstWK2aVRfXgrAAJr8YnEBuuPa8oZN7U7r6VaG8R8EEPHV8
 LW7g==
X-Gm-Message-State: AOAM530NfPNaHYCPnBXkviacJN2RnZDD2zQSlGfcgsbthEj2FZgHdnVr
 p6CVrdnFPWynVX8HXq2YqRk=
X-Google-Smtp-Source: ABdhPJzpoXFKX9X8/dQqRnjhIcXDouI3TuXkrZh4nORPxX/nb+O3lqZMaxqyQKCewVl80SaCJFfklg==
X-Received: by 2002:a19:911e:: with SMTP id t30mr2616500lfd.229.1626340206336; 
 Thu, 15 Jul 2021 02:10:06 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id t22sm145010lfd.131.2021.07.15.02.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 02:10:06 -0700 (PDT)
Date: Thu, 15 Jul 2021 12:10:02 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH v4 03/17] drm/uAPI: Add "active bpc" as feedback channel
 for "max bpc" drm property
Message-ID: <20210715121002.32fa8e1d@eldfell>
In-Reply-To: <d55fcc23-2531-9da8-5c0c-68454e15411b@tuxedocomputers.com>
References: <20210618091116.14428-1-wse@tuxedocomputers.com>
 <20210618091116.14428-4-wse@tuxedocomputers.com>
 <18bbd0cf-4c37-ce9d-eb63-de4131a201e1@tuxedocomputers.com>
 <11cd3340-46a1-9a6a-88f5-95c225863509@tuxedocomputers.com>
 <20210630112141.319f67eb@eldfell>
 <ca2827b5-9f6f-164b-6b3f-3f01898d3202@tuxedocomputers.com>
 <20210701104256.247538e1@eldfell>
 <b8db0280-f979-26a6-bf1b-148f8c4cc638@tuxedocomputers.com>
 <d55fcc23-2531-9da8-5c0c-68454e15411b@tuxedocomputers.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SMR4M7.1Z/f8VbFUwKkibVw";
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
Cc: sunpeng.li@amd.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, rodrigo.vivi@intel.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/SMR4M7.1Z/f8VbFUwKkibVw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 14 Jul 2021 20:18:57 +0200
Werner Sembach <wse@tuxedocomputers.com> wrote:

> Am 01.07.21 um 13:30 schrieb Werner Sembach:
> > Am 01.07.21 um 09:42 schrieb Pekka Paalanen: =20
> >> On Wed, 30 Jun 2021 11:42:10 +0200
> >> Werner Sembach <wse@tuxedocomputers.com> wrote:
> >> =20
> >>> Am 30.06.21 um 10:21 schrieb Pekka Paalanen: =20
> >>>> On Tue, 29 Jun 2021 13:02:05 +0200
> >>>> Werner Sembach <wse@tuxedocomputers.com> wrote:
> >>>>    =20
> >>>>> Am 28.06.21 um 19:03 schrieb Werner Sembach: =20
> >>>>>> Am 18.06.21 um 11:11 schrieb Werner Sembach: =20
> >>>>>>> Add a new general drm property "active bpc" which can be used by =
graphic
> >>>>>>> drivers to report the applied bit depth per pixel back to userspa=
ce.
> >>>>>>>
> >>>>>>> While "max bpc" can be used to change the color depth, there was =
no way to
> >>>>>>> check which one actually got used. While in theory the driver cho=
oses the
> >>>>>>> best/highest color depth within the max bpc setting a user might =
not be
> >>>>>>> fully aware what his hardware is or isn't capable off. This is me=
ant as a
> >>>>>>> quick way to double check the setup.
> >>>>>>>
> >>>>>>> In the future, automatic color calibration for screens might also=
 depend on
> >>>>>>> this information being available.
> >>>>>>>
> >>>>>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> >>>>>>> ---
> >>>>>>>    drivers/gpu/drm/drm_connector.c | 51 +++++++++++++++++++++++++=
++++++++
> >>>>>>>    include/drm/drm_connector.h     |  8 ++++++
> >>>>>>>    2 files changed, 59 insertions(+)

> New idea: Instead of the "active"-properties with various if cases in=20
> the kernel code, there could just be blob properties exposing the hdmi=20
> infoframes, hdmi general control packages, dp misc0 and misc1 and dp vsc=
=20
> sdp.
>=20
> Combined they have all the color information and it is made sure that=20
> it's what is actually send to the monitor (I would consider sending=20
> something differed then what is told in the infoframes a bug).
>=20
> They also have built in version numbers, if in the future they contain=20
> more information.
>=20
> Only disadvantage: We leave parsing for human readable output to the=20
> userspace.
>=20
> Alternatively keep the "active"-properties but fill them from the=20
> infoframes.
>=20
> I'm not entirely sure where to do that on amd, because there the=20
> infoframes are directly created in the dc code shortly before writing=20
> them to the hardware registers and immediately forgotten afterwards. But=
=20
> you still have access to the connector struct from that code so the=20
> property could be updated directly there.
>=20

Hi,

I'm not fundamentally against that as long as we have a common
userspace library to parse those blobs. In libdrm perhaps? Or a new
library?

But I also don't know about the technical feasibility, is it a good
idea.

OTOH, that could be the best thing for testing drivers vs. KMS UAPI
when you don't have a hardware HDMI/DP grabber to inspect the
infoframes. So maybe kernel CI would like that?


Thanks,
pq

--Sig_/SMR4M7.1Z/f8VbFUwKkibVw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDv+2oACgkQI1/ltBGq
qqcCww//b733aNOKh+AB43HwqpEMB7fT+jzdnNxC0QgSctkmcrnbNn4D9JFx+Q0z
d5UVW1d1NQd8Fxhy1MkibsiaNWln1fmz1iBrBX+yMO7GzC/BF0S5XqObAwGRqMjg
X3+maA4bxJ+qXPIsPzmHMXKO4f0ZRLdEsqOckWuNh1idIa3YY9Vh0yH4MVfNC3QL
QLGsMvl7ohzxNd4QG5U6379JJ7A5Jf6JEvdHMWOx261Qd3CoKYqmCcQ+ktZMoj3K
Wp9aRqBhNNa9JW9fUmwQHjJHgJT4K9dvzpjxwS77DAGmwMJ1LdF3pIo8LsOxIEer
rSSXmV9QsRkPwfIGwbImrlpGt5vfKHGwqlzaQGgo6VSwVKTYvzcYu7NIeAD9Uqhg
DJPk9yFPmLWULf4vIKDfHgif1AERVgJrgZM2qBSsA2EHyOYe+dbWQibnJCmUb/PD
1FkY4UEWVgB/IMi2Z7YZehwsJnr38MqTk8oLRMQXfT081PENqCGcnEtjDXkxB2vp
kxzXuSj55cVJOm1ubEmcmVa9MIFCtcj80i7iplk5IBLdYo9bsgN+r9kYURLNzKbt
TMN/tFdnqRQIuSSyVBa8TxtqIZqk4RO/3rwzpcTaZGYEwz5kn+zE2Ly7Z9uzYVT4
GrACR/syePdF3NdF5EDZjUlRlc5Z99S212BXc6VAXzG4cpz50zE=
=eCGP
-----END PGP SIGNATURE-----

--Sig_/SMR4M7.1Z/f8VbFUwKkibVw--
