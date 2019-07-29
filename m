Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2A579CCF
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 01:30:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393C36E2BF;
	Mon, 29 Jul 2019 23:29:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A6F6E2BF;
 Mon, 29 Jul 2019 23:29:57 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d3f81750000>; Mon, 29 Jul 2019 16:29:57 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 29 Jul 2019 16:29:57 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 29 Jul 2019 16:29:57 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 29 Jul
 2019 23:29:55 +0000
Subject: Re: [PATCH 7/9] mm: remove the unused MIGRATE_PFN_ERROR flag
To: Christoph Hellwig <hch@lst.de>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs
 <bskeggs@redhat.com>
References: <20190729142843.22320-1-hch@lst.de>
 <20190729142843.22320-8-hch@lst.de>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <32f08aa4-c9a3-9545-69aa-2cc3695e15df@nvidia.com>
Date: Mon, 29 Jul 2019 16:29:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190729142843.22320-8-hch@lst.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1564442997; bh=0+thxvZnJ+gcbF/O0zGGEBA6QvsuJ+b1Oc5FzJoq0pI=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=jjOqVbu0SE9IxctyMwqyl6NjiHxbcjJTt/QVPTeHFWZn91g7rXHLoSsXIJCkRMepQ
 4RDY3eiq+JBeMQ2R9fiv8HeECvSmM4knWmk7sjO4TB+BOlqd8o0nizQlMk7DYq6sLe
 +sqF9pqPZKgpUwuguZXMwVmav3HEr6qCsATcyT863EyZfvbK1jjnL6yqbPEQd9ijjJ
 ydsHBn1jU60iHnXNioMmy0fn3Po4Y09SrgrhUiGTMRt6lWOqkn7isWclIxYgC0avDf
 v8q4S08zaE3ikIRtGMn7WjLZkqBtGEBL5IeWH0mes0o8HnufoNHBj4X8jpeZ1nRHSl
 igU0UgPAUNzQQ==
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bharata B Rao <bharata@linux.ibm.com>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDcvMjkvMTkgNzoyOCBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gV2UgZG9uJ3Qg
dXNlIHRoaXMgZmxhZyBhbnltb3JlLCBzbyByZW1vdmUgaXQuCj4gCj4gU2lnbmVkLW9mZi1ieTog
Q2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+CgpSZXZpZXdlZC1ieTogUmFscGggQ2FtcGJl
bGwgPHJjYW1wYmVsbEBudmlkaWEuY29tPgoKPiAtLS0KPiAgIGluY2x1ZGUvbGludXgvbWlncmF0
ZS5oIHwgMSAtCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L21pZ3JhdGUuaCBiL2luY2x1ZGUvbGludXgvbWlncmF0ZS5oCj4g
aW5kZXggMDkzZDY3ZmNmNmRkLi4yMjkxNTNjMmM0OTYgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9s
aW51eC9taWdyYXRlLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L21pZ3JhdGUuaAo+IEBAIC0xNjcs
NyArMTY3LDYgQEAgc3RhdGljIGlubGluZSBpbnQgbWlncmF0ZV9taXNwbGFjZWRfdHJhbnNodWdl
X3BhZ2Uoc3RydWN0IG1tX3N0cnVjdCAqbW0sCj4gICAjZGVmaW5lIE1JR1JBVEVfUEZOX0xPQ0tF
RAkoMVVMIDw8IDIpCj4gICAjZGVmaW5lIE1JR1JBVEVfUEZOX1dSSVRFCSgxVUwgPDwgMykKPiAg
ICNkZWZpbmUgTUlHUkFURV9QRk5fREVWSUNFCSgxVUwgPDwgNCkKPiAtI2RlZmluZSBNSUdSQVRF
X1BGTl9FUlJPUgkoMVVMIDw8IDUpCj4gICAjZGVmaW5lIE1JR1JBVEVfUEZOX1NISUZUCTYKClRo
ZSBNSUdSQVRFX1BGTl9TSElGVCBjb3VsZCBiZSByZWR1Y2VkIHRvIDUgc2luY2UgaXQgaXMgb25s
eSB1c2VkCnRvIG1ha2Ugcm9vbSBmb3IgdGhlIGZsYWdzLgoKPiAgIHN0YXRpYyBpbmxpbmUgc3Ry
dWN0IHBhZ2UgKm1pZ3JhdGVfcGZuX3RvX3BhZ2UodW5zaWduZWQgbG9uZyBtcGZuKQo+IApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
