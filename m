Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C90AB349FD5
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 03:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7822A6E122;
	Fri, 26 Mar 2021 02:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic312-25.consmr.mail.ne1.yahoo.com
 (sonic312-25.consmr.mail.ne1.yahoo.com [66.163.191.206])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D9016E122
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 02:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verizon.net; s=a2048;
 t=1616725900; bh=fxAupcwc0ghGC+0xyGJqErmzSGQHKGQELQbH8WCPT1g=;
 h=From:To:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=aXwsY516ppSkp6CizJtBLnJ/pnRwkxprRJHDFVXXMTE/5i6hF/KcJpygyKwltz0aTAl1B6oqefYyv03CQM5iaJbtYNrpEstGKjGrfnq7IZ58IbvYDmmUE+8TFanv4BLiboDJJNUCeZLT3fGSm+6zoXTS9ADDIHTSgXDe08GDLTeKtTvX8W9Kl80vX3lvHNWtdY3xmFGXwNuwayAGVTLPGLSfqiEeUPbJLXCdYQCFdU9FDSvk/tds13nAWknEKSpfM8RTmMPGWFuooDrg/m2ehb/RYvG1ots5d6nuGMEEQ2ilef6gzQ/MTdNOz80K9Q9+WXx/ATndDDfgSWYCR88RYA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1616725900; bh=wsrzSnNCsagRvtLZJUPsdUPDIy+pfwVikSqZZqEcFfX=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=QyJz89Wxh/qSitAo2VrmeOzgFOczVXo+wKaAB9zwz9TaLyQOBcFxdqLjKlPBnZj3dYYGNRyEhQuFY9VToxA0FGgR88l0rn80OcyVtBkO8oWiRTkxmdlogP7bLKPhdpHiXmduypf8xfTIXlakU/3yMTR3GIjNvhh4cNfqgnZPsdXBEg1AxkrJfTEC93TeVIPsA+qcVeuajokq1EbHlW/p4vJ3AZEcJoa6EBc8Gphnh3e19zIrd+r04MldVvweBxwDm9dLYTLFxnn32IZHBc/ajgm2aHKkP52xrCw1slgQ7CZfPKSC+fwaWY5Opak8hU+eYHTEHSIRZilvOtNrtovSUg==
X-YMail-OSG: I_M7eBIVM1lztnVkdu0nMQB0sI1I2kqTOyYNLwZeeJculBJ40To4m6bKnpTBpGy
 .VZABTP.QisJhNq9y1oCdrwBiKcQjE2_7vJKdozcRZfGXcEzh3yks5wMy8aKKWtKaLGLzIVb4CRa
 m8.FeLHBSGL49IljO5w4gLW6YVa6RVJAYgsqGRN88SEK4k_tkcjU1dBYDNSVD8_o87XatDEEEmAK
 ONbJ2sdhIQa8WN6iNaQ1XJCLcfbRcg.pstXa3HGb1MUmNyHbBA.Uw3UgRIR2iuIgC9LAqsJFLzKI
 ChA.egIxUZO7ZtMQccUIHgpHib2S2Xk8ClMJqmCJaUcdSrz9iZxIzbpMrATbnYiNwUnbuRf4aiiQ
 Qifk9vCs4_RWmod4582WWESYS4fUIcPRaQmha8Wku6_h1OqDyfMM_gtyPpxL5reYY3I_OudpEeyk
 W9ODCY6ArWtUzi48aLosLZcILBk0QPOVdOYVBANr4x8piJSAs.6_GABRRmHWIgB6gAtiMD2GzKZ9
 wFxL5EAUI6V7Q9CTkGVfCFzfRibcZ5Y3p82orfMSRv7FPOHCi0ppk6j8VLkhdS7xK_t61JDSvLYx
 eOtMHHoXWPYXFPF3DnrnLE7_nRCS72_zIBsGALTimctKmIQ09DHNVJX6_7XUiq2L9hId0B0PUAJW
 fVbvHFszQVIvo0otwkUJxLGd3U_0CRqlW8bx3moUe3LBdZQLVGEHHRr5jBTTtQ09ygT_tWSq_MaC
 4WwzQPLABFgFjKHAQRd19Oyu6EANHXP.KSvPkuT_OU0PlS.ISxoU0Vnhr_vq_cpBzh5WSWgvqoP7
 ..u5vc4TcFiB2aaUUpccNEAHB2RYiLZr.9MuZeGXVBz0lk9mW3coRI37r6pEoT0UG0H8hM1EMRP_
 kop_2EoR4QM.nRG8AZb2jSDJkarMPlwiCMaLIeXRmw7FVFQ84e0NpWlJYGIM7DfWXhBLR_Ho_6SY
 tTZg_dP86tqFKd1RcyUilmqGmE_vHADySkBxV1LFwg1A4xlBblUFDDLYxTJm97_Lnm4sawAw66WB
 eVQEiGuuOq8vUqV28YTuVKkf1TmgOsN3oxNBbdXMEqnz4YHNlJTLWyeseFa_277AciwBPRNyDrfS
 wkINktgL74sXyYbb18eBlHh9LtCLB.MKObKEHqpTQvR4eJCZTsrKArR2Krbjeg1laf5ZR9vYprku
 wleOpTHoRsZH9yn81F0NBdWGp7bt7odfj.uBlCf9I8vf0g7F0YBD5tKwXMR9TGqM6dDTee29UmQF
 gCA18ofP5lEHiWRugrK_MXHlY6uKSh2bZL128S.gxq.vDrKCfnpXJfA2IDDVMJKBdh9m5TtZKJc0
 2H06nwUD9DTL_DX1xmOkRTKjoBspCa7Kv5sGGLojPsMaUJN7oLuBP075ubW5LT_M.9EPgjnfhlS0
 BWrpCQNFszIB5CQEYPmFQzvQK18mLeqNYk5bX14LazmEU28oHHMuVQTQkPvnFgMHzTpoZM79ckCX
 Ki0Fo3rLJMw1WLUT6_cO1RWd1xBvA1tWQteE0eleDWBKl3RPZevMdy5yIruuwkI73JSpGHsaGbln
 6x2SwFLXIbi3iM1lfDWij02aaQS5sbvVmhnPcUCz8jjGsMMIzuRfIpRPfP7zrYQACGnU6vT_54pL
 7pmDOYVF14BOQLCWgQCls2iuucsMlqyBQ.LTqnURWzxqKYUegJA6zUfktnelQ8rxCYQocxxnz3NG
 U.wuatd2I9Su7v0UrrgO9X8ZFExFp1X.nUnNZ6WHK8YhgzySRTZsg_G46xvvOnY9cRvmZmVd7DNJ
 BLB.hQiSfCsXCeCdngPYTkvw20s0iTT2WqoTCm12.Ogwzse4rOxKzumKRgeoRKw65PaDlHfiKSAR
 0u77jPs45f5IK29S1cmQB9vnEeoj2rHpDBp.TDpdR6kv9ROiNXvw8abgqr12x898e2wHo1xDvBB0
 XkyweUoLXF8KdpfrMWGK6yb3sjS2QXCCprdf_zfSNOnJU33hafxyHmLQlRJqk6giRNsD.GqkWJt2
 _yqX3U.YrCEbRe6h2fCRjws6sXWpxPLsdElMxA1Y4cg15ksmqHjNdoRSdN1F4gcv_bEgKGLUzKa7
 SsVapAVrEcrGg0jgYb0NxBlkIK42KeaxmcqR9JKhXM2Zdn6Nm_qmDu_qRkEmQN4VF59CsGdeOPAY
 KsDg4aJdRBWr_urA533TeLMqzncbOz83rlhyaq.i2KnhLsVC27R07BhRm2HHpL2267B2JmHPOTUW
 QRmWTOtVwDOrjQxFDfxxsDNfhP9dSReXlj33YB4CWCypoxzcIS4D9kE7eNvVYfOcPAIQr4IEKloj
 FzWxptAvsrnvWVFpS_sRoJbKICD6YcpoHh7kVR5sWcn54cvaOSPLHbmqvYCDIXq5ORZzQTVpiM7n
 PZphU0.Q5l6SysFCQAsbk5O43VLPo9but6dEWZClIjpJ6r08pLLhxDwTX_IXn100VgedNjH86eH9
 HwCYvfqNoxcIvIwnJryEyrQOXY.pP1Z4Q0mRAt8UVqVOdtVcs4ZNnGPQFd4zkQXnV4JG72jYED3M
 Ou_ryJg--
X-Sonic-MF: <bluescreen_avenger@verizon.net>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.ne1.yahoo.com with HTTP; Fri, 26 Mar 2021 02:31:40 +0000
Received: by smtp422.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID a8231d142918328d4caab0aa325c5def; 
 Fri, 26 Mar 2021 02:31:39 +0000 (UTC)
From: nerdopolis <bluescreen_avenger@verizon.net>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 00/10] drm: Support simple-framebuffer devices and
 firmware fbs
Date: Thu, 25 Mar 2021 22:31:37 -0400
Message-ID: <1835728.ynm6b5AEHT@nerdopolis>
In-Reply-To: <20210318102921.21536-1-tzimmermann@suse.de>
References: <20210318102921.21536-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-Mailer: WebService/1.1.17936
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
 Apache-HttpAsyncClient/4.1.4 (Java/11.0.9.1)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, March 18, 2021 6:29:11 AM EDT Thomas Zimmermann wrote:
> This patchset adds support for simple-framebuffer platform devices and
> a handover mechanism for native drivers to take-over control of the
> hardware.
> 
> The new driver, called simpledrm, binds to a simple-frambuffer platform
> device. The kernel's boot code creates such devices for firmware-provided
> framebuffers, such as EFI-GOP or VESA. Typically the BIOS, UEFI or boot
> loader sets up the framebuffers. Description via device tree is also an
> option.
> 
> Simpledrm is small enough to be linked into the kernel. The driver's main
> purpose is to provide graphical output during the early phases of the boot
> process, before the native DRM drivers are available. Native drivers are
> typically loaded from an initrd ram disk. Occationally simpledrm can also
> serve as interim solution on graphics hardware without native DRM driver.
> 
> So far distributions rely on fbdev drivers, such as efifb, vesafb or
> simplefb, for early-boot graphical output. However fbdev is deprecated and
> the drivers do not provide DRM interfaces for modern userspace.
> 
> Patches 1 and 2 prepare the DRM format helpers for simpledrm.
> 
> Patches 3 and 4 add a hand-over mechanism. Simpledrm acquires it's
> framebuffer's I/O-memory range and provides a callback function to be
> removed by a native driver. The native driver will remove simpledrm before
> taking over the hardware. The removal is integrated into existing helpers,
> so drivers use it automatically.
> 
> Patches 5 to 10 add the simpledrm driver. It's build on simple DRM helpers
> and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers. During
> pageflips, SHMEM buffers are copied into the framebuffer memory, similar
> to cirrus or mgag200. The code in patches 8 and 9 handles clocks and
> regulators. It's based on the simplefb drivers, but has been modified for
> DRM.
> 
> I've also been working on fastboot support (i.e., flicker-free booting).
> This requires state-readout from simpledrm via generic interfaces, as
> outlined in [1]. I do have some prototype code, but it will take a while
> to get this ready. Simpledrm will then support it.
> 
> I've tested simpledrm with x86 EFI and VESA framebuffers, which both work
> reliably. The fbdev console and Weston work automatically. Xorg requires
> manual configuration of the device. Xorgs current modesetting driver does
> not work with both, platform and PCI device, for the same physical
> hardware. Once configured, X11 works. I looked into X11, but couldn't see
> an easy way of fixing the problem. With the push towards Wayland+Xwayland
> I expect the problem to become a non-issue soon. Additional testing has
> been reported at [2].
> 
> One cosmetical issue is that simpledrm's device file is card0 and the
> native driver's device file is card1. After simpledrm has been kicked out,
> only card1 is left. This does not seem to be a practical problem however.
> 
> TODO/IDEAS:
> 
> 	* provide deferred takeover
> 	* provide bootsplash DRM client
> 	* make simplekms usable with ARM-EFI fbs
> 
> v2:
> 	* rename to simpledrm, aperture helpers
> 	* reorganized patches
> 	* use hotplug helpers for removal (Daniel)
> 	* added DT match tables (Rob)
> 	* use shadow-plane helpers
> 	* lots of minor cleanups
> 
> [1] https://lore.kernel.org/dri-devel/CAKMK7uHtqHy_oz4W7F+hmp9iqp7W5Ra8CxPvJ=9BwmvfU-O0gg@mail.gmail.com/
> [2] https://lore.kernel.org/dri-devel/1761762.3HQLrFs1K7@nerdopolis/
> 
> Thomas Zimmermann (10):
>   drm/format-helper: Pass destination pitch to drm_fb_memcpy_dstclip()
>   drm/format-helper: Add blitter functions
>   drm/aperture: Move fbdev conflict helpers into drm_aperture.h
>   drm/aperture: Add infrastructure for aperture ownership
>   drm: Add simpledrm driver
>   drm/simpledrm: Add fbdev emulation
>   drm/simpledrm: Initialize framebuffer data from device-tree node
>   drm/simpledrm: Acquire clocks from DT device node
>   drm/simpledrm: Acquire regulators from DT device node
>   drm/simpledrm: Acquire memory aperture for framebuffer
> 
>  Documentation/gpu/drm-internals.rst    |  12 +
>  MAINTAINERS                            |   7 +
>  drivers/gpu/drm/Kconfig                |   7 +
>  drivers/gpu/drm/Makefile               |   1 +
>  drivers/gpu/drm/drm_aperture.c         | 287 ++++++++
>  drivers/gpu/drm/drm_format_helper.c    |  96 ++-
>  drivers/gpu/drm/mgag200/mgag200_mode.c |   2 +-
>  drivers/gpu/drm/tiny/Kconfig           |  17 +
>  drivers/gpu/drm/tiny/Makefile          |   1 +
>  drivers/gpu/drm/tiny/cirrus.c          |   2 +-
>  drivers/gpu/drm/tiny/simpledrm.c       | 932 +++++++++++++++++++++++++
>  include/drm/drm_aperture.h             |  96 +++
>  include/drm/drm_fb_helper.h            |  56 +-
>  include/drm/drm_format_helper.h        |  10 +-
>  14 files changed, 1466 insertions(+), 60 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_aperture.c
>  create mode 100644 drivers/gpu/drm/tiny/simpledrm.c
>  create mode 100644 include/drm/drm_aperture.h
> 
> --
> 2.30.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
Hi

Testing the new version against drm-next and it works! I found I had to turn
off building CONFIG_FB_SIMPLE as it was taking over as the VGA device before 
simpledrm (or something. But it works, and as with the older version, testing
with the 'vmware' device that QEMU supports as a graphics device now has mode 
setting support which is pretty cool

Thanks

Thanks



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
