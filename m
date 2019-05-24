Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F278295FA
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 12:38:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7BA6E0E6;
	Fri, 24 May 2019 10:38:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C1EA6E0E5
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 10:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 1E6B63F509;
 Fri, 24 May 2019 12:38:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.099
X-Spam-Level: 
X-Spam-Status: No, score=-3.099 tagged_above=-999 required=6.31
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RmVQpRF5Ed64; Fri, 24 May 2019 12:37:52 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 6290C3F24C;
 Fri, 24 May 2019 12:37:52 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id C812E3600B5;
 Fri, 24 May 2019 12:37:51 +0200 (CEST)
Subject: Re: [RFC PATCH] drm/ttm, drm/vmwgfx: Have TTM support AMD SEV
 encryption
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20190524081114.53661-1-thomas@shipmail.org>
 <f2c4ccdd-49c9-2188-3378-2f333a8f605f@amd.com>
 <d397836b-13a4-b6cd-e059-035203f2edc6@shipmail.org>
 <d59cb481-1360-25eb-a2da-1ae64c648daf@shipmail.org>
 <84fa57da-7bb7-8322-125a-89596fbb2145@amd.com>
From: Thomas Hellstrom <thomas@shipmail.org>
Message-ID: <33816cbd-ddfb-b47a-a305-2760f8568eff@shipmail.org>
Date: Fri, 24 May 2019 12:37:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <84fa57da-7bb7-8322-125a-89596fbb2145@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1558694271; bh=ePbiu2F4b31Cw+ibZO6+ZTXai7IzhQc2GVinApqFgko=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ikyqwF7ocj5EvMQA4WBTOC2IttAif5g12feokiL5vXdwSEUvPkAQMXceLJEeNp21E
 iEVrRczvGGvOyq9w3XVm6is58H7OL9yxfOY3Fu/mzZ0ZMyHzJBH9y0aCoCQ5rC+li8
 u76rjgnreIiCNsoMuCMXReWRSKRqc+co/5ddjcCo=
X-Mailman-Original-Authentication-Results: pio-pvt-msa3.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=ikyqwF7o; 
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

T24gNS8yNC8xOSAxMjoxOCBQTSwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6Cj4gQW0gMjQuMDUu
MTkgdW0gMTE6NTUgc2NocmllYiBUaG9tYXMgSGVsbHN0cm9tOgo+PiBbQ0FVVElPTjogRXh0ZXJu
YWwgRW1haWxdCj4+Cj4+IE9uIDUvMjQvMTkgMTE6MTEgQU0sIFRob21hcyBIZWxsc3Ryb20gd3Jv
dGU6Cj4+PiBIaSwgQ2hyaXN0aWFuLAo+Pj4KPj4+IE9uIDUvMjQvMTkgMTA6MzcgQU0sIEtvZW5p
ZywgQ2hyaXN0aWFuIHdyb3RlOgo+Pj4+IEFtIDI0LjA1LjE5IHVtIDEwOjExIHNjaHJpZWIgVGhv
bWFzIEhlbGxzdHLDtm0gKFZNd2FyZSk6Cj4+Pj4+IFtDQVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0K
Pj4+Pj4KPj4+Pj4gRnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29t
Pgo+Pj4+Pgo+Pj4+PiBXaXRoIFNFViBlbmNyeXB0aW9uLCBhbGwgRE1BIG1lbW9yeSBtdXN0IGJl
IG1hcmtlZCBkZWNyeXB0ZWQKPj4+Pj4gKEFLQSAic2hhcmVkIikgZm9yIGRldmljZXMgdG8gYmUg
YWJsZSB0byByZWFkIGl0LiBJbiB0aGUgZnV0dXJlIHdlCj4+Pj4+IG1pZ2h0Cj4+Pj4+IHdhbnQg
dG8gYmUgYWJsZSB0byBzd2l0Y2ggbm9ybWFsIChlbmNyeXB0ZWQpIG1lbW9yeSB0byBkZWNyeXB0
ZWQgaW4KPj4+Pj4gZXhhY3RseQo+Pj4+PiB0aGUgc2FtZSB3YXkgYXMgd2UgaGFuZGxlIGNhY2hp
bmcgc3RhdGVzLCBhbmQgdGhhdCB3b3VsZCByZXF1aXJlCj4+Pj4+IGFkZGl0aW9uYWwKPj4+Pj4g
bWVtb3J5IHBvb2xzLiBCdXQgZm9yIG5vdywgcmVseSBvbiBtZW1vcnkgYWxsb2NhdGVkIHdpdGgK
Pj4+Pj4gZG1hX2FsbG9jX2NvaGVyZW50KCkgd2hpY2ggaXMgYWxyZWFkeSBkZWNyeXB0ZWQgd2l0
aCBTRVYgZW5hYmxlZC4KPj4+Pj4gU2V0IHVwCj4+Pj4+IHRoZSBwYWdlIHByb3RlY3Rpb24gYWNj
b3JkaW5nbHkuIERyaXZlcnMgbXVzdCBkZXRlY3QgU0VWIGVuYWJsZWQgYW5kCj4+Pj4+IHN3aXRj
aAo+Pj4+PiB0byB0aGUgZG1hIHBhZ2UgcG9vbC4KPj4+Pj4KPj4+Pj4gVGhpcyBwYXRjaCBoYXMg
bm90IHlldCBiZWVuIHRlc3RlZC4gQXMgYSBmb2xsb3ctdXAsIHdlIG1pZ2h0IHdhbnQgdG8KPj4+
Pj4gY2FjaGUgZGVjcnlwdGVkIHBhZ2VzIGluIHRoZSBkbWEgcGFnZSBwb29sIHJlZ2FyZGxlc3Mg
b2YgdGhlaXIgY2FjaGluZwo+Pj4+PiBzdGF0ZS4KPj4+PiBUaGlzIHBhdGNoIGlzIHVubmVjZXNz
YXJ5LCBTRVYgc3VwcG9ydCBhbHJlYWR5IHdvcmtzIGZpbmUgd2l0aCBhdCBsZWFzdAo+Pj4+IGFt
ZGdwdSBhbmQgSSB3b3VsZCBleHBlY3QgdGhhdCBpdCBhbHNvIHdvcmtzIHdpdGggb3RoZXIgZHJp
dmVycyBhcwo+Pj4+IHdlbGwuCj4+Pj4KPj4+PiBBbHNvIHNlZSB0aGlzIHBhdGNoOgo+Pj4+Cj4+
Pj4gY29tbWl0IDY0ZTFmODMwZWE1YjM1MTZhNDI1NmVkMWM1MDRhMjY1ZDdmMmE2NWMKPj4+PiBB
dXRob3I6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPj4+PiBE
YXRlOsKgwqAgV2VkIE1hciAxMyAxMDoxMToxOSAyMDE5ICswMTAwCj4+Pj4KPj4+PiAgwqDCoMKg
wqDCoCBkcm06IGZhbGxiYWNrIHRvIGRtYV9hbGxvY19jb2hlcmVudCB3aGVuIG1lbW9yeSBlbmNy
eXB0aW9uIGlzCj4+Pj4gYWN0aXZlCj4+Pj4KPj4+PiAgwqDCoMKgwqDCoCBXZSBjYW4ndCBqdXN0
IG1hcCBhbnkgcmFuZG9tZSBwYWdlIHdlIGdldCB3aGVuIG1lbW9yeQo+Pj4+IGVuY3J5cHRpb24g
aXMKPj4+PiAgwqDCoMKgwqDCoCBhY3RpdmUuCj4+Pj4KPj4+PiAgwqDCoMKgwqDCoCBTaWduZWQt
b2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+Pj4g
IMKgwqDCoMKgwqAgQWNrZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KPj4+PiAgwqDCoMKgwqDCoCBMaW5rOiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3Jn
L3BhdGNoLzEwODUwODMzLwo+Pj4+Cj4+Pj4gUmVnYXJkcywKPj4+PiBDaHJpc3RpYW4uCj4+PiBZ
ZXMsIEkgbm90aWNlZCB0aGF0LiBBbHRob3VnaCBJIGZhaWwgdG8gc2VlIHdoZXJlIHdlIGF1dG9t
YWdpY2FsbHkKPj4+IGNsZWFyIHRoZSBQVEUgZW5jcnlwdGVkIGJpdCB3aGVuIG1hcHBpbmcgY29o
ZXJlbnQgbWVtb3J5PyBGb3IgdGhlCj4+PiBsaW5lYXIga2VybmVsIG1hcCwgdGhhdCdzIGRvbmUg
d2l0aGluIGRtYV9hbGxvY19jb2hlcmVudCgpIGJ1dCBmb3IKPj4+IGtlcm5lbCB2bWFwcyBhbmQg
YW5kIHVzZXItc3BhY2UgbWFwcz8gSXMgdGhhdCBkb25lIGF1dG9tYXRpY2FsbHkgYnkKPj4+IHRo
ZSB4ODYgcGxhdGZvcm0gbGF5ZXI/Cj4gWWVzLCBJIHRoaW5rIHNvLiBIYXZlbid0IGxvb2tlZCB0
byBjbG9zZWx5IGF0IHRoaXMgZWl0aGVyLgoKVGhpcyBzb3VuZHMgYSBiaXQgb2RkLiBJZiB0aGF0
IHdlcmUgdGhlIGNhc2UsIHRoZSBuYXR1cmFsIHBsYWNlIHdvdWxkIGJlIAp0aGUgUEFUIHRyYWNr
aW5nIGNvZGUsIGJ1dCBpdCBvbmx5IGhhbmRsZXMgY2FjaGluZyBmbGFncyBBRkFJQ1QuIE5vdCAK
ZW5jcnlwdGlvbiBmbGFncy4KCkJ1dCB3aGVuIHlvdSB0ZXN0ZWQgQU1EIHdpdGggU0VWLCB3YXMg
dGhhdCBydW5uaW5nIGFzIGh5cGVydmlzb3IgcmF0aGVyIAp0aGFuIGEgZ3Vlc3QsIG9yIGRpZCB5
b3UgcnVuIGFuIFNFViBndWVzdCB3aXRoIFBDSSBwYXNzdGhyb3VnaCB0byB0aGUgCkFNRCBkZXZp
Y2U/Cgo+Cj4+PiAvVGhvbWFzCj4+Pgo+PiBBbmQsIGFzIGEgZm9sbG93IHVwIHF1ZXN0aW9uLCB3
aHkgZG8gd2UgbmVlZCBkbWFfYWxsb2NfY29oZXJlbnQoKSB3aGVuCj4+IHVzaW5nIFNNRT8gSSB0
aG91Z2h0IHRoZSBoYXJkd2FyZSBwZXJmb3JtcyB0aGUgZGVjcnlwdGlvbiB3aGVuIERNQS1pbmcK
Pj4gdG8gLyBmcm9tIGFuIGVuY3J5cHRlZCBwYWdlIHdpdGggU01FLCBidXQgbm90IHdpdGggU0VW
Pwo+IEkgdGhpbmsgdGhlIGlzc3VlIHdhcyB0aGF0IHRoZSBETUEgQVBJIHdvdWxkIHRyeSB0byB1
c2UgYSBib3VuY2UgYnVmZmVyCj4gaW4gdGhpcyBjYXNlLgoKU0VWIGZvcmNlcyBTV0lPVExCIGJv
dW5jaW5nIG9uLCBidXQgbm90IFNNRS4gU28gaXQgc2hvdWxkIHByb2JhYmx5IGJlIApwb3NzaWJs
ZSB0byBhdm9pZCBkbWFfYWxsb2NfY29oZXJlbnQoKSBpbiB0aGUgU01FIGNhc2UuCgovVGhvbWFz
CgoKPgo+IENocmlzdGlhbi4KPgo+PiBUaGFua3MsIFRob21hcwo+Pgo+Pgo+PgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
