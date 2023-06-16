Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F94373333C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 16:14:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA4EF10E644;
	Fri, 16 Jun 2023 14:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C2F10E644
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 14:14:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1686924533; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=DZ/sznPOCsZ2N9bWRgjcMlrjgpe3AMB6v/K8AuOacy+eRH47M25LV2rggEFJGZ0tQE
 sTHRhkrrfPQ2zqwAJkKLeRDXGZgiKjgjopozwZc9tXMHP+mMhHKOPgUV1Atzt3B2EshU
 h4TJ13Y7V6DLSYrm9LUOwxLbFrJew4IWY34HsgRsOSAO8ODLNjIoLv0gg/wLNaFzEY53
 C0jQU3wHsvOBAkkymig+BK1jsSwF6C46fcUTgjZ04R2f3SnH92P5xctnEqdL1yqNp5Jq
 lVF4KO5q/rG/SrwbSREA1HHHKqvypM60nJgvBYwJx7UTHs8IjhhmuTybVFJIKOiy4hPd
 lWiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1686924533;
 s=strato-dkim-0002; d=strato.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=+FAEIASIz8oKie711NU6GVGe3x4TthEP9e1C55ifneQ=;
 b=lRy+/XIHtLEezozcnzdNm2Le5QdfFrgD0wF5yuhMrlssdfX89cVzUM18kNRH9JDThj
 h/2+DZEPCLJ/H6GTWJUnU+B4bKlALauxLBP73b0AYoWBwmiYiFFK44zbMMyWy4LBgaqo
 0sY4becqlRq2qAlNNGyTmggPNnzWY1N6/hIH5IoST3adu4+d+cJ5/2eRgzIsNnbspquo
 TdLQYh6HFN+EFfOqwqd96Aazw5xsJGs1yAph+F3t87Wjuj2NIe5syWirY9QCkhobg/Xy
 Vrv2dDrpIoez4fQT5i/rHYsgHxRG6N7YwQSmsdcYSw8xpwFIOTX6HcIncKb6B6cbjA9C
 JLuA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1686924533;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=+FAEIASIz8oKie711NU6GVGe3x4TthEP9e1C55ifneQ=;
 b=oo4Csjus9QE3o85M1BqLIIxwVsiP6uMIdaUhXeElx1Q1V7BrgLmKR+BuOyRqWCvid5
 5XkZlzlcCQWTDy6qA+wDc3gaSpt16KPOsPGE6xlt/Jcs3zS81iFQHWVxYdqoLqwOAIn/
 jz6+e+os28WfNOoMRZrb6q/9ViCqPCWKJim+GyBMc0nkYNgjSnMDwQiDBBSqWkl08fq7
 D3DZmNIAd/jj4n29LdevHJXl9b51Ch4bPm7LwQijtTuyL4jKe0Pwz8AbkL8Thvcy4VTM
 JDbn0Ub5Gu9NIHsbjgx8fXpjWmsVYeYKCl7D4P7U1YBTjQ+is874DYpbHZ5q21bLEofY
 lajg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1686924533;
 s=strato-dkim-0003; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=+FAEIASIz8oKie711NU6GVGe3x4TthEP9e1C55ifneQ=;
 b=yBNPZhvQ+23NnXN2mU0bZ+HywiVn9oJJzw/hAM/PJU0H6SXnpfY+PQqx0QTOCeJOCs
 OFnQHZZK+VKNUEb6N6BA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Apz9PSN6LgsXcGYkv8="
Received: from imac.fritz.box by smtp.strato.de (RZmta 49.6.0 DYNA|AUTH)
 with ESMTPSA id jaf17fz5GE8r9Xm
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Fri, 16 Jun 2023 16:08:53 +0200 (CEST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v3 00/17] Imagination Technologies PowerVR DRM driver
From: H. Nikolaus Schaller <hns@goldelico.com>
In-Reply-To: <CACRpkdYAAxvHLfEGFwaHQYvZRNhySNo7gSVEBSgGP-pusBwBnQ@mail.gmail.com>
Date: Fri, 16 Jun 2023 16:08:52 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <7D5A18D6-F915-49E3-ADD9-8613BA70E112@goldelico.com>
References: <20230613144800.52657-1-sarah.walker@imgtec.com>
 <CACRpkdYAAxvHLfEGFwaHQYvZRNhySNo7gSVEBSgGP-pusBwBnQ@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
X-Mailer: Apple Mail (2.3445.104.21)
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
Cc: matthew.brost@intel.com, Sarah Walker <sarah.walker@imgtec.com>,
 openpvrsgx-devgroup@letux.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, luben.tuikov@amd.com, dakr@redhat.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 sumit.semwal@linaro.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,
thanks for sharing this conversation with me.

> Am 16.06.2023 um 14:29 schrieb Linus Walleij =
<linus.walleij@linaro.org>:
>=20
> Hi Sarah,
>=20
> thanks for starting this long awaited work!
>=20
> On Tue, Jun 13, 2023 at 5:20=E2=80=AFPM Sarah Walker =
<sarah.walker@imgtec.com> wrote:
>=20
>> This patch series adds the initial DRM driver for Imagination =
Technologies PowerVR
>> GPUs, starting with those based on our Rogue architecture. It's worth =
pointing
>> out that this is a new driver, written from the ground up, rather =
than a
>> refactored version of our existing downstream driver (pvrsrvkm).

Great!

>=20
> This seems to be a fairly good starting point, a bit of trade-off
> between latest-and-greatest
> and recent enough devices that need aftermarket support.
>=20
> I assume you are aware of the community existing around Series 5
> (should be the immediate
> predecessor to Rogue?):
> https://github.com/openpvrsgx-devgroup/linux_openpvrsgx
>=20
> I don't know how active those people are these days, but I can see =
that a branch

Well, there hasn't been much progress due to lack of documentation and =
compatibility
issues of user-space code. Just keeping the code compatible to latest =
upstream kernels.

But at least for OMAP3 and OMAP5 processors people are actively using =
this work.

There is even a gaming console (www.pyra-handheld.com) in active =
production
with a strong need for an up-to-date SGX544 driver running on OMAP5.

> was updated for v6.4-rc3 just three weeks ago.
> =
https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/tree/pvrsrvkm-6.4-=
rc3
>=20
> I think it would be good for community building to make sure that you =
get these
> people involved in reviewing, especially neutral stuff like device =
tree bindings
> but also to make sure no architectural choices are done that will make =
it hard
> to retrofit a proper driver for the older engines if this community
> decide to work
> on it.

Some questions to the author of the new driver:
- are there plans to support SGX5 (the predecessor of Rogue6)?
- will this be able to run the existing firmware and user-space code of =
pvrsrvkm?
- or will it have new firmware and user-space code for these older =
chips?
- or will there be open user-space code for SGX (and Rogue)?

>=20
> Specifically I would ask that the DT bindings include all old and new =
PowerVR
> hardware in one go, unless they have very specific hardware definition =
needs,
> which I doubt.

Our current bindings for all SoC with a SGX5 GPU inside and which have =
at least
some official Linux support are here:

=
https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/blob/letux/omap-pv=
r-soc-glue-v8/Documentation/devicetree/bindings/gpu/img%2Cpvrsgx.yaml

There was an attempt to upstream at least this plus glue code (i.e. =
device tree
sources) some years ago but there was no consensus about the number and =
names of
clocks that should be included in such a bindings document.

>=20
> Also I think they could use your help to get the proper firmware for =
the older
> hardware licensed properly from Imagination and included into =
linux-firmware
> so they do not need to ship files on the side.

Indeed, this and some "universal" user-space code would help a lot. =
Currently
we have collected a lot of binaries for several architectures (e.g. =
Intel, OMAP, JZ4780),
but all from different DDK versions and very different assumptions about =
system
library versions.

>=20
> Yours,
> Linus Walleij

Best regards,
Nikolaus Schaller

