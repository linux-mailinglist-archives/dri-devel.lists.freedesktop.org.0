Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8911CF21F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 07:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BE76E093;
	Tue,  8 Oct 2019 05:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24E86E093
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 05:24:58 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x985OoEi012153;
 Tue, 8 Oct 2019 00:24:50 -0500
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x985OowU008055
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Oct 2019 00:24:50 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 8 Oct
 2019 00:24:46 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 8 Oct 2019 00:24:48 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x985OkZi122677;
 Tue, 8 Oct 2019 00:24:47 -0500
Subject: Re: [PATCH 0/5] Fix SPI module alias for panels used by omapdrm
To: Sam Ravnborg <sam@ravnborg.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
References: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
 <20191007172256.GA1956@ravnborg.org>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <c5bac722-89ac-7d17-2a8c-7297ecb4f836@ti.com>
Date: Tue, 8 Oct 2019 08:24:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007172256.GA1956@ravnborg.org>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570512290;
 bh=AEmf1HcgRzxwk9rzdGvl+kF7AbL/MwAImYXwpTaFMQM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=OlkLRrLdFkJP9Wx/IqPxHVjrW3wRzt4dTByNcLKfBx++4Q1RRwambw57HKfVVPygx
 RI2Ee+BhJm8XN+YPW+dOmpnP3OyGbf4X8ukkuWob2DU/H0VjnoaptSEfHrrwAObhDT
 7fNC4e65tFZSg2UvL/TjCCU+xt/f201mPs/fDw+0=
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
Cc: linux-omap@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Jyri Sarha <jsarha@ti.com>,
 thierry.reding@gmail.com, dri-devel@lists.freedesktop.org,
 letux-kernel@openphoenux.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDcvMTAvMjAxOSAyMDoyMiwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+IEhpIExhdXJlbnQuCj4g
T24gTW9uLCBPY3QgMDcsIDIwMTkgYXQgMDg6MDc6NTZQTSArMDMwMCwgTGF1cmVudCBQaW5jaGFy
dCB3cm90ZToKPj4gSGVsbG8sCj4+Cj4+IFRoaXMgcGF0Y2ggc2VyaWVzIGZpeGVzIGEgbW9kdWxl
IGFsaWFzIGlzc3VlIHdpdGggdGhlIGZpdmUgcmVjZW50bHkKPj4gYWRkZWQgcGFuZWwgZHJpdmVy
cyB1c2VkIGJ5IG9tYXBkcm0uCj4+Cj4+IEJlZm9yZSB0aG9zZSBwYW5lbCBkcml2ZXJzLCBvbWFw
ZHJtIGhhZCBjdXN0b20gZHJpdmVycyBmb3IgdGhlIHBhbmVscywKPj4gYW5kIHByZWZpeGVkIHRo
ZSBPRiBjb21wYXRpYmxlIHN0cmluZ3Mgd2l0aCBhbiAib21hcGRzcywiIHByZWZpeC4gVGhlCj4+
IFNQSSBkZXZpY2UgSURzIGFyZSBjb25zdHJ1Y3RlZCBieSBzdHJpcHBpbmcgdGhlIE9GIGNvbXBh
dGlibGUgc3RyaW5nCj4+IGZyb20gdGhlIHByZWZpeCwgcmVzdWx0aW5nIGluIHRoZSAib21hcGRz
cywiIHByZWZpeCBiZWluZyByZW1vdmVkLCBidXQKPj4gdGhlIHN1YnNlcXVlbmNlIE9GIHZlbmRv
ciBwcmVmaXggYmVpbmcga2VwdC4gVGhlIFNQSSBkcml2ZXJzIHRodXMgaGFkCj4+IG1vZHVsZXMg
YWxpYXNlcyB0aGF0IGNvbnRhaW5lZCB0aGUgdmVuZG9yIHByZWZpeC4KPj4KPj4gTm93IHRoYXQg
dGhlIHBhbmVscyBhcmUgc3VwcG9ydGVkIGJ5IHN0YW5kYXJkIGRyaXZlcnMgYW5kIHRoZSAib21h
cGRzcywiCj4+IHByZWZpeCBpcyByZW1vdmVkLCB0aGUgU1BJIGRldmljZSBJRHMgYXJlIHN0cmlw
cGVkIGZyb20gdGhlIE9GIHZlbmRvcgo+PiBwcmVmaXguIEFzIHRoZSBuZXcgcGFuZWwgZHJpdmVy
cyBjb3BpZWQgdGhlIG1vZHVsZSBhbGlhc2VzIGZyb20gdGhlCj4+IG9tYXBkcm0tc3BlY2lmaWMg
ZHJpdmVycywgdGhleSBjb250YWluIHRoZSB2ZW5kb3IgcHJlZml4IGluIHRoZWlyIFNQSQo+PiBt
b2R1bGUgYWxpYXNlcywgYW5kIGFyZSB0aHVzIG5vdCBsb2FkZWQgYXV0b21hdGljYWxseS4KPj4K
Pj4gRml4IHRoaXMgYnkgcmVtb3ZpbmcgdGhlIHZlbmRvciBwcmVmaXggZnJvbSB0aGUgU1BJIG1v
ZHVsZXMgYWxpYXNlcyBpbgo+PiB0aGUgZHJpdmVycy4gRm9yIGNvbnNpc3RlbmN5IHJlYXNvbiwg
dGhlIG1hbnVhbCBtb2R1bGUgYWxpYXNlcyBhcmUgYWxzbwo+PiBtb3ZlZCB0byB1c2UgYW4gU1BJ
IG1vZHVsZSB0YWJsZS4KPiAKPiBHb29kIGV4cGxhbmF0aW9uIC0gdGhhbmtzLgo+IAo+Pgo+PiBU
aGVzZSBwYXRjaGVzIGFyZSBiYXNlZCBvbiB0aGUgZHJtLW1pc2MtZml4ZXMgYnJhbmNoIGFzIHRo
ZXkgZml4IHY1LjQKPj4gcmVncmVzc2lvbnMuCj4+Cj4+IExhdXJlbnQgUGluY2hhcnQgKDUpOgo+
PiAgICBkcm0vcGFuZWw6IGxnLWxiMDM1cTAyOiBGaXggU1BJIGFsaWFzCj4+ICAgIGRybS9wYW5l
bDogbmVjLW5sODA0OGhsMTE6IEZpeCBTUEkgYWxpYXMKPj4gICAgZHJtL3BhbmVsOiBzb255LWFj
eDU2NWFrbTogRml4IFNQSSBhbGlhcwo+PiAgICBkcm0vcGFuZWw6IHRwby10ZDAyOHR0ZWMxOiBG
aXggU1BJIGFsaWFzCj4+ICAgIGRybS9wYW5lbDogdHBvLXRkMDQzbXRlYTE6IEZpeCBTUEkgYWxp
YXMKPiAKPiBGdWxsIHNlcmllcyBpczoKPiBBY2tlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2
bmJvcmcub3JnPgo+IAo+IEkgZXhwZWN0IHNvbWVvbmUgZWxzZSB0byBwaWNrIHRoZW0gdXAgb3Ig
dGhhdCB5b3UgYXBwbHkgdGhlbS4KClRoYW5rcyEgSSd2ZSBwdXNoZWQgdGhlc2UgdG8gZHJtLW1p
c2MtZml4ZXMuCgogIFRvbWkKCi0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jr
a2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1
MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
