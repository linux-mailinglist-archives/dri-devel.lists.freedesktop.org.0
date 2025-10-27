Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF1EC0DA59
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 13:45:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A1E10E008;
	Mon, 27 Oct 2025 12:45:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="QrJ6dEk8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FAD610E008
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 12:45:42 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cwCsZ5Yy0z9tPJ;
 Mon, 27 Oct 2025 13:45:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1761569138; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z9/5/O/PnrRErtA64sqZiP8P5kegkr2ZMB9bruDNLPg=;
 b=QrJ6dEk8PteROh999ANb9OgInroyRXoqQ35/kM0p64fvX3PRxJB/+bRHUT6EwJ6My44QAF
 zilj5zHqNBNbZqSz1yJpYzrbINBLi1KGpL3W2OX33NGKQZ5Yc26y16j+yOr+d56uUCm4aQ
 rGiik7/IRYzXZ4YBt6YhpThcuwcJ2FN3mnQVuLGjPY8sviycuQBUgEjrkBAR/5Cel9Qtlg
 wyn9y9i9omguIlTJ+UkU14eyiF8D6+52CiXj9Kf5Z4DzAdVrDBc8EbO2/HT8Jl/y5/OjvJ
 +4CyT9Y2xH+ZifqVOF88SyweUBRslibFNFIptf6WSbL8anr8X36SuGit0tBwyA==
Message-ID: <e8d18b60162e3d83ee58dc9df642d8a46f6eda08.camel@mailbox.org>
Subject: Re: [PATCH] MAINTAINERS: Maintain spsc_queue through drm_sched
From: Philipp Stanner <phasta@mailbox.org>
To: Philipp Stanner <phasta@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>,  Danilo Krummrich <dakr@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Mon, 27 Oct 2025 13:45:36 +0100
In-Reply-To: <aPtm5UD4tfVBJzSh@phenom.ffwll.local>
References: <20251024081459.164634-2-phasta@kernel.org>
 <aPtm5UD4tfVBJzSh@phenom.ffwll.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: b6e7f0e381d9064061c
X-MBO-RS-META: 7xrf55ennrui3ztncdj6hio4ouaq44a8
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

On Fri, 2025-10-24 at 13:45 +0200, Simona Vetter wrote:
> On Fri, Oct 24, 2025 at 10:15:00AM +0200, Philipp Stanner wrote:
> > Back in the day a specialized lockless queue was designed solely for th=
e
> > DRM GPU Scheduler: spsc_queue. This queue's only user is drm_sched, and
> > there is no dedicated maintainer entry for the queue.
> >=20
> > Add the spsc_queue header to the DRM GPU Scheduler MAINTAINERS' section=
.
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
>=20
> Acked-by: Simona Vetter <simona.vetter@ffwll.ch>

Applied to drm-misc-next

Thx.
P.

>=20
> > ---
> > =C2=A0MAINTAINERS | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5889df9de210..efafe2b3517c 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -8580,6 +8580,7 @@ S:	Supported
> > =C2=A0T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> > =C2=A0F:	drivers/gpu/drm/scheduler/
> > =C2=A0F:	include/drm/gpu_scheduler.h
> > +F:	include/drm/spsc_queue.h
> > =C2=A0
> > =C2=A0DRM GPUVM
> > =C2=A0M:	Danilo Krummrich <dakr@kernel.org>
> > --=20
> > 2.49.0
> >=20
>=20

