Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A83DB8ED55
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 15:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572026E9B3;
	Thu, 15 Aug 2019 13:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 77EE56E9B3;
 Thu, 15 Aug 2019 13:50:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25C6D344;
 Thu, 15 Aug 2019 06:50:56 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 068C83F694;
 Thu, 15 Aug 2019 06:50:54 -0700 (PDT)
Subject: Re: DMA-API: cacheline tracking ENOMEM, dma-debug disabled due to
 nouveau ?
To: Christoph Hellwig <hch@lst.de>, Corentin Labbe
 <clabbe.montjoie@gmail.com>, bskeggs@redhat.com, airlied@linux.ie,
 m.szyprowski@samsung.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org
References: <20190814145033.GA11190@Red>
 <20190814174927.GT7444@phenom.ffwll.local> <20190815133554.GE12036@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <cdb43f4b-55ff-80c3-8d27-56238b2ab1a1@arm.com>
Date: Thu, 15 Aug 2019 14:50:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190815133554.GE12036@lst.de>
Content-Language: en-GB
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

T24gMTUvMDgvMjAxOSAxNDozNSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gT24gV2VkLCBB
dWcgMTQsIDIwMTkgYXQgMDc6NDk6MjdQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPj4g
T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDQ6NTA6MzNQTSArMDIwMCwgQ29yZW50aW4gTGFiYmUg
d3JvdGU6Cj4+PiBIZWxsbwo+Pj4KPj4+IFNpbmNlIGxvdCBvZiByZWxlYXNlIChhdCBsZWFzdCBz
aW5jZSA0LjE5KSwgSSBoaXQgdGhlIGZvbGxvd2luZyBlcnJvciBtZXNzYWdlOgo+Pj4gRE1BLUFQ
STogY2FjaGVsaW5lIHRyYWNraW5nIEVOT01FTSwgZG1hLWRlYnVnIGRpc2FibGVkCj4+Pgo+Pj4g
QWZ0ZXIgaGl0dGluZyB0aGF0LCBJIHRyeSB0byBjaGVjayB3aG8gaXMgY3JlYXRpbmcgc28gbWFu
eSBETUEgbWFwcGluZyBhbmQgc2VlOgo+Pj4gY2F0IC9zeXMva2VybmVsL2RlYnVnL2RtYS1hcGkv
ZHVtcCB8IGN1dCAtZCcgJyAtZjIgfCBzb3J0IHwgdW5pcSAtYwo+Pj4gICAgICAgIDYgYWhjaQo+
Pj4gICAgICAyNTcgZTEwMDBlCj4+PiAgICAgICAgNiBlaGNpLXBjaQo+Pj4gICAgIDU4OTEgbm91
dmVhdQo+Pj4gICAgICAgMjQgdWhjaV9oY2QKPj4+Cj4+PiBEb2VzIG5vdXZlYXUgaGF2aW5nIHRo
aXMgaGlnaCBudW1iZXIgb2YgRE1BIG1hcHBpbmcgaXMgbm9ybWFsID8KPj4KPj4gWWVhaCBzZWVt
cyBwZXJmZWN0bHkgZmluZSBmb3IgYSBncHUuCj4gCj4gVGhhdCBpcyBhIGxvdCBhbmQgYXBwYXJl
bnRseSBvdmVyd2hlbG0gdGhlIGRtYS1kZWJ1ZyB0cmFja2luZy4gIFJvYmluCj4gcmV3cm90ZSB0
aGlzIGNvZGUgaW4gTGludXggNC4yMSB0byB3b3JrIGEgbGl0dGxlIGJldHRlciwgc28gSSdtIGN1
cmlvdXMKPiB3aHkgdGhpcyBtaWdodCBoYXZlIGNoYW5nZXMgaW4gNC4xOSwgYXMgZG1hLWRlYnVn
IGRpZCBub3QgY2hhbmdlIGF0Cj4gYWxsIHRoZXJlLgoKRldJVywgdGhlIGNhY2hlbGluZSB0cmFj
a2luZyBlbnRyaWVzIGFyZSBhIHNlcGFyYXRlIHRoaW5nIGZyb20gdGhlIApkbWEtZGVidWcgZW50
cmllcyB0aGF0IEkgcmVqaWdnZWQgLSBqdWRnaW5nIGJ5IHRob3NlIG51bWJlcnMgdGhlcmUgCnNo
b3VsZCBzdGlsbCBiZSBwbGVudHkgb2YgZnJlZSBkbWEtZGVidWcgZW50cmllcywgYnV0IGZvciBz
b21lIHJlYXNvbiBpdCAKaGFzIGZhaWxlZCB0byBleHRlbmQgdGhlIHJhZGl4IHRyZWUgOi8KClJv
YmluLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
