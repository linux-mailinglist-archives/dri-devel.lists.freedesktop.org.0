Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEFC7F6181
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 15:30:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D58510E764;
	Thu, 23 Nov 2023 14:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Thu, 23 Nov 2023 14:30:50 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620FA10E764;
 Thu, 23 Nov 2023 14:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1700749851; x=1732285851;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ohvzPpwHho+Wozsk3IfdLQvS5IQE5RYHnNIM727nKM4=;
 b=G/+n9DcuBCRlavweXz9iaeMACm5vMIZviUmWld7RK3PHxhpwszu4tazP
 kPbuRvheRzBrSTKfS6I5i85+Htw35N0HGjRRYkY1usk5vsYTuVjz/3qew
 HDuW0eqTHOTfyoS2aF2dfTgShJEBnBkpP+/9ZCQ5KlzFEmW4KuvGFT0qZ
 9ml1+AOP9wDr/LEJAGFxsMwbUP/EYhGHjEs1uIJMJAmVhbf0frvew4RJS
 MWH8UjCUhOmPFC/qEMqoHxQ+LaMuZuloPe9aj1ubhN+9o28YWSgW8Wdzb
 kd9vEiicC6lMPlfMFmWVddex9K2SQZPcTMmB2KlaOBRwi6vbuy10ha1OQ A==;
X-CSE-ConnectionGUID: PGZ2z8fJRMa+agPdtt+bKw==
X-CSE-MsgGUID: EwqpIQk1Qom2mh0R2QGlFQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
 d="asc'?scan'208";a="12194934"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Nov 2023 07:23:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Nov 2023 07:23:32 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 23 Nov 2023 07:23:29 -0700
Date: Thu, 23 Nov 2023 14:23:01 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH 3/3] drm/amd/display: Support DRM_AMD_DC_FP on RISC-V
Message-ID: <20231123-headdress-mold-0dd7a74477f7@wendy>
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
 <20231122030621.3759313-4-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PT94HBO7SSDOZxaP"
Content-Disposition: inline
In-Reply-To: <20231122030621.3759313-4-samuel.holland@sifive.com>
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
Cc: llvm@lists.linux.dev, arnd@arndb.de, Leo Li <sunpeng.li@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 linux-riscv@lists.infradead.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--PT94HBO7SSDOZxaP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 21, 2023 at 07:05:15PM -0800, Samuel Holland wrote:
> RISC-V uses kernel_fpu_begin()/kernel_fpu_end() like several other
> architectures. Enabling hardware FP requires overriding the ISA string
> for the relevant compilation units.

Ah yes, bringing the joy of frame-larger-than warnings to RISC-V:
../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:58:13: warning: stack frame size (2416) exceeds limit (2048) in 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-Wframe-larger-than]

Nathan, have you given up on these being sorted out?

Also, what on earth is that function name, it exceeds 80 characters
before even considering anything else? Actually, I don't think I want
to know.

--PT94HBO7SSDOZxaP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV9gRQAKCRB4tDGHoIJi
0jEnAP9OKVgfXZxGyPpXzUcsNSne5N1ezJDKqBB32TBdrtW7vQD/Sd98JmdWJ4g8
Labru0YLH7jrvDUwLAIAnldCPJQbfAw=
=HKiT
-----END PGP SIGNATURE-----

--PT94HBO7SSDOZxaP--
