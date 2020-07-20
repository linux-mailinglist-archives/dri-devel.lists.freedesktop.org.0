Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE025225D06
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 13:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD1DB6E354;
	Mon, 20 Jul 2020 11:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701FA6E354
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 11:02:20 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id o11so17385049wrv.9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 04:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=E8A91S8ZjbWXBVYpKOysmPkEFoz/C3qcKb4e1hG1ue4=;
 b=AzAAoCshnHBUaonw0RMWAt/G6j6DDsL2QdycSqYqRnS+r9uQuBDRYMsPpaCPkngeIB
 pwxiYm+RmnmIFQ5UM6WlHjfQNNyioQPlSNbN9Uiz+uodWm9DqPIioNwd1tf2JMXywqW4
 ISNCBpID4v4MFH6B4Ulqiwa/T8pVIyNR2Jps5Yj/VNg1i5WWpr/kXxkZbEqeQEKdsA6V
 I9/ROm3hRtV0qfiYv8G89le7yxE/PX6fMZwPsREaPpdjN9aMsXsjKjtl+lhuxZQRtEKZ
 HJ0oURA+4tGHDrH1Snvxs54Dsxm+SGQomO+ARx+axNh/ue+mK+Im5J2qZqKNpre0g+0k
 bCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=E8A91S8ZjbWXBVYpKOysmPkEFoz/C3qcKb4e1hG1ue4=;
 b=ZXvBIMAHbiyVIbZB18CvQPW0MuU1A9w3I8YarGIRpvF96b7yxYnlLNiAf/A2cb8ECV
 6zqwj54vfZeav4LgqVI2a+wcNlmpnFqHPPRH22XCza3aEsQWG5qzKw+ACw8HX4dVrPJk
 v92mlmRlUxaduG5VjhmK7JPxU0p20UZzIwJ9na3s8nkfayUwfKQrd9GDkpKDcaP9WrBs
 owIFqFxIkcto2iba5OyhdhVPpICVWZ3nrfuwbm0sIQnl//13h3wZpk1A1JGBHem7MmDP
 vF2FzWQmCFPgxfbKdW8H3ejAjp+jawAhiaAZYdiq6zxQj7gKKepcRq0aVVHUvEdSDT5v
 vqow==
X-Gm-Message-State: AOAM5319Pq8o1Zd86qlGhRKrzg1XZhGhEV9j6dJ+iPzGXFof5GhPWiM8
 ZSBNOkDIE9WWxLkbXNw+2DoioWnl
X-Google-Smtp-Source: ABdhPJx/jgua9qQUVL9UIxRieWCgdZBMlC5UcwRjKKnVGXVgsb2HdGe3RAlwHrAV9/+u7jo/C5NzNQ==
X-Received: by 2002:adf:f007:: with SMTP id j7mr11917803wro.195.1595242938731; 
 Mon, 20 Jul 2020 04:02:18 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id 62sm16350762wrq.31.2020.07.20.04.02.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Jul 2020 04:02:18 -0700 (PDT)
Subject: Re: [PATCH 2/8] drm/radeon: stop using TTM_MEMTYPE_FLAG_MAPPABLE
To: "Chauhan, Madhav" <Madhav.Chauhan@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20200716125037.67437-1-christian.koenig@amd.com>
 <20200716125037.67437-2-christian.koenig@amd.com>
 <BL0PR12MB24332E2D588EEE15F702AEFD9C7A0@BL0PR12MB2433.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <aacb5a0c-8be3-4df7-75c1-a8cbc506096e@gmail.com>
Date: Mon, 20 Jul 2020 13:02:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <BL0PR12MB24332E2D588EEE15F702AEFD9C7A0@BL0PR12MB2433.namprd12.prod.outlook.com>
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTkuMDcuMjAgdW0gMTQ6NTcgc2NocmllYiBDaGF1aGFuLCBNYWRoYXY6Cj4gW0FNRCBQdWJs
aWMgVXNlXQo+Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9tOiBDaHJpc3RpYW4g
S8O2bmlnIDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4KPiBTZW50OiBUaHVyc2Rh
eSwgSnVseSAxNiwgMjAyMCA2OjIxIFBNCj4gVG86IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiBDYzogQ2hhdWhhbiwgTWFkaGF2IDxNYWRoYXYuQ2hhdWhhbkBhbWQuY29tPgo+IFN1
YmplY3Q6IFtQQVRDSCAyLzhdIGRybS9yYWRlb246IHN0b3AgdXNpbmcgVFRNX01FTVRZUEVfRkxB
R19NQVBQQUJMRQo+Cj4gVGhlIGRyaXZlciBkb2Vzbid0IGV4cG9zZSBhbnkgbm90LW1hcGFibGUg
bWVtb3J5IHJlc291cmNlcy4KPgo+IExvb2tzIGxpa2Ugc3BlbGwgbWlzdGFrZSBpbiAibWFwYWJs
ZSIuIFBsZWFzZSBjaGVjay4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cmFkZW9uX3R0bS5jIHwgMTMgKysrKy0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbl90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0
bS5jCj4gaW5kZXggNTRhZjA2ZGY4NjViLi5iNDc0NzgxYTA5MjAgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl90dG0uYwo+IEBAIC03Niw3ICs3Niw3IEBAIHN0YXRpYyBpbnQgcmFkZW9u
X2luaXRfbWVtX3R5cGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHVpbnQzMl90IHR5cGUs
Cj4gICAJc3dpdGNoICh0eXBlKSB7Cj4gICAJY2FzZSBUVE1fUExfU1lTVEVNOgo+ICAgCQkvKiBT
eXN0ZW0gbWVtb3J5ICovCj4gLQkJbWFuLT5mbGFncyA9IFRUTV9NRU1UWVBFX0ZMQUdfTUFQUEFC
TEU7Cj4gKwkJbWFuLT5mbGFncyA9IDA7Cj4KPiBhZGV2IG1lbW9yeSB3YXMgc2V0IHRvIHplcm8g
d2hpbGUgYWxsb2NhdGVkIGFuZCBhZGV2LT5tbWFuLmJkZXYgdXNlZCB0byBmZXRjaCBkaWZmZXJl
bnQgbW1hbi4KPiBEbyB3ZSBuZWVkIGV4cGxpY2l0IGluaXRpYWxpemF0aW9uIHRvICcwJz8/CgpO
bywgbm90IHJlYWxseS4gQnV0IEkgd2Fzbid0IHN1cmUgaWYgb3RoZXIgZHJpdmVycyBpbml0aWFs
aXplIHRoZWlyIApzdHJ1Y3R1cmVzIGFzIHdlbGwuCgpTbyBJIGp1c3Qga2VwdCBpdCB0byBiZSB1
bmlmb3JtIGFjcm9zcyBkcml2ZXJzIHRvIGNvbXBsZXRlbHkgcmV3b3JrIAptZW1fdHlwZSBpbml0
IGF0IHNvbWUgcG9pbnQuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+Cj4gUmVnYXJkcywKPiBNYWRo
YXYKPgo+ICAgCQltYW4tPmF2YWlsYWJsZV9jYWNoaW5nID0gVFRNX1BMX01BU0tfQ0FDSElORzsK
PiAgIAkJbWFuLT5kZWZhdWx0X2NhY2hpbmcgPSBUVE1fUExfRkxBR19DQUNIRUQ7Cj4gICAJCWJy
ZWFrOwo+IEBAIC04NCw3ICs4NCw3IEBAIHN0YXRpYyBpbnQgcmFkZW9uX2luaXRfbWVtX3R5cGUo
c3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHVpbnQzMl90IHR5cGUsCj4gICAJCW1hbi0+ZnVu
YyA9ICZ0dG1fYm9fbWFuYWdlcl9mdW5jOwo+ICAgCQltYW4tPmF2YWlsYWJsZV9jYWNoaW5nID0g
VFRNX1BMX01BU0tfQ0FDSElORzsKPiAgIAkJbWFuLT5kZWZhdWx0X2NhY2hpbmcgPSBUVE1fUExf
RkxBR19DQUNIRUQ7Cj4gLQkJbWFuLT5mbGFncyA9IFRUTV9NRU1UWVBFX0ZMQUdfTUFQUEFCTEU7
Cj4gKwkJbWFuLT5mbGFncyA9IDA7Cj4gICAjaWYgSVNfRU5BQkxFRChDT05GSUdfQUdQKQo+ICAg
CQlpZiAocmRldi0+ZmxhZ3MgJiBSQURFT05fSVNfQUdQKSB7Cj4gICAJCQlpZiAoIXJkZXYtPmRk
ZXYtPmFncCkgewo+IEBAIC05Miw4ICs5Miw2IEBAIHN0YXRpYyBpbnQgcmFkZW9uX2luaXRfbWVt
X3R5cGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHVpbnQzMl90IHR5cGUsCj4gICAJCQkJ
CSAgKHVuc2lnbmVkKXR5cGUpOwo+ICAgCQkJCXJldHVybiAtRUlOVkFMOwo+ICAgCQkJfQo+IC0J
CQlpZiAoIXJkZXYtPmRkZXYtPmFncC0+Y2FudF91c2VfYXBlcnR1cmUpCj4gLQkJCQltYW4tPmZs
YWdzID0gVFRNX01FTVRZUEVfRkxBR19NQVBQQUJMRTsKPiAgIAkJCW1hbi0+YXZhaWxhYmxlX2Nh
Y2hpbmcgPSBUVE1fUExfRkxBR19VTkNBQ0hFRCB8Cj4gICAJCQkJCQkgVFRNX1BMX0ZMQUdfV0M7
Cj4gICAJCQltYW4tPmRlZmF1bHRfY2FjaGluZyA9IFRUTV9QTF9GTEFHX1dDOyBAQCAtMTAzLDgg
KzEwMSw3IEBAIHN0YXRpYyBpbnQgcmFkZW9uX2luaXRfbWVtX3R5cGUoc3RydWN0IHR0bV9ib19k
ZXZpY2UgKmJkZXYsIHVpbnQzMl90IHR5cGUsCj4gICAJY2FzZSBUVE1fUExfVlJBTToKPiAgIAkJ
LyogIk9uLWNhcmQiIHZpZGVvIHJhbSAqLwo+ICAgCQltYW4tPmZ1bmMgPSAmdHRtX2JvX21hbmFn
ZXJfZnVuYzsKPiAtCQltYW4tPmZsYWdzID0gVFRNX01FTVRZUEVfRkxBR19GSVhFRCB8Cj4gLQkJ
CSAgICAgVFRNX01FTVRZUEVfRkxBR19NQVBQQUJMRTsKPiArCQltYW4tPmZsYWdzID0gVFRNX01F
TVRZUEVfRkxBR19GSVhFRDsKPiAgIAkJbWFuLT5hdmFpbGFibGVfY2FjaGluZyA9IFRUTV9QTF9G
TEFHX1VOQ0FDSEVEIHwgVFRNX1BMX0ZMQUdfV0M7Cj4gICAJCW1hbi0+ZGVmYXVsdF9jYWNoaW5n
ID0gVFRNX1BMX0ZMQUdfV0M7Cj4gICAJCWJyZWFrOwo+IEBAIC0zOTQsNyArMzkxLDYgQEAgc3Rh
dGljIGludCByYWRlb25fYm9fbW92ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLCBib29s
IGV2aWN0LAo+ICAgCj4gICBzdGF0aWMgaW50IHJhZGVvbl90dG1faW9fbWVtX3Jlc2VydmUoc3Ry
dWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHN0cnVjdCB0dG1fbWVtX3JlZyAqbWVtKSAgewo+IC0J
c3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4gPSAmYmRldi0+bWFuW21lbS0+bWVtX3R5
cGVdOwo+ICAgCXN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2ID0gcmFkZW9uX2dldF9yZGV2KGJk
ZXYpOwo+ICAgCj4gICAJbWVtLT5idXMuYWRkciA9IE5VTEw7Cj4gQEAgLTQwMiw4ICszOTgsNyBA
QCBzdGF0aWMgaW50IHJhZGVvbl90dG1faW9fbWVtX3Jlc2VydmUoc3RydWN0IHR0bV9ib19kZXZp
Y2UgKmJkZXYsIHN0cnVjdCB0dG1fbWVtXwo+ICAgCW1lbS0+YnVzLnNpemUgPSBtZW0tPm51bV9w
YWdlcyA8PCBQQUdFX1NISUZUOwo+ICAgCW1lbS0+YnVzLmJhc2UgPSAwOwo+ICAgCW1lbS0+YnVz
LmlzX2lvbWVtID0gZmFsc2U7Cj4gLQlpZiAoIShtYW4tPmZsYWdzICYgVFRNX01FTVRZUEVfRkxB
R19NQVBQQUJMRSkpCj4gLQkJcmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICAgCXN3aXRjaCAobWVtLT5t
ZW1fdHlwZSkgewo+ICAgCWNhc2UgVFRNX1BMX1NZU1RFTToKPiAgIAkJLyogc3lzdGVtIG1lbW9y
eSAqLwo+IC0tCj4gMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
