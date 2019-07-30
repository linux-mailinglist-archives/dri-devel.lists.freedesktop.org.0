Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C06FB7A6D2
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 13:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14AC6E49B;
	Tue, 30 Jul 2019 11:24:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F1B6E49B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 11:24:03 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6UBNwSL086590;
 Tue, 30 Jul 2019 06:23:58 -0500
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6UBNwmZ057992
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 30 Jul 2019 06:23:58 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 30
 Jul 2019 06:23:58 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 30 Jul 2019 06:23:58 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6UBNuKk043545;
 Tue, 30 Jul 2019 06:23:57 -0500
Subject: Re: [PATCH] dma-mapping: remove dma_{alloc,free,mmap}_writecombine
To: Christoph Hellwig <hch@lst.de>
References: <20190730061849.29686-1-hch@lst.de>
 <5f73f400-eff2-6c7b-887d-c768642d8df1@ti.com> <20190730102050.GA1663@lst.de>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <f8425921-dc50-0cbd-72cb-b73a1194cfb7@ti.com>
Date: Tue, 30 Jul 2019 14:23:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730102050.GA1663@lst.de>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1564485838;
 bh=bePICY9kNLcLOXhYrJoI3GRMfK4jeDEPCdEecBOuYVk=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=UbPMT9XRI32A7NfJlQJkwhI/3bf2x6G4IPZOIFWxzr7e2OAOsKEdh2AWsPGcNXTT2
 OKCD8225QykWeITsIkSCv+cqVx3N6I7UhfGXxaGI/w0Oy3nhMD1DPsujkuwphwrwb5
 mvQhBzvAY4UFSqy/rv8nhvCq0svgUNYCaFmV4wlY=
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
Cc: iommu@lists.linux-foundation.org, laurent.pinchart@ideasonboard.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMzAvMDcvMjAxOSAxMzoyMCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gT24gVHVlLCBK
dWwgMzAsIDIwMTkgYXQgMTA6NTA6MzJBTSArMDMwMCwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4+
IE9uIDMwLzA3LzIwMTkgMDk6MTgsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+Pj4gV2UgY2Fu
IGFscmVhZHkgdXNlIERNQV9BVFRSX1dSSVRFX0NPTUJJTkUgb3IgdGhlIF93YyBwcmVmaXhlZCB2
ZXJzaW9uLAo+Pj4gc28gcmVtb3ZlIHRoZSB0aGlyZCB3YXkgb2YgZG9pbmcgdGhpbmdzLgo+Pj4K
Pj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+Pj4gLS0t
Cj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZGlzcGMuYyB8IDExICsrKysrLS0t
LS0tCj4+PiAgICBpbmNsdWRlL2xpbnV4L2RtYS1tYXBwaW5nLmggICAgICAgICB8ICA5IC0tLS0t
LS0tLQo+Pj4gICAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9u
cygtKQo+Pgo+PiBSZXZpZXdlZC1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRp
LmNvbT4KPj4KPj4gV2hpY2ggdHJlZSBzaG91bGQgdGhpcyBiZSBhcHBsaWVkIHRvPwo+IAo+IEkn
ZCBsaWtlIHRvIGFkZCBpdCB0byB0aGUgZG1hLW1hcHBpbmcgdHJlZSBpZiBwb3NzaWJsZS4KClRo
YXQncyBvayBmb3IgbWUuCgogIFRvbWkKCi0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95
LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6
IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
