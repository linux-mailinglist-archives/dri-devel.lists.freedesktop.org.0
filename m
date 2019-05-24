Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB8D29530
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 11:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D504E6E0AA;
	Fri, 24 May 2019 09:55:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D5A6E0AA
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 09:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 7F22A3F5EC;
 Fri, 24 May 2019 11:55:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.099
X-Spam-Level: 
X-Spam-Status: No, score=-3.099 tagged_above=-999 required=6.31
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a5msFnSqf5EP; Fri, 24 May 2019 11:55:31 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 8ECF23F3E2;
 Fri, 24 May 2019 11:55:31 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 1A9543600B5;
 Fri, 24 May 2019 11:55:31 +0200 (CEST)
Subject: Re: [RFC PATCH] drm/ttm, drm/vmwgfx: Have TTM support AMD SEV
 encryption
From: Thomas Hellstrom <thomas@shipmail.org>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20190524081114.53661-1-thomas@shipmail.org>
 <f2c4ccdd-49c9-2188-3378-2f333a8f605f@amd.com>
 <d397836b-13a4-b6cd-e059-035203f2edc6@shipmail.org>
Message-ID: <d59cb481-1360-25eb-a2da-1ae64c648daf@shipmail.org>
Date: Fri, 24 May 2019 11:55:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d397836b-13a4-b6cd-e059-035203f2edc6@shipmail.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1558691731; bh=gykMcaU2CQSchF2kbY5VB1n1Z0+akv3hy2/ysA5dfh0=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=S/psPpyA5y/x0YiEDTK5xYJGTWeqRoSTdvNn/Gitxj38RPjMnEAYtJI2yDPs+7xPq
 PJJYgAOsjkjBxK/OPo84SJruiqpzZnWJC5DcrWa+xWxGE4i1BGkgy93kJI+fq238q7
 VOKo7OL7Ir0B+jryzTgF9TTiPkDaGBRPCJe/EMkg=
X-Mailman-Original-Authentication-Results: ste-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=S/psPpyA; 
 dkim-atps=neutral
X-Mailman-Original-Authentication-Results: ste-ftg-msa2.bahnhof.se
 (amavisd-new); 
 dkim=pass (1024-bit key) header.d=shipmail.org
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNS8yNC8xOSAxMToxMSBBTSwgVGhvbWFzIEhlbGxzdHJvbSB3cm90ZToKPiBIaSwgQ2hyaXN0
aWFuLAo+Cj4gT24gNS8yNC8xOSAxMDozNyBBTSwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6Cj4+
IEFtIDI0LjA1LjE5IHVtIDEwOjExIHNjaHJpZWIgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSk6
Cj4+PiBbQ0FVVElPTjogRXh0ZXJuYWwgRW1haWxdCj4+Pgo+Pj4gRnJvbTogVGhvbWFzIEhlbGxz
dHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgo+Pj4KPj4+IFdpdGggU0VWIGVuY3J5cHRpb24s
IGFsbCBETUEgbWVtb3J5IG11c3QgYmUgbWFya2VkIGRlY3J5cHRlZAo+Pj4gKEFLQSAic2hhcmVk
IikgZm9yIGRldmljZXMgdG8gYmUgYWJsZSB0byByZWFkIGl0LiBJbiB0aGUgZnV0dXJlIHdlIAo+
Pj4gbWlnaHQKPj4+IHdhbnQgdG8gYmUgYWJsZSB0byBzd2l0Y2ggbm9ybWFsIChlbmNyeXB0ZWQp
IG1lbW9yeSB0byBkZWNyeXB0ZWQgaW4gCj4+PiBleGFjdGx5Cj4+PiB0aGUgc2FtZSB3YXkgYXMg
d2UgaGFuZGxlIGNhY2hpbmcgc3RhdGVzLCBhbmQgdGhhdCB3b3VsZCByZXF1aXJlIAo+Pj4gYWRk
aXRpb25hbAo+Pj4gbWVtb3J5IHBvb2xzLiBCdXQgZm9yIG5vdywgcmVseSBvbiBtZW1vcnkgYWxs
b2NhdGVkIHdpdGgKPj4+IGRtYV9hbGxvY19jb2hlcmVudCgpIHdoaWNoIGlzIGFscmVhZHkgZGVj
cnlwdGVkIHdpdGggU0VWIGVuYWJsZWQuIAo+Pj4gU2V0IHVwCj4+PiB0aGUgcGFnZSBwcm90ZWN0
aW9uIGFjY29yZGluZ2x5LiBEcml2ZXJzIG11c3QgZGV0ZWN0IFNFViBlbmFibGVkIGFuZCAKPj4+
IHN3aXRjaAo+Pj4gdG8gdGhlIGRtYSBwYWdlIHBvb2wuCj4+Pgo+Pj4gVGhpcyBwYXRjaCBoYXMg
bm90IHlldCBiZWVuIHRlc3RlZC4gQXMgYSBmb2xsb3ctdXAsIHdlIG1pZ2h0IHdhbnQgdG8KPj4+
IGNhY2hlIGRlY3J5cHRlZCBwYWdlcyBpbiB0aGUgZG1hIHBhZ2UgcG9vbCByZWdhcmRsZXNzIG9m
IHRoZWlyIGNhY2hpbmcKPj4+IHN0YXRlLgo+PiBUaGlzIHBhdGNoIGlzIHVubmVjZXNzYXJ5LCBT
RVYgc3VwcG9ydCBhbHJlYWR5IHdvcmtzIGZpbmUgd2l0aCBhdCBsZWFzdAo+PiBhbWRncHUgYW5k
IEkgd291bGQgZXhwZWN0IHRoYXQgaXQgYWxzbyB3b3JrcyB3aXRoIG90aGVyIGRyaXZlcnMgYXMg
d2VsbC4KPj4KPj4gQWxzbyBzZWUgdGhpcyBwYXRjaDoKPj4KPj4gY29tbWl0IDY0ZTFmODMwZWE1
YjM1MTZhNDI1NmVkMWM1MDRhMjY1ZDdmMmE2NWMKPj4gQXV0aG9yOiBDaHJpc3RpYW4gS8O2bmln
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+IERhdGU6wqDCoCBXZWQgTWFyIDEzIDEwOjEx
OjE5IDIwMTkgKzAxMDAKPj4KPj4gwqAgwqDCoMKgIGRybTogZmFsbGJhY2sgdG8gZG1hX2FsbG9j
X2NvaGVyZW50IHdoZW4gbWVtb3J5IGVuY3J5cHRpb24gaXMgCj4+IGFjdGl2ZQo+Pgo+PiDCoCDC
oMKgwqAgV2UgY2FuJ3QganVzdCBtYXAgYW55IHJhbmRvbWUgcGFnZSB3ZSBnZXQgd2hlbiBtZW1v
cnkgCj4+IGVuY3J5cHRpb24gaXMKPj4gwqAgwqDCoMKgIGFjdGl2ZS4KPj4KPj4gwqAgwqDCoMKg
IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KPj4gwqAgwqDCoMKgIEFja2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+Cj4+IMKgIMKgwqDCoCBMaW5rOiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3Jn
L3BhdGNoLzEwODUwODMzLwo+Pgo+PiBSZWdhcmRzLAo+PiBDaHJpc3RpYW4uCj4KPiBZZXMsIEkg
bm90aWNlZCB0aGF0LiBBbHRob3VnaCBJIGZhaWwgdG8gc2VlIHdoZXJlIHdlIGF1dG9tYWdpY2Fs
bHkgCj4gY2xlYXIgdGhlIFBURSBlbmNyeXB0ZWQgYml0IHdoZW4gbWFwcGluZyBjb2hlcmVudCBt
ZW1vcnk/IEZvciB0aGUgCj4gbGluZWFyIGtlcm5lbCBtYXAsIHRoYXQncyBkb25lIHdpdGhpbiBk
bWFfYWxsb2NfY29oZXJlbnQoKSBidXQgZm9yIAo+IGtlcm5lbCB2bWFwcyBhbmQgYW5kIHVzZXIt
c3BhY2UgbWFwcz8gSXMgdGhhdCBkb25lIGF1dG9tYXRpY2FsbHkgYnkgCj4gdGhlIHg4NiBwbGF0
Zm9ybSBsYXllcj8KPgo+IC9UaG9tYXMKPgpBbmQsIGFzIGEgZm9sbG93IHVwIHF1ZXN0aW9uLCB3
aHkgZG8gd2UgbmVlZCBkbWFfYWxsb2NfY29oZXJlbnQoKSB3aGVuIAp1c2luZyBTTUU/IEkgdGhv
dWdodCB0aGUgaGFyZHdhcmUgcGVyZm9ybXMgdGhlIGRlY3J5cHRpb24gd2hlbiBETUEtaW5nIAp0
byAvIGZyb20gYW4gZW5jcnlwdGVkIHBhZ2Ugd2l0aCBTTUUsIGJ1dCBub3Qgd2l0aCBTRVY/CgpU
aGFua3MsIFRob21hcwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
