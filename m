Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A1585234
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 19:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B1336E746;
	Wed,  7 Aug 2019 17:38:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA086E742
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 17:38:41 +0000 (UTC)
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hvPtV-0008KE-8b; Wed, 07 Aug 2019 17:38:37 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 47A412742B9E; Wed,  7 Aug 2019 18:38:36 +0100 (BST)
Date: Wed, 7 Aug 2019 18:38:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Gross <agross@kernel.org>, khilman@baylibre.com,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Subject: Re: next/master boot: 263 boots: 11 failed, 186 passed with 64
 offline, 1 untried/unknown, 1 conflict (next-20190802)
Message-ID: <20190807173836.GJ4048@sirena.co.uk>
References: <5d4428ea.1c69fb81.4e1ae.1008@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <5d4428ea.1c69fb81.4e1ae.1008@mx.google.com>
X-Cookie: Dammit Jim, I'm an actor, not a doctor.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wa3PM2IPgYIbeTotIrjEpA6x+CSggkAquaTMWPLLVlg=; b=un56Q7Y8IugFG4Uzjrf9TpN4q
 qsXduoPza3EzpowKXCYTiHVEoKthEF5ysdSes4U5R03S8qiEPu1sH/blIBC9GQZ8QMwR8pSdr3x9r
 iJHXbncvv8g1qo3flKIEe/gahNUXQbTjspLpxqRj4AfZWPpux8XNeJ8Gr/xBCg4D96cDI=;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: kernel-build-reports@lists.linaro.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0532028912=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0532028912==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qD3brAgIG4LbUq6d"
Content-Disposition: inline


--qD3brAgIG4LbUq6d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 02, 2019 at 05:13:30AM -0700, kernelci.org bot wrote:

Today's -next still fails to boot on CM-QS600 with qcom_defconfig:

>     qcom_defconfig:
>         gcc-8:
>             qcom-apq8064-cm-qs600: 1 failed lab

This has been going on since June.  It crashes initializing the GPU:

[    4.261135] adreno 4300000.adreno-3xx: 4300000.adreno-3xx supply vddcx not found, using dummy regulator
[    4.270254] msm 5100000.mdp: [drm:msm_gpu_init] A320: using IOMMU
[    4.280025] 8<--- cut here ---
[    4.285557] Unable to handle kernel paging request at virtual address 40000000
[    4.288430] pgd = (ptrval)
[    4.295714] [40000000] *pgd=00000000
[    4.298329] Internal error: Oops: 805 [#1] PREEMPT SMP ARM
[    4.302054] Modules linked in:
[    4.307352] CPU: 2 PID: 88 Comm: kworker/2:1 Tainted: G        W         5.3.0-rc3-next-20190807 #1
[    4.310391] Hardware name: Generic DT based system
[    4.319353] Workqueue: events deferred_probe_work_func
[    4.319930] usb 1-1: New USB device found, idVendor=04b4, idProduct=6570, bcdDevice=32.99
[    4.324201] PC is at v7_dma_clean_range+0x1c/0x34
[    4.324214] LR is at __dma_page_cpu_to_dev+0x28/0x8c

...

[    4.753642] [] (v7_dma_clean_range) from [] (__dma_page_cpu_to_dev+0x28/0x8c)
[    4.761795] [] (__dma_page_cpu_to_dev) from [] (arm_dma_sync_sg_for_device+0x4c/0x64)
[    4.770654] [] (arm_dma_sync_sg_for_device) from [] (get_pages+0x1bc/0x218)
[    4.780199] [] (get_pages) from [] (msm_gem_get_and_pin_iova+0xb4/0x13c)
[    4.788704] [] (msm_gem_get_and_pin_iova) from [] (_msm_gem_kernel_new+0x38/0xa8)
[    4.797386] [] (_msm_gem_kernel_new) from [] (msm_gem_kernel_new+0x24/0x2c)
[    4.806501] [] (msm_gem_kernel_new) from [] (msm_gpu_init+0x4a4/0x614)
[    4.815021] [] (msm_gpu_init) from [] (adreno_gpu_init+0x17c/0x288)
[    4.823342] [] (adreno_gpu_init) from [] (a3xx_gpu_init+0x84/0x108)
[    4.831239] [] (a3xx_gpu_init) from [] (adreno_bind+0x1c4/0x268)
[    4.839224] [] (adreno_bind) from [] (component_bind_all+0x11c/0x258)
[    4.847213] [] (component_bind_all) from [] (msm_drm_bind+0xf8/0x638)
[    4.855282] [] (msm_drm_bind) from [] (try_to_bring_up_master+0x1fc/0x2b8)

More details including full logs and the image file at:

	https://kernelci.org/boot/id/5d4ac1e659b514754b31b293/

--qD3brAgIG4LbUq6d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1LDJsACgkQJNaLcl1U
h9Bg/wf9FixzsVlkqiOzvwUv+Hd4DpypmROaAhSbozl77Dy/KqDn4DsMIeuyKhYJ
/I2KNn3yazKyh4NA02GD7/lL0Vw5VmEw19lNqIC+m7ozQK/jTY/Qc8R1BpjfVooy
s2IBQ8/PyrPP0s3q5quTEfKavfDQU7YcxMcMaT+XNNFO1Jf66ZWVVHvPgCprafQd
eWhy8i07WPZKdFlh3jpnUKTmm7TDOvF6grnhF8qS+ZhEN+5Bfg7qhrUKc8TM7qJX
G0+WdOy8ph6PZVqXlUaWkXz6prKdEkoMrfGOl1Pwc0Bh0qqTyctP/RUiXg8Qeq5C
KT5zwu4px+F5XdIadLwwqgMn46XoKA==
=cozE
-----END PGP SIGNATURE-----

--qD3brAgIG4LbUq6d--

--===============0532028912==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0532028912==--
