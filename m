Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FF55780F5
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 13:39:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A481299529;
	Mon, 18 Jul 2022 11:38:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460DB99527;
 Mon, 18 Jul 2022 11:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658144336; x=1689680336;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n2Q3FcltGHz6CGZ/4h4aB90IlF1pQJ49RqYDZmZ2zhU=;
 b=OOKvpabpkUhQJOTvFMSl47q7JUukmB3QAfnLYdRA7vywQIgy0eSHYsVr
 mON5LKlpvt06fZZWY6pKKuAfxCMQwit1pl60wWPb8MA3QDvnrbsc2uN2w
 OttiWDyDWDZygUMfgHe+VzYL+MwJi8D39+lfg4qgHlXX840KsqCP2Qc9i
 VUYE6TVWZayOi9YU0kOposiKJP+uSuCEkVOXV/JQCI1AS6suiPdSDlqhs
 TRaVWXwnKV7QjiEIUfn72A4yN1U8bC1/CqLMK+DAQhJboBqiKDg1EjNcS
 SPB82IOJQb8NwcaJIjifAGFHzRMhpV+uJhTzSIJSEO0ttQ5kwe39ULlPJ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10411"; a="265981171"
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="265981171"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 04:38:34 -0700
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="624692261"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO maurocar-mobl2)
 ([10.249.35.85])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 04:38:31 -0700
Date: Mon, 18 Jul 2022 13:38:28 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Joe Perches <joe@perches.com>
Subject: Re: [Intel-gfx] [PATCH v2 24/39] drm/i915: dvo_sil164.c: use SPDX
 header
Message-ID: <20220718133817.058b8b43@maurocar-mobl2>
In-Reply-To: <f6ab40860cd4f8079e6e169c7d6465f211b8dbd3.camel@perches.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <002a8d51244a70572744de86cacbdae293e7d503.1657699522.git.mchehab@kernel.org>
 <YtHdp6ju3IfjF8Bq@intel.com>
 <f6ab40860cd4f8079e6e169c7d6465f211b8dbd3.camel@perches.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 15 Jul 2022 15:16:05 -0700
Joe Perches <joe@perches.com> wrote:

> On Fri, 2022-07-15 at 17:35 -0400, Rodrigo Vivi wrote:
> > On Wed, Jul 13, 2022 at 09:12:12AM +0100, Mauro Carvalho Chehab wrote: =
=20
> > > This file is licensed with MIT license.	Change its license text
> > > to use SPDX.
> > >=20
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org> =20
> >=20
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> =20
>=20
> Not exactly the MIT license as it's missing "or copyright holders"

Text is not identical, but the license is... see below:

> >  =20
> > > ---
> > >=20
> > > To avoid mailbombing on a large number of people, only mailing lists =
were C/C on the cover.
> > > See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522=
.git.mchehab@kernel.org/
> > >=20
> > >  drivers/gpu/drm/i915/display/dvo_sil164.c | 32 +++++----------------=
--
> > >  1 file changed, 6 insertions(+), 26 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/i915/display/dvo_sil164.c b/drivers/gpu/=
drm/i915/display/dvo_sil164.c
> > > index 0dfa0a0209ff..12974f7c9dc1 100644
> > > --- a/drivers/gpu/drm/i915/display/dvo_sil164.c
> > > +++ b/drivers/gpu/drm/i915/display/dvo_sil164.c
> > > @@ -1,30 +1,10 @@
> > > -/*******************************************************************=
*******
> > > +// SPDX-License-Identifier: MIT
> > > =20
> > > -Copyright =C2=A9 2006 Dave Airlie
> > > -
> > > -All Rights Reserved.
> > > -
> > > -Permission is hereby granted, free of charge, to any person obtainin=
g a
> > > -copy of this software and associated documentation files (the
> > > -"Software"), to deal in the Software without restriction, including
> > > -without limitation the rights to use, copy, modify, merge, publish,
> > > -distribute, sub license, and/or sell copies of the Software, and to
> > > -permit persons to whom the Software is furnished to do so, subject to
> > > -the following conditions:
> > > -
> > > -The above copyright notice and this permission notice (including the
> > > -next paragraph) shall be included in all copies or substantial porti=
ons
> > > -of the Software.

The license itself is here. It is standard MIT license. The original
text for the above paragraph is clearer about that:

	"The above copyright notice and this permission notice shall be included in
	 all copies or substantial portions of the Software."

The "next paragraph", mentioned on this variant:

> > > -
> > > -THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPR=
ESS
> > > -OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > > -MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEME=
NT.
> > > -IN NO EVENT SHALL THE AUTHOR =20
>=20
> Missing "Authors or copyright holders"

Is actually a disclaimer's note, and not the license itself, informing that
there's no warranties provide by author(s).=20

With SPDX, this will point to LICENSES/preferred/MIT with has a paragraph
that fits to the same purpose: it excludes any express or implied
warranties.

Btw, the Kernel itself had this at COPYING by the time this was added
and before SPDX, which was there when this code was added. This is
part of the GPL text:

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

So, I can't see any changes here: with or without this patch, there's
no warranties from the ones that wrote the code - nor for any
copyright holders - as the Kernel as a hole is released under GPL.

Also, LICENSES/preferred/MIT define that MIT license text is:

	MIT License
=09
	Copyright (c) <year> <copyright holders>

In this specific case, "Copyright =C2=A9 2006 Dave Airlie", which is both
the author and the copyright holder that is part of MIT, so the text=20
meaning is identical with either "AUTHOR" or "AUTHORS OR COPYRIGHT=20
HOLDERS" is used.

So, I can't see any difference from legal standpoint.

Regards,
Mauro
