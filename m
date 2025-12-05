Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E33C1CA73E7
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 11:48:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D5910EAAE;
	Fri,  5 Dec 2025 10:47:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="FQedaGC1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB9B10EAAE
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 10:47:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764931666; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=CeHA8ActDaVV8MyPttc/lrLLdDN2ziW+z7uDyaeYYMylOqbj8s7KQN22Kp44XoZjpaYo93p/0jwhSxTWQP0TE/btH3X3TSkAbLluwHTV+PNOSlNA9a0EMO4/+B65xcWQfUQfF70KegmRuyycsyrN/dVnpAi3CyjPORMMWxrFBSk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764931666;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=VZVHu9YRjU1cohmrZAfykBDObnK2z1N4MteFLxu1DNM=; 
 b=A8H7j8igmiz4OpGKfg9DZYenf3tqMafpoNC+iPecvGXBIaLSRx+6Zy/nX6RV0FP2HE5Eg8u2KuE4WntThbwDXFKiFGfZnyKSNY38JJnE7D3RLMegrfiG7GuWA5fyll6yDRofGupenOka/jyGDWiEufwbsd091VF26rf4OzRjrE8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764931666; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=VZVHu9YRjU1cohmrZAfykBDObnK2z1N4MteFLxu1DNM=;
 b=FQedaGC1Al7CqbTJuEIr5wcUaDKvaM/n2DwHW9vgK0eVtbgHBWi1GZGQrrEAh3lp
 3gxO1mOp7IcC24eE7W3Dt5GDRv7TJRfzm4CPqASpzV1pML/Y52CHJFMzZSB1l92MlOJ
 HNwn0BGRmNBNvY7MkPBwBUWpgLVPMHQNEsQFpcWg=
Received: by mx.zohomail.com with SMTPS id 1764931665174369.835521409532;
 Fri, 5 Dec 2025 02:47:45 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/panthor: Add tracepoint for hardware utilisation
 changes
Date: Fri, 05 Dec 2025 11:47:40 +0100
Message-ID: <15112867.uLZWGnKmhe@workhorse>
In-Reply-To: <CAPaKu7R_PJPD3s6wvuduGHDFCy+AE+Hd+p1cS+ZSu_tTgE2txQ@mail.gmail.com>
References: <20251203-panthor-tracepoints-v1-0-871c8917e084@collabora.com>
 <20251203-panthor-tracepoints-v1-1-871c8917e084@collabora.com>
 <CAPaKu7R_PJPD3s6wvuduGHDFCy+AE+Hd+p1cS+ZSu_tTgE2txQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

On Thursday, 4 December 2025 21:21:08 Central European Standard Time Chia-I=
 Wu wrote:
> On Wed, Dec 3, 2025 at 6:04=E2=80=AFAM Nicolas Frattaroli
> <nicolas.frattaroli@collabora.com> wrote:
> >
> > Mali GPUs have three registers that indicate which parts of the hardware
> > are powered and active at any moment. These take the form of bitmaps. In
> > the case of SHADER_PWRACTIVE for example, a high bit indicates that the
> > shader core corresponding to that bit index is active. These bitmaps
> > aren't solely contiguous bits, as it's common to have holes in the
> > sequence of shader core indices, and the actual set of which cores are
> > present is defined by the "shader present" register.
> >
> > When the GPU finishes a power state transition, it fires a
> > GPU_IRQ_POWER_CHANGED_ALL interrupt. After such an interrupt is
> > received, the PWRACTIVE registers will likely contain interesting new
> > information.
> I am seeing
>=20
>    irq/342-panthor-412     [000] .....   934.526754: gpu_power_active:
> shader_bitmap=3D0x0 tiler_bitmap=3D0x0 l2_bitmap=3D0x0
>    irq/342-panthor-412     [000] .....   936.640356: gpu_power_active:
> shader_bitmap=3D0x0 tiler_bitmap=3D0x0 l2_bitmap=3D0x0
>=20
> on a gpu-bound test. It does not look like collecting samples on
> GPU_IRQ_POWER_CHANGED_ALL gives too much info.

On what GPU and SoC is that? If it's MT8196 then I wouldn't be
surprised if it just broke that hardware register, considering
what it did to the SHADER_PRESENT register.

On RK3588 (v10), GPU_IRQ_POWER_CHANGED_ALL reliably fires when
there is new information available in those registers. I haven't
tried on MT8196 (v13) yet because that still doesn't boot with
mainline so testing anything is a pain.

I don't have any v12 or v11 hardware to test with. From what I
understand, there's no open enough platform to do v11 testing on,
just the Pixel 8 and Pixel 9. I could look into the Cix SoC for v12
though some day, but I don't own one at the moment.

>=20
> I think they are more useful to be collected periodically, such that
> we know that in the past X seconds, Y out of a total of Z samples
> indicates activities. That's best done in userspace, and panthor's
> role should be to provide an uapi such as
> https://lore.kernel.org/all/cover.1743517880.git.lukas.zapolskas@arm.com/.

This wouldn't give you information on the time a power transition has
completed, which is one of the motivations. A periodically collected
PWRACTIVE would just be roughly correlated to how busy the GPU is,
which isn't very useful additional information as the performance
counters themselves are likely a better source of that kind of info.

What I need to do is restrict this to <=3D v13 in the next revision
however, because v14 reworks this stuff.

Kind regards,
Nicolas Frattaroli


