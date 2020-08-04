Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D057A23B514
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 08:39:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD926E42D;
	Tue,  4 Aug 2020 06:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C09676E3DF;
 Tue,  4 Aug 2020 06:39:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2CA57AC20;
 Tue,  4 Aug 2020 06:39:58 +0000 (UTC)
Subject: Re: [PATCH 2/6] drm/xen-front: Fix misused IS_ERR_OR_NULL checks
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>
References: <20200731125109.18666-1-andr2000@gmail.com>
 <20200731125109.18666-3-andr2000@gmail.com>
 <6d719ab2-d9f6-2c3c-8979-b12a4d10b96d@suse.com>
 <0ed5082f-0280-16c0-7410-f6a90262bcee@epam.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <1ae2e8b4-eea3-e68b-2897-5e376a688881@suse.com>
Date: Tue, 4 Aug 2020 08:39:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0ed5082f-0280-16c0-7410-f6a90262bcee@epam.com>
Content-Language: en-US
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDQuMDguMjAgMDg6MzUsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+IAo+IE9u
IDgvNC8yMCA5OjEyIEFNLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+PiBPbiAzMS4wNy4yMCAxNDo1
MSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4+PiBGcm9tOiBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4+Pgo+Pj4gVGhl
IHBhdGNoIGM1NzViN2VlYjg5ZjogImRybS94ZW4tZnJvbnQ6IEFkZCBzdXBwb3J0IGZvciBYZW4g
UFYKPj4+IGRpc3BsYXkgZnJvbnRlbmQiIGZyb20gQXByIDMsIDIwMTgsIGxlYWRzIHRvIHRoZSBm
b2xsb3dpbmcgc3RhdGljCj4+PiBjaGVja2VyIHdhcm5pbmc6Cj4+Pgo+Pj4gIMKgwqDCoMKgZHJp
dmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2dlbS5jOjE0MCB4ZW5fZHJtX2Zyb250X2dl
bV9jcmVhdGUoKQo+Pj4gIMKgwqDCoMKgd2FybjogcGFzc2luZyB6ZXJvIHRvICdFUlJfQ0FTVCcK
Pj4+Cj4+PiBkcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfZ2VtLmMKPj4+ICDCoMKg
wqAgMTMzwqAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICp4ZW5fZHJtX2Zyb250X2dlbV9jcmVhdGUo
c3RydWN0IGRybV9kZXZpY2UgKmRldiwKPj4+ICDCoMKgwqAgMTM0wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2l6ZV90IHNpemUpCj4+PiAgwqDCoMKgIDEzNcKgIHsK
Pj4+ICDCoMKgwqAgMTM2wqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB4ZW5fZ2VtX29iamVjdCAq
eGVuX29iajsKPj4+ICDCoMKgwqAgMTM3Cj4+PiAgwqDCoMKgIDEzOMKgwqDCoMKgwqDCoMKgwqDC
oCB4ZW5fb2JqID0gZ2VtX2NyZWF0ZShkZXYsIHNpemUpOwo+Pj4gIMKgwqDCoCAxMznCoMKgwqDC
oMKgwqDCoMKgwqAgaWYgKElTX0VSUl9PUl9OVUxMKHhlbl9vYmopKQo+Pj4gIMKgwqDCoCAxNDDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBFUlJfQ0FTVCh4ZW5fb2Jq
KTsKPj4+Cj4+PiBGaXggdGhpcyBhbmQgdGhlIHJlc3Qgb2YgbWlzdXNlZCBwbGFjZXMgd2l0aCBJ
U19FUlJfT1JfTlVMTCBpbiB0aGUKPj4+IGRyaXZlci4KPj4+Cj4+PiBGaXhlczrCoCBjNTc1Yjdl
ZWI4OWY6ICJkcm0veGVuLWZyb250OiBBZGQgc3VwcG9ydCBmb3IgWGVuIFBWIGRpc3BsYXkgZnJv
bnRlbmQiCj4+Cj4+IEFnYWluIGZvcmdvdCB0byBDYyBzdGFibGU/Cj4gCj4gSSB3YXMganVzdCBu
b3Qgc3VyZSBpZiB0aGVzZSBtaW5vciBmaXhlcyBuZWVkIHRvIGdvIHRoZSBzdGFibGUsIGJ1dCBJ
IHdpbGwgYWRkCgpJJ20gZmluZSBib3RoIHdheXMuCgpJdHMganVzdCBhIHJlZmxleCB3aGVuIEkn
bSBzZWVpbmcgYSBGaXhlczogdGFnIGJ1dCBubyBDYzogc3RhYmxlLiA6LSkKCgpKdWVyZ2VuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
