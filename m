Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87290455CE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C8C89704;
	Fri, 14 Jun 2019 07:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ale.deltatee.com (ale.deltatee.com [207.54.116.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50CE489291;
 Thu, 13 Jun 2019 20:24:30 +0000 (UTC)
Received: from s01061831bf6ec98c.cg.shawcable.net ([68.147.80.180]
 helo=[192.168.6.132])
 by ale.deltatee.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <logang@deltatee.com>)
 id 1hbWGl-00047r-81; Thu, 13 Jun 2019 14:24:24 -0600
To: Dan Williams <dan.j.williams@intel.com>
References: <20190613094326.24093-1-hch@lst.de>
 <CAPcyv4jBdwYaiVwkhy6kP78OBAs+vJme1UTm47dX4Eq_5=JgSg@mail.gmail.com>
 <283e87e8-20b6-0505-a19b-5d18e057f008@deltatee.com>
 <CAPcyv4hx=ng3SxzAWd8s_8VtAfoiiWhiA5kodi9KPc=jGmnejg@mail.gmail.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <d0da4c86-ef52-b981-06af-b37e3e0515ee@deltatee.com>
Date: Thu, 13 Jun 2019 14:24:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAPcyv4hx=ng3SxzAWd8s_8VtAfoiiWhiA5kodi9KPc=jGmnejg@mail.gmail.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 68.147.80.180
X-SA-Exim-Rcpt-To: akpm@linux-foundation.org, linux-pci@vger.kernel.org,
 bskeggs@redhat.com, jgg@mellanox.com, jglisse@redhat.com, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-nvdimm@lists.01.org, hch@lst.de,
 dan.j.williams@intel.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 GREYLIST_ISWHITE autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: dev_pagemap related cleanups
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>, nouveau@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 linux-pci@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAyMDE5LTA2LTEzIDI6MjEgcC5tLiwgRGFuIFdpbGxpYW1zIHdyb3RlOgo+IE9uIFRodSwg
SnVuIDEzLCAyMDE5IGF0IDE6MTggUE0gTG9nYW4gR3VudGhvcnBlIDxsb2dhbmdAZGVsdGF0ZWUu
Y29tPiB3cm90ZToKPj4KPj4KPj4KPj4gT24gMjAxOS0wNi0xMyAxMjoyNyBwLm0uLCBEYW4gV2ls
bGlhbXMgd3JvdGU6Cj4+PiBPbiBUaHUsIEp1biAxMywgMjAxOSBhdCAyOjQzIEFNIENocmlzdG9w
aCBIZWxsd2lnIDxoY2hAbHN0LmRlPiB3cm90ZToKPj4+Pgo+Pj4+IEhpIERhbiwgSsOpcsO0bWUg
YW5kIEphc29uLAo+Pj4+Cj4+Pj4gYmVsb3cgaXMgYSBzZXJpZXMgdGhhdCBjbGVhbnMgdXAgdGhl
IGRldl9wYWdlbWFwIGludGVyZmFjZSBzbyB0aGF0Cj4+Pj4gaXQgaXMgbW9yZSBlYXNpbHkgdXNh
YmxlLCB3aGljaCByZW1vdmVzIHRoZSBuZWVkIHRvIHdyYXAgaXQgaW4gaG1tCj4+Pj4gYW5kIHRo
dXMgYWxsb3dpbmcgdG8ga2lsbCBhIGxvdCBvZiBjb2RlCj4+Pj4KPj4+PiBEaWZmc3RhdDoKPj4+
Pgo+Pj4+ICAyMiBmaWxlcyBjaGFuZ2VkLCAyNDUgaW5zZXJ0aW9ucygrKSwgODAyIGRlbGV0aW9u
cygtKQo+Pj4KPj4+IEhvb3JheSEKPj4+Cj4+Pj4gR2l0IHRyZWU6Cj4+Pj4KPj4+PiAgICAgZ2l0
Oi8vZ2l0LmluZnJhZGVhZC5vcmcvdXNlcnMvaGNoL21pc2MuZ2l0IGhtbS1kZXZtZW0tY2xlYW51
cAo+Pj4KPj4+IEkganVzdCByZWFsaXplZCB0aGlzIGNvbGxpZGVzIHdpdGggdGhlIGRldl9wYWdl
bWFwIHJlbGVhc2UgcmV3b3JrIGluCj4+PiBBbmRyZXcncyB0cmVlIChjb21taXQgaWRzIGJlbG93
IGFyZSBmcm9tIG5leHQuZ2l0IGFuZCBhcmUgbm90IHN0YWJsZSkKPj4+Cj4+PiA0NDIyZWU4NDc2
ZjAgbW0vZGV2bV9tZW1yZW1hcF9wYWdlczogZml4IGZpbmFsIHBhZ2UgcHV0IHJhY2UKPj4+IDc3
MWYwNzE0ZDBkYyBQQ0kvUDJQRE1BOiB0cmFjayBwZ21hcCByZWZlcmVuY2VzIHBlciByZXNvdXJj
ZSwgbm90IGdsb2JhbGx5Cj4+PiBhZjM3MDg1ZGU5MDYgbGliL2dlbmFsbG9jOiBpbnRyb2R1Y2Ug
Y2h1bmsgb3duZXJzCj4+PiBlMDA0N2ZmOGFhNzcgUENJL1AyUERNQTogZml4IHRoZSBnZW5fcG9v
bF9hZGRfdmlydCgpIGZhaWx1cmUgcGF0aAo+Pj4gMDMxNWQ0N2Q2YWU5IG1tL2Rldm1fbWVtcmVt
YXBfcGFnZXM6IGludHJvZHVjZSBkZXZtX21lbXVubWFwX3BhZ2VzCj4+PiAyMTY0NzVjN2VhYTgg
ZHJpdmVycy9iYXNlL2RldnJlczogaW50cm9kdWNlIGRldm1fcmVsZWFzZV9hY3Rpb24oKQo+Pj4K
Pj4+IENPTkZMSUNUIChjb250ZW50KTogTWVyZ2UgY29uZmxpY3QgaW4gdG9vbHMvdGVzdGluZy9u
dmRpbW0vdGVzdC9pb21hcC5jCj4+PiBDT05GTElDVCAoY29udGVudCk6IE1lcmdlIGNvbmZsaWN0
IGluIG1tL2htbS5jCj4+PiBDT05GTElDVCAoY29udGVudCk6IE1lcmdlIGNvbmZsaWN0IGluIGtl
cm5lbC9tZW1yZW1hcC5jCj4+PiBDT05GTElDVCAoY29udGVudCk6IE1lcmdlIGNvbmZsaWN0IGlu
IGluY2x1ZGUvbGludXgvbWVtcmVtYXAuaAo+Pj4gQ09ORkxJQ1QgKGNvbnRlbnQpOiBNZXJnZSBj
b25mbGljdCBpbiBkcml2ZXJzL3BjaS9wMnBkbWEuYwo+Pj4gQ09ORkxJQ1QgKGNvbnRlbnQpOiBN
ZXJnZSBjb25mbGljdCBpbiBkcml2ZXJzL252ZGltbS9wbWVtLmMKPj4+IENPTkZMSUNUIChjb250
ZW50KTogTWVyZ2UgY29uZmxpY3QgaW4gZHJpdmVycy9kYXgvZGV2aWNlLmMKPj4+IENPTkZMSUNU
IChjb250ZW50KTogTWVyZ2UgY29uZmxpY3QgaW4gZHJpdmVycy9kYXgvZGF4LXByaXZhdGUuaAo+
Pj4KPj4+IFBlcmhhcHMgd2Ugc2hvdWxkIHB1bGwgdGhvc2Ugb3V0IGFuZCByZXNlbmQgdGhlbSB0
aHJvdWdoIGhtbS5naXQ/Cj4+Cj4+IEhtbSwgSSd2ZSBiZWVuIHdhaXRpbmcgZm9yIHRob3NlIHBh
dGNoZXMgdG8gZ2V0IGluIGZvciBhIGxpdHRsZSB3aGlsZSBub3cgOygKPiAKPiBVbmxlc3MgQW5k
cmV3IHdhcyBnb2luZyB0byBzdWJtaXQgYXMgdjUuMi1yYyBmaXhlcyBJIHRoaW5rIEkgc2hvdWxk
Cj4gcmViYXNlIC8gc3VibWl0IHRoZW0gb24gY3VycmVudCBobW0uZ2l0IGFuZCB0aGVuIHRocm93
IHRoZXNlIGNsZWFudXBzCj4gZnJvbSBDaHJpc3RvcGggb24gdG9wPwoKV2hhdGV2ZXIgeW91IGZl
ZWwgaXMgYmVzdC4gSSdtIGp1c3QgaG9waW5nIHRoZXkgZ2V0IGluIHNvb25lciByYXRoZXIKdGhh
biBsYXRlci4gVGhleSBkbyBmaXggYSBidWcgYWZ0ZXIgYWxsLiBMZXQgbWUga25vdyBpZiB5b3Ug
d2FudCBtZSB0bwpyZXRlc3QgdGhlIFAyUERNQSBzdHVmZiBhZnRlciB0aGUgcmViYXNlLgoKVGhh
bmtzLAoKTG9nYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
