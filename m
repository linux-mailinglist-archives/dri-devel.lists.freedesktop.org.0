Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDF76BF8E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 18:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A877E6E202;
	Wed, 17 Jul 2019 16:22:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF096E202
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 16:22:32 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:57274
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hnmhK-00065V-BS; Wed, 17 Jul 2019 18:22:30 +0200
Subject: Re: [PATCH 00/10] drm/tinydrm: Remove tinydrm.ko
To: Sam Ravnborg <sam@ravnborg.org>
References: <20190717115817.30110-1-noralf@tronnes.org>
 <20190717133158.GA5121@ravnborg.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <a1f1db8c-42c5-ad3a-cd20-fd322797858e@tronnes.org>
Date: Wed, 17 Jul 2019 18:22:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190717133158.GA5121@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=HgR9sNEXsFjSl/di8z24sthjMZlAZRnkCLqYF05S73o=; 
 b=LzhAlFYlfT0HvltRkUEmV3qrhPtPeLeAOjlrvqOADSsyfNh/Oz1cLILw60MZwEvRFEu9tEel/BKzrmc0XsAqHEJLGTgLxSzKMCTkZTyky0Jf3j/ctWHLD0Dpd2jH9i68QKPbuGjtL2TuuESZICj9kx8w28Ovam1WXK5fCCTnOjmkQRUwD4cC06JpUKA1IAvx8UWuHkE1ndvhT/mcufoH7q5B0KxuOwXrppaOspeHNHfnhWH/ifW9Cy+xxuMfz4z81aG/2LN50NsK3kLL9G/Sg32GsU2haQtN/vHhzOnh8a6gpmcPE/rv2CTNLkKv6Ng4OVpW7HyhvSgYyw43oX4b4A==;
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
Cc: david@lechnology.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTcuMDcuMjAxOSAxNS4zMSwgc2tyZXYgU2FtIFJhdm5ib3JnOgo+IEhpIE5vcmFsZi4K
PiAKPiBOaWNlIHNlcmllcyBvZiBwYXRjaGVzIQo+IAo+IAo+IAo+IE9uIFdlZCwgSnVsIDE3LCAy
MDE5IGF0IDAxOjU4OjA3UE0gKzAyMDAsIE5vcmFsZiBUcsO4bm5lcyB3cm90ZToKPj4gVGhpcyBz
ZXJpZXMgcmVtb3ZlcyB0aGUgcmVtYWluaW5nIGJpdHMgb2YgdGlueWRybS5rby4KPj4KPj4gVGhl
cmUncyBvbmx5IG9uZSBpdGVtIGxlZnQgb24gdGhlIHRpbnlkcm0gdG9kbyBsaXN0IGFuZCB0aGF0
IGlzIG1vdmluZwo+PiBvdXQgbWlwaV9kYmkuCj4+Cj4+IE5vdGU6Cj4+IFRoaXMgZGVwZW5kcyBv
biBhIGNvbW1pdCB0aGF0IGp1c3QgZW50ZXJlZCBMaW51cycgdHJlZToKPj4gZTZmM2Y3ZTRkYzc2
ICgic3BpOiBBZGQgc3BpX2lzX2Jwd19zdXBwb3J0ZWQoKSIpCj4+Cj4+IFNlcmllcyBpcyBhbHNv
IGF2YWlsYWJsZSBoZXJlOgo+PiBodHRwczovL2dpdGh1Yi5jb20vbm90cm8vbGludXgvdHJlZS9y
ZW1vdmVfdGlueWRybV9rbwo+Pgo+PiBOb3JhbGYuCj4+Cj4+IE5vcmFsZiBUcsO4bm5lcyAoMTAp
Ogo+PiAgIGRybTogQWRkIFNQSSBjb25uZWN0b3IgdHlwZQo+PiAgIGRybS90aW55ZHJtOiBVc2Ug
c3BpX2lzX2Jwd19zdXBwb3J0ZWQoKQo+PiAgIGRybS90aW55ZHJtOiBSZW1vdmUgc3BpIGRlYnVn
IGJ1ZmZlciBkdW1waW5nCj4+ICAgZHJtL3Rpbnlkcm06IFJlbW92ZSB0aW55ZHJtX3NwaV9tYXhf
dHJhbnNmZXJfc2l6ZSgpCj4+ICAgZHJtL3Rpbnlkcm06IENsZWFuIHVwIHRpbnlkcm1fc3BpX3Ry
YW5zZmVyKCkKPj4gICBkcm0vdGlueWRybTogTW92ZSB0aW55ZHJtX3NwaV90cmFuc2ZlcigpCj4+
ICAgZHJtL3Rpbnlkcm06IE1vdmUgdGlueWRybV9tYWNoaW5lX2xpdHRsZV9lbmRpYW4oKQo+PiAg
IGRybS90aW55ZHJtL3JlcGFwZXI6IERvbid0IHVzZSB0aW55ZHJtX2Rpc3BsYXlfcGlwZV9pbml0
KCkKPj4gICBkcm0vdGlueWRybS9taXBpLWRiaTogQWRkIG1pcGlfZGJpX2luaXRfd2l0aF9mb3Jt
YXRzKCkKPj4gICBkcm0vdGlueWRybTogTW92ZSB0aW55ZHJtX2Rpc3BsYXlfcGlwZV9pbml0KCkg
dG8gbWlwaS1kYmkKPj4KPiAKPiBQYXRjaCAxLTMsIDcsIDgsIDkgYXJlOgo+IFJldmlld2VkLWJ5
OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gCj4gUGF0Y2ggNCBhcmU6Cj4gQWNr
ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiAoRGlkIG5vdCBmZWVsIEkg
aGFkIGVub3VnaCBiYWNrZ3JvdW5kIHRvIHNheSByLWIpLgo+IAo+IEluZGl2aWR1YWwgY29tbWVu
dHMgc2VudCBmb3IgdGhlIG90aGVyIHBhdGNoZXMuCj4gCgpUaGFua3MgZm9yIHlvdXIgcmV2aWV3
IFNhbSEKCk5vcmFsZi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
