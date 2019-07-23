Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC4E71F00
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CBDB6E34C;
	Tue, 23 Jul 2019 18:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9416E0CC
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 10:11:11 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d36dd3f0000>; Tue, 23 Jul 2019 03:11:11 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 23 Jul 2019 03:11:10 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 23 Jul 2019 03:11:10 -0700
Received: from [10.25.72.214] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 23 Jul
 2019 10:11:08 +0000
Subject: Re: [PATCH v2] drm/tegra: sor: Enable HDA interrupts at plugin
To: Dmitry Osipenko <digetx@gmail.com>, "thierry.reding@gmail.com"
 <thierry.reding@gmail.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>
References: <1563787632-19762-1-git-send-email-viswanathl@nvidia.com>
 <11288075-f34a-222c-66da-2bfd13db987c@gmail.com>
From: Viswanath L <viswanathl@nvidia.com>
Message-ID: <fe7a0f13-4e85-56db-7629-92c6a8f67014@nvidia.com>
Date: Tue, 23 Jul 2019 15:41:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <11288075-f34a-222c-66da-2bfd13db987c@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Tue, 23 Jul 2019 18:22:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1563876671; bh=TrDkC7hsFFcEl4fFQwj2yJrxHnLvANWklBQezwVn45M=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=STMumYTjuQ59pk4DtURsj11uADdFVJMqM26OY1UrP8Sm1C9yLu2I6YnwZ8035SmY8
 mtbuwEFCzmwj7jQRRjTLWZeGb2pYQ3TcOHRfsQcy5a6Gvj06na0kKlNYlYkhuM72EL
 bmb8Dek5nTPO/FK0DUKaGzxqZFAjMwm9V5F0LNm2mQC81FhK8pZnyiZnZ9Yizszpe4
 NJP4caAFZsIlBi6pldh/I6RXJVhAOXBKkRAaj1HczD8SpXJYTv5+g8KH/8leFDkRda
 fYWOiqfP741uoeLIqjespDjldVE079J6XDehaMCqcY5Iq3Hctrn9iJdQtKL/IZBZNZ
 8feLpogYx22ew==
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
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLCBEbWl0cnkuIFBsZWFzZSBzZWUgbXkgcmVzcG9uc2Vz
IGlubGluZS4KCk9uIDcvMjMvMjAxOSA2OjAwIEFNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4g
MjIuMDcuMjAxOSAxMjoyNywgVmlzd2FuYXRoIEwg0L/QuNGI0LXRgjoKPj4gSERNSSBwbHVnb3V0
IGNhbGxzIHJ1bnRpbWUgc3VzcGVuZCwgd2hpY2ggY2xlYXJzIGludGVycnVwdCByZWdpc3RlcnMK
Pj4gYW5kIGNhdXNlcyBhdWRpbyBmdW5jdGlvbmFsaXR5IHRvIGJyZWFrIG9uIHN1YnNlcXVlbnQg
cGx1Z2luOyBzZXR0aW5nCj4+IGludGVycnVwdCByZWdpc3RlcnMgaW4gc29yX2F1ZGlvX3ByZXBh
cmUoKSBzb2x2ZXMgdGhlIGlzc3VlCj4gSGVsbG8gVmlzd2FuYXRoLAo+Cj4gQSBkb3Qgc2hvdWxk
IGJlIGluIHRoZSBlbmQgb2Ygc2VudGVuY2UsIHBsZWFzZS4gQW5kIHNob3VsZCBiZSBiZXR0ZXIg
dG8KPiBzL3BsdWdpbi9wbHVnLWluLyBpbiB0aGUgY29tbWl0J3MgbWVzc2FnZS90aXRsZSBiZWNh
dXNlICdwbHVnaW4nIHNvdW5kcwo+IGFzIGEgbm91bi4KW1ZMXSBZZXMsIEknbGwgbWFrZSB0aGUg
YWJvdmUgY2hhbmdlcy4KPgo+IFBsZWFzZSBkb24ndCB2ZXJzaW9uIHBhdGNoIGFzIHYyIGlmIHYx
IHdhc24ndCBldmVyIHNlbnQgb3V0LgpbVkxdIE5vdyB0aGF0IEkgaGF2ZSBzZW50IHYyLCBzaGFs
bCBJIGNvbnRpbnVlIHdpdGggdjIgZm9yIHRoZSBuZXh0IApwYXRjaD8gQXBvbG9naWVzIGZvciB0
aGlzIG92ZXJzaWdodC4KPgo+IFlvdSBzaG91bGQgYWRkIGEgc3RhYmxlIHRhZyBoZXJlIHRvIGdl
dCBwYXRjaCBiYWNrcG9ydGVkIGludG8gc3RhYmxlCj4ga2VybmVsIHZlcnNpb25zOgo+Cj4gQ2M6
IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgpbVkxdIFllcywgd2lsbCBhZGQuCj4KPj4gU2lnbmVk
LW9mZi1ieTogVmlzd2FuYXRoIEwgPHZpc3dhbmF0aGxAbnZpZGlhLmNvbT4KPiBUaGUga2VybmVs
IHVwc3RyZWFtaW5nIHJ1bGVzIHJlcXVpcmUgYSBmdWxsIG5hbWUuIEknbSBwcmV0dHkgc3VyZSB0
aGF0IEwKPiBpc24ndCB5b3VycyBzdXJuYW1lLgpbVkxdIE15IG5hbWUgYXBwZWFycyBhcyAiVmlz
d2FuYXRoIEwiIGluIGFsbCBjb21wYW55IHJlY29yZHMgYW5kIGVtYWlsIApsaXN0cy4gSSB3b3Vs
ZCBzdHJvbmdseSBwcmVmZXIgdG8ga2VlcCBpdCB0aGlzIHdheSwgdW5sZXNzIHRoYXQgaXMgYW4g
CmFic29sdXRlIG5vLW5vLgo+PiAtLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMg
fCAxOCArKysrKysrKystLS0tLS0tLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25z
KCspLCA5IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Rl
Z3JhL3Nvci5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5jCj4+IGluZGV4IDViZTVhMDgu
LjA0NzBjZmUgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYwo+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMKPj4gQEAgLTIxNjQsNiArMjE2NCwxNSBA
QCBzdGF0aWMgdm9pZCB0ZWdyYV9zb3JfYXVkaW9fcHJlcGFyZShzdHJ1Y3QgdGVncmFfc29yICpz
b3IpCj4+ICAgCj4+ICAgCXZhbHVlID0gU09SX0FVRElPX0hEQV9QUkVTRU5TRV9FTERWIHwgU09S
X0FVRElPX0hEQV9QUkVTRU5TRV9QRDsKPj4gICAJdGVncmFfc29yX3dyaXRlbChzb3IsIHZhbHVl
LCBTT1JfQVVESU9fSERBX1BSRVNFTlNFKTsKPj4gKwo+PiArCS8qCj4+ICsJICogRW5hYmxlIGFu
ZCB1bm1hc2sgdGhlIEhEQSBjb2RlYyBTQ1JBVENIMCByZWdpc3RlciBpbnRlcnJ1cHQuIFRoaXMK
Pj4gKwkgKiBpcyB1c2VkIGZvciBpbnRlcm9wZXJhYmlsaXR5IGJldHdlZW4gdGhlIEhEQSBjb2Rl
YyBkcml2ZXIgYW5kIHRoZQo+PiArCSAqIEhETUkvRFAgZHJpdmVyLgo+PiArCSAqLwo+PiArCXZh
bHVlID0gU09SX0lOVF9DT0RFQ19TQ1JBVENIMSB8IFNPUl9JTlRfQ09ERUNfU0NSQVRDSDA7Cj4+
ICsJdGVncmFfc29yX3dyaXRlbChzb3IsIHZhbHVlLCBTT1JfSU5UX0VOQUJMRSk7Cj4+ICsJdGVn
cmFfc29yX3dyaXRlbChzb3IsIHZhbHVlLCBTT1JfSU5UX01BU0spOwo+PiAgIH0KPj4gICAKPj4g
ICBzdGF0aWMgdm9pZCB0ZWdyYV9zb3JfYXVkaW9fdW5wcmVwYXJlKHN0cnVjdCB0ZWdyYV9zb3Ig
KnNvcikKPj4gQEAgLTI5MTMsMTUgKzI5MjIsNiBAQCBzdGF0aWMgaW50IHRlZ3JhX3Nvcl9pbml0
KHN0cnVjdCBob3N0MXhfY2xpZW50ICpjbGllbnQpCj4+ICAgCWlmIChlcnIgPCAwKQo+PiAgIAkJ
cmV0dXJuIGVycjsKPj4gICAKPj4gLQkvKgo+PiAtCSAqIEVuYWJsZSBhbmQgdW5tYXNrIHRoZSBI
REEgY29kZWMgU0NSQVRDSDAgcmVnaXN0ZXIgaW50ZXJydXB0LiBUaGlzCj4+IC0JICogaXMgdXNl
ZCBmb3IgaW50ZXJvcGVyYWJpbGl0eSBiZXR3ZWVuIHRoZSBIREEgY29kZWMgZHJpdmVyIGFuZCB0
aGUKPj4gLQkgKiBIRE1JL0RQIGRyaXZlci4KPj4gLQkgKi8KPj4gLQl2YWx1ZSA9IFNPUl9JTlRf
Q09ERUNfU0NSQVRDSDEgfCBTT1JfSU5UX0NPREVDX1NDUkFUQ0gwOwo+PiAtCXRlZ3JhX3Nvcl93
cml0ZWwoc29yLCB2YWx1ZSwgU09SX0lOVF9FTkFCTEUpOwo+PiAtCXRlZ3JhX3Nvcl93cml0ZWwo
c29yLCB2YWx1ZSwgU09SX0lOVF9NQVNLKTsKPj4gLQo+PiAgIAlyZXR1cm4gMDsKPj4gICB9Cj4+
ICAgCj4+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
