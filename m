Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0096B06A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 22:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8626E19C;
	Tue, 16 Jul 2019 20:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
 [209.85.222.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7846E19C
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 20:28:22 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id c4so8735465uad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 13:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=jr7xBNr/u76XHJ2k6dn2W7cKe7RZrI6QH8AI8PUsEJw=;
 b=cDu+pIDvDznnpThEuOiu1fmRf0CLIhOL6J6b6mjVXSWN/5wDK/Ob7qkgUEvyT7x4tc
 G1EYvbIN+o+8yfIlYaW8dYMHqhu7etQaLkjbw35m0kP153jNvYyVQeKgtN5i71NsH7B7
 M6WV+SslckLcXyS3Wtma4tFOBJtATVToCdjgyEYnfOR1PlvQfRxOp+WIFEnsm9Uog7x+
 kCVkUWyo6u91L/hXjGqWVCfo5VYDD+XpfhvQRwHsL/OFk02XvIExQQlw6ARM74pz4ts9
 Gmb0wyuKLjy+GjhB+oWO8JgxTa4TtZMU2wFplS4pS3LttGaeQMMu8I9dBAYxKqFLy0ZB
 6Wgg==
X-Gm-Message-State: APjAAAWdhqVnZSBrG9ZycudYbSoEg6EDCWVxHUVeI7VnMTB+A8k7uXdG
 lSCZQFn8n51J55RwM+snx3//jw==
X-Google-Smtp-Source: APXvYqxeZxZLnt23EjnX4k+ByTrL8gfJJFBFRz0F4iyNWvtN0TZgTwfbeMwcqKQaIgZgTb1yuAzU5g==
X-Received: by 2002:ab0:2850:: with SMTP id c16mr2599377uaq.128.1563308901417; 
 Tue, 16 Jul 2019 13:28:21 -0700 (PDT)
Received: from dhcp-10-20-1-11.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id w8sm7863204vke.29.2019.07.16.13.28.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 16 Jul 2019 13:28:20 -0700 (PDT)
Message-ID: <d5b921f75cc4a7f9d8c42156599c1490ea8853f9.camel@redhat.com>
Subject: Re: [PATCH v2] drm/sysfs: Add mstpath attribute to connector devices
From: Lyude Paul <lyude@redhat.com>
To: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>
Date: Tue, 16 Jul 2019 16:28:19 -0400
In-Reply-To: <a2ed8ffd-1b92-23c8-f56a-36a1ce2bb311@amd.com>
References: <20190704190519.29525-4-sunpeng.li@amd.com>
 <20190705143220.11109-1-sunpeng.li@amd.com>
 <346980b73f3b1fbbc70cbf3771788cec0777d4c0.camel@redhat.com>
 <a2ed8ffd-1b92-23c8-f56a-36a1ce2bb311@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTA3LTE2IGF0IDE4OjI4ICswMDAwLCBMaSwgU3VuIHBlbmcgKExlbykgd3Jv
dGU6Cj4gCj4gCj4gT24gMjAxOS0wNy0xMCA2OjUwIHAubS4sIEx5dWRlIFBhdWwgd3JvdGU6Cj4g
PiBnYWguIFNvLCBJIHdhcyBvcmlnaW5hbGx5IGdvaW5nIHRvIGFzayAid2h5IGRpZG4ndCB3ZSBh
ZGQgdGhlIGNvbm5lY3Rvcgo+ID4gbmFtZQo+ID4gaW50byB0aGlzPyIsIGJ1dCB0aGVuIEkgcmVh
bGl6ZWQgd2UncmUgZG9pbmcgdGhlIHJpZ2h0IHRoaW5nIGFscmVhZHkgYW5kCj4gPiBqdXN0Cj4g
PiBkb2luZyBjYXJkJWQtJXMgJSAoY2FyZF9udW1iZXIsIHBhdGhfcHJvcCkuIFdoaWNoIG1lYW5z
IHdlIHByb2JhYmx5IHJlYWxseQo+ID4gZG9uJ3QKPiA+IHdhbnQgdG8gYWRkIGEgcHJvcGVydHkg
Y2FsbGVkIG1zdHBhdGgsIHNpbmNlIGl0J3MgaGFyZGx5IGRpZmZlcmVudCBmcm9tCj4gPiBwYXRo
Cj4gPiAod2hvb3BzISkuCj4gPiAKPiA+IEFkZGl0aW9uYWxseSwgYWZ0ZXIgc29tZSB0aGlua2lu
ZyBJIHJlYWxpemVkIEkgbWF5IGhhdmUgbWFkZSBhIG1pc3Rha2UgYXMKPiA+IEknbQo+ID4gbm90
IGVudGlyZWx5IHN1cmUgaWYgd2Ugd291bGQgbmVlZCB0byBzcGVjaWZ5IHRoZSBEUk0gY2FyZCBp
biB0aGUgcGF0aAo+ID4gcHJvcCBmb3IKPiA+IHVkZXYsIGNvbnNpZGVyaW5nIHRoYXQncyBzcGVj
aWZpZWQgaW4gdGhlIHN5c2ZzIHBhdGggYWxsIHJlYWR5LiBFdmVuIGlmCj4gPiBJJ20KPiA+IHdy
b25nIG9uIHRoYXQgdGhvdWdoLCBJIHRoaW5rIGl0IG1pZ2h0IGJlIGJldHRlciBub3QgdG8gYWRk
IGFuIG1zdHBhdGgKPiA+IHByb3BlcnR5Cj4gPiBhbmQganVzdCBnbyB0aGUgcm91dGUgb2YganVz
dCBhZGRpbmcgYSBuZXcgcGF0aF92MiBwcm9wZXJ0eSB0aGF0IHdlIGNvdWxkCj4gPiB1c2UKPiA+
IGZvciBib3RoIE1TVCBhbmQgbm9uLU1TVCBjb25uZWN0b3IgcGF0aHMuIChJIGNjJ2QgeW91IG9u
IHRoZSBlbWFpbCB0aHJlYWQKPiA+IGFib3V0Cj4gPiB0aGlzLCBzbyB5b3UgY2FuIHJlYWQgbW9y
ZSBhYm91dCB0aGlzIHRoZXJlLgo+IAo+IEZ1bm55IGVub3VnaCwgSSB3YXMgb3JpZ2luYWxseSB0
cnlpbmcgdG8gbWFrZSB0aGlzIHdvcmsgZm9yIFNTVCBkZXZpY2VzLgo+IEl0IGRpZG4ndCBtYWtl
IHNlbnNlIHRvIGhhdmUgYnktbmFtZSBhbmQgYnktcGF0aCwgYnV0IG9ubHkgaGF2ZSBTU1QKPiBl
eGlzdCBpbiB0aGUgYnktbmFtZSBzeW1saW5rcy4gVGhlIHF1ZXN0aW9uIHRoZXJlIHdhcyAid2hh
dCB0byB1c2UgZm9yCj4gc3N0IHBhdGhzPyIgRXZlbnR1YWxseSBJIHNldHRsZWQgd2l0aCBrZWVw
aW5nIHRoaXMgcHVyZWx5IGZvciB1c2VyCj4gZnJpZW5kbGluZXNzLiBCdXQgc2luY2UgZGlzY3Vz
c2lvbiBpcyBhbHJlYWR5IHVuZGVyd2F5IGZvciBhIGJldHRlcgo+ICdwYXRoJywgaXQgbWFrZXMg
c2Vuc2UgdG8gZGVsYXkgdGhpcy4KClllYWgtSSB0aGluayBWaWxsZSdzIHN1Z2dlc3Rpb24gb2Yg
bWFraW5nIG9iamVjdCBJRHMgZ2xvYmFsIGluc3RlYWQgb2YgcGVyLQpkZXZpY2UgbWlnaHQgYmUg
d2hhdCB3ZSB3YW50IHRvICBnbyB3aXRoLCBidXQgZ2V0dGluZyB0aGUgYXV4IGRldiBzdHVmZiBp
biB0aGUKa2VybmVsIGZpcnN0IGlzIHByaW9yaXR5IGltbwoKPiAKPiA+IFNvLCBJIHdvdWxkIGFj
dHVhbGx5IHN1Z2dlc3Qgd2UganVzdCBkcm9wIHRoaXMgcGF0Y2ggZW50aXJlbHkgZm9yIG5vdy4g
V2UKPiA+IHNob3VsZAo+ID4gYmUgZmluZSB3aXRob3V0IGl0LCBldmVuIHRob3VnaCB0aGUgZHBf
YXV4X2RldiBwYXRocyB3aWxsIGJlIGtpbmQgb2YgdWdseQo+ID4gZm9yIGEKPiA+IGxpdHRsZSB3
aGlsZS4gSSdkIHJhdGhlciB0aGUgcmVzdCBvZiB0aGlzIHNlcmllcyBnZXQgdXBzdHJlYW0gZmly
c3QsIGFuZAo+ID4gdHJ5IHRvCj4gPiBkbyB0aGUgcGF0aCBwcm9wIHN0dWZmIHNlcGFyYXRlbHku
Pgo+IAo+IFNvdW5kcyBmYWlyLCBnb2luZyB0byBzcGluIHVwIHYzLgo+IAo+IFRoYW5rcyEKPiBM
ZW8KPiAKPiA+IE9uIEZyaSwgMjAxOS0wNy0wNSBhdCAxMDozMiAtMDQwMCwgc3VucGVuZy5saUBh
bWQuY29tIHdyb3RlOgo+ID4gPiBGcm9tOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KPiA+
ID4gCj4gPiA+IFRoaXMgY2FuIGJlIHVzZWQgdG8gY3JlYXRlIG1vcmUgZGVzY3JpcHRpdmUgc3lt
bGlua3MgZm9yIE1TVCBhdXgKPiA+ID4gZGV2aWNlcy4gQ29uc2lkZXIgdGhlIGZvbGxvd2luZyB1
ZGV2IHJ1bGU6Cj4gPiA+IAo+ID4gPiBTVUJTWVNURU09PSJkcm1fZHBfYXV4X2RldiIsIFNVQlNZ
U1RFTVM9PSJkcm0iLCBBVFRSU3ttc3RwYXRofT09Ij8qIiwKPiA+ID4gCVNZTUxJTksrPSJkcm1f
ZHBfYXV4L2J5LXBhdGgvJGF0dHJ7bXN0cGF0aH0iCj4gPiA+IAo+ID4gPiBUaGUgZm9sbG93aW5n
IHN5bWxpbmtzIHdpbGwgYmUgY3JlYXRlZCAoZGVwZW5kaW5nIG9uIHlvdXIgTVNUIHRvcG9sb2d5
KToKPiA+ID4gCj4gPiA+ICQgbHMgL2Rldi9kcm1fZHBfYXV4L2J5LXBhdGgvCj4gPiA+IGNhcmQw
LW1zdDowLTEgIGNhcmQwLW1zdDowLTEtMSAgY2FyZDAtbXN0OjAtMS04ICBjYXJkMC1tc3Q6MC04
Cj4gPiA+IAo+ID4gPiB2MjogcmVtb3ZlIHVubmVjZXNzYXJ5IGxvY2tpbmcgb2YgbW9kZV9jb25m
aWcubXV0ZXgKPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IExlbyBMaSA8c3VucGVuZy5saUBh
bWQuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fc3lzZnMuYyB8IDIw
ICsrKysrKysrKysrKysrKysrKysrCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9u
cygrKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3lzZnMu
YyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3lzZnMuYwo+ID4gPiBpbmRleCBhZDEwODEwYmM5NzIu
LjdkNDgzYWI2ODRhMCAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9zeXNm
cy5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3lzZnMuYwo+ID4gPiBAQCAtMjM2
LDE2ICsyMzYsMzYgQEAgc3RhdGljIHNzaXplX3QgbW9kZXNfc2hvdyhzdHJ1Y3QgZGV2aWNlICpk
ZXZpY2UsCj4gPiA+ICAJcmV0dXJuIHdyaXR0ZW47Cj4gPiA+ICB9Cj4gPiA+ICAKPiA+ID4gK3N0
YXRpYyBzc2l6ZV90IG1zdHBhdGhfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXZpY2UsCj4gPiA+ICsJ
CQkgICAgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsCj4gPiA+ICsJCQkgICAgY2hhciAq
YnVmKQo+ID4gPiArewo+ID4gPiArCXN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IgPSB0
b19kcm1fY29ubmVjdG9yKGRldmljZSk7Cj4gPiA+ICsJc3NpemVfdCByZXQgPSAwOwo+ID4gPiAr
CWNoYXIgKnBhdGg7Cj4gPiA+ICsKPiA+ID4gKwlpZiAoIWNvbm5lY3Rvci0+cGF0aF9ibG9iX3B0
cikKPiA+ID4gKwkJcmV0dXJuIHJldDsKPiA+ID4gKwo+ID4gPiArCXBhdGggPSBjb25uZWN0b3It
PnBhdGhfYmxvYl9wdHItPmRhdGE7Cj4gPiA+ICsJcmV0ID0gc25wcmludGYoYnVmLCBQQUdFX1NJ
WkUsICJjYXJkJWQtJXNcbiIsCj4gPiA+ICsJCSAgICAgICBjb25uZWN0b3ItPmRldi0+cHJpbWFy
eS0+aW5kZXgsIHBhdGgpOwo+ID4gPiArCj4gPiA+ICsJcmV0dXJuIHJldDsKPiA+ID4gK30KPiA+
ID4gKwo+ID4gPiAgc3RhdGljIERFVklDRV9BVFRSX1JXKHN0YXR1cyk7Cj4gPiA+ICBzdGF0aWMg
REVWSUNFX0FUVFJfUk8oZW5hYmxlZCk7Cj4gPiA+ICBzdGF0aWMgREVWSUNFX0FUVFJfUk8oZHBt
cyk7Cj4gPiA+ICBzdGF0aWMgREVWSUNFX0FUVFJfUk8obW9kZXMpOwo+ID4gPiArc3RhdGljIERF
VklDRV9BVFRSX1JPKG1zdHBhdGgpOwo+ID4gPiAgCj4gPiA+ICBzdGF0aWMgc3RydWN0IGF0dHJp
YnV0ZSAqY29ubmVjdG9yX2Rldl9hdHRyc1tdID0gewo+ID4gPiAgCSZkZXZfYXR0cl9zdGF0dXMu
YXR0ciwKPiA+ID4gIAkmZGV2X2F0dHJfZW5hYmxlZC5hdHRyLAo+ID4gPiAgCSZkZXZfYXR0cl9k
cG1zLmF0dHIsCj4gPiA+ICAJJmRldl9hdHRyX21vZGVzLmF0dHIsCj4gPiA+ICsJJmRldl9hdHRy
X21zdHBhdGguYXR0ciwKPiA+ID4gIAlOVUxMCj4gPiA+ICB9Owo+ID4gPiAgCi0tIApDaGVlcnMs
CglMeXVkZSBQYXVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
