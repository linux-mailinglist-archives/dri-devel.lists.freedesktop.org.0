Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D323B15FF
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 23:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A51E6EE36;
	Thu, 12 Sep 2019 21:46:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBAFE6EE36
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 21:46:39 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id n197so58488309iod.9
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 14:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NiZR+n54kDStyi7gn0TCODjC223CXySNQ4QzYgLQl3E=;
 b=TbiKPruxEVisGHOdXcJXqjN7Fq05Eb+T7RkNonLvy9VR7zB3FQ24vCQ2ivqEUVugqt
 /25xCAg/lQ8WysT/HtJqvF6T/hHFQLejq/g5j3534VwvSyS6AqXKDv6ZgqlIi3za9sU6
 y2V/GbJmYqxQqnqlnz83VNsGwuEPTOyTY1EjEPV1hsMR02cJZ7vFnB/PvxHJ8zEkiW5+
 4jzXXp1ZB0XFamUvo4DTs8R85uAy2LAqlkD08zobnWKqfyUBWqR7Q8xRSerK1lcaMb+x
 nWNAQCEdIwjfRLXJHLhZUSSRIoUsDG690Zpcilqv6vT5yr7atd2OCkXN0fDCppeDhsBW
 wtpw==
X-Gm-Message-State: APjAAAUWP1eg2l4xuQ85oir6lapJKDqa8scfOQ/rt5rgigx7SwSxPAqy
 pgwkGce6ppi0ZeBw5l+YHthY/2zzGSyt1AI8FqM=
X-Google-Smtp-Source: APXvYqwqasiwTqwYl+8S+TBPDrRVZlt18xiMscbny/PfY5KKeZ1UqdHopMngv1Rw1ZsObWSeAn5PZ/2D1YWLRXpqDr4=
X-Received: by 2002:a5e:c107:: with SMTP id v7mr7363007iol.200.1568324799015; 
 Thu, 12 Sep 2019 14:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190912160048.212495-1-davidriley@chromium.org>
In-Reply-To: <20190912160048.212495-1-davidriley@chromium.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 12 Sep 2019 14:46:28 -0700
Message-ID: <CAPaKu7RcJC-rZiYhqGeLeyu45ML6ymiycmWA+RjOq02u=PsK9Q@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: Fix warning in
 virtio_gpu_queue_fenced_ctrl_buffer.
To: David Riley <davidriley@chromium.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=NiZR+n54kDStyi7gn0TCODjC223CXySNQ4QzYgLQl3E=;
 b=Au3S9WcEiw57y0AQRAbf5wuFCqoJIe+2VdZsVE2e6s0BHIIrx52K8kYnnAq0xDT++b
 v6LLSRBThw+1+gBkPcOsZ7X/tXgQkVNqloLOuoS/iG8Apn+JURt/X7lsT7ViS6a6kYwa
 KkUTSZvehBh9c+dFRz0QcX/OZRDVgwkPGwM/MkpXEjGBIyRuQw4iBQVdXXJVnUqkMNto
 42z1NOEIfhoPm5DyAtr/8kU0T1wE0NfTUZGtMVQrtF0gzxsja0j30OWxvu2BpP89jpDJ
 Jh+1PcmSRNYP1sWMCnhLRnypbEPhggXBpW0nH8G1CaEbXJ+OkS0abuEs2iUbUfR1j9YS
 vg7w==
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, "open list:VIRTIO CORE,
 NET AND BLOCK DRIVERS" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTIsIDIwMTkgYXQgOTowMCBBTSBEYXZpZCBSaWxleSA8ZGF2aWRyaWxleUBj
aHJvbWl1bS5vcmc+IHdyb3RlOgo+Cj4gRml4IHdhcm5pbmcgaW50cm9kdWNlZCB3aXRoIGNvbW1p
dCBlMTIxOGI4YzBjYzEKPiAoImRybS92aXJ0aW86IFVzZSB2bWFsbG9jIGZvciBjb21tYW5kIGJ1
ZmZlciBhbGxvY2F0aW9ucy4iKQo+IGZyb20gZHJtLW1pc2MtbmV4dC4KPgo+IFNpZ25lZC1vZmYt
Ynk6IERhdmlkIFJpbGV5IDxkYXZpZHJpbGV5QGNocm9taXVtLm9yZz4KUmV2aWV3ZWQtYnk6IENo
aWEtSSBXdSA8b2x2YWZmZUBnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS92aXJ0
aW8vdmlydGdwdV92cS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3Zp
cnRncHVfdnEuYyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV92cS5jCj4gaW5kZXgg
OWY5Yjc4MmRkMzMyLi44MDE3NmYzNzlhZDUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3ZpcnRpby92aXJ0Z3B1X3ZxLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRn
cHVfdnEuYwo+IEBAIC0zNTgsNyArMzU4LDcgQEAgc3RhdGljIHZvaWQgdmlydGlvX2dwdV9xdWV1
ZV9mZW5jZWRfY3RybF9idWZmZXIoc3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICp2Z2RldiwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICBzZ3QgPSB2bWFsbG9jX3RvX3NndCh2YnVmLT5kYXRhX2J1
ZiwgdmJ1Zi0+ZGF0YV9zaXplLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICZvdXRjbnQpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIGlmICghc2d0KQo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm47Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgdm91dCA9IHNndC0+c2dsOwo+ICAgICAgICAgICAgICAgICB9IGVsc2Ugewo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIHNnX2luaXRfb25lKCZzZywgdmJ1Zi0+ZGF0YV9idWYsIHZidWYtPmRh
dGFfc2l6ZSk7Cj4gLS0KPiAyLjIzLjAuMTYyLmcwYjlmYmIzNzM0LWdvb2cKPgo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxp
bmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
