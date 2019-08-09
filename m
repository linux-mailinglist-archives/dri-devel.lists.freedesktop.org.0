Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE74874A3
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 10:54:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 795AC6ED36;
	Fri,  9 Aug 2019 08:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01ADB6E1E2;
 Fri,  9 Aug 2019 08:54:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9B98AC08EC0B;
 Fri,  9 Aug 2019 08:54:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 443F019C70;
 Fri,  9 Aug 2019 08:54:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9ACF416E32; Fri,  9 Aug 2019 10:54:41 +0200 (CEST)
Date: Fri, 9 Aug 2019 10:54:41 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: 1c74ca7a1a9a ("drm/fb-helper: call vga_remove_vgacon
 automatically.")
Message-ID: <20190809085441.vwg2psrndjo2366q@sirius.home.kraxel.org>
References: <20190808174542.GN20745@zn.tnic>
 <20190809072133.2xlafq4qxitgky6l@sirius.home.kraxel.org>
 <20190809074700.GD2152@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809074700.GD2152@zn.tnic>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Fri, 09 Aug 2019 08:54:43 +0000 (UTC)
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMDksIDIwMTkgYXQgMDk6NDc6MDBBTSArMDIwMCwgQm9yaXNsYXYgUGV0a292
IHdyb3RlOgo+IEhpLAo+IAo+IE9uIEZyaSwgQXVnIDA5LCAyMDE5IGF0IDA5OjIxOjMzQU0gKzAy
MDAsIEdlcmQgSG9mZm1hbm4gd3JvdGU6Cj4gPiBPbiBUaHUsIEF1ZyAwOCwgMjAxOSBhdCAwNzo0
NTo0MlBNICswMjAwLCBCb3Jpc2xhdiBQZXRrb3Ygd3JvdGU6Cj4gPiA+IEhpLAo+ID4gPiAKPiA+
ID4gZm9yIHNvbWUgdW5mYXRob21hYmxlIHRvIG1lIHJlYXNvbiwgdGhlIGNvbW1pdCBpbiAkU3Vi
amVjdCBicmVha3MKPiA+ID4gYm9vdGluZyBvZiB0aGUgMzItYml0IHBhcnRpdGlvbiBvZiBvbmUg
b2YgbXkgdGVzdCBib3hlcy4gVGhlIGJveCBkb2Vzbid0Cj4gPiA+IGZpbmlzaCBib290aW5nIChu
b3JtYWxseSBpdCBib290cyBpbiB0ZXh0IG1vZGUsIHRoZXJlIGlzIG5vIFggc2VydmVyCj4gPiA+
IHNldHVwIG9uIGl0KSBidXQgaXQgaXMgc3RpbGwgcmVzcG9uc2libGUgaW4gdGhlIHNlbnNlIHRo
YXQgSSBjYW4gcmVib290Cj4gPiA+IGl0IHdpdGggdGhlIFN5c3JxIGNvbWJpbmF0aW9uLiBObyBv
dGhlciBrZXlzdHJva2VzIGhhdmUgZWZmZWN0Lgo+ID4gCj4gPiBJcyAidGV4dCBtb2RlIiBhY3R1
YWwgdmdhIHRleHQgbW9kZSBvciBsaW51eCBjb25zb2xlIEAgZmJjb24/Cj4gPiBXaGF0IGRpc3Bs
YXkgaGFyZHdhcmUgZG8geW91IGhhdmU/Cj4gPiAKPiA+IENhbiB5b3Ugc3NoIGludG8gdGhlIG1h
Y2hpbmU/ICBJZiBzbywgY2FuIHlvdSBncmFiIGEga2VybmVsIGxvZyBwbGVhc2U/Cj4gPiBJZiBu
b3QgcGxlYXNlIHNlbmQgYSBrZXJuZWwgbG9nIG9mIGEgYm9vdCB3aXRoIHRoZSBwYXRjaCByZXZl
cnRlZC4KPiAKPiBoZXJlJ3MgZG1lc2cgaW4gYSBwcml2YXRlIG1haWwuCgpbIGFkZGluZyBiYWNr
IHRoZSBtYWlsaW5nIGxpc3QgXQoKPiBJIGNhbiBsb2cgaW50byB0aGUgbWFjaGluZSBhbmQgdGhl
cmUKPiBhcmUgc29tZSBpbnRlcmVzdGluZyBsaW5lcyBpbiBkbWVzZyB3aGljaCBJIGhvcGUgc2hv
dWxkIGFuc3dlciB5b3VyCj4gcXVlc3Rpb25zOgo+IAo+IFsgICAgOC4xMzgyNDFdIHJhZGVvbiAw
MDAwOjAwOjAxLjA6IHJlbW92ZV9jb25mbGljdGluZ19wY2lfZnJhbWVidWZmZXJzOiBiYXIgMDog
MHhlMDAwMDAwMCAtPiAweGVmZmZmZmZmCj4gWyAgICA4LjEzODU0NV0gcmFkZW9uIDAwMDA6MDA6
MDEuMDogcmVtb3ZlX2NvbmZsaWN0aW5nX3BjaV9mcmFtZWJ1ZmZlcnM6IGJhciAyOiAweGYwMzAw
MDAwIC0+IDB4ZjAzM2ZmZmYKPiBbICAgIDguMTM4ODU0XSByYWRlb24gMDAwMDowMDowMS4wOiB2
Z2FhcmI6IGRlYWN0aXZhdGUgdmdhIGNvbnNvbGUKPiBbICAgIDguMTQwMjY5XSBDb25zb2xlOiBz
d2l0Y2hpbmcgdG8gY29sb3VyIGR1bW15IGRldmljZSA4MHgyNQoKQSBiaXQgbGF0ZXI6CgogICBb
ICAgIDguMTk4MTM4XSByYWRlb24gMDAwMDowMDowMS4wOiBEaXJlY3QgZmlybXdhcmUgbG9hZCBm
b3IgcmFkZW9uL1BBTE1fcGZwLmJpbiBmYWlsZWQgd2l0aCBlcnJvciAtMgogICBbICAgIDguMTk4
MzUxXSByNjAwX2NwOiBGYWlsZWQgdG8gbG9hZCBmaXJtd2FyZSAicmFkZW9uL1BBTE1fcGZwLmJp
biIKICAgWyAgICA4LjE5ODUxMl0gW2RybTpldmVyZ3JlZW5faW5pdCBbcmFkZW9uXV0gKkVSUk9S
KiBGYWlsZWQgdG8gbG9hZCBmaXJtd2FyZSEKICAgWyAgICA4LjE5ODU5MF0gcmFkZW9uIDAwMDA6
MDA6MDEuMDogRmF0YWwgZXJyb3IgZHVyaW5nIEdQVSBpbml0CgpTbyB0aGUgcmFkZW9uIGRybSBk
cml2ZXIgdHJpZXMgdG8gbG9hZCBhbmQgZmFpbHMgZHVlIHRvIG1pc3NpbmcgZmlybXdhcmUsCnRo
YXRzIHdoeSB5b3UgaGF2ZSBhIG5vbi13b3JraW5nIGRpc3BsYXkuCgpTbyB5b3VyIG9wdGlvbnMg
YXJlOgogIChhKSBpbnN0YWxsIGxpbnV4LWZpcm13YXJlLCBzbyB0aGUgcmFkZW9uIGRyaXZlciBj
YW4gaW5pdGlhbGl6ZSwgb3IKICAoYikgYm9vdCB5b3VyIGtlcm5lbCB3aXRoICJub21vZGVzZXQi
IGNvbW1hbmQgbGluZSBvcHRpb24uICBUaGUgcmFkZW9uCiAgICAgIGRyaXZlciB3aWxsIG5vdCBp
bml0aWFsaXplIHRoZW4sIGFuZCBhbHNvIG5vdCBkaXNhYmxlIGNvbmZsaWN0aW5nCiAgICAgIGRp
c3BsYXkgZHJpdmVycyAodmdhY29uIG9yIGZiY29uIEAgdmVzYWZiL2VmaWZiKS4KClBvc3NpYmx5
IGl0IGFsc28gbWFrZXMgc2Vuc2UgdG8gaGF2ZSB0aGUgcmFkZW9uIGRyaXZlciB0cnkgbG9hZCB0
aGUgZmlybXdhcmUKKGZyb20gZGlzaykgcmF0aGVyIGVhcmx5IGluIHRoZSBpbml0aWFsaXphdGlv
biBwcm9jZXNzLCBiZWZvcmUgY2FsbGluZwpkcm1fZmJfaGVscGVyX3JlbW92ZV9jb25mbGljdGlu
Z19wY2lfZnJhbWVidWZmZXJzLCBzbyBmaXJtd2FyZSBub3QgYmVpbmcKaW5zdGFsbGVkIGRvZXNu
J3Qga2lsbCB0aGUgZGlzcGxheS4KClsgQ2MnaW5nIGFtZC1nZnggZm9yIGNvbW1lbnRzIF0uCgpj
aGVlcnMsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
