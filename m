Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD8F3209BD
	for <lists+dri-devel@lfdr.de>; Sun, 21 Feb 2021 12:15:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A1A6E3D3;
	Sun, 21 Feb 2021 11:15:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CDA26E3D3
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Feb 2021 11:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q/EsuBx2rpbF4bTNqafbctKSjGqSih9PCFZcmYvOH/Y=; b=JXgiS5WmDnJkDp9xgNRqCRk3Nh
 70/dl7sfXsyq2ockxkR7//xjYkK59E9kace1M1wqdyiEwVD1VAajGj/xtled7xIW+dfCjj7Lijws3
 nXnw0dETs/DSObvBFE0nXUEeqGeOW1JaekITwbMTU48uYISZs3A5PDVnlQKidlC6N4hizkEV7ydvu
 fKLTzRI3bQ1V43bGDUgYcyngBi/F8wf6IdrFnEkvcN/FuH2SgsRD6Fple99vK6CFc1dvx+ySalnhW
 iknbqefCLrpIXSukpGaG3r+2ityISNl+Z46S3x+MzOiC14LDkcPutLpMyOXlsWkWcWXdpMF/LxZE3
 1aJEDSPg==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:49463
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1lDmhV-00050B-Qw; Sun, 21 Feb 2021 12:14:57 +0100
Subject: Re: [PATCH v4 0/3] Generic USB Display driver
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
To: Lubomir Rintel <lkundrak@v3.sk>
References: <20210120170033.38468-1-noralf@tronnes.org>
 <20210124183838.GA1873250@demiurge.local>
 <70a91ae8-15eb-e8d8-1ed9-923b09106bfa@tronnes.org>
Message-ID: <1c182bf1-41d7-49e7-f15e-e8d9ad6386a2@tronnes.org>
Date: Sun, 21 Feb 2021 12:14:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <70a91ae8-15eb-e8d8-1ed9-923b09106bfa@tronnes.org>
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
Cc: hudson@trmm.net, markus@raatikainen.cc, peter@stuge.se,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org, th020394@gmail.com,
 pontus.fuchs@gmail.com, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMjQuMDEuMjAyMSAyMS41MSwgc2tyZXYgTm9yYWxmIFRyw7hubmVzOgo+IAo+IAo+IERl
biAyNC4wMS4yMDIxIDE5LjM4LCBza3JldiBMdWJvbWlyIFJpbnRlbDoKPj4gT24gV2VkLCBKYW4g
MjAsIDIwMjEgYXQgMDY6MDA6MzBQTSArMDEwMCwgTm9yYWxmIFRyw7hubmVzIHdyb3RlOgo+Pj4g
SGksCj4+Pgo+Pj4gQSB3aGlsZSBiYWNrIEkgaGFkIHRoZSBpZGVhIHRvIHR1cm4gYSBSYXNwYmVy
cnkgUGkgWmVybyBpbnRvIGEgJDUKPj4+IFVTQiB0byBIRE1JL1NEVFYvRFNJL0RQSSBkaXNwbGF5
IGFkYXB0ZXIuCj4+Pgo+Pj4gVGhlIHJlYXNvbiBmb3IgY2FsbGluZyBpdCAnR2VuZXJpYycgaXMg
c28gYW55b25lIGNhbiBtYWtlIGEgVVNCCj4+PiBkaXNwbGF5L2FkYXB0ZXIgYWdhaW5zdCB0aGlz
IGRyaXZlciwgYWxsIHRoYXQncyBuZWVkZWQgaXMgdG8gYWRkIGEgVVNCCj4+PiB2aWQ6cGlkLgo+
Pj4KPj4+IFVuZm9ydHVuYXRlbHkgSSd2ZSBoYWQgc29tZSBjb21wb3VuZGluZyBoZWFsdGggcHJv
YmxlbXMgdGhhdCBoYXZlCj4+PiBzZXZlcmFsbHkgbGltaXRlZCB0aGUgdGltZSBJIGNhbiBzcGVu
ZCBpbiBmcm9udCBvZiBhIGNvbXB1dGVyLiBGb3IgdGhpcwo+Pj4gcmVhc29uIEkndmUgZGVjaWRl
ZCB0byBrZWVwIHRoZSBnYWRnZXQgZHJpdmVyIG91dC1vZi10cmVlIGFuZCBmb2N1cyBvbgo+Pj4g
Z2V0dGluZyB0aGUgaG9zdCBkcml2ZXIgbWVyZ2VkIGZpcnN0Lgo+Pj4KPj4+IFNlZSB0aGUgd2lr
aVsxXSBmb3IgbW9yZSBpbmZvcm1hdGlvbiBhbmQgaW1hZ2VzIGZvciB0aGUgUmFzcGJlcnJ5IFBp
Cj4+PiBaZXJvLzQuCj4+Pgo+Pj4gT25lIGJpZyBjaGFuZ2UgdGhpcyB0aW1lIGlzIHRoYXQgSSd2
ZSBmb2xsb3dlZCBQZXRlciBTdHVnZSdzIGFkdmljZSB0bwo+Pj4gbm90IGxldCBEUk0gc3R1ZmYg
bGVhayBpbnRvIHRoZSBVU0IgcHJvdG9jb2wuIFRoaXMgaGFzIG1hZGUgdGhlIHByb3RvY29sCj4+
PiBlYXNpZXIgdG8gdW5kZXJzdGFuZCBqdXN0IGZyb20gcmVhZGluZyB0aGUgaGVhZGVyIGZpbGUu
Cj4+Pgo+Pj4gTm9yYWxmLgo+Pj4KPj4+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vbm90cm8vZ3Vk
L3dpa2kKPj4KPj4gVGhlIHBhdGNoIHNldDoKPj4KPj4gVGVzdGVkLWJ5OiBMdWJvbWlyIFJpbnRl
bCA8bGt1bmRyYWtAdjMuc2s+Cj4+Cj4+IFdvcmtzIGxpa2UgYSBjaGFybSB3aXRoIHRoaXMgYm9h
cmQgWzFdLCB0aG91Z2ggaXQgZGlkbid0IGltcHJlc3MgdGhlIGdpcmxzCj4+IGFzIG11Y2ggYXMg
SSBob3BlZC4gQ29kZSBoZXJlIFsyXSwgcGljdHVyZSBoZXJlIFszXS4KPj4KPiAKPiBJIGhhdmUg
d29uZGVyZWQgd2hhdCBjb2xvciBkaXNwbGF5IHJlc29sdXRpb24gaXQgaXMgcG9zc2libGUgdG8g
ZHJpdmUKPiBvdmVyIFVTQiBmdWxsIHNwZWVkLiBJIGNhbiB1bmRlcnN0YW5kIHRoYXQgeW91ciBQ
b0Mgd2Fzbid0IHRoYXQKPiBpbXByZXNzaXZlIHNpbmNlIGl0IGRvZXNuJ3QgdXNlIERNQSB0byBk
cml2ZSB0aGUgU1BJIGJ1cy4KPiAKCkkgaGF2ZSBub3cgZG9uZSBhIFJhc3BiZXJyeSBQaSBQaWNv
IGltcGxlbWVudGF0aW9uIGFuZCBkcml2aW5nIFNQSSB1c2luZwpETUEgd2FzIGp1c3QgbWFyZ2lu
YWxseSBmYXN0ZXIgdGhhbiBsZXR0aW5nIHRoZSBDUFUgZmlsbCB0aGUgRklGTy4gTWF5YmUKSSBz
aG91bGRuJ3QgYmUgc28gc3VwcmlzZWQgc2luY2UgdGhlIENQVSBoYXMgbm90aGluZyBlbHNlIHRv
IGRvLCBidXQKZXZlbiBzbyBJIGRpZG4ndCBleHBlY3QgdGhpcy4gQnV0IHRoZW4gYWdhaW4gSSBo
YXZlIHZlcnkgbGl0dGxlCmV4cGVyaWVuY2Ugd2l0aCBtaWNyb2NvbnRyb2xsZXJzLgoKSSBoYXZl
IHRoZSBzYW1lIHNpemUgZGlzcGxheVsxXSBhcyB5b3UgMjQweDEzNSBhbmQgbXkgZGlzcGxheSB3
YXMgcXVpdGUKc25hcHB5ICh1c2luZyBYIHdpbmRvd3MhKSwgSSBldmVuIGFkZGVkIGx6NCBkZWNv
bXByZXNzaW9uIHN1cHBvcnQuIEkKaGF2ZW4ndCBkb25lIG11Y2ggdGVzdGluZyBzbyBJIGNhbid0
IHNheSBob3cgbXVjaCB0aGUgYWN0dWFsIGltcHJvdmVtZW50CmlzIHdpdGggdGhlIGNvbXByZXNz
aW9uLiBUaGUgVVNCIGRvdWJsZSBidWZmZXJpbmcgSSB3YXMgaG9waW5nIGZvcgpkaWRuJ3QgcGFu
IG91dCwgdGhlIGJ1bGsgZW5kcG9pbnQgY2FuIG9ubHkgZG8gNjQgYnl0ZSBwYWNrZXN0IChJU08g
aXMKNTEyKSwgc28gSSBlbmRlZCB1cCBzdG9yaW5nIHRoZSBwYWNrZXRzIGFuZCB0aGVuIHB1c2gg
dGhlIGZyYW1lIGluIGl0cwplbnRpcmV0eSB0byB0aGUgZGlzcGxheS4gVGhlIFBpY28gaGFzIDI2
NGtCIG9mIHJhbSBzbyBJIGNhbiBhZmZvcmQgdG8KaGF2ZSBhIGZyYW1lYnVmZmVyIGFuZCBhIGRl
Y29tcHJlc3Npb24gYnVmZmVyIGZvciB0aGlzIHRpbnkgZGlzcGxheS4gTXkKdGFyZ2V0IGRpc3Bs
YXkgaXMgMzIweDI0MCBhbmQgdGhhdCBtZWFucyBJIGNhbid0IHVzZSAyIGJ1ZmZlcnMsIHNvIG5v
dApzdXJlIGhvdyB0aGF0IGdvZXMuCgpbMV0gaHR0cHM6Ly9zaG9wLnBpbW9yb25pLmNvbS9wcm9k
dWN0cy9waWNvLWRpc3BsYXktcGFjawoKTm9yYWxmLgoKPiBUaGUgbmV3ICQ0IFJhc3BiZXJyeSBQ
aSBQaWNvIHRoYXQgY2FtZSBvdXQgdGhpcyB3ZWVrIGxvb2tzIGludGVyZXN0aW5nCj4gYXMgYSBV
U0IgaW50ZXJmYWNlIGJvYXJkIGZvciB0aW55IHBhbmVscy4gSXQgY2FuIGRyaXZlIERQSSBwYW5l
bHMKPiBkaXJlY3RseSwgaGFzIDIgY29yZXMgQDEzM01IeiwgMjY0SyBTUkFNIGFuZCBVU0IgZnVs
bCBzcGVlZC4gTWF5YmUgbHo0Cj4gZGVjb21wcmVzc2lvbiBpcyBldmVuIHBvc3NpYmxlLiBBbm90
aGVyIGdvb2QgdGhpbmcgaXMgdGhhdCB0aGUgYm9hcmQKPiB3aWxsIGJlIGFyb3VuZCBmb3IgYSBs
b25nIHRpbWUuCj4gCj4gVGhhbmtzIGZvciB0ZXN0aW5nLCBJIGhhdmUgbGltaXRlZCBiYW5kd2l0
aCB0aGVzZSBkYXlzIHNvIEkgY291bGRuJ3QgZG8KPiBhIHRlc3Qgb24gYW4gTUNVIG15c2VsZi4K
PiAKPiBOb3JhbGYuCj4gCj4+IFsxXSBodHRwczovL3d3dy5iYW5nZ29vZC5jb20vTElMWUdPLVRU
R08tVC1EaXNwbGF5LUdEMzItUklTQy1WLTMyLWJpdC1Db3JlLU1pbmltYWwtRGV2ZWxvcG1lbnQt
Qm9hcmQtMV8xNC1JUFMtcC0xNjUyODcwLmh0bWw/cm1tZHM9c2VhcmNoJmN1cl93YXJlaG91c2U9
Q04KPj4gWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9oYWNrZXJzcGFjZS9saWJvcGVuY20zLWdmMzJ2
LWV4YW1wbGVzL2NvbW1pdC83ZWY1MWIzMWI5Cj4+IFszXSBodHRwczovL3Blb3BsZS5mcmVlZGVz
a3RvcC5vcmcvfmxrdW5kcmFrL2xpbHlnby5qcGVnCj4+Cj4+IEhhZCB0byBhcHBseSBhIGZpeCBm
b3IgdGhlIGRybV9jb25uZWN0b3JfZW51bV9saXN0W10gb21taXNzaW9uIEkgbWVudGlvbmVkCj4+
IGVsc2V3aGVyZSwgYW5kIHRoYXQgSSd2ZSBub3cgbm90aWNlZCB5b3UndmUgbm90ZWQgcHJldmlv
dXNseS4KPj4KPj4gVGFrZSBjYXJlCj4+IEx1Ym8KPj4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
