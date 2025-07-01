Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F7DAEF6F3
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 13:46:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA5010E289;
	Tue,  1 Jul 2025 11:46:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="TaEKDEYG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic306-19.consmr.mail.gq1.yahoo.com
 (sonic306-19.consmr.mail.gq1.yahoo.com [98.137.68.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9A810E595
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 11:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1751370371; bh=gntt+k0Q9g+Ea+fbZ/JyDhnXZM80SSryV8+O9wXd6Z4=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=TaEKDEYGAE5qgW93N2OOpnpsGwXh/DVwhIEpFHY4n+BbiLZaRziflbl0G7Pa72uKQq4/bOWlsGv4rOJLx7DgLm7c9m6qQwpEje/S+E8vmxbwb7TUOguzxT+io8ihAdDWMTBN5Xm1z9tMwwJwi83hyWJme7/0uIdpmpJOx1ey01/tBSscDhRl0H96mQiHsiHE/tZ1vxY+7NbgYqKrw5M3jD19RyT7pRPdrtRpRIhL6bLmp5CunY+oEKKETiqS5a5L8yUuBCmTqvOC0+0wO41Bai+J3CQ4yhHWrJ1yYrtR/hW/rRelo+cCqxIMQtAYLAM3VygaSbRYfcO1gXER1VHRzA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1751370371; bh=9MlSyXNqJxg3oamm5peZ/XEabZCZbUMofj8kRwXTdhi=;
 h=X-Sonic-MF:Subject:From:To:Date:From:Subject;
 b=OFOf1S+r4Pr1A5jftcYJ3Z5vthnABP19xTs9sO9wkAZ68eeU7PqLKQMESK43tSELTJOAe7BwVqB3zWVUYM2RoCzZan+hXpFmftatqNZ9wwBwDMQ6pdiFI61ZftYcpK6E6LJ3PH9gaj+gxtjkkifavTx9d22iW6e22mqgiWjHONbOhUA+j0oJP3aC+xkWjAC+9em7wErR40Ybpe1ToIEORfeVcURTZYBpW5WU5NwM0VHenbcvDm56BosttaGkZnCJgT/Yq1oFYWQYFnRBDTFBYDDBrJZCE3yzsBwx7MRwU8j4UJjANfuvBmXks+GA+4Wl5ydI/1BJVVB19pP81CoUcQ==
X-YMail-OSG: UzesalwVM1mJqSuLYpBRQdPHfjZgfddJ_v7HnnxGh3dqTRjJ_FgM3GUg39rGxmh
 kEC38OWmG8awEnn44Kmwf2YszBETJnex0Iiolpzmajkcnu9TXIa2_7kr942PQoHyvBlXZVO.Nuq3
 UohXc39LQbN58RDHjgUs9X6CFrYvj1_Ukh1NeqWsIJr7eTN3eZKosL7IjvZflIC6RpfzHqDtQ4Vh
 EJwvl58HTDDz_tNhca.jIB9dOyzZWjg.KjIOaXfGjI.uxkUyQgPh5xu36PSgwhzCmK4Tbb0vlv12
 uc57PobrxWa8oXVc1ogqEWKBDBfjTpdlztetmaE53KD6C4pSEt0fTpfVo2R7HTWw.MdVJ_rBDVf.
 RdFteBDZebqHzY5vZpUuSaRrHFOMLanYIvLTJ3f9SjJDKXr_zMagv1CQe3kW4R7.qb_yUFH9vZkb
 _MhKWVmbM9QUB3pssmcHG4E2.4Ua.U4ihVXE58zRs4gg5lV9DzFK5Zc4T0Szov6y7SLjudoS7Y_F
 5klv0SaDFfhDjOzXA9L31k8dFllHbOn_0oboTgAROyFP8OB4_B9mG7urxCbxy.EAhakrDNMbQ7GF
 vILHX9gKGeYjrV5q2jGPXvR745hb4KhpBEbfk3ooRT_89ZWi_ihe5u8uHlWD_ZQpwxBF0OSBBgq_
 q1hEgRrCDwMl9BZ.Irrx.b.UvsR.TmD6TJt1FluEkOen1lGEK6sWSl6goolVzgVkARc38ti8n0wg
 dKNBZGEdImjWRop0IBkRhC0fNl7_sKZR9nZy_SX2CSLGp59TWMkFJVg7tTJgAyLgEcDiV8QToMiy
 9AKNFgyyapEfdrOq.r0iDErVl55mB9wPa01L.7UZreZpn_nVLyiocPfFspKshHJAPvLe5NgB8H.T
 SkPkAWYNmsLmcYfQ61WPjjirKnacgF53tyuWEBaNDxYwepCLQzDHsoMaW6ER_PMX9E.JmXuPVf3D
 V9AHOJJHqA5hkb1tQhIaYFgEkupTWrrdjjUdZIj1K5aLH5DQGwSdUp9iW1x6xlc9YykdkjE5j3.x
 GKHJHivgatIzEBbKnaytedlJJhhkDVSoVDAVscC8S5xZdQxD6VmBjQqzBPHxDLoRwHN4ogmOL5XY
 uT6nQdX5cx28QaHWPA49lsiItdTILcTdrtOMO4lsGJxueSQa1u5dinlNg0NE6.PqtYC59IRcgpea
 MqSn1NcLs783ShAui0GT0m0_SyFxytFu71bNr8WqW6YdBLyIasjLq8K51BesCxsl2UV3quO_FhAc
 5FZ9A1HISg1ivJ9f2_zaiTHmmUwIbo.DPOZJDQV2HFFXnQi0nQosT__En.Dy83Q22yXxkRb_3Ppb
 6KAxnRckESfaxWqTiG5xyXZuELsYD8xfS3_hD83eZ1cY9dlRjA7aX4Kw55kc1d4Kna6pVunU9ILY
 iAqDVImhussu_yUQLo8T935Vg64Kkf1V8q.WsLMOEnb7Sc.LmQ0Q3XHWI6dlutASFMJ_KXzjk5Zp
 EhGoD65bk8VRTTmZcCfLZh0VJccGRSaiCWilcVHcZ4EuD2X_Zb3BB2rmzw3GTk7U48uId1sDZ6NV
 xfsaQ0Z8J4RJFlrl1ELUHar1LKp2u1qTsfdAxw3u5CNFMvOFnZ7eM2FBLraciEmePK2kiYBJdfgR
 fwh44xp8uAvnZNb.nwGCbU56hqKv6X3g6XoKqqo97E2mMdXY40sBjGT6xegKgaxtto_n66gwZ88a
 laWCHov_IglGAam3dLJ53IscwCSeL6o95CH_AJyNCZyFVEzIaTRN_g.91dwTX6vnexPjeOZk7Kkg
 AM0E4ggEdFxQBsrXequ.4EK67KeZoM5cogrnzaFf84WWMO3xo8zGgHZn9DPUA9UQi0wn7JbeTpSL
 ZOmhQ6LphbTk62GTcJINc5L.vdgmMI3WC8QhftR2iXqYeiHiY751Y9x8NgP2.axT4L2NYoEvo0R_
 m4BVUZg.8AEi7E.cdWPWYHGwL07Sx4EK2JGjnJzPwa7sGuZU_3CUNJjhD690V4STe1LKNWRLnDI9
 CorgJtoUL2vvZdCcL4vEbLNW49wlEBlnlu1bbMne607C1DBGtf2ruY664NkJLBT8dlbPsOP1eI8u
 CM.vXqrc3EruFaYy2mhQ5Hv_Zdt20Mz0tXJzOLJfQmmGkH6Szoo52fgRDv8LTZ2hfAbb7hPOsZMl
 DbZY2I8mcPnJzusKTgRLgiYD4HkYnkdlVthEm8YKUIYqAQNf0HsNJPbqvzVb0._c8YhtXCyZBLg1
 E2n5KAUqpDW6JZYLmHuNNVKdqt.1awBw3C3rSVyKN0S4y1DfkG1xcdaj.qO.9WD30GR7hgg--
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 89cf28c5-4810-4135-8a5d-d624a22df7f4
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.gq1.yahoo.com with HTTP; Tue, 1 Jul 2025 11:46:11 +0000
Received: by hermes--production-ir2-858bd4ff7b-l75cc (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 3d62bb3bb3a6558dee9bf77d66b96d15; 
 Tue, 01 Jul 2025 11:46:07 +0000 (UTC)
Message-ID: <922e109fc0f9cd1197674451cc1281cace025f83.camel@aol.com>
Subject: Re: [PATCH] drm/i915: replace DRM_DEBUG_SELFTEST with DRM_KUNIT_TEST
From: Ruben Wauters <rubenru09@aol.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen	
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <arlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Date: Tue, 01 Jul 2025 12:46:05 +0100
In-Reply-To: <8a3ef0b42de25db3faf384260b7abdce468cb65f@intel.com>
References: <20250701025426.262129-1-rubenru09.ref@aol.com>
 <20250701025426.262129-1-rubenru09@aol.com>
 <8a3ef0b42de25db3faf384260b7abdce468cb65f@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
X-Mailer: WebService/1.1.24076
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
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

On Tue, 2025-07-01 at 09:28 +0300, Jani Nikula wrote:
> On Tue, 01 Jul 2025, Ruben Wauters <rubenru09@aol.com> wrote:
> > DRM_DEBUG_SELFTEST was replaced with DRM_KUNIT_TEST.
> >=20
> > This patch replaces the select in Kconfig.debug to use the
> > replacement.
>=20
> Why? That's the most important questions the commit messages should
> answer.

Sorry, I wrote the commit message quite late at night and forgot to
include a lot of information, I will send a v2 with more information in
the message.

> BR,
> Jani.
>=20
> >=20
> > Signed-off-by: Ruben Wauters <rubenru09@aol.com>
> > ---
> > =C2=A0drivers/gpu/drm/i915/Kconfig.debug | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/Kconfig.debug
> > b/drivers/gpu/drm/i915/Kconfig.debug
> > index 1852e0804942..b15b1cecb3aa 100644
> > --- a/drivers/gpu/drm/i915/Kconfig.debug
> > +++ b/drivers/gpu/drm/i915/Kconfig.debug
> > @@ -50,7 +50,7 @@ config DRM_I915_DEBUG
> > =C2=A0	select DRM_VGEM # used by igt/prime_vgem (dmabuf interop
> > checks)
> > =C2=A0	select DRM_DEBUG_MM if DRM=3Dy
> > =C2=A0	select DRM_EXPORT_FOR_TESTS if m
> > -	select DRM_DEBUG_SELFTEST
> > +	select DRM_KUNIT_TEST
> > =C2=A0	select DMABUF_SELFTESTS
> > =C2=A0	select SW_SYNC # signaling validation framework
> > (igt/syncobj*)
> > =C2=A0	select DRM_I915_WERROR
