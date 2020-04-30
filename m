Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C3D1C0091
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 17:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 510DB6E924;
	Thu, 30 Apr 2020 15:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 400 seconds by postgrey-1.36 at gabe;
 Thu, 30 Apr 2020 15:41:22 UTC
Received: from mx.blih.net (mx.blih.net [212.83.155.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 475776E924
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 15:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bidouilliste.com;
 s=mx; t=1588260880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=siSc+wVCx92pO4nia33BDv08pe+zzvG5bnkde4Ef3hA=;
 b=kcXfTlk8jeWIUSRjFrlM1hLlaNQ+UzY1clgxUrwxs77nW0P4bPIpQOiyS/Gq0/Q/ofMfZW
 jSYNHrh0No9Ku3Og660SQ+pU3e4h5FM4vb2Zvkm1qylrZxk2pH/C28ywxDzg199NuECgTv
 5oBUbiuhidnkf8U/cMVTT4Iie8xbGjI=
Received: from tails.home (lfbn-idf2-1-900-181.w86-238.abo.wanadoo.fr
 [86.238.131.181]) by mx.blih.net (OpenSMTPD) with ESMTPSA id 9728d90d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 30 Apr 2020 15:34:40 +0000 (UTC)
Date: Thu, 30 Apr 2020 17:34:40 +0200
From: Emmanuel Vadot <manu@bidouilliste.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [RESEND 2/2] drm/format_helper: Dual licence the header in
 GPL-2 and MIT
Message-Id: <20200430173440.c006bbf57e70671dc4c324db@bidouilliste.com>
In-Reply-To: <20200430150634.42zna3xwhj4cwsnd@gilmour.lan>
References: <20200430145537.31474-1-manu@FreeBSD.org>
 <20200430150634.42zna3xwhj4cwsnd@gilmour.lan>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; amd64-portbld-freebsd13.0)
Mime-Version: 1.0
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
Cc: tzimmermann@suse.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Emmanuel Vadot <manu@freebsd.org>,
 kraxel@redhat.com, tglx@linutronix.de
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 30 Apr 2020 17:06:34 +0200
Maxime Ripard <maxime@cerno.tech> wrote:

> On Thu, Apr 30, 2020 at 04:55:37PM +0200, Emmanuel Vadot wrote:
> > Source file was dual licenced but the header was omitted, fix that.
> > Contributors for this file are:
> > Noralf Tr=F8nnes <noralf@tronnes.org>
> > Gerd Hoffmann <kraxel@redhat.com>
> > Thomas Gleixner <tglx@linutronix.de>
> > =

> > Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> > Acked-by: Noralf Tr=F8nnes <noralf@tronnes.org>
> > Signed-off-by: Emmanuel Vadot <manu@FreeBSD.org>
> > ---
> >  include/drm/drm_format_helper.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > =

> > diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_h=
elper.h
> > index ac220aa1a245..7c5d4ffb2af2 100644
> > --- a/include/drm/drm_format_helper.h
> > +++ b/include/drm/drm_format_helper.h
> > @@ -1,4 +1,4 @@
> > -/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> =

> You changed the GPL license there, was that intentional?
> =

> Maxime

 No sorry, fixed in v2.
 Thanks for noticing that.

-- =

Emmanuel Vadot <manu@bidouilliste.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
