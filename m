Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC7A22588B
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 09:31:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D0D89FD9;
	Mon, 20 Jul 2020 07:30:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC506ED37
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 08:00:46 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id A1E10D976030469F0894;
 Fri, 17 Jul 2020 16:00:38 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.91) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Fri, 17 Jul 2020
 16:00:36 +0800
Subject: Re: [PATCH -next] drm/komeda: Convert to DEFINE_SHOW_ATTRIBUTE
To: Daniel Vetter <daniel@ffwll.ch>, "james qian wang (Arm Technology China)"
 <james.qian.wang@arm.com>
References: <20200716090333.13334-1-miaoqinglang@huawei.com>
 <20200717064017.GA76612@jamwan02-TSP300>
 <CAKMK7uEpmhKok9Q3Rrg0v=1p7pv-wpV0Y3-k9GVav+Ad5Z4AkQ@mail.gmail.com>
From: miaoqinglang <miaoqinglang@huawei.com>
Message-ID: <7264de7e-6da4-288d-855d-410b2e05458b@huawei.com>
Date: Fri, 17 Jul 2020 16:00:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uEpmhKok9Q3Rrg0v=1p7pv-wpV0Y3-k9GVav+Ad5Z4AkQ@mail.gmail.com>
X-Originating-IP: [10.174.179.91]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 20 Jul 2020 07:30:37 +0000
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

CgrlnKggMjAyMC83LzE3IDE1OjA2LCBEYW5pZWwgVmV0dGVyIOWGmemBkzoKPiBPbiBGcmksIEp1
bCAxNywgMjAyMCBhdCA4OjQwIEFNIGphbWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hp
bmEpCj4gPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPiB3cm90ZToKPj4KPj4gT24gVGh1LCBKdWwg
MTYsIDIwMjAgYXQgMDU6MDM6MzNQTSArMDgwMCwgUWluZ2xhbmcgTWlhbyB3cm90ZToKPj4+IEZy
b206IExpdSBTaGl4aW4gPGxpdXNoaXhpbjJAaHVhd2VpLmNvbT4KPj4+Cj4+PiBVc2UgREVGSU5F
X1NIT1dfQVRUUklCVVRFIG1hY3JvIHRvIHNpbXBsaWZ5IHRoZSBjb2RlLgo+Pj4KPj4+IFNpZ25l
ZC1vZmYtYnk6IExpdSBTaGl4aW4gPGxpdXNoaXhpbjJAaHVhd2VpLmNvbT4KPj4+IC0tLQo+Pj4g
ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYyB8IDEzICst
LS0tLS0tLS0tLS0KPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxMiBkZWxl
dGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfZGV2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9kZXYuYwo+Pj4gaW5kZXggMDI0NmIyZTk0Li40YTEwZTZiOWUgMTAwNjQ0Cj4+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYwo+Pj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMKPj4+
IEBAIC00MSwxOCArNDEsNyBAQCBzdGF0aWMgaW50IGtvbWVkYV9yZWdpc3Rlcl9zaG93KHN0cnVj
dCBzZXFfZmlsZSAqc2YsIHZvaWQgKngpCj4+PiAgICAgICAgcmV0dXJuIDA7Cj4+PiAgIH0KPj4+
Cj4+PiAtc3RhdGljIGludCBrb21lZGFfcmVnaXN0ZXJfb3BlbihzdHJ1Y3QgaW5vZGUgKmlub2Rl
LCBzdHJ1Y3QgZmlsZSAqZmlscCkKPj4+IC17Cj4+PiAtICAgICByZXR1cm4gc2luZ2xlX29wZW4o
ZmlscCwga29tZWRhX3JlZ2lzdGVyX3Nob3csIGlub2RlLT5pX3ByaXZhdGUpOwo+Pj4gLX0KPj4+
IC0KPj4+IC1zdGF0aWMgY29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyBrb21lZGFfcmVnaXN0
ZXJfZm9wcyA9IHsKPj4+IC0gICAgIC5vd25lciAgICAgICAgICA9IFRISVNfTU9EVUxFLAo+Pj4g
LSAgICAgLm9wZW4gICAgICAgICAgID0ga29tZWRhX3JlZ2lzdGVyX29wZW4sCj4+PiAtICAgICAu
cmVhZF9pdGVyICAgICAgICAgICAgICA9IHNlcV9yZWFkX2l0ZXIsCj4+PiAtICAgICAubGxzZWVr
ICAgICAgICAgPSBzZXFfbHNlZWssCj4+PiAtICAgICAucmVsZWFzZSAgICAgICAgPSBzaW5nbGVf
cmVsZWFzZSwKPj4+IC19Owo+Pj4gK0RFRklORV9TSE9XX0FUVFJJQlVURShrb21lZGFfcmVnaXN0
ZXIpOwo+Pj4KPj4KPj4gSGkgU2hpeGluICYgUWluZ2xhbmcKPj4KPj4gVGhhbmtzIGZvciB5b3Vy
IHBhdGNoLgo+Pgo+PiBSZXZpZXdlZC1ieTogSmFtZXMgUWlhbiBXYW5nIDxqYW1lcy5xaWFuLndh
bmdAYXJtLmNvbT4KPj4KPj4gU2luY2UgeW91ciBwYXRjaCBpcyBub3QgZm9yIGRybS1taXNjLW5l
eHQsIHNvIHNlZW1zIGJldHRlcgo+PiB0byBsZWF2ZSBpdCB0byB5b3UgdG8gbWVyZ2UgaXQuIDop
Cj4gCj4gSSBkbyB0aGluayBpdCdzIGZvciBkcm0tbWlzYy1uZXh0LCB3aGF0IG90aGVyIHRyZWUg
d291bGQgaXQgYmUgZm9yPwo+IFNvbWUgcGVvcGxlIHB1dCAtbmV4dCBpbiB0aGVpciBwYXRjaCB0
YWcgdG8gZGlmZmVyZW50aWF0ZSBmcm9tIC1maXhlcywKPiBzbyBtYWludGFpbmVycyBrbm93IHdo
YXQgdG8gZG8gd2l0aCB0aGUgcGF0Y2guIEl0J3MgYWxzbyBub3QgcGFydCBvZiBhCj4gc2VyaWVz
LCBoZW5jZSBJIHRoaW5rIHRoaXMgaXMgb24geW91IHRvIGFwcGx5IGl0LgogPgpIaSBKYW1lcyAm
IERhbmllbCwKCuKAi1NvcnJ5IEkgZGlkbid0IG1ha2UgaXQgY2xlYXIgaW4gY29tbWl0IGxvZywg
YnV0IGl0IGRvIGJhc2VkIG9uIGxpbnV4LW5leHQuCgrigItJIHRoaW5rIHRoZSByZWFzb24gd2h5
IEphbWVzIHRoaW5rIGl0J3Mgbm90IGZvciBkcm0tbWlzYy1uZXh0CmlzIGNvbmZsaWN0cyBleGlz
dHMgd2hlbiB0aGlzIHBhdGNoIGJlaW5nIGFwcGxpZWQuIFRoZXJlJ3MgY29uZmxpY3RzIApiZWNh
dXNlIGNvbW1pdCA8NGQ0OTAxYzZkNz4gd2hpY2ggc3dpdGNoZWQgb3ZlciBkaXJlY3Qgc2VxX3Jl
YWQgbWV0aG9kIApjYWxscyB0byBzZXFfcmVhZF9pdGVyIHNob3VsZCBhcHBsaWVkIGJlZm9yZSB0
aGlzIGNsZWFuLXVwIHBhdGNoKGxpbmthZ2UgCmxpc3RlZCBhcyBiZWxvdykuCgpodHRwczovL2tl
cm5lbC5nb29nbGVzb3VyY2UuY29tL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0L2xpbnV4
LW5leHQvKy80ZDQ5MDFjNmQ3NDhlZmFiOGFhYjZlN2QyNDA1ZGFkYWVkMGJlYTUwCgpJIGNhbiBz
ZW5kIGEgbmV3IHBhdGNoIGJhc2VkIG9uIG1haW5saW5lIGlmIG5lZWRlZC4KCuKAi1RoYW5rcy4K
ClFpbmdsYW5nCgouCgkKID4KPiBDaGVlcnMsIERhbmllbAo+IAo+Pgo+PiBUaGFua3MKPj4gSmFt
ZXMKPj4KPj4+ICAgI2lmZGVmIENPTkZJR19ERUJVR19GUwo+Pj4gICBzdGF0aWMgdm9pZCBrb21l
ZGFfZGVidWdmc19pbml0KHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KQo+Pj4gLS0KPj4+IDIuMTcu
MQo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBk
cmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwKPiAKPiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
