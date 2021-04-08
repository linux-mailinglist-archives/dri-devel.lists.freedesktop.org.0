Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3605B35828E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 13:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 167246EABC;
	Thu,  8 Apr 2021 11:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFBE6EABC
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 11:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qMgn177aesAtlSMhvUPpX/Y2rtDuUrc1ktn0cuDjE5E=; b=shs0dJydx8mseb+Qghv9MkY4lW
 kyOZ/gwVMd8y+nlrF8KmGHncYQhYqoYcqmJG5N/hhoK7yXLoVB6mF5T+prcjk8V0A1anuuhIGKCig
 IM0i2cK858PY/m7aO1xuZ8Gtr2U3TITKEMrnh84VSebTh0/sc3dyxlqxe2Np3AqYqZCWrEV/hIuUC
 kFZfRPgbjUCxAHfXSi0/Fu4cgV1nSqmjn1wMhorpc74tALCufUskU4n9K3UDJ3hArpL3BuuFJxNLS
 2Yy0JitxFNwEBqHWVbzZ13rfXvhbwBSot+HyHYYeSNBaTrDyjrx6sgU2Wt0SoKvX04+3XkNlwvn5Q
 A1Q0IdPw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1lUTIe-0003sm-Fg; Thu, 08 Apr 2021 14:58:16 +0300
Subject: Re: [PATCH v5 03/21] gpu: host1x: Show number of pending waiters in
 debugfs
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Dmitry Osipenko <digetx@gmail.com>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-4-mperttunen@nvidia.com>
 <YFm/431gaaP6wY1A@orome.fritz.box>
 <1010683e-56c9-4b06-1540-d8c60a632c70@kapsi.fi>
 <20210401211949.GA25223@qmqm.qmqm.pl>
 <7636618d-72f7-ee0f-df23-1f2ec96973b4@gmail.com>
 <20210408041344.GB19244@qmqm.qmqm.pl> <20210408042531.GC19244@qmqm.qmqm.pl>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <0c3db818-5c1f-0c7a-0937-2619997a8852@kapsi.fi>
Date: Thu, 8 Apr 2021 14:58:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210408042531.GC19244@qmqm.qmqm.pl>
Content-Language: en-US
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 talho@nvidia.com, bhuntsman@nvidia.com,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNC84LzIxIDc6MjUgQU0sIE1pY2hhxYIgTWlyb3PFgmF3IHdyb3RlOgo+IE9uIFRodSwgQXBy
IDA4LCAyMDIxIGF0IDA2OjEzOjQ0QU0gKzAyMDAsIE1pY2hhxYIgTWlyb3PFgmF3IHdyb3RlOgo+
PiBPbiBGcmksIEFwciAwMiwgMjAyMSBhdCAwNzowMjozMlBNICswMzAwLCBEbWl0cnkgT3NpcGVu
a28gd3JvdGU6Cj4+PiAwMi4wNC4yMDIxIDAwOjE5LCBNaWNoYcWCIE1pcm9zxYJhdyDQv9C40YjQ
tdGCOgo+Pj4+IE9uIEZyaSwgTWFyIDI2LCAyMDIxIGF0IDA0OjM0OjEzUE0gKzAyMDAsIE1pa2tv
IFBlcnR0dW5lbiB3cm90ZToKPj4+Pj4gT24gMy8yMy8yMSAxMjoxNiBQTSwgVGhpZXJyeSBSZWRp
bmcgd3JvdGU6Cj4+Pj4+PiBPbiBNb24sIEphbiAxMSwgMjAyMSBhdCAwMzowMDowMVBNICswMjAw
LCBNaWtrbyBQZXJ0dHVuZW4gd3JvdGU6Cj4+Pj4+Pj4gU2hvdyB0aGUgbnVtYmVyIG9mIHBlbmRp
bmcgd2FpdGVycyBpbiB0aGUgZGVidWdmcyBzdGF0dXMgZmlsZS4KPj4+Pj4+PiBUaGlzIGlzIHVz
ZWZ1bCBmb3IgdGVzdGluZyB0byB2ZXJpZnkgdGhhdCB3YWl0ZXJzIGRvIG5vdCBsZWFrCj4+Pj4+
Pj4gb3IgYWNjdW11bGF0ZSBpbmNvcnJlY3RseS4KPj4+Pj4+Pgo+Pj4+Pj4+IFNpZ25lZC1vZmYt
Ynk6IE1pa2tvIFBlcnR0dW5lbiA8bXBlcnR0dW5lbkBudmlkaWEuY29tPgo+Pj4+Pj4+IC0tLQo+
Pj4+Pj4+ICAgIGRyaXZlcnMvZ3B1L2hvc3QxeC9kZWJ1Zy5jIHwgMTQgKysrKysrKysrKystLS0K
Pj4+Pj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKPj4+Pj4+Pgo+Pj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9ob3N0MXgvZGVidWcu
YyBiL2RyaXZlcnMvZ3B1L2hvc3QxeC9kZWJ1Zy5jCj4+Pj4+Pj4gaW5kZXggMWI0OTk3YmRhMWM3
Li44YTE0ODgwYzYxYmIgMTAwNjQ0Cj4+Pj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvaG9zdDF4L2Rl
YnVnLmMKPj4+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9ob3N0MXgvZGVidWcuYwo+Pj4+Pj4+IEBA
IC02OSw2ICs2OSw3IEBAIHN0YXRpYyBpbnQgc2hvd19jaGFubmVsKHN0cnVjdCBob3N0MXhfY2hh
bm5lbCAqY2gsIHZvaWQgKmRhdGEsIGJvb2wgc2hvd19maWZvKQo+Pj4+Pj4+ICAgIHN0YXRpYyB2
b2lkIHNob3dfc3luY3B0cyhzdHJ1Y3QgaG9zdDF4ICptLCBzdHJ1Y3Qgb3V0cHV0ICpvKQo+Pj4+
Pj4+ICAgIHsKPj4+Pj4+PiArCXN0cnVjdCBsaXN0X2hlYWQgKnBvczsKPj4+Pj4+PiAgICAJdW5z
aWduZWQgaW50IGk7Cj4+Pj4+Pj4gICAgCWhvc3QxeF9kZWJ1Z19vdXRwdXQobywgIi0tLS0gc3lu
Y3B0cyAtLS0tXG4iKTsKPj4+Pj4+PiBAQCAtNzYsMTIgKzc3LDE5IEBAIHN0YXRpYyB2b2lkIHNo
b3dfc3luY3B0cyhzdHJ1Y3QgaG9zdDF4ICptLCBzdHJ1Y3Qgb3V0cHV0ICpvKQo+Pj4+Pj4+ICAg
IAlmb3IgKGkgPSAwOyBpIDwgaG9zdDF4X3N5bmNwdF9uYl9wdHMobSk7IGkrKykgewo+Pj4+Pj4+
ICAgIAkJdTMyIG1heCA9IGhvc3QxeF9zeW5jcHRfcmVhZF9tYXgobS0+c3luY3B0ICsgaSk7Cj4+
Pj4+Pj4gICAgCQl1MzIgbWluID0gaG9zdDF4X3N5bmNwdF9sb2FkKG0tPnN5bmNwdCArIGkpOwo+
Pj4+Pj4+ICsJCXVuc2lnbmVkIGludCB3YWl0ZXJzID0gMDsKPj4+Pj4+PiAtCQlpZiAoIW1pbiAm
JiAhbWF4KQo+Pj4+Pj4+ICsJCXNwaW5fbG9jaygmbS0+c3luY3B0W2ldLmludHIubG9jayk7Cj4+
Pj4+Pj4gKwkJbGlzdF9mb3JfZWFjaChwb3MsICZtLT5zeW5jcHRbaV0uaW50ci53YWl0X2hlYWQp
Cj4+Pj4+Pj4gKwkJCXdhaXRlcnMrKzsKPj4+Pj4+PiArCQlzcGluX3VubG9jaygmbS0+c3luY3B0
W2ldLmludHIubG9jayk7Cj4+Pj4+Pgo+Pj4+Pj4gV291bGQgaXQgbWFrZSBzZW5zZSB0byBrZWVw
IGEgcnVubmluZyBjb3VudCBzbyB0aGF0IHdlIGRvbid0IGhhdmUgdG8KPj4+Pj4+IGNvbXB1dGUg
aXQgaGVyZT8KPj4+Pj4KPj4+Pj4gQ29uc2lkZXJpbmcgdGhpcyBpcyBqdXN0IGEgZGVidWcgZmFj
aWxpdHksIEkgdGhpbmsgSSBwcmVmZXIgbm90IGFkZGluZyBhIG5ldwo+Pj4+PiBmaWVsZCBqdXN0
IGZvciBpdC4KPj4+Pgo+Pj4+IFRoaXMgbG9va3MgbGlrZSBJUlEtZGlzYWJsZWQgcmVnaW9uLCBz
byB1bmxlc3Mgb25seSByb290IGNhbiB0cmlnZ2VyCj4+Pj4gdGhpcyBjb2RlLCBtYXliZSB0aGUg
YWRkaXRpb25hbCBmaWVsZCBjb3VsZCBzYXZlIGEgcG90ZW50aWFsIGhlYWRhY2hlPwo+Pj4+IEhv
dyBtYW55IHdhaXRlcnMgY2FuIHRoZXJlIGJlIGluIHRoZSB3b3JzdCBjYXNlPwo+Pj4KPj4+IFRo
ZSBob3N0MXgncyBJUlEgaGFuZGxlciBydW5zIGluIGEgd29ya3F1ZXVlLCBzbyBpdCBzaG91bGQg
YmUgb2theS4KPj4KPj4gV2h5LCB0aGVuLCB0aGlzIHVzZXMgYSBzcGlubG9jayAoYW5kIGl0IGhh
cyAnaW50cicgaW4gaXRzIG5hbWUpPwo+IAo+IFRoZSBjcml0aWNhbCBzZWN0aW9ucyBhcmUgYWxy
ZWFkeSBPKG4pIGluIG51bWJlciBvZiB3YWl0ZXJzLCBzbyB0aGlzCj4gcGF0Y2ggZG9lc24ndCBt
YWtlIHRoaW5ncyB3b3JzZSBhcyBJIHByZXZpb3VzbHkgdGhvdWdodC4gVGhlIHF1ZXN0aW9ucwo+
IHJlbWFpbjogV2hhdCBpcyB0aGUgZXhwZWN0ZWQgbnVtYmVyIGFuZCB1cHBlciBib3VuZCBvZiB3
b3JrZXJzPwo+IFNob3VsZG4ndCB0aGlzIGJlIGEgbXV0ZXggaW5zdGVhZD8KCkV2ZXJ5dGhpbmcg
aXMgcHJpbWFyaWx5IGZvciBoaXN0b3JpY2FsIHJlYXNvbnMuIFRoZSBuYW1lICdpbnRyJyBpcyAK
YmVjYXVzZSB0aGlzIGlzIGluIHRoZSBwYXJ0IG9mIHRoZSBob3N0MXggZHJpdmVyIHRoYXQgaGFu
ZGxlcyBzeW5jcG9pbnQgCnRocmVzaG9sZCBpbnRlcnJ1cHRzIC0ganVzdCBzb21lIG9mIGl0IGlz
IGluIGludGVycnVwdCBjb250ZXh0IGFuZCBzb21lIG5vdC4KCkluIGFueSBjYXNlLCB0aGlzIGNv
ZGUgaXMgc2NoZWR1bGVkIGZvciBhIGNvbXBsZXRlIHJlZGVzaWduIG9uY2Ugd2UgZ2V0IAp0aGUg
VUFQSSBjaGFuZ2VzIGRvbmUuIEknbGwgdGFrZSB0aGlzIGludG8gYWNjb3VudCBhdCB0aGF0IHBv
aW50LgoKQ2hlZXJzLApNaWtrbwoKPiAKPiBCZXN0IFJlZ2FyZHMKPiBNaWNoYcWCIE1pcm9zxYJh
dwo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
