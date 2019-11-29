Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E03A910D9D2
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 19:58:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C8E6EA32;
	Fri, 29 Nov 2019 18:58:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD966E974
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 18:58:45 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-TNtv4G4MO_W624z8NTgYgg-1; Fri, 29 Nov 2019 13:58:43 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6B49800D53;
 Fri, 29 Nov 2019 18:58:40 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-133.ams2.redhat.com
 [10.36.116.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 520F410013D9;
 Fri, 29 Nov 2019 18:58:38 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/2] drm/i915/vlv_dsi: Control panel and backlight enable
 GPIOs on BYT
Date: Fri, 29 Nov 2019 19:58:34 +0100
Message-Id: <20191129185836.2789-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: TNtv4G4MO_W624z8NTgYgg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1575053924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ndgZl1BU7Nm/41TrwrerRMnL4cbZ50j76RV/soO6yek=;
 b=cOITZ4l6fabF+W/+UoxLuDCMH1N0ZVr2MXNViNRVQ73d03K7uH2OdmdTm7VeZksNLK88Fr
 uKF268xTgAA8Mklv31F8wYCzqSGSRnIfCye9xG3rP0cmTqFBYg6v7LIN1GGLA13wOrBiRJ
 Lhgk6ijtTux4mL1cc8drYiI8+7Tu6AY=
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWxsLAoKT24gQmF5IFRyYWlsIGRldmljZXMgdGhlIE1JUEkgcG93ZXIgb24vb2ZmIHNlcXVl
bmNlcyBmb3IgRFNJIExDRCBwYW5lbHMKZG8gbm90IGNvbnRyb2wgdGhlIExDRCBwYW5lbC0gYW5k
IGJhY2tsaWdodC1lbmFibGUgR1BJT3MuIFNvIGZhciwgd2hlbgp0aGUgVkJUIGluZGljYXRlcyB3
ZSBzaG91bGQgdXNlIHRoZSBTb0MgZm9yIGJhY2tsaWdodCBjb250cm9sLCB3ZSBoYXZlCmJlZW4g
cmVseWluZyBvbiB0aGVzZSBHUElPcyBiZWluZyBjb25maWd1cmVkIGFzIG91dHB1dCBhbmQgZHJp
dmVuIGhpZ2ggYnkKdGhlIFZpZGVvIEJJT1MgKEdPUCkgd2hlbiBpdCBpbml0aWFsaXplcyB0aGUg
cGFuZWwuCgpUaGlzIGRvZXMgbm90IHdvcmsgd2hlbiB0aGUgZGV2aWNlIGlzIGJvb3RlZCB3aXRo
IGEgSERNSSBtb25pdG9yIGNvbm5lY3RlZAphcyB0aGVuIHRoZSBHT1Agd2lsbCBpbml0aWFsaXpl
IHRoZSBIRE1JIGluc3RlYWQgb2YgdGhlIHBhbmVsLCBsZWF2aW5nIHRoZQpwYW5lbCBibGFjaywg
ZXZlbiB0aG91Z2ggdGhlIGk5MTUgZHJpdmVyIHRyaWVzIHRvIG91dHB1dCBhbiBpbWFnZSB0byBp
dC4KCkxpa2V3aXNlIG9uIHNvbWUgZGV2aWNlLW1vZGVscyB3aGVuIHRoZSBHT1AgZG9lcyBub3Qg
aW5pdGlhbGl6ZSB0aGUgRFNJCnBhbmVsIGl0IGFsc28gbGVhdmVzIHRoZSBtdXggb2YgdGhlIFBX
TTAgcGluIGluIGdlbmVyaWMgR1BJTyBtb2RlIGluc3RlYWQKb2YgbXV4aW5nIGl0IHRvIHRoZSBQ
V00gY29udHJvbGxlci4KClRoaXMgc2VyaWVzIGNvbnRhaW5zIDIgcGF0Y2hlcyB3aGljaCB0b2dl
dGhlciBmaXggdGhpcy4KClRvIGF2b2lkIG5ldyBlcnJvcnMgaW4gdGhlIGludGVsLWdmeCBDSSAo
YXNzdW1pbmcgdGhlcmUgaXMgYXRsZWFzdCAxCkJZVCBkZXZpY2UgdGhlcmUgd2l0aCBhIERTSSBw
YW5lbCksIHdlIG5lZWQgYm90aCBvZiB0aGVzZSBwYXRjaGVzIHRvCmJlIG1lcmdlZCB0aHJvdWdo
IHRoZSBkcm0taW50ZWwgdHJlZS4KClVuZm9ydHVuYXRlbHkgdGhlcmUgaXMgc29tZSBjaHVybiBj
dXJyZW50bHkgZ29pbmcgb24gaW4gdGhlCnBpbmN0cmwtYmF5dHJhaWwuYyBjb2RlLCBidXQgbm90
IGluIHRoZSBwYXJ0IG9mIHRoZSBmaWxlIHdoaWNoIHRoaXMKdG91Y2hlcywgc28gbWVyZ2luZyB0
aGUgcGluY3RybC1iYXl0cmFpbC5jIGNoYW5nZXMgdGhyb3VnaCB0aGUKZHJtLWludGVsIHRyZWUg
c2hvdWxkIG5vdCBsZWFkIHRvIGNvbmZsaWN0cyBsYXRlci4KCkFuZHksIE1pa2EsIGFzc3VtaW5n
IHlvdSBhcmUgaGFwcHkgd2l0aCB0aGUgY2hhbmdlcywgY2FuIEkgZ2V0IHlvdXIgYWNrCmZvciBt
ZXJnaW5nIHRoZSBwaW5jdHJsLWJheXRyYWlsIHBhdGNoIHRocm91Z2h0IHRoZSBkcm0taW50ZW9s
IHRyZWU/CgpSZWdhcmRzLAoKSGFucwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
