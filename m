Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7132BB4814
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 09:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A726E95E;
	Tue, 17 Sep 2019 07:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDA56E90E;
 Mon, 16 Sep 2019 10:36:17 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 35DF83E8F9;
 Mon, 16 Sep 2019 10:36:14 +0000 (UTC)
Date: Mon, 16 Sep 2019 06:36:14 -0400
From: Brian Masney <masneyb@onstation.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 05/11] drm/bridge: analogix-anx78xx: correct value of TX_P0
Message-ID: <20190916103614.GA1644@onstation.org>
References: <20190815004854.19860-1-masneyb@onstation.org>
 <CGME20190815004918epcas3p135042bc52c7e3c8b1aca7624d121af97@epcas3p1.samsung.com>
 <20190815004854.19860-6-masneyb@onstation.org>
 <dc10dd84-72e2-553e-669b-271b77b4a21a@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dc10dd84-72e2-553e-669b-271b77b4a21a@samsung.com>
X-Mailman-Approved-At: Tue, 17 Sep 2019 07:17:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1568630176;
 bh=4KQmgz71YU3A68V+Z3HaVPiT+RBIQPuGE3xqAmSJ6fE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mYdC2Jostpc6JnzwEQKwLhjI7/uhjM7Lt0RJ5HB20fuJn1eObXMqrg4rMz0NWQAha
 9mZxUJPUj3+2M4JFGaGm27QPrkXQDLGJNiBeRsEplRktcZoLHydxXxBglCpX5+wd9L
 fPvoREGjrIlTtEyAFeXHDspo9m5N2e4aerYO4rDQ=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 jonas@kwiboo.se, agross@kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, linux-arm-msm@vger.kernel.org,
 enric.balletbo@collabora.com, freedreno@lists.freedesktop.org, sean@poorly.run,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMTYsIDIwMTkgYXQgMTI6MDI6MDlQTSArMDIwMCwgQW5kcnplaiBIYWpkYSB3
cm90ZToKPiBPbiAxNS4wOC4yMDE5IDAyOjQ4LCBCcmlhbiBNYXNuZXkgd3JvdGU6Cj4gPiBXaGVu
IGF0dGVtcHRpbmcgdG8gY29uZmlndXJlIHRoaXMgZHJpdmVyIG9uIGEgTmV4dXMgNSBwaG9uZSAo
bXNtODk3NCksCj4gPiBzZXR0aW5nIHVwIHRoZSBkdW1teSBpMmMgYnVzIGZvciBUWF9QMCB3b3Vs
ZCBmYWlsIGR1ZSB0byBhbiAtRUJVU1kKPiA+IGVycm9yLiBUaGUgZG93bnN0cmVhbSBNU00ga2Vy
bmVsIHNvdXJjZXMgWzFdIHNob3dzIHRoYXQgdGhlIHByb3BlciB2YWx1ZQo+ID4gZm9yIFRYX1Aw
IGlzIDB4NzgsIG5vdCAweDcwLCBzbyBjb3JyZWN0IHRoZSB2YWx1ZSB0byBhbGxvdyBkZXZpY2UK
PiA+IHByb2JpbmcgdG8gc3VjY2VlZC4KPiA+Cj4gPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL0FJ
Q1Ava2VybmVsX2xnZV9oYW1tZXJoZWFkL2Jsb2IvbjcuMS9kcml2ZXJzL3ZpZGVvL3NsaW1wb3J0
L3NsaW1wb3J0X3R4X3JlZy5oCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxt
YXNuZXliQG9uc3RhdGlvbi5vcmc+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L2FuYWxvZ2l4LWFueDc4eHguaCB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9hbmFsb2dpeC1hbng3OHh4LmggYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxv
Z2l4LWFueDc4eHguaAo+ID4gaW5kZXggMjVlMDYzYmNlY2JjLi5iYzUxMWZjNjA1YzkgMTAwNjQ0
Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4eHguaAo+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC1hbng3OHh4LmgKPiA+IEBAIC02
LDcgKzYsNyBAQAo+ID4gICNpZm5kZWYgX19BTlg3OHh4X0gKPiA+ICAjZGVmaW5lIF9fQU5YNzh4
eF9ICj4gPiAgCj4gPiAtI2RlZmluZSBUWF9QMAkJCQkweDcwCj4gPiArI2RlZmluZSBUWF9QMAkJ
CQkweDc4Cj4gCj4gCj4gVGhpcyBib3RoZXJzIG1lIGxpdHRsZS4gVGhlcmUgYXJlIG5vIHVwc3Ry
ZWFtIHVzZXJzLCBncmVwcGluZyBhbmRyb2lkCj4gc291cmNlcyBzdWdnZXN0cyB0aGF0IGJvdGgg
dmFsdWVzIGNhbiBiZSB1c2VkIFsxXVsyXcKgIChncmVwIGZvciAiI2RlZmluZQo+IFRYX1AwIiks
IG1vcmVvdmVyIHRoZXJlIGlzIGNvZGUgc3VnZ2VzdGluZyBib3RoIHZhbHVlcyBjYW4gYmUgdmFs
aWQgWzNdLgo+IAo+IENvdWxkIHlvdSB2ZXJpZnkgZGF0YXNoZWV0IHdoaWNoIGkyYyBzbGF2ZSBh
ZGRyZXNzZXMgYXJlIHZhbGlkIGZvciB0aGlzCj4gY2hpcCwgaWYgYm90aCBJIGd1ZXNzIHRoaXMg
cGF0Y2ggc2hvdWxkIGJlIHJld29ya2VkLgo+IAo+IAo+IFsxXToKPiBodHRwczovL2FuZHJvaWQu
Z29vZ2xlc291cmNlLmNvbS9rZXJuZWwvbXNtLysvYW5kcm9pZC1tc20tZmxvLTMuNC1qYi1tcjIv
ZHJpdmVycy9taXNjL3NsaW1wb3J0X2FueDc4MDgvc2xpbXBvcnRfdHhfcmVnLmgKPiAKPiBbMl06
Cj4gaHR0cHM6Ly9naXRodWIuY29tL0FuZHJvaWRHWC9TaW1wbGVHWC1NTS02LjBfSDgxNV8yMGQv
YmxvYi9tYXN0ZXIvZHJpdmVycy92aWRlby9zbGltcG9ydC9hbng3ODEyL3NsaW1wb3J0NzgxMl90
eF9yZWcuaAo+IAo+IFszXToKPiBodHRwczovL2dpdGh1Yi5jb20vY29tbWFhaS9hbmRyb2lkX2tl
cm5lbF9sZWVjb19tc204OTk2L2Jsb2IvbWFzdGVyL2RyaXZlcnMvdmlkZW8vbXNtL21kc3MvZHAv
c2xpbXBvcnRfY3VzdG9tX2RlY2xhcmUuaCNMNzMKClRoaXMgYWRkcmVzcyBpcyAweDc4IG9uIG15
IE5leHVzIDUuIEdpdmVuIFszXSBhYm92ZSBpdCBsb29rcyBsaWtlIHdlCm5lZWQgdG8gc3VwcG9y
dCBib3RoIGFkZHJlc3Nlcy4gV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgbW92aW5nIHRoZXNlCmFk
ZHJlc3NlcyBpbnRvIGRldmljZSB0cmVlPwoKVGhlIGRvd25zdHJlYW0gYW5kIHVwc3RyZWFtIGtl
cm5lbCBzb3VyY2VzIGRpdmlkZSB0aGVzZSBhZGRyZXNzZXMgYnkgdHdvCnRvIGdldCB0aGUgaTJj
IGFkZHJlc3MuIEhlcmUncyB0aGUgY29kZSBpbiB1cHN0cmVhbToKCmh0dHBzOi8vZWxpeGlyLmJv
b3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFs
b2dpeC1hbng3OHh4LmMjTDEzNTMKaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0
ZXN0L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4eHguYyNMNDEK
CkknbSBub3Qgc3VyZSB3aHkgdGhlIGFjdHVhbCBpMmMgYWRkcmVzcyBpc24ndCB1c2VkIGluIHRo
aXMgY29kZS4KCkJyaWFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
