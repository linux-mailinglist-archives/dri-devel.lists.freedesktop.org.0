Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 305B826DBBE
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 14:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3183D6E25B;
	Thu, 17 Sep 2020 12:39:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF49B6EA68
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 12:39:50 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08HCdgxq054466;
 Thu, 17 Sep 2020 07:39:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600346382;
 bh=FSxwoPL7aSoYCkxBrZForrCAzlbC92v79w5BQmsdNss=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=HznG9ARTc3qmGgjk4fJmV+S3pVgtetMzjo6El+rR7+AAENDTRgf1cs3kcPWwBDriX
 DZ8ormumBmFIOGp9Bj9de5xC+G9BoT3Y17Hey6sobsNjmc8r8fiKYs+zksxk0x0gPG
 kMlWUBEpun0XwozxUrO/wPqSE9Ap4EXGO3cj3Opc=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08HCdgVp041779
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 17 Sep 2020 07:39:42 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 17
 Sep 2020 07:39:42 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 17 Sep 2020 07:39:42 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08HCdddv017095;
 Thu, 17 Sep 2020 07:39:40 -0500
Subject: Re: [PATCHv2] dt-bindings: dp-connector: add binding for DisplayPort
 connector
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20200917055210.22868-1-tomi.valkeinen@ti.com>
 <20200917112229.GR6112@intel.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <5265c620-ee51-3896-4c5a-9e3284c52327@ti.com>
Date: Thu, 17 Sep 2020 15:39:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917112229.GR6112@intel.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Swapnil Kashinath Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTcvMDkvMjAyMCAxNDoyMiwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgo+IE9uIFRodSwgU2Vw
IDE3LCAyMDIwIGF0IDA4OjUyOjEwQU0gKzAzMDAsIFRvbWkgVmFsa2VpbmVuIHdyb3RlOgo+PiBB
ZGQgYmluZGluZyBmb3IgRGlzcGxheVBvcnQgY29ubmVjdG9yLiBBIGZldyBub3RlczoKPj4KPj4g
KiBTaW1pbGFyIHRvIGhkbWktY29ubmVjdG9yLCBpdCBoYXMgaHBkLWdwaW9zIGFzIGFuIG9wdGlv
bmFsIHByb3BlcnR5LAo+PiAgIGFzIHRoZSBIUEQgY291bGQgYWxzbyBiZSBoYW5kbGVkIGJ5LCBl
LmcuLCB0aGUgRFAgYnJpZGdlLgo+Pgo+PiAqIGRwLXB3ci1zdXBwbHksIHdoaWNoIHByb3ZpZGVz
IDMuM1Ygb24gRFBfUFdSIHBpbiwgaXMgb3B0aW9uYWwsIGFzIGl0Cj4+ICAgaXMgbm90IHN0cmlj
dGx5IHJlcXVpcmVkOiBzdGFuZGFyZCBEUCBjYWJsZXMgZG8gbm90IGV2ZW4gaGF2ZSB0aGUgcGlu
Cj4+ICAgY29ubmVjdGVkLgo+Pgo+PiAqIENvbm5lY3RvciB0eXBlLiBGdWxsIHNpemUgYW5kIG1p
bmkgY29ubmVjdG9ycyBhcmUgaWRlbnRpY2FsIGV4Y2VwdCBmb3IKPj4gICB0aGUgY29ubmVjdG9y
IHNpemUgYW5kIGZvcm0sIHNvIEkgYmVsaWV2ZSB0aGVyZSBpcyBubyBmdW5jdGlvbmFsIG5lZWQK
Pj4gICBmb3IgdGhpcyBwcm9wZXJ0eS4gQnV0IHNpbWlsYXIgdG8gJ2xhYmVsJyBwcm9wZXJ0eSwg
aXQgbWlnaHQgYmUgdXNlZAo+PiAgIHRvIHByZXNlbnQgaW5mb3JtYXRpb24gYWJvdXQgdGhlIGNv
bm5lY3RvciB0byB0aGUgdXNlcnNwYWNlLgo+Pgo+PiAqIE5vIGVEUC4gVGhlcmUncyByZWFsbHkg
bm8gImVEUCBjb25uZWN0b3IiLCBhcyBpdCdzIGFsd2F5cyBhIGN1c3RvbQo+PiAgIG1hZGUgY29u
bmVjdGlvbiBiZXR3ZWVuIHRoZSBEUCBhbmQgdGhlIERQIHBhbmVsLiBTbyBwb3NzaWJseSB0aGVy
ZSBpcwo+PiAgIG5vIG5lZWQgZm9yIGVkcC1jb25uZWN0b3IgYmluZGluZywgYnV0IGV2ZW4gaWYg
dGhlcmUgaXMsIEkgZG9uJ3Qgd2FudAo+PiAgIHRvIGd1ZXNzIHdoYXQgaXQgY291bGQgbG9vayBs
aWtlLCBhbmQgY291bGQgaXQgYmUgcGFydCBvZiB0aGUKPj4gICBkcC1jb25uZWN0b3IgYmluZGlu
Zy4KPj4KPj4gKiBObyBEUCsrLiBJJ20gbm90IGZhbWlsaWFyIHdpdGggRFArKywgYnV0IEkgdGhp
bmsgaXQncyBhbGwgaGFuZGxlZCBieQo+PiAgIHRoZSBEUCBicmlkZ2UsIGFuZCBkb2VzIG5vdCBu
ZWVkIGFueSBuZXcgcHJvcGVydGllcyB0byB0aGUgZHAtY29ubmVjdG9yLgo+IAo+IFlvdSBtaWdo
dCBuZWVkIGFuIGkyYyBidXMgZm9yIHRoaXMuIEl0J3MgdXAgdG8gdGhlIHNvdXJjZSBkZXZpY2UK
PiB0byBlaXRoZXIgaG9vayB1cCBqdXN0IEFVWCBDSCwgb3IgYm90aCBBVVggQ0ggYW5kIEREQyB0
byBhIERQKysKPiBjb25uZWN0b3IuIElmIGp1c3QgQVVYIENIIGlzIHdpcmVkIHVwIHlvdSBhcmUg
bGltaXRlZCB0byB1c2luZwo+IG9ubHkgdHlwZTIgRFAgZHVhbCBtb2RlIGFkYXB0ZXJzLCB3aGVy
ZWFzIGlmIHlvdSBhbHNvIGhhdmUgRERDCj4gdGhlIGNyYXBwaWVyIHR5cGUxIGFkYXB0ZXJzIHdp
bGwgYWxzbyB3b3JrLgoKT2ssIHRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRpb25zIG9uIHRoaXMu
Cgo+IEkgZ3Vlc3MgaXQncyBwb3NzaWJsZSBzb21lIGJyaWRnZXMgbWlnaHQgaGFuZGxlIGFsbCB0
aGF0IGZvciB5b3UuCj4gQnV0IGVnLiBvbiBpOTE1IHdlIGFsd2F5cyBzZXQgdXAgYm90aCBBVVgg
Q0ggYW5kIEREQywgYW5kIHNvbWUKPiBleHRyYSBjaXJjdWl0cnkgb24gdGhlIGJvYXJkIHdpbGwg
aXNvbGF0ZSBvbmUgb3IgdGhlIG90aGVyCj4gZGVwZW5kaW5nIG9uIHdoYXQga2luZCBvZiBkb25n
bGUvY2FibGUgZ2V0cyBwbHVnZ2VkIGluCj4gKGlkZW50aWZpZWQgdmlhIHRoZSBDT05GSUcgcGlu
cykuCgpJcyB0aGF0IGF1dG9tYXRpYyBvbiBpOTE1PyBJIGNvdWxkIGltYWdpbmUgYSBncGlvLWNv
bnRyb2xsZWQgbXV4IGRvaW5nIHRoZSBpc29sYXRpb24sIGFuZCB0aGVuIHdlCm5lZWQgc29tZSBk
cml2ZXIgY29udHJvbGxpbmcgdGhlIGdwaW8uCgpJIGNvdWxkIGFkZCB0aGUgZGRjIGJ1cyB0aGUg
c2FtZSB3YXkgYXMgb24gaGRtaS1jb25uZWN0b3IueWFtbCwgYnV0IHBlcmhhcHMgaXQncyBiZXR0
ZXIgdG8gbGVhdmUKdGhhdCBmb3Igc29tZW9uZSB3aXRoIGEgRFArKyBib2FyZC4gQWZhaWNzLCB0
aGVyZSBzaG91bGQgYmUgbm8gcHJvYmxlbXMgYWRkaW5nIHRoaXMgbGF0ZXIuCgogVG9taQoKLS0g
ClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhl
bHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWlj
aWxlOiBIZWxzaW5raQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
