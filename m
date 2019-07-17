Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A166C1E5
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 22:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB63892AC;
	Wed, 17 Jul 2019 20:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A737E89286
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 20:09:20 +0000 (UTC)
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:51780 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <david@lechnology.com>)
 id 1hnqEp-007uhO-1G; Wed, 17 Jul 2019 16:09:19 -0400
Subject: Re: [PATCH 07/10] drm/tinydrm: Move tinydrm_machine_little_endian()
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
References: <20190717115817.30110-1-noralf@tronnes.org>
 <20190717115817.30110-8-noralf@tronnes.org>
From: David Lechner <david@lechnology.com>
Message-ID: <a9a68626-fb19-243a-932d-4c864ed683b6@lechnology.com>
Date: Wed, 17 Jul 2019 15:09:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190717115817.30110-8-noralf@tronnes.org>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4pw54trHDza7Y5XFCRprJi8XC/r1O3O93V0s0JTWVTI=; b=yJ6NmcvYfgDMZ2PfhfbHrDuk5U
 odvh0A2WfPHwQJxz/H2FsgI17g55fQyF3VBxm/p/kSUSsygdlF9/3zyjuGYniFHcf8Js7fIaLlS1Q
 d0sIjpp7YxFR6oxVn7SogXzDZd+/kc32qkPP1m2FKGd5JTZ4g+7EsUSgMmybSG4Pc6OWPiggWZnBe
 hHpxoeztVMjxtFaSkQjdhjvyu+OjQB5NjIW9MCfu3GzdHCAenrsP9hGuZliz5EEN9daqnHioyTqgj
 yqvWxUAOUlCzN7CQ12oL0tUUovbsIz7SQTSv5vF4F/icwEpSpqnu/gKotnSor2m1r3Lk5buE9dT0G
 9n2dioLA==;
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy8xNy8xOSA2OjU4IEFNLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4gVGhlIHRpbnlkcm0g
aGVscGVyIGlzIGdvaW5nIGF3YXkgc28gbW92ZSBpdCBpbnRvIHRoZSBvbmx5IHVzZXIgbWlwaS1k
YmkuCj4gCj4gU2lnbmVkLW9mZi1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5v
cmc+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vdGlueWRybS9taXBpLWRiaS5jICAgIHwgMTUg
KysrKysrKysrKysrLS0tCj4gICBpbmNsdWRlL2RybS90aW55ZHJtL3Rpbnlkcm0taGVscGVycy5o
IHwgMTUgLS0tLS0tLS0tLS0tLS0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMo
KyksIDE4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGlu
eWRybS9taXBpLWRiaS5jIGIvZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vbWlwaS1kYmkuYwo+IGlu
ZGV4IDZhOGYyZDY2Mzc3Zi4uNzNkYjI4N2U1YzUyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS90aW55ZHJtL21pcGktZGJpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdGlueWRybS9t
aXBpLWRiaS5jCj4gQEAgLTYyOCw2ICs2MjgsMTUgQEAgdTMyIG1pcGlfZGJpX3NwaV9jbWRfbWF4
X3NwZWVkKHN0cnVjdCBzcGlfZGV2aWNlICpzcGksIHNpemVfdCBsZW4pCj4gICB9Cj4gICBFWFBP
UlRfU1lNQk9MKG1pcGlfZGJpX3NwaV9jbWRfbWF4X3NwZWVkKTsKPiAgIAo+ICtzdGF0aWMgYm9v
bCBtaXBpX2RiaV9tYWNoaW5lX2xpdHRsZV9lbmRpYW4odm9pZCkKPiArewo+ICsjaWYgZGVmaW5l
ZChfX0xJVFRMRV9FTkRJQU4pCj4gKwlyZXR1cm4gdHJ1ZTsKPiArI2Vsc2UKPiArCXJldHVybiBm
YWxzZTsKPiArI2VuZGlmCj4gK30KPiArCgpJJ20ga2luZCBvZiBzdXJwcmlzZWQgdGhhdCB0aGVy
ZSBpc24ndCBzb21ldGhpbmcgbGlrZSB0aGlzIGVsc2V3aGVyZQppbiB0aGUga2VybmVsIGFscmVh
ZHkuIFRoZSB3YXkgdGhpcyBmdW5jdGlvbiBpcyBiZWluZyB1c2VkIGl0IGtpbmQgb2YKc2VlbXMg
bGlrZSBpdCBzaG91bGQgYmUgc3RhdGljIF9fYWx3YXlzX2lubGluZSAob3IgYSBtYWNybykgc28g
dGhhdAp0aGUgY29tcGlsZXIgY2FuIGRvIGEgYmV0dGVyIGpvYiBvcHRpbWl6aW5nIHRoZSBjb2Rl
IChhbHRob3VnaCBpdCBpcwphIHZlcnkgbWlub3IgaW1wcm92ZW1lbnQpLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
