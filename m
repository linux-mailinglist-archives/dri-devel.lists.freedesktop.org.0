Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E631027E6
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 16:18:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C3AA6E975;
	Tue, 19 Nov 2019 15:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB3626E973
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 15:18:32 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-6Hi3OIQRPOWRacUrwh9Eiw-1; Tue, 19 Nov 2019 10:18:30 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06ECF8018A3;
 Tue, 19 Nov 2019 15:18:28 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-117-49.ams2.redhat.com
 [10.36.117.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D0EE1001925;
 Tue, 19 Nov 2019 15:18:25 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 2/3] mfd: intel_soc_pmic: Rename pwm_backlight pwm-lookup to
 pwm_pmic_backlight
Date: Tue, 19 Nov 2019 16:18:17 +0100
Message-Id: <20191119151818.67531-3-hdegoede@redhat.com>
In-Reply-To: <20191119151818.67531-1-hdegoede@redhat.com>
References: <20191119151818.67531-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 6Hi3OIQRPOWRacUrwh9Eiw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574176711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ngJHwMLUICs8vaerYHR3sXbFbmXOicZXBRb/3hddGFY=;
 b=IfHVMljVfi6lvI0LcpWM6Z+Jb0fzjpaqyWeXvmtsXx45wcif/OpPT6QKLQvbO9SZAkSCIo
 0C2hQmp8o4ucAXFb6KHUL017ijSklaoxU/FSsZ2DYErrzwWMqGvU889Wl6VKH80XLcLxgo
 pzIdyDxKXkERlCPqxj/trSM0D3rHfzs=
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
aGUgTENEJ3MgYmFja2xpZ2h0IGJyaWdodG5lc3MuCgpFaXRoZXIgdGhlIG9uZSBpbnRlZ3JhdGVk
IGludG8gdGhlIFBNSUMgb3IgdGhlIG9uZSBpbnRlZ3JhdGVkIGludG8gdGhlClNvQyAodGhlIDFz
dCBMUFNTIFBXTSBjb250cm9sbGVyKS4KClNvIGZhciBpbiB0aGUgTFBTUyBjb2RlIG9uIEJZVCB3
ZSBoYXZlIHNraXBwZWQgcmVnaXN0ZXJpbmcgdGhlIExQU1MgUFdNCmNvbnRyb2xsZXIgInB3bV9i
YWNrbGlnaHQiIGxvb2t1cCBlbnRyeSB3aGVuIGEgQ3J5c3RhbCBDb3ZlIFBNSUMgaXMKcHJlc2Vu
dCwgYXNzdW1pbmcgdGhhdCBpbiB0aGlzIGNhc2UgdGhlIFBNSUMgUFdNIGNvbnRyb2xsZXIgd2ls
bCBiZSB1c2VkLgoKT24gQ0hUIHdlIGhhdmUgYmVlbiByZWx5aW5nIG9uIG9ubHkgMSBvZiB0aGUg
MiBQV00gY29udHJvbGxlcnMgYmVpbmcKZW5hYmxlZCBpbiB0aGUgRFNEVCBhdCB0aGUgc2FtZSB0
aW1lOyBhbmQgYWx3YXlzIHJlZ2lzdGVyZWQgdGhlIGxvb2t1cC4KClNvIGZhciB0aGlzIGhhcyBi
ZWVuIHdvcmtpbmcsIGJ1dCB0aGUgY29ycmVjdCB3YXkgdG8gZGV0ZXJtaW5lIHdoaWNoIFBXTQpj
b250cm9sbGVyIG5lZWRzIHRvIGJlIHVzZWQgaXMgYnkgY2hlY2tpbmcgYSBiaXQgaW4gdGhlIFZC
VCB0YWJsZSBhbmQKcmVjZW50bHkgSSd2ZSBsZWFybmVkIGFib3V0IDIgZGlmZmVyZW50IEJZVCBk
ZXZpY2VzOgpQb2ludCBvZiBWaWV3IE1PQklJIFRBQi1QODAwVwpBY2VyIFN3aXRjaCAxMCBTVzUt
MDEyCgpXaGljaCB1c2UgYSBDcnlzdGFsIENvdmUgUE1JQywgeWV0IHRoZSBMQ0QgaXMgY29ubmVj
dGVkIHRvIHRoZSBTb0MvTFBTUwpQV00gY29udHJvbGxlciAoYW5kIHRoZSBWQlQgY29ycmVjdGx5
IGluZGljYXRlcyB0aGlzKSwgc28gaGVyZSBvdXIgb2xkCmhldXJpc3RpY3MgZmFpbC4KClNpbmNl
IG9ubHkgdGhlIGk5MTUgZHJpdmVyIGhhcyBhY2Nlc3MgdG8gdGhlIFZCVCwgdGhpcyBjb21taXQg
cmVuYW1lcwp0aGUgInB3bV9iYWNrbGlnaHQiIGxvb2t1cCBlbnRyaWVzIGZvciB0aGUgQ3J5c3Rh
bCBDb3ZlIFBNSUMncyBQV00KY29udHJvbGxlciB0byAicHdtX3BtaWNfYmFja2xpZ2h0IiBzbyB0
aGF0IHRoZSBpOTE1IGRyaXZlciBjYW4gZG8gYQpwd21fZ2V0KCkgZm9yIHRoZSByaWdodCBjb250
cm9sbGVyIGRlcGVuZGluZyBvbiB0aGUgVkJUIGJpdCwgaW5zdGVhZCBvZgp0aGUgaTkxNSBkcml2
ZXIgcmVseWluZyBvbiBhICJwd21fYmFja2xpZ2h0IiBsb29rdXAgZ2V0dGluZyByZWdpc3RlcmVk
CndoaWNoIG1hZ2ljYWxseSBwb2ludHMgdG8gdGhlIHJpZ2h0IGNvbnRyb2xsZXIuCgpTaWduZWQt
b2ZmLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMv
bWZkL2ludGVsX3NvY19wbWljX2NvcmUuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWZkL2ludGVsX3Nv
Y19wbWljX2NvcmUuYyBiL2RyaXZlcnMvbWZkL2ludGVsX3NvY19wbWljX2NvcmUuYwppbmRleCBj
OWYzNTM3OGQzOTEuLjQ3MTg4ZGYzMDgwZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZmQvaW50ZWxf
c29jX3BtaWNfY29yZS5jCisrKyBiL2RyaXZlcnMvbWZkL2ludGVsX3NvY19wbWljX2NvcmUuYwpA
QCAtMzgsNyArMzgsNyBAQCBzdGF0aWMgc3RydWN0IGdwaW9kX2xvb2t1cF90YWJsZSBwYW5lbF9n
cGlvX3RhYmxlID0gewogCiAvKiBQV00gY29uc3VtZWQgYnkgdGhlIEludGVsIEdGWCAqLwogc3Rh
dGljIHN0cnVjdCBwd21fbG9va3VwIGNyY19wd21fbG9va3VwW10gPSB7Ci0JUFdNX0xPT0tVUCgi
Y3J5c3RhbF9jb3ZlX3B3bSIsIDAsICIwMDAwOjAwOjAyLjAiLCAicHdtX2JhY2tsaWdodCIsIDAs
IFBXTV9QT0xBUklUWV9OT1JNQUwpLAorCVBXTV9MT09LVVAoImNyeXN0YWxfY292ZV9wd20iLCAw
LCAiMDAwMDowMDowMi4wIiwgInB3bV9wbWljX2JhY2tsaWdodCIsIDAsIFBXTV9QT0xBUklUWV9O
T1JNQUwpLAogfTsKIAogc3RhdGljIGludCBpbnRlbF9zb2NfcG1pY19pMmNfcHJvYmUoc3RydWN0
IGkyY19jbGllbnQgKmkyYywKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
