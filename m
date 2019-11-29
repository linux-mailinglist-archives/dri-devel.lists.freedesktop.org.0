Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE8D10D9CA
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 19:57:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 191F66E968;
	Fri, 29 Nov 2019 18:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9BB6E968
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 18:57:43 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b18so36382556wrj.8
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 10:57:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=r3zLG8fZhsozmV0ZBtyrfzxE+wowMMqRY2578uzVUqc=;
 b=cvu1mV3Nax91pY1GcEj3monI/Umv+/VFxHGVpenyAx42TwG0kPviMHQ+0LX5yauBpk
 q9x68L06tSwn+UZsKavLKbJ1Db3Jzwmvh7m5Vt3M5sFLVt1YoYcEq0ybuL/wD4nhaOKe
 LsfWAi7y6TFsMbmN90vCbWSX5SssrIriI6pB0C6Sl1HWv4N5qnS/HTcNbd747Dz3E9vq
 q5anyeFfGKTCmmcPQ/ZkVPhysTu8jBIB74mEPYjzI0+FIoA/Mt/O1x1kJvWlkjcJb4pe
 LcpaFAP1Mg1jqU9uRWCq6Gvm8pwZOfyrMvGixNH35mHSD64ZAGltdJ1Ikk7Xm5mVuC6E
 +xaA==
X-Gm-Message-State: APjAAAX4Wz7Xa+E5giZnQGlWQt8RZbEhIM+pQzN/tx3SnDPFQderU6x8
 CeEPlEQZMwfrbeQmdqprL36Riw==
X-Google-Smtp-Source: APXvYqyn2afkCNDrigT38ICbqFj4z5i7T7sQYEvw4MzL0iTkAd79/YbgKRSOkwxaLLg8ogpc1bsTKQ==
X-Received: by 2002:adf:d842:: with SMTP id k2mr56243321wrl.163.1575053862435; 
 Fri, 29 Nov 2019 10:57:42 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id w188sm15480964wmg.32.2019.11.29.10.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 10:57:41 -0800 (PST)
Date: Fri, 29 Nov 2019 19:57:39 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/3] drm/todo: Add entry for fb funcs related cleanups
Message-ID: <20191129185739.GL624164@phenom.ffwll.local>
References: <20191127180035.416209-1-daniel.vetter@ffwll.ch>
 <20191127180035.416209-3-daniel.vetter@ffwll.ch>
 <39e84cfd-9a06-bfad-1cc0-030a71ad1c9c@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <39e84cfd-9a06-bfad-1cc0-030a71ad1c9c@suse.de>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=r3zLG8fZhsozmV0ZBtyrfzxE+wowMMqRY2578uzVUqc=;
 b=Zui4FHW4jX/LFQJeWN+3rJXRoYfKNLp8RPM4DZi7ChC1LkejuBR8JuB055C0Yx91no
 kO7Jah5dWYva3zkakTFdD+zITMbnIgO5KdMAj/hW75czHYmzKUmwOOo/02Jd+YuPlSA6
 wwFKhJW4WHcwU+mcg06/PFkzX0wpZTmReGy58=
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgMTA6MzQ6MTBBTSArMDEwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gSGkKPiAKPiBBbSAyNy4xMS4xOSB1bSAxOTowMCBzY2hyaWViIERhbmllbCBW
ZXR0ZXI6Cj4gPiBXZSdyZSBkb2luZyBhIGdyZWF0IGpvYiBmb3IgcmVhbGx5IHNpbXBsZSBkcml2
ZXJzIHJpZ2h0IG5vdywgYnV0IHN0aWxsCj4gPiBhIGxvdCBvZiBib2lsZXJwbGF0ZSBmb3IgdGhl
IGJpZ2dlciBvbmVzLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGludGVsLmNvbT4KPiAKPiBKdXN0IGEgc21hbGwgcmVtYXJrIGJlbG93LCBvdGhl
cndpc2UKPiAKPiBBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+Cj4gCj4gCj4gPiAtLS0KPiA+ICBEb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdCB8IDI2ICsr
KysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlv
bnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0IGIv
RG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QKPiA+IGluZGV4IDNlYzUwOTM4MWZjNS4uMmQ4NWYz
NzI4NGExIDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QKPiA+ICsr
KyBiL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0Cj4gPiBAQCAtMTgyLDYgKzE4MiwzMiBAQCBD
b250YWN0OiBNYWludGFpbmVyIG9mIHRoZSBkcml2ZXIgeW91IHBsYW4gdG8gY29udmVydAo+ID4g
IAo+ID4gIExldmVsOiBJbnRlcm1lZGlhdGUKPiA+ICAKPiA+ICtkcm1fZnJhbWVidWZmZXJfZnVu
Y3MgYW5kIGRybV9tb2RlX2NvbmZpZ19mdW5jcy5mYl9jcmVhdGUgY2xlYW51cAo+ID4gKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4gPiArCj4gPiArQSBsb3QgbW9yZSBkcml2ZXJzIGNvdWxkIGJlIHN3aXRjaGVkIG92ZXIg
dG8gdGhlIGRybV9nZW1fZnJhbWVidWZmZXIgaGVscGVycy4KPiA+ICtWYXJpb3VzIGhvbGQtdXBz
Ogo+ID4gKwo+ID4gKy0gTmVlZCB0byBzd2l0Y2ggb3ZlciB0byB0aGUgZ2VuZXJpYyBkaXJ0eSB0
cmFja2luZyBjb2RlIHVzaW5nCj4gPiArICBkcm1fYXRvbWljX2hlbHBlcl9kaXJ0eWZiIGZpcnN0
IChlLmcuIHF4bCkuCj4gPiArCj4gPiArLSBOZWVkIHRvIHN3aXRjaCB0byBkcm1fZmJkZXZfZ2Vu
ZXJpY19zZXR1cCgpLCBvdGhlcndpc2UgYSBsb3Qgb2YgdGhlIGN1c3RvbSBmYgo+ID4gKyAgc2V0
dXAgY29kZSBjYW4ndCBiZSBkZWxldGVkLgo+IAo+IEZyb20gd2hhdCBJIHJlbWVtYmVyLCBhbG1v
c3QgYWxsIG9mIHRoZSBvYnZpb3VzLCBsb3ctaGFuZ2luZyBmcnVpdHMgaGF2ZQo+IGJlZW4gcGlj
a2VkIGhlcmUuIFRoZSByZW1haW5pbmcgZmJkZXYgdXNlcnMgZWl0aGVyIGhhdmUgSFcgYWNjZWxl
cmF0aW9uCj4gKG5vdXZlYXUsIGdtYTUwMCksIG9yIHVzZSB0aGUgY2ZiIGRyYXdpbmcgZnVuY3Rp
b25zLgoKSSB0aGluayBhIGJ1bmNoIG9mIHRoZXNlIChmcm9tIHlvdSkgYXJlbid0IG1lcmdlZCB5
ZXQuIEknbGwgYWRkIGEgbm90ZQphYm91dCBzeXMgdnMgY2ZiLiBBYm91dCBnbWE1MDAvbm91dmVh
dSwgSSdtIGtpbmRhIHRlbXB0ZWQgdG8ganVzdCBkaXRjaAp0aGUgYWNjZWxlcmF0aW9uIC4uLiBi
dXQgbWF5YmUgc29tZW9uZSBjYXJlcywgZHVubm8uCgo+IFRoZSBUT0RPIGl0ZW0gc2hvdWxkIHBy
b2JhYmx5IG1lbnRpb24gdGhpcywgd2l0aCBzb21lIGFkdmlzZSB0byBkbyBzb21lCj4gZXh0cmEg
dGVzdGluZyBmb3IgY29tcGF0aWJpbGl0eSBvciBwZXJmb3JtYW5jZSBhZnRlciBtb3ZpbmcgdG8g
Z2VuZXJpYwo+IGZiZGV2LgoKVGVzdGluZyAoYXQgbGVhc3Qgb24geDg2KSB3b24ndCBjYXRjaCB0
aGUgY2ZiL3N5c2ZiIHN0dWZmLCBzaW5jZSBpdCdzCmV4YWN0bHkgdGhlIHNhbWUgYXNtIGluc3Ry
dWN0aW9ucyA6LS8gdGJoIEkgc3RpbGwgZG9uJ3Qga25vdyB3aGVyZSB0aGlzCmFjdHVhbGx5IG1h
a2VzIGEgZGlmZmVyZW5jZS4KLURhbmllbAoKPiAKPiBCZXN0IHJlZ2FyZHMKPiBUaG9tYXMKPiAK
PiA+ICsKPiA+ICstIE1hbnkgZHJpdmVycyB3cmFwIGRybV9nZW1fZmJfY3JlYXRlKCkgb25seSB0
byBjaGVjayBmb3IgdmFsaWQgZm9ybWF0cy4gRm9yCj4gPiArICBhdG9taWMgZHJpdmVycyB3ZSBj
b3VsZCBjaGVjayBmb3IgdmFsaWQgZm9ybWF0cyBieSBjYWxsaW5nCj4gPiArICBkcm1fcGxhbmVf
Y2hlY2tfcGl4ZWxfZm9ybWF0KCkgYWdhaW5zdCBhbGwgcGxhbmVzLCBhbmQgcGFzcyBpZiBhbnkg
cGxhbmUKPiA+ICsgIHN1cHBvcnRzIHRoZSBmb3JtYXQuIEZvciBub24tYXRvbWljIHRoYXQncyBu
b3QgcG9zc2libGUgc2luY2UgbGlrZSB0aGUgZm9ybWF0Cj4gPiArICBsaXN0IGZvciB0aGUgcHJp
bWFyeSBwbGFuZSBpcyBmYWtlIGFuZCB3ZSdkIHRoZXJlZm9yIHJlamVjdCB2YWxpZCBmb3JtYXRz
Lgo+ID4gKwo+ID4gKy0gTWFueSBkcml2ZXJzIHN1YmNsYXNzIGRybV9mcmFtZWJ1ZmZlciwgd2Un
ZCBuZWVkIGEgZW1iZWRkaW5nIGNvbXBhdGlibGUKPiA+ICsgIHZlcnNpb24gb2YgdGhlIHZhcmlv
cyBkcm1fZ2VtX2ZiX2NyZWF0ZSBmdW5jdGlvbnMuIE1heWJlIGNhbGxlZAo+ID4gKyAgZHJtX2dl
bV9mYl9jcmVhdGUvX3dpdGhfZGlydHkvX3dpdGhfZnVuY3MgYXMgbmVlZGVkLgo+ID4gKwo+ID4g
K0NvbnRhY3Q6IERhbmllbCBWZXR0ZXIKPiA+ICsKPiA+ICtMZXZlbDogSW50ZXJtZWRpYXRlCj4g
PiArCj4gPiAgQ2xlYW4gdXAgbW1hcCBmb3J3YXJkaW5nCj4gPiAgLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCj4gPiAgCj4gPiAKPiAKPiAtLSAKPiBUaG9tYXMgWmltbWVybWFubgo+IEdyYXBoaWNz
IERyaXZlciBEZXZlbG9wZXIKPiBTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgK
PiBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkKPiAoSFJCIDM2ODA5LCBB
RyBOw7xybmJlcmcpCj4gR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgo+IAoK
CgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9u
Cmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
