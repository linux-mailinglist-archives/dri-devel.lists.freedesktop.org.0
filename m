Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 325EC30B9C2
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:28:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7555B6E91E;
	Tue,  2 Feb 2021 08:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2380F6E8BB
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 04:38:58 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DVBsQ4WfVz9tjx;
 Tue,  2 Feb 2021 15:38:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1612240733; bh=JV5mvPqI7mC12a0Jzv79/LqoKulofPvb0rBJOXH5x7U=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=XIPtQDSlstzubdvttEp8uPfdS7mLrKN3vwh7wUgmJ4vAQgXvxrdFl1p1akbbIf8qQ
 SPTa5eD6Zf3ndknJEYHt6Qf/t7UCFg6VzsIkNrpkV3yrcK63lxTlg/qXFQwDf/9X5N
 O4unuidXpzNgx3gD38YpP+gLogyfNF3eO61WaJ4+L1UABVssCXwWUKAkCzzrm+pnbn
 grvFAwftmNL495Bk0e2WNxN4ugcm95DBbXhNlKTKrlY4HsXYjlsF6K4DRUB8QLEyFZ
 t79+YmPRvzzNLUCNd8qdejMHMhw+Aw6w2nHJXeQlrZ0iuLFHivEfb/KdKaye+vh0pk
 LG5b/5YbjU1+Q==
Message-ID: <8ff9f9d92271b25bd11cf473bf64466816efe93b.camel@ozlabs.org>
Subject: Re: [PATCH 1/2] drm/aspeed: Look up syscon by phandle
From: Jeremy Kerr <jk@ozlabs.org>
To: Joel Stanley <joel@jms.id.au>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Andrew Jeffery <andrew@aj.id.au>
Date: Tue, 02 Feb 2021 12:38:45 +0800
In-Reply-To: <20210111044638.290909-2-joel@jms.id.au>
References: <20210111044638.290909-1-joel@jms.id.au>
 <20210111044638.290909-2-joel@jms.id.au>
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 02 Feb 2021 08:27:00 +0000
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
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9lbCwKClNvdW5kcyBsaWtlIGEgZ29vZCBpZGVhISBPbmUgY29tbWVudCB0aG91Z2g6Cgo+
IEBAIC0xMTEsMTAgKzExMiwxMyBAQCBzdGF0aWMgaW50IGFzcGVlZF9nZnhfbG9hZChzdHJ1Y3Qg
ZHJtX2RldmljZSAqZHJtKQo+IMKgwqDCoMKgwqDCoMKgwqBpZiAoSVNfRVJSKHByaXYtPmJhc2Up
KQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIFBUUl9FUlIocHJpdi0+
YmFzZSk7Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqBwcml2LT5zY3UgPSBzeXNjb25fcmVnbWFwX2xv
b2t1cF9ieV9jb21wYXRpYmxlKCJhc3BlZWQsYXN0MjUwMC1zY3UiKTsKPiArwqDCoMKgwqDCoMKg
wqBwcml2LT5zY3UgPSBzeXNjb25fcmVnbWFwX2xvb2t1cF9ieV9waGFuZGxlKG5wLCAic3lzY29u
Iik7Cj4gwqDCoMKgwqDCoMKgwqDCoGlmIChJU19FUlIocHJpdi0+c2N1KSkgewo+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkZXZfZXJyKCZwZGV2LT5kZXYsICJmYWlsZWQgdG8gZmlu
ZCBTQ1UgcmVnbWFwXG4iKTsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJu
IFBUUl9FUlIocHJpdi0+c2N1KTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcHJp
di0+c2N1ID0gc3lzY29uX3JlZ21hcF9sb29rdXBfYnlfY29tcGF0aWJsZSgiYXNwZWVkLGFzcGVl
ZC1zY3UiKTsKCklzIHRoaXMgKG1vcmUgZ2VuZXJpYykgY29tcGF0aWJsZSB2YWx1ZSBndWFyYW50
ZWVkIHRvIGV4aXN0IGFsb25nc2lkZQphc3BlZWQsYXN0MjUwMC1zY3U/IFRoZSBzY3UgYmluZGlu
ZyBvbmx5IHNwZWNpZmllcyB0aGUgbW9kZWwtc3BlY2lmaWMKb25lczoKCiAgICBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL2FzcGVlZC1zY3UudHh0OgoKICAgIFJlcXVpcmVk
IHByb3BlcnRpZXM6CiAgICAtIGNvbXBhdGlibGU6CU9uZSBvZjoKICAgICAgICAgICAgICAgICAg
ICAiYXNwZWVkLGFzdDI0MDAtc2N1IiwgInN5c2NvbiIsICJzaW1wbGUtbWZkIgogICAgICAgICAg
ICAgICAgICAgICJhc3BlZWQsYXN0MjUwMC1zY3UiLCAic3lzY29uIiwgInNpbXBsZS1tZmQiCgot
IHRoZSBvbmx5IG1lbnRpb24gb2YgdGhlIG5ldyBjb21wYXRpYmxlIHZhbHVlIHRoYXQgSSBjYW4g
ZmluZCBpcyB0aGlzCnRocmVhZC4gTWF5YmUgd2Ugc2hvdWxkIHJldGFpbiB0aGUgZXhpc3Rpbmcg
b25lIHRvIGtlZXAgdGhlIGZhbGxiYWNrCmNhc2Ugd29ya2luZz8KCkNoZWVycywKCgpKZXJlbXkK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
