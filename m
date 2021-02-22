Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F09A3210EA
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 07:40:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B206E907;
	Mon, 22 Feb 2021 06:40:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 306 seconds by postgrey-1.36 at gabe;
 Mon, 22 Feb 2021 05:11:07 UTC
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C09666E1E0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 05:11:07 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04420; MF=alex.shi@linux.alibaba.com;
 NM=1; PH=DS; RN=11; SR=0; TI=SMTPD_---0UP9fL7J_1613970355; 
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com
 fp:SMTPD_---0UP9fL7J_1613970355) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 22 Feb 2021 13:05:56 +0800
Subject: Re: [PATCH] doc: use KCFLAGS instead of EXTRA_CFLAGS to pass flags
 from command line
To: Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 linux-doc@vger.kernel.org
References: <20210221152524.197693-1-masahiroy@kernel.org>
From: Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <b1d148cf-5264-54c7-1b6a-b0b4a5e866a1@linux.alibaba.com>
Date: Mon, 22 Feb 2021 13:05:54 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210221152524.197693-1-masahiroy@kernel.org>
X-Mailman-Approved-At: Mon, 22 Feb 2021 06:40:03 +0000
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
Cc: Harry Wei <harryxiyou@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org,
 Federico Vaga <federico.vaga@vaga.pv.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEFsZXggU2hpIDxhbGV4LnNoaUBsaW51eC5hbGliYWJhLmNvbT4KCgrlnKgg
MjAyMS8yLzIxIOS4i+WNiDExOjI1LCBNYXNhaGlybyBZYW1hZGEg5YaZ6YGTOgo+IFlvdSBzaG91
bGQgdXNlIEtDRkxBR1MgdG8gcGFzcyBhZGRpdGlvbmFsIGNvbXBpbGVyIGZsYWdzIGZyb20gdGhl
Cj4gY29tbWFuZCBsaW5lLiBVc2luZyBFWFRSQV9DRkxBR1MgaXMgd3JvbmcuCj4gCj4gRVhUUkFf
Q0ZMQUdTIGlzIHN1cHBvc2VkIHRvIHNwZWNpZnkgZmxhZ3MgYXBwbGllZCBvbmx5IHRvIHRoZSBj
dXJyZW50Cj4gTWFrZWZpbGUgKGFuZCBub3cgZGVwcmVjYXRlZCBpbiBmYXZvciBvZiBjY2ZsYWdz
LXkpLgo+IAo+IEl0IGlzIHN0aWxsIHVzZWQgaW4gYXJjaC9taXBzL2t2bS9NYWtlZmlsZSAoYW5k
IHBvc3NpYmx5IGluIGV4dGVybmFsCj4gbW9kdWxlcyB0b28pLiBQYXNzaW5nIEVYVFJBX0NGTEFH
UyBmcm9tIHRoZSBjb21tYW5kIGxpbmUgb3ZlcndyaXRlcwo+IGl0IGFuZCBicmVha3MgdGhlIGJ1
aWxkLgo+IAo+IEkgYWxzbyBmaXhlZCBkcml2ZXJzL2dwdS9kcm0vdGlsY2RjL01ha2VmaWxlIGJl
Y2F1c2UgY29tbWl0IDgxNjE3NWRkMWZkNwo+ICgiZHJpdmVycy9ncHUvZHJtL3RpbGNkYzogTWFr
ZWZpbGUsIG9ubHkgLVdlcnJvciB3aGVuIG5vIC1XKiBpbgo+IEVYVFJBX0NGTEFHUyIpIHdhcyBi
YXNlZCBvbiB0aGUgc2FtZSBtaXN1bmRlcnN0YW5kaW5nLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1h
c2FoaXJvIFlhbWFkYSA8bWFzYWhpcm95QGtlcm5lbC5vcmc+Cj4gLS0tCj4gCj4gIERvY3VtZW50
YXRpb24vcHJvY2Vzcy80LkNvZGluZy5yc3QgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAy
ICstCj4gIERvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXQtY2hlY2tsaXN0LnJzdCAgICAgICAg
ICAgICAgICAgICAgfCAyICstCj4gIERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL2l0X0lUL3By
b2Nlc3MvNC5Db2RpbmcucnN0ICAgICAgICAgfCAyICstCj4gIERvY3VtZW50YXRpb24vdHJhbnNs
YXRpb25zL2l0X0lUL3Byb2Nlc3Mvc3VibWl0LWNoZWNrbGlzdC5yc3QgfCAyICstCj4gIERvY3Vt
ZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Byb2Nlc3MvNC5Db2RpbmcucnN0ICAgICAgICAg
fCAyICstCj4gIGRyaXZlcnMvZ3B1L2RybS90aWxjZGMvTWFrZWZpbGUgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAyICstCj4gIDYgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCA2IGRlbGV0aW9ucygtKQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
