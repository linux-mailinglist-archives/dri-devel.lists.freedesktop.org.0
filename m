Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F202CD14
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 19:05:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E6389D87;
	Tue, 28 May 2019 17:05:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2A289A6D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 17:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 3B6713F898;
 Tue, 28 May 2019 19:05:33 +0200 (CEST)
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
 with ESMTP id jbgSKwxHSocN; Tue, 28 May 2019 19:05:26 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 4C52E3FA65;
 Tue, 28 May 2019 19:05:25 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 98C513604CE;
 Tue, 28 May 2019 19:05:25 +0200 (CEST)
Subject: Re: [RFC PATCH] drm/ttm, drm/vmwgfx: Have TTM support AMD SEV
 encryption
To: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>
References: <20190524081114.53661-1-thomas@shipmail.org>
 <f2c4ccdd-49c9-2188-3378-2f333a8f605f@amd.com>
 <d397836b-13a4-b6cd-e059-035203f2edc6@shipmail.org>
 <d59cb481-1360-25eb-a2da-1ae64c648daf@shipmail.org>
 <84fa57da-7bb7-8322-125a-89596fbb2145@amd.com>
 <33816cbd-ddfb-b47a-a305-2760f8568eff@shipmail.org>
 <79c8d26a-d2dd-3e2c-f0bc-cbfc47a67fee@amd.com>
 <deef176a-5467-5beb-7f1b-fcd7bd1deab7@shipmail.org>
 <CADnq5_O+L-aJ_WU4ZcBmLYOV3RqNouw_P-2wYfCoJwXxj6ny3g@mail.gmail.com>
 <52df61a9-028e-8ff6-0850-20ddddb11de3@shipmail.org>
 <5b1b3f22-beea-16c4-a98f-9e632b408020@amd.com>
 <6b9b8536-bfea-5817-06e4-23881b86ab31@shipmail.org>
 <cc1d736d-9a8f-03d0-26ab-60a686ad71bd@amd.com>
 <a1bdbae7-009a-85ad-beb1-f938995274db@amd.com>
 <6dac8c560f75cae65e81a0f6466cbfdb270575e8.camel@vmware.com>
 <4b22c4ed-1d66-0aff-51a2-7a1ddb411878@amd.com>
 <1325ba3d-55f6-8b3c-c4b0-b0cc7b1a9d29@amd.com>
From: Thomas Hellstrom <thomas@shipmail.org>
Message-ID: <9da98001-1636-768d-e477-b96611406944@shipmail.org>
Date: Tue, 28 May 2019 19:05:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1325ba3d-55f6-8b3c-c4b0-b0cc7b1a9d29@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1559063125; bh=Kf9usxcKUAbcwdgEqvtFd87l7VWbPKQ2pfQwcWDsCz8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=jAnK9VYSJddlgiwISQ2LEncOptyQCm5tPfY4c6ca+OM6QqE604KJB4xzGJed1SN22
 42U/oqL3hiJ3HcqJoptKqcmW/JUVjCrupNg9V6JeVJYnNRVfr3IpVSku4HPBXLwPl8
 RJM26kapI0URVsjEkq09o+dRFVzPjZK/uVzMcsRI=
X-Mailman-Original-Authentication-Results: ste-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=jAnK9VYS; 
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNS8yOC8xOSA3OjAwIFBNLCBMZW5kYWNreSwgVGhvbWFzIHdyb3RlOgo+IE9uIDUvMjgvMTkg
MTE6MzIgQU0sIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOgo+PiBBbSAyOC4wNS4xOSB1bSAxODoy
NyBzY2hyaWViIFRob21hcyBIZWxsc3Ryb206Cj4+PiBPbiBUdWUsIDIwMTktMDUtMjggYXQgMTU6
NTAgKzAwMDAsIExlbmRhY2t5LCBUaG9tYXMgd3JvdGU6Cj4+Pj4gT24gNS8yOC8xOSAxMDoxNyBB
TSwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6Cj4+Pj4+IEhpIFRob21hcywKPj4+Pj4KPj4+Pj4g
QW0gMjguMDUuMTkgdW0gMTc6MTEgc2NocmllYiBUaG9tYXMgSGVsbHN0cm9tOgo+Pj4+Pj4gSGks
IFRvbSwKPj4+Pj4+Cj4+Pj4+PiBUaGFua3MgZm9yIHRoZSByZXBseS4gVGhlIHF1ZXN0aW9uIGlz
IG5vdCBncmFwaGljcyBzcGVjaWZpYywgYnV0Cj4+Pj4+PiBsaWVzCj4+Pj4+PiBpbiB5b3VyIGFu
c3dlciBmdXJ0aGVyIGJlbG93Ogo+Pj4+Pj4KPj4+Pj4+IE9uIDUvMjgvMTkgNDo0OCBQTSwgTGVu
ZGFja3ksIFRob21hcyB3cm90ZToKPj4+Pj4+PiBPbiA1LzI4LzE5IDI6MzEgQU0sIFRob21hcyBI
ZWxsc3Ryb20gd3JvdGU6Cj4+Pj4+Pj4gW1NOSVBdCj4+Pj4+Pj4gQXMgZm9yIGtlcm5lbCB2bWFw
cyBhbmQgdXNlci1tYXBzLCB0aG9zZSBwYWdlcyB3aWxsIGJlIG1hcmtlZAo+Pj4+Pj4+IGVuY3J5
cHRlZAo+Pj4+Pj4+ICh1bmxlc3MgZXhwbGljaXRseSBtYWRlIHVuLWVuY3J5cHRlZCBieSBjYWxs
aW5nCj4+Pj4+Pj4gc2V0X21lbW9yeV9kZWNyeXB0ZWQoKSkuCj4+Pj4+Pj4gQnV0LCBpZiB5b3Ug
YXJlIGNvcHlpbmcgdG8vZnJvbSB0aG9zZSBhcmVhcyBpbnRvIHRoZSB1bi0KPj4+Pj4+PiBlbmNy
eXB0ZWQgRE1BCj4+Pj4+Pj4gYXJlYSB0aGVuIGV2ZXJ5dGhpbmcgd2lsbCBiZSBvay4KPj4+Pj4+
IFRoZSBxdWVzdGlvbiBpcyByZWdhcmRpbmcgdGhlIGFib3ZlIHBhcmFncmFwaC4KPj4+Pj4+Cj4+
Pj4+PiBBRkFJQ1QsICBzZXRfbWVtb3J5X2RlY3J5cHRlZCgpIG9ubHkgY2hhbmdlcyB0aGUgZml4
ZWQga2VybmVsIG1hcAo+Pj4+Pj4gUFRFcy4KPj4+Pj4+IEJ1dCB3aGVuIHNldHRpbmcgdXAgb3Ro
ZXIgYWxpYXNlZCBQVEVzIHRvIHRoZSBleGFjdCBzYW1lCj4+Pj4+PiBkZWNyeXB0ZWQKPj4+Pj4+
IHBhZ2VzLCBmb3IgZXhhbXBsZSB1c2luZyBkbWFfbW1hcF9jb2hlcmVudCgpLAo+Pj4+Pj4ga21h
cF9hdG9taWNfcHJvdCgpLAo+Pj4+Pj4gdm1hcCgpIGV0Yy4gV2hhdCBjb2RlIGlzIHJlc3BvbnNp
YmxlIGZvciBjbGVhcmluZyB0aGUgZW5jcnlwdGVkCj4+Pj4+PiBmbGFnCj4+Pj4+PiBvbiB0aG9z
ZSBQVEVzPyBJcyB0aGVyZSBzb21ldGhpbmcgaW4gdGhlIHg4NiBwbGF0Zm9ybSBjb2RlIGRvaW5n
Cj4+Pj4+PiB0aGF0Pwo+Pj4+PiBUb20gYWN0dWFsbHkgZXhwbGFpbmVkIHRoaXM6Cj4+Pj4+PiBU
aGUgZW5jcnlwdGlvbiBiaXQgaXMgYml0LTQ3IG9mIGEgcGh5c2ljYWwgYWRkcmVzcy4KPj4+Pj4g
SW4gb3RoZXIgd29yZHMgc2V0X21lbW9yeV9kZWNyeXB0ZWQoKSBjaGFuZ2VzIHRoZSBwaHlzaWNh
bCBhZGRyZXNzCj4+Pj4+IGluCj4+Pj4+IHRoZSBQVEVzIG9mIHRoZSBrZXJuZWwgbWFwcGluZyBh
bmQgYWxsIG90aGVyIHVzZSBjYXNlcyBqdXN0IGNvcHkKPj4+Pj4gdGhhdAo+Pj4+PiBmcm9tIHRo
ZXJlLgo+Pj4+IEV4Y2VwdCBJIGRvbid0IHRoaW5rIHRoZSBQVEUgYXR0cmlidXRlcyBhcmUgY29w
aWVkIGZyb20gdGhlIGtlcm5lbAo+Pj4+IG1hcHBpbmcKPj4+ICsxIQo+Pj4KPj4+PiBpbiBzb21l
IGNhc2VzLiBGb3IgZXhhbXBsZSwgZG1hX21tYXBfY29oZXJlbnQoKSB3aWxsIGNyZWF0ZSB0aGUg
c2FtZQo+Pj4+IHZtX3BhZ2VfcHJvdCB2YWx1ZSByZWdhcmRsZXNzIG9mIHdoZXRoZXIgb3Igbm90
IHRoZSB1bmRlcmx5aW5nIG1lbW9yeQo+Pj4+IGlzCj4+Pj4gZW5jcnlwdGVkIG9yIG5vdC4gQnV0
IGttYXBfYXRvbWljX3Byb3QoKSB3aWxsIHJldHVybiB0aGUga2VybmVsCj4+Pj4gdmlydHVhbAo+
Pj4+IGFkZHJlc3Mgb2YgdGhlIHBhZ2UsIHNvIHRoYXQgd291bGQgYmUgZmluZS4KPj4+IFllcywg
b24gNjQtYml0IHN5c3RlbXMuIE9uIDMyLWJpdCBzeXN0ZW1zIChkbyB0aGV5IGV4aXN0IHdpdGgg
U0VWPyksCj4+PiB0aGV5IGRvbid0Lgo+PiBJIGRvbid0IHRoaW5rIHNvLCBidXQgZmVlbCBmcmVl
IHRvIHByb3ZlIG1lIHdyb25nIFRvbS4KPiBTRVYgaXMgNjQtYml0IG9ubHkuCgpBbmQgSSBqdXN0
IG5vdGljZWQgdGhhdCBrbWFwX2F0b21pY19wcm90KCkgaW5kZWVkIHJldHVybnMgdGhlIGtlcm5l
bCBtYXAgCmFsc28gZm9yIDMyLWJpdCBsb3dtZW0uCgo+Cj4+PiBBbmQgc2ltaWxhcmx5IFRUTSB1
c2VyLXNwYWNlIG1hcHBpbmdzIGFuZCB2bWFwKCkgZG9lc24ndCBjb3B5IGZyb20gdGhlCj4+PiBr
ZXJuZWwgbWFwIGVpdGhlciwgIHNvIEkgdGhpbmsgd2UgYWN0dWFsbHkgZG8gbmVlZCB0byBtb2Rp
ZnkgdGhlIHBhZ2UtCj4+PiBwcm90IGxpa2UgZG9uZSBpbiB0aGUgcGF0Y2guCj4+IFdlbGwgdGhl
IHByb2JsZW0gaXMgdGhhdCB0aGlzIHdvbid0IGhhdmUgYW55IGVmZmVjdC4KPj4KPj4gQXMgVG9t
IGV4cGxhaW5lZCBlbmNyeXB0aW9uIGlzIG5vdCBpbXBsZW1lbnRlZCBhcyBhIHBhZ2UgcHJvdGVj
dGlvbiBiaXQsCj4+IGJ1dCByYXRoZXIgYXMgcGFydCBvZiB0aGUgcGh5c2ljYWwgYWRkcmVzcyBv
ZiB0aGUgcGFydC4KPiBUaGlzIGlzIHdoZXJlIHRoaW5ncyBnZXQgaW50ZXJlc3RpbmcuICBFdmVu
IHRob3VnaCB0aGUgZW5jcnlwdGlvbiBiaXQgaXMKPiBwYXJ0IG9mIHRoZSBwaHlzaWNhbCBhZGRy
ZXNzIChlLmcuIHVuZGVyIFNNRSB0aGUgZGV2aWNlIGNvdWxkL3dvdWxkIHVzZSBhbgo+IGFkZHJl
c3Mgd2l0aCB0aGUgZW5jcnlwdGlvbiBiaXQgc2V0KSwgaXQgaXMgaW1wbGVtZW50ZWQgYXMgcGFy
dCBvZiB0aGUgUFRFCj4gYXR0cmlidXRlcy4gU28sIGZvciBleGFtcGxlLCB1c2luZyBfUEFHRV9F
TkMgd2hlbiBidWlsZGluZyBhIHBncHJvdCB2YWx1ZQo+IHdvdWxkIHByb2R1Y2UgYW4gZW50cnkg
d2l0aCB0aGUgZW5jcnlwdGlvbiBiaXQgc2V0Lgo+Cj4gQW5kIHRoZSB0aGluZyB0byB3YXRjaCBv
dXQgZm9yIGlzIHVzaW5nIHR3byB2aXJ0dWFsIGFkZHJlc3NlcyB0aGF0IHBvaW50Cj4gdG8gdGhl
IHNhbWUgcGh5c2ljYWwgYWRkcmVzcyAocGFnZSkgaW4gRFJBTSBidXQgb25lIGhhcyB0aGUgZW5j
cnlwdGlvbiBiaXQKPiBzZXQgYW5kIG9uZSBkb2Vzbid0LiBUaGUgaGFyZHdhcmUgZG9lcyBub3Qg
ZW5mb3JjZSBjb2hlcmVuY3kgYmV0d2VlbiBhbgo+IGVuY3J5cHRlZCBhbmQgdW4tZW5jcnlwdGVk
IG1hcHBpbmcgb2YgdGhlIHNhbWUgcGh5c2ljYWwgYWRkcmVzcyAocGFnZSkuCj4gU2VlIHNlY3Rp
b24gNy4xMC42IG9mIHRoZSBBTUQ2NCBBcmNoaXRlY3R1cmUgUHJvZ3JhbW1lcidzIE1hbnVhbCBW
b2x1bWUgMi4KCkluZGVlZC4gQW5kIEknbSBwcmV0dHkgc3VyZSB0aGUga2VybmVsIG1hcCBQVEUg
YW5kIGEgVFRNIC8gdm1hcCBQVEUgCnBvaW50aW5nIHRvIHRoZSBzYW1lIGRlY3J5cHRlZCBwYWdl
IGRpZmZlciBpbiB0aGUgZW5jcnlwdGlvbiBiaXQgKDQ3KSAKc2V0dGluZy4KCkJ1dCBvbiB0aGUg
aHlwZXJ2aXNvciB0aGF0IHdvdWxkIHNvcnQgb2Ygd29yaywgYmVjYXVzZSBmcm9tIHdoYXQgSSAK
dW5kZXJzdGFuZCB3aXRoIFNFViB3ZSBzZWxlY3QgYmV0d2VlbiB0aGUgZ3Vlc3Qga2V5IGFuZCB0
aGUgaHlwZXJ2aXNvciAKa2V5IHdpdGggdGhhdCBiaXQuIE9uIHRoZSBoeXBlcnZpc29yIGJvdGgg
a2V5cyBhcmUgdGhlIHNhbWU/IE9uIGEgZ3Vlc3QgCml0IHdvdWxkIHByb2JhYmx5IGJyZWFrLgoK
L1Rob21hcwoKPgo+IFRoYW5rcywKPiBUb20KPgo+PiBJIGhhdmUgbm8gaWRlYSBob3cgdGhhdCBp
cyBhY3R1YWxseSBoYW5kbGVkIHRob3VnaHQsCj4+IENocmlzdGlhbi4KPj4KPj4+IC9UaG9tYXMK
Pj4+Cj4+Pj4gVGhpcyBpcyBhbiBhcmVhIHRoYXQgbmVlZHMgbG9va2luZyBpbnRvIHRvIGJlIHN1
cmUgaXQgaXMgd29ya2luZwo+Pj4+IHByb3Blcmx5Cj4+Pj4gd2l0aCBTTUUgYW5kIFNFVi4KPj4+
Pgo+Pj4+IFRoYW5rcywKPj4+PiBUb20KPj4+Pgo+Pj4+PiBUaGF0J3MgcmF0aGVyIG5pZnR5LCBi
ZWNhdXNlIHRoaXMgd2F5IGV2ZXJ5Ym9keSB3aWxsIGVpdGhlciB1c2Ugb3IKPj4+Pj4gbm90Cj4+
Pj4+IHVzZSBlbmNyeXB0aW9uIG9uIHRoZSBwYWdlLgo+Pj4+Pgo+Pj4+PiBDaHJpc3RpYW4uCj4+
Pj4+Cj4+Pj4+PiBUaGFua3MsCj4+Pj4+PiBUaG9tYXMKPj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4+IFRo
aW5ncyBnZXQgZnV6enkgZm9yIG1lIHdoZW4gaXQgY29tZXMgdG8gdGhlIEdQVSBhY2Nlc3Mgb2Yg
dGhlCj4+Pj4+Pj4gbWVtb3J5Cj4+Pj4+Pj4gYW5kIHdoYXQgYW5kIGhvdyBpdCBpcyBhY2Nlc3Nl
ZC4KPj4+Pj4+Pgo+Pj4+Pj4+IFRoYW5rcywKPj4+Pj4+PiBUb20KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
