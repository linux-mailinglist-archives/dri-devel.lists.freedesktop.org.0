Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D89126DD81
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 16:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2368F6EC1A;
	Thu, 17 Sep 2020 14:07:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A18F6E15B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 12:37:07 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 16E82D626641862432E6;
 Thu, 17 Sep 2020 20:37:04 +0800 (CST)
Received: from [10.174.179.91] (10.174.179.91) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Thu, 17 Sep 2020 20:37:00 +0800
Subject: Re: [PATCH -next] drm/komeda: Convert to DEFINE_SHOW_ATTRIBUTE
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>,
 "Daniel Vetter" <daniel@ffwll.ch>
References: <20200716090333.13334-1-miaoqinglang@huawei.com>
 <20200717064017.GA76612@jamwan02-TSP300>
 <CAKMK7uEpmhKok9Q3Rrg0v=1p7pv-wpV0Y3-k9GVav+Ad5Z4AkQ@mail.gmail.com>
 <7264de7e-6da4-288d-855d-410b2e05458b@huawei.com>
 <20200717091025.GQ3278063@phenom.ffwll.local>
From: miaoqinglang <miaoqinglang@huawei.com>
Message-ID: <39be7c48-4a4e-4bef-2d08-1d9a5a479269@huawei.com>
Date: Thu, 17 Sep 2020 20:36:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200717091025.GQ3278063@phenom.ffwll.local>
X-Originating-IP: [10.174.179.91]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 17 Sep 2020 14:07:28 +0000
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
Cc: Mihail Atanassov <mihail.atanassov@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, nd <nd@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgrlnKggMjAyMC83LzE3IDE3OjEwLCBEYW5pZWwgVmV0dGVyIOWGmemBkzoKPiBPbiBGcmksIEp1
bCAxNywgMjAyMCBhdCAwNDowMDozNlBNICswODAwLCBtaWFvcWluZ2xhbmcgd3JvdGU6Cj4+Cj4+
Cj4+IOWcqCAyMDIwLzcvMTcgMTU6MDYsIERhbmllbCBWZXR0ZXIg5YaZ6YGTOgo+Pj4gT24gRnJp
LCBKdWwgMTcsIDIwMjAgYXQgODo0MCBBTSBqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5
IENoaW5hKQo+Pj4gPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPiB3cm90ZToKPj4+Pgo+Pj4+IE9u
IFRodSwgSnVsIDE2LCAyMDIwIGF0IDA1OjAzOjMzUE0gKzA4MDAsIFFpbmdsYW5nIE1pYW8gd3Jv
dGU6Cj4+Pj4+IEZyb206IExpdSBTaGl4aW4gPGxpdXNoaXhpbjJAaHVhd2VpLmNvbT4KPj4+Pj4K
Pj4+Pj4gVXNlIERFRklORV9TSE9XX0FUVFJJQlVURSBtYWNybyB0byBzaW1wbGlmeSB0aGUgY29k
ZS4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogTGl1IFNoaXhpbiA8bGl1c2hpeGluMkBodWF3
ZWkuY29tPgo+Pj4+PiAtLS0KPj4+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfZGV2LmMgfCAxMyArLS0tLS0tLS0tLS0tCj4+Pj4+ICAgIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMTIgZGVsZXRpb25zKC0pCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jCj4+Pj4+IGluZGV4
IDAyNDZiMmU5NC4uNGExMGU2YjllIDEwMDY0NAo+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYwo+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYwo+Pj4+PiBAQCAtNDEsMTggKzQxLDcg
QEAgc3RhdGljIGludCBrb21lZGFfcmVnaXN0ZXJfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKnNmLCB2
b2lkICp4KQo+Pj4+PiAgICAgICAgIHJldHVybiAwOwo+Pj4+PiAgICB9Cj4+Pj4+Cj4+Pj4+IC1z
dGF0aWMgaW50IGtvbWVkYV9yZWdpc3Rlcl9vcGVuKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVj
dCBmaWxlICpmaWxwKQo+Pj4+PiAtewo+Pj4+PiAtICAgICByZXR1cm4gc2luZ2xlX29wZW4oZmls
cCwga29tZWRhX3JlZ2lzdGVyX3Nob3csIGlub2RlLT5pX3ByaXZhdGUpOwo+Pj4+PiAtfQo+Pj4+
PiAtCj4+Pj4+IC1zdGF0aWMgY29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyBrb21lZGFfcmVn
aXN0ZXJfZm9wcyA9IHsKPj4+Pj4gLSAgICAgLm93bmVyICAgICAgICAgID0gVEhJU19NT0RVTEUs
Cj4+Pj4+IC0gICAgIC5vcGVuICAgICAgICAgICA9IGtvbWVkYV9yZWdpc3Rlcl9vcGVuLAo+Pj4+
PiAtICAgICAucmVhZF9pdGVyICAgICAgICAgICAgICA9IHNlcV9yZWFkX2l0ZXIsCj4+Pj4+IC0g
ICAgIC5sbHNlZWsgICAgICAgICA9IHNlcV9sc2VlaywKPj4+Pj4gLSAgICAgLnJlbGVhc2UgICAg
ICAgID0gc2luZ2xlX3JlbGVhc2UsCj4+Pj4+IC19Owo+Pj4+PiArREVGSU5FX1NIT1dfQVRUUklC
VVRFKGtvbWVkYV9yZWdpc3Rlcik7Cj4+Pj4+Cj4+Pj4KPj4+PiBIaSBTaGl4aW4gJiBRaW5nbGFu
Zwo+Pj4+Cj4+Pj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoLgo+Pj4+Cj4+Pj4gUmV2aWV3ZWQtYnk6
IEphbWVzIFFpYW4gV2FuZyA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Cj4+Pj4KPj4+PiBTaW5j
ZSB5b3VyIHBhdGNoIGlzIG5vdCBmb3IgZHJtLW1pc2MtbmV4dCwgc28gc2VlbXMgYmV0dGVyCj4+
Pj4gdG8gbGVhdmUgaXQgdG8geW91IHRvIG1lcmdlIGl0LiA6KQo+Pj4KPj4+IEkgZG8gdGhpbmsg
aXQncyBmb3IgZHJtLW1pc2MtbmV4dCwgd2hhdCBvdGhlciB0cmVlIHdvdWxkIGl0IGJlIGZvcj8K
Pj4+IFNvbWUgcGVvcGxlIHB1dCAtbmV4dCBpbiB0aGVpciBwYXRjaCB0YWcgdG8gZGlmZmVyZW50
aWF0ZSBmcm9tIC1maXhlcywKPj4+IHNvIG1haW50YWluZXJzIGtub3cgd2hhdCB0byBkbyB3aXRo
IHRoZSBwYXRjaC4gSXQncyBhbHNvIG5vdCBwYXJ0IG9mIGEKPj4+IHNlcmllcywgaGVuY2UgSSB0
aGluayB0aGlzIGlzIG9uIHlvdSB0byBhcHBseSBpdC4KPj4+Cj4+IEhpIEphbWVzICYgRGFuaWVs
LAo+Pgo+PiDigItTb3JyeSBJIGRpZG4ndCBtYWtlIGl0IGNsZWFyIGluIGNvbW1pdCBsb2csIGJ1
dCBpdCBkbyBiYXNlZCBvbiBsaW51eC1uZXh0Lgo+Pgo+PiDigItJIHRoaW5rIHRoZSByZWFzb24g
d2h5IEphbWVzIHRoaW5rIGl0J3Mgbm90IGZvciBkcm0tbWlzYy1uZXh0Cj4+IGlzIGNvbmZsaWN0
cyBleGlzdHMgd2hlbiB0aGlzIHBhdGNoIGJlaW5nIGFwcGxpZWQuIFRoZXJlJ3MgY29uZmxpY3Rz
IGJlY2F1c2UKPj4gY29tbWl0IDw0ZDQ5MDFjNmQ3PiB3aGljaCBzd2l0Y2hlZCBvdmVyIGRpcmVj
dCBzZXFfcmVhZCBtZXRob2QgY2FsbHMgdG8KPj4gc2VxX3JlYWRfaXRlciBzaG91bGQgYXBwbGll
ZCBiZWZvcmUgdGhpcyBjbGVhbi11cCBwYXRjaChsaW5rYWdlIGxpc3RlZCBhcwo+PiBiZWxvdyku
Cj4+Cj4+IGh0dHBzOi8va2VybmVsLmdvb2dsZXNvdXJjZS5jb20vcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L25leHQvbGludXgtbmV4dC8rLzRkNDkwMWM2ZDc0OGVmYWI4YWFiNmU3ZDI0MDVkYWRh
ZWQwYmVhNTAKPj4KPj4gSSBjYW4gc2VuZCBhIG5ldyBwYXRjaCBiYXNlZCBvbiBtYWlubGluZSBp
ZiBuZWVkZWQuCj4gCj4gVWggeWVzIHRoaXMgaXMgYW5ub3lpbmcuIFdlJ3JlIGF0IGZlYXR1cmUg
Y3V0b2ZmIHNvIHRoaXMgd2lsbCBsaWtlbHkgY2F1c2UKPiBiYWQgY29uZmxpY3RzIG5vIG1hdHRl
ciB3aGF0IGlmIHdlIG1lcmdlIGl0IG5vdywgYnV0IHRoZSBjbGVhbiBzb2x1dGlvbiBpcwo+IHRv
IHJlYmFzZSBvbnRvIGRybS1taXNjLW5leHQsIGFuZCB0aGVuIGxldCBtYWludGFpbmVycyBzb3J0
IG91dCB0aGUgbWVzcwo+IHdpdGggY29uZmxpY3RzLiBJdCdzIGEgcHJldHR5IHNpbXBsZSBjaGFu
Z2UgaW4gdGhlIGFib3ZlIHBhdGNoLCBzbwo+IHNob3VsZG4ndCBjYXVzZSB0b28gbWFueSB0cm91
Ymxlcy4KPiAtRGFuaWVsCj4gCkhpIEphbWVzICYgRGFuaWVsLAoKSSd2ZSBzZW50IHYyIHBhdGNo
IGJhc2VkIG9uIGJhc2VkIG9uIGxpbnV4LW5leHQoMjAyMDA5MTcpLCBhbmQgY2FuIGJlIAphcHBs
aWVkIHRvIG1haW5saW5lIGNsZWFubHkgbm93LgoKVGhhbmtzLgogPgo+Pgo+PiDigItUaGFua3Mu
Cj4+Cj4+IFFpbmdsYW5nCj4+Cj4+IC4KPj4gCQo+Pj4KPj4+IENoZWVycywgRGFuaWVsCj4+Pgo+
Pj4+Cj4+Pj4gVGhhbmtzCj4+Pj4gSmFtZXMKPj4+Pgo+Pj4+PiAgICAjaWZkZWYgQ09ORklHX0RF
QlVHX0ZTCj4+Pj4+ICAgIHN0YXRpYyB2b2lkIGtvbWVkYV9kZWJ1Z2ZzX2luaXQoc3RydWN0IGtv
bWVkYV9kZXYgKm1kZXYpCj4+Pj4+IC0tCj4+Pj4+IDIuMTcuMQo+Pj4+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+Pj4gZHJpLWRldmVsIG1haWxpbmcg
bGlzdAo+Pj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4+PiBodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+Pj4KPj4+Cj4+
Pgo+Pgo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
