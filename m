Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB781027E5
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 16:18:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0726E973;
	Tue, 19 Nov 2019 15:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8946E96E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 15:18:30 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-27YsXFnCPoCbOuIEVMyaJQ-1; Tue, 19 Nov 2019 10:18:28 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A893477;
 Tue, 19 Nov 2019 15:18:25 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-117-49.ams2.redhat.com
 [10.36.117.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A540D1001B35;
 Tue, 19 Nov 2019 15:18:22 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 1/3] ACPI / LPSS: Rename pwm_backlight pwm-lookup to
 pwm_soc_backlight
Date: Tue, 19 Nov 2019 16:18:16 +0100
Message-Id: <20191119151818.67531-2-hdegoede@redhat.com>
In-Reply-To: <20191119151818.67531-1-hdegoede@redhat.com>
References: <20191119151818.67531-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 27YsXFnCPoCbOuIEVMyaJQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574176709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ypeIeOv6cE6tGzjRHIvuCn9lxejh6U9cIMlMauvaS+4=;
 b=Hw355rYs/vJR9Kmq3I4esPXoaCj6ereO1Be8/FSe281A0ahIE1IwQcq8qnufjvv6oh5Ojo
 PEMlkpkhZm2X0k8+LB9tzOyCNHexa83Er8oYQVMoZkDRtrIadfHeQAAONtkYpgolPrajYs
 3AG0x4kkGY+6c7E22SpMEHb7x8AATrc=
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
Cc: linux-acpi@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXQgbGVhc3QgQmF5IFRyYWlsIChCWVQpIGFuZCBDaGVycnkgVHJhaWwgKENIVCkgZGV2aWNlcyBj
YW4gdXNlIDEgb2YgMgpkaWZmZXJlbnQgUFdNIGNvbnRyb2xsZXJzIGZvciBjb250cm9sbGluZyB0
aGUgTENEJ3MgYmFja2xpZ2h0IGJyaWdodG5lc3MuCkVpdGhlciB0aGUgb25lIGludGVncmF0ZWQg
aW50byB0aGUgUE1JQyBvciB0aGUgb25lIGludGVncmF0ZWQgaW50byB0aGUKU29DICh0aGUgMXN0
IExQU1MgUFdNIGNvbnRyb2xsZXIpLgoKU28gZmFyIGluIHRoZSBMUFNTIGNvZGUgb24gQllUIHdl
IGhhdmUgc2tpcHBlZCByZWdpc3RlcmluZyB0aGUgTFBTUyBQV00KY29udHJvbGxlciAicHdtX2Jh
Y2tsaWdodCIgbG9va3VwIGVudHJ5IHdoZW4gYSBDcnlzdGFsIENvdmUgUE1JQyBpcwpwcmVzZW50
LCBhc3N1bWluZyB0aGF0IGluIHRoaXMgY2FzZSB0aGUgUE1JQyBQV00gY29udHJvbGxlciB3aWxs
IGJlIHVzZWQuCgpPbiBDSFQgd2UgaGF2ZSBiZWVuIHJlbHlpbmcgb24gb25seSAxIG9mIHRoZSAy
IFBXTSBjb250cm9sbGVycyBiZWluZwplbmFibGVkIGluIHRoZSBEU0RUIGF0IHRoZSBzYW1lIHRp
bWU7IGFuZCBhbHdheXMgcmVnaXN0ZXJlZCB0aGUgbG9va3VwLgoKU28gZmFyIHRoaXMgaGFzIGJl
ZW4gd29ya2luZywgYnV0IHRoZSBjb3JyZWN0IHdheSB0byBkZXRlcm1pbmUgd2hpY2ggUFdNCmNv
bnRyb2xsZXIgbmVlZHMgdG8gYmUgdXNlZCBpcyBieSBjaGVja2luZyBhIGJpdCBpbiB0aGUgVkJU
IHRhYmxlIGFuZApyZWNlbnRseSBJJ3ZlIGxlYXJuZWQgYWJvdXQgMiBkaWZmZXJlbnQgQllUIGRl
dmljZXM6ClBvaW50IG9mIFZpZXcgTU9CSUkgVEFCLVA4MDBXCkFjZXIgU3dpdGNoIDEwIFNXNS0w
MTIKCldoaWNoIHVzZSBhIENyeXN0YWwgQ292ZSBQTUlDLCB5ZXQgdGhlIExDRCBpcyBjb25uZWN0
ZWQgdG8gdGhlIFNvQy9MUFNTClBXTSBjb250cm9sbGVyIChhbmQgdGhlIFZCVCBjb3JyZWN0bHkg
aW5kaWNhdGVzIHRoaXMpLCBzbyBoZXJlIG91ciBvbGQKaGV1cmlzdGljcyBmYWlsLgoKU2luY2Ug
b25seSB0aGUgaTkxNSBkcml2ZXIgaGFzIGFjY2VzcyB0byB0aGUgVkJULCB0aGlzIGNvbW1pdCBy
ZW5hbWVzCnRoZSAicHdtX2JhY2tsaWdodCIgbG9va3VwIGVudHJpZXMgZm9yIHRoZSAxc3QgQllU
L0NIVCBMUFNTIFBXTSBjb250cm9sbGVyCnRvICJwd21fc29jX2JhY2tsaWdodCIgc28gdGhhdCB0
aGUgaTkxNSBkcml2ZXIgY2FuIGRvIGEgcHdtX2dldCgpIGZvcgp0aGUgcmlnaHQgY29udHJvbGxl
ciBkZXBlbmRpbmcgb24gdGhlIFZCVCBiaXQsIGluc3RlYWQgb2YgdGhlIGk5MTUgZHJpdmVyCnJl
bHlpbmcgb24gYSAicHdtX2JhY2tsaWdodCIgbG9va3VwIGdldHRpbmcgcmVnaXN0ZXJlZCB3aGlj
aCBtYWdpY2FsbHkKcG9pbnRzIHRvIHRoZSByaWdodCBjb250cm9sbGVyLgoKU2lnbmVkLW9mZi1i
eTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2FjcGkv
YWNwaV9scHNzLmMgfCAxMSArKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2FjcGkvYWNwaV9scHNz
LmMgYi9kcml2ZXJzL2FjcGkvYWNwaV9scHNzLmMKaW5kZXggNzUxZWQzOGYyYTEwLi42M2U4MWQ4
ZTY3NWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYWNwaS9hY3BpX2xwc3MuYworKysgYi9kcml2ZXJz
L2FjcGkvYWNwaV9scHNzLmMKQEAgLTY5LDEwICs2OSw2IEBAIEFDUElfTU9EVUxFX05BTUUoImFj
cGlfbHBzcyIpOwogI2RlZmluZSBMUFNTX1NBVkVfQ1RYCQkJQklUKDQpCiAjZGVmaW5lIExQU1Nf
Tk9fRDNfREVMQVkJCUJJVCg1KQogCi0vKiBDcnlzdGFsIENvdmUgUE1JQyBzaGFyZXMgc2FtZSBB
Q1BJIElEIGJldHdlZW4gZGlmZmVyZW50IHBsYXRmb3JtcyAqLwotI2RlZmluZSBCWVRfQ1JDX0hS
VgkJCTIKLSNkZWZpbmUgQ0hUX0NSQ19IUlYJCQkzCi0KIHN0cnVjdCBscHNzX3ByaXZhdGVfZGF0
YTsKIAogc3RydWN0IGxwc3NfZGV2aWNlX2Rlc2MgewpAQCAtMTU4LDcgKzE1NCw3IEBAIHN0YXRp
YyB2b2lkIGxwc3NfZGVhc3NlcnRfcmVzZXQoc3RydWN0IGxwc3NfcHJpdmF0ZV9kYXRhICpwZGF0
YSkKICAqLwogc3RhdGljIHN0cnVjdCBwd21fbG9va3VwIGJ5dF9wd21fbG9va3VwW10gPSB7CiAJ
UFdNX0xPT0tVUF9XSVRIX01PRFVMRSgiODA4NjBGMDk6MDAiLCAwLCAiMDAwMDowMDowMi4wIiwK
LQkJCSAgICAgICAicHdtX2JhY2tsaWdodCIsIDAsIFBXTV9QT0xBUklUWV9OT1JNQUwsCisJCQkg
ICAgICAgInB3bV9zb2NfYmFja2xpZ2h0IiwgMCwgUFdNX1BPTEFSSVRZX05PUk1BTCwKIAkJCSAg
ICAgICAicHdtLWxwc3MtcGxhdGZvcm0iKSwKIH07CiAKQEAgLTE3MCw4ICsxNjYsNyBAQCBzdGF0
aWMgdm9pZCBieXRfcHdtX3NldHVwKHN0cnVjdCBscHNzX3ByaXZhdGVfZGF0YSAqcGRhdGEpCiAJ
aWYgKCFhZGV2LT5wbnAudW5pcXVlX2lkIHx8IHN0cmNtcChhZGV2LT5wbnAudW5pcXVlX2lkLCAi
MSIpKQogCQlyZXR1cm47CiAKLQlpZiAoIWFjcGlfZGV2X3ByZXNlbnQoIklOVDMzRkQiLCBOVUxM
LCBCWVRfQ1JDX0hSVikpCi0JCXB3bV9hZGRfdGFibGUoYnl0X3B3bV9sb29rdXAsIEFSUkFZX1NJ
WkUoYnl0X3B3bV9sb29rdXApKTsKKwlwd21fYWRkX3RhYmxlKGJ5dF9wd21fbG9va3VwLCBBUlJB
WV9TSVpFKGJ5dF9wd21fbG9va3VwKSk7CiB9CiAKICNkZWZpbmUgTFBTU19JMkNfRU5BQkxFCQkJ
MHg2YwpAQCAtMjA0LDcgKzE5OSw3IEBAIHN0YXRpYyB2b2lkIGJ5dF9pMmNfc2V0dXAoc3RydWN0
IGxwc3NfcHJpdmF0ZV9kYXRhICpwZGF0YSkKIC8qIEJTVyBQV00gdXNlZCBmb3IgYmFja2xpZ2h0
IGNvbnRyb2wgYnkgdGhlIGk5MTUgZHJpdmVyICovCiBzdGF0aWMgc3RydWN0IHB3bV9sb29rdXAg
YnN3X3B3bV9sb29rdXBbXSA9IHsKIAlQV01fTE9PS1VQX1dJVEhfTU9EVUxFKCI4MDg2MjI4ODow
MCIsIDAsICIwMDAwOjAwOjAyLjAiLAotCQkJICAgICAgICJwd21fYmFja2xpZ2h0IiwgMCwgUFdN
X1BPTEFSSVRZX05PUk1BTCwKKwkJCSAgICAgICAicHdtX3NvY19iYWNrbGlnaHQiLCAwLCBQV01f
UE9MQVJJVFlfTk9STUFMLAogCQkJICAgICAgICJwd20tbHBzcy1wbGF0Zm9ybSIpLAogfTsKIAot
LSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
