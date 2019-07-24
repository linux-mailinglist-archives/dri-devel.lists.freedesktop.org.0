Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7557D72737
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 07:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D97126E444;
	Wed, 24 Jul 2019 05:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6812D6E444
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 05:17:04 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 940CD200CD;
 Wed, 24 Jul 2019 07:17:01 +0200 (CEST)
Date: Wed, 24 Jul 2019 07:17:00 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: Re: [PATCH] rpi_touchscreen_probe: check for failure case
Message-ID: <20190724051700.GA22730@ravnborg.org>
References: <20190724025644.17163-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724025644.17163-1-navid.emamdoost@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8
 a=ONRsVvzFGko7FBthncQA:9 a=CjuIK1q_8ugA:10
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
Cc: David Airlie <airlied@linux.ie>, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 smccaman@umn.edu, emamd001@umn.edu
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTmF2aWQuCgpUaGFua3MgZm9yIHlvdXIgcGF0Y2guCk9uIFR1ZSwgSnVsIDIzLCAyMDE5IGF0
IDA5OjU2OjQzUE0gLTA1MDAsIE5hdmlkIEVtYW1kb29zdCB3cm90ZToKPiBvZl9ncmFwaF9nZXRf
bmV4dF9lbmRwb2ludCBtYXkgcmV0dXJuIE5VTEwsIHNvIG51bGwgY2hlY2sgaXMgbmVlZGVkLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IE5hdmlkIEVtYW1kb29zdCA8bmF2aWQuZW1hbWRvb3N0QGdtYWls
LmNvbT4KClRoZSBwYXRjaCBsb29rcyBmaW5lLCBidXQgY291bGQgeW91IHBsZWFzZSBhdWRpdCB0
aGUgb3RoZXIgY2FsbHMgaW4gdGhlCnByb2JlIGZ1bmN0aW9uLiBGb3IgZXhhbXBsZSBvZl9ncmFw
aF9nZXRfcmVtb3RlX3BvcnRfcGFyZW50KCkgbWF5IGFsc28KcmV0dXJuIE5VTEwuCklmIHlvdSBk
byB0aGlzIHRoZW4gd2UgY2FuIGhhdmUgdGhlIGVycm9yIGhhbmRsaW5nIHJldmlld2VkIGluIG9u
ZSBnbywKYW5kIGZpeGVkIGluIG9uZSBwYXRjaC4KCglTYW0KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9wYW5lbC9wYW5lbC1yYXNwYmVycnlwaS10b3VjaHNjcmVlbi5jIHwgMiArKwo+ICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9wYW5lbC9wYW5lbC1yYXNwYmVycnlwaS10b3VjaHNjcmVlbi5jIGIvZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLXJhc3BiZXJyeXBpLXRvdWNoc2NyZWVuLmMKPiBpbmRleCAyOGMwNjIw
ZGZlMGYuLjJlMDk3N2UyNmZhYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwtcmFzcGJlcnJ5cGktdG91Y2hzY3JlZW4uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9w
YW5lbC9wYW5lbC1yYXNwYmVycnlwaS10b3VjaHNjcmVlbi5jCj4gQEAgLTM5OSw2ICszOTksOCBA
QCBzdGF0aWMgaW50IHJwaV90b3VjaHNjcmVlbl9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqaTJj
LAo+ICAKPiAgCS8qIExvb2sgdXAgdGhlIERTSSBob3N0LiAgSXQgbmVlZHMgdG8gcHJvYmUgYmVm
b3JlIHdlIGRvLiAqLwo+ICAJZW5kcG9pbnQgPSBvZl9ncmFwaF9nZXRfbmV4dF9lbmRwb2ludChk
ZXYtPm9mX25vZGUsIE5VTEwpOwo+ICsJaWYgKCFlbmRwb2ludCkKPiArCQlyZXR1cm4gLUVOT0RF
VjsKPiAgCWRzaV9ob3N0X25vZGUgPSBvZl9ncmFwaF9nZXRfcmVtb3RlX3BvcnRfcGFyZW50KGVu
ZHBvaW50KTsKPiAgCWhvc3QgPSBvZl9maW5kX21pcGlfZHNpX2hvc3RfYnlfbm9kZShkc2lfaG9z
dF9ub2RlKTsKPiAgCW9mX25vZGVfcHV0KGRzaV9ob3N0X25vZGUpOwo+IC0tIAo+IDIuMTcuMQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
