Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C420110D794
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 16:05:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 099566E92A;
	Fri, 29 Nov 2019 15:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D427C6E928;
 Fri, 29 Nov 2019 15:04:59 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 97B80292A68;
 Fri, 29 Nov 2019 15:04:58 +0000 (GMT)
Date: Fri, 29 Nov 2019 16:04:55 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: [PATCH v2] drm/sched:  Fix passing zero to 'PTR_ERR' warning
Message-ID: <20191129160455.18eebe86@collabora.com>
In-Reply-To: <1572372468-20569-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1572372468-20569-1-git-send-email-andrey.grodzovsky@amd.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dan.carpenter@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyOSBPY3QgMjAxOSAxNDowNzo0OCAtMDQwMApBbmRyZXkgR3JvZHpvdnNreSA8YW5k
cmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4gd3JvdGU6Cgo+IEZpeCBhIHN0YXRpYyBjb2RlIGNoZWNr
ZXIgd2FybmluZy4KPiAKPiB2MjogRHJvcCBQVFJfRVJSX09SX1pFUk8uCj4gCj4gU2lnbmVkLW9m
Zi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Cj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIHwgNyArKysrKy0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIGIvZHJpdmVy
cy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPiBpbmRleCBmMzliOTdlLi5kYmE0Mzkw
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPiBAQCAtNDk2LDgg
KzQ5NiwxMCBAQCB2b2lkIGRybV9zY2hlZF9yZXN1Ym1pdF9qb2JzKHN0cnVjdCBkcm1fZ3B1X3Nj
aGVkdWxlciAqc2NoZWQpCj4gIAkJZmVuY2UgPSBzY2hlZC0+b3BzLT5ydW5fam9iKHNfam9iKTsK
PiAgCj4gIAkJaWYgKElTX0VSUl9PUl9OVUxMKGZlbmNlKSkgewo+ICsJCQlpZiAoSVNfRVJSKGZl
bmNlKSkKPiArCQkJCWRtYV9mZW5jZV9zZXRfZXJyb3IoJnNfZmVuY2UtPmZpbmlzaGVkLCBQVFJf
RVJSKGZlbmNlKSk7Cj4gKwo+ICAJCQlzX2pvYi0+c19mZW5jZS0+cGFyZW50ID0gTlVMTDsKPiAt
CQkJZG1hX2ZlbmNlX3NldF9lcnJvcigmc19mZW5jZS0+ZmluaXNoZWQsIFBUUl9FUlIoZmVuY2Up
KTsKPiAgCQl9IGVsc2Ugewo+ICAJCQlzX2pvYi0+c19mZW5jZS0+cGFyZW50ID0gZmVuY2U7Cj4g
IAkJfQoKRG9uJ3Qga25vdyBpZiB0aGlzIHBhdGNoIGhhcyBhbHJlYWR5IGJlZW4gYXBwbGllZCwg
YnV0IHdlIGNhbiBnZXQgcmlkIG9mCnRoZSBleHRyYSBpbmRlbnRhdGlvbiBsZXZlbCBieSBkb2lu
ZzoKCgkJaWYgKElTX0VSUihmZW5jZSkpIHsKCQkJZG1hX2ZlbmNlX3NldF9lcnJvcigmc19mZW5j
ZS0+ZmluaXNoZWQsCgkJCQkJICAgIFBUUl9FUlIoZmVuY2UpKTsKCQkJZmVuY2UgPSBOVUxMOwoJ
CX0KCgkJc19qb2ItPnNfZmVuY2UtPnBhcmVudCA9IGZlbmNlOwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
