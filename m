Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8FC35800
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 09:45:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D3A895EE;
	Wed,  5 Jun 2019 07:45:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB840895EE
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 07:45:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Jun 2019 00:45:09 -0700
X-ExtLoop1: 1
Received: from francela-mobl.amr.corp.intel.com (HELO [10.249.32.70])
 ([10.249.32.70])
 by orsmga003.jf.intel.com with ESMTP; 05 Jun 2019 00:45:06 -0700
Subject: Re: [PATCH 1/8] drm/ast: Unpin cursor BO during cleanup
To: Thomas Zimmermann <tzimmermann@suse.de>, kraxel@redhat.com,
 airlied@redhat.com, daniel@ffwll.ch, maxime.ripard@bootlin.com,
 sean@poorly.run, sam@ravnborg.org, christian.koenig@amd.com
References: <20190604154201.14460-1-tzimmermann@suse.de>
 <20190604154201.14460-2-tzimmermann@suse.de>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <b2c1776f-c1b3-c6ce-db6a-8db247bc25f6@linux.intel.com>
Date: Wed, 5 Jun 2019 09:45:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190604154201.14460-2-tzimmermann@suse.de>
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T3AgMDQtMDYtMjAxOSBvbSAxNzo0MSBzY2hyZWVmIFRob21hcyBaaW1tZXJtYW5uOgo+IFRoZSB1
bnBpbiBvcGVyYXRpb24gd2FzIG1pc3NpbmcgZnJvbSBhc3RfY3Vyc29yX2ZpbmkoKS4gRml4ZWQg
bm93Lgo+Cj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1
c2UuZGU+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYyB8IDEgKwo+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYXN0L2FzdF9tb2RlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMKPiBp
bmRleCBmYjcwMGQ2MjBiNjQuLjQxNzQxY2Q2Y2QxNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYXN0L2FzdF9tb2RlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2Rl
LmMKPiBAQCAtOTU5LDYgKzk1OSw3IEBAIHN0YXRpYyB2b2lkIGFzdF9jdXJzb3JfZmluaShzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2KQo+ICAJc3RydWN0IGRybV9nZW1fdnJhbV9vYmplY3QgKmdibyA9
Cj4gIAkJZHJtX2dlbV92cmFtX29mX2dlbShhc3QtPmN1cnNvcl9jYWNoZSk7Cj4gIAlkcm1fZ2Vt
X3ZyYW1fa3VubWFwX2F0KGdibywgJmFzdC0+Y2FjaGVfa21hcCk7Cj4gKwlkcm1fZ2VtX3ZyYW1f
dW5waW4oZ2JvKTsKPiAgCWRybV9nZW1fb2JqZWN0X3B1dF91bmxvY2tlZChhc3QtPmN1cnNvcl9j
YWNoZSk7Cj4gIH0KPiAgCgpGaXhlcyB0YWc/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
