Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B1327E2F0
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 09:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D516089948;
	Wed, 30 Sep 2020 07:50:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F776E090
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 04:47:04 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1601441228; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=A3rhz6VOuxhz1gApk6ziXDpUvE+cY9p88hAOu1BpWd4=;
 b=gt2Rp9hWyLzGmqQ+dBEu5zU0YKT09+JbQPUgOrwRSgU/VDjGCh7Usdg1dWLDZyVpBwJZ5Q2W
 lhuWGbrpWwZRUKZ9iG985jF9auwzdbaQXuu1Jso3p6CK2x74LMaA3wc4VnO9iOfCDqxAG0tw
 lOP6tNaHaK+PmXUWLcvPIy3M6fw=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f740da159892db41fbfaf7a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 30 Sep 2020 04:46:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 39632C43387; Wed, 30 Sep 2020 04:46:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cgoldswo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BAD36C433C8;
 Wed, 30 Sep 2020 04:46:22 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 29 Sep 2020 21:46:22 -0700
From: Chris Goldsworthy <cgoldswo@codeaurora.org>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [RFC][PATCH 5/6] dma-buf: system_heap: Add pagepool support to
 system heap
In-Reply-To: <20200926042453.67517-6-john.stultz@linaro.org>
References: <20200926042453.67517-1-john.stultz@linaro.org>
 <20200926042453.67517-6-john.stultz@linaro.org>
Message-ID: <1e109a138c86be7b06e20cb30a243fc7@codeaurora.org>
X-Sender: cgoldswo@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Wed, 30 Sep 2020 07:50:09 +0000
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
Cc: Sandeep Patil <sspatil@google.com>, dri-devel@lists.freedesktop.org,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@kernel.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wOS0yNSAyMToyNCwgSm9obiBTdHVsdHogd3JvdGU6Cj4gUmV1c2UvYWJ1c2UgdGhl
IHBhZ2Vwb29sIGNvZGUgZnJvbSB0aGUgbmV0d29yayBjb2RlIHRvIHNwZWVkCj4gdXAgYWxsb2Nh
dGlvbiBwZXJmb3JtYW5jZS4KPiAKPiBUaGlzIGlzIHNpbWlsYXIgdG8gdGhlIElPTiBwYWdlcG9v
bCB1c2FnZSwgYnV0IHRyaWVzIHRvCj4gdXRpbGl6ZSBnZW5lcmljIGNvZGUgaW5zdGVhZCBvZiBh
IGN1c3RvbSBpbXBsZW1lbnRhdGlvbi4KPiAKPiBDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13
YWxAbGluYXJvLm9yZz4KPiBDYzogTGlhbSBNYXJrIDxsbWFya0Bjb2RlYXVyb3JhLm9yZz4KPiBD
YzogTGF1cmEgQWJib3R0IDxsYWJib3R0QGtlcm5lbC5vcmc+Cj4gQ2M6IEJyaWFuIFN0YXJrZXkg
PEJyaWFuLlN0YXJrZXlAYXJtLmNvbT4KPiBDYzogSHJpZHlhIFZhbHNhcmFqdSA8aHJpZHlhQGdv
b2dsZS5jb20+Cj4gQ2M6IFN1cmVuIEJhZ2hkYXNhcnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+Cj4g
Q2M6IFNhbmRlZXAgUGF0aWwgPHNzcGF0aWxAZ29vZ2xlLmNvbT4KPiBDYzogw5hyamFuIEVpZGUg
PG9yamFuLmVpZGVAYXJtLmNvbT4KPiBDYzogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJt
LmNvbT4KPiBDYzogRXplcXVpZWwgR2FyY2lhIDxlemVxdWllbEBjb2xsYWJvcmEuY29tPgo+IENj
OiBTaW1vbiBTZXIgPGNvbnRhY3RAZW1lcnNpb24uZnI+Cj4gQ2M6IEphbWVzIEpvbmVzIDxqYWpv
bmVzQG52aWRpYS5jb20+Cj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwo+IENjOiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogSm9obiBTdHVs
dHogPGpvaG4uc3R1bHR6QGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZG1hLWJ1Zi9oZWFw
cy9LY29uZmlnICAgICAgIHwgIDEgKwo+ICBkcml2ZXJzL2RtYS1idWYvaGVhcHMvc3lzdGVtX2hl
YXAuYyB8IDMyICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgMjkgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9kbWEtYnVmL2hlYXBzL0tjb25maWcgCj4gYi9kcml2ZXJzL2RtYS1idWYvaGVhcHMvS2Nv
bmZpZwo+IGluZGV4IGE1ZWVmMDZjNDIyNi4uZjEzY2RlNDMyMWIxIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZG1hLWJ1Zi9oZWFwcy9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9kbWEtYnVmL2hlYXBz
L0tjb25maWcKPiBAQCAtMSw2ICsxLDcgQEAKPiAgY29uZmlnIERNQUJVRl9IRUFQU19TWVNURU0K
PiAgCWJvb2wgIkRNQS1CVUYgU3lzdGVtIEhlYXAiCj4gIAlkZXBlbmRzIG9uIERNQUJVRl9IRUFQ
Uwo+ICsJc2VsZWN0IFBBR0VfUE9PTAo+ICAJaGVscAo+ICAJICBDaG9vc2UgdGhpcyBvcHRpb24g
dG8gZW5hYmxlIHRoZSBzeXN0ZW0gZG1hYnVmIGhlYXAuIFRoZSBzeXN0ZW0gCj4gaGVhcAo+ICAJ
ICBpcyBiYWNrZWQgYnkgcGFnZXMgZnJvbSB0aGUgYnVkZHkgYWxsb2NhdG9yLiBJZiBpbiBkb3Vi
dCwgc2F5IFkuCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9zeXN0ZW1faGVh
cC5jCj4gYi9kcml2ZXJzL2RtYS1idWYvaGVhcHMvc3lzdGVtX2hlYXAuYwo+IGluZGV4IDg4MmE2
MzJlOWJiNy4uOWY1N2I0YzhhZTY5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9oZWFw
cy9zeXN0ZW1faGVhcC5jCj4gKysrIGIvZHJpdmVycy9kbWEtYnVmL2hlYXBzL3N5c3RlbV9oZWFw
LmMKPiBAQCAtMjAsNiArMjAsNyBAQAo+ICAjaW5jbHVkZSA8bGludXgvc2NhdHRlcmxpc3QuaD4K
PiAgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3ZtYWxsb2MuaD4K
PiArI2luY2x1ZGUgPG5ldC9wYWdlX3Bvb2wuaD4KPiAKPiAgc3RydWN0IGRtYV9oZWFwICpzeXNf
aGVhcDsKPiAKPiBAQCAtNDYsNiArNDcsNyBAQCBzdHJ1Y3QgZG1hX2hlYXBfYXR0YWNobWVudCB7
Cj4gIHN0YXRpYyBnZnBfdCBvcmRlcl9mbGFnc1tdID0ge0hJR0hfT1JERVJfR0ZQLCBMT1dfT1JE
RVJfR0ZQLCAKPiBMT1dfT1JERVJfR0ZQfTsKPiAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCBv
cmRlcnNbXSA9IHs4LCA0LCAwfTsKPiAgI2RlZmluZSBOVU1fT1JERVJTIEFSUkFZX1NJWkUob3Jk
ZXJzKQo+ICtzdHJ1Y3QgcGFnZV9wb29sICpwb29sc1tOVU1fT1JERVJTXTsKPiAKPiAgc3RhdGlj
IHN0cnVjdCBzZ190YWJsZSAqZHVwX3NnX3RhYmxlKHN0cnVjdCBzZ190YWJsZSAqdGFibGUpCj4g
IHsKPiBAQCAtMjY0LDEzICsyNjYsMTcgQEAgc3RhdGljIHZvaWQgc3lzdGVtX2hlYXBfZG1hX2J1
Zl9yZWxlYXNlKHN0cnVjdAo+IGRtYV9idWYgKmRtYWJ1ZikKPiAgCXN0cnVjdCBzeXN0ZW1faGVh
cF9idWZmZXIgKmJ1ZmZlciA9IGRtYWJ1Zi0+cHJpdjsKPiAgCXN0cnVjdCBzZ190YWJsZSAqdGFi
bGU7Cj4gIAlzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnOwo+IC0JaW50IGk7Cj4gKwlpbnQgaSwgajsK
PiAKPiAgCXRhYmxlID0gJmJ1ZmZlci0+c2dfdGFibGU7Cj4gIAlmb3JfZWFjaF9zZyh0YWJsZS0+
c2dsLCBzZywgdGFibGUtPm5lbnRzLCBpKSB7Cj4gIAkJc3RydWN0IHBhZ2UgKnBhZ2UgPSBzZ19w
YWdlKHNnKTsKPiAKPiAtCQlfX2ZyZWVfcGFnZXMocGFnZSwgY29tcG91bmRfb3JkZXIocGFnZSkp
Owo+ICsJCWZvciAoaiA9IDA7IGogPCBOVU1fT1JERVJTOyBqKyspIHsKPiArCQkJaWYgKGNvbXBv
dW5kX29yZGVyKHBhZ2UpID09IG9yZGVyc1tqXSkKPiArCQkJCWJyZWFrOwo+ICsJCX0KPiArCQlw
YWdlX3Bvb2xfcHV0X2Z1bGxfcGFnZShwb29sc1tqXSwgcGFnZSwgZmFsc2UpOwo+ICAJfQo+ICAJ
c2dfZnJlZV90YWJsZSh0YWJsZSk7Cj4gIAlrZnJlZShidWZmZXIpOwo+IEBAIC0zMDAsOCArMzA2
LDcgQEAgc3RhdGljIHN0cnVjdCBwYWdlCj4gKmFsbG9jX2xhcmdlc3RfYXZhaWxhYmxlKHVuc2ln
bmVkIGxvbmcgc2l6ZSwKPiAgCQkJY29udGludWU7Cj4gIAkJaWYgKG1heF9vcmRlciA8IG9yZGVy
c1tpXSkKPiAgCQkJY29udGludWU7Cj4gLQo+IC0JCXBhZ2UgPSBhbGxvY19wYWdlcyhvcmRlcl9m
bGFnc1tpXSwgb3JkZXJzW2ldKTsKPiArCQlwYWdlID0gcGFnZV9wb29sX2FsbG9jX3BhZ2VzKHBv
b2xzW2ldLCBvcmRlcl9mbGFnc1tpXSk7Cj4gIAkJaWYgKCFwYWdlKQo+ICAJCQljb250aW51ZTsK
PiAgCQlyZXR1cm4gcGFnZTsKPiBAQCAtNDA2LDYgKzQxMSwyNSBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGRtYV9oZWFwX29wcyBzeXN0ZW1faGVhcF9vcHMgPSAKPiB7Cj4gIHN0YXRpYyBpbnQgc3lz
dGVtX2hlYXBfY3JlYXRlKHZvaWQpCj4gIHsKPiAgCXN0cnVjdCBkbWFfaGVhcF9leHBvcnRfaW5m
byBleHBfaW5mbzsKPiArCWludCBpOwo+ICsKPiArCWZvciAoaSA9IDA7IGkgPCBOVU1fT1JERVJT
OyBpKyspIHsKPiArCQlzdHJ1Y3QgcGFnZV9wb29sX3BhcmFtcyBwcDsKPiArCj4gKwkJbWVtc2V0
KCZwcCwgMCwgc2l6ZW9mKHBwKSk7Cj4gKwkJcHAub3JkZXIgPSBvcmRlcnNbaV07Cj4gKwkJcHAu
ZG1hX2RpciA9IERNQV9CSURJUkVDVElPTkFMOwo+ICsJCXBvb2xzW2ldID0gcGFnZV9wb29sX2Ny
ZWF0ZSgmcHApOwo+ICsKPiArCQlpZiAoSVNfRVJSKHBvb2xzW2ldKSkgewo+ICsJCQlpbnQgajsK
PiArCj4gKwkJCXByX2VycigiJXM6IHBhZ2UgcG9vbCBjcmVhdGlvbiBmYWlsZWQhXG4iLCBfX2Z1
bmNfXyk7Cj4gKwkJCWZvciAoaiA9IDA7IGogPCBpOyBqKyspCj4gKwkJCQlwYWdlX3Bvb2xfZGVz
dHJveShwb29sc1tqXSk7Cj4gKwkJCXJldHVybiBQVFJfRVJSKHBvb2xzW2ldKTsKPiArCQl9Cj4g
Kwl9Cj4gCj4gIAlleHBfaW5mby5uYW1lID0gInN5c3RlbSI7Cj4gIAlleHBfaW5mby5vcHMgPSAm
c3lzdGVtX2hlYXBfb3BzOwoKVGhpcyBpcyBjb29sLCBJIGRpZG4ndCBrbm93IGFib3V0IHRoaXMg
cG9vbGluZyBjb2RlIHVuZGVyIC9uZXQvY29yZS4gIApOaWNlIGFuZCBjb21wYWN0LgoKLS0gClRo
ZSBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLgpUaGUgUXVhbGNvbW0gSW5ub3ZhdGlv
biBDZW50ZXIsIEluYy4gaXMgYSBtZW1iZXIgb2YgdGhlIENvZGUgQXVyb3JhIApGb3J1bSwKYSBM
aW51eCBGb3VuZGF0aW9uIENvbGxhYm9yYXRpdmUgUHJvamVjdApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
