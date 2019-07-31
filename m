Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1C27BD7C
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 11:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4522A89A77;
	Wed, 31 Jul 2019 09:42:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8135D89A77
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 09:42:34 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6V9gUtY095440;
 Wed, 31 Jul 2019 04:42:30 -0500
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6V9gUZY094252
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 31 Jul 2019 04:42:30 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 31
 Jul 2019 04:42:30 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 31 Jul 2019 04:42:30 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6V9gR84014471;
 Wed, 31 Jul 2019 04:42:28 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <tomi.valkeinen@ti.com>, <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 0/2] drm/omap: dmm_tiler: Small fixes for i878 workaround
Date: Wed, 31 Jul 2019 12:42:31 +0300
Message-ID: <20190731094233.13890-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1564566150;
 bh=AOwoh4wKZdV3/u6lwZJK+Sv4RWXP3d7a8U0Sdogcm+Q=;
 h=From:To:CC:Subject:Date;
 b=F+8cAIwnG3wAZoJYXcRCCbLUEGV/mN3svlj2wIYtGLkLRn6UjTQ8K/VkFPWvYbIER
 SKIXEp0eC6FoNY/b/z9q/NdV4dXJfT6B93QQWffn5p7RVkfI2ZVeThrZbtOfTub2Mz
 EGaFak4fkUckX//NtMxNoYrjjEwxVC5/jAz3rRtE=
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
Cc: airlied@linux.ie, jsarha@ti.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgp0d28gc21hbGwgY29ycmVjdGlvbiBvbiB0aGUgdXNlIG9mIERNQWVuZ2luZSBBUEksIG5v
IGZ1bmN0aW9uYWwgY2hhbmdlcwotIFVzZSBkbWFlbmdpbmVfcHJlcF9kbWFfbWVtY3B5KCkgdG8g
cHJlcGFyZSB0aGUgbWVtY3B5Ci0gZG8gbm90IGNhbGwgZG1hX2FzeW5jX2lzc3VlX3BlbmRpbmco
KSBhcyBpdCBpcyByZWR1bmRhbnQKClJlZ2FyZHMsClBldGVyCi0tLQpQZXRlciBVamZhbHVzaSAo
Mik6CiAgZHJtL29tYXA6IGRtbV90aWxlcjogVXNlIGRtYWVuZ2luZV9wcmVwX2RtYV9tZW1jcHko
KSBmb3IgaTg3OAogICAgd29ya2Fyb3VuZAogIGRybS9vbWFwOiBkbW1fdGlsZXI6IFJlbW92ZSB0
aGUgZG1hX2FzeW5jX2lzc3VlX3BlbmRpbmcoKSBjYWxsCgogZHJpdmVycy9ncHUvZHJtL29tYXBk
cm0vb21hcF9kbW1fdGlsZXIuYyB8IDQgKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAzIGRlbGV0aW9ucygtKQoKLS0gClBldGVyCgpUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5k
IE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3Mg
SUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
