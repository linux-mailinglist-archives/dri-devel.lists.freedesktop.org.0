Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F11CA1145F1
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 18:31:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFCFF6F8CB;
	Thu,  5 Dec 2019 17:31:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3DFE6F8CA
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 17:31:17 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id D91B820024;
 Thu,  5 Dec 2019 18:31:15 +0100 (CET)
Date: Thu, 5 Dec 2019 18:31:14 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 0/4] Rate-limit shadow-FB-to-console-update to screen
 refresh
Message-ID: <20191205173114.GB24782@ravnborg.org>
References: <20191205160142.3588-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191205160142.3588-1-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8
 a=7gkXJVJtAAAA:8 a=CZjj7BPsWDCLK8zmLiwA:9 a=CjuIK1q_8ugA:10
 a=XdWBnK7Cb1AA:10 a=Vxmtnl_E_bksehYqCbjh:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=pHzHmUro8NiASowvMSCR:22 a=n87TN5wuljxrRezIQYnT:22
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
Cc: rong.a.chen@intel.com, dri-devel@lists.freedesktop.org,
 ying.huang@intel.com, airlied@redhat.com, emil.velikov@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLgoKCk9uIFRodSwgRGVjIDA1LCAyMDE5IGF0IDA1OjAxOjM4UE0gKzAxMDAsIFRo
b21hcyBaaW1tZXJtYW5uIHdyb3RlOgo+IEEgZnVsbC1zY3JlZW4gbWVtY3B5KCkgbW92ZXMgdGhl
IGNvbnNvbGUncyBzaGFkb3cgYnVmZmVyIHRvIGhhcmR3YXJlOyB3aXRoCj4gcG9zc2libHkgc2ln
bmlmaWNhbnQgcnVudGltZSBvdmVyaGVhZC4gWzFdIFN5bmNocm9uaXppbmcgdGhlIHNjcmVlbiB1
cGRhdGUKPiB3aXRoIFZCTEFOSyBldmVudHMgY2FuIGhvcGVmdWxseSByZWR1Y2UgdGhlIG51bWJl
ciBvZiBzY3JlZW4gdXBkYXRlcy4KPiAKPiBUaGUgcGF0Y2hzZXQgZmlyc3QgYWRkcyB2Ymxhbmsg
c3VwcG9ydCB0byBtZ2FnMjAwIGFzIHRoZSBwcm9ibGVtIHdhcwo+IGluaXRpYWxseSByZXBvcnRl
ZCBmb3IgTWF0cm94IGhhcmR3YXJlLgo+IAo+IFRoZSBjb25zb2xlJ3MgZGlydHkgd29ya2VyIG5v
dyB3YWl0cyBmb3IgdGhlIHZibGFuayB0byByYXRlIGxpbWl0IHRoZQo+IG91dHB1dCBmcmVxdWVu
Y3kuIFNjcmVlbiBvdXRwdXQgY2FuIHBpbGUgdXAgd2hpbGUgd2FpdGluZyBhbmQgdGhlcmUncyBh
Cj4gY2hhbmNlIHRoYXQgbXVsdGlwbGUgc2NyZWVuIHVwZGF0ZXMgY2FuIGJlIGhhbmRsZWQgd2l0
aCBhIHNpbmdsZSBtZW1jcHkoKS4KPiBOb3RlIHRoYXQgdGhpcyBoYXMgbm8gZWZmZWN0IG9uIHRl
YXJpbmc6IHdoaWxlIHRoZSBkaXJ0eSB3b3JrZXIgdXBkYXRlcwo+IHRoZSBoYXJkd2FyZSBidWZm
ZXIsIG5ldyBkYXRhIGNhbiBzdGlsbCBhcnJpdmUgaW4gdGhlIHNoYWRvdyBidWZmZXIuIFRoaXMK
PiBjYW4gY3JlYXRlIGEgdGVhcmluZyBlZmZjZXQsIGV2ZW4gdGhvdWdoIGNvbnNvbGUgb3V0cHV0
IGlzIHN5bmNocm9uaXplZAo+IHRvIHZibGFuay4KPiAKPiBJbiB2ZXJzaW9uIDIgb2YgdGhpcyBw
YXRjaHNldCwgZmJkZXYgZW11bGF0aW9uIG1pc3NlZCB0aGUgZmlyc3QgdmJsYW5rCj4gZXZlbnQg
YmVjYXVzZSBtZ2FnMjAwIGluaXRpYWxpemVkIHRoZSBmYmRldiBjb25zb2xlIGJlZm9yZSB0aGUg
aXJxLgo+IEluaXRpYWxpemluZyBmYmRldiBsYXN0IGZpeGVzIHRoaXMgcHJvYmxlbS4gSWYgb3Ro
ZXIgZHJpdmVycyBub3cgc3RhcnQKPiByZXBvcnRpbmcgYSBtaXNzZWQgdmJsYW5rIGR1cmluZyBi
b290LCB0aGlzIG1pZ2h0IGJlIHRoZSByZWFzb24uCj4gCj4gVGhlIHBhdGNoc2V0IHdhcyB0ZXN0
ZWQgYnkgcnVubmluZyBmYmRldiBlbXVsYXRpb24gYW5kIEdub21lIChYMTEpIG9uCj4gbWdhZzIw
MCBIVy4KPiAKPiB2MzoKPiAJKiBmYmRldjogaG9sZCBoZWxwZXItPm11dGV4Cj4gCSogZmJkZXY6
IGFjcXVpcmUgRFJNIG1hc3RlciBzbyBvdGhlciBtYXN0ZXJzIGNhbm5vdCBpbnRlcmZlcmUKPiAJ
KiBtZ2FnMjAwOiBpbml0IGZiZGV2IGFmdGVyIGlycSBhdm9pZHMgbWlzc2luZyBmaXJzdCB2Ymxh
bmsKPiAJKiBtZ2FnMjAwOiB0cmlnZ2VyIGlycSBhdCA8dmRpc3BsYXk+ICsgMSBtYXRjaGVzIHZi
bGFuawo+IHYyOgo+IAkqIHJlbW92ZSBsb2NraW5nIGZyb20gZmJkZXYgcGF0Y2gKPiAJKiB1c2Ug
Y29uc3RhbnRzIGZvciBtZ2FnMjAwIHJlZ2lzdGVyIG5hbWVzIGFuZCBmaWVsZHMKPiAJKiBkb3Vi
bGUtY2hlY2sgdGhhdCBWTElORSBpcnEgaXMgYWN0aXZlIG9uIG1nYWcyMDAKPiAJKiBvbmx5IHNp
Z25hbCB2Ymxhbmsgb24gQ1JUQyAwIG9mIG1nYWcyMDAKPiAJKiBjb2Rpbmctc3R5bGUgZml4ZXMK
PiAKPiBbMV0gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVs
LzIwMTktSnVseS8yMjg2NjMuaHRtbAo+IAo+IFRob21hcyBaaW1tZXJtYW5uICg0KToKPiAgIGRy
bS9tZ2FnMjAwOiBDcmVhdGUgZmJkZXYgY29uc29sZSBhZnRlciByZWdpc3RlcmluZyBkZXZpY2UK
PiAgIGRybS9tZ2FnMjAwOiBSZW5hbWUgY29uc3RhbnQgTUdBUkVHX1N0YXR1cyB0byBNR0FSRUdf
U1RBVFVTCj4gICBkcm0vbWdhZzIwMDogQWRkIHZibGFuayBzdXBwb3J0Cj4gICBkcm0vZmItaGVs
cGVyOiBTeW5jaHJvbml6ZSBkaXJ0eSB3b3JrZXIgd2l0aCB2YmxhbmsKV2hvbGUgc2VyaWVzIGlz
OgpBY2tlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgoKVGhlIGNvZGUgYWxs
IGxvb2tlZCBnb29kLCBidXQgIEkgYW0gbm90IGZhbWlsaWFyIGVub3VnaAp3aXRoIHRoZSBjb2Rl
IHRvIHNheSBJIHJldmlld2VkIGl0IGFsbC4KQSBmZXcgbml0cyBpbiBvbmUgcGF0Y2ggc2VudCBp
biBhIHNlcGFyYXRlIG1haWwuCgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
