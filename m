Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC80B6F425
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jul 2019 18:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9528E89B78;
	Sun, 21 Jul 2019 16:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E83EF89B78
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2019 16:41:27 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:56586
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hpEtp-000193-Ku; Sun, 21 Jul 2019 18:41:25 +0200
Subject: Re: [PATCH 0/6] drm/tinydrm: Move mipi_dbi
To: Sam Ravnborg <sam@ravnborg.org>
References: <20190720134709.15186-1-noralf@tronnes.org>
 <20190720202908.GA23794@ravnborg.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <08440fed-529d-8d1a-ec18-594f83d11b2f@tronnes.org>
Date: Sun, 21 Jul 2019 18:41:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190720202908.GA23794@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=ST07TeFhOJ8Nl+nX2ZrV2W8r2eISE1GpjGVWDgSbvn0=; 
 b=I2AcFbtSnXNDW04bRUxmXzrlx8HdF4F6gkPl8ZObUM3dk4jzNf0iku2rul71rqUbfBTm1WbjzPAhOjXSOOvXb3+4CYu+UgDBtNril2iXQ9aHYcmIT/Q88yPPmiglqBhjp5R4D1qnNd9Tvy2DuMKZzYJDIkNvM+B7vtafpo+5dmU+d7fRAx3lxq9ryW3ltkrjnxbCdsZo9a54uy5VCIhYoZbwFd1HGvxmjvqQkIjxpAMtEO/OAM4NqloQBZA4X8bmiTyMKa1ddA67aLCL+effKPduaRCb0i6EbNHi9gmqDBF7rLq/za2IQjd4dsfOCV+L2aEGuXaJ9mqt+2vIJwi24w==;
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

SGkgU2FtLAoKRGVuIDIwLjA3LjIwMTkgMjIuMjksIHNrcmV2IFNhbSBSYXZuYm9yZzoKPiBIaSBO
b3JhbGYuCj4gCj4gR29vZCB0byBzZWUgYSBsb25nIGpvdXJuZXkgZW5kIHdpdGggYSB2ZXJ5IG5p
Y2UgcmVzdWx0Lgo+IEkgb25seSBlbnRlcmVkIHRoZSBEUk0gd29ybGQgZm9yIHRoZSBsYXN0IHBh
cnRzIG9mIHRoZSBqb3VybmV5LAo+IGJ1dCBuZXZlcnRoZWxlc3MgaW1wcmVzc2VkIGJ5IGFsbCB0
aGUgbmljZSByZWZhY3RvcmluZyBkb25lLgo+IAoKVGhhbmtzLCBpdCdzIHRha2VuIGEgd2hpbGUs
IGJ1dCBub3cgaXQncyBxdWl0ZSBlYXN5IHRvIHdyaXRlIHNtYWxsIERSTQpkcml2ZXJzLgoKPiBP
biBTYXQsIEp1bCAyMCwgMjAxOSBhdCAwMzo0NzowM1BNICswMjAwLCBOb3JhbGYgVHLDuG5uZXMg
d3JvdGU6Cj4+IFRoaXMgc2VyaWVzIHRpY2tzIG9mZiB0aGUgbGFzdCB0aW55ZHJtIHRvZG8gZW50
cnkgYW5kIG1vdmVzIG91dCBtaXBpX2RiaQo+PiB0byBiZSBhIGNvcmUgaGVscGVyLgo+Pgo+PiBJ
dCBzcGxpdHMgc3RydWN0IG1pcGlfZGJpIGludG8gYW4gaW50ZXJmYWNlIHBhcnQgYW5kIGEgZGlz
cGxheSBwaXBlbGluZQo+PiBwYXJ0ICh1cGxvYWQgZnJhbWVidWZmZXIgb3ZlciBTUEkpLiBJIGFs
c28gdG9vayB0aGUgb3Bwb3J0dW5pdHkgdG8KPj4gcmVuYW1lIHRoZSBhbWJpZ3VvdXMgJ21pcGkn
IHZhcmlhYmxlIG5hbWUgdG8gJ2RiaScuIFRoaXMgbGluZXMgdXAgd2l0aAo+PiB0aGUgdXNlIG9m
IHRoZSAnZHNpJyB2YXJpYWJsZSBuYW1lIGluIHRoZSBNSVBJIERTSSBoZWxwZXIuCj4+Cj4+IE5v
dGU6Cj4+IFRoaXMgZGVwZW5kcyBvbiBzZXJpZXM6IGRybS90aW55ZHJtOiBSZW1vdmUgdGlueWRy
bS5rbwo+Pgo+PiBTZXJpZXMgaXMgYWxzbyBhdmFpbGFibGUgaGVyZToKPj4gaHR0cHM6Ly9naXRo
dWIuY29tL25vdHJvL2xpbnV4L3RyZWUvbW92ZV9taXBpX2RiaQo+Pgo+PiBOb3JhbGYuCj4+Cj4+
IE5vcmFsZiBUcsO4bm5lcyAoNik6Cj4+ICAgZHJtL3Rpbnlkcm0vbWlwaS1kYmk6IE1vdmUgY21k
bG9jayBtdXRleCBpbml0Cj4+ICAgZHJtL3Rpbnlkcm06IFJlbmFtZSB2YXJpYWJsZSBtaXBpIC0+
IGRiaQo+PiAgIGRybS90aW55ZHJtOiBSZW5hbWUgcmVtYWluaW5nIHZhcmlhYmxlIG1pcGkgLT4g
ZGJpZGV2Cj4+ICAgZHJtL3Rpbnlkcm06IFNwbGl0IHN0cnVjdCBtaXBpX2RiaSBpbiB0d28KPj4g
ICBkcm0vdGlueWRybTogTW92ZSBtaXBpLWRiaQo+PiAgIE1BSU5UQUlORVJTOiBSZW1vdmUgdGlu
eWRybSBlbnRyeQo+IAo+IEkgaGF2ZSByZWFkIGFsbCBwYXRjaGVzIC0gbG9va3MgZ29vZC4KPiBJ
biAiU3BsaXQgc3RydWN0IG1pcGlfZGJpIGluIHR3byIgdGhlIGRvY3VtZW50YXRpb24gZm9yIHRo
ZSBzdHJ1Y3QKPiBtZW1iZXJzIGlzIG1vdmVkIGluc2lkZSB0aGUgc3RydWN0IC0gdGhpcyBtYWtl
cyBpdCBtb3JlIHJlYWRiYWxlIGFuZCBpcwo+IGdvb2QuCj4gVGhpcyBjb3VsZCBoYXZlIGJlZW4g
YW4gaW5kZXBlbmRlbnQgcGF0Y2gsIG9yIGF0IGxlYXN0IG1lbnRpb25lZCBpbiB0aGUKPiBjaGFu
Z2Vsb2cuCj4gCj4gWW91IGNhbiBmb3IgYWxsIHBhdGNoZXMgYWRkOgo+IFJldmlld2VkLWJ5OiBT
YW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gCgpUaGUga2J1aWxkIHRlc3Qgcm9ib3Qg
YWxlcnRlZCB0b2xkIG1lIGFib3V0IHNvbWUgbWlzc2luZyBkZXBlbmRlbmN5IHNvCkknbSBzcGlu
bmluZyBhIG5ldyB2ZXJzaW9uLgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3IFNhbSEKCk5vcmFsZi4K
Cj4gCVNhbQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
