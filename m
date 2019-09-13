Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAC5B2356
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 17:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B898F6F3F3;
	Fri, 13 Sep 2019 15:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4297F6F3F1;
 Fri, 13 Sep 2019 15:26:38 +0000 (UTC)
Received: from localhost (195-23-252-136.net.novis.pt [195.23.252.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8CED520693;
 Fri, 13 Sep 2019 15:26:37 +0000 (UTC)
Date: Fri, 13 Sep 2019 11:26:35 -0400
From: Sasha Levin <sashal@kernel.org>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH 4.19 092/190] drm/nouveau: Dont WARN_ON VCPI allocation
 failures
Message-ID: <20190913152635.GK1546@sasha-vm>
References: <20190913130559.669563815@linuxfoundation.org>
 <20190913130606.981926197@linuxfoundation.org>
 <CAKb7UviY0sjFUc6QqjU4eKxm2b-osKoJNO2CSP9HmQ5AdORgkw@mail.gmail.com>
 <20190913144627.GH1546@sasha-vm>
 <20190913145456.GA456842@kroah.com>
 <20190913150111.GI1546@sasha-vm>
 <CAKb7Uvj31ZuxB6S4EH8WBRsa2mDScpZN=dRjHScZmN94ajD0EA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKb7Uvj31ZuxB6S4EH8WBRsa2mDScpZN=dRjHScZmN94ajD0EA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568388398;
 bh=DKPb89gNVWrEkc2nPeyAuBft6QGWxruAsXiGTHC2k3Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PwShTKtviHhe7lIiolEaRlj1ESSWSdo+v7cy/OKAZtmXBjo527ajt4jQwK0y1ZJzW
 IBehPhMhu/14uOk9gIhFPv9u5APdEObhtfvM8txCfYfcvt5EeCWMQ4t1nk/enW5uVM
 h3e5fLu+ZkpXC5tKbSu3Nhs0CFtaeuqc+05KQMNY=
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, "# 3.9+" <stable@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMTE6MDk6MjJBTSAtMDQwMCwgSWxpYSBNaXJraW4gd3Jv
dGU6Cj5PbiBGcmksIFNlcCAxMywgMjAxOSBhdCAxMTowMSBBTSBTYXNoYSBMZXZpbiA8c2FzaGFs
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+PiBPbiBGcmksIFNlcCAxMywgMjAxOSBhdCAwMzo1NDo1
NlBNICswMTAwLCBHcmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6Cj4+ID5PbiBGcmksIFNlcCAxMywg
MjAxOSBhdCAxMDo0NjoyN0FNIC0wNDAwLCBTYXNoYSBMZXZpbiB3cm90ZToKPj4gPj4gT24gRnJp
LCBTZXAgMTMsIDIwMTkgYXQgMDk6MzM6MzZBTSAtMDQwMCwgSWxpYSBNaXJraW4gd3JvdGU6Cj4+
ID4+ID4gSGkgR3JlZywKPj4gPj4gPgo+PiA+PiA+IFRoaXMgZmVlbHMgbGlrZSBpdCdzIG1pc3Np
bmcgYSBGcm9tOiBsaW5lLgo+PiA+PiA+Cj4+ID4+ID4gY29tbWl0IGI1MTNhMThjZjFkNzA1YmQw
NGVmZDkxYzQxN2U3OWU0OTM4YmUwOTMKPj4gPj4gPiBBdXRob3I6IEx5dWRlIFBhdWwgPGx5dWRl
QHJlZGhhdC5jb20+Cj4+ID4+ID4gRGF0ZTogICBNb24gSmFuIDI4IDE2OjAzOjUwIDIwMTkgLTA1
MDAKPj4gPj4gPgo+PiA+PiA+ICAgIGRybS9ub3V2ZWF1OiBEb24ndCBXQVJOX09OIFZDUEkgYWxs
b2NhdGlvbiBmYWlsdXJlcwo+PiA+PiA+Cj4+ID4+ID4gSXMgdGhpcyBhbiBhcnRpZmFjdCBvZiB5
b3VyIG5vdGlmaWNhdGlvbi1vZi1wYXRjaGVzIHByb2Nlc3MgYW5kIEkKPj4gPj4gPiBuZXZlciBu
b3RpY2VkIGJlZm9yZSwgb3Igd2FzIHRoZSBwYXRjaCBpbmdlc3RlZCBpbmNvcnJlY3RseT8KPj4g
Pj4KPj4gPj4gSXQgd2FzIGFsd2F5cyBsaWtlIHRoaXMgZm9yIHBhdGNoZXMgdGhhdCBjYW1lIHRo
cm91Z2ggbWUuIEdyZWcncyBzY3JpcHQKPj4gPj4gZ2VuZXJhdGVzIGFuIGV4cGxpY2l0ICJGcm9t
OiIgbGluZSBpbiB0aGUgcGF0Y2gsIGJ1dCBJIG5ldmVyIHNhdyB0aGUKPj4gPj4gdmFsdWUgaW4g
dGhhdCBzaW5jZSBnaXQgZG9lcyB0aGUgcmlnaHQgdGhpbmcgYnkgbG9va2luZyBhdCB0aGUgIkZy
b206Igo+PiA+PiBsaW5lIGluIHRoZSBtYWlsIGhlYWRlci4KPj4gPj4KPj4gPj4gVGhlIHJpZ2h0
IHRoaW5nIGlzIGJlaW5nIGRvbmUgaW4gc3RhYmxlLXJjIGFuZCBmb3IgdGhlIHJlbGVhc2VzLiBG
b3IKPj4gPj4geW91ciBleGFtcGxlIGhlcmUsIHRoaXMgaXMgaG93IGl0IGxvb2tzIGxpa2UgaW4g
dGhlIHN0YWJsZS1yYyB0cmVlOgo+PiA+Pgo+PiA+PiBjb21taXQgYmRjYzg4NWJlNjgyODlhMzdk
MGQwNjNjZDk0MzkwZGE4MWZkODE3OAo+PiA+PiBBdXRob3I6ICAgICBMeXVkZSBQYXVsIDxseXVk
ZUByZWRoYXQuY29tPgo+PiA+PiBBdXRob3JEYXRlOiBNb24gSmFuIDI4IDE2OjAzOjUwIDIwMTkg
LTA1MDAKPj4gPj4gQ29tbWl0OiAgICAgR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhm
b3VuZGF0aW9uLm9yZz4KPj4gPj4gQ29tbWl0RGF0ZTogRnJpIFNlcCAxMyAxNDowNToyOSAyMDE5
ICswMTAwCj4+ID4+Cj4+ID4+ICAgIGRybS9ub3V2ZWF1OiBEb24ndCBXQVJOX09OIFZDUEkgYWxs
b2NhdGlvbiBmYWlsdXJlcwo+PiA+Cj4+ID5ZZWFoLCB3ZSBzaG91bGQgZml4IHlvdXIgc2NyaXB0
cyB0byBwdXQgdGhlIGV4cGxpY2l0IEZyb206IGxpbmUgaW4gaGVyZQo+PiA+YXMgd2UgYXJlIGRl
YWxpbmcgd2l0aCBwYXRjaGVzIGluIHRoaXMgZm9ybWF0IGFuZCBpdCBjYXVzZXMgY29uZnVzaW9u
IGF0Cj4+ID50aW1lcyAobGlrZSBub3cuKSAgSXQncyBub3QgdGhlIGZpcnN0IHRpbWUgYW5kIHRo
YXQncyB3aHkgSSBhZGRlZCB0aG9zZQo+PiA+bGluZXMgdG8gdGhlIHBhdGNoZXMuCj4+Cj4+IEhl
aCwgZGlkbid0IHRoaW5rIGFueW9uZSBjYXJlZCBhYm91dCB0aGlzIHNjZW5hcmlvIGZvciB0aGUg
c3RhYmxlLXJjCj4+IHBhdGNoZXMuCj4+Cj4+IEknbGwgZ28gYWRkIGl0Lgo+Pgo+PiBCdXQuLi4g
d2h5IGRvIHlvdSBhY3R1YWxseSBjYXJlPwo+Cj5KdXN0IGEgaHlnaWVuZSB0aGluZy4gRXZlcnlv
bmUgZWxzZSBzZW5kcyBwYXRjaGVzIHRoZSBub3JtYWwgd2F5LCB3aXRoCj5hY2N1cmF0ZSBhdHRy
aWJ1dGlvbi4gV2h5IHNob3VsZCBzdGFibGUgYmUgZGlmZmVyZW50PwoKSXQgc2hvdWxkbid0LgoK
SXQncyBqdXN0IGEgbWlzbWF0Y2ggYmV0d2VlbiBvdXIgdHdvIHNvbWV3aGF0IHNlcGVyYXRlIHdv
cmtmbG93LgoKVGVjaG5pY2FsbHkgaXQncyBHcmVnIHdobyBuZWVkcyB0byBiZSBhZGRpbmcgdGhh
dCBsaW5lIHNpbmNlIHRoZSBwYXRjaGVzCkkgaGF2ZSBpbiBzdGFibGUtcXVldWUgY29ycmVjdGx5
IHN0YXRlIHRoZSBhdXRob3IsIGFuZCBpdCBvbmx5IGdvZXMKd3Jvbmcgd2hlbiB0aGV5J3JlIGJl
aW5nIGZvcm1hdHRlZCBpbnRvIG1haWxzIHNlbnQgZm9yIHRoZSAtcmMgY3ljbGVzLgoKQnV0IHll
cywgdGhhbmtzIGZvciBwb2ludGluZyBpdCBvdXQsIEknbGwgZ28gYWRkIGl0IGluIHRoZSBzY3Jp
cHRzLgoKLS0KVGhhbmtzLApTYXNoYQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
