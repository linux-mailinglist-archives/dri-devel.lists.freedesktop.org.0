Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFB829811
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 14:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B786E106;
	Fri, 24 May 2019 12:30:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3344E6E106
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 12:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 722063F6B9;
 Fri, 24 May 2019 14:30:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.099
X-Spam-Level: 
X-Spam-Status: No, score=-3.099 tagged_above=-999 required=6.31
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UY7NyhwUCYtG; Fri, 24 May 2019 14:30:08 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id CFF2C3F5A0;
 Fri, 24 May 2019 14:30:07 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 4BFB93600B5;
 Fri, 24 May 2019 14:30:07 +0200 (CEST)
Subject: Re: [RFC PATCH] drm/ttm, drm/vmwgfx: Have TTM support AMD SEV
 encryption
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20190524081114.53661-1-thomas@shipmail.org>
 <f2c4ccdd-49c9-2188-3378-2f333a8f605f@amd.com>
 <d397836b-13a4-b6cd-e059-035203f2edc6@shipmail.org>
 <d59cb481-1360-25eb-a2da-1ae64c648daf@shipmail.org>
 <84fa57da-7bb7-8322-125a-89596fbb2145@amd.com>
 <33816cbd-ddfb-b47a-a305-2760f8568eff@shipmail.org>
 <79c8d26a-d2dd-3e2c-f0bc-cbfc47a67fee@amd.com>
From: Thomas Hellstrom <thomas@shipmail.org>
Message-ID: <deef176a-5467-5beb-7f1b-fcd7bd1deab7@shipmail.org>
Date: Fri, 24 May 2019 14:30:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <79c8d26a-d2dd-3e2c-f0bc-cbfc47a67fee@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1558701007; bh=CDc2Kv8RE8qPfS5hm5x9gfMzQ4W1pof9XIU7fORn/Mw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=gJgyFSQjRc7M81AZZ4RHwGH1fwNUbO8h7VRNzantpoRz81nrpNq4GFtheVLb/xwwf
 NDGvJk4hmIV18f8r5WB6az6tLUGJCainYqw6A8veGQDf4Bmh9BAf+uCPcX1mNoECPa
 I5/WWXXFH5aZ8wjzaeTPRHEj+2dwvORRX7oSFI3A=
X-Mailman-Original-Authentication-Results: pio-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=gJgyFSQj; 
 dkim-atps=neutral
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

T24gNS8yNC8xOSAyOjAzIFBNLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToKPiBBbSAyNC4wNS4x
OSB1bSAxMjozNyBzY2hyaWViIFRob21hcyBIZWxsc3Ryb206Cj4+IFtDQVVUSU9OOiBFeHRlcm5h
bCBFbWFpbF0KPj4KPj4gT24gNS8yNC8xOSAxMjoxOCBQTSwgS29lbmlnLCBDaHJpc3RpYW4gd3Jv
dGU6Cj4+PiBBbSAyNC4wNS4xOSB1bSAxMTo1NSBzY2hyaWViIFRob21hcyBIZWxsc3Ryb206Cj4+
Pj4gW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQo+Pj4+Cj4+Pj4gT24gNS8yNC8xOSAxMToxMSBB
TSwgVGhvbWFzIEhlbGxzdHJvbSB3cm90ZToKPj4+Pj4gSGksIENocmlzdGlhbiwKPj4+Pj4KPj4+
Pj4gT24gNS8yNC8xOSAxMDozNyBBTSwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6Cj4+Pj4+PiBB
bSAyNC4wNS4xOSB1bSAxMDoxMSBzY2hyaWViIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUpOgo+
Pj4+Pj4+IFtDQVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0KPj4+Pj4+Pgo+Pj4+Pj4+IEZyb206IFRo
b21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KPj4+Pj4+Pgo+Pj4+Pj4+IFdp
dGggU0VWIGVuY3J5cHRpb24sIGFsbCBETUEgbWVtb3J5IG11c3QgYmUgbWFya2VkIGRlY3J5cHRl
ZAo+Pj4+Pj4+IChBS0EgInNoYXJlZCIpIGZvciBkZXZpY2VzIHRvIGJlIGFibGUgdG8gcmVhZCBp
dC4gSW4gdGhlIGZ1dHVyZSB3ZQo+Pj4+Pj4+IG1pZ2h0Cj4+Pj4+Pj4gd2FudCB0byBiZSBhYmxl
IHRvIHN3aXRjaCBub3JtYWwgKGVuY3J5cHRlZCkgbWVtb3J5IHRvIGRlY3J5cHRlZCBpbgo+Pj4+
Pj4+IGV4YWN0bHkKPj4+Pj4+PiB0aGUgc2FtZSB3YXkgYXMgd2UgaGFuZGxlIGNhY2hpbmcgc3Rh
dGVzLCBhbmQgdGhhdCB3b3VsZCByZXF1aXJlCj4+Pj4+Pj4gYWRkaXRpb25hbAo+Pj4+Pj4+IG1l
bW9yeSBwb29scy4gQnV0IGZvciBub3csIHJlbHkgb24gbWVtb3J5IGFsbG9jYXRlZCB3aXRoCj4+
Pj4+Pj4gZG1hX2FsbG9jX2NvaGVyZW50KCkgd2hpY2ggaXMgYWxyZWFkeSBkZWNyeXB0ZWQgd2l0
aCBTRVYgZW5hYmxlZC4KPj4+Pj4+PiBTZXQgdXAKPj4+Pj4+PiB0aGUgcGFnZSBwcm90ZWN0aW9u
IGFjY29yZGluZ2x5LiBEcml2ZXJzIG11c3QgZGV0ZWN0IFNFViBlbmFibGVkIGFuZAo+Pj4+Pj4+
IHN3aXRjaAo+Pj4+Pj4+IHRvIHRoZSBkbWEgcGFnZSBwb29sLgo+Pj4+Pj4+Cj4+Pj4+Pj4gVGhp
cyBwYXRjaCBoYXMgbm90IHlldCBiZWVuIHRlc3RlZC4gQXMgYSBmb2xsb3ctdXAsIHdlIG1pZ2h0
IHdhbnQgdG8KPj4+Pj4+PiBjYWNoZSBkZWNyeXB0ZWQgcGFnZXMgaW4gdGhlIGRtYSBwYWdlIHBv
b2wgcmVnYXJkbGVzcyBvZiB0aGVpcgo+Pj4+Pj4+IGNhY2hpbmcKPj4+Pj4+PiBzdGF0ZS4KPj4+
Pj4+IFRoaXMgcGF0Y2ggaXMgdW5uZWNlc3NhcnksIFNFViBzdXBwb3J0IGFscmVhZHkgd29ya3Mg
ZmluZSB3aXRoIGF0Cj4+Pj4+PiBsZWFzdAo+Pj4+Pj4gYW1kZ3B1IGFuZCBJIHdvdWxkIGV4cGVj
dCB0aGF0IGl0IGFsc28gd29ya3Mgd2l0aCBvdGhlciBkcml2ZXJzIGFzCj4+Pj4+PiB3ZWxsLgo+
Pj4+Pj4KPj4+Pj4+IEFsc28gc2VlIHRoaXMgcGF0Y2g6Cj4+Pj4+Pgo+Pj4+Pj4gY29tbWl0IDY0
ZTFmODMwZWE1YjM1MTZhNDI1NmVkMWM1MDRhMjY1ZDdmMmE2NWMKPj4+Pj4+IEF1dGhvcjogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+Pj4+Pj4gRGF0ZTrCoMKg
IFdlZCBNYXIgMTMgMTA6MTE6MTkgMjAxOSArMDEwMAo+Pj4+Pj4KPj4+Pj4+ICDCoMKgwqDCoMKg
wqAgZHJtOiBmYWxsYmFjayB0byBkbWFfYWxsb2NfY29oZXJlbnQgd2hlbiBtZW1vcnkgZW5jcnlw
dGlvbiBpcwo+Pj4+Pj4gYWN0aXZlCj4+Pj4+Pgo+Pj4+Pj4gIMKgwqDCoMKgwqDCoCBXZSBjYW4n
dCBqdXN0IG1hcCBhbnkgcmFuZG9tZSBwYWdlIHdlIGdldCB3aGVuIG1lbW9yeQo+Pj4+Pj4gZW5j
cnlwdGlvbiBpcwo+Pj4+Pj4gIMKgwqDCoMKgwqDCoCBhY3RpdmUuCj4+Pj4+Pgo+Pj4+Pj4gIMKg
wqDCoMKgwqDCoCBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+Cj4+Pj4+PiAgwqDCoMKgwqDCoMKgIEFja2VkLWJ5OiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4+Pj4+PiAgwqDCoMKgwqDCoMKgIExpbms6IGh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTA4NTA4MzMvCj4+Pj4+Pgo+Pj4+Pj4g
UmVnYXJkcywKPj4+Pj4+IENocmlzdGlhbi4KPj4+Pj4gWWVzLCBJIG5vdGljZWQgdGhhdC4gQWx0
aG91Z2ggSSBmYWlsIHRvIHNlZSB3aGVyZSB3ZSBhdXRvbWFnaWNhbGx5Cj4+Pj4+IGNsZWFyIHRo
ZSBQVEUgZW5jcnlwdGVkIGJpdCB3aGVuIG1hcHBpbmcgY29oZXJlbnQgbWVtb3J5PyBGb3IgdGhl
Cj4+Pj4+IGxpbmVhciBrZXJuZWwgbWFwLCB0aGF0J3MgZG9uZSB3aXRoaW4gZG1hX2FsbG9jX2Nv
aGVyZW50KCkgYnV0IGZvcgo+Pj4+PiBrZXJuZWwgdm1hcHMgYW5kIGFuZCB1c2VyLXNwYWNlIG1h
cHM/IElzIHRoYXQgZG9uZSBhdXRvbWF0aWNhbGx5IGJ5Cj4+Pj4+IHRoZSB4ODYgcGxhdGZvcm0g
bGF5ZXI/Cj4+PiBZZXMsIEkgdGhpbmsgc28uIEhhdmVuJ3QgbG9va2VkIHRvIGNsb3NlbHkgYXQg
dGhpcyBlaXRoZXIuCj4+IFRoaXMgc291bmRzIGEgYml0IG9kZC4gSWYgdGhhdCB3ZXJlIHRoZSBj
YXNlLCB0aGUgbmF0dXJhbCBwbGFjZSB3b3VsZCBiZQo+PiB0aGUgUEFUIHRyYWNraW5nIGNvZGUs
IGJ1dCBpdCBvbmx5IGhhbmRsZXMgY2FjaGluZyBmbGFncyBBRkFJQ1QuIE5vdAo+PiBlbmNyeXB0
aW9uIGZsYWdzLgo+Pgo+PiBCdXQgd2hlbiB5b3UgdGVzdGVkIEFNRCB3aXRoIFNFViwgd2FzIHRo
YXQgcnVubmluZyBhcyBoeXBlcnZpc29yIHJhdGhlcgo+PiB0aGFuIGEgZ3Vlc3QsIG9yIGRpZCB5
b3UgcnVuIGFuIFNFViBndWVzdCB3aXRoIFBDSSBwYXNzdGhyb3VnaCB0byB0aGUKPj4gQU1EIGRl
dmljZT8KPiBZZWFoLCB3ZWxsIHRoZSBwcm9ibGVtIGlzIHdlIG5ldmVyIHRlc3RlZCB0aGlzIG91
cnNlbGYgOikKPgo+Pj4+PiAvVGhvbWFzCj4+Pj4+Cj4+Pj4gQW5kLCBhcyBhIGZvbGxvdyB1cCBx
dWVzdGlvbiwgd2h5IGRvIHdlIG5lZWQgZG1hX2FsbG9jX2NvaGVyZW50KCkgd2hlbgo+Pj4+IHVz
aW5nIFNNRT8gSSB0aG91Z2h0IHRoZSBoYXJkd2FyZSBwZXJmb3JtcyB0aGUgZGVjcnlwdGlvbiB3
aGVuIERNQS1pbmcKPj4+PiB0byAvIGZyb20gYW4gZW5jcnlwdGVkIHBhZ2Ugd2l0aCBTTUUsIGJ1
dCBub3Qgd2l0aCBTRVY/Cj4+PiBJIHRoaW5rIHRoZSBpc3N1ZSB3YXMgdGhhdCB0aGUgRE1BIEFQ
SSB3b3VsZCB0cnkgdG8gdXNlIGEgYm91bmNlIGJ1ZmZlcgo+Pj4gaW4gdGhpcyBjYXNlLgo+PiBT
RVYgZm9yY2VzIFNXSU9UTEIgYm91bmNpbmcgb24sIGJ1dCBub3QgU01FLiBTbyBpdCBzaG91bGQg
cHJvYmFibHkgYmUKPj4gcG9zc2libGUgdG8gYXZvaWQgZG1hX2FsbG9jX2NvaGVyZW50KCkgaW4g
dGhlIFNNRSBjYXNlLgo+IEluIHRoaXMgY2FzZSBJIGRvbid0IGhhdmUgYW4gZXhwbGFuYXRpb24g
Zm9yIHRoaXMuCj4KPiBGb3IgdGhlIGJhY2tncm91bmQgd2hhdCBoYXBwZW5lZCBpcyB0aGF0IHdl
IGdvdCByZXBvcnRzIHRoYXQgU1ZFL1NNRQo+IGRvZXNuJ3Qgd29yayB3aXRoIGFtZGdwdS4gU28g
d2UgdG9sZCB0aGUgcGVvcGxlIHRvIHRyeSB1c2luZyB0aGUKPiBkbWFfYWxsb2NfY29oZXJlbnQo
KSBwYXRoIGFuZCB0aGF0IHdvcmtlZCBmaW5lLiBCZWNhdXNlIG9mIHRoaXMgd2UgY2FtZQo+IHVw
IHdpdGggdGhlIHBhdGNoIEkgbm90ZWQgZWFybGllci4KPgo+IEkgY2FuIGNvbmZpcm0gdGhhdCBp
dCBpbmRlZWQgd29ya3Mgbm93IGZvciBhIGNvdXBsZSBvZiB1c2VycywgYnV0IHdlCj4gc3RpbGwg
ZG9uJ3QgaGF2ZSBhIHRlc3Qgc3lzdGVtIGZvciB0aGlzIGluIG91ciB0ZWFtLgo+Cj4gQ2hyaXN0
aWFuLgoKT0ssIHVuZGVzdG9vZCwKCkJ1dCB1bmxlc3MgdGhlcmUgaXMgc29tZSBzdHJhbmdlIG1h
Z2ljIGdvaW5nIG9uLCAod2hpY2ggdGhlcmUgbWlnaHQgYmUgCm9mIGNvdXJzZSksSSBkbyB0aGlu
ayB0aGUgcGF0Y2ggSSBzZW50IGlzIGNvcnJlY3QsIGFuZCB0aGUgcmVhc29uIHRoYXQgClNFViB3
b3JrcyBpcyB0aGF0IHRoZSBBTUQgY2FyZCBpcyB1c2VkIGJ5IHRoZSBoeXBlcnZpc29yIGFuZCBu
b3QgdGhlIApndWVzdCwgYW5kIFRUTSBpcyBhY3R1YWxseSBpbmNvcnJlY3RseSBjcmVhdGluZyBj
b25mbGljdGluZyBtYXBzIGFuZCAKdHJlYXRpbmcgdGhlIGNvaGVyZW50IG1lbW9yeSBhcyBlbmNy
eXB0ZWQuIEJ1dCBzaW5jZSB0aGUgbWVtb3J5IGlzIG9ubHkgCmFjY2Vzc2VkIHRocm91Z2ggZW5j
cnlwdGVkIFBURXMsIHRoZSBoYXJkd2FyZSBkb2VzIHRoZSByaWdodCB0aGluZywgCnVzaW5nIHRo
ZSBoeXBlcnZpc29yIGtleSBmb3IgZGVjcnlwdGlvbi4uLi4KCkJ1dCB0aGF0J3Mgb25seSBhIGd1
ZXNzLCBhbmQgdGhpcyBpcyBub3Qgc3VwZXItdXJnZW50LiBJIHdpbGwgYmUgYWJsZSB0byAKZm9s
bG93IHVwIGlmIC8gd2hlbiB3ZSBicmluZyB2bXdnZnggdXAgZm9yIFNFVi4KCi9UaG9tYXMKCj4+
IC9UaG9tYXMKPj4KPj4KPj4+IENocmlzdGlhbi4KPj4+Cj4+Pj4gVGhhbmtzLCBUaG9tYXMKPj4+
Pgo+Pj4+Cj4+Pj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
