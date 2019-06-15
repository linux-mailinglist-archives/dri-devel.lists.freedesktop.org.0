Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE2947168
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2019 19:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 654C1890BD;
	Sat, 15 Jun 2019 17:31:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A6B890BD
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2019 17:31:52 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3A8812183F;
 Sat, 15 Jun 2019 17:31:51 +0000 (UTC)
Date: Sat, 15 Jun 2019 19:31:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Saiyam Doshi <saiyamdoshi.in@gmail.com>
Subject: Re: [PATCH] staging: android: fix style problem
Message-ID: <20190615173149.GA4914@kroah.com>
References: <20190614194156.GA21401@ahmlpt0706>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614194156.GA21401@ahmlpt0706>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560619911;
 bh=ki57qw7fa8b6x/4E3LJnw7yuNUaGH8nau7t+aC1ZAH0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aeFnGqUIDNpedj/qDPE4wh7ak9hIYNjSBa3kWK5VyzOnnxc+xVwloYeLy3Cm+i0uP
 utmqIVBnbOH3PlmlHY19qfyLFZ9T9ZEvr81M4lyNG/QOom3p1dM3fT6hF2ffYyAGvu
 a40JBYA7ekfR/IZVekqD05iWqfD2D0UWKoZTm5dw=
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
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBKdW4gMTUsIDIwMTkgYXQgMDE6MTE6NTZBTSArMDUzMCwgU2FpeWFtIERvc2hpIHdy
b3RlOgo+IGNoZWNrcGF0Y2ggcmVwb3J0ZWQgIldBUk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0
ZXJzIi4gVGhpcwo+IHBhdGNoIGZpeGVzIGl0IGJ5IGFsaWduaW5nIGZ1bmN0aW9uIGFyZ3VtZW50
cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTYWl5YW0gRG9zaGkgPHNhaXlhbWRvc2hpLmluQGdtYWls
LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9zdGFnaW5nL2FuZHJvaWQvaW9uL2lvbl9jaHVua19oZWFw
LmMgfCA0ICsrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvYW5kcm9pZC9pb24vaW9uX2No
dW5rX2hlYXAuYyBiL2RyaXZlcnMvc3RhZ2luZy9hbmRyb2lkL2lvbi9pb25fY2h1bmtfaGVhcC5j
Cj4gaW5kZXggM2NkZGU5YzFhNzE3Li42YWNlYWIyZTc3ZTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9zdGFnaW5nL2FuZHJvaWQvaW9uL2lvbl9jaHVua19oZWFwLmMKPiArKysgYi9kcml2ZXJzL3N0
YWdpbmcvYW5kcm9pZC9pb24vaW9uX2NodW5rX2hlYXAuYwo+IEBAIC0xMDcsNyArMTA3LDkgQEAg
c3RhdGljIHN0cnVjdCBpb25faGVhcF9vcHMgY2h1bmtfaGVhcF9vcHMgPSB7Cj4gIAkudW5tYXBf
a2VybmVsID0gaW9uX2hlYXBfdW5tYXBfa2VybmVsLAo+ICB9Owo+ICAKPiAtc3RydWN0IGlvbl9o
ZWFwICppb25fY2h1bmtfaGVhcF9jcmVhdGUocGh5c19hZGRyX3QgYmFzZSwgc2l6ZV90IHNpemUs
IHNpemVfdCBjaHVua19zaXplKQo+ICtzdHJ1Y3QgaW9uX2hlYXAgKmlvbl9jaHVua19oZWFwX2Ny
ZWF0ZShwaHlzX2FkZHJfdCBiYXNlLAo+ICsJCQkJICAgICAgIHNpemVfdCBzaXplLAo+ICsJCQkJ
ICAgICAgIHNpemVfdCBjaHVua19zaXplKQoKSnVzdCBicmVhayB0aGUgbGluZSBhdCAic2l6ZV90
IHNpemUsIiwgbm8gbmVlZCBmb3IgMyBsaW5lcyB3aGVuIDIgd2lsbApkby4KCnRoYW5rcywKCmdy
ZWcgay1oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
