Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QWcQA+NvjGluoAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 13:02:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC401240D9
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 13:02:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1993A10E3B2;
	Wed, 11 Feb 2026 12:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AeeYhndJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F201A10E04C;
 Wed, 11 Feb 2026 12:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770811351; x=1802347351;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pALwZ52CREfzlfMR/ot1WSR4yfjVA1PEikKmA3DTz7k=;
 b=AeeYhndJY847CPDuEHO47mrnAcgZHq2kpNf5O8Xdw/h2Lzq1i/33pvxy
 uERrs6sMqw2rwtYLasg6iUpWk/N0XFzCM3tAoj4/G7HVWBOl5lp6eeMvW
 vwsVdf0umWUldxyJsWmab7HofELcML4z4ZbJqrNZmtYibCqxhF+Vsq6xh
 QGOXZlWso/nuNR2/ZAl8Sdm4CC613Ey/FJCnJmKS1gOmSV5IqfL86DRJZ
 CDpWhiqVj8cMgCJziqLwGQNAG4+9HBX4cDCuQmzQaTMZw7epB3J+ngULw
 j16vAUI59UhT2maYECw4CLbpH4hexQ4oTyjR0xbesCBpJLlDjAaBlyw6B Q==;
X-CSE-ConnectionGUID: qlinJxWvS6O4DhOWO0/LLg==
X-CSE-MsgGUID: oQ8VZX/+RMyzkFDKmIZA/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71854638"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71854638"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 04:01:54 -0800
X-CSE-ConnectionGUID: FoxVcsp3TgGv3VXty0N7iQ==
X-CSE-MsgGUID: pgIZgmIgRnexuOWoEb6hxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="235210734"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa002.fm.intel.com with ESMTP; 11 Feb 2026 04:01:49 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Cc: andrealmeid@igalia.com, christian.koenig@amd.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, mripard@kernel.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH 2/4] drm/doc: Document DRM_WEDGE_RECOVERY_COLD_RESET recovery
 method
Date: Wed, 11 Feb 2026 17:29:49 +0530
Message-ID: <20260211115946.2014051-8-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211115946.2014051-6-mallesh.koujalagi@intel.com>
References: <20260211115946.2014051-6-mallesh.koujalagi@intel.com>
MIME-Version: 1.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[igalia.com,amd.com,gmail.com,ffwll.ch,kernel.org,intel.com];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mallesh.koujalagi@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: EDC401240D9
X-Rspamd-Action: no action

Add documentation for the DRM_WEDGE_RECOVERY_COLD_RESET recovery
method introduced for handling critical errors. This method is
designated for severe errors that compromise core device functionality
and are unrecoverable via recovery mechanisms such as driver reload or PCIe
bus reset. The documentation clarifies when this recovery method should be
used and its implications for userspace applications.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 Documentation/gpu/drm-uapi.rst | 73 +++++++++++++++++++++++++++++++++-
 1 file changed, 72 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index d98428a592f1..eae6aef68876 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -418,7 +418,7 @@ needed.
 Recovery
 --------
 
-Current implementation defines four recovery methods, out of which, drivers
+Current implementation defines five recovery methods, out of which, drivers
 can use any one, multiple or none. Method(s) of choice will be sent in the
 uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
 more side-effects. See the section `Vendor Specific Recovery`_
@@ -435,6 +435,7 @@ following expectations.
     rebind          unbind + bind driver
     bus-reset       unbind + bus reset/re-enumeration + bind
     vendor-specific vendor specific recovery method
+    cold-reset      full device cold reset required
     unknown         consumer policy
     =============== ========================================
 
@@ -446,6 +447,27 @@ telemetry information (devcoredump, syslog). This is useful because the first
 hang is usually the most critical one which can result in consequential hangs or
 complete wedging.
 
+Cold Reset Recovery
+-------------------
+
+The ``WEDGED=cold-reset`` event indicates that the device has encountered
+a critical errors that affecting core functionality that cannot be
+resolved through recovery mechanisms.
+
+This recovery method is reserved for critical error conditions where the
+device state cannot be restored via:
+
+- Driver unbind/rebind operations
+- PCIe bus reset and re-enumeration
+- Device Function Level Reset (FLR)
+- Warm device resets
+
+Such critical errors state typically persists across all software-based
+recovery attempts. Only a complete device power cycle can restore
+normal operation.
+
+Upon receiving a ``WEDGED=cold-reset`` event, userspace should initiate
+a full cold reset of the affected device to restore functionality.
 
 Vendor Specific Recovery
 ------------------------
@@ -524,6 +546,55 @@ Recovery script::
     echo -n $DEVICE > $DRIVER/unbind
     echo -n $DEVICE > $DRIVER/bind
 
+Example - cold-reset
+--------------------
+
+Udev rule::
+
+    SUBSYSTEM=="drm", ENV{WEDGED}=="cold-reset", DEVPATH=="*/drm/card[0-9]",
+    RUN+="/path/to/cold-reset.sh $env{DEVPATH}"
+
+Recovery script::
+
+    #!/bin/sh
+
+    [ -z "$1" ] && echo "Usage: $0 <device-path>" && exit 1
+
+    # Get device
+    DEVPATH=$(readlink -f /sys/$1/device 2>/dev/null || readlink -f /sys/$1)
+    DEVICE=$(basename $DEVPATH)
+
+    echo "Cold reset: $DEVICE"
+
+    # Try slot power reset first
+    SLOT=$(find /sys/bus/pci/slots/ -type l 2>/dev/null | while read slot; do
+	    ADDR=$(cat "$slot" 2>/dev/null)
+	    [ -n "$ADDR" ] && echo "$DEVICE" | grep -q "^$ADDR" && basename $(dirname "$slot") && break
+    done)
+
+    if [ -n "$SLOT" ]; then
+	echo "Using slot $SLOT"
+
+	# Unbind driver
+	[ -e "/sys/bus/pci/devices/$DEVICE/driver" ] && \
+	echo "$DEVICE" > /sys/bus/pci/devices/$DEVICE/driver/unbind 2>/dev/null
+
+	# Remove device
+	echo 1 > /sys/bus/pci/devices/$DEVICE/remove
+
+	# Power cycle slot
+	echo 0 > /sys/bus/pci/slots/$SLOT/power
+	sleep 2
+	echo 1 > /sys/bus/pci/slots/$SLOT/power
+	sleep 1
+
+	# Rescan
+	echo 1 > /sys/bus/pci/rescan
+	echo "Done!"
+    else
+	echo "No slot found"
+    fi
+
 Customization
 -------------
 
-- 
2.34.1

