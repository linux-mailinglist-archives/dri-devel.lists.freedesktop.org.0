Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 318D8A14B6B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 09:46:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 734B210EAA8;
	Fri, 17 Jan 2025 08:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="mKsJtGSc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E02910EA84
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 08:01:52 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4YZBy63zyTz9stj;
 Fri, 17 Jan 2025 09:01:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1737100878; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OWKmQYboqVXaYTSDNkdm/JQcGsOftsLWuwVk9cxD6Fg=;
 b=mKsJtGScGcuq4SNin2aLeqMK0CHJc/Ihrku5MYBkDrb1AU1ugdfuB6VcfgmdU3woER602e
 CYi5Jjcv2Z4fHH5jQvJpRrWIcbhYF88zdSIcykeGSADABubZWRxaNlWKG6kUVGjpQHMspO
 +InQhyvYBriQRUwMwV0S0fvM3NCJzmZZpPE3xBn+9zmRa7BC30qgwFCTr1TCeC401MmIhT
 Uo5jI1sTbgsRUTOSKHM0J1NnFP5Raz2RJjJ1ii19xZM0dESYpkgEPGxbxdSVUWUGwIV/Jl
 s/iW2QJpZNJWoVITt1XBauGhEYxJR5qkhvwP05huGUUqedHgWLmndifEOoqZbw==
Message-ID: <446af2bc30c17b5aea599d53284244bf846b3dbd.camel@mailbox.org>
Subject: Re: [PATCH 1/2] MAINTAINERS: Update DRM GPU Scheduler section
From: Philipp Stanner <phasta@mailbox.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Matthew
 Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Dave Airlie
 <airlied@gmail.com>
Date: Fri, 17 Jan 2025 09:01:14 +0100
In-Reply-To: <20250113121851.31382-1-phasta@kernel.org>
References: <20250113121851.31382-1-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: a10c711e85096492af1
X-MBO-RS-META: exm89ty9erynnha6yxy4ydj3usgzzga4
X-Mailman-Approved-At: Fri, 17 Jan 2025 08:46:14 +0000
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

(-cc some unrelated people)

On Mon, 2025-01-13 at 13:18 +0100, Philipp Stanner wrote:
> Luben has not been active and has not responded to mails since summer
> 2024. Remove him from MAINTAINERS and add an entry in CREDITS.
>=20
> Philipp has a new email address and an ACK to commit work time to the
> scheduler. Thus, set the state to 'Supported'.
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Applied those two to drm-misc-next.

P.

> ---
> =C2=A0CREDITS=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++++
> =C2=A0MAINTAINERS | 5 ++---
> =C2=A02 files changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/CREDITS b/CREDITS
> index cda68f04d5f1..1593ada4209c 100644
> --- a/CREDITS
> +++ b/CREDITS
> @@ -3948,6 +3948,10 @@ S: 1 Amherst Street
> =C2=A0S: Cambridge, Massachusetts 02139
> =C2=A0S: USA
> =C2=A0
> +N: Luben Tuikov
> +E: Luben Tuikov <ltuikov89@gmail.com>
> +D: Maintainer of the DRM GPU Scheduler
> +
> =C2=A0N: Simmule Turner
> =C2=A0E: sturner@tele-tv.com
> =C2=A0D: Added swapping to filesystem
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a87ddad78e26..fa288ef20c59 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7888,12 +7888,11 @@ F:	Documentation/gpu/zynqmp.rst
> =C2=A0F:	drivers/gpu/drm/xlnx/
> =C2=A0
> =C2=A0DRM GPU SCHEDULER
> -M:	Luben Tuikov <ltuikov89@gmail.com>
> =C2=A0M:	Matthew Brost <matthew.brost@intel.com>
> =C2=A0M:	Danilo Krummrich <dakr@kernel.org>
> -M:	Philipp Stanner <pstanner@redhat.com>
> +M:	Philipp Stanner <phasta@kernel.org>
> =C2=A0L:	dri-devel@lists.freedesktop.org
> -S:	Maintained
> +S:	Supported
> =C2=A0T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> =C2=A0F:	drivers/gpu/drm/scheduler/
> =C2=A0F:	include/drm/gpu_scheduler.h

