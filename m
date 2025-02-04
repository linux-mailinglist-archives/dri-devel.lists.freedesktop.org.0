Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D29A26C70
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 08:06:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 186EC10E5A9;
	Tue,  4 Feb 2025 07:06:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D84oKKjZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B4210E5A0;
 Tue,  4 Feb 2025 07:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738652779; x=1770188779;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g+Zbh38jbLgSrrKsw6+c56B507kQTxy0yTyE+p/p3rw=;
 b=D84oKKjZkbouhQbvKMroupVWsmj+gbTM/wanbRoxx16Wk50OykAKP1k3
 MmDOd+93IVCmGt1MAe2nyhyfSTtM5JuKGxTYkHDEktWEAUvAtEDK8y//e
 vi2HNMXL31evogjPWLe54cw1B1gQOUJ9AMWRGds/rmTBRz3OcZCE18upc
 MEKBvUbMrgwrRzQporlJZ4RVUvDE0PKJ0gxBUALjZgpkLYMdrfAm3RPN7
 VlF9hiF0ODsvrA7r6HjilSA8qFH2qSxmEPXC6HRx9WgInDbkbG7AU2KmR
 6pOq5+7015GBoFL7u2dccDJ5TLcHmO7+cTtHjPq47w5RHahc5xS47XXwB w==;
X-CSE-ConnectionGUID: rLg/cpKLSyqei80Ou4pEog==
X-CSE-MsgGUID: aCLmbnqsRSyonzYMwYxYWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39196832"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="39196832"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 23:06:19 -0800
X-CSE-ConnectionGUID: 0Igxzg0eTYOaEfv8S1cyEQ==
X-CSE-MsgGUID: 8Si26oEmSr271l8JHfvuzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110974799"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa007.jf.intel.com with ESMTP; 03 Feb 2025 23:06:12 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 christian.koenig@amd.com, alexander.deucher@amd.com
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 andriy.shevchenko@linux.intel.com, lina@asahilina.net,
 michal.wajdeczko@intel.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com, xaver.hugl@kde.org,
 pekka.paalanen@haloniitty.fi, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v12 2/5] drm/doc: Document device wedged event
Date: Tue,  4 Feb 2025 12:35:25 +0530
Message-Id: <20250204070528.1919158-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204070528.1919158-1-raag.jadav@intel.com>
References: <20250204070528.1919158-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Add documentation for device wedged event in a new "Device wedging"
chapter. This describes basic definitions, prerequisites and consumer
expectations along with an example.

 v8: Improve introduction (Christian, Rodrigo)
 v9: Add prerequisites section (Christian)
v10: Clarify mmap cleanup and consumer prerequisites (Christian, Aravind)
v11: Reference wedged event in device reset chapter (André)
v12: Refine consumer expectations and terminologies (Xaver, Pekka)

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Reviewed-by: André Almeida <andrealmeid@igalia.com>
---
 Documentation/gpu/drm-uapi.rst | 116 ++++++++++++++++++++++++++++++++-
 1 file changed, 113 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index b75cc9a70d1f..69f72e71a96e 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -371,9 +371,119 @@ Reporting causes of resets
 
 Apart from propagating the reset through the stack so apps can recover, it's
 really useful for driver developers to learn more about what caused the reset in
-the first place. DRM devices should make use of devcoredump to store relevant
-information about the reset, so this information can be added to user bug
-reports.
+the first place. For this, drivers can make use of devcoredump to store relevant
+information about the reset and send device wedged event with ``none`` recovery
+method (as explained in "Device Wedging" chapter) to notify userspace, so this
+information can be collected and added to user bug reports.
+
+Device Wedging
+==============
+
+Drivers can optionally make use of device wedged event (implemented as
+drm_dev_wedged_event() in DRM subsystem), which notifies userspace of 'wedged'
+(hanged/unusable) state of the DRM device through a uevent. This is useful
+especially in cases where the device is no longer operating as expected and has
+become unrecoverable from driver context. Purpose of this implementation is to
+provide drivers a generic way to recover the device with the help of userspace
+intervention, without taking any drastic measures (like resetting or
+re-enumerating the full bus, on which the underlying physical device is sitting)
+in the driver.
+
+A 'wedged' device is basically a device that is declared dead by the driver
+after exhausting all possible attempts to recover it from driver context. The
+uevent is the notification that is sent to userspace along with a hint about
+what could possibly be attempted to recover the device from userspace and bring
+it back to usable state. Different drivers may have different ideas of a
+'wedged' device depending on hardware implementation of the underlying physical
+device, and hence the vendor agnostic nature of the event. It is up to the
+drivers to decide when they see the need for device recovery and how they want
+to recover from the available methods.
+
+Driver prerequisites
+--------------------
+
+The driver, before opting for recovery, needs to make sure that the 'wedged'
+device doesn't harm the system as a whole by taking care of the prerequisites.
+Necessary actions must include disabling DMA to system memory as well as any
+communication channels with other devices. Further, the driver must ensure
+that all dma_fences are signalled and any device state that the core kernel
+might depend on is cleaned up. All existing mmaps should be invalidated and
+page faults should be redirected to a dummy page. Once the event is sent, the
+device must be kept in 'wedged' state until the recovery is performed. New
+accesses to the device (IOCTLs) should be rejected, preferably with an error
+code that resembles the type of failure the device has encountered. This will
+signify the reason for wedging, which can be reported to the application if
+needed.
+
+Recovery
+--------
+
+Current implementation defines three recovery methods, out of which, drivers
+can use any one, multiple or none. Method(s) of choice will be sent in the
+uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
+more side-effects. If driver is unsure about recovery or method is unknown
+(like soft/hard system reboot, firmware flashing, physical device replacement
+or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
+will be sent instead.
+
+Userspace consumers can parse this event and attempt recovery as per the
+following expectations.
+
+    =============== ========================================
+    Recovery method Consumer expectations
+    =============== ========================================
+    none            optional telemetry collection
+    rebind          unbind + bind driver
+    bus-reset       unbind + bus reset/re-enumeration + bind
+    unknown         consumer policy
+    =============== ========================================
+
+The only exception to this is ``WEDGED=none``, which signifies that the device
+was temporarily 'wedged' at some point but was recovered from driver context
+using device specific methods like reset. No explicit recovery is expected from
+the consumer in this case, but it can still take additional steps like gathering
+telemetry information (devcoredump, syslog). This is useful because the first
+hang is usually the most critical one which can result in consequential hangs or
+complete wedging.
+
+Consumer prerequisites
+----------------------
+
+It is the responsibility of the consumer to make sure that the device or its
+resources are not in use by any process before attempting recovery. With IOCTLs
+erroring out, all device memory should be unmapped and file descriptors should
+be closed to prevent leaks or undefined behaviour. The idea here is to clear the
+device of all user context beforehand and set the stage for a clean recovery.
+
+Example
+-------
+
+Udev rule::
+
+    SUBSYSTEM=="drm", ENV{WEDGED}=="rebind", DEVPATH=="*/drm/card[0-9]",
+    RUN+="/path/to/rebind.sh $env{DEVPATH}"
+
+Recovery script::
+
+    #!/bin/sh
+
+    DEVPATH=$(readlink -f /sys/$1/device)
+    DEVICE=$(basename $DEVPATH)
+    DRIVER=$(readlink -f $DEVPATH/driver)
+
+    echo -n $DEVICE > $DRIVER/unbind
+    echo -n $DEVICE > $DRIVER/bind
+
+Customization
+-------------
+
+Although basic recovery is possible with a simple script, consumers can define
+custom policies around recovery. For example, if the driver supports multiple
+recovery methods, consumers can opt for the suitable one depending on scenarios
+like repeat offences or vendor specific failures. Consumers can also choose to
+have the device available for debugging or telemetry collection and base their
+recovery decision on the findings. This is useful especially when the driver is
+unsure about recovery or method is unknown.
 
 .. _drm_driver_ioctl:
 
-- 
2.34.1

