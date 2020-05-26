Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4ACC1E302A
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 22:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2BDB6E051;
	Tue, 26 May 2020 20:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398426E233
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 20:42:06 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-j7tY41rTOdmX0MQOZQ-GZQ-1; Tue, 26 May 2020 16:42:01 -0400
X-MC-Unique: j7tY41rTOdmX0MQOZQ-GZQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D32E1007B08;
 Tue, 26 May 2020 20:42:00 +0000 (UTC)
Received: from dreadlord-bne-redhat-com.bne.redhat.com (unknown [10.64.32.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EAD210013D5;
 Tue, 26 May 2020 20:41:59 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org,
	xorg-announce@lists.x.org
Subject: [ANNOUNCE] libdrm 2.4.102
Date: Wed, 27 May 2020 06:41:55 +1000
Message-Id: <20200526204155.5890-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256


libdrm 2.4.102, lots of FreeBSD and modetest stuff.

Boram Park (1):
      drm mode : fix memory leak when freeing drmModePropertyPtr

Dave Airlie (1):
      Bump version to 2.4.102

Emil Velikov (17):
      tests: install drmdevice
      modetest: simplify "dump all" logic
      modetest: remove cursor/page_flipping_supported stubs
      modetest: move basic args check before open()
      modetest: set atomic cap, _only_ when needed
      modetest: add and use bo_fb_create() helper
      modetest: remove drmMode{,Plane}Res
      modetest: close the device on exit
      modetest: introduce and use get_crtc_by_id() and get_crtc_mask()
      modetest: get the crtc_id from the pipe_arg
      modetest: unify {,atomic_}set_mode()
      modetest: move pipe_resolve_connectors() further up
      modetest: push pipe_resolve_connectors() to set_mode
      modetest: factor out atomic pageflip test
      modetest: don't error out of final AtomicCommit
      modetest: reorder atomic path alike the non-atomic
      modetest: Add a new "-r" option to set a default mode

Emmanuel Vadot (15):
      libdrm: drmNodeIsDRM: Add FreeBSD variant
      xf86drm: Remove ifdef for FreeBSD and DRM_MAJOR
      libdrm: drmGetMinorType: Add FreeBSD version
      libdrm: drmGetDeviceNameFromFd: Add FreeBSD variant
      libdrm: drmGetMinorNameForFD: Add FreeBSD variant
      libdrm: Default to PCI for FreeBSD
      libdrm: drmGetDeviceNameFromFd2: Add FreeBSD variant
      libdrm: drmCheckModesettingSupported: Fix for FreeBSD
      libdrm: drmCheckModesettingSupported: fix for FreeBSD
      libdrm: Add get_sysctl_pci_bus_info for FreeBSD
      libdrm: get_pci_path is Linux only so add an ifdef
      libdrm: Implement drmParsePciDeviceInfo for FreeBSD
      tests/nouveau/threaded: adapt ioctl signature for FreeBSD
      libdrm: drmGetMinorNameFromFd: Fix FreeBSD variant
      libdrm: drmGetDeviceNameFromFd: Always return /dev/dri/ node for FreeBSD

Eric Engestrom (1):
      meson: don't detect <sys/sysctl.h> on Linux

James Zhu (1):
      tests/amdgpu/vcn: add dummy feedback message

Jose Maria Casanova Crespo (1):
      meson: require valgrind 3.10.0 to enable it with freedreno

Karol Herbst (2):
      nouveau: fix compile error with -DDEBUG on newer gcc
      nouveau: sync up with nouveau_abi16.h and nouveau_drm.h

Leo Liu (1):
      tests/amdgpu/vcn: add Renoir VCN2.0 decode support

Mikhail Golubev (1):
      xf86drm: Check non-absolute path only for virtio based devices

Nicholas Bishop (2):
      intel: properly escape sed pattern for tests
      libdrm: intel: add DRM_RDWR flag in drm_intel_bo_gem_export_to_prime

Peter Seiderer (1):
      tests/amdgpu: needs atomic_ops

Scott Anderson (1):
      libdrm: Handle usb_interface devices for usb parsing

git tag: libdrm-2.4.102

https://dri.freedesktop.org/libdrm/libdrm-2.4.102.tar.xz
SHA256: 8bcbf9336c28e393d76c1f16d7e79e394a7fce8a2e929d52d3ad7ad8525ba05b  libdrm-2.4.102.tar.xz
SHA512: 386afd228efd809fe32776a6ff5d9dd95d1409a6a6a89b3806a3b42ed27e84f1e090f3b7834973f834d6b0d1342b7034447fe8690d072f85f03292d7795c3e0c  libdrm-2.4.102.tar.xz
PGP:  https://dri.freedesktop.org/libdrm/libdrm-2.4.102.tar.xz.sig

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEEKbZHaGwW9KfbeusDHTzWXnEhr4FAl7NftoACgkQDHTzWXnE
hr6AJg//fv8RCU+k0biCDmrV3ji6Yb4jpYds48q2qq1sdZsqMSrzctR5lrLqf0Jo
gyqqsIWdHjqRmrhbtkuBLvFigLwlFtDun2jLpcE32aZsb+NCjFUUnnTsWFsl5VDg
cPUZVc7x+vrm+uJqE9EMv3wzbolfhHWGEEpvhUTTdIljPGTTMEznFPWKc05X+QQR
fWczQDQm6vifw4sF5zMrZWp3fOwBM3utDdhVLUsnRlo67YKeGjkm298FMwrxDfp8
+eRnUW8h6W4GuWva0fKSMdwv9SVwhzHQUGX4P5AXu2cyJoMw1VHMPn3iiFIfZJAp
ny8uGxnbBEvACr5hgSCy7DI1BUtBEwwmWuH3nPsNoQxPlhQRY0ZNKlBokps7QdQ+
aadZ5EbZmfWRSqm8OH7HpZa0zUmPaFwzPDX2b/JcFSt405Ka1yQ+6yjSGADaZ/z5
jQZJNbgNDBaWupgat82/YDI3A2d1NdudKTRrronyanenm7EdO10Aul9SMfZCwR56
0yKoTx+w9fZeqOrYyJMJ9q4Q8eZnpuePbY0nKZEKJOvGFE25xn4/XYqSFr5lYsYc
3pbVxZCyH6c+00dDkkziJbszgIq7RXpH7k8gS/v028LJ+VhmSXs9tZU8SQ8cU4he
J5PvR9IbUOjzQzxn0ymwi/468E8zkM/CWSYpsnL0ba/x7y3rBQ8=
=Pull
-----END PGP SIGNATURE-----

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
