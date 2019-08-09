Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD89876D6
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 12:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E1D6ED62;
	Fri,  9 Aug 2019 10:00:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2493B6ED62
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 10:00:56 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x79A0fRI048307;
 Fri, 9 Aug 2019 05:00:41 -0500
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x79A0fBs067623
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 9 Aug 2019 05:00:41 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 9 Aug
 2019 05:00:41 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 9 Aug 2019 05:00:41 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x79A0dKm006580;
 Fri, 9 Aug 2019 05:00:39 -0500
Subject: Re: [PATCH for-5.3] drm/omap: ensure we have a valid dma_mask
To: Christoph Hellwig <hch@lst.de>
References: <20190808101042.18809-1-hch@lst.de>
 <7fff8fd3-16ae-1f42-fcd6-9aa360fe36b5@ti.com> <20190809080750.GA21874@lst.de>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <c219e7e6-0f66-d6fd-e0cf-59c803386825@ti.com>
Date: Fri, 9 Aug 2019 13:00:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809080750.GA21874@lst.de>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1565344841;
 bh=j7mV9yfiX1/T+LAXN7sKBAuBWQGSmBtE1m1dH8dWDMg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=QPLLSo/c7PIM3IuGLr4tUxL+fOeHcEbojhZeuCoDWET+gNyhZpH6nmpNZaHGQBVqj
 DNMViz9lSN0NsV7J62W8tS312+ItZBvVahpOkRRl20KnZxzYEJnTOHZ4Mqqr1H55pO
 F+wWLyu8c25UQA5TzPsQSgN4Dm2lBLMw9gis9LUQ=
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
Cc: airlied@linux.ie, "H. Nikolaus Schaller" <hns@goldelico.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDkvMDgvMjAxOSAxMTowNywgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gT24gRnJpLCBB
dWcgMDksIDIwMTkgYXQgMDk6NDA6MzJBTSArMDMwMCwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4+
IFdlIGRvIGNhbGwgZG1hX3NldF9jb2hlcmVudF9tYXNrKCkgaW4gb21hcGRybSdzIHByb2JlKCkg
KGluIG9tYXBfZHJ2LmMpLAo+PiBidXQgYXBwYXJlbnRseSB0aGF0J3Mgbm90IGVub3VnaCBhbnlt
b3JlLiBDaGFuZ2luZyB0aGF0IGNhbGwgdG8KPj4gZG1hX2NvZXJjZV9tYXNrX2FuZF9jb2hlcmVu
dCgpIHJlbW92ZXMgdGhlIFdBUk4uIEkgY2FuIGNyZWF0ZSBhIHBhdGNoIGZvcgo+PiB0aGF0LCBv
ciBDaHJpc3RvcGggY2FuIHJlc3BpbiB0aGlzIG9uZS4KPiAKPiBPaCwgeWVzIC0gdGhhdCBhY3R1
YWxseSBpcyB0aGUgcmlnaHQgdGhpbmcgdG8gZG8gaGVyZS4gIElmIHlvdSBhbHJlYWR5Cj4gaGF2
ZSBpdCBwbGVhc2UganVzdCBzZW5kIGl0IG91dC4KPiAKPj4KPj4gSSBhbSBub3QgdG9vIGZhbWls
aWFyIHdpdGggdGhlIGRtYSBtYXNrIGhhbmRsaW5nLCBzbyBtYXliZSBzb21lb25lIGNhbgo+PiBl
ZHVjYXRlOgo+Pgo+PiBkbWFfY29lcmNlX21hc2tfYW5kX2NvaGVyZW50KCkgb3ZlcndyaXRlcyBk
ZXYtPmRtYV9tYXNrLiBJc24ndCB0aGF0IGEgYmFkCj4+IHRoaW5nPyBXaGF0IGlmIHRoZSBwbGF0
Zm9ybSBoYXMgc2V0IGRldi0+ZG1hX21hc2ssIGFuZCB0aGUgZHJpdmVyCj4+IG92ZXJ3cml0ZXMg
aXQgd2l0aCBpdHMgdmFsdWU/IE9yIHdobyBpcyBzdXBwb3NlZCB0byBzZXQgZGV2LT5kbWFfbWFz
az8KPiAKPiAtPmRtYV9tYXNrIGlzIGEgY29tcGxldGUgbWVzcy4gIEl0IGlzIGEgcG9pbnRlciB3
aGVuIGl0IHJlYWxseSBzaG91bGQKPiBqdXN0IGJlIGEgdTY0LCBhbmQgdGhhdCBtZWFucyBldmVy
eSBkcml2ZXIgbGF5ZXIgaGFzIHRvIGFsbG9jYXRlIHNwYWNlCj4gZm9yIGl0LiAgV2UgZG9uJ3Qg
cmVhbGx5IGRvIHRoYXQgZm9yIHBsYXRmb3JtX2RldmljZXMsIGFzIHRoYXQgYnJlYWtzCj4gaG9y
cmlibHkgYXNzdW1wdGlvbnMgaW4gdGhlIHVzYiBjb2RlLiAgVGhhdCBpcyB3aHkKPiBkbWFfY29l
cmNlX21hc2tfYW5kX2NvaGVyZW50IGV4aXN0cyBhcyBhIG5hc3R5IHdvcmthcm91bmQgdGhhdCBz
ZXRzCj4gdGhlIGRtYV9tYXNrIHRvIHRoZSBjb2hlcmVudF9kbWFfbWFzayBmb3IgZGV2aWNlcyB0
aGF0IGRvbid0IGhhdmUKPiBzcGFjZSBmb3IgLT5kbWFfbWFzayBhbGxvY2F0ZWQsIHdoaWNoIHdv
cmtzIGFzIGxvbmcgYXMgdGhlIGRldmljZQo+IGRvZXNuJ3QgaGF2ZSBkaWZmZXJuZXQgYWRkcmVz
c2luZyByZXF1aXJlbWVudHMgZm9yIGJvdGguCj4gCj4gSSdtIGFjdHVhbGx5IHdvcmtpbmcgdG8g
Zml4IHRoYXQgbWVzcyB1cCBhdCB0aGUgbW9tZW50LCBidXQgaXQgaXMgZ29pbmcKPiB0byB0YWtl
IGEgZmV3IGN5Y2xlcyB1bnRpbCBldmVyeXRoaW5nIGZhbGxzIGludG8gcGxhY2UuCgpBbHJpZ2h0
LCB0aGFua3MgZm9yIHRoZSBjbGFyaWZpY2F0aW9uIQoKSGVyZSdzIG15IHZlcnNpb24uCgpGcm9t
IGMyNTgzMDllMzZmYzg2MDc2ZGIxNTVhZWFkMDNhMzkwMGI5NmMzZDQgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCkZyb206IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+CkRh
dGU6IEZyaSwgOSBBdWcgMjAxOSAwOTo1NDo0OSArMDMwMApTdWJqZWN0OiBbUEFUQ0hdIGRybS9v
bWFwOiBlbnN1cmUgd2UgaGF2ZSBhIHZhbGlkIGRtYV9tYXNrCgpUaGUgb21hcGRybSBkcml2ZXIg
dXNlcyBkbWFfc2V0X2NvaGVyZW50X21hc2soKSwgYnV0IHRoYXQncyBub3QgZW5vdWdoCmFueW1v
cmUgd2hlbiBMUEFFIGlzIGVuYWJsZWQuCgpGcm9tIENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0
LmRlPjoKClRoZSB0cmFkaXRpb25hbCBhcm0gRE1BIGNvZGUgaWdub3JlcywgYnV0IHRoZSBnZW5l
cmljIGRtYS1kaXJlY3Qvc3dpb3RsYgpoYXMgc3RyaWN0ZXIgY2hlY2tzIGFuZCB0aHVzIGZhaWxz
IG1hcHBpbmdzIHdpdGhvdXQgYSBETUEgbWFzay4gIEFzIHdlCnVzZSBzd2lvdGxiIGZvciBhcm0g
d2l0aCBMUEFFIG5vdywgb21hcGRybSBuZWVkcyB0byBjYXRjaCB1cCBhbmQKYWN0dWFsbHkgc2V0
IGEgRE1BIG1hc2suCgpDaGFuZ2UgdGhlIGRtYV9zZXRfY29oZXJlbnRfbWFzaygpIGNhbGwgdG8K
ZG1hX2NvZXJjZV9tYXNrX2FuZF9jb2hlcmVudCgpIHNvIHRoYXQgdGhlIGRldi0+ZG1hX21hc2sg
aXMgYWxzbyBzZXQuCgpGaXhlczogYWQzYzdiMThjNWIzICgiYXJtOiB1c2Ugc3dpb3RsYiBmb3Ig
Ym91bmNlIGJ1ZmZlcmluZyBvbiBMUEFFIGNvbmZpZ3MiKQpSZXBvcnRlZC1ieTogIkguIE5pa29s
YXVzIFNjaGFsbGVyIiA8aG5zQGdvbGRlbGljby5jb20+ClNpZ25lZC1vZmYtYnk6IFRvbWkgVmFs
a2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL29tYXBkcm0vb21hcF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZHJ2
LmMKaW5kZXggMjg4YzU5ZGFlNTZhLi4xYmFkMGEyY2M1YzYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9vbWFwZHJtL29tYXBfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0v
b21hcF9kcnYuYwpAQCAtNjY5LDcgKzY2OSw3IEBAIHN0YXRpYyBpbnQgcGRldl9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCWlmIChvbWFwZHNzX2lzX2luaXRpYWxpemVkKCkg
PT0gZmFsc2UpCiAJCXJldHVybiAtRVBST0JFX0RFRkVSOwogCi0JcmV0ID0gZG1hX3NldF9jb2hl
cmVudF9tYXNrKCZwZGV2LT5kZXYsIERNQV9CSVRfTUFTSygzMikpOworCXJldCA9IGRtYV9jb2Vy
Y2VfbWFza19hbmRfY29oZXJlbnQoJnBkZXYtPmRldiwgRE1BX0JJVF9NQVNLKDMyKSk7CiAJaWYg
KHJldCkgewogCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJGYWlsZWQgdG8gc2V0IHRoZSBETUEgbWFz
a1xuIik7CiAJCXJldHVybiByZXQ7CgoKCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBP
eSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElE
OiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
