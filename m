Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CF131B869
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 12:53:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8996E10A;
	Mon, 15 Feb 2021 11:53:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707B46E10A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 11:53:43 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1lBcRZ-0005X3-Sr; Mon, 15 Feb 2021 12:53:33 +0100
Message-ID: <8d23f1ca6fe76d8971365bf54ca71ba71698980d.camel@pengutronix.de>
Subject: Re: DMA-buf and uncached system memory
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Simon Ser
 <contact@emersion.fr>
Date: Mon, 15 Feb 2021 12:53:32 +0100
In-Reply-To: <da9edfa0-8a18-44a2-fa79-83b4177afd8e@amd.com>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <GUuZYSQk2hxgykDhSxfB2GWo47lQlVrKBtWMwQUG7Ar2GAag5WQDxBI0zq6nDTooPBzTktyRpnu25Ju1UKE3FYD9yHbkNMAHcmSI96hoJhA=@emersion.fr>
 <da9edfa0-8a18-44a2-fa79-83b4177afd8e@amd.com>
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: linaro-mm-sig@lists.linaro.org, linux-media <linux-media@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Sharma,
 Shashank" <Shashank.Sharma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gTW9udGFnLCBkZW0gMTUuMDIuMjAyMSB1bSAxMDozNCArMDEwMCBzY2hyaWViIENocmlzdGlh
biBLw7ZuaWc6Cj4gCj4gQW0gMTUuMDIuMjEgdW0gMTA6MDYgc2NocmllYiBTaW1vbiBTZXI6Cj4g
PiBPbiBNb25kYXksIEZlYnJ1YXJ5IDE1dGgsIDIwMjEgYXQgOTo1OCBBTSwgQ2hyaXN0aWFuIEvD
tm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPiA+IAo+ID4gPiB3ZSBhcmUg
Y3VycmVudGx5IHdvcmtpbmcgYW4gRnJlZXN5bmMgYW5kIGRpcmVjdCBzY2FuIG91dCBmcm9tIHN5
c3RlbQo+ID4gPiBtZW1vcnkgb24gQU1EIEFQVXMgaW4gQStBIGxhcHRvcHMuCj4gPiA+IAo+ID4g
PiBPbiBwcm9ibGVtIHdlIHN0dW1ibGVkIG92ZXIgaXMgdGhhdCBvdXIgZGlzcGxheSBoYXJkd2Fy
ZSBuZWVkcyB0byBzY2FuCj4gPiA+IG91dCBmcm9tIHVuY2FjaGVkIHN5c3RlbSBtZW1vcnkgYW5k
IHdlIGN1cnJlbnRseSBkb24ndCBoYXZlIGEgd2F5IHRvCj4gPiA+IGNvbW11bmljYXRlIHRoYXQg
dGhyb3VnaCBETUEtYnVmLgo+ID4gPiAKPiA+ID4gRm9yIG91ciBzcGVjaWZpYyB1c2UgY2FzZSBh
dCBoYW5kIHdlIGFyZSBnb2luZyB0byBpbXBsZW1lbnQgc29tZXRoaW5nCj4gPiA+IGRyaXZlciBz
cGVjaWZpYywgYnV0IHRoZSBxdWVzdGlvbiBpcyBzaG91bGQgd2UgaGF2ZSBzb21ldGhpbmcgbW9y
ZQo+ID4gPiBnZW5lcmljIGZvciB0aGlzPwo+ID4gPiAKPiA+ID4gQWZ0ZXIgYWxsIHRoZSBzeXN0
ZW0gbWVtb3J5IGFjY2VzcyBwYXR0ZXJuIGlzIGEgUENJZSBleHRlbnNpb24gYW5kIGFzCj4gPiA+
IHN1Y2ggc29tZXRoaW5nIGdlbmVyaWMuCj4gPiBJbnRlbCBhbHNvIG5lZWRzIHVuY2FjaGVkIHN5
c3RlbSBtZW1vcnkgaWYgSSdtIG5vdCBtaXN0YWtlbj8KPiAKPiBObyBpZGVhLCB0aGF0J3Mgd2h5
IEknbSBhc2tpbmcuIENvdWxkIGJlIHRoYXQgdGhpcyBpcyBhbHNvIGludGVyZXN0aW5nIAo+IGZv
ciBJK0Egc3lzdGVtcy4KPiAKPiA+IFdoZXJlIGFyZSB0aGUgYnVmZmVycyBhbGxvY2F0ZWQ/IElm
IEdCTSwgdGhlbiBpdCBuZWVkcyB0byBhbGxvY2F0ZSBtZW1vcnkgdGhhdAo+ID4gY2FuIGJlIHNj
YW5uZWQgb3V0IGlmIHRoZSBVU0VfU0NBTk9VVCBmbGFnIGlzIHNldCBvciBpZiBhIHNjYW5vdXQt
Y2FwYWJsZQo+ID4gbW9kaWZpZXIgaXMgcGlja2VkLgo+ID4gCj4gPiBJZiB0aGlzIGlzIGFib3V0
IGNvbW11bmljYXRpbmcgYnVmZmVyIGNvbnN0cmFpbnRzIGJldHdlZW4gZGlmZmVyZW50IGNvbXBv
bmVudHMKPiA+IG9mIHRoZSBzdGFjaywgdGhlcmUgd2VyZSBhIGZldyBwcm9wb3NhbHMgYWJvdXQg
aXQuIFRoZSBtb3N0IHJlY2VudCBvbmUgaXMgWzFdLgo+IAo+IFdlbGwgdGhlIHByb2JsZW0gaGVy
ZSBpcyBvbiBhIGRpZmZlcmVudCBsZXZlbCBvZiB0aGUgc3RhY2suCj4gCj4gU2VlIHJlc29sdXRp
b24sIHBpdGNoIGV0YzouLiBjYW4gZWFzaWx5IGNvbW11bmljYXRlZCBpbiB1c2Vyc3BhY2UgCj4g
d2l0aG91dCBpbnZvbHZlbWVudCBvZiB0aGUga2VybmVsLiBUaGUgd29yc3QgdGhpbmcgd2hpY2gg
Y2FuIGhhcHBlbiBpcyAKPiB0aGF0IHlvdSBkcmF3IGdhcmJhZ2UgaW50byB5b3VyIG93biBhcHBs
aWNhdGlvbiB3aW5kb3cuCj4gCj4gQnV0IGlmIHlvdSBnZXQgdGhlIGNhY2hpbmcgYXR0cmlidXRl
cyBpbiB0aGUgcGFnZSB0YWJsZXMgKGJvdGggQ1BVIGFzIAo+IHdlbGwgYXMgSU9NTVUsIGRldmlj
ZSBldGMuLi4pIHdyb25nIHRoZW4gQVJNIGZvciBleGFtcGxlIGhhcyB0aGUgCj4gdGVuZGVuY3kg
dG8ganVzdCBzcG9udGFuZW91c2x5IHJlYm9vdAo+IAo+IFg4NiBpcyBmb3J0dW5hdGVseSBhIGJp
dCBtb3JlIGdyYWNlZnVsbHkgYW5kIHlvdSBvbmx5IGVuZCB1cCB3aXRoIHJhbmRvbSAKPiBkYXRh
IGNvcnJ1cHRpb24sIGJ1dCB0aGF0IGlzIG9ubHkgbWFyZ2luYWxseSBiZXR0ZXIuCj4gCj4gU28g
dG8gc3VtIGl0IHVwIHRoYXQgaXMgbm90IHNvbWV0aGluZyB3aGljaCB3ZSBjYW4gbGVhdmUgaW4g
dGhlIGhhbmRzIG9mIAo+IHVzZXJzcGFjZS4KPiAKPiBJIHRoaW5rIHRoYXQgZXhwb3J0ZXJzIGlu
IHRoZSBETUEtYnVmIGZyYW1ld29yayBzaG91bGQgaGF2ZSB0aGUgYWJpbGl0eSAKPiB0byB0ZWxs
IGltcG9ydGVycyBpZiB0aGUgc3lzdGVtIG1lbW9yeSBzbm9vcGluZyBpcyBuZWNlc3Nhcnkgb3Ig
bm90LgoKVGhlcmUgaXMgYWxyZWFkeSBhIGNvYXJzZS1ncmFpbmVkIHdheSB0byBkbyBzbzogdGhl
IGRtYV9jb2hlcmVudApwcm9wZXJ0eSBpbiBzdHJ1Y3QgZGV2aWNlLCB3aGljaCB5b3UgY2FuIGNo
ZWNrIGF0IGRtYWJ1ZiBhdHRhY2ggdGltZS4KCkhvd2V2ZXIgaXQgbWF5IG5vdCBiZSBlbm91Z2gg
Zm9yIHRoZSByZXF1aXJlbWVudHMgb2YgYSBHUFUgd2hlcmUgdGhlIAplbmdpbmVzIGNvdWxkIGRp
ZmZlciBpbiB0aGVpciBkbWEgY29oZXJlbmN5IHJlcXVpcmVtZW50cy4gRm9yIHRoYXQgeW91Cm5l
ZWQgdG8gZWl0aGVyIGhhdmUgZmFrZSBzdHJ1Y3QgZGV2aWNlcyBmb3IgdGhlIGluZGl2aWR1YWwg
ZW5naW5lcyBvcgpjb21lIHVwIHdpdGggYSBtb3JlIGZpbmUtZ3JhaW5lZCB3YXkgdG8gY29tbXVu
aWNhdGUgdGhvc2UgcmVxdWlyZW1lbnRzLgoKPiBVc2Vyc3BhY2UgY29tcG9uZW50cyBjYW4gdGhl
biBvZiBjb3Vyc2UgdGVsbCB0aGUgZXhwb3J0ZXIgd2hhdCB0aGUgCj4gaW1wb3J0ZXIgbmVlZHMs
IGJ1dCB2YWxpZGF0aW9uIGlmIHRoYXQgc3R1ZmYgaXMgY29ycmVjdCBhbmQgZG9lc24ndCAKPiBj
cmFzaCB0aGUgc3lzdGVtIG11c3QgaGFwcGVuIGluIHRoZSBrZXJuZWwuCgpXaGF0IGV4YWN0bHkg
ZG8geW91IG1lYW4gYnkgInNjYW5vdXQgcmVxdWlyZXMgbm9uLWNvaGVyZW50IG1lbW9yeSI/CkRv
ZXMgdGhlIHNjYW5vdXQgcmVxdWVzdG9yIGFsd2F5cyBzZXQgdGhlIG5vLXNub29wIFBDSSBmbGFn
LCBzbyB5b3UgZ2V0CmdhcmJhZ2UgaWYgc29tZSB3cml0ZXMgdG8gbWVtb3J5IGFyZSBzdGlsbCBz
dHVjayBpbiB0aGUgY2FjaGVzLCBvciBpcwppdCBzb21lIG90aGVyIHJlcXVpcmVtZW50PwoKUmVn
YXJkcywKTHVjYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
