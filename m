Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B64013A598
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:54:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A17892DE;
	Sun,  9 Jun 2019 12:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C0889906;
 Fri,  7 Jun 2019 20:31:08 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5cfac98c0000>; Fri, 07 Jun 2019 13:31:08 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 07 Jun 2019 13:31:08 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 07 Jun 2019 13:31:08 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Jun
 2019 20:31:05 +0000
Subject: Re: [PATCH v2 hmm 07/11] mm/hmm: Use lockdep instead of comments
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>, "John
 Hubbard" <jhubbard@nvidia.com>, <Felix.Kuehling@amd.com>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-8-jgg@ziepe.ca>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <a5c8ffcb-8fa7-3335-ed62-2bb56ddbdf65@nvidia.com>
Date: Fri, 7 Jun 2019 13:31:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <20190606184438.31646-8-jgg@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1559939468; bh=DJEgcc7UNUR1jWUy9v9yyTysVpXwgehmZtsnaBcLiV0=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=K1TI+oiuxer43MXruxn4aD6k38M1KgmLi/kNbIuGzmeeoT0eYPnPFzEvoKNL+bsga
 u5ORczu2FZ9nHhPCXpcwW8B2+X+xs/86E+K7GJt0nn0cUrJLjE9powkVwlMfgPsgbo
 RlRKemcVRsq2lMZhwvnnjgAsQnoLqVgASmOoiFwdjsiazBd8Emfwo13BUrJbwc1vh5
 zHolieE1lXx1gOo+FydkJqvrCK508ZMX+yo3gxl+xD8typ2aCzbLMBVKIsWpH7Rb0p
 +VyG/635Ox5E8uhpJ04SfqevaDaSIuNM708XWF+vU5ykOZliZ9S9HBBt7QILdCIPqv
 UiwXc/oGqPCMw==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvNi8xOSAxMTo0NCBBTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IEZyb206IEphc29u
IEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiAKPiBTbyB3ZSBjYW4gY2hlY2sgbG9ja2lu
ZyBhdCBydW50aW1lLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1l
bGxhbm94LmNvbT4KPiBSZXZpZXdlZC1ieTogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhh
dC5jb20+CgpSZXZpZXdlZC1ieTogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEuY29t
PgoKPiAtLS0KPiB2Mgo+IC0gRml4IG1pc3NpbmcgJiBpbiBsb2NrZGVwcyAoSmFzb24pCj4gLS0t
Cj4gICBtbS9obW0uYyB8IDQgKystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbW0vaG1tLmMgYi9tbS9obW0uYwo+
IGluZGV4IGY2N2JhMzI5ODNkOWYxLi5jNzAyY2Q3MjY1MWI1MyAxMDA2NDQKPiAtLS0gYS9tbS9o
bW0uYwo+ICsrKyBiL21tL2htbS5jCj4gQEAgLTI1NCwxMSArMjU0LDExIEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgbW11X25vdGlmaWVyX29wcyBobW1fbW11X25vdGlmaWVyX29wcyA9IHsKPiAgICAq
Cj4gICAgKiBUbyBzdGFydCBtaXJyb3JpbmcgYSBwcm9jZXNzIGFkZHJlc3Mgc3BhY2UsIHRoZSBk
ZXZpY2UgZHJpdmVyIG11c3QgcmVnaXN0ZXIKPiAgICAqIGFuIEhNTSBtaXJyb3Igc3RydWN0Lgo+
IC0gKgo+IC0gKiBUSEUgbW0tPm1tYXBfc2VtIE1VU1QgQkUgSEVMRCBJTiBXUklURSBNT0RFICEK
PiAgICAqLwo+ICAgaW50IGhtbV9taXJyb3JfcmVnaXN0ZXIoc3RydWN0IGhtbV9taXJyb3IgKm1p
cnJvciwgc3RydWN0IG1tX3N0cnVjdCAqbW0pCj4gICB7Cj4gKwlsb2NrZGVwX2Fzc2VydF9oZWxk
X2V4Y2x1c2l2ZSgmbW0tPm1tYXBfc2VtKTsKPiArCj4gICAJLyogU2FuaXR5IGNoZWNrICovCj4g
ICAJaWYgKCFtbSB8fCAhbWlycm9yIHx8ICFtaXJyb3ItPm9wcykKPiAgIAkJcmV0dXJuIC1FSU5W
QUw7Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
