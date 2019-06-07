Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 442163855C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8348A89AC6;
	Fri,  7 Jun 2019 07:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D8C8987C;
 Fri,  7 Jun 2019 03:47:35 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5cf9de530000>; Thu, 06 Jun 2019 20:47:32 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 06 Jun 2019 20:47:34 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 06 Jun 2019 20:47:34 -0700
Received: from [10.110.48.28] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Jun
 2019 03:47:28 +0000
Subject: Re: [PATCH v2 hmm 11/11] mm/hmm: Remove confusing comment and logic
 from hmm_release
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>, "Ralph
 Campbell" <rcampbell@nvidia.com>, <Felix.Kuehling@amd.com>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-12-jgg@ziepe.ca>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <3edc47bd-e8f6-0e65-5844-d16901890637@nvidia.com>
Date: Thu, 6 Jun 2019 20:47:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606184438.31646-12-jgg@ziepe.ca>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1559879252; bh=bZvuY/i6GNCDoB9S/9ycfjQg/GlXUjYF/GtxOCf0uXU=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=A7b3B9MIZYE2j+v3mXjKis5leb/eVo7kaz4HeWlw96qB4oJdGtB86PLsdX70nI9ax
 x3/wFcbHrGloJGNYAG+xmMO+ti4FMUCxIPFMH+21XCi150Jn6NaUYQx0kq04Bf6jKj
 LkktxvYAUlD5Ove8fENnNtyaieAVfZiEKInsVhqpxtqRzXZAStQjBmX1EmXNW9wVD0
 qRd9vtBuVuOZRuz1WMqrpCwQNfKp37kqYjYZ8hbRrh6CM+QdjaHZLXTSzrJBYQvPb/
 tMZ+XTvLFuSez92di1HCFzs1bE/CVkNOISup9kLBndzsy8o/zyKWeRc6duPhudgnyM
 tfNzpFVVgkGIg==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi82LzE5IDExOjQ0IEFNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gRnJvbTogSmFzb24g
R3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+IAo+IGhtbV9yZWxlYXNlKCkgaXMgY2FsbGVk
IGV4YWN0bHkgb25jZSBwZXIgaG1tLiBvcHMtPnJlbGVhc2UoKSBjYW5ub3QKPiBhY2NpZGVudGFs
bHkgdHJpZ2dlciBhbnkgYWN0aW9uIHRoYXQgd291bGQgcmVjdXJzZSBiYWNrIG9udG8KPiBobW0t
Pm1pcnJvcnNfc2VtLgo+IAo+IFRoaXMgZml4ZXMgYSB1c2UgYWZ0ZXItZnJlZSByYWNlIG9mIHRo
ZSBmb3JtOgo+IAo+ICAgICAgICBDUFUwICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBDUFUxCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhtbV9y
ZWxlYXNlKCkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
cF93cml0ZSgmaG1tLT5taXJyb3JzX3NlbSk7Cj4gIGhtbV9taXJyb3JfdW5yZWdpc3RlcihtaXJy
b3IpCj4gICBkb3duX3dyaXRlKCZobW0tPm1pcnJvcnNfc2VtKTsKPiAgIHVwX3dyaXRlKCZobW0t
Pm1pcnJvcnNfc2VtKTsKPiAgIGtmcmVlKG1pcnJvcikKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBtaXJyb3ItPm9wcy0+cmVsZWFzZShtaXJyb3IpCj4gCj4g
VGhlIG9ubHkgdXNlciB3ZSBoYXZlIHRvZGF5IGZvciBvcHMtPnJlbGVhc2UgaXMgYW4gZW1wdHkg
ZnVuY3Rpb24sIHNvIHRoaXMKPiBpcyB1bmFtYmlndW91c2x5IHNhZmUuCj4gCj4gQXMgYSBjb25z
ZXF1ZW5jZSBvZiBwbHVnZ2luZyB0aGlzIHJhY2UgZHJpdmVycyBhcmUgbm90IGFsbG93ZWQgdG8K
PiByZWdpc3Rlci91bnJlZ2lzdGVyIG1pcnJvcnMgZnJvbSB3aXRoaW4gYSByZWxlYXNlIG9wLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiAt
LS0KPiAgbW0vaG1tLmMgfCAyOCArKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9tbS9obW0uYyBiL21tL2htbS5jCj4gaW5kZXggNzA5ZDEzOGRkNDkwMjcuLjNhNDVkZDNk
Nzc4MjQ4IDEwMDY0NAo+IC0tLSBhL21tL2htbS5jCj4gKysrIGIvbW0vaG1tLmMKPiBAQCAtMTM2
LDI2ICsxMzYsMTYgQEAgc3RhdGljIHZvaWQgaG1tX3JlbGVhc2Uoc3RydWN0IG1tdV9ub3RpZmll
ciAqbW4sIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQo+ICAJV0FSTl9PTighbGlzdF9lbXB0eSgmaG1t
LT5yYW5nZXMpKTsKPiAgCW11dGV4X3VubG9jaygmaG1tLT5sb2NrKTsKPiAgCj4gLQlkb3duX3dy
aXRlKCZobW0tPm1pcnJvcnNfc2VtKTsKPiAtCW1pcnJvciA9IGxpc3RfZmlyc3RfZW50cnlfb3Jf
bnVsbCgmaG1tLT5taXJyb3JzLCBzdHJ1Y3QgaG1tX21pcnJvciwKPiAtCQkJCQkgIGxpc3QpOwo+
IC0Jd2hpbGUgKG1pcnJvcikgewo+IC0JCWxpc3RfZGVsX2luaXQoJm1pcnJvci0+bGlzdCk7Cj4g
LQkJaWYgKG1pcnJvci0+b3BzLT5yZWxlYXNlKSB7Cj4gLQkJCS8qCj4gLQkJCSAqIERyb3AgbWly
cm9yc19zZW0gc28gdGhlIHJlbGVhc2UgY2FsbGJhY2sgY2FuIHdhaXQKPiAtCQkJICogb24gYW55
IHBlbmRpbmcgd29yayB0aGF0IG1pZ2h0IGl0c2VsZiB0cmlnZ2VyIGEKPiAtCQkJICogbW11X25v
dGlmaWVyIGNhbGxiYWNrIGFuZCB0aHVzIHdvdWxkIGRlYWRsb2NrIHdpdGgKPiAtCQkJICogdXMu
Cj4gLQkJCSAqLwo+IC0JCQl1cF93cml0ZSgmaG1tLT5taXJyb3JzX3NlbSk7Cj4gKwlkb3duX3Jl
YWQoJmhtbS0+bWlycm9yc19zZW0pOwoKVGhpcyBpcyBjbGVhbmVyIGFuZCBzaW1wbGVyLCBidXQg
SSBzdXNwZWN0IGl0IGlzIGxlYWRpbmcgdG8gdGhlIGRlYWRsb2NrCnRoYXQgUmFscGggQ2FtcGJl
bGwgaXMgc2VlaW5nIGluIGhpcyBkcml2ZXIgdGVzdGluZy4gKEFuZCBpbiBnZW5lcmFsLCBob2xk
aW5nCmEgbG9jayBkdXJpbmcgYSBkcml2ZXIgY2FsbGJhY2sgdXN1YWxseSBsZWFkcyB0byBkZWFk
bG9ja3MuKQoKUmFscGgsIGlzIHRoaXMgdGhlIG9uZT8gSXQncyB0aGUgb25seSBwbGFjZSBpbiB0
aGlzIHBhdGNoc2V0IHdoZXJlIEkgY2FuCnNlZSBhIGxvY2sgYXJvdW5kIGEgY2FsbGJhY2sgdG8g
ZHJpdmVyIGNvZGUsIHRoYXQgd2Fzbid0IHRoZXJlIGJlZm9yZS4gU28KSSdtIHByZXR0eSBzdXJl
IGl0IGlzIHRoZSBvbmUuLi4KCgp0aGFua3MsCi0tIApKb2huIEh1YmJhcmQKTlZJRElBCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
