Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2C0B0A5B6
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 15:59:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7625C10E9C4;
	Fri, 18 Jul 2025 13:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="QMSiAuDa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic313-19.consmr.mail.gq1.yahoo.com
 (sonic313-19.consmr.mail.gq1.yahoo.com [98.137.65.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C73610E9C4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 13:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1752847157; bh=xlDcm35ixtgi+pbQ7WX1OAnd8ZFAsOTKZLQFPPtefPw=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=QMSiAuDaQBVMjg80xRFq3eqmBhNbgF8utaI4voaH06v72GHK3VVEewMcTiDAS9Qy/UMawpKZSQGAy5kl33SikCwTXpCurslQbcJi3uVELeVsLnwplPXtPeoGPZpdMDsccB50UCYCzLyOrbtjo9FI2yoyqWx8jZl9xx+iQi80Evttmrsj3j2/2KWFx2L+D97bR3jtGtz8T0PINX8342okB5XWmzp3L0wtj2YTDLbp8tr7YBkKC8nVBOnjPijzyp6TNo8Gyve7vd9XtUk5pUuBptOSGboA6xz7+2b6L8AfYUDoA8m+0fWUTYQUeMUxMmUeEszTbGk5lEOe5O6UaToktA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1752847157; bh=BBpYITgO4erzMpyyoJut/vilH8IJK0kMDSdwINF8SPW=;
 h=X-Sonic-MF:Subject:From:To:Date:From:Subject;
 b=Ygf9Ll+aIJt7BdN1Ns5pCdSqhFXcxHMNJ9fU6iv1R/z4zKXLy8kaweeroHdDl3W3Xv6sCS1V0AgVh4deV4Os7UGL8c/aFN9ba805oCy2ryH0juupJgypQKZP1C5Rn9qdhka4NUwFHJcBJqtDqjzQTrXNT4F4OLTRBP3KFwzwnugodWhhnVmFXFi0aEDK+ohy5r3XG/hOCt8PK1C3HqFLbL5NQDtpIsntwZDiyGF/Gx1FrgdeaKxjuBCwf8m6sWjPz2e9nnubBEiTtukD4hLKeO3f//RvXIbfZLcwew+Bvrvn7BZcwAijV+KSvmBuRu0sMfXz76ESAJGhpAsaW76CHw==
X-YMail-OSG: bKQ8ojIVM1leJsgBudKeJ77_HG2wHR4fNd6M2bZRgK0zDjtvffMFz7UFUcy1fut
 TrTZXkOA226ZcIePScvhr3HxnPo_PJxFAldTFGWEmtIDZiFNARTlueyfQJ.sNFLrawOJKTe5gTh.
 G8KCIykRkSmFWnnWJnX7UY_2NI_wSCrXFbxRP1U.0m1gCPGwDg9U7EZkDlom2LvCWgk1rLzaI22Z
 fZq1r2O4egmHojzQyfKKszwJMpVpXbagbAp1Cnnh31qnrrcF3Hn_je16TOAvPbl.U7aRIPKEYlZp
 mlvt3sNE1dkdLtzy2bA_3O3fpIje9aRifNTX0o1gB2o9Mc.kunxBG_I2n5mJtk1p0w9PX91OWILB
 iBprVOMHRA26rPyUnEJ3ov457rnBZ6Wdfcz1IaxkUksbeVk0gX0cQM1T4pxxbiM2DxlxxbkbTT80
 fP.MrbB1mVzMM4NN6HMUrGzo7RPH5eMCK4106KDBor3HHDJtxwQZ9ucr6RWtOBTbu_gNHgwBRATo
 JFCUlQ4KRxtZMu3Uyn3MgGVr1gt7POWMZha.DmqOGKEzR7AkKZrHWujeL7qN6p8qWpx5IQuYCwXP
 T..NWwke1xSLjgdyiW8T93UUMQe0kxdpm_E7HmGd77n8yzjPP.QZ.VY_19_6v4gyXqvC.617RaWc
 TITE2Ku8F8L5a8_nj1LiaxM46Ii5n3cnl6r_JTdhIXjE365frbFKNnvG1cvpd1XwLt5AE.Q5o.TV
 ntRRup9RTzPaC9IPoibmoIRgSFME1AaOoziV8JZzQdP_rOhwDF7FgyInGptMXxhx449c6shlxxm3
 LoG9cb9Egm1jwKNKM6K_gM2a8G1FicG_U21P6UWubI.JkGOvF5pib3hn2xXqlw3zXMsnbcOjJjnz
 CD9L91goXTeCUCTXpWfePMtNm6P3nz.pfxzaGbM81JX3imLFb17Y9U7.AzxjRwxOgqzB22DiMmTe
 BPgyXQIgKFsUQKwhE2WI4hEDdfRYcKZZgcSMPC5q4fJBzYYwF5FCtdRBsenFxVv2OMgHUAVS4qDd
 pE8TdyrzGzUg.fLOL4bTnbG3ns9p9BYSC8O_026Mv6QzUGfiIK5KmcrCWz2.X81HdSDO7WRQ0RE_
 ZfdNbJ6L_4zEM7VfK6TR2nJrl7kBa1tYs5MNtqCkySdD.KAx.RXpTrkCJLqIj5ZQmzPXNlRFeQ7g
 6MkjW.Hb2gJDXk.8YcOPsd086k9ElRb_ZO4H.hTh.KWxSGBfa3xCNmqf8LuPc0h7fZrrcqUH_XwZ
 CKYxI6ZvxCjxbzhLyZb5mPqWKmrw9WNI9oXkj9lnatfTQfF9mVlUe94NnchiyWyxVENwTBc9xBE2
 U9xeFlon0mXt_wtteeQkUkOc6FHMSy6eGm4L3lmgJjKQxjnNZaVY.PVqZ7mIXlpvEzmNjjxhHg.J
 VDf_fm6E3Y7r8O2oVzcFTfGsrVHE5UmdD9BQV9kMfvG6RkWlfWjXKqHaN.FSlxJ620wdk53z5va_
 DtWZi05ylFcZe0bOZwhmtN1Chc4Wk4mak29z2S5bmAG.J4uasEqsLKPFrMucCmAa2h0lmZ8tJiVa
 uBKyfPgbVgIPMxRkjs.CHpx1LqeWFCC4a2cqHpQcEs9ibUlHzKhobbTA3iPps2PKOy0agn_w94e7
 LEawl0RyLOeBzaEPPzaeC7ZhHvfKOfC5gyhGSw98u3A5J_YjSJEBPCFDFYZg2CWQmtSL4xbIl6yq
 d2NfsQvafcPvWHv8e0Q9zP91HcXAJeBFrT2Netjf8mAX7LeyLLWtsAjcxuuyC5LGIpaDSJfZ_Ep2
 wbo24KScnTtoWiFe0MBgyyBQNfnMBvxHvq8T.vxaXErHvJINMX6cHyhT6Vs3YUSIS3vWERN.YeVN
 .lk0ASVh5etG8RZEEnU20_TeSWVWhJ1MDJQNQ8Y4QbFafJSH42coZml7YBY0Y4TVhOTH3Gzfel3K
 FKmSHpR9mX.hisB1FDRhPKmt1oEBeDWl8Ncyj.jJnMkf.DT6BcbxpSRuv2TKalNsYqQV_WR.My6c
 a2DIhLDpPcHkqA.U14IJ_o570JJ2wuExFuCXwugvJlsteL1LzyvgsxDkYrl2Hzm1fPKuQGDt.Tj6
 LnZEYO_xEwVc3erowyJXXrlTw4KT3sZ7T9NZd6W7TebdUGpETw5eYASXS73M6n22_rpM5iDiH1kJ
 o1skzTIB1AOuUdohcV.EMvo.rwDEHIqRW0uxU7CWxVOkXRq4RGs0wGp2TdRU6tgdY4iAXeSYMg__
 LsdAY0ZNsFoocsg--
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: b130b56d-587b-4520-8352-815a588f6d00
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.gq1.yahoo.com with HTTP; Fri, 18 Jul 2025 13:59:17 +0000
Received: by hermes--production-ir2-858bd4ff7b-bdxql (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 4f1b9f37bda0b86da932075cedd6bf0d; 
 Fri, 18 Jul 2025 13:59:12 +0000 (UTC)
Message-ID: <ea5ac37cfae72d312c47ab1983dd1fcb59edec28.camel@aol.com>
Subject: Re: [PATCH v2] drm/i915: replace DRM_DEBUG_SELFTEST with
 DRM_KUNIT_TEST
From: Ruben Wauters <rubenru09@aol.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen	
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Date: Fri, 18 Jul 2025 14:59:10 +0100
In-Reply-To: <20250701115511.5445-1-rubenru09@aol.com>
References: <20250701115511.5445-1-rubenru09.ref@aol.com>
 <20250701115511.5445-1-rubenru09@aol.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-Mailer: WebService/1.1.24187
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

On Tue, 2025-07-01 at 12:54 +0100, Ruben Wauters wrote:
> DRM_DEBUG_SELFTEST was removed in commit fc8d29e298cf (drm: selftest:
> convert drm_mm selftest to KUnit) and all functions under it were
> converted to KUnit, under the DRM_KUNIT_TEST option
>=20
> This conversion however did not occur in the Kconfig.debug file in
> the
> i915 directory.
>=20
> This patch replaces the select for DRM_DEBUG_SELFTEST, an option that
> no
> longer exists, with the correct select, DRM_KUNIT_TEST.
>=20
> Signed-off-by: Ruben Wauters <rubenru09@aol.com>
> ---
> v2 changes:
> - update commit message to contain more detail about the background
> of
> =C2=A0 the change and why it is necessary
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

Hello, I was wondering if it'd be possible to have this patch reviewed.
Having an incorrect Kconfig entry isn't ideal and it'd be good if this
could be fixed if possible

Thanks

Ruben Wauters
