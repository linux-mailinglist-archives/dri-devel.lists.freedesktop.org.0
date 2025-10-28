Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF7FC14C9C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 14:13:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7538310E3E4;
	Tue, 28 Oct 2025 13:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="ubqvsWay";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108C910E3E4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 13:13:48 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cwrRX3Zmpz9v9S;
 Tue, 28 Oct 2025 14:13:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1761657224; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tIMBdg9hZMgzgkPQpzhd4pEXX3E5//TWcqRmbwu593Q=;
 b=ubqvsWayQe5/k/FT6L/J/0oO6qzn7d1PGkcg1N5USO0O3qTuPw1WGk3kCfkDKCcRjCTujW
 1QEe1jlErr6KLsZ/6ap+uTC8ByfoTytlKpLOkmoMMqhjE3AMB9b7gcghN3Bv7KDaICJUgy
 U+9x1W3XFqPILMkai5VCd0D7CMZwL1cfiqHU/w3scpIQtgOVjGR2DwmsCM0J6D188fR8Kf
 H3Bg0SoBcBejQxwUTr+Y7RBfmDnwqrz1PFwjs0tepfMHqXL+YGVbB2xXZusxRlKTjzqvat
 eWS11K3Vnw/RZtnq5AavdlUKTAX7c7s6szFsopKdi9dqSLzjO48Tgq14CbFlwQ==
Message-ID: <ff3db8827921a5b92c3a5915684eee61d6fe74f5.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: avoid killing parent entity on child SIGKILL v3
From: Philipp Stanner <phasta@mailbox.org>
To: Alex Deucher <alexdeucher@gmail.com>, phasta@kernel.org
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 dakr@kernel.org, matthew.brost@intel.com, dri-devel@lists.freedesktop.org
Date: Tue, 28 Oct 2025 14:13:40 +0100
In-Reply-To: <CADnq5_PUrPE8q8JD=pVZZYpxJuqovMbD5UcSR9m4E0nPTK=-ZA@mail.gmail.com>
References: <20251015140128.1470-1-christian.koenig@amd.com>
 <f60185e4a4b8622c866965ec30c90edca0c53b40.camel@mailbox.org>
 <CADnq5_PUrPE8q8JD=pVZZYpxJuqovMbD5UcSR9m4E0nPTK=-ZA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 78404d068053f3e2890
X-MBO-RS-META: rkasg1h4yhz45edujxmb3uuqybc1imdz
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2025-10-28 at 09:07 -0400, Alex Deucher wrote:
> Looks like this hasn't landed yet.=C2=A0 Can someone push this?

Pushed it (with fixed commit message) to drm-misc-fixes.

I had Acked it for Christian but it seems that was lost.

Thx Alex

P.

>=20
> Alex
>=20
> On Fri, Oct 17, 2025 at 2:18=E2=80=AFAM Philipp Stanner <phasta@mailbox.o=
rg> wrote:
> >=20
> > On Wed, 2025-10-15 at 16:01 +0200, Christian K=C3=B6nig wrote:
> > > From: David Rosca <david.rosca@amd.com>
> > >=20
> > > The DRM scheduler tracks who last uses an entity and when that proces=
s
> > > is killed blocks all further submissions to that entity.
> > >=20
> > > The problem is that we didn't track who initially created an entity, =
so
> > > when a process accidently leaked its file descriptor to a child and
> > > that child got killed, we killed the parent's entities.
> > >=20
> > > Avoid that and instead initialize the entities last user on entity
> > > creation. This also allows to drop the extra NULL check.
> > >=20
> > > v2: still use cmpxchg
> > > v3: improve the commit message
> > >=20
> > > Signed-off-by: David Rosca <david.rosca@amd.com>
> > > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4568
> > > Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> > > CC: stable@vger.kernel.org
> >=20
> > Acked-by: Philipp Stanner <phasta@kernel.org>
> >=20
> >=20
> > Fire at will, Christian. Maybe optionally with the commit message nits
> > twirked in we discussed before.
> >=20
> >=20
> > P.
