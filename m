Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 912BD57C59A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 09:57:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8717E11A75D;
	Thu, 21 Jul 2022 07:57:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF10D11A44C;
 Thu, 21 Jul 2022 07:57:01 +0000 (UTC)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
 (envelope-from <dri-devel-bounces@lists.sourceforge.net>)
 id 1oER3I-0005P3-Sb; Thu, 21 Jul 2022 07:56:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <airlied@gmail.com>) id 1oEOIS-0001ak-Bk
 for dri-devel@lists.sourceforge.net; Thu, 21 Jul 2022 05:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uPL/ql1LB5ds4jH2tOhM+z2l0HqEHdneZJ9I01Jvm0A=; b=fqDuSiQ+K19QzuE7hpOw9s5KiU
 xONxRrnhJA0KeSN5oPcCRDhtToeE5Uu6eYUbHnOo1n24COwbBguYM1DdHRu9E92TbypF7mqv3jVgu
 6s0pIP4bHDTkwO4uyioKS7Iz1o/mkWK7XqiRZoIla3bpXQe2CfNWlhISDWq/8dFL3EFc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=uPL/ql1LB5ds4jH2tOhM+z2l0HqEHdneZJ9I01Jvm0A=; b=N
 uzlUmftHVyq8VpIYMThL3llwUwX7JVv2XJhqdk1YEzYOZHpL2XIKoDBOGst+2wboAtc+h0c0HX0r/
 2Dad/jItM8q5x2LAmrIH2eKsKQVxd35LDJ6H23bU7qBrUBT35uyFg1ozOFfCh3QV00s6bONHCXZfy
 zQFQ8ZrFOOwF2vUM=;
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oEOIO-005f90-KA
 for dri-devel@lists.sourceforge.net; Thu, 21 Jul 2022 05:00:24 +0000
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-wCWCKbzDPBOPH_d9xnmbWw-1; Thu, 21 Jul 2022 00:44:01 -0400
X-MC-Unique: wCWCKbzDPBOPH_d9xnmbWw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80331811E80;
 Thu, 21 Jul 2022 04:44:00 +0000 (UTC)
Received: from dreadlord.bne.redhat.com (fdacunha.bne.redhat.com [10.64.0.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEEA3909FF;
 Thu, 21 Jul 2022 04:43:55 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: torvalds@linux-foundation.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, gregkh@linuxfoundation.org,
 Daniel Vetter <daniel@ffwll.ch>, mcgrof@kernel.org
Subject: [PATCH] docs: driver-api: firmware: add driver firmware guidelines.
 (v3)
Date: Thu, 21 Jul 2022 14:43:52 +1000
Message-Id: <20220721044352.3110507-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Spam-Score: 4.0 (++++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Dave Airlie A recent snafu where Intel ignored upstream
 feedback on a firmware change, led to a late rc6 fix being required. In order
 to avoid this in the future we should document some expectations around linux-
 [...] Content analysis details:   (4.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [205.139.111.44 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [airlied[at]gmail.com]
 0.0 DKIM_ADSP_CUSTOM_MED   No valid author signature, adsp_override is
 CUSTOM_MED
 1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
 1.0 FORGED_GMAIL_RCVD      'From' gmail.com does not match 'Received'
 headers
 1.2 NML_ADSP_CUSTOM_MED    ADSP custom_med hit, and not from a mailing
 list 1.5 SPOOFED_FREEMAIL       No description available.
 0.0 SPOOF_GMAIL_MID        From Gmail but it doesn't seem to be...
X-Headers-End: 1oEOIO-005f90-KA
X-Mailman-Approved-At: Thu, 21 Jul 2022 07:56:54 +0000
X-BeenThere: dri-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-BeenThere: dri-devel@lists.freedesktop.org
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, netdev@vger.kernel.org, dri-devel@lists.sf.net,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@redhat.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

A recent snafu where Intel ignored upstream feedback on a firmware
change, led to a late rc6 fix being required. In order to avoid this
in the future we should document some expectations around
linux-firmware.

I was originally going to write this for drm, but it seems quite generic
advice.

v2: rewritten with suggestions from Thorsten Leemhuis
v3: rewritten with suggestions from Mauro

Acked-by: Luis Chamberlain <mcgrof@kernel.org>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Acked-by: Daniel Vetter <daniel@ffwll.ch>
Acked-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 Documentation/driver-api/firmware/core.rst    |  1 +
 .../firmware/firmware-usage-guidelines.rst    | 44 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 Documentation/driver-api/firmware/firmware-usage-guidelines.rst

diff --git a/Documentation/driver-api/firmware/core.rst b/Documentation/driver-api/firmware/core.rst
index 1d1688cbc078..803cd574bbd7 100644
--- a/Documentation/driver-api/firmware/core.rst
+++ b/Documentation/driver-api/firmware/core.rst
@@ -13,4 +13,5 @@ documents these features.
    direct-fs-lookup
    fallback-mechanisms
    lookup-order
+   firmware-usage-guidelines
 
diff --git a/Documentation/driver-api/firmware/firmware-usage-guidelines.rst b/Documentation/driver-api/firmware/firmware-usage-guidelines.rst
new file mode 100644
index 000000000000..fdcfce42c6d2
--- /dev/null
+++ b/Documentation/driver-api/firmware/firmware-usage-guidelines.rst
@@ -0,0 +1,44 @@
+===================
+Firmware Guidelines
+===================
+
+Users switching to a newer kernel should *not* have to install newer
+firmware files to keep their hardware working. At the same time updated
+firmware files must not cause any regressions for users of older kernel
+releases.
+
+Drivers that use firmware from linux-firmware should follow the rules in
+this guide. (Where there is limited control of the firmware,
+i.e. company doesn't support Linux, firmwares sourced from misc places,
+then of course these rules will not apply strictly.)
+
+* Firmware files shall be designed in a way that it allows checking for
+  firmware ABI version changes. It is recommended that firmware files be
+  versioned with at least a major/minor version. It is suggested that
+  the firmware files in linux-firmware be named with some device
+  specific name, and just the major version. The firmware version should
+  be stored in the firmware header, or as an exception, as part of the
+  firmware file name, in order to let the driver detact any non-ABI
+  fixes/changes. The firmware files in linux-firmware should be
+  overwritten with the newest compatible major version. Newer major
+  version firmware shall remain compatible with all kernels that load
+  that major number.
+
+* If the kernel support for the hardware is normally inactive, or the
+  hardware isn't available for public consumption, this can
+  be ignored, until the first kernel release that enables that hardware.
+  This means no major version bumps without the kernel retaining
+  backwards compatibility for the older major versions.  Minor version
+  bumps should not introduce new features that newer kernels depend on
+  non-optionally.
+
+* If a security fix needs lockstep firmware and kernel fixes in order to
+  be successful, then all supported major versions in the linux-firmware
+  repo that are required by currently supported stable/LTS kernels,
+  should be updated with the security fix. The kernel patches should
+  detect if the firmware is new enough to declare if the security issue
+  is fixed.  All communications around security fixes should point at
+  both the firmware and kernel fixes. If a security fix requires
+  deprecating old major versions, then this should only be done as a
+  last option, and be stated clearly in all communications.
+
-- 
2.36.1



--
_______________________________________________
Dri-devel mailing list
Dri-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/dri-devel
