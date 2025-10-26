Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CC7C0B692
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 00:04:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB6910E119;
	Sun, 26 Oct 2025 23:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="IUZE//RO";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=valla.it header.i=@valla.it header.b="oJsmgykt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from delivery.antispam.mailspamprotection.com
 (delivery.antispam.mailspamprotection.com [185.56.87.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE5310E116
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Oct 2025 23:03:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256;
 d=outgoing.instance-europe-west4-68vb.prod.antispam.mailspamprotection.com;
 s=arckey; t=1761519836; 
 b=X+CBFUBJccMsTW/iSkLXzLOLBBCpu1EiSiyDCGjVglZx4NyOibyzvGX7ruVxQCL+But14+Ke09
 AXYl8VQ27xyTg9T//ecpN9+zYnTXQbp1++HSePb19LVWd7Xys/5q5JL5hWhxj2im6Zn/r8Uwn4
 HPqe9Az+dkz2PDOooeFQpZSO0nODOtKErgYPD7iy8OZsXSqoTA3wFV4qkRQl5oG9RsS5G3al80
 VekWE2Yye06EIdxdghpWjBrzJKyVHx0DNW37HLO8kZNt8PNh9bBADMX1AO/LFTvO95p9nQlnN/
 W8yCN6MkkHK09KvGVm/qEMi0N29A96GvOobta7Jx1GWTAA==;
ARC-Authentication-Results: i=1;
 outgoing.instance-europe-west4-68vb.prod.antispam.mailspamprotection.com;
 smtp.remote-ip=35.214.173.214; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed;
 d=outgoing.instance-europe-west4-68vb.prod.antispam.mailspamprotection.com;
 s=arckey; t=1761519836; 
 bh=+ifDqTasTBOiJ3jA1D6liL2PSivxMkHApr4Dpp+jaK8=;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:From:DKIM-Signature:DKIM-Signature;
 b=nlJv4g9chhi59sjs7HKw8u9ZgpAOE44lhZ1v0jjPyZtiYqy9NEuMQWS1+b71h7yOHXjRyNoNFB
 ry/fEoOA+tiibzgYmoM4AQgTiNmpuTdY4A06bUjtxNESWh6CL25Q6VelPWMqyW2FCotKuYPLA/
 sM10E03M6eLOdq16wBz6/9oKVVN52iKVXQdHf/XkwFePMUcScwD1cEkq1den8RD7Ny4/AC5+Zu
 6Dp6gWLwlLdV/U6q5BmHvVFLA58QZrkdtHvypzzjlg5IDRJwAnvgdlOXbBT8tmV7Wwz1/byLtH
 jhqS2N8uGEeFUbUAMDfpgfIoFbWnuEx4WHcYQmBHtuLWjA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
 :Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
 Subject:From:Reply-To:List-Unsubscribe;
 bh=/esxIZLC2v0hWhtNa8E6uqHduQe1rcLZyFz3W/CggDI=; b=IUZE//RO95tWdWArzBanMj0eZX
 72cFR4x2FnRpTLKDahrDEByarYneF3Fh5EoqttrJ+g9wglvvkpq0fYn8VsrWs1cAuRonh3WZDoPFe
 NPh6REZtRTSyEChYTHTA1H/f9pT83CgW1+QY88FJAyd08+9aHA4LpZ3cLuKDKaRlVlD0=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214]
 helo=esm19.siteground.biz)
 by instance-europe-west4-68vb.prod.antispam.mailspamprotection.com with
 esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <francesco@valla.it>) id 1vD9mB-000000002Fj-3wXC
 for dri-devel@lists.freedesktop.org; Sun, 26 Oct 2025 23:03:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
 s=default; h=Cc:To:Date:Subject:From:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=/esxIZLC2v0hWhtNa8E6uqHduQe1rcLZyFz3W/CggDI=; b=oJsmgyktsnxT0LuJkjKfBc6mkC
 Ia7FzRMvopHpApfgCqw5F+wed/RyBmT/1WB2Vfmu6YNRAvC4cNDdWFc+93N9ay8H6gQOvJEZK/49/
 uPYs5/A90NnwUEmTraG88dQrXyDYYJYdfTiK99oMJ6pgCyuna2C1gd+/11t1WHuMvT4I=;
Received: from [87.17.42.198] (port=63736 helo=fedora.fritz.box)
 by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <francesco@valla.it>)
 id 1vD9lp-00000000KNm-3zNW; Sun, 26 Oct 2025 23:03:30 +0000
From: Francesco Valla <francesco@valla.it>
Subject: [PATCH RFC 0/3] Add splash DRM client
Date: Mon, 27 Oct 2025 00:03:00 +0100
Message-Id: <20251027-drm_client_splash-v1-0-00698933b34a@valla.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKSo/mgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAyMz3ZSi3PjknMzUvJL44oKcxOIM3VRDgxTzFDMz41TzNCWgvoKi1LT
 MCrCZ0UpBbs5KsbW1ALwPpH5oAAAA
X-Change-ID: 20251026-drm_client_splash-e10d7d663e7f
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Jocelyn Falempe <jfalempe@redhat.com>, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-embedded@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4592; i=francesco@valla.it;
 h=from:subject:message-id; bh=+ifDqTasTBOiJ3jA1D6liL2PSivxMkHApr4Dpp+jaK8=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDBn/Vmx//lFsUfpG631xeVf+9ajvKStYpZbcOJsp6k70D
 BOWYpVZHaUsDGJcDLJiiiwh627c2zPX/FvaBsZHMHNYmUCGMHBxCsBEokUZGaatnPdjfprcnu+T
 J8y6NOn7bnunq08ZZLjNrQV9s39Ib9vHyLBftpKRIfZT0H4zw2ebNVqrK/gSS6Zt8dz/OT1i8+J
 IDw4A
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: bf8d5819830286b0db05a15693b6b8f7
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vD9mB-000000002Fj-3wXC-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-68vb.prod.antispam.mailspamprotection.com; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
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

Hello,

this patchset adds a new DRM client offering splash functionalities,
able to draw to screen:

  - a colored background;
  - a single-line text message, which can be set through sysfs or
    directly from the kernel command line;
  - a very simple progress bar, which can be driven through sysfs;
  - a static image (optional).

Once compiled inside the kernel, the client can be enabled through the
command line specifying the drm_client_lib.active=splash parameter.

== Motivation ==

The motivation behind this work is to offer to embedded system
developers a new path for a simple activation of the display(s)
connected to their system, with the following usecases:

  - bootsplash - possibly displaying even before init;
  - early activation of the display pipeline, in particular whenever one
    component of the pipeline (e.g.: a panel) takes a non-negligible
    time to initialize;
  - recovery systems, where the splash client can offer a simple feedback
    for unattended recovery tasks;
  - update systems, where the splash client can offer a simple feedback
    for unattended update tasks.

While the first seems the most obvious one, it was the second that acted
as the driver, as in the past I had to implement a ugly workaround using
a systemd generator to kickstart the initialization of a display and
shave ~400ms of boot time.

The last 2 usecase, instead, are the reason I dropped the "boot" part
from bootsplash.

== Implementation details ==

The design is quite simple, with a kernel thread doing the heavylifting
for the rendering part and some locking to protect interactions with it.

The splash image is loaded using the firmware framework, with the client
expecting to find a binary dump having the right dimensions (width and
height) and FOURCC format for each modeset. Given a 1920x1080 RGB888
modeset, the client will for example search for a firmware named:

   drm_splash_1920x1080_RG24.raw

If the firmware cannot be loaded directly, the NOUEVENT sysfs fallback
mechanism is used to let userspace load the appropriate image.

== Testing ==

Testing was done on qemu (both with vkms and bochs drivers), on a HDMI
display connected to a Beagleplay and on a ILI9341 SPI display connected
to a i.MX93 FRDM board. All these platforms revealed different
weaknesses that were hopefully removed.

== Open points / issues ==

The reason for this being an RFC is that there are several open points:

  - Support for tiled connectors should be there, but has not been
    tested. Any idea on how to test it?
  - I'm not entirely convinced that using the firmware framework to load
    the images is the right path. The idea behind it was to re-use the
    compressed firmware support, but then I discovered it is not there
    for built-in firmware.
  - Again on the firmware loading: CONFIG_LOADPIN would interfere with
    sysfs loading.
  - And again: FW_ACTION_NOUEVENT only has one user inside the kernel,
    leading me to think it is de-facto deprecated. And still, uevents
    for firmware loading seem frowned upon these days... 
  - Generating binary dumps for... basically any format is not so
    straightforward. I crafted a Python tool with AI help which seems
    to work quite well, but I honestly did not yet understood which is
    the policy for AI-generated code inside the kernel, so it is not
    included in this patch set. All client code is genuine, though.

== Additional notes ==

A bootsplash client was one of the TODOs for the DRM subsystem, so patch
3 removes the relative section from the list.

Curious to hear your thoughts. Thank you in advance!

Best regards,
Francesco

Signed-off-by: Francesco Valla <francesco@valla.it>
---
Francesco Valla (3):
      drm: client: add splash client
      MAINTAINERS: add entry for DRM splash client
      drm: docs: remove bootsplash from TODO

 Documentation/gpu/todo.rst                    |  17 -
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/clients/Kconfig               |  46 +-
 drivers/gpu/drm/clients/Makefile              |   1 +
 drivers/gpu/drm/clients/drm_client_internal.h |   9 +
 drivers/gpu/drm/clients/drm_client_setup.c    |   8 +
 drivers/gpu/drm/clients/drm_splash.c          | 761 ++++++++++++++++++++++++++
 7 files changed, 831 insertions(+), 18 deletions(-)
---
base-commit: 4bb1f7e19c4a1d6eeb52b80acff5ac63edd1b91d
change-id: 20251026-drm_client_splash-e10d7d663e7f

Best regards,
-- 
Francesco Valla <francesco@valla.it>

