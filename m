Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E93DF145CA2
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 20:43:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3BA76F898;
	Wed, 22 Jan 2020 19:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3FF6F896
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 19:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579722222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2H99dtIPzD+2bfpOZRc5f1le1Dolfc3F7B556CU3yGI=;
 b=FnlVw13T3WGHIZE1UT/lH9SW17gFVt8Ehe6+2VoBOMItRzebnshjoQMjHiqAfN05CZm4Pn
 mzZZk3NcPCYZheDasRT17yRbS/O3r6BIUkC0wAh9kj9WwAA7S6+jh5us1e7hHP35oUs3u+
 a06l1eHSHyQNCTENOwCVFl75acwfSl4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-NQLconojOpKT2sJLDngfkQ-1; Wed, 22 Jan 2020 14:43:38 -0500
X-MC-Unique: NQLconojOpKT2sJLDngfkQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E64BB138191;
 Wed, 22 Jan 2020 19:43:36 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-90.bss.redhat.com
 [10.20.1.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16E9C28D10;
 Wed, 22 Jan 2020 19:43:36 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/dp_mst: Mention max_payloads in
 proposed_vcpis/payloads docs
Date: Wed, 22 Jan 2020 14:43:21 -0500
Message-Id: <20200122194321.14953-2-lyude@redhat.com>
In-Reply-To: <20200122194321.14953-1-lyude@redhat.com>
References: <20200122194321.14953-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWVudGlvbiB0aGF0IHRoZSBzaXplIG9mIHRoZXNlIHR3byBzdHJ1Y3RzIGlzIGRldGVybWluZWQg
YnkKbWF4X3BheWxvYWRzLiBTdWdnZXN0ZWQgYnkgVmlsbGUgU3lyasOkbMOkLgoKU2lnbmVkLW9m
Zi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KQ2M6IFZpbGxlIFN5cmrDpGzDpCA8
dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogaW5jbHVkZS9kcm0vZHJtX2RwX21z
dF9oZWxwZXIuaCB8IDYgKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVy
LmggYi9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oCmluZGV4IGJjYjM5ZGE5YWRiNC4u
NTQ4M2Y4ODg3MTJhIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5o
CisrKyBiL2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmgKQEAgLTYzNSwxMSArNjM1LDEz
IEBAIHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciB7CiAJc3RydWN0IG11dGV4IHBheWxv
YWRfbG9jazsKIAkvKioKIAkgKiBAcHJvcG9zZWRfdmNwaXM6IEFycmF5IG9mIHBvaW50ZXJzIGZv
ciB0aGUgbmV3IFZDUEkgYWxsb2NhdGlvbi4gVGhlCi0JICogVkNQSSBzdHJ1Y3R1cmUgaXRzZWxm
IGlzICZkcm1fZHBfbXN0X3BvcnQudmNwaS4KKwkgKiBWQ1BJIHN0cnVjdHVyZSBpdHNlbGYgaXMg
JmRybV9kcF9tc3RfcG9ydC52Y3BpLCBhbmQgdGhlIHNpemUgb2YKKwkgKiB0aGlzIGFycmF5IGlz
IGRldGVybWluZWQgYnkgQG1heF9wYXlsb2Fkcy4KIAkgKi8KIAlzdHJ1Y3QgZHJtX2RwX3ZjcGkg
Kipwcm9wb3NlZF92Y3BpczsKIAkvKioKLQkgKiBAcGF5bG9hZHM6IEFycmF5IG9mIHBheWxvYWRz
LgorCSAqIEBwYXlsb2FkczogQXJyYXkgb2YgcGF5bG9hZHMuIFRoZSBzaXplIG9mIHRoaXMgYXJy
YXkgaXMgZGV0ZXJtaW5lZAorCSAqIGJ5IEBtYXhfcGF5bG9hZHMuCiAJICovCiAJc3RydWN0IGRy
bV9kcF9wYXlsb2FkICpwYXlsb2FkczsKIAkvKioKLS0gCjIuMjQuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
