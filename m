Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EC5AEECA1
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 04:59:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F09A10E4DD;
	Tue,  1 Jul 2025 02:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="r7HnFznl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic310-22.consmr.mail.gq1.yahoo.com
 (sonic310-22.consmr.mail.gq1.yahoo.com [98.137.69.148])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2132810E4DD
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 02:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1751338760; bh=QncXrhBWoZyfStRoeWX86SBiHK4kerChKRWDNNe+cMM=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=r7HnFznlPnIobPxvrFL4vpY2pDKZaPiyUbTcdzoR44HtXn0CJf7Z6Kdlpu5KFrUWdCCPVls9kAMMmNt6gN3QDi+yfpjYliVSVFtJ+2zJsFRjXWuKP53jqzTqZEA7br2JWNtIqlpOOCrY7T27xRasKgCG+5iio+vYztUyWfrgOVVcUkGo+Wsjv3VmbtQFOEVQSGaeGQ2ogtH+fFyKpTaiNsWmZ1b+e3Reus3MeH4eXzvLiqB4JeyGnF5JvxIFn8TNp9kNIMpcpjOGlVqglIVzN1TfYSEk5rbTUC/fn0gmzFSb69Zp6Mp3i+6VIc2AR9XoINUJF2X8wXeKniUFhznj3Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1751338760; bh=JD/g1Tkq1X5vsw2rSB9wzpN7n4Z+Vlzxln33+YWPYOx=;
 h=X-Sonic-MF:Subject:From:To:Date:From:Subject;
 b=ZODCe4sedIEiSErcdtP8Ap/ciczFqHXJkFUoBUQH964bPWi5m1/ZSlA2eB0fAuVcDhPgIc2IwDBF8FAH9DUcRszfQVnAZbr/7tgzDIUNkM6CrZMQmaGZvKtB8LhFZwBSCGm6ryA0Xnj24BOnByugjzmSfMuI1vaSW/OkMePO0T93oln6x4cqY0ni6hgfVTxLf6vrMc1Mp9i83nKCYu1ly3ciGq4UkxLRA+Av+LCkisxHy9Cg29ifYZdmAfZYsCBV1kOzmGARFoqx9bljo33KK6Lo1rcMFVcRF1e8cUPVBD20qYIeO+E2r/EuzXrrjY/L4zIHUE/HQp9WFAjOVh9BVg==
X-YMail-OSG: .rhQ3wwVM1nSODRfzIuPbiSSRXkg3P9APAsqYHw3SI4BTC87lZqnv7jB9ZT9GEx
 IpthOs_9mm3h8ldaLchxk0qFWNUUNpm3thIX45mwgHyRpBrYuifPMusyeuF3ccoS5bNYUt45lwdn
 496qeVlw5WBWOAfTieUFvaxOm9H7zs85pVAqZ_QQqJeHlpxbL39jPRd52xKu92XyaMgHXY_HDnI.
 eZIMgnjNZzsUL9KM4F31QrNmtzPHxXovwTvL95Cen2xUQHs.tVMfNhyV_pindBTqGGABxJlgRGnu
 CTQE5yI_63yPJ8Mwe7KZBo3A_gRFTIIkCzEz1L05SWdrvAdI.xUcg.9zTR.PJqKK4AUpyGbvq1lJ
 cZT5NUvXu5fMEaYDbi0TgHWvDpr3fJSsEl4IUAMuhOunPnvRpnibVv9AMvdh3xU_kN.KitgX2dpm
 vjVFCgdLI_xWO_xW6Dn0.0N3h0yfn8Nq3tLDqElcu9FnMRbFETMtOhHrBFzR71JTxHlwVG_qQd2a
 wHgdJRwoRp1s6r4kNPvEC1o_DrEWfUn031PnFV6OXvuIhQnnY4wsz9lPUpNXPV10GSwp3x4iHmEL
 dCg4Kf1_IG7MwQBCRy9O8Kq4XtgYoyTnzSu64nlhWXUVtst8qHOm1mKuqNlv1h2nQ9eGVPHoEOb2
 iGr4Twt8x2ozDaTErbnWnniqWVF1uEfkEbhChfKE2KZ.XGEEYYiW1xmgiVgpHU08FbgfyXj0r8Yx
 3ZRrSd3WU7POh1msKs3wPrzIxxeVQiTYmanWvqt2EazascREFFP3fbR3Sey4oJ3t6aySpBNCApQ4
 u7jCkfurZTiONqdtZE463erUtRs6NNdQAu45kRLDgE8gveg6gj87QTYnGWtGp4ZVVtE2sTXPif.n
 .cHXI_OzmWBaXazKY8fa8VS0unNRcU26mJw0fJoGCbee2Th0833MdzsLmaEzSMmaBexEF6Q0M1lc
 W19KTSAr89mpTpZx2d7uWILbe.P.XZzEPHsboNaPzAp9jYibk6gKrEg.HrwHyt0fBoC.xoiNOeYN
 Hd7exU_wzzrL5WeGJMUj5rUosQ3ORA.c0o_BtEx_sorohN0BRW8rWaNC5aCVEOxQroolVV9q85oZ
 KrEIbLwEvNs69AldUf.t.bpCY2LZyqmnrhOUawGTXDqe_SDiVc0VYVun9nnWR6VmFdRM8fH5oA.o
 CP.LJ1hryAD9NdcESTow_Pm8A.vGASAWbYFLr5Asl5IRloWgnBT7OEoxmyYXPhNooSKS5eqozYS3
 c6E7VT.d6ui_WtbeeFKKwrYzdvTln8MuWRj.It.2GWjIHs7BqK47wnbFlLSHTfMjXDGK_ZY9fbtt
 d20PERUOnjWxwkJqLjz4rQwpEkyjh.oDqPo8iY5I4WSAhvLXDqe9GlcjkvhPPlQQs3szbJHBKstT
 O_7ErSDm9gz2HISy_.9HVE_54CJ_Omn9ufHvtoRjRaFfW1O5.ZZDiFJdwRA7uUv4K6bVj_8fgC9N
 NFwUIMYfwAZqLBr2m3x1709eJFt541obQ8Vxj3b6GphjgIFdAMm1QqaBOGtNRYXJqa6S7y0BZN.m
 dUXkpZp9uj4OWtbtYbrMXF17PR2gGJYpn3AwCraxQn7EDhcxcH8Zf5MnkgZMlyb7Cgw7I7SAFC2I
 2P9fanZfSSEkyyei0o4osTmUnMZbRDH7pIT4c4Fqos113bjsq95jscknc8x6x_wChj1Fb0Kd_iVE
 TR2ogcMx43th7xEmS0_tstKgIKfigjgFod4sPU05Gc7yPMckmBr_MRWq.HVZIlRGv5vSzm99iAqE
 cQ.qDzNyRdcXGZcSZoTQyJc1ujgkJX4neBMHlgSDzUs.oD6n0t9v7Akxq3uD1MjlOu2oH76I2N5R
 H5ud2ZPlxoznHhbCuozhXDyRmpRxIqnvx1GIAa05mwy1bv26Uzc3LQWNYpHvpic.a.gPVdCztVK3
 FCuFaYEOj9n0VIs4NC7pGZhrFRG410niIhGlKKXMLj35NVzbGGy6vXEypcVvKCDbNKRnfEmcZ4yg
 18RXMjt4V4kJhCrsdEkH3WGNmGV8yHsKyxeDPfUzXfvoY0APjdiaMkz6DwKPc8L3fU9O6MH04ODO
 _6MxDbw5qrFfqsrlLEgg.3XcCBWFrBknBQTpC8NowpL6Irn5Ql5hYOSSc9Ud0xqCFJPD7vy2Q9VI
 JvSt9314e3Sv2SBEJkUMbgUTlgBpz357zBXsWaEW0pKTdZMzOkThlRca8DKfmqrxWYnRxWXaWfmF
 WeatraFYpV9qOcK2CIwTmzIr5CQPnQaB8h.Thl6l3xnpGYEb2qDakWGtJk2pLja4RHdWPOQ--
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: fb9aa69a-2d1e-4f1e-b6d9-b0d90b6f6c28
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.gq1.yahoo.com with HTTP; Tue, 1 Jul 2025 02:59:20 +0000
Received: by hermes--production-ir2-858bd4ff7b-86wkp (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 6689a8ae3d4d560dea262125f11816eb; 
 Tue, 01 Jul 2025 02:59:14 +0000 (UTC)
Message-ID: <270d7d993e7d16c7dedb7709274cbdb3c853bf09.camel@aol.com>
Subject: Re: [PATCH] drm/i915: replace DRM_DEBUG_SELFTEST with DRM_KUNIT_TEST
From: Ruben Wauters <rubenru09@aol.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen	
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Date: Tue, 01 Jul 2025 03:59:12 +0100
In-Reply-To: <20250701025426.262129-1-rubenru09@aol.com>
References: <20250701025426.262129-1-rubenru09.ref@aol.com>
 <20250701025426.262129-1-rubenru09@aol.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
X-Mailer: WebService/1.1.24099
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

On Tue, 2025-07-01 at 03:50 +0100, Ruben Wauters wrote:
> DRM_DEBUG_SELFTEST was replaced with DRM_KUNIT_TEST.
>=20
> This patch replaces the select in Kconfig.debug to use the
> replacement.
>=20
> Signed-off-by: Ruben Wauters <rubenru09@aol.com>
> ---
> =C2=A0drivers/gpu/drm/i915/Kconfig.debug | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/Kconfig.debug
> b/drivers/gpu/drm/i915/Kconfig.debug
> index 1852e0804942..b15b1cecb3aa 100644
> --- a/drivers/gpu/drm/i915/Kconfig.debug
> +++ b/drivers/gpu/drm/i915/Kconfig.debug
> @@ -50,7 +50,7 @@ config DRM_I915_DEBUG
> =C2=A0	select DRM_VGEM # used by igt/prime_vgem (dmabuf interop
> checks)
> =C2=A0	select DRM_DEBUG_MM if DRM=3Dy
> =C2=A0	select DRM_EXPORT_FOR_TESTS if m
> -	select DRM_DEBUG_SELFTEST
> +	select DRM_KUNIT_TEST
> =C2=A0	select DMABUF_SELFTESTS
> =C2=A0	select SW_SYNC # signaling validation framework
> (igt/syncobj*)
> =C2=A0	select DRM_I915_WERROR


(apologies I appear to have mistyped an email, I am sending it via a
reply with the correct email included, please let me know if you'd
rather I resend it)

Ruben Wauters
