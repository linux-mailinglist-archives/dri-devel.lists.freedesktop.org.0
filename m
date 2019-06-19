Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 007CF4B68C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 12:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C516E36D;
	Wed, 19 Jun 2019 10:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8BB6E36D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 10:55:49 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id i11so26599010edq.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 03:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=XdKjQFlqc/Q5NG+TosVNuzBQ5q1pFNnMu9irob0Brm0=;
 b=nDWNX7fMHypbJA4NQiPWeoZt9W0oBAyyFZePoNui+wi+qPTAfpYj+UyQgwjFuOXZdD
 Yiyki1YVMc/ru6No8WP0LdCw+rK7gGxZPaNiOHcmvA9yckmtXKtt8gmqnHmDdf4PBcl0
 QEw/M/l+QD+OvEtDX9IkywQMHBvVJdVLTveLNTEZv/mjgY1Z1/f1A/TYith7xvkQrKVT
 jKWcNTsa7SIPaOTSX8IBk1Qz6fIbYdSbaHyDFIVRUQkxZFaKEZBV5YcncNNTjkMu8rbe
 OB0LxQjWkfqQlwhqe/PsLeiLLrZFXp8TGnu+nkQErCMJ84MfN6/yLwd1Vud8n8gba4MU
 mW5w==
X-Gm-Message-State: APjAAAXePNy/V+pKLner8AHe8nFt9jjIE+tYsi8bhlfmasDvGDFI1o3e
 H0kuSGRVM89Kvd2Z4qsxlIFtKbq6lOM=
X-Google-Smtp-Source: APXvYqxbjH7iT/XwqoXc7vNkC8vrzVel8iukb4rPT+Y5xARzuliTDpYTj3ZbNZYgkEs3Hvc6tZtY2A==
X-Received: by 2002:a05:6402:6cb:: with SMTP id
 n11mr17462574edy.101.1560941748065; 
 Wed, 19 Jun 2019 03:55:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id l50sm5687128edb.77.2019.06.19.03.55.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 03:55:47 -0700 (PDT)
Date: Wed, 19 Jun 2019 12:55:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 06/12] drm/virtio: drop no_wait argument from
 virtio_gpu_object_reserve
Message-ID: <20190619105543.GN12905@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20190619090420.6667-1-kraxel@redhat.com>
 <20190619090420.6667-7-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619090420.6667-7-kraxel@redhat.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=XdKjQFlqc/Q5NG+TosVNuzBQ5q1pFNnMu9irob0Brm0=;
 b=TG/JK0xKXjriwqgBw8cF41pSSLLme+TnHnULLKVFltVObM+DBW7ii5OQBU587ewcUL
 CekLOuXDtRbkH2jrQPgPrFxp6hh5nzpM/EndSk/C4/eNmNj/3t3FnYKFGwkks9eDwAWb
 XBruiYUUm9LC06kmZZ3Nc6S8HcC7B1c6XJ+ng=
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
 dri-devel@lists.freedesktop.org,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMTE6MDQ6MTRBTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBBbGwgY2FsbGVycyBwYXNzIG5vX3dhaXQgPSBmYWxzZS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KClJldmlld2VkLWJ5OiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oICAgfCA1ICsrLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS92
aXJ0aW8vdmlydGdwdV9nZW0uYyAgIHwgNCArKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8v
dmlydGdwdV9pb2N0bC5jIHwgNCArKy0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCA3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmly
dGlvL3ZpcnRncHVfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmgK
PiBpbmRleCAyY2Q5NjI1NmJhMzcuLjA2Y2MwZTk2MWRmNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmly
dGlvL3ZpcnRncHVfZHJ2LmgKPiBAQCAtMzk4LDEyICszOTgsMTEgQEAgc3RhdGljIGlubGluZSB1
NjQgdmlydGlvX2dwdV9vYmplY3RfbW1hcF9vZmZzZXQoc3RydWN0IHZpcnRpb19ncHVfb2JqZWN0
ICpibykKPiAgCXJldHVybiBkcm1fdm1hX25vZGVfb2Zmc2V0X2FkZHIoJmJvLT50Ym8udm1hX25v
ZGUpOwo+ICB9Cj4gIAo+IC1zdGF0aWMgaW5saW5lIGludCB2aXJ0aW9fZ3B1X29iamVjdF9yZXNl
cnZlKHN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdCAqYm8sCj4gLQkJCQkJIGJvb2wgbm9fd2FpdCkK
PiArc3RhdGljIGlubGluZSBpbnQgdmlydGlvX2dwdV9vYmplY3RfcmVzZXJ2ZShzdHJ1Y3Qgdmly
dGlvX2dwdV9vYmplY3QgKmJvKQo+ICB7Cj4gIAlpbnQgcjsKPiAgCj4gLQlyID0gdHRtX2JvX3Jl
c2VydmUoJmJvLT50Ym8sIHRydWUsIG5vX3dhaXQsIE5VTEwpOwo+ICsJciA9IHR0bV9ib19yZXNl
cnZlKCZiby0+dGJvLCB0cnVlLCBmYWxzZSwgTlVMTCk7Cj4gIAlpZiAodW5saWtlbHkociAhPSAw
KSkgewo+ICAJCWlmIChyICE9IC1FUkVTVEFSVFNZUykgewo+ICAJCQlzdHJ1Y3QgdmlydGlvX2dw
dV9kZXZpY2UgKnFkZXYgPQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3Zp
cnRncHVfZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZ2VtLmMKPiBpbmRl
eCAxZTQ5ZTA4ZGQ1NDUuLjljOWFkM2IxNDA4MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdmlydGlvL3ZpcnRncHVfZ2VtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3Zp
cnRncHVfZ2VtLmMKPiBAQCAtMTQwLDcgKzE0MCw3IEBAIGludCB2aXJ0aW9fZ3B1X2dlbV9vYmpl
Y3Rfb3BlbihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwKPiAgCWlmICghdmdkZXYtPmhhc192
aXJnbF8zZCkKPiAgCQlyZXR1cm4gMDsKPiAgCj4gLQlyID0gdmlydGlvX2dwdV9vYmplY3RfcmVz
ZXJ2ZShxb2JqLCBmYWxzZSk7Cj4gKwlyID0gdmlydGlvX2dwdV9vYmplY3RfcmVzZXJ2ZShxb2Jq
KTsKPiAgCWlmIChyKQo+ICAJCXJldHVybiByOwo+ICAKPiBAQCAtMTYxLDcgKzE2MSw3IEBAIHZv
aWQgdmlydGlvX2dwdV9nZW1fb2JqZWN0X2Nsb3NlKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2Jq
LAo+ICAJaWYgKCF2Z2Rldi0+aGFzX3ZpcmdsXzNkKQo+ICAJCXJldHVybjsKPiAgCj4gLQlyID0g
dmlydGlvX2dwdV9vYmplY3RfcmVzZXJ2ZShxb2JqLCBmYWxzZSk7Cj4gKwlyID0gdmlydGlvX2dw
dV9vYmplY3RfcmVzZXJ2ZShxb2JqKTsKPiAgCWlmIChyKQo+ICAJCXJldHVybjsKPiAgCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5jIGIvZHJpdmVy
cy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMKPiBpbmRleCAzMTNjNzcwZWEyYzUuLjVj
ZmZkMmU1NGMwNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVf
aW9jdGwuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5jCj4g
QEAgLTM3NSw3ICszNzUsNyBAQCBzdGF0aWMgaW50IHZpcnRpb19ncHVfdHJhbnNmZXJfZnJvbV9o
b3N0X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gIAo+ICAJcW9iaiA9IGdlbV90b192
aXJ0aW9fZ3B1X29iaihnb2JqKTsKPiAgCj4gLQlyZXQgPSB2aXJ0aW9fZ3B1X29iamVjdF9yZXNl
cnZlKHFvYmosIGZhbHNlKTsKPiArCXJldCA9IHZpcnRpb19ncHVfb2JqZWN0X3Jlc2VydmUocW9i
aik7Cj4gIAlpZiAocmV0KQo+ICAJCWdvdG8gb3V0Owo+ICAKPiBAQCAtNDI1LDcgKzQyNSw3IEBA
IHN0YXRpYyBpbnQgdmlydGlvX2dwdV90cmFuc2Zlcl90b19ob3N0X2lvY3RsKHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCj4gIAo+ICAJcW9iaiA9IGdlbV90b192aXJ0aW9fZ3B1
X29iaihnb2JqKTsKPiAgCj4gLQlyZXQgPSB2aXJ0aW9fZ3B1X29iamVjdF9yZXNlcnZlKHFvYmos
IGZhbHNlKTsKPiArCXJldCA9IHZpcnRpb19ncHVfb2JqZWN0X3Jlc2VydmUocW9iaik7Cj4gIAlp
ZiAocmV0KQo+ICAJCWdvdG8gb3V0Owo+ICAKPiAtLSAKPiAyLjE4LjEKPiAKCi0tIApEYW5pZWwg
VmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5m
ZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
