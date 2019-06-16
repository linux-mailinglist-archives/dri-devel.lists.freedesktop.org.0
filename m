Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35408474FD
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 16:02:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3720C8923C;
	Sun, 16 Jun 2019 14:02:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.daemonic.se (mail.daemonic.se [176.58.89.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A673891AF
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 13:53:07 +0000 (UTC)
Received: from cid.daemonic.se (localhost [IPv6:::1])
 by mail.daemonic.se (Postfix) with ESMTP id 45RbQT2D09z3klB;
 Sun, 16 Jun 2019 13:53:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at daemonic.se
Received: from mail.daemonic.se ([IPv6:::1]) (using TLS with cipher
 ECDHE-RSA-AES128-GCM-SHA256)
 by cid.daemonic.se (mailscanner.daemonic.se [IPv6:::1]) (amavisd-new,
 port 10587)
 with ESMTPS id P_O1uTvlBDwU; Sun, 16 Jun 2019 13:53:04 +0000 (UTC)
Received: from vivi.daemonic.se (vivi.daemonic.se [IPv6:2001:470:dca9:2::4])
 by mail.daemonic.se (Postfix) with ESMTPSA id 45RbQS3qzDz3kl9;
 Sun, 16 Jun 2019 13:53:04 +0000 (UTC)
Subject: Re: [PATCH libdrm 2/2] meson.build: Fix meson script on FreeBSD
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20190602181600.83963-1-zeising@daemonic.se>
 <20190602181600.83963-3-zeising@daemonic.se>
 <CACvgo52ZrYEq+R4gpLFfMsaGy+uWQ0gPBUA2PVHe=7ihu0rr-g@mail.gmail.com>
From: Niclas Zeising <zeising@daemonic.se>
Message-ID: <1e6f4e2b-c697-0099-a99a-aea22ff3096f@daemonic.se>
Date: Sun, 16 Jun 2019 15:52:56 +0200
User-Agent: Mozilla/5.0 (X11; FreeBSD amd64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CACvgo52ZrYEq+R4gpLFfMsaGy+uWQ0gPBUA2PVHe=7ihu0rr-g@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 16 Jun 2019 14:01:48 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=daemonic.se; h=
 content-transfer-encoding:content-language:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received; s=20151023; t=1560693184; bh=2k0omCqE9X/menDuSi9dytU8
 d6YcZrGXNrOQsJ1xdQo=; b=KwXmXbm09hoWaFNbEGbf5y+qnRRm1ridtbAmfhfe
 LvK6039CYLHKOpcAjFuGZN31MMLpkrbN0gtYz+5BrfSurxS312aZh3oY7uY2qfuX
 C1p4j3iQNvbHHEPoo68ARHb8LC4B7pjGsbLqsGoTd98/cwJPNxmpAnCpjrMBnki5
 d70=
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNi0xNiAxNToxNiwgRW1pbCBWZWxpa292IHdyb3RlOgo+IE9uIE1vbiwgMyBKdW4g
MjAxOSBhdCAwODo0MSwgTmljbGFzIFplaXNpbmcgPHplaXNpbmdAZGFlbW9uaWMuc2U+IHdyb3Rl
Ogo+Pgo+PiBGcmVlQlNEIHJlcXVpcmVzIHN5cy90eXBlcy5oIGZvciBzeXMvc3lzY3RsLmgsIGFk
ZCBpdCBhcyBwYXJ0IG9mIHRoZQo+PiBpbmNsdWRlcyB3aGVuIGNoZWNraW5nIGZvciBoZWFkZXJz
Lgo+PiBJbnN0ZWFkIG9mIHNwbGl0dGluZyBvdXQgdGhlIGNoZWNrIGZvciBzeXMvc3lzY3RsLmgg
ZnJvbSB0aGUgb3RoZXIKPj4gaGVhZGVyIGNoZWNrcywganVzdCBhZGQgc3lzL3R5cGVzLmggdG8g
YWxsIGhlYWRlciBjaGVja3MuCj4+Cj4gSWYgaGVhZGVyIFggZGVwZW5kcyBvbiBZLCB0aGVuIHRo
ZSBmb3JtZXIgc2hvdWxkIGluY2x1ZGUgWS4KPiBDYW4geW91IHBsZWFzZSBmaWxlIGEgRnJlZUJT
RCBidWc/CgpUaGlzIGlzIGhvdyBpdCdzIGRvY3VtZW50ZWQgaW4gdGhlIHN5c2N0bCgzKSBtYW51
YWwgb24gRnJlZUJTRC4gIEkgd2lsbCAKYXNrIGFyb3VuZCB3aHkgdGhhdCBpcywgYnV0IEkgZG9u
J3QgZXhwZWN0IGl0IHRvIGNoYW5nZS4KCj4gCj4gVGhhdCBzYWlkLCB0aGUgd29ya2Fyb3VuZCBp
cyBzYWZlLCBzbyBJJ2xsIHNwbGl0IGl0IG91dCArIGFkZCBhIGNvbW1lbnQuCj4gSSdsbCBzZW5k
IHYyIGluIGEgc2Vjb25kLgo+IAo+PiBGcmVlQlNEIGRvZXNuJ3Qgbm9ybWFsbHkgc2hpcCBiYXNo
LCB0cnkgcmVndWxhciBzaCBpbnN0ZWFkIGlmIHdlIGNhbid0Cj4+IGZpbmQgYmFzaC4KPiAKPiBB
Y3R1YWxseSBub3Qgc3VyZSB3aHkgd2UncmUgbG9va2luZyBmb3IgYmFzaC4gVGhlIGxvdCB3b3Jr
cyBmaW5lIHdpdGgKPiBiYXNoLCB6c2gsIGRhc2gsIGtzaCB5b3UtbmFtZSBpdC4KPiBXaWxsIGlu
Y2x1ZGUgdGhvc2Ugd2l0aCB2Mi4KCkFzIGxvbmcgYXMgaXQncyBvbmx5IHVzaW5nIHBvc2l4IHN0
dWZmLCBGcmVlQlNEIC9iaW4vc2ggc2hvdWxkIHdvcmsgCmZpbmUsIGFzIHNob3VsZCB0aG9zZSBv
dGhlcnMsIEkgdGhpbmsuCkkgaGFkIG5vIHByb2JsZW1zIHJ1bm5pbmcgdGhlIHRlc3RzIHdpdGgg
RnJlZUJTRCAvYmluL3NoIHdoZW4gSSB0cmllZCwgCmF0IGxlYXN0LgpSZWdhcmRzCi0tIApOaWNs
YXMgWmVpc2luZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
