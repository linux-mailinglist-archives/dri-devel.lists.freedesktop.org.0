Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D022D14B254
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 11:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9A76ED8F;
	Tue, 28 Jan 2020 10:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4086ED8F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 10:13:29 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00SADID0118110;
 Tue, 28 Jan 2020 04:13:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1580206398;
 bh=+C6eAOrqKoHaKj+enDAIeqTSENNe2U0bzKRvVZeWNHA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=dQIiCreocT+01MqIJWtH6uYJvxVSEgMvgkg3OYg3HkzsmI0GycsfMv4V4JLyaWwMO
 l8Lz+WJ/GsmUPkZIh7qQ7bBhrrR8dT/W7ux6sAlBO30UdaB1SkJZMPZpacKLPU03F+
 erZLFbYbpVVmFIPD5qEC2hNeHNE/DdBzEpwTwDtM=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00SADIvw127549
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 Jan 2020 04:13:18 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 28
 Jan 2020 04:13:17 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 28 Jan 2020 04:13:17 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00SADEG4107748;
 Tue, 28 Jan 2020 04:13:15 -0600
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: Add documentation
 for Toshiba tc358768
To: Rob Herring <robh@kernel.org>
References: <20200127105634.7638-1-peter.ujfalusi@ti.com>
 <20200127105634.7638-2-peter.ujfalusi@ti.com> <20200127184939.GA4237@bogus>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <17fbdcd2-48fa-1b09-683d-cef7e1e40046@ti.com>
Date: Tue, 28 Jan 2020 12:14:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200127184939.GA4237@bogus>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, airlied@linux.ie, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, tomi.valkeinen@ti.com, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLAoKT24gMjcvMDEvMjAyMCAyMC40OSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gTW9u
LCBKYW4gMjcsIDIwMjAgYXQgMTI6NTY6MzNQTSArMDIwMCwgUGV0ZXIgVWpmYWx1c2kgd3JvdGU6
Cj4+IFRDMzU4NzY4L1RDMzU4Nzc4IGlzIGEgUGFyYWxsZWwgUkdCIHRvIE1JUEkgRFNJIGJyaWRn
ZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgVWpmYWx1c2kgPHBldGVyLnVqZmFsdXNpQHRp
LmNvbT4KPj4gLS0tCj4+ICAuLi4vZGlzcGxheS9icmlkZ2UvdG9zaGliYSx0YzM1ODc2OC55YW1s
ICAgICAgfCAxNTggKysrKysrKysrKysrKysrKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgMTU4IGlu
c2VydGlvbnMoKykKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvdG9zaGliYSx0YzM1ODc2OC55YW1sCj4+Cj4+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlk
Z2UvdG9zaGliYSx0YzM1ODc2OC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvYnJpZGdlL3Rvc2hpYmEsdGMzNTg3NjgueWFtbAo+PiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjhkZDhjY2EzOWE3Nwo+PiAtLS0gL2Rldi9u
dWxsCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2Jy
aWRnZS90b3NoaWJhLHRjMzU4NzY4LnlhbWwKPj4gK2V4YW1wbGVzOgo+PiArICAtIHwKPj4gKyAg
ICBpMmMxIHsKPj4gKyAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+PiArICAgICAgI3NpemUt
Y2VsbHMgPSA8MD47Cj4+ICsKPj4gKyAgICAgIGRzaV9icmlkZ2U6IHRjMzU4NzY4QDBlIHsKPiAK
PiBHZW5lcmljIG5vZGUgbmFtZXMgYW5kIG5vIGxlYWRpbmcgMHM6Cj4gCj4gZHNpLWJyaWRnZUBl
CgpSaWdodCwgSSdsbCBjb3JyZWN0IGl0LgoKPj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJ0b3No
aWJhLHRjMzU4NzY4IjsKPj4gKyAgICAgICAgcmVnID0gPDB4MGU+Owo+PiArCj4+ICsgICAgICAg
IGNsb2NrcyA9IDwmdGMzNTg3NjhfcmVmY2xrPjsKPj4gKyAgICAgICAgY2xvY2stbmFtZXMgPSAi
cmVmY2xrIjsKPj4gKwo+PiArICAgICAgICAvKiBHUElPIGxpbmUgaXMgaW52ZXJ0ZWQgYmVmb3Jl
IGdvaW5nIHRvIHRoZSBicmlkZ2UgKi8KPj4gKyAgICAgICAgcmVzZXQtZ3Bpb3MgPSA8JnBjZl9k
aXNwbGF5X2JvYXJkIDAgMSAvKiBHUElPX0FDVElWRV9MT1cgKi8+Owo+IAo+IFlvdSBqdXN0IG5l
ZWQgdG8gYWRkIHRoZSBpbmNsdWRlIGZvciB0aGUgZGVmaW5lIHRvIHdvcmsuCgpZb3UgYXJlIHJp
Z2h0LCBpdCBjb21waWxlcyBmaW5lIHdpdGggdGhlIGluY2x1ZGUgYWRkZWQuCgpUaGFuayB5b3Us
Ci0gUMOpdGVyCgo+PiArCj4+ICsgICAgICAgIHZkZGMtc3VwcGx5ID0gPCZ2MV8yZD47Cj4+ICsg
ICAgICAgIHZkZG1pcGktc3VwcGx5ID0gPCZ2MV8yZD47Cj4+ICsgICAgICAgIHZkZGlvLXN1cHBs
eSA9IDwmdjNfM2Q+Owo+PiArCj4+ICsgICAgICAgIGRzaV9icmlkZ2VfcG9ydHM6IHBvcnRzIHsK
Pj4gKyAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPj4gKyAgICAgICAgICAjc2l6ZS1j
ZWxscyA9IDwwPjsKPj4gKwo+PiArICAgICAgICAgIHBvcnRAMCB7Cj4+ICsgICAgICAgICAgICBy
ZWcgPSA8MD47Cj4+ICsgICAgICAgICAgICByZ2JfaW46IGVuZHBvaW50IHsKPj4gKyAgICAgICAg
ICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZkcGlfb3V0PjsKPj4gKyAgICAgICAgICAgICAgZGF0
YS1saW5lcyA9IDwyND47Cj4+ICsgICAgICAgICAgICB9Owo+PiArICAgICAgICAgIH07Cj4+ICsK
Pj4gKyAgICAgICAgICBwb3J0QDEgewo+PiArICAgICAgICAgICAgcmVnID0gPDE+Owo+PiArICAg
ICAgICAgICAgZHNpX291dDogZW5kcG9pbnQgewo+PiArICAgICAgICAgICAgICByZW1vdGUtZW5k
cG9pbnQgPSA8JmxjZF9pbj47Cj4+ICsgICAgICAgICAgICB9Owo+PiArICAgICAgICAgIH07Cj4+
ICsgICAgICAgIH07Cj4+ICsgICAgICB9Owo+PiArICAgIH07Cj4+ICsgICAgCj4+IC0tIAo+PiBQ
ZXRlcgo+Pgo+PiBUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIy
LCAwMDE4MCBIZWxzaW5raS4KPj4gWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290
aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKPj4KCgpUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5k
IE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3Mg
SUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
