Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D415CCCB0
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 22:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2250F6E0AC;
	Sat,  5 Oct 2019 20:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F32E6E0AC
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2019 20:36:14 +0000 (UTC)
Received: from [IPv6:2a02:2450:102f:13b8:f5c5:3670:52:6079] (unknown
 [IPv6:2a02:2450:102f:13b8:f5c5:3670:52:6079])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: robertfoss)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E2A9B28D7FF;
 Sat,  5 Oct 2019 21:36:12 +0100 (BST)
Subject: Re: liboutput: thoughts about shared library on top of DRM/KMS
To: Keith Packard <keithp@keithp.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 simon.ser@intel.com
References: <87y2xzqimw.fsf@keithp.com>
From: Robert Foss <robert.foss@collabora.com>
Message-ID: <cf4e90c3-3bdf-cbfd-58ed-19dc111f4c63@collabora.com>
Date: Sat, 5 Oct 2019 22:36:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87y2xzqimw.fsf@keithp.com>
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGV5IEtlaXRoLAoKVGhhbmtzIGZvciBzZXR0aW5nIHRoaXMgdXAsIGFuZCBwaWNraW5nIGEgZGVz
Y3JpcHRpdmUgcHJvamVjdCBuYW1lIDopCgpIb3cgaXMgbGlib3V0cHV0IGdvaW5nIHRvIHJlbGF0
ZSB0byB0aGUgbGlibGlmdG9mZlsxXSBwcm9qZWN0PwoKClsxXSBodHRwczovL2dpdGh1Yi5jb20v
ZW1lcnNpb24vbGlibGlmdG9mZgoKClJvYi4KCk9uIDA1LjEwLjE5IDE4OjA5LCBLZWl0aCBQYWNr
YXJkIHdyb3RlOgo+IAo+IER1cmluZyBYREMgdGhpcyB5ZWFyLCB3ZSBoZWFyZCBhIGZldyBwcmVz
ZW50YXRpb25zIGFuZCBoYWQgYSBsb3Qgb2YKPiBoYWxsd2F5IHRhbGsgYWJvdXQgc2hhcmluZyBj
b2RlIGZvciBkcml2aW5nIERSTS9LTVMgZm9yIGRpc3BsYXkuCj4gCj4gSSB0aGluayB0aGUgZ2Vu
ZXJhbCBjb25zZW5zdXMgaXMgdGhhdCB0aGVyZSBpcyBlbm91Z2ggc2hhcmVkCj4gZnVuY3Rpb25h
bGl0eSBiZXR3ZWVuIGFsbCBvZiB0aGUgdmFyaW91cyBEUk0vS01TIGNsaWVudHMgdGhhdCB3ZSBj
YW4KPiBzdGFydCB0aGlua2luZyBhYm91dCBidWlsZGluZyBhIGxpYnJhcnkgdGhhdCBkZWFscyB3
aXRoIHRoZSBjb21wbGV4aXR5Cj4gb2YgRFJNL0tNUyBhbmQgY2FuIGhlbHAgdGFrZSBmdWxsIGFk
dmFudGFnZSBvZiB0aGUgaGFyZHdhcmUuCj4gCj4gSSd2ZSBzdGFydGVkIHdyaXRpbmcgdXAgc29t
ZSBpZGVhcywgbW9zdGx5IGp1c3QgZ29hbHMsIGJ1dCBhbHNvIHNvbWUKPiByYW5kb20gdGhvdWdo
dHMgYWJvdXQgaG93IHRoaXMgbWlnaHQgd29yay4gVGhpcyBpcyBhbGwgaW4gdGhlCj4gJ2xpYm91
dHB1dCcgcHJvamVjdCBvbiBmcmVlZGVza3RvcC5vcmc6Cj4gCj4gICAgICAgICAgaHR0cHM6Ly9n
aXRsYWIuZnJlZWRlc2t0b3Aub3JnL3hvcmcvbGlib3V0cHV0Cj4gCj4gSSBwaWNrZWQgYSBzcG90
IGluIHRoZSAneG9yZycgbmFtZXNwYWNlLCBub3QgdG8gY29uZmluZSB0aGlzIHRvIFgKPiBzeXN0
ZW1zLCBidXQgdG8gcmVmbGVjdCB0aGUgZ29hbCB0aGF0IHRoaXMgYmUgYSBsaWJyYXJ5IHNoYXJl
ZCBhY3Jvc3MKPiBhbGwgeC5vcmctcmVsYXRlZCBwcm9qZWN0cywgaW5jbHVkaW5nIFdheWxhbmQg
Y29tcG9zaXRvcnMsIEVHTCBhbmQKPiBWdWxrYW4gZGlyZWN0IGFwcGxpY2F0aW9ucyBhbmQgdGhl
IFggc2VydmVyLgo+IAo+IEFsbCB0aGVyZSBpcyBhdCB0aGlzIHBvaW50IGlzIGEgUkVBRE1FLm1k
IGZpbGU7IEknZCBsaWtlIHRvIGdlbmVyYXRlCj4gc29tZSBjb25zZW5zdXMgb24gYSBkaXJlY3Rp
b24gZm9yIHRoZSBwcm9qZWN0IGJlZm9yZSB3ZSBzdGFydCB3cml0aW5nCj4gYW55IGFjdHVhbCBk
ZXNpZ24gZG9jdW1lbnRzLgo+IAo+IFBsZWFzZSBzdWJtaXQgTVJzIHRvIHRoYXQgcmVwbywgb3Ig
cmVzcG9uZCB0byB0aGlzIGVtYWlsIGFzIHlvdSBwcmVmZXIuCj4gCj4gCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBs
aXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4gCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
