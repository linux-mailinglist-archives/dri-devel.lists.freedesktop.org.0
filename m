Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E5D4561F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A6FF89993;
	Fri, 14 Jun 2019 07:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 325 seconds by postgrey-1.36 at gabe;
 Thu, 13 Jun 2019 20:17:57 UTC
Received: from ale.deltatee.com (ale.deltatee.com [207.54.116.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D444E886F0;
 Thu, 13 Jun 2019 20:17:57 +0000 (UTC)
Received: from s01061831bf6ec98c.cg.shawcable.net ([68.147.80.180]
 helo=[192.168.6.132])
 by ale.deltatee.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <logang@deltatee.com>)
 id 1hbWAR-000445-8D; Thu, 13 Jun 2019 14:17:52 -0600
To: Dan Williams <dan.j.williams@intel.com>, Christoph Hellwig <hch@lst.de>
References: <20190613094326.24093-1-hch@lst.de>
 <CAPcyv4jBdwYaiVwkhy6kP78OBAs+vJme1UTm47dX4Eq_5=JgSg@mail.gmail.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <283e87e8-20b6-0505-a19b-5d18e057f008@deltatee.com>
Date: Thu, 13 Jun 2019 14:17:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAPcyv4jBdwYaiVwkhy6kP78OBAs+vJme1UTm47dX4Eq_5=JgSg@mail.gmail.com>
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
 linux-pci@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAyMDE5LTA2LTEzIDEyOjI3IHAubS4sIERhbiBXaWxsaWFtcyB3cm90ZToKPiBPbiBUaHUs
IEp1biAxMywgMjAxOSBhdCAyOjQzIEFNIENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPiB3
cm90ZToKPj4KPj4gSGkgRGFuLCBKw6lyw7RtZSBhbmQgSmFzb24sCj4+Cj4+IGJlbG93IGlzIGEg
c2VyaWVzIHRoYXQgY2xlYW5zIHVwIHRoZSBkZXZfcGFnZW1hcCBpbnRlcmZhY2Ugc28gdGhhdAo+
PiBpdCBpcyBtb3JlIGVhc2lseSB1c2FibGUsIHdoaWNoIHJlbW92ZXMgdGhlIG5lZWQgdG8gd3Jh
cCBpdCBpbiBobW0KPj4gYW5kIHRodXMgYWxsb3dpbmcgdG8ga2lsbCBhIGxvdCBvZiBjb2RlCj4+
Cj4+IERpZmZzdGF0Ogo+Pgo+PiAgMjIgZmlsZXMgY2hhbmdlZCwgMjQ1IGluc2VydGlvbnMoKyks
IDgwMiBkZWxldGlvbnMoLSkKPiAKPiBIb29yYXkhCj4gCj4+IEdpdCB0cmVlOgo+Pgo+PiAgICAg
Z2l0Oi8vZ2l0LmluZnJhZGVhZC5vcmcvdXNlcnMvaGNoL21pc2MuZ2l0IGhtbS1kZXZtZW0tY2xl
YW51cAo+IAo+IEkganVzdCByZWFsaXplZCB0aGlzIGNvbGxpZGVzIHdpdGggdGhlIGRldl9wYWdl
bWFwIHJlbGVhc2UgcmV3b3JrIGluCj4gQW5kcmV3J3MgdHJlZSAoY29tbWl0IGlkcyBiZWxvdyBh
cmUgZnJvbSBuZXh0LmdpdCBhbmQgYXJlIG5vdCBzdGFibGUpCj4gCj4gNDQyMmVlODQ3NmYwIG1t
L2Rldm1fbWVtcmVtYXBfcGFnZXM6IGZpeCBmaW5hbCBwYWdlIHB1dCByYWNlCj4gNzcxZjA3MTRk
MGRjIFBDSS9QMlBETUE6IHRyYWNrIHBnbWFwIHJlZmVyZW5jZXMgcGVyIHJlc291cmNlLCBub3Qg
Z2xvYmFsbHkKPiBhZjM3MDg1ZGU5MDYgbGliL2dlbmFsbG9jOiBpbnRyb2R1Y2UgY2h1bmsgb3du
ZXJzCj4gZTAwNDdmZjhhYTc3IFBDSS9QMlBETUE6IGZpeCB0aGUgZ2VuX3Bvb2xfYWRkX3ZpcnQo
KSBmYWlsdXJlIHBhdGgKPiAwMzE1ZDQ3ZDZhZTkgbW0vZGV2bV9tZW1yZW1hcF9wYWdlczogaW50
cm9kdWNlIGRldm1fbWVtdW5tYXBfcGFnZXMKPiAyMTY0NzVjN2VhYTggZHJpdmVycy9iYXNlL2Rl
dnJlczogaW50cm9kdWNlIGRldm1fcmVsZWFzZV9hY3Rpb24oKQo+IAo+IENPTkZMSUNUIChjb250
ZW50KTogTWVyZ2UgY29uZmxpY3QgaW4gdG9vbHMvdGVzdGluZy9udmRpbW0vdGVzdC9pb21hcC5j
Cj4gQ09ORkxJQ1QgKGNvbnRlbnQpOiBNZXJnZSBjb25mbGljdCBpbiBtbS9obW0uYwo+IENPTkZM
SUNUIChjb250ZW50KTogTWVyZ2UgY29uZmxpY3QgaW4ga2VybmVsL21lbXJlbWFwLmMKPiBDT05G
TElDVCAoY29udGVudCk6IE1lcmdlIGNvbmZsaWN0IGluIGluY2x1ZGUvbGludXgvbWVtcmVtYXAu
aAo+IENPTkZMSUNUIChjb250ZW50KTogTWVyZ2UgY29uZmxpY3QgaW4gZHJpdmVycy9wY2kvcDJw
ZG1hLmMKPiBDT05GTElDVCAoY29udGVudCk6IE1lcmdlIGNvbmZsaWN0IGluIGRyaXZlcnMvbnZk
aW1tL3BtZW0uYwo+IENPTkZMSUNUIChjb250ZW50KTogTWVyZ2UgY29uZmxpY3QgaW4gZHJpdmVy
cy9kYXgvZGV2aWNlLmMKPiBDT05GTElDVCAoY29udGVudCk6IE1lcmdlIGNvbmZsaWN0IGluIGRy
aXZlcnMvZGF4L2RheC1wcml2YXRlLmgKPiAKPiBQZXJoYXBzIHdlIHNob3VsZCBwdWxsIHRob3Nl
IG91dCBhbmQgcmVzZW5kIHRoZW0gdGhyb3VnaCBobW0uZ2l0PwoKSG1tLCBJJ3ZlIGJlZW4gd2Fp
dGluZyBmb3IgdGhvc2UgcGF0Y2hlcyB0byBnZXQgaW4gZm9yIGEgbGl0dGxlIHdoaWxlIG5vdyA7
KAoKTG9nYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
