Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9645CA10220
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 09:34:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C583910E879;
	Tue, 14 Jan 2025 08:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="TsnYEBL4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 588 seconds by postgrey-1.36 at gabe;
 Mon, 13 Jan 2025 12:38:37 UTC
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85C810E09C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 12:38:37 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4YWs4Y4zNTz9spv;
 Mon, 13 Jan 2025 13:28:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1736771325; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2x7hi0zLbU3c7JkoUFAYjrKB6N8BcXDRVLitPOp7FCI=;
 b=TsnYEBL48OJJiWHeqv2BGTINjtJPacNqzB4v5OOqqKKsXOMz9v9sWNpmCUU/kecrJH6JpI
 wxh1ZOrm5Qm02KMjG5q5oDyt+LRJd3/mZeMI8cfTba6KPWtAA3bWLlGFiToh2g/M2GMA4X
 Ntf3M8oHZ58rOSIQ0I61CWCyV1BqIot47yUVlGyDgdm4b3pKFUyeKH1lNS1xb0CddrMc8y
 2xsJFFcJLQCPVxYL1oXTwt4hbunPMNEXGMKGc0F0rb6A4AapNK+78c3OofKjXMhmQkvQwx
 2b4t0WYfmEuDt6hDload8fsq6XT4KaIewL10NbiroJRqup7oNydAMC/KltUILA==
Message-ID: <5d4a4c342ee3cb56643b54c419c5b77776bd8793.camel@mailbox.org>
Subject: Re: [PATCH 2/2] MAINTAINERS: Add DRM GPU Scheduler reviewer
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Philipp
 Stanner <phasta@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>,  Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
 "Steven Rostedt (Google)" <rostedt@goodmis.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Yosry Ahmed <yosryahmed@google.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Matthew
 Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>
Date: Mon, 13 Jan 2025 13:28:40 +0100
In-Reply-To: <ddf0d156-fa3f-4923-b894-8627ed3aa937@amd.com>
References: <20250113121851.31382-1-phasta@kernel.org>
 <20250113121851.31382-2-phasta@kernel.org>
 <ddf0d156-fa3f-4923-b894-8627ed3aa937@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: rbrtmwgqo6angmyum3hnutunbjsfc7kq
X-MBO-RS-ID: ead7c6e966ea17aa241
X-Mailman-Approved-At: Tue, 14 Jan 2025 08:33:59 +0000
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

On Mon, 2025-01-13 at 13:24 +0100, Christian K=C3=B6nig wrote:
> Am 13.01.25 um 13:18 schrieb Philipp Stanner:
> > Christian K=C3=B6nig is the original author of much of the scheduler's
> > code
> > and, thus, well suited to do reviews.
> >=20
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Danilo Krummrich <dakr@kernel.org>
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
>=20
> *sigh* Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>

https://y.yarn.co/d597fb6a-9584-4d78-a901-0bbe786d87ba_text.gif

:)

>=20
> > ---
> > =C2=A0 MAINTAINERS | 1 +
> > =C2=A0 1 file changed, 1 insertion(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index fa288ef20c59..f70e69bfc0c7 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7891,6 +7891,7 @@ DRM GPU SCHEDULER
> > =C2=A0 M:	Matthew Brost <matthew.brost@intel.com>
> > =C2=A0 M:	Danilo Krummrich <dakr@kernel.org>
> > =C2=A0 M:	Philipp Stanner <phasta@kernel.org>
> > +R:	Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com>
> > =C2=A0 L:	dri-devel@lists.freedesktop.org
> > =C2=A0 S:	Supported
> > =C2=A0 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>=20

