Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B40B51DA41F
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 23:52:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B976F89143;
	Tue, 19 May 2020 21:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61C689D8D;
 Tue, 19 May 2020 21:52:45 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21233858-1500050 for multiple; Tue, 19 May 2020 22:51:56 +0100
MIME-Version: 1.0
In-Reply-To: <20200519132756.682888-1-daniel.vetter@ffwll.ch>
References: <20200519132756.682888-1-daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] dma-fence: add might_sleep annotation to _wait()
To: DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158992511426.8153.12953280000513890247@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Tue, 19 May 2020 22:51:54 +0100
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
Cc: amd-gfx@lists.freedesktop.org, linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, linaro-mm-sig@lists.linaro.org, VMware Graphics <linux-graphics-maintainer@vmware.com>, Ben Skeggs <bskeggs@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Alex Deucher <alexander.deucher@amd.com>, Daniel Vetter <daniel.vetter@intel.com>, linux-media@vger.kernel.org, Christian König <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDIwLTA1LTE5IDE0OjI3OjU2KQo+IERvIGl0IHVuY29u
dGlvbmFsbHksIHRoZXJlJ3MgYSBzZXBhcmF0ZSBwZWVrIGZ1bmN0aW9uIHdpdGgKPiBkbWFfZmVu
Y2VfaXNfc2lnbmFsbGVkKCkgd2hpY2ggY2FuIGJlIGNhbGxlZCBmcm9tIGF0b21pYyBjb250ZXh0
Lgo+IAo+IHYyOiBDb25zZW5zdXMgY2FsbHMgZm9yIGFuIHVuY29uZGl0aW9uYWwgbWlnaHRfc2xl
ZXAgKENocmlzLAo+IENocmlzdGlhbikKPiAKPiBGdWxsIGF1ZGl0Ogo+IC0gZG1hLWZlbmNlLmg6
IFVzZXMgTUFYX1NDSEVEVUxFX1RJTU9VVCwgZ29vZCBjaGFuY2UgdGhpcyBzbGVlcHMKPiAtIGRt
YS1yZXN2LmM6IFRpbWVvdXQgYWx3YXlzIGF0IGxlYXN0IDEKPiAtIHN0LWRtYS1mZW5jZS5jOiBT
YXZlIHRvIHNsZWVwIGluIHRlc3RjYXNlcwo+IC0gYW1kZ3B1X2NzLmM6IEJvdGggY2FsbGVycyBh
cmUgZm9yIHZhcmlhbnRzIG9mIHRoZSB3YWl0IGlvY3RsCj4gLSBhbWRncHVfZGV2aWNlLmM6IFR3
byBjYWxsZXJzIGluIHZyYW0gcmVjb3ZlciBjb2RlLCBib3RoIHJpZ2h0IG5leHQKPiAgIHRvIG11
dGV4X2xvY2suCj4gLSBhbWRncHVfdm0uYzogVXNlIGluIHRoZSB2bV93YWl0IGlvY3RsLCBuZXh0
IHRvIF9yZXNlcnZlL3VucmVzZXJ2ZQo+IC0gcmVtYWluaW5nIGZ1bmN0aW9ucyBpbiBhbWRncHU6
IEFsbCBmb3IgdGVzdF9pYiBpbXBsZW1lbnRhdGlvbnMgZm9yCj4gICB2YXJpb3VzIGVuZ2luZXMs
IGNhbGxlciBmb3IgdGhhdCBsb29rcyBhbGwgc2FmZSAoZGVidWdmcywgZHJpdmVyCj4gICBsb2Fk
LCByZXNldCkKPiAtIGV0bmF2aXY6IGFub3RoZXIgd2FpdCBpb2N0bAo+IC0gaGFiYW5hbGFiczog
YW5vdGhlciB3YWl0IGlvY3RsCj4gLSBub3V2ZWF1X2ZlbmNlLmM6IGhhcmRjb2RlZCAxNSpIWiAu
Li4gZ2xvcmlvdXMKPiAtIG5vdXZlYXVfZ2VtLmM6IGhhcmRjb2RlZCAyKkhaIC4uLiBzbyBub3Qg
ZXZlbiBzdXBlciBjb25zaXN0ZW50LCBidXQKPiAgIHRoaXMgb25lIGRvZXMgaGF2ZSBhIFdBUk5f
T04gOi0vIEF0IGxlYXN0IHRoaXMgb25lIGlzIG9ubHkgYQo+ICAgZmFsbGJhY2sgcGF0aCBmb3Ig
d2hlbiBrbWFsbG9jIGZhaWxzLiBNYXliZSB0aGlzIHNob3VsZCBiZSBwdXQgb250bwo+ICAgc29t
ZSB3b3JrZXIgbGlzdCBpbnN0ZWFkLCBpbnN0ZWFkIG9mIGEgd29yayBwZXIgdW5hbXAgLi4uCj4g
LSBpOTE1L3NlbGZ0ZXN0czogSGFyZGVjb2RlZCBIWiAvIDQgb3IgSFogLyA4Cj4gLSBpOTE1L2d0
L3NlbGZ0ZXN0czogR29pbmcgdXAgdGhlIGNhbGxjaGFpbiBsb29rcyBzYWZlIGxvb2tpbmcgYXQK
PiAgIG5lYXJieSBjYWxsZXJzCj4gLSBpOTE1L2d0L2ludGVsX2d0X3JlcXVlc3RzLmMuIFdyYXBw
ZWQgaW4gYSBtdXRleF9sb2NrCj4gLSBpOTE1L2dlbV9pOTE1X2dlbV93YWl0LmM6IFRoZSBpOTE1
LXZlcnNpb24gd2hpY2ggaXMgY2FsbGVkIGluc3RlYWQKPiAgIGZvciBpOTE1IGZlbmNlcyBhbHJl
YWR5IGhhcyBhIG1pZ2h0X3NsZWVwKCkgYW5ub3RhdGlvbiwgc28gYWxsIGdvb2QKPiAKPiBDYzog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiBMdWNhcyBTdGFj
aCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KPiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxh
QGxpbnV4LmludGVsLmNvbT4KPiBDYzogSm9vbmFzIExhaHRpbmVuIDxqb29uYXMubGFodGluZW5A
bGludXguaW50ZWwuY29tPgo+IENjOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5j
b20+Cj4gQ2M6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KPiBDYzogIlZNd2FyZSBH
cmFwaGljcyIgPGxpbnV4LWdyYXBoaWNzLW1haW50YWluZXJAdm13YXJlLmNvbT4KPiBDYzogT2Rl
ZCBHYWJiYXkgPG9kZWQuZ2FiYmF5QGdtYWlsLmNvbT4KPiBDYzogbGludXgtbWVkaWFAdmdlci5r
ZXJuZWwub3JnCj4gQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwo+IENjOiBsaW51
eC1yZG1hQHZnZXIua2VybmVsLm9yZwo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IENjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IENocmlzIFdpbHNv
biA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFh
cnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVu
Y2UuYyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMgYi9kcml2ZXJzL2RtYS1idWYvZG1h
LWZlbmNlLmMKPiBpbmRleCA5MGVkZjJiMjgxYjAuLjY1NmU5YWMyZDAyOCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMKPiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1h
LWZlbmNlLmMKPiBAQCAtMjA4LDYgKzIwOCw4IEBAIGRtYV9mZW5jZV93YWl0X3RpbWVvdXQoc3Ry
dWN0IGRtYV9mZW5jZSAqZmVuY2UsIGJvb2wgaW50ciwgc2lnbmVkIGxvbmcgdGltZW91dCkKPiAg
ICAgICAgIGlmIChXQVJOX09OKHRpbWVvdXQgPCAwKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJu
IC1FSU5WQUw7Cj4gIAo+ICsgICAgICAgbWlnaHRfc2xlZXAoKTsKCmdpdCBncmVwIG1hdGNoZXMg
eW91ciBzeW5vcHNpcy4KClJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdp
bHNvbi5jby51az4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
