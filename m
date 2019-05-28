Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 821062C01F
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 09:32:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1875089BF5;
	Tue, 28 May 2019 07:32:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83FCB89BF5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 07:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 0CBF63FB45;
 Tue, 28 May 2019 09:32:11 +0200 (CEST)
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
 with ESMTP id 8BK2fU0uSpQF; Tue, 28 May 2019 09:31:58 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id EEC583FB3B;
 Tue, 28 May 2019 09:31:57 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 2207236006D;
 Tue, 28 May 2019 09:31:57 +0200 (CEST)
Subject: Re: [RFC PATCH] drm/ttm, drm/vmwgfx: Have TTM support AMD SEV
 encryption
To: thomas.lendacky@amd.com
References: <20190524081114.53661-1-thomas@shipmail.org>
 <f2c4ccdd-49c9-2188-3378-2f333a8f605f@amd.com>
 <d397836b-13a4-b6cd-e059-035203f2edc6@shipmail.org>
 <d59cb481-1360-25eb-a2da-1ae64c648daf@shipmail.org>
 <84fa57da-7bb7-8322-125a-89596fbb2145@amd.com>
 <33816cbd-ddfb-b47a-a305-2760f8568eff@shipmail.org>
 <79c8d26a-d2dd-3e2c-f0bc-cbfc47a67fee@amd.com>
 <deef176a-5467-5beb-7f1b-fcd7bd1deab7@shipmail.org>
 <CADnq5_O+L-aJ_WU4ZcBmLYOV3RqNouw_P-2wYfCoJwXxj6ny3g@mail.gmail.com>
From: Thomas Hellstrom <thomas@shipmail.org>
Message-ID: <52df61a9-028e-8ff6-0850-20ddddb11de3@shipmail.org>
Date: Tue, 28 May 2019 09:31:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CADnq5_O+L-aJ_WU4ZcBmLYOV3RqNouw_P-2wYfCoJwXxj6ny3g@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1559028717; bh=1ezrPgRdxCGLPG8ZenYHfEasGTDe91aiF1aUUt3zsm8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=VAFNluc4GYm7sPYwicAKVCVSkaOPMWXTbzVKkJDMFIDcdBIYEyJEbCvfF5PqpgFXw
 igiJuP8y9DKJAopbnVlc6zZqrYwcz3jno3pRcElYNB+3gxZIAHuqyqMd76Vh2X6jDD
 uacAqG2+4Q+nw4i/2K2a2WqDBCZYELadgf8m53u8=
X-Mailman-Original-Authentication-Results: pio-pvt-msa3.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=VAFNluc4; 
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFRvbSwKCkNvdWxkIHlvdSBzaGVkIHNvbWUgbGlnaHQgb24gdGhpcz8KClRoYW5rcywKVGhv
bWFzCgoKT24gNS8yNC8xOSA1OjA4IFBNLCBBbGV4IERldWNoZXIgd3JvdGU6Cj4gKyBUb20KPgo+
IEhlJ3MgYmVlbiBsb29raW5nIGludG8gU0VWIGFzIHdlbGwuCj4KPiBPbiBGcmksIE1heSAyNCwg
MjAxOSBhdCA4OjMwIEFNIFRob21hcyBIZWxsc3Ryb20gPHRob21hc0BzaGlwbWFpbC5vcmc+IHdy
b3RlOgo+PiBPbiA1LzI0LzE5IDI6MDMgUE0sIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOgo+Pj4g
QW0gMjQuMDUuMTkgdW0gMTI6Mzcgc2NocmllYiBUaG9tYXMgSGVsbHN0cm9tOgo+Pj4+IFtDQVVU
SU9OOiBFeHRlcm5hbCBFbWFpbF0KPj4+Pgo+Pj4+IE9uIDUvMjQvMTkgMTI6MTggUE0sIEtvZW5p
ZywgQ2hyaXN0aWFuIHdyb3RlOgo+Pj4+PiBBbSAyNC4wNS4xOSB1bSAxMTo1NSBzY2hyaWViIFRo
b21hcyBIZWxsc3Ryb206Cj4+Pj4+PiBbQ0FVVElPTjogRXh0ZXJuYWwgRW1haWxdCj4+Pj4+Pgo+
Pj4+Pj4gT24gNS8yNC8xOSAxMToxMSBBTSwgVGhvbWFzIEhlbGxzdHJvbSB3cm90ZToKPj4+Pj4+
PiBIaSwgQ2hyaXN0aWFuLAo+Pj4+Pj4+Cj4+Pj4+Pj4gT24gNS8yNC8xOSAxMDozNyBBTSwgS29l
bmlnLCBDaHJpc3RpYW4gd3JvdGU6Cj4+Pj4+Pj4+IEFtIDI0LjA1LjE5IHVtIDEwOjExIHNjaHJp
ZWIgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSk6Cj4+Pj4+Pj4+PiBbQ0FVVElPTjogRXh0ZXJu
YWwgRW1haWxdCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gRnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhl
bGxzdHJvbUB2bXdhcmUuY29tPgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFdpdGggU0VWIGVuY3J5cHRp
b24sIGFsbCBETUEgbWVtb3J5IG11c3QgYmUgbWFya2VkIGRlY3J5cHRlZAo+Pj4+Pj4+Pj4gKEFL
QSAic2hhcmVkIikgZm9yIGRldmljZXMgdG8gYmUgYWJsZSB0byByZWFkIGl0LiBJbiB0aGUgZnV0
dXJlIHdlCj4+Pj4+Pj4+PiBtaWdodAo+Pj4+Pj4+Pj4gd2FudCB0byBiZSBhYmxlIHRvIHN3aXRj
aCBub3JtYWwgKGVuY3J5cHRlZCkgbWVtb3J5IHRvIGRlY3J5cHRlZCBpbgo+Pj4+Pj4+Pj4gZXhh
Y3RseQo+Pj4+Pj4+Pj4gdGhlIHNhbWUgd2F5IGFzIHdlIGhhbmRsZSBjYWNoaW5nIHN0YXRlcywg
YW5kIHRoYXQgd291bGQgcmVxdWlyZQo+Pj4+Pj4+Pj4gYWRkaXRpb25hbAo+Pj4+Pj4+Pj4gbWVt
b3J5IHBvb2xzLiBCdXQgZm9yIG5vdywgcmVseSBvbiBtZW1vcnkgYWxsb2NhdGVkIHdpdGgKPj4+
Pj4+Pj4+IGRtYV9hbGxvY19jb2hlcmVudCgpIHdoaWNoIGlzIGFscmVhZHkgZGVjcnlwdGVkIHdp
dGggU0VWIGVuYWJsZWQuCj4+Pj4+Pj4+PiBTZXQgdXAKPj4+Pj4+Pj4+IHRoZSBwYWdlIHByb3Rl
Y3Rpb24gYWNjb3JkaW5nbHkuIERyaXZlcnMgbXVzdCBkZXRlY3QgU0VWIGVuYWJsZWQgYW5kCj4+
Pj4+Pj4+PiBzd2l0Y2gKPj4+Pj4+Pj4+IHRvIHRoZSBkbWEgcGFnZSBwb29sLgo+Pj4+Pj4+Pj4K
Pj4+Pj4+Pj4+IFRoaXMgcGF0Y2ggaGFzIG5vdCB5ZXQgYmVlbiB0ZXN0ZWQuIEFzIGEgZm9sbG93
LXVwLCB3ZSBtaWdodCB3YW50IHRvCj4+Pj4+Pj4+PiBjYWNoZSBkZWNyeXB0ZWQgcGFnZXMgaW4g
dGhlIGRtYSBwYWdlIHBvb2wgcmVnYXJkbGVzcyBvZiB0aGVpcgo+Pj4+Pj4+Pj4gY2FjaGluZwo+
Pj4+Pj4+Pj4gc3RhdGUuCj4+Pj4+Pj4+IFRoaXMgcGF0Y2ggaXMgdW5uZWNlc3NhcnksIFNFViBz
dXBwb3J0IGFscmVhZHkgd29ya3MgZmluZSB3aXRoIGF0Cj4+Pj4+Pj4+IGxlYXN0Cj4+Pj4+Pj4+
IGFtZGdwdSBhbmQgSSB3b3VsZCBleHBlY3QgdGhhdCBpdCBhbHNvIHdvcmtzIHdpdGggb3RoZXIg
ZHJpdmVycyBhcwo+Pj4+Pj4+PiB3ZWxsLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBBbHNvIHNlZSB0aGlz
IHBhdGNoOgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBjb21taXQgNjRlMWY4MzBlYTViMzUxNmE0MjU2ZWQx
YzUwNGEyNjVkN2YyYTY1Ywo+Pj4+Pj4+PiBBdXRob3I6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4KPj4+Pj4+Pj4gRGF0ZTogICBXZWQgTWFyIDEzIDEwOjExOjE5
IDIwMTkgKzAxMDAKPj4+Pj4+Pj4KPj4+Pj4+Pj4gICAgICAgICAgZHJtOiBmYWxsYmFjayB0byBk
bWFfYWxsb2NfY29oZXJlbnQgd2hlbiBtZW1vcnkgZW5jcnlwdGlvbiBpcwo+Pj4+Pj4+PiBhY3Rp
dmUKPj4+Pj4+Pj4KPj4+Pj4+Pj4gICAgICAgICAgV2UgY2FuJ3QganVzdCBtYXAgYW55IHJhbmRv
bWUgcGFnZSB3ZSBnZXQgd2hlbiBtZW1vcnkKPj4+Pj4+Pj4gZW5jcnlwdGlvbiBpcwo+Pj4+Pj4+
PiAgICAgICAgICBhY3RpdmUuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+ICAgICAgICAgIFNpZ25lZC1vZmYt
Ynk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPj4+Pj4+Pj4g
ICAgICAgICAgQWNrZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bT4KPj4+Pj4+Pj4gICAgICAgICAgTGluazogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9w
YXRjaC8xMDg1MDgzMy8KPj4+Pj4+Pj4KPj4+Pj4+Pj4gUmVnYXJkcywKPj4+Pj4+Pj4gQ2hyaXN0
aWFuLgo+Pj4+Pj4+IFllcywgSSBub3RpY2VkIHRoYXQuIEFsdGhvdWdoIEkgZmFpbCB0byBzZWUg
d2hlcmUgd2UgYXV0b21hZ2ljYWxseQo+Pj4+Pj4+IGNsZWFyIHRoZSBQVEUgZW5jcnlwdGVkIGJp
dCB3aGVuIG1hcHBpbmcgY29oZXJlbnQgbWVtb3J5PyBGb3IgdGhlCj4+Pj4+Pj4gbGluZWFyIGtl
cm5lbCBtYXAsIHRoYXQncyBkb25lIHdpdGhpbiBkbWFfYWxsb2NfY29oZXJlbnQoKSBidXQgZm9y
Cj4+Pj4+Pj4ga2VybmVsIHZtYXBzIGFuZCBhbmQgdXNlci1zcGFjZSBtYXBzPyBJcyB0aGF0IGRv
bmUgYXV0b21hdGljYWxseSBieQo+Pj4+Pj4+IHRoZSB4ODYgcGxhdGZvcm0gbGF5ZXI/Cj4+Pj4+
IFllcywgSSB0aGluayBzby4gSGF2ZW4ndCBsb29rZWQgdG8gY2xvc2VseSBhdCB0aGlzIGVpdGhl
ci4KPj4+PiBUaGlzIHNvdW5kcyBhIGJpdCBvZGQuIElmIHRoYXQgd2VyZSB0aGUgY2FzZSwgdGhl
IG5hdHVyYWwgcGxhY2Ugd291bGQgYmUKPj4+PiB0aGUgUEFUIHRyYWNraW5nIGNvZGUsIGJ1dCBp
dCBvbmx5IGhhbmRsZXMgY2FjaGluZyBmbGFncyBBRkFJQ1QuIE5vdAo+Pj4+IGVuY3J5cHRpb24g
ZmxhZ3MuCj4+Pj4KPj4+PiBCdXQgd2hlbiB5b3UgdGVzdGVkIEFNRCB3aXRoIFNFViwgd2FzIHRo
YXQgcnVubmluZyBhcyBoeXBlcnZpc29yIHJhdGhlcgo+Pj4+IHRoYW4gYSBndWVzdCwgb3IgZGlk
IHlvdSBydW4gYW4gU0VWIGd1ZXN0IHdpdGggUENJIHBhc3N0aHJvdWdoIHRvIHRoZQo+Pj4+IEFN
RCBkZXZpY2U/Cj4+PiBZZWFoLCB3ZWxsIHRoZSBwcm9ibGVtIGlzIHdlIG5ldmVyIHRlc3RlZCB0
aGlzIG91cnNlbGYgOikKPj4+Cj4+Pj4+Pj4gL1Rob21hcwo+Pj4+Pj4+Cj4+Pj4+PiBBbmQsIGFz
IGEgZm9sbG93IHVwIHF1ZXN0aW9uLCB3aHkgZG8gd2UgbmVlZCBkbWFfYWxsb2NfY29oZXJlbnQo
KSB3aGVuCj4+Pj4+PiB1c2luZyBTTUU/IEkgdGhvdWdodCB0aGUgaGFyZHdhcmUgcGVyZm9ybXMg
dGhlIGRlY3J5cHRpb24gd2hlbiBETUEtaW5nCj4+Pj4+PiB0byAvIGZyb20gYW4gZW5jcnlwdGVk
IHBhZ2Ugd2l0aCBTTUUsIGJ1dCBub3Qgd2l0aCBTRVY/Cj4+Pj4+IEkgdGhpbmsgdGhlIGlzc3Vl
IHdhcyB0aGF0IHRoZSBETUEgQVBJIHdvdWxkIHRyeSB0byB1c2UgYSBib3VuY2UgYnVmZmVyCj4+
Pj4+IGluIHRoaXMgY2FzZS4KPj4+PiBTRVYgZm9yY2VzIFNXSU9UTEIgYm91bmNpbmcgb24sIGJ1
dCBub3QgU01FLiBTbyBpdCBzaG91bGQgcHJvYmFibHkgYmUKPj4+PiBwb3NzaWJsZSB0byBhdm9p
ZCBkbWFfYWxsb2NfY29oZXJlbnQoKSBpbiB0aGUgU01FIGNhc2UuCj4+PiBJbiB0aGlzIGNhc2Ug
SSBkb24ndCBoYXZlIGFuIGV4cGxhbmF0aW9uIGZvciB0aGlzLgo+Pj4KPj4+IEZvciB0aGUgYmFj
a2dyb3VuZCB3aGF0IGhhcHBlbmVkIGlzIHRoYXQgd2UgZ290IHJlcG9ydHMgdGhhdCBTVkUvU01F
Cj4+PiBkb2Vzbid0IHdvcmsgd2l0aCBhbWRncHUuIFNvIHdlIHRvbGQgdGhlIHBlb3BsZSB0byB0
cnkgdXNpbmcgdGhlCj4+PiBkbWFfYWxsb2NfY29oZXJlbnQoKSBwYXRoIGFuZCB0aGF0IHdvcmtl
ZCBmaW5lLiBCZWNhdXNlIG9mIHRoaXMgd2UgY2FtZQo+Pj4gdXAgd2l0aCB0aGUgcGF0Y2ggSSBu
b3RlZCBlYXJsaWVyLgo+Pj4KPj4+IEkgY2FuIGNvbmZpcm0gdGhhdCBpdCBpbmRlZWQgd29ya3Mg
bm93IGZvciBhIGNvdXBsZSBvZiB1c2VycywgYnV0IHdlCj4+PiBzdGlsbCBkb24ndCBoYXZlIGEg
dGVzdCBzeXN0ZW0gZm9yIHRoaXMgaW4gb3VyIHRlYW0uCj4+Pgo+Pj4gQ2hyaXN0aWFuLgo+PiBP
SywgdW5kZXN0b29kLAo+Pgo+PiBCdXQgdW5sZXNzIHRoZXJlIGlzIHNvbWUgc3RyYW5nZSBtYWdp
YyBnb2luZyBvbiwgKHdoaWNoIHRoZXJlIG1pZ2h0IGJlCj4+IG9mIGNvdXJzZSksSSBkbyB0aGlu
ayB0aGUgcGF0Y2ggSSBzZW50IGlzIGNvcnJlY3QsIGFuZCB0aGUgcmVhc29uIHRoYXQKPj4gU0VW
IHdvcmtzIGlzIHRoYXQgdGhlIEFNRCBjYXJkIGlzIHVzZWQgYnkgdGhlIGh5cGVydmlzb3IgYW5k
IG5vdCB0aGUKPj4gZ3Vlc3QsIGFuZCBUVE0gaXMgYWN0dWFsbHkgaW5jb3JyZWN0bHkgY3JlYXRp
bmcgY29uZmxpY3RpbmcgbWFwcyBhbmQKPj4gdHJlYXRpbmcgdGhlIGNvaGVyZW50IG1lbW9yeSBh
cyBlbmNyeXB0ZWQuIEJ1dCBzaW5jZSB0aGUgbWVtb3J5IGlzIG9ubHkKPj4gYWNjZXNzZWQgdGhy
b3VnaCBlbmNyeXB0ZWQgUFRFcywgdGhlIGhhcmR3YXJlIGRvZXMgdGhlIHJpZ2h0IHRoaW5nLAo+
PiB1c2luZyB0aGUgaHlwZXJ2aXNvciBrZXkgZm9yIGRlY3J5cHRpb24uLi4uCj4+Cj4+IEJ1dCB0
aGF0J3Mgb25seSBhIGd1ZXNzLCBhbmQgdGhpcyBpcyBub3Qgc3VwZXItdXJnZW50LiBJIHdpbGwg
YmUgYWJsZSB0bwo+PiBmb2xsb3cgdXAgaWYgLyB3aGVuIHdlIGJyaW5nIHZtd2dmeCB1cCBmb3Ig
U0VWLgo+Pgo+PiAvVGhvbWFzCj4+Cj4+Pj4gL1Rob21hcwo+Pj4+Cj4+Pj4KPj4+Pj4gQ2hyaXN0
aWFuLgo+Pj4+Pgo+Pj4+Pj4gVGhhbmtzLCBUaG9tYXMKPj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4KPj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gZHJpLWRl
dmVsIG1haWxpbmcgbGlzdAo+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
