Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 877362EFF40
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jan 2021 12:47:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048626E93F;
	Sat,  9 Jan 2021 11:46:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by gabe.freedesktop.org (Postfix) with ESMTP id 09AEB6E157
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 14:35:01 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.198.163])
 by Aruba Outgoing Smtp  with ESMTPSA
 id xsqukp55MkRIKxsqukltIC; Fri, 08 Jan 2021 15:35:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1610116500; bh=Lo2Rsw/Bj0EQ4nPx99gjoIOjPdT6/lAKPsJoh9P9CnQ=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=GECIQzJVYpskURW8zlWbywwGOk/r1FaBFh38+4zAUCJg/7VkUbXo9RrcXs43dz6Gf
 Hk6IR66si4NfMAS6VjxQ7Y+FR+skORcR4LcOu4Ftb/NL/JHo6yndH79mwzaSygIoC7
 mmvIAw3ZRVRjT7uoxDp8Y9LCGJ0rHYy5qUkF7M26Oj6DQB3SSflhDnCYiDzRVsfJLJ
 x1uZvDofNfC5+SWI1FfwrtCgaYI6XK6jocAhP9rljZiazujKmsv2JQ9Z9ClEOMs2hY
 B2B8DoYKykbE13BebTTvYqEJn7v/Zl8zr2rzO9BsxqptVguYnDYlvEQjO1IwEAWceq
 vkbUF9H4/UaOw==
Subject: Re: [PATCH v2 2/2] drm/sun4i: tcon: improve DCLK polarity handling
To: Maxime Ripard <maxime@cerno.tech>
References: <3685133.SLcexNTYsu@kista>
 <20210107023032.560182-1-giulio.benetti@benettiengineering.com>
 <20210107023032.560182-3-giulio.benetti@benettiengineering.com>
 <20210108092355.7p5uakxt7lpdu3bn@gilmour>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <35622307-5e88-a2ed-bdf9-fca6554efefc@benettiengineering.com>
Date: Fri, 8 Jan 2021 15:34:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210108092355.7p5uakxt7lpdu3bn@gilmour>
Content-Language: en-US
X-CMAE-Envelope: MS4wfET0e/KrWMgOYO750tVJllExzFA7y1EbZAq7Vy7f1LHbU1AIS9bfFF2gRDQw7BAx6TJlFgTYFG80fY16s0XkdXezMmn8Gba93AYuD7jtpaAsr2xlCAvw
 +rGjDZHgE7uxQUsUnKfQUz3NwRSl1Z2xYvnBWxUhqmXYfu5Zg2Ju1Iq1kz9Qs3TTZzY2CnfDyWTIYYYkTl7shiEDG3jX6v051MOJIrCQsD/O1uBY4kz04+7n
 m1wYXGGDGBjUFHL2W1yRlYsw1rz9jJ3AOZBjug7Nz5kyrKW6CAziz/JsCNVxOvkQeto7EpkPsNFoTXakvcSCYKnYVBLmziE6d9B9KyQx469PrjFPBkW6KV/n
 OOiSYreIb8U/DtLf7S1X484SGG2R8EmHsYDb3L9B/bpm91p1gM71gqQrzN9BEYDc9CQ74Z0mdnOfdt7watlaOgfrtHzoTaVmjSk72KetOzRqcqIg/yOjxxSM
 YaPcLAMZjWSqGaSBDS30xmPF6Uvp91zKufDD3uQKpweL4kMxQdtkIhvh2WiYzndUPFkyfPNUHRBICuqS/wh2laMjX2SLi7M0CuK8aQ==
X-Mailman-Approved-At: Sat, 09 Jan 2021 11:46:48 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, treding@nvidia.com,
 Giulio Benetti <giulio.benetti@micronovasrl.com>,
 Marjan Pascolo <marjan.pascolo@trexom.it>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAxLzgvMjEgMTA6MjMgQU0sIE1heGltZSBSaXBhcmQgd3JvdGU6Cj4gSGksCj4gCj4g
VGhhbmtzIGZvciB0aG9zZSBwYXRjaGVzCj4gCj4gT24gVGh1LCBKYW4gMDcsIDIwMjEgYXQgMDM6
MzA6MzJBTSArMDEwMCwgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4+IEZyb206IEdpdWxpbyBCZW5l
dHRpIDxnaXVsaW8uYmVuZXR0aUBtaWNyb25vdmFzcmwuY29tPgo+Pgo+PiBJdCB0dXJuZWQgb3V0
KE1heGltZSBzdWdnZXN0aW9uKSB0aGF0IGJpdCAyNiBvZiBTVU40SV9UQ09OMF9JT19QT0xfUkVH
IGlzCj4+IGRlZGljYXRlZCB0byBpbnZlcnQgRENMSyBwb2xhcml0eSBhbmQgdGhpcyBtYWtlcyB0
aGluZyByZWFsbHkgZWFzaWVyIHRoYW4KPj4gYmVmb3JlLiBTbyBsZXQncyBoYW5kbGUgRENMSyBw
b2xhcml0eSBieSBhZGRpbmcKPj4gU1VONElfVENPTjBfSU9fUE9MX0RDTEtfUE9TSVRJVkUgYXMg
Yml0IDI2IGFuZCBhY3RpdmF0aW5nIGFjY29yZGluZyB0bwo+PiBidXNfZmxhZ3MgdGhlIHNhbWUg
d2F5IGlzIGRvbmUgZm9yIGFsbCB0aGUgb3RoZXIgc2lnbmFscy4KPj4KPj4gQ2M6IE1heGltZSBS
aXBhcmQgPG1heGltZUBjZXJuby50ZWNoPgo+IAo+IFN1Z2dlc3RlZC1ieSB3b3VsZCBiZSBuaWNl
IGhlcmUgOikKCk9rLCBkaWRuJ3Qga25vdyBhYm91dCB0aGlzIHRhZwoKPj4gU2lnbmVkLW9mZi1i
eTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQG1pY3Jvbm92YXNybC5jb20+Cj4+IC0t
LQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV90Y29uLmMgfCAyMCArLS0tLS0tLS0t
LS0tLS0tLS0tLQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV90Y29uLmggfCAgMSAr
Cj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24uYyBiL2Ry
aXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV90Y29uLmMKPj4gaW5kZXggNTI1OThiYjBmYjBiLi4z
MDE3MWNjZDg3ZTUgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV90
Y29uLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24uYwo+PiBAQCAt
NTY5LDI2ICs1NjksOCBAQCBzdGF0aWMgdm9pZCBzdW40aV90Y29uMF9tb2RlX3NldF9yZ2Ioc3Ry
dWN0IHN1bjRpX3Rjb24gKnRjb24sCj4+ICAgCWlmIChpbmZvLT5idXNfZmxhZ3MgJiBEUk1fQlVT
X0ZMQUdfREVfTE9XKQo+PiAgIAkJdmFsIHw9IFNVTjRJX1RDT04wX0lPX1BPTF9ERV9ORUdBVElW
RTsKPj4gICAKPj4gLQkvKgo+PiAtCSAqIE9uIEEyMCBhbmQgc2ltaWxhciBTb0NzLCB0aGUgb25s
eSB3YXkgdG8gYWNoaWV2ZSBQb3NpdGl2ZSBFZGdlCj4+IC0JICogKFJpc2luZyBFZGdlKSwgaXMg
c2V0dGluZyBkY2xrIGNsb2NrIHBoYXNlIHRvIDIvMygyNDDCsCkuCj4+IC0JICogQnkgZGVmYXVs
dCBUQ09OIHdvcmtzIGluIE5lZ2F0aXZlIEVkZ2UoRmFsbGluZyBFZGdlKSwKPj4gLQkgKiB0aGlz
IGlzIHdoeSBwaGFzZSBpcyBzZXQgdG8gMCBpbiB0aGF0IGNhc2UuCj4+IC0JICogVW5mb3J0dW5h
dGVseSB0aGVyZSdzIG5vIHdheSB0byBsb2dpY2FsbHkgaW52ZXJ0IGRjbGsgdGhyb3VnaAo+PiAt
CSAqIElPX1BPTCByZWdpc3Rlci4KPj4gLQkgKiBUaGUgb25seSBhY2NlcHRhYmxlIHdheSB0byB3
b3JrLCB0cmlwbGUgY2hlY2tlZCB3aXRoIHNjb3BlLAo+PiAtCSAqIGlzIHVzaW5nIGNsb2NrIHBo
YXNlIHNldCB0byAwwrAgZm9yIE5lZ2F0aXZlIEVkZ2UgYW5kIHNldCB0byAyNDDCsAo+PiAtCSAq
IGZvciBQb3NpdGl2ZSBFZGdlLgo+PiAtCSAqIE9uIEEzMyBhbmQgc2ltaWxhciBTb0NzIHRoZXJl
IHdvdWxkIGJlIGEgOTDCsCBwaGFzZSBvcHRpb24sCj4+IC0JICogYnV0IGl0IGRpdmlkZXMgYWxz
byBkY2xrIGJ5IDIuCj4+IC0JICogRm9sbG93aW5nIGNvZGUgaXMgYSB3YXkgdG8gYXZvaWQgcXVp
cmtzIGFsbCBhcm91bmQgVENPTgo+PiAtCSAqIGFuZCBET1RDTE9DSyBkcml2ZXJzLgo+PiAtCSAq
Lwo+PiAgIAlpZiAoaW5mby0+YnVzX2ZsYWdzICYgRFJNX0JVU19GTEFHX1BJWERBVEFfRFJJVkVf
UE9TRURHRSkKPj4gLQkJY2xrX3NldF9waGFzZSh0Y29uLT5kY2xrLCAwKTsKPj4gLQo+PiAtCWlm
IChpbmZvLT5idXNfZmxhZ3MgJiBEUk1fQlVTX0ZMQUdfUElYREFUQV9EUklWRV9ORUdFREdFKQo+
PiAtCQljbGtfc2V0X3BoYXNlKHRjb24tPmRjbGssIDI0MCk7Cj4+ICsJCXZhbCB8PSBTVU40SV9U
Q09OMF9JT19QT0xfRENMS19QT1NJVElWRTsKPiAKPiBJJ20gbm90IHJlYWxseSBzdXJlIHdoeSB3
ZSBuZWVkIHRoZSBmaXJzdCBwYXRjaCBvZiB0aGlzIHNlcmllcyBoZXJlPwoKVGhlIGlkZWEgd2Fz
IHRvIGhhdmUgMiBmb3IgdGVzdGluZywgMXN0IG9uZSBpcyBhbHJlYWR5IGFwcGxpY2FibGUsIHdo
aWxlIAp0aGUgb3RoZXIgbXVzdCBiZSB0ZXN0ZWQsIGJ1dCBJIGNhbiBzZW5kIG9ubHkgb25lIHdp
dGggbm8gcHJvYmxlbS4KCj4gVGhhdCBwYXRjaCBvbmx5IHNlZW0gdG8gdW5kbyB3aGF0IHlvdSBk
aWQgaW4gcGF0Y2ggMQoKTm8sIGl0IGRvZXNuJ3QsIHRoZSAybmQgb25lIGNoYW5nZSB0aGUgd2F5
IGl0IGFjaGlldmUgdGhlIHNhbWUgdGhpbmcsIApiZWNhdXNlIHRoZSAxc3Qgc3dhcCBEQ0xLIHBo
YXNlLCB3aGlsZSB0aGUgMm5kIHVzZXMgdGhlIElPX1BPTCBiaXQgdG8gCnNldCBJTyBwb2xhcml0
eSBhY2NvcmRpbmcgdG8gYnVzX2ZsYWdzLgoKQmVzdCBSZWdhcmRzCi0tIApHaXVsaW8gQmVuZXR0
aQpCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
