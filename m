Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 287DD107B2F
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2019 00:16:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42EAB6E12B;
	Fri, 22 Nov 2019 23:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003AC6E12B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 23:16:33 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-nsI8QOLrMtq3qYavP0mS_Q-1; Fri, 22 Nov 2019 18:16:31 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CC94100726A;
 Fri, 22 Nov 2019 23:16:28 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-34.bss.redhat.com
 [10.20.1.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21F8B19C4F;
 Fri, 22 Nov 2019 23:16:24 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/5] drm/i915: eDP DPCD aux backlight fixes
Date: Fri, 22 Nov 2019 18:15:58 -0500
Message-Id: <20191122231616.2574-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: nsI8QOLrMtq3qYavP0mS_Q-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574464592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=h66orNIRlxipn9OanQ0e7UoO0EZyQRcJCeSlCInnFok=;
 b=ctI5nV54BuKgzA8CYkGiHvKmkoJm5K2A+NKdIck3ZWQmddHrBKvfzpe0TcAHnDCll9xpOq
 /XEYAElft3asYjFy4MZOYaSncdgRdphEuHv12tySO+6pnehwwVXDyBWqbbUWEmBeA/Gedq
 x77IUNCZxuwdQ9xnRNNRsQO9KUCo9FE=
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lee Shawn C <shawn.c.lee@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSByZWNlbnRseSBnb3QgYSBUaGlua1BhZCBYMSBFeHRyZW1lIDJuZCBHZW5lcmF0aW9uIGZvciBm
aXhpbmcgc29tZQppc3N1ZXMgb24sIGFuZCBub3RpY2VkIHRoYXQgb3V0IG9mIHRoZSBib3ggdGhl
IGJhY2tsaWdodCBkb2Vzbid0IHdvcmsuCkFsb25nIHRoZSB3YXkgb2YgZml4aW5nIHRoYXQsIEkg
Zm91bmQgYSBmZXcgaXNzdWVzIHdpdGggaG93IGk5MTUgaGFuZGxlcwpEUENEIEFVWCBiYWNrbGln
aHQgY29udHJvbCBhbmQgZml4ZWQgdGhlbS4gTm93IEkndmUgZ290IHdvcmtpbmcKYmFja2xpZ2h0
IGNvbnRyb2xzLCBob29yYXkhCgpOb3RlIHRoYXQgdGhpcyBwYXRjaCBzZXJpZXMgYWxzbyBlbmFi
bGVzIERQQ0QgYXV4IGJhY2tsaWdodCBjb250cm9sIGJ5CmRlZmF1bHQgYmFzZWQgb24gd2hhdCB0
aGUgVkJUIHRlbGxzIHVzLgoKTHl1ZGUgUGF1bCAoNSk6CiAgZHJtL2k5MTU6IEZpeCBlRFAgRFBD
RCBhdXggbWF4IGJhY2tsaWdodCBjYWxjdWxhdGlvbnMKICBkcm0vaTkxNTogQXNzdW1lIDEwMCUg
YnJpZ2h0bmVzcyB3aGVuIG5vdCBpbiBEUENEIGNvbnRyb2wgbW9kZQogIGRybS9pOTE1OiBGaXgg
RFBDRCByZWdpc3RlciBvcmRlciBpbiBpbnRlbF9kcF9hdXhfZW5hYmxlX2JhY2tsaWdodCgpCiAg
ZHJtL2k5MTU6IEF1dG8gZGV0ZWN0IERQQ0QgYmFja2xpZ2h0IHN1cHBvcnQgYnkgZGVmYXVsdAog
IGRybS9pOTE1OiBGb3JjZSBEUENEIGJhY2tsaWdodCBtb2RlIG9uIFgxIEV4dHJlbWUgMm5kIEdl
biA0SyBBTU9MRUQKICAgIHBhbmVsCgogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYyAg
ICAgICAgICAgICAgIHwgICA0ICsKIC4uLi9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlf
dHlwZXMuaCAgICB8ICAgMyArCiAuLi4vZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9hdXhfYmFj
a2xpZ2h0LmMgfCAxNjcgKysrKysrKysrKysrLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9p
OTE1X3BhcmFtcy5jICAgICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5
MTVfcGFyYW1zLmggICAgICAgICAgICB8ICAgMiArLQogaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBl
ci5oICAgICAgICAgICAgICAgICAgIHwgICA4ICsKIDYgZmlsZXMgY2hhbmdlZCwgMTM0IGluc2Vy
dGlvbnMoKyksIDUyIGRlbGV0aW9ucygtKQoKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
