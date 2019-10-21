Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56435DE5FA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 10:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2CF89BB2;
	Mon, 21 Oct 2019 08:10:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C43438969E;
 Mon, 21 Oct 2019 08:10:56 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9L8A59c048440;
 Mon, 21 Oct 2019 03:10:05 -0500
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9L89o9v035306
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 21 Oct 2019 03:09:50 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 21
 Oct 2019 03:09:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 21 Oct 2019 03:09:49 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9L89huO078101;
 Mon, 21 Oct 2019 03:09:44 -0500
Subject: Re: [PULL] drm-misc-next
To: Sean Paul <sean@poorly.run>
References: <20191017192601.GA215957@art_vandelay>
 <febda9e7-d62b-128c-819a-71c57d9c001d@ti.com>
 <CAMavQKKBUk+tXYE3Z4Q7mh+tRqQEZ+vsJaLYEhT95=e3i31AdQ@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <6dd06a02-b28f-d6a9-da23-f1eb0ce70fca@ti.com>
Date: Mon, 21 Oct 2019 11:09:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMavQKKBUk+tXYE3Z4Q7mh+tRqQEZ+vsJaLYEhT95=e3i31AdQ@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1571645405;
 bh=Nnq4Y4sN4pJyRLQuPyD3s8NogNWdpzEe817yEpovwc8=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=W4UfXC7tnlJf3yh89ebH2XSrtDFvMFVvy77G+K8KrfEFAtCWiM8guSQblPKNRRYGs
 /I0etDbtpzjjg+7dMLLjNcweZDUfUIqIlPgYSaj0ZS07Htd6/sZfOFYibam0V6m15y
 Qdk3LtBMpFcjWryHi8pFd7rA7uq/qixCnu7cJLHo=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, "DRM maintainer tools
 announcements, discussion, and development" <dim-tools@lists.freedesktop.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Steven Price <steven.price@arm.com>, Robert Chiras <robert.chiras@nxp.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Lowry Li <Lowry.Li@arm.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ezequiel Garcia <ezequiel@collabora.com>, Wen He <wen.he_1@nxp.com>,
 Oleg Vasilev <omrigann@gmail.com>, Qiang Yu <yuq825@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAxOC8xMC8yMDE5IDIzOjExLCBTZWFuIFBhdWwgd3JvdGU6Cj4gT24gRnJpLCBPY3Qg
MTgsIDIwMTkgYXQgOTo0NiBBTSBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29t
PiB3cm90ZToKPj4KPj4gSGkgU2VhbiwKPj4KPj4gT24gMTcvMTAvMjAxOSAyMjoyNiwgU2VhbiBQ
YXVsIHdyb3RlOgo+Pgo+Pj4gY29uY2VybiBmb3IgdGhvc2UuIFRoZSBvbWFwIE9NQVBfQk9fTUVN
XyogY2hhbmdlcyB0aG91Z2ggSSBkb24ndCB0aGluayBoYXZlCj4+PiByZWFsbHkgcmVhY2hlZCBu
b24tVEkgZXllcy4gVGhlcmUncyBubyBsaW5rIGluIHRoZSBjb21taXQgbWVzc2FnZSB0byBhIFVB
UEkKPj4+IGltcGxlbWVudGF0aW9uIGFuZCB0aGUgb25seSByZWZlcmVuY2UgSSBjb3VsZCBmaW5k
IGlzIGxpYmttc3h4IHdoaWNoIGNhbiBzZXQKPj4+IHRoZW0gdGhyb3VnaCB0aGUgcHl0aG9uIGJp
bmRpbmdzLiBTaW5jZSB0aGlzIGlzIFRJLXNwZWNpZmljIGd1bmsgaW4gVEktc3BlY2lmaWMKPj4+
IGhlYWRlcnMgSSdtIGluY2xpbmVkIHRvIGxldCBpdCBwYXNzLCBidXQgSSB3b3VsZCBoYXZlIGxp
a2VkIHRvIGhhdmUgdGhpcwo+Pj4gY29udmVyc2F0aW9uIHVwZnJvbnQuIEkgZmlndXJlZCBJJ2Qg
Y2FsbCB0aGlzIG91dCBzbyB5b3UgaGF2ZSBmaW5hbCBzYXkuCj4+Cj4+IFRoZXJlIHdhcyBzb21l
IGRpc2N1c3Npb24gYWJvdXQgdGhhdCBhIGZldyB5ZWFycyBiYWNrIHdoZW4gSSBpbml0aWFsbHkK
Pj4gc2VudCB0aGUgcGF0Y2hlcywgYnV0IG5vdyB0aGF0IEkgbG9vaywgdGhlIGRpc2N1c3Npb24g
ZGllZCBiZWZvcmUgcmVhbGx5Cj4+IGV2ZW4gc3RhcnRpbmcuCj4+Cj4+IFRoaXMgaXMgd2hhdCBJ
IHNhaWQgYWJvdXQgdXNlcnNwYWNlIGltcGxlbWVudGF0aW9uOgo+Pgo+Pj4gWWVzLCB1bmZvcnR1
bmF0ZWx5IHRoYXQgaXMgbm90IGdvaW5nIHRvIGhhcHBlbi4gSSBkb24ndCBzZWUgaG93IHRoaXMK
Pj4+IGNvdWxkIGJlIHVzZWQgaW4gYSBnZW5lcmljIHN5c3RlbSBsaWtlIFdlc3RvbiBvciBYLiBJ
dCdzIG1lYW50IGZvciB2ZXJ5Cj4+PiBzcGVjaWZpYyB1c2UgY2FzZXMsIHdoZXJlIHlvdSBrbm93
IGV4YWN0bHkgdGhlIHJlcXVpcmVtZW50cyBvZiB5b3VyCj4+PiBhcHBsaWNhdGlvbiBhbmQgdGhl
IGNhcGFiaWxpdGllcyBvZiB0aGUgd2hvbGUgc3lzdGVtLCBhbmQgb3B0aW1pemUgYmFzZWQKPj4+
IG9uIHRoYXQuCj4gCj4gVGhhbmtzIGZvciB0aGUgY29udGV4dCwgVG9taS4KPiAKPiBJbmRlZWQg
aXQgbG9va3MgbGlrZSB0aGUgZGlzY3Vzc2lvbiBkaWVkLCBidXQgTGF1cmVudCBzdGlsbCBicm91
Z2h0IHVwCj4gdGhlIHUvcyByZXF1aXJlbWVudCBhbmQgdGhlIHBhdGNoIHdhcyBlZmZlY3RpdmVs
eSBkZWFkIHVudGlsIERhbmllbCBvcgo+IERhdmUgd2VpZ2hlZCBpbi4gSSdkIGV4cGVjdCBhdCBs
ZWFzdCBzb21lIG91dHJlYWNoIGJlZm9yZSBwdXNoaW5nIHRoZQo+IHBhdGNoIGRpcmVjdGx5IDIr
IHllYXJzIGxhdGVyLiBIYXMgYW55dGhpbmcgY2hhbmdlZCBzaW5jZSB0aGVuPwoKVGhlcmUgd2Vy
ZSBuZXcgcmV2aWV3IHJvdW5kcyBmb3IgdGhlIHNlcmllcyB0aGlzIHN1bW1lciAmIGF1dHVtbiwg
YnV0IApubywgbm90aGluZyBlbHNlLiBJIGhhdmVuJ3Qgc3BlY2lmaWNhbGx5IHBpbmdlZCBhbnlv
bmUgYWJvdXQgdGhlIFVBUEkgCmNoYW5nZXMuCgpUaGlzIHNlcmllcyBpbnRyb2R1Y2VzIHRocmVl
IG5ldyBmbGFncyB0byBhbiBhbHJlYWR5IGV4aXN0aW5nIFVBUEksIGFuZCwgCmZvciB3aGF0ZXZl
ciByZWFzb24sIHRoaXMgZGlkbid0IHJlZ2lzdGVyIHRvIG1lIGFzIGEgbmV3IFVBUEksIGV2ZW4g
aWYgCkxhdXJlbnQgYXNrZWQgYWJvdXQgaXQgc29tZSB5ZWFycyBiYWNrLgoKU28sIG15IG1pc3Rh
a2UuCgpUaGUgZmxhZ3MgYXJlIGFkZGVkIGluIGEgc2luZ2xlIHBhdGNoLCBzbyBJIGNhbiBlYXNp
bHkgcHVzaCBhIHJldmVydCBmb3IgCnRoYXQgaWYgdGhpcyBwYXRjaCBpcyBub3QgYWNjZXB0YWJs
ZS4gVGhlIHJlc3Qgb2YgdGhlIHNlcmllcyBpcyBjbGVhbnVwLgoKPj4gSSBrbm93IHRoaXMgZmVh
dHVyZSBpcyB1c2VkIGJ5IGN1c3RvbWVycywgYnV0IEkgZG9uJ3QgaGF2ZSBhY2Nlc3MgdG8KPj4g
dGhlaXIgYXBwbGljYXRpb25zLgo+IAo+IFVuZm9ydHVuYXRlbHksIGFuZCBhcyB5b3Uga25vdywg
dGhhdCBpcyBpbnN1ZmZpY2llbnQvaXJyZWxldmFudCBmb3IKPiBpbnRyb2R1Y2luZyBuZXcgVUFQ
SS4gU28gdGhlIHF1ZXN0aW9uIGlzIGlmIHRoZSBsaWJrbXN4eCBiaW5kaW5ncwo+IGNvbnN0aXR1
dGUgb3BlbnNvdXJjZSB1c2Vyc3BhY2UsIGl0J3MgcmVhbGx5IHRoaW4gSU1PLgoKT2suIFdlbGws
IEkga25vdyBhbmQgdW5kZXJzdGFuZCB0aGUgZ2VuZXJhbCBydWxlIGhlcmUuIEJ1dCBwZXJoYXBz
IEkgCmhhdmVuJ3QgdGFrZW4gaXQgYXMgc3RyaWN0bHkgYXMgbmVlZGVkLgoKSSBoYXZlIHRvIHNh
eSBJIGRvbid0IHF1aXRlIHVuZGVyc3RhbmQgd2h5IHRoaXMgcnVsZSB3b3VsZCBiZSBhbHdheXMg
CnN0cmljdGx5IGhlbGQsIHRob3VnaC4KClRoZXNlIGZsYWdzLCBmb3IgZXhhbXBsZSwgd2hhdCBz
aG91bGQgd2UgZG8gd2l0aCB0aGVtPwotIFRoZXkgcHJvdmlkZSBhIHByb3ZlbiwgcmVhbCB1c2Ut
Y2FzZSBiZW5lZml0LgotIFRoZXkgYXJlIHNwZWNpZmljIHRvIFNvQ3Mgd2l0aCBPTUFQIERTUyBh
bmQgRE1NIElQcy4KLSBUaGV5IGFyZSByZWxhdGl2ZWx5IHNpbXBsZS4KLSBBbGwgdGhlIGRldGFp
bHMsIGluY2x1ZGluZyB0aGUgZGV0YWlscyBhYm91dCB0aGUgSFcsIGFyZSBwdWJsaWMuCi0gVXNp
bmcgdGhlbSBtYWtlcyBzZW5zZSBvbmx5IGluIGNhc2VzIHdoZXJlIHlvdSBhcmUgdHVuaW5nIHlv
dXIgc3lzdGVtIAp0byB5b3VyIGFwcGxpY2F0aW9uLCBhbmQgeW91IG11c3Qga25vdyB0aGUgcmVz
b3VyY2UgbmVlZHMgb2YgYWxsIHRoZSAKYXBwcyBpbiB5b3VyIHN5c3RlbS4gU28gdGhleSBjYW5u
b3QgcmVhbGx5IGJlIHVzZWQgaW4gYW55IGdlbmVyaWMgc2V0dXAsIApvciBhdCBsZWFzdCBJIGhh
dmUgbm8gaWRlYSBob3cuCgpEb2VzIHRoZSBoaXN0b3J5IGFuZCBleHBlcmllbmNlIHNheSB0aGF0
IHN1Y2ggc3BlY2lmaWMgY2FzZSBhcyBhYm92ZSAKY2FzZXMgZG9uJ3QgcmVhbGx5IGV4aXN0LCBh
bmQgd2UgY2FuIGFsd2F5cyBoYXZlIGEgZ2VuZXJpYyBVQVBJIChvciwgaW4gCndvcnN0IGNhc2Us
IGEgZGV2aWNlIHNwZWNpZmljIFVBUEkpIHdoaWNoIGNhbiBiZSB1c2VkIGZyb20gWC9XZXN0b24v
b3Itc3VjaD8KCk9yIGRvIHRoaW5ncyBsaWtlIGFib3ZlIGV4aXN0LCBidXQgdGhleSBuZWVkIHRv
IGNhcnJpZWQgaW4gdmVuZG9ycycga2VybmVscz8KCiAgVG9taQoKLS0gClRleGFzIEluc3RydW1l
bnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51
cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
