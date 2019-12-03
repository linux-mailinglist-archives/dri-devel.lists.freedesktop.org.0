Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 497F31103F0
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 19:02:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA526E86C;
	Tue,  3 Dec 2019 18:02:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BFF898BC
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 18:02:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 03B3E309;
 Tue,  3 Dec 2019 19:02:30 +0100 (CET)
Date: Tue, 3 Dec 2019 20:02:23 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v4 07/11] drm/bridge: Clarify the atomic enable/disable
 hooks semantics
Message-ID: <20191203180223.GS4730@pendragon.ideasonboard.com>
References: <20191203141515.3597631-1-boris.brezillon@collabora.com>
 <20191203141515.3597631-8-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203141515.3597631-8-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575396151;
 bh=m36J6IT7250D3XBj/8ZSZZRsiNcc0jchQ6du9m7Wnbk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eIscy6XJQ+KROvAxHpEQAp6dfxLbPL6Wd0AWK6S+YTU/VG0XvumtLxzstNedE6GwB
 zs6pxR1dT6tSMVWFf4fXRWeseaLgyohDjjIU9CCofa9ynCDmlEp+DwSJMyttho5HBS
 rlX0N3pDlSxggOulzXHuJo3kzWzDGRvsmvDmYlwI=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Chris Healy <cphealy@gmail.com>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Seung-Woo Kim <sw0312.kim@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQm9yaXMsCgpUaGFua3MgZm9yIHRoZSBwYXRjaC4KCk9uIFR1ZSwgRGVjIDAzLCAyMDE5IGF0
IDAzOjE1OjExUE0gKzAxMDAsIEJvcmlzIEJyZXppbGxvbiB3cm90ZToKPiBUaGUgW3ByZV9dZW5h
YmxlL1twb3N0X11kaXNhYmxlIGhvb2tzIGFyZSBwYXNzZWQgdGhlIG9sZCBhdG9taWMgc3RhdGUu
Cj4gVXBkYXRlIHRoZSBkb2MgYW5kIHJlbmFtZSB0aGUgYXJndW1lbnRzIHRvIG1ha2UgaXQgY2xl
YXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25A
Y29sbGFib3JhLmNvbT4KPiBSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5w
aW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+IFJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8
bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2NDoKPiAqIERyb3Ag
dGhlIGRvYyB1cGRhdGUgKExhdXJlbnQpCgpJIHdhcyByZWZlcnJpbmcgdG8gdGhlIGRvYyB1cGRh
dGVzIGluIGRybV9icmlkZ2UuaCBvbmx5LiBJcyB0aGVyZSBhCnJlYXNvbiB5b3UgZHJvcHBlZCB0
aGUgY2hhbmdlcyBmcm9tIGRybV9icmlkZ2UuYyA/IEkgdGhpbmsgdGhvc2Ugd2VyZQpnb29kLgoK
PiAqIEFkZCBSYnMKPiAKPiBDaGFuZ2VzIGluIHYzOgo+ICogTmV3IHBhdGNoCj4gLS0tCj4gIGlu
Y2x1ZGUvZHJtL2RybV9icmlkZ2UuaCB8IDggKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9k
cm0vZHJtX2JyaWRnZS5oIGIvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oCj4gaW5kZXggYmZiMDM4
NTE2M2YxLi5kN2Q3MTQwMjMwNTAgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2JyaWRn
ZS5oCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oCj4gQEAgLTI2Myw3ICsyNjMsNyBA
QCBzdHJ1Y3QgZHJtX2JyaWRnZV9mdW5jcyB7Cj4gIAkgKiBUaGUgQGF0b21pY19wcmVfZW5hYmxl
IGNhbGxiYWNrIGlzIG9wdGlvbmFsLgo+ICAJICovCj4gIAl2b2lkICgqYXRvbWljX3ByZV9lbmFi
bGUpKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCj4gLQkJCQkgIHN0cnVjdCBkcm1fYXRvbWlj
X3N0YXRlICpzdGF0ZSk7Cj4gKwkJCQkgIHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpvbGRfc3Rh
dGUpOwo+ICAKPiAgCS8qKgo+ICAJICogQGF0b21pY19lbmFibGU6Cj4gQEAgLTI4OCw3ICsyODgs
NyBAQCBzdHJ1Y3QgZHJtX2JyaWRnZV9mdW5jcyB7Cj4gIAkgKiBUaGUgQGF0b21pY19lbmFibGUg
Y2FsbGJhY2sgaXMgb3B0aW9uYWwuCj4gIAkgKi8KPiAgCXZvaWQgKCphdG9taWNfZW5hYmxlKShz
dHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAo+IC0JCQkgICAgICBzdHJ1Y3QgZHJtX2F0b21pY19z
dGF0ZSAqc3RhdGUpOwo+ICsJCQkgICAgICBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqb2xkX3N0
YXRlKTsKPiAgCS8qKgo+ICAJICogQGF0b21pY19kaXNhYmxlOgo+ICAJICoKPiBAQCAtMzExLDcg
KzMxMSw3IEBAIHN0cnVjdCBkcm1fYnJpZGdlX2Z1bmNzIHsKPiAgCSAqIFRoZSBAYXRvbWljX2Rp
c2FibGUgY2FsbGJhY2sgaXMgb3B0aW9uYWwuCj4gIAkgKi8KPiAgCXZvaWQgKCphdG9taWNfZGlz
YWJsZSkoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKPiAtCQkJICAgICAgIHN0cnVjdCBkcm1f
YXRvbWljX3N0YXRlICpzdGF0ZSk7Cj4gKwkJCSAgICAgICBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0
ZSAqb2xkX3N0YXRlKTsKPiAgCj4gIAkvKioKPiAgCSAqIEBhdG9taWNfcG9zdF9kaXNhYmxlOgo+
IEBAIC0zMzcsNyArMzM3LDcgQEAgc3RydWN0IGRybV9icmlkZ2VfZnVuY3Mgewo+ICAJICogVGhl
IEBhdG9taWNfcG9zdF9kaXNhYmxlIGNhbGxiYWNrIGlzIG9wdGlvbmFsLgo+ICAJICovCj4gIAl2
b2lkICgqYXRvbWljX3Bvc3RfZGlzYWJsZSkoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKPiAt
CQkJCSAgICBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUpOwo+ICsJCQkJICAgIHN0cnVj
dCBkcm1fYXRvbWljX3N0YXRlICpvbGRfc3RhdGUpOwo+ICB9Owo+ICAKPiAgLyoqCgotLSAKUmVn
YXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
