Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 694F39ADD7A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 09:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132B410E8C2;
	Thu, 24 Oct 2024 07:20:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Bzz1vsgY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF6910E8BF;
 Thu, 24 Oct 2024 07:20:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 40324A45168;
 Thu, 24 Oct 2024 07:20:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB0CEC4CEC7;
 Thu, 24 Oct 2024 07:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729754446;
 bh=LR1LZ3CSRozgUjzx0t7w7Gn9212nLYiLXlkoAsdr8HA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bzz1vsgYeJqxYsK9+eDf7kMxZK/M4s6G+t1xvYk/JmC6Tj5g/BAduwh++eLiA7bL0
 8I1E1yUKMUJ7qqWH4IVu2LGv8rcEf9Y14Ov8/1oCRuduyXOcW6BmZnpZP7hUGlMq+9
 0C44DJw7jbCaGNQMAv6aewqv11xbQmBCunMTz/RYSmEj58slP0EtxdpcWl0mcqa6ra
 bsibUS4+6bPpVC0VPYd/iC4exPI/mE3qLOkZAzhuMqtEtQEbSoOnmV+UpOfSUcLpbZ
 JL/UkfFq/VGGc3y+Bbdm33XZkvzlJd3qRNuiKIMewBsC3o5iZtC0EStbdE7+LJr5ua
 mwRiK2bpn18Fg==
Date: Thu, 24 Oct 2024 09:20:43 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org, 
 linux-mm@kvack.org
Subject: Re: [PATCH 0/7] kernel/cgroups: Add "dev" memory accounting cgroup.
Message-ID: <20241024-beautiful-spaniel-of-youth-f75b61@houat>
References: <20241023075302.27194-1-maarten.lankhorst@linux.intel.com>
 <ZxlRLMwkabTaOrjc@slm.duckdns.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="j6zj4jbcyydfxuo7"
Content-Disposition: inline
In-Reply-To: <ZxlRLMwkabTaOrjc@slm.duckdns.org>
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


--j6zj4jbcyydfxuo7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/7] kernel/cgroups: Add "dev" memory accounting cgroup.
MIME-Version: 1.0

Hi Tejun,

Thanks a lot for your review.

On Wed, Oct 23, 2024 at 09:40:28AM -1000, Tejun Heo wrote:
> On Wed, Oct 23, 2024 at 09:52:53AM +0200, Maarten Lankhorst wrote:
> > New submission!
> > I've added documentation for each call, and integrated the renaming from
> > drm cgroup to dev cgroup, based on maxime ripard's work.
> >=20
> > Maxime has been testing this with dma-buf heaps and v4l2 too, and it se=
ems to work.
> > In the initial submission, I've decided to only add the smallest enable=
ment possible,
> > to have less chance of breaking things.
> >=20
> > The API has been changed slightly, from "$name region.$regionname=3D$li=
mit" in a file called
> > dev.min/low/max to "$subsystem/$name $regionname=3D$limit" in a file ca=
lled dev.region.min/low/max.
> >=20
> > This hopefully allows us to perhaps extend the API later on with the po=
ssibility to
> > set scheduler weights on the device, like in
> >=20
> > https://blogs.igalia.com/tursulin/drm-scheduling-cgroup-controller/
> >=20
> > Maarten Lankhorst (5):
> >   kernel/cgroup: Add "dev" memory accounting cgroup
>=20
> Yeah, let's not use "dev" name for this. As Waiman pointed out, it confli=
cts
> with the devices controller from cgroup1. While cgroup1 is mostly
> deprecated, the same features are provided through BPF in systemd using t=
he
> same terminologies, so this is going to be really confusing.

Yeah, I agree. We switched to dev because we want to support more than
just DRM, but all DMA-able memory. We have patches to support for v4l2
and dma-buf heaps, so using the name DRM didn't feel great either.

Do you have a better name in mind? "device memory"? "dma memory"?

> What happened with Tvrtko's weighted implementation? I've seen many propo=
sed
> patchsets in this area but as far as I could see none could establish
> consensus among GPU crowd and that's one of the reasons why nothing ever
> landed. Is the aim of this patchset establishing such consensus?

Yeah, we have a consensus by now I think. Valve, Intel, Google, and Red
Hat have been involved in that series and we all agree on the implementatio=
n.

Tvrtko aims at a different feature set though: this one is about memory
allocation limits, Tvrtko's about scheduling.

Scheduling doesn't make much sense for things outside of DRM (and even
for a fraction of all DRM devices), and it's pretty much orthogonal. So
i guess you can expect another series from Tvrtko, but I don't think
they should be considered equivalent or dependent on each other.

> If reaching consensus doesn't seem feasible in a predictable timeframe, my
> suggesstion is just extending the misc controller. If the only way forward
> here is fragmented vendor(s)-specific implementations, let's throw them i=
nto
> the misc controller.

I don't think we have a fragmented implementation here, at all. The last
patch especially implements it for all devices implementing the GEM
interface in DRM, which would be around 100 drivers from various vendors.

It's marked as a discussion because we don't quite know how to plumb it
in for all drivers in the current DRM framework, but it's very much what
we want to achieve.

Maxime

--j6zj4jbcyydfxuo7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZxn1RAAKCRAnX84Zoj2+
dhOFAYDnvKCdtdyZtwff6yW6hwWh0NyRRb2B3Gl+YlgcVCEGJ4qVIO4uviaD2Pzc
m1KnTrMBewRZ74IdWG+6paWjlbKquoDIPMwSmvXh2qaS8OsgoVJqlXVFoJp6wzt/
3ARaU1tySQ==
=b4FA
-----END PGP SIGNATURE-----

--j6zj4jbcyydfxuo7--
