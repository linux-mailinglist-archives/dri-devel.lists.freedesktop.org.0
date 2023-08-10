Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E793777C87
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 17:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F35010E561;
	Thu, 10 Aug 2023 15:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481F910E561
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 15:44:43 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1F8F56607225;
 Thu, 10 Aug 2023 16:44:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1691682281;
 bh=OMYSYaJbyigtYvasOupc09C1FcffZya9JFL2oFrKVJk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HhCu+ortyx2/GP/SasRsskVBy/sHK5g7HaqRoQrS4jocyIz21bmGo9BqwC359VqCG
 1Kk4fFWJcKMip2gPgjfZZqq/E5NWPwa8+k3gvZ0c641oDEQC8Tw2smKyzOT4E7gYa8
 JnHDji7QrW6WfhmMuVPepQ3HJiFdTfOgzMBSqbfsVB+YWYNtAEdJFNL4PE2Lok4m0I
 Tx4ECd0bXeclbextCRzJpgNylapX5XHe05kxZNBzzBSFcm2EYne3NA/kBpgJ+6oatv
 cDIwJrGodtzuiOot8d4wkgDnu19sH74LJsuoz0hV1qHhqgAj/qPD+SRFl0E3dI7qTj
 UFS2QJgIkWauw==
Date: Thu, 10 Aug 2023 17:44:38 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 00/15] drm: Add a driver for FW-based Mali GPUs
Message-ID: <20230810174438.2dba9b04@collabora.com>
In-Reply-To: <CAL_JsqJgymu8r0ApXmYkwL2dk5o5KyZ8iG14t7th_heJY5uP+w@mail.gmail.com>
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <CAL_JsqJgymu8r0ApXmYkwL2dk5o5KyZ8iG14t7th_heJY5uP+w@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Daniel Stone <daniels@collabora.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, "Marty
 E . Plummer" <hanetzer@startmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Rob,

On Wed, 9 Aug 2023 14:22:59 -0600
Rob Herring <robh@kernel.org> wrote:

> On Wed, Aug 9, 2023 at 10:53=E2=80=AFAM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > I tried to Cc anyone that was involved in any development of the code
> > I picked from panfrost, so they can acknowledge the GPL2 -> MIT+GPL2
> > change. If I missed someone, please let me know. =20
>=20
> Panfrost was largely based on etnaviv, vc4, v3d, and msm. Those are
> all GPL2 (or 2+) only.

Uh, I must have missed some copyright headers then. Note that not all
panfrost files were taken as a base for panthor:

- Makefile/Kconfig. I honestly hope there's nothing copyright-able in
  there, given there's no other way to define your driver and
  compilation rules.
- panthor_device.{c,h} copied from panfrost_device.{c,h} with quite a
  few modifications in the process. This one has your copyright, and
  Marty's one.
- a tiny part of panthor_drv.c was copied from panfrost_drv.c, but let's
  be honest, the part that was copied (ioctl wrappers, mostly), can't
  really be done differently. This one has your copyright, Marty's one,
  and Collabora's one.
- panthor_regs.h copied from panfrost_regs.h. This one has your
  copyright, Marty's one and Arm's one (definitions extracted from
  kbase). But again, I'm not even sure register definitions are
  copyright-able, given there's no other way to define them. If that
  makes a difference, I changed the prefix, and dropped definition that
  do not exist on CSF HW.
- panthor_gpu.{c,h} copied from panfrost_gpu.{c,h}. These files have
  your copyright, Marty's one, and Collabora's one.
- panthor_{gem,mmu}.{c,h} copied from panfrost_{gem,mmu}.{c,h}. Those
  ones have your copyright only.
- panthor_devfreq.{c,h} copied from panfrost_devfreq.{c,h}. Collabora's
  copyright only.
- panthor_{heap,fw,sched}.{c,h}. Those are brand new files, that were
  written from scratch.

I also git-blamed the lines I copies to Cc any contributors to the
above files. I might have omitted someone, but I did my best to
try and spot people that have a word in this decision.

> How is relicensing that code okay?

Sorry, the copyright headers of the files I copied didn't mention that
:-/. If that's an omission, it would be good to have the headers updated
to reflect the actual chain of copyrights.

> Also,
> panfrost depends on drm_gem_shmem_helper.c (at least) which is GPL2.
> Does that get re-implemented in a MIT licensed environment?

Not only drm_gem_shmem, but drm_gpuva_mgr and drm_sched too. And yes,
any helper function/lib that's not GPL+MIT will have to be
re-implemented or replaced by something else.

>=20
> Maybe some drivers are enough of a silo to get away with MIT
> licensing, but I wouldn't be comfortable claiming it.

Well, yes, re-using the code as-is is almost impossible, unless
someone rewrites the various GPL components we depend on. But if
someone wants to pick, say, the scheduling logic, and replace drm_sched
by something else, they can. Not saying it's worth it, just saying it's
possible.

Regards,

Boris

