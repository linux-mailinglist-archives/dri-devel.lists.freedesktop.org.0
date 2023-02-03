Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D81C96897B3
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 12:28:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475C010E76C;
	Fri,  3 Feb 2023 11:28:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5AF10E76A
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 11:28:04 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1pNuEb-00079L-P7; Fri, 03 Feb 2023 12:28:01 +0100
Message-ID: <99c4db33a1966bd1979817277facb4a42ba2333f.camel@pengutronix.de>
Subject: Re: [PATCH 2/3] drm/scheduler: Fix elapsed_ns kernel-doc error
From: Lucas Stach <l.stach@pengutronix.de>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Intel Graphics Development List
 <intel-gfx@lists.freedesktop.org>, DRI Development List
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Date: Fri, 03 Feb 2023 12:27:55 +0100
In-Reply-To: <20230203100215.31852-3-bagasdotme@gmail.com>
References: <20230203100215.31852-1-bagasdotme@gmail.com>
 <20230203100215.31852-3-bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Srinivasan Shanmugam <srinivasan.s@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>, Hans de Goede <hdegoede@redhat.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 =?ISO-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, dem 03.02.2023 um 17:02 +0700 schrieb Bagas Sanjaya:
> Stephen Rothwell reported htmldocs warnings:
>=20
> include/drm/gpu_scheduler.h:232: warning: Incorrect use of kernel-doc for=
mat:          * @elapsed_ns
> include/drm/gpu_scheduler.h:238: warning: Function parameter or member 'e=
lapsed_ns' not described in 'drm_sched_entity'
>=20
> Fix the error by appending missing colon to @elapsed_ns name in its
> kernel-doc comment.
>=20

Thanks, I've added this to the etnaviv tree.

Since the commit is only in -next and not a non-rebase tree yet, I
might be tempted to squash the fix into the offending commit. What
would be the right way to credit you for the fix in that case?

Regards,
Lucas

> Link: https://lore.kernel.org/linux-next/20230203135027.1a4679d3@canb.auu=
g.org.au/
> Fixes: 248cd9b265fca6 ("drm/scheduler: track GPU active time per entity")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  include/drm/gpu_scheduler.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 9a50365621ed8d..9db9e5e504eeb3 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -229,7 +229,7 @@ struct drm_sched_entity {
>  	struct rb_node			rb_tree_node;
> =20
>  	/**
> -	 * @elapsed_ns
> +	 * @elapsed_ns:
>  	 *
>  	 * Records the amount of time where jobs from this entity were active
>  	 * on the GPU.

