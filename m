Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9729463183
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:03:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D4589BF3;
	Tue,  9 Jul 2019 07:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD276E027
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 18:05:45 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x68I5gQj024246;
 Mon, 8 Jul 2019 13:05:42 -0500
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x68I5ghh040190
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 8 Jul 2019 13:05:42 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 8 Jul
 2019 13:05:42 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 8 Jul 2019 13:05:42 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x68I5fos046757;
 Mon, 8 Jul 2019 13:05:41 -0500
Subject: Re: [PATCH 2/2] backlight: arcxcnn: add "arctic" vendor prefix
To: Brian Dodge <bdodge09@gmail.com>, <pavel@ucw.cz>
References: <1561940895-15837-1-git-send-email-bdodge09@gmail.com>
 <1561940895-15837-3-git-send-email-bdodge09@gmail.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <c7b8da82-e492-db1e-5a02-e4a36df6a6f2@ti.com>
Date: Mon, 8 Jul 2019 13:05:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1561940895-15837-3-git-send-email-bdodge09@gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Tue, 09 Jul 2019 07:01:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1562609142;
 bh=wEbRu5aOTp26FP4TWDfUijCXFiai/2iU7BfaaA5fAN4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=dBDfzhoOpie6dafFJ81O8Dg2iNxxIOcT8M/K5LlvPJMLBOGG4vA08UDO1CIgDgO3S
 4BH4D0OxKi6M5dklrHO2QzwqTMcMVxagJlCS4xbiUG5T5DPGiS2U4WKrYKVOe0Wn8L
 xOXpFfJMMqX/BpJue0j+NnQEZQfmMNmaAzJuFFx0=
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
Cc: devicetree@vger.kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, pbacon@psemi.com, lee.jones@linaro.org,
 linux-leds@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QnJpYW4KCk9uIDYvMzAvMTkgNzoyOCBQTSwgQnJpYW4gRG9kZ2Ugd3JvdGU6Cj4gVGhlIG9yaWdp
bmFsIHBhdGNoIGFkZGluZyB0aGlzIGRyaXZlciBhbmQgRFQgYmluZGluZ3MgaW1wcm9wZXJseQo+
IHVzZWQgImFyYyIgYXMgdGhlIHZlbmRvci1wcmVmaXguIFRoaXMgYWRkcyAiYXJjdGljIiB3aGlj
aCBpcyB0aGUKPiBwcm9wZXIgcHJlZml4IGFuZCByZXRhaW5zICJhcmMiIHRvIGFsbG93IGV4aXN0
aW5nIHVzZXJzIG9mIHRoZQo+ICJhcmMiIHByZWZpeCB0byB1cGRhdGUgdG8gbmV3IGtlcm5lbHMu
IFRoZXJlIGlzIGF0IGxlYXN0IG9uZQo+IChTYW1zdW5nIENocm9tZWJvb2sgUGx1cykKPgo+IFNp
Z25lZC1vZmYtYnk6IEJyaWFuIERvZGdlIDxiZG9kZ2UwOUBnbWFpbC5jb20+Cj4gQWNrZWQtYnk6
IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Cj4gLS0tCj4gICBk
cml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9hcmN4Y25uX2JsLmMgfCA0MSArKysrKysrKysrKysrKysr
KysrKysrKysrKystLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCsp
LCAxMCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdo
dC9hcmN4Y25uX2JsLmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9hcmN4Y25uX2JsLmMKPiBp
bmRleCA3YjFjMGEwLi5hNDE5NTU0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xp
Z2h0L2FyY3hjbm5fYmwuYwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2FyY3hjbm5f
YmwuYwo+IEBAIC0xLDkgKzEsOSBAQAo+ICAgLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAtb25seQo+ICAgLyoKPiAtICogQmFja2xpZ2h0IGRyaXZlciBmb3IgQXJjdGljU2FuZCBB
UkNfWF9DXzBOXzBOIERldmljZXMKPiArICogQmFja2xpZ2h0IGRyaXZlciBmb3IgcFNlbWkgKGZv
cm1lcmx5IEFyY3RpY1NhbmQpIEFSQ19YX0NfME5fME4gRGV2aWNlcwo+ICAgICoKPiAtICogQ29w
eXJpZ2h0IDIwMTYgQXJjdGljU2FuZCwgSW5jLgo+IC0gKiBBdXRob3IgOiBCcmlhbiBEb2RnZSA8
YmRvZGdlQGFyY3RpY3NhbmQuY29tPgoKSSBrbm93IHlvdSBhcmUgdGhlIG9yaWdpbmFsIGF1dGhv
ciBmcm9tIEFyY3RpY1NhbmQgYnV0IGRpZCBwU2VtaSAKYWN0dWFsbHkgb3duIHRoZSBjb3B5cmln
aHQgaW4gMjAxNj8KCkkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBhIGJpZyBpc3N1ZSBqdXN0IHdvbmRl
cmluZyBpZiB3ZSBzaG91bGQgcmV0YWluIHRoZSAKQXJjdGljU2FuZCBjb3B5cmlnaHQgYXMgd2Vs
bC4KClByb2JhYmx5IGEgcXVlc3Rpb24gZm9yIHlvdXIgbGVnYWwgZGVwYXJ0bWVudC4KCk90aGVy
d2lzZQoKUmV2aWV3ZWQtYnk6IERhbiBNdXJwaHkgPGRtdXJwaHlAdGkuY29tPgoKPiArICogQ29w
eXJpZ2h0IDIwMTYtMjAxOSAgcFNlbWksIEluYy4KPiArICogQXV0aG9yIDogQnJpYW4gRG9kZ2Ug
PGJkb2RnZUBwc2VtaS5jb20+Cj4gICAgKi8KPiAgIAo+ICAgI2luY2x1ZGUgPGxpbnV4L2JhY2ts
aWdodC5oPgo+IEBAIC0xOTEsMjcgKzE5MSw0NiBAQCBzdGF0aWMgdm9pZCBhcmN4Y25uX3BhcnNl
X2R0KHN0cnVjdCBhcmN4Y25uICpscCkKPiAgIAlpZiAocmV0ID09IDApCj4gICAJCWxwLT5wZGF0
YS0+aW5pdGlhbF9icmlnaHRuZXNzID0gcHJvZ192YWw7Cj4gICAKPiAtCXJldCA9IG9mX3Byb3Bl
cnR5X3JlYWRfdTMyKG5vZGUsICJhcmMsbGVkLWNvbmZpZy0wIiwgJnByb2dfdmFsKTsKPiArCXJl
dCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJhcmN0aWMsbGVkLWNvbmZpZy0wIiwgJnBy
b2dfdmFsKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobm9k
ZSwgImFyYyxsZWQtY29uZmlnLTAiLCAmcHJvZ192YWwpOwo+ICsKPiAgIAlpZiAocmV0ID09IDAp
Cj4gICAJCWxwLT5wZGF0YS0+bGVkX2NvbmZpZ18wID0gKHU4KXByb2dfdmFsOwo+ICAgCj4gLQly
ZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihub2RlLCAiYXJjLGxlZC1jb25maWctMSIsICZwcm9n
X3ZhbCk7Cj4gKwlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihub2RlLCAiYXJjdGljLGxlZC1j
b25maWctMSIsICZwcm9nX3ZhbCk7Cj4gKwlpZiAocmV0KQo+ICsJCXJldCA9IG9mX3Byb3BlcnR5
X3JlYWRfdTMyKG5vZGUsICJhcmMsbGVkLWNvbmZpZy0xIiwgJnByb2dfdmFsKTsKPiArCj4gICAJ
aWYgKHJldCA9PSAwKQo+ICAgCQlscC0+cGRhdGEtPmxlZF9jb25maWdfMSA9ICh1OClwcm9nX3Zh
bDsKPiAgIAo+IC0JcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobm9kZSwgImFyYyxkaW0tZnJl
cSIsICZwcm9nX3ZhbCk7Cj4gKwlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihub2RlLCAiYXJj
dGljLGRpbS1mcmVxIiwgJnByb2dfdmFsKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0ID0gb2ZfcHJv
cGVydHlfcmVhZF91MzIobm9kZSwgImFyYyxkaW0tZnJlcSIsICZwcm9nX3ZhbCk7Cj4gKwo+ICAg
CWlmIChyZXQgPT0gMCkKPiAgIAkJbHAtPnBkYXRhLT5kaW1fZnJlcSA9ICh1OClwcm9nX3ZhbDsK
PiAgIAo+IC0JcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobm9kZSwgImFyYyxjb21wLWNvbmZp
ZyIsICZwcm9nX3ZhbCk7Cj4gKwlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihub2RlLCAiYXJj
dGljLGNvbXAtY29uZmlnIiwgJnByb2dfdmFsKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0ID0gb2Zf
cHJvcGVydHlfcmVhZF91MzIobm9kZSwgImFyYyxjb21wLWNvbmZpZyIsICZwcm9nX3ZhbCk7Cj4g
Kwo+ICAgCWlmIChyZXQgPT0gMCkKPiAgIAkJbHAtPnBkYXRhLT5jb21wX2NvbmZpZyA9ICh1OClw
cm9nX3ZhbDsKPiAgIAo+IC0JcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobm9kZSwgImFyYyxm
aWx0ZXItY29uZmlnIiwgJnByb2dfdmFsKTsKPiArCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMy
KG5vZGUsICJhcmN0aWMsZmlsdGVyLWNvbmZpZyIsICZwcm9nX3ZhbCk7Cj4gKwlpZiAocmV0KQo+
ICsJCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsCj4gKwkJCQkiYXJjLGZpbHRlci1j
b25maWciLCAmcHJvZ192YWwpOwo+ICsKPiAgIAlpZiAocmV0ID09IDApCj4gICAJCWxwLT5wZGF0
YS0+ZmlsdGVyX2NvbmZpZyA9ICh1OClwcm9nX3ZhbDsKPiAgIAo+IC0JcmV0ID0gb2ZfcHJvcGVy
dHlfcmVhZF91MzIobm9kZSwgImFyYyx0cmltLWNvbmZpZyIsICZwcm9nX3ZhbCk7Cj4gKwlyZXQg
PSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihub2RlLCAiYXJjdGljLHRyaW0tY29uZmlnIiwgJnByb2df
dmFsKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobm9kZSwg
ImFyYyx0cmltLWNvbmZpZyIsICZwcm9nX3ZhbCk7Cj4gKwo+ICAgCWlmIChyZXQgPT0gMCkKPiAg
IAkJbHAtPnBkYXRhLT50cmltX2NvbmZpZyA9ICh1OClwcm9nX3ZhbDsKPiAgIAo+IEBAIC0zODEs
NiArNDAwLDggQEAgc3RhdGljIGludCBhcmN4Y25uX3JlbW92ZShzdHJ1Y3QgaTJjX2NsaWVudCAq
Y2wpCj4gICB9Cj4gICAKPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGFyY3hj
bm5fZHRfaWRzW10gPSB7Cj4gKwl7IC5jb21wYXRpYmxlID0gImFyY3RpYyxhcmMyYzA2MDgiIH0s
Cj4gKwkvKiBoZXJlIHRvIHJlbWFpbiBjb21wYXRpYmxlIHdpdGggYW4gb2xkZXIgYmluZGluZywg
ZG8gbm90IHVzZSAqLwo+ICAgCXsgLmNvbXBhdGlibGUgPSAiYXJjLGFyYzJjMDYwOCIgfSwKPiAg
IAl7IH0KPiAgIH07Cj4gQEAgLTQwNCw1ICs0MjUsNSBAQCBzdGF0aWMgc3RydWN0IGkyY19kcml2
ZXIgYXJjeGNubl9kcml2ZXIgPSB7Cj4gICBtb2R1bGVfaTJjX2RyaXZlcihhcmN4Y25uX2RyaXZl
cik7Cj4gICAKPiAgIE1PRFVMRV9MSUNFTlNFKCJHUEwgdjIiKTsKPiAtTU9EVUxFX0FVVEhPUigi
QnJpYW4gRG9kZ2UgPGJkb2RnZUBhcmN0aWNzYW5kLmNvbT4iKTsKPiArTU9EVUxFX0FVVEhPUigi
QnJpYW4gRG9kZ2UgPGJkb2RnZUBwc2VtaS5jb20+Iik7Cj4gICBNT0RVTEVfREVTQ1JJUFRJT04o
IkFSQ1hDTk4gQmFja2xpZ2h0IGRyaXZlciIpOwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
