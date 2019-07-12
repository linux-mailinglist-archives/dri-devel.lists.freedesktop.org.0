Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B699F67592
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 21:54:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175316E37C;
	Fri, 12 Jul 2019 19:54:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D7A6E37C
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 19:54:28 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id a15so9355288qtn.7
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 12:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=WgM9ZgEMA4HEeMklElixyqm9T0B5SNKrAW1CrtMIU68=;
 b=ZjH7Ytz2VOtjnz+t4tw9WmfEUUJCq6IagR1ma3nOl1khnXOrCxDqUrPG0kB+rP+aD7
 zmTrONGRDjV49ARCWsKdRI0T8BAqznU8+8htmu7ljXC9ExO+uOaVR7/mWYPzyJBTAjN2
 CWUTyJeoQs/3G0q0lKechRjkJ8Q95dS29iQDmsaui9ghvm5StWmDonsn+I62iSZf4KiX
 1orC2CZEMpItsaoR6IhVvkEvgHfjBjQfaRUEmUYWz3ZhOfuvzzGssHFdtJKmSXRHbZF5
 +NvXNYzEKRTxL48kz7uB7I2wU2idAsDFnvG0RB39RGaDCVgOepQchPWI82S2a9gfSkaN
 p3xA==
X-Gm-Message-State: APjAAAW+kfutYRfvfX5h1M5BI4+DjSLUbvLKkb8oGPSbnpsgKvMXqwww
 2xTDG8xx4/6UkBSxjUyILPWc3g==
X-Google-Smtp-Source: APXvYqxf16jfI4PWFuQfP1SzhVSCENaGcFZsaIJmuk+kmUNxKp5vsSiHnYFfuy9hjZYQYk25mCDGDw==
X-Received: by 2002:a0c:b755:: with SMTP id q21mr8089505qve.92.1562961268072; 
 Fri, 12 Jul 2019 12:54:28 -0700 (PDT)
Received: from dhcp-10-20-1-11.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id c5sm3663279qta.5.2019.07.12.12.54.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 12 Jul 2019 12:54:27 -0700 (PDT)
Message-ID: <e2aeb1c57661bbc4e7cb7f464737189d842cdc1c.camel@redhat.com>
Subject: Re: [PATCH 08/10] drm/nouveau/kms/nv50: Implement MST Aux device
 registration
From: Lyude Paul <lyude@redhat.com>
To: sunpeng.li@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Fri, 12 Jul 2019 15:54:26 -0400
In-Reply-To: <20190704190519.29525-9-sunpeng.li@amd.com>
References: <20190704190519.29525-1-sunpeng.li@amd.com>
 <20190704190519.29525-9-sunpeng.li@amd.com>
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGF0Y2ggbG9va3MgZmluZSB0byBtZSwgYnV0IEknbSBzZWVpbmcgdGhlIHNhbWUgd2FybmluZ3Mg
dGhhdCBJIG1lbnRpb25lZCBvbgpwYXRjaCA3IHdpdGggdGhpcyBhcyB3ZWxsCgpPbiBUaHUsIDIw
MTktMDctMDQgYXQgMTU6MDUgLTA0MDAsIHN1bnBlbmcubGlAYW1kLmNvbSB3cm90ZToKPiBGcm9t
OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KPiAKPiBJbXBsZW1lbnQgbGF0ZV9yZWdpc3Rl
ciBhbmQgZWFybHlfdW5yZWdpc3RlciBob29rcyBmb3IgTVNUIGNvbm5lY3RvcnMuCj4gQ2FsbCBk
cm0gaGVscGVycyBmb3IgTVNUIGNvbm5lY3RvciByZWdpc3RyYXRpb24sIHdoaWNoIHJlZ2lzdGVy
cyB0aGUKPiBBVVggZGV2aWNlcy4KPiAKPiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQu
Y29tPgo+IFNpZ25lZC1vZmYtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMgfCAyMCArKysrKysrKysr
KysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKPiBiL2RyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYwo+IGluZGV4IDdiYTM3M2Y0OTNiMi4u
NmQwZmJiNjAzNmNmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3Bu
djUwL2Rpc3AuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3Au
Ywo+IEBAIC0xMDE5LDYgKzEwMTksMjQgQEAgbnY1MF9tc3RjX2Rlc3Ryb3koc3RydWN0IGRybV9j
b25uZWN0b3IgKmNvbm5lY3RvcikKPiAgCWtmcmVlKG1zdGMpOwo+ICB9Cj4gIAo+ICtzdGF0aWMg
aW50Cj4gK252NTBfbXN0Y19sYXRlX3JlZ2lzdGVyKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25u
ZWN0b3IpCj4gK3sKPiArCXN0cnVjdCBudjUwX21zdGMgKm1zdGMgPSBudjUwX21zdGMoY29ubmVj
dG9yKTsKPiArCXN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQgPSBtc3RjLT5wb3J0Owo+ICsK
PiArCXJldHVybiBkcm1fZHBfbXN0X2Nvbm5lY3Rvcl9sYXRlX3JlZ2lzdGVyKGNvbm5lY3Rvciwg
cG9ydCk7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkCj4gK252NTBfbXN0Y19lYXJseV91bnJlZ2lz
dGVyKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCj4gK3sKPiArCXN0cnVjdCBudjUw
X21zdGMgKm1zdGMgPSBudjUwX21zdGMoY29ubmVjdG9yKTsKPiArCXN0cnVjdCBkcm1fZHBfbXN0
X3BvcnQgKnBvcnQgPSBtc3RjLT5wb3J0Owo+ICsKPiArCWRybV9kcF9tc3RfY29ubmVjdG9yX2Vh
cmx5X3VucmVnaXN0ZXIoY29ubmVjdG9yLCBwb3J0KTsKPiArfQo+ICsKPiAgc3RhdGljIGNvbnN0
IHN0cnVjdCBkcm1fY29ubmVjdG9yX2Z1bmNzCj4gIG52NTBfbXN0YyA9IHsKPiAgCS5yZXNldCA9
IG5vdXZlYXVfY29ubl9yZXNldCwKPiBAQCAtMTAyOSw2ICsxMDQ3LDggQEAgbnY1MF9tc3RjID0g
ewo+ICAJLmF0b21pY19kZXN0cm95X3N0YXRlID0gbm91dmVhdV9jb25uX2F0b21pY19kZXN0cm95
X3N0YXRlLAo+ICAJLmF0b21pY19zZXRfcHJvcGVydHkgPSBub3V2ZWF1X2Nvbm5fYXRvbWljX3Nl
dF9wcm9wZXJ0eSwKPiAgCS5hdG9taWNfZ2V0X3Byb3BlcnR5ID0gbm91dmVhdV9jb25uX2F0b21p
Y19nZXRfcHJvcGVydHksCj4gKwkubGF0ZV9yZWdpc3RlciA9IG52NTBfbXN0Y19sYXRlX3JlZ2lz
dGVyLAo+ICsJLmVhcmx5X3VucmVnaXN0ZXIgPSBudjUwX21zdGNfZWFybHlfdW5yZWdpc3RlciwK
PiAgfTsKPiAgCj4gIHN0YXRpYyBpbnQKLS0gCkNoZWVycywKCUx5dWRlIFBhdWwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
