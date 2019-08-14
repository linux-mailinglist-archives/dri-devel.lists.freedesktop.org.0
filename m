Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E788D1AF
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 13:03:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10086E5BB;
	Wed, 14 Aug 2019 11:03:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C846E5BB
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 11:03:51 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id EBDEE5C004F;
 Wed, 14 Aug 2019 13:03:49 +0200 (CEST)
MIME-Version: 1.0
Date: Wed, 14 Aug 2019 13:03:49 +0200
From: Stefan Agner <stefan@agner.ch>
To: Robert Chiras <robert.chiras@nxp.com>, robh+dt@kernel.org, Mark Rutland
 <mark.rutland@arm.com>
Subject: Re: [PATCH v2 09/15] dt-bindings: display: Add max-res property for
 mxsfb
In-Reply-To: <1565779731-1300-10-git-send-email-robert.chiras@nxp.com>
References: <1565779731-1300-1-git-send-email-robert.chiras@nxp.com>
 <1565779731-1300-10-git-send-email-robert.chiras@nxp.com>
Message-ID: <491aff3d08f24ab4d79a4f8c139d2e44@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1565780629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h+qnFbGtGsBoI06RuDeq2XvqPu5SKHuKdbyype/t5fw=;
 b=hgI799WtcMNEQuwaU/xBtLvzbOMKG140rFlj52Xnp+/uaD37LtZnWXYmQKB7r5qoPGW/6g
 HrlgwxigfioiacwLCzd02Rrd0wj63zXrEkWSGNsOYESfloYMujDsb0DJ0NH8HoOdRT0Auf
 YWjsYI2r6L8mvxJw/Auzh7E4/S4RHvo=
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOC0xNCAxMjo0OCwgUm9iZXJ0IENoaXJhcyB3cm90ZToKPiBBZGQgbmV3IG9wdGlv
bmFsIHByb3BlcnR5ICdtYXgtcmVzJywgdG8gbGltaXQgdGhlIG1heGltdW0gc3VwcG9ydGVkCj4g
cmVzb2x1dGlvbiBieSB0aGUgTVhTRkJfRFJNIGRyaXZlci4KCkkgd291bGQgYWxzbyBtZW50aW9u
IHRoZSByZWFzb24gd2h5IHdlIG5lZWQgdGhpcy4KCkkgZ3Vlc3MgdGhpcyBuZWVkcyBhIHZlbmRv
ciBwcmVmaXggYXMgd2VsbCAoZnNsLG1heC1yZXMpLiBJIGFsc28gd291bGQKbGlrZSB0byBoYXZl
IHRoZSBhY2sgb2YgdGhlIGRldmljZSB0cmVlIGZvbGtzIGhlcmUuCgotLQpTdGVmYW4KCj4gCj4g
U2lnbmVkLW9mZi1ieTogUm9iZXJ0IENoaXJhcyA8cm9iZXJ0LmNoaXJhc0BueHAuY29tPgo+IC0t
LQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9teHNmYi50eHQg
fCA2ICsrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L214c2ZiLnR4
dAo+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXhzZmIudHh0
Cj4gaW5kZXggNDcyZTFlYS4uNTVlMjJlZCAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9teHNmYi50eHQKPiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9teHNmYi50eHQKPiBAQCAtMTcsNiArMTcsMTIg
QEAgUmVxdWlyZWQgcHJvcGVydGllczoKPiAgUmVxdWlyZWQgc3ViLW5vZGVzOgo+ICAgIC0gcG9y
dDogVGhlIGNvbm5lY3Rpb24gdG8gYW4gZW5jb2RlciBjaGlwLgo+ICAKPiArT3B0aW9uYWwgcHJv
cGVydGllczoKPiArLSBtYXgtcmVzOglhbiBhcnJheSB3aXRoIGEgbWF4aW11bSBvZiB0d28gaW50
ZWdlcnMsIHJlcHJlc2VudGluZyB0aGUKPiArCQltYXhpbXVtIHN1cHBvcnRlZCByZXNvbHV0aW9u
LCBpbiB0aGUgZm9ybSBvZgo+ICsJCTxtYXhYPiwgPG1heFk+OyBpZiBvbmUgb2YgdGhlIGl0ZW0g
aXMgPDA+LCB0aGUgZGVmYXVsdAo+ICsJCWRyaXZlci1kZWZpbmVkIG1heGltdW0gcmVzb2x1dGlv
biBmb3IgdGhhdCBheGlzIGlzIHVzZWQKPiArCj4gIEV4YW1wbGU6Cj4gIAo+ICAJbGNkaWYxOiBk
aXNwbGF5LWNvbnRyb2xsZXJAMjIyMDAwMCB7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
