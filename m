Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4C6577D94
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 10:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13CACA5A7D;
	Mon, 18 Jul 2022 08:35:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3448A5869;
 Mon, 18 Jul 2022 08:35:40 +0000 (UTC)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
 (envelope-from <dri-devel-bounces@lists.sourceforge.net>)
 id 1oDME6-0000Z5-Bc; Mon, 18 Jul 2022 08:35:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <airlied@gmail.com>) id 1oDLKf-00073o-96
 for dri-devel@lists.sourceforge.net; Mon, 18 Jul 2022 07:38:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a5hZOAAUWc2PoIMWjCrKIcjEuKInTNDbrdy1CIkcc5U=; b=G0VY4h98FkgRAjXwX6+ib46Gt3
 3xERRPHXPHJGdjjEpnoMA5gvx1i+v2hkYYag5Bg1Ov6PNZ4qRjbe9OtL4MpBvsjOW2p3syb09xvE5
 S6RfrqyodaxzHxjSSo6ZjuyGIFqmOcrGOGP9JFFVV+Jbo7tg6O52zcgLOsdAUT5q4sh0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=a5hZOAAUWc2PoIMWjCrKIcjEuKInTNDbrdy1CIkcc5U=; b=i
 eRObj/ksg3y8r3SDfsbBj5avvFo8NMLFN5w/MhsRb6dxCVuippCwrYhKpaVRF6R4PujHuiJGV7hOf
 hd5/ggjzubBYyTwhfb3GQRFICyIvdluOra47spiyqoLKZTIG3DctCmNPfDoKFsw3+osg+E23uW/a5
 CuWZFVjiIXTUwBtQ=;
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oDLKZ-002SDe-II
 for dri-devel@lists.sourceforge.net; Mon, 18 Jul 2022 07:38:19 +0000
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-AgST6BwiNTG9NjgWcQgQBg-1; Mon, 18 Jul 2022 03:21:54 -0400
X-MC-Unique: AgST6BwiNTG9NjgWcQgQBg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F8D7811E80;
 Mon, 18 Jul 2022 07:21:53 +0000 (UTC)
Received: from dreadlord.bne.redhat.com (fdacunha.bne.redhat.com [10.64.0.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69304141511A;
 Mon, 18 Jul 2022 07:21:49 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: torvalds@linux-foundation.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, gregkh@linuxfoundation.org,
 Daniel Vetter <daniel@ffwll.ch>, mcgrof@kernel.org
Subject: [PATCH] docs: driver-api: firmware: add driver firmware guidelines.
Date: Mon, 18 Jul 2022 17:21:44 +1000
Message-Id: <20220718072144.2699487-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Spam-Score: 3.9 (+++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Dave Airlie A recent snafu where Intel ignored upstream
 feedback on a firmware change, led to a late rc6 fix being required. In order
 to avoid this in the future we should document some expectations around linux-
 [...] Content analysis details:   (3.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [207.211.30.44 listed in list.dnswl.org]
 1.0 FORGED_GMAIL_RCVD      'From' gmail.com does not match 'Received'
 headers
 0.0 DKIM_ADSP_CUSTOM_MED   No valid author signature, adsp_override is
 CUSTOM_MED
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [airlied[at]gmail.com]
 1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.2 NML_ADSP_CUSTOM_MED    ADSP custom_med hit, and not from a mailing
 list 1.4 SPOOFED_FREEMAIL       No description available.
 0.0 SPOOF_GMAIL_MID        From Gmail but it doesn't seem to be...
X-Headers-End: 1oDLKZ-002SDe-II
X-Mailman-Approved-At: Mon, 18 Jul 2022 08:35:14 +0000
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
Cc: alsa-devel@alsa-project.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, dri-devel@lists.sf.net,
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

I'm cc'ing this quite widely to reach subsystems which use fw a lot.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 Documentation/driver-api/firmware/core.rst    |  1 +
 .../firmware/firmware-usage-guidelines.rst    | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
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
index 000000000000..34d2412e78c6
--- /dev/null
+++ b/Documentation/driver-api/firmware/firmware-usage-guidelines.rst
@@ -0,0 +1,34 @@
+===================
+Firmware Guidelines
+===================
+
+Drivers that use firmware from linux-firmware should attempt to follow
+the rules in this guide.
+
+* Firmware should be versioned with at least a major/minor version. It
+  is suggested that the firmware files in linux-firmware be named with
+  some device specific name, and just the major version. The
+  major/minor/patch versions should be stored in a header in the
+  firmware file for the driver to detect any non-ABI fixes/issues. The
+  firmware files in linux-firmware should be overwritten with the newest
+  compatible major version. Newer major version firmware should remain
+  compatible with all kernels that load that major number.
+
+* Users should *not* have to install newer firmware to use existing
+  hardware when they install a newer kernel.  If the hardware isn't
+  enabled by default or under development, this can be ignored, until
+  the first kernel release that enables that hardware.  This means no
+  major version bumps without the kernel retaining backwards
+  compatibility for the older major versions.  Minor version bumps
+  should not introduce new features that newer kernels depend on
+  non-optionally.
+
+* If a security fix needs lockstep firmware and kernel fixes in order to
+  be successful, then all supported major versions in the linux-firmware
+  repo should be updated with the security fix, and the kernel patches
+  should detect if the firmware is new enough to declare if the security
+  issue is fixed.  All communications around security fixes should point
+  at both the firmware and kernel fixes. If a security fix requires
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
