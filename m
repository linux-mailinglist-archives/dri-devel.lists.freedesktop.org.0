Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79427C4855
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 09:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 534A46E8E6;
	Wed,  2 Oct 2019 07:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA016E828
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 15:03:06 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x91F2tBo017997;
 Tue, 1 Oct 2019 10:02:55 -0500
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x91F2tJE014138
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 1 Oct 2019 10:02:55 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 1 Oct
 2019 10:02:55 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 1 Oct 2019 10:02:45 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x91F2swW029639;
 Tue, 1 Oct 2019 10:02:55 -0500
Subject: Re: [PATCH V6 1/8] backlight: qcom-wled: Rename pm8941-wled.c to
 qcom-wled.c
To: Kiran Gunda <kgunda@codeaurora.org>, <bjorn.andersson@linaro.org>,
 <jingoohan1@gmail.com>, <lee.jones@linaro.org>,
 <b.zolnierkie@samsung.com>, <dri-devel@lists.freedesktop.org>,
 <daniel.thompson@linaro.org>, <jacek.anaszewski@gmail.com>,
 <pavel@ucw.cz>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Andy Gross <agross@kernel.org>,
 <linux-fbdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <1569825553-26039-1-git-send-email-kgunda@codeaurora.org>
 <1569825553-26039-2-git-send-email-kgunda@codeaurora.org>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <3cbc14db-9d6d-f60f-eb92-4b4d80d3774d@ti.com>
Date: Tue, 1 Oct 2019 10:03:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1569825553-26039-2-git-send-email-kgunda@codeaurora.org>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Wed, 02 Oct 2019 07:18:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569942175;
 bh=FtGKw7kQQovEcABguQcARfmvU81jXg7GbjUfgsdw1Q4=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=f8M2abPJ5E2aPEAh8yZeVPhhazCotY06RboI3cv1WILlrmTEBfP4Mg331gud3ggIu
 sKf/jLzbNpsnvvV1kbHR6GzbhnKOS5pX83i9/nQjXYx65/DW9J7ndM17sktKdcG5k5
 lwn04f+tpDpmFR/k7cCrgSRN2vfToIiYb5dftpKo=
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

S2lyYW4KCk9uIDkvMzAvMTkgMTozOSBBTSwgS2lyYW4gR3VuZGEgd3JvdGU6Cj4gcG04OTQxLXds
ZWQuYyBkcml2ZXIgaXMgc3VwcG9ydGluZyB0aGUgV0xFRCBwZXJpcGhlcmFsCj4gb24gcG04OTQx
LiBSZW5hbWUgaXQgdG8gcWNvbS13bGVkLmMgc28gdGhhdCBpdCBjYW4gc3VwcG9ydAo+IFdMRUQg
b24gbXVsdGlwbGUgUE1JQ3MuCj4KPiBTaWduZWQtb2ZmLWJ5OiBLaXJhbiBHdW5kYSA8a2d1bmRh
QGNvZGVhdXJvcmEub3JnPgo+IFJldmlld2VkLWJ5OiBCam9ybiBBbmRlcnNzb24gPGJqb3JuLmFu
ZGVyc3NvbkBsaW5hcm8ub3JnPgo+IEFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPgo+IEFja2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8u
b3JnPgo+IEFja2VkLWJ5OiBQYXZlbCBNYWNoZWsgPHBhdmVsQHVjdy5jej4KPiAtLS0KPiAgIC4u
Li9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC97cG04OTQxLXdsZWQudHh0ID0+IHFjb20td2xlZC50
eHR9ICAgIHwgMiArLQoKSW5zdGVhZCBvZiByZW5hbWluZyB0aGlzIGZpbGUgd291bGQgaXQgYmUg
bW9yZSBtYWludGFpbmFibGUgdG8gaW5kaWNhdGUgCmluIHRoZSBwbTg5NDEtd2xlZC50eHQKCnRv
IHJlZmVyZW5jZSB0aGUgcWNvbS13bGVkLnR4dCBmaWxlIGZvciBjb21wbGV0ZSBkZXNjcmlwdGlv
bj8KCkkgd2lsbCBsZXQgUm9iIGNvbW1lbnQgb24gbWFpbnRhaW5hYmlsaXR5LgoKRGFuCgo+ICAg
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCA4ICsrKystLS0tCj4gICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9NYWtlZmls
ZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgIGRyaXZlcnMvdmlk
ZW8vYmFja2xpZ2h0L3twbTg5NDEtd2xlZC5jID0+IHFjb20td2xlZC5jfSAgICAgICAgICAgIHwg
MAo+ICAgNCBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4g
ICByZW5hbWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0
L3twbTg5NDEtd2xlZC50eHQgPT4gcWNvbS13bGVkLnR4dH0gKDk1JSkKPiAgIHJlbmFtZSBkcml2
ZXJzL3ZpZGVvL2JhY2tsaWdodC97cG04OTQxLXdsZWQuYyA9PiBxY29tLXdsZWQuY30gKDEwMCUp
Cj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMv
YmFja2xpZ2h0L3BtODk0MS13bGVkLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9sZWRzL2JhY2tsaWdodC9xY29tLXdsZWQudHh0Cj4gc2ltaWxhcml0eSBpbmRleCA5NSUK
PiByZW5hbWUgZnJvbSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNr
bGlnaHQvcG04OTQxLXdsZWQudHh0Cj4gcmVuYW1lIHRvIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9xY29tLXdsZWQudHh0Cj4gaW5kZXggZTViMjk0ZC4u
ZmIzOWUzMiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bGVkcy9iYWNrbGlnaHQvcG04OTQxLXdsZWQudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L3Fjb20td2xlZC50eHQKPiBAQCAtMSw0ICsx
LDQgQEAKPiAtQmluZGluZyBmb3IgUXVhbGNvbW0gUE04OTQxIFdMRUQgZHJpdmVyCj4gK0JpbmRp
bmcgZm9yIFF1YWxjb21tIFRlY2hub2xvZ2llcywgSW5jLiBXTEVEIGRyaXZlcgo+ICAgCj4gICBS
ZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICAgLSBjb21wYXRpYmxlOiBzaG91bGQgYmUgInFjb20scG04
OTQxLXdsZWQiCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L0tjb25maWcg
Yi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9LY29uZmlnCj4gaW5kZXggOGIwODFkNi4uNmZmMzE3
NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9LY29uZmlnCj4gKysrIGIv
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvS2NvbmZpZwo+IEBAIC0yODQsMTIgKzI4NCwxMiBAQCBj
b25maWcgQkFDS0xJR0hUX1RPU0EKPiAgIAkgIElmIHlvdSBoYXZlIGFuIFNoYXJwIFNMLTYwMDAg
WmF1cnVzIHNheSBZIHRvIGVuYWJsZSBhIGRyaXZlcgo+ICAgCSAgZm9yIGl0cyBiYWNrbGlnaHQK
PiAgIAo+IC1jb25maWcgQkFDS0xJR0hUX1BNODk0MV9XTEVECj4gLQl0cmlzdGF0ZSAiUXVhbGNv
bW0gUE04OTQxIFdMRUQgRHJpdmVyIgo+ICtjb25maWcgQkFDS0xJR0hUX1FDT01fV0xFRAo+ICsJ
dHJpc3RhdGUgIlF1YWxjb21tIFBNSUMgV0xFRCBEcml2ZXIiCj4gICAJc2VsZWN0IFJFR01BUAo+
ICAgCWhlbHAKPiAtCSAgSWYgeW91IGhhdmUgdGhlIFF1YWxjb21tIFBNODk0MSwgc2F5IFkgdG8g
ZW5hYmxlIGEgZHJpdmVyIGZvciB0aGUKPiAtCSAgV0xFRCBibG9jay4KPiArCSAgSWYgeW91IGhh
dmUgdGhlIFF1YWxjb21tIFBNSUMsIHNheSBZIHRvIGVuYWJsZSBhIGRyaXZlciBmb3IgdGhlCj4g
KwkgIFdMRUQgYmxvY2suIEN1cnJlbnRseSBpdCBzdXBwb3J0cyBQTTg5NDEgYW5kIFBNSTg5OTgu
Cj4gICAKPiAgIGNvbmZpZyBCQUNLTElHSFRfU0FIQVJBCj4gICAJdHJpc3RhdGUgIlRhYmxldGtp
b3NrIFNhaGFyYSBUb3VjaC1pVCBCYWNrbGlnaHQgRHJpdmVyIgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3ZpZGVvL2JhY2tsaWdodC9NYWtlZmlsZSBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L01h
a2VmaWxlCj4gaW5kZXggNjNjNTA3Yy4uNmY4Nzc3MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3Zp
ZGVvL2JhY2tsaWdodC9NYWtlZmlsZQo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L01h
a2VmaWxlCj4gQEAgLTQ4LDggKzQ4LDggQEAgb2JqLSQoQ09ORklHX0JBQ0tMSUdIVF9PTUFQMSkJ
CSs9IG9tYXAxX2JsLm8KPiAgIG9iai0kKENPTkZJR19CQUNLTElHSFRfT1QyMDApCQkrPSBvdDIw
MF9ibC5vCj4gICBvYmotJChDT05GSUdfQkFDS0xJR0hUX1BBTkRPUkEpCQkrPSBwYW5kb3JhX2Js
Lm8KPiAgIG9iai0kKENPTkZJR19CQUNLTElHSFRfUENGNTA2MzMpCSs9IHBjZjUwNjMzLWJhY2ts
aWdodC5vCj4gLW9iai0kKENPTkZJR19CQUNLTElHSFRfUE04OTQxX1dMRUQpCSs9IHBtODk0MS13
bGVkLm8KPiAgIG9iai0kKENPTkZJR19CQUNLTElHSFRfUFdNKQkJKz0gcHdtX2JsLm8KPiArb2Jq
LSQoQ09ORklHX0JBQ0tMSUdIVF9RQ09NX1dMRUQpCSs9IHFjb20td2xlZC5vCj4gICBvYmotJChD
T05GSUdfQkFDS0xJR0hUX1NBSEFSQSkJCSs9IGtiMzg4Nl9ibC5vCj4gICBvYmotJChDT05GSUdf
QkFDS0xJR0hUX1NLWTgxNDUyKQkrPSBza3k4MTQ1Mi1iYWNrbGlnaHQubwo+ICAgb2JqLSQoQ09O
RklHX0JBQ0tMSUdIVF9UT1NBKQkJKz0gdG9zYV9ibC5vCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dmlkZW8vYmFja2xpZ2h0L3BtODk0MS13bGVkLmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9x
Y29tLXdsZWQuYwo+IHNpbWlsYXJpdHkgaW5kZXggMTAwJQo+IHJlbmFtZSBmcm9tIGRyaXZlcnMv
dmlkZW8vYmFja2xpZ2h0L3BtODk0MS13bGVkLmMKPiByZW5hbWUgdG8gZHJpdmVycy92aWRlby9i
YWNrbGlnaHQvcWNvbS13bGVkLmMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
