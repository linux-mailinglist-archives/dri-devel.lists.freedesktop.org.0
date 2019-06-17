Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAF348521
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 16:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F0D8920C;
	Mon, 17 Jun 2019 14:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CFC58920C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 14:18:24 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id a14so16369006edv.12
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 07:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=255cRppfmUAELVuEBOpb3q7EnIYgii6r3uBAfeCWFHg=;
 b=K6E7YH0jS1nIgwGGscafgLwi8rIkekG+mDU1JGyo6Vb0I+QALBb60NwIg1aL1RoGlO
 UOWi6KtIc0mVRUqbAXdcQu9gOPda+ANK1EUdfKn0STmsbpu19Saaqrs5v/Xa+9xrwJc1
 APYPSMv31cj+RDQcIl+nYGl7SqMAmIwY4YiWVD6JcNJ9AE/RktM+2h95o0nt0neTnDhF
 KQZ3htD8nKMdfBNdyCILj0RoT5lJcUbGh4yDeGt9ZkIxmZ6usi9Hp32P9WTWinKKWR/q
 0zA3B+SYu0hvn7yIDBPH6YgCVLJDiwDgj+pL0Q3siaAjUn53r4k2ljMr6wEcfYUMFNEB
 h2Rg==
X-Gm-Message-State: APjAAAV4+iFf+pue+l6tirU3GjUD6BwxJes8P9nqFOS0q+FR13AaPczM
 Ez0PxkA4N7ISb2l1lOAOdDKnSw==
X-Google-Smtp-Source: APXvYqxDQv3y3Qn61R/NUrw/NJLZtfJcmIB9+oQ+MQzul0tqmu/Xxh75ou9bVBEZdpcSUMhFOByM5g==
X-Received: by 2002:a17:906:644c:: with SMTP id
 l12mr45333686ejn.199.1560781102836; 
 Mon, 17 Jun 2019 07:18:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id f3sm2186344ejc.15.2019.06.17.07.18.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 07:18:21 -0700 (PDT)
Date: Mon, 17 Jun 2019 16:18:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 4/4] drm/virtio: remove virtio_gpu_object_wait
Message-ID: <20190617141819.GH12905@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20190617111406.14765-1-kraxel@redhat.com>
 <20190617111406.14765-5-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617111406.14765-5-kraxel@redhat.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=255cRppfmUAELVuEBOpb3q7EnIYgii6r3uBAfeCWFHg=;
 b=QXZd0Hes9umi74jp07G814dRb7D+MKScfq/PvUjRyLM3zoC9fLVKkvWV5netvsA25k
 NUIsYDd14TDgOSfnvPb2WwyUPm83bP8nmQLJSaq/NYP2ZdXgIcMHoCO2X22RiLjgNXAc
 VYe43lVvPYBw1dig7MLt4yFnORiY0r9qeYQAM=
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

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDE6MTQ6MDZQTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBObyB1c2VycyBsZWZ0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4g
PGtyYXhlbEByZWRoYXQuY29tPgoKUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAZmZ3bGwuY2g+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVf
ZHJ2LmggICAgfCAgMSAtCj4gIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9vYmplY3Qu
YyB8IDEzIC0tLS0tLS0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNCBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oIGIv
ZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oCj4gaW5kZXggOWUyZDMwNjJiMDFk
Li4yY2Q5NjI1NmJhMzcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0
Z3B1X2Rydi5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oCj4g
QEAgLTM2NCw3ICszNjQsNiBAQCBpbnQgdmlydGlvX2dwdV9vYmplY3Rfa21hcChzdHJ1Y3Qgdmly
dGlvX2dwdV9vYmplY3QgKmJvKTsKPiAgaW50IHZpcnRpb19ncHVfb2JqZWN0X2dldF9zZ190YWJs
ZShzdHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2UgKnFkZXYsCj4gIAkJCQkgICBzdHJ1Y3QgdmlydGlv
X2dwdV9vYmplY3QgKmJvKTsKPiAgdm9pZCB2aXJ0aW9fZ3B1X29iamVjdF9mcmVlX3NnX3RhYmxl
KHN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdCAqYm8pOwo+IC1pbnQgdmlydGlvX2dwdV9vYmplY3Rf
d2FpdChzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3QgKmJvLCBib29sIG5vX3dhaXQpOwo+ICAKPiAg
LyogdmlydGdwdV9wcmltZS5jICovCj4gIHN0cnVjdCBzZ190YWJsZSAqdmlydGdwdV9nZW1fcHJp
bWVfZ2V0X3NnX3RhYmxlKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKTsKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVjdC5jIGIvZHJpdmVycy9ncHUv
ZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVjdC5jCj4gaW5kZXggMjQyNzY2ZDY0NGE3Li44MmJmYmY5
ODNmZDIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVj
dC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVjdC5jCj4gQEAg
LTIzMywxNiArMjMzLDMgQEAgdm9pZCB2aXJ0aW9fZ3B1X29iamVjdF9mcmVlX3NnX3RhYmxlKHN0
cnVjdCB2aXJ0aW9fZ3B1X29iamVjdCAqYm8pCj4gIAlrZnJlZShiby0+cGFnZXMpOwo+ICAJYm8t
PnBhZ2VzID0gTlVMTDsKPiAgfQo+IC0KPiAtaW50IHZpcnRpb19ncHVfb2JqZWN0X3dhaXQoc3Ry
dWN0IHZpcnRpb19ncHVfb2JqZWN0ICpibywgYm9vbCBub193YWl0KQo+IC17Cj4gLQlpbnQgcjsK
PiAtCj4gLQlyID0gdHRtX2JvX3Jlc2VydmUoJmJvLT50Ym8sIHRydWUsIG5vX3dhaXQsIE5VTEwp
Owo+IC0JaWYgKHVubGlrZWx5KHIgIT0gMCkpCj4gLQkJcmV0dXJuIHI7Cj4gLQlyID0gdHRtX2Jv
X3dhaXQoJmJvLT50Ym8sIHRydWUsIG5vX3dhaXQpOwo+IC0JdHRtX2JvX3VucmVzZXJ2ZSgmYm8t
PnRibyk7Cj4gLQlyZXR1cm4gcjsKPiAtfQo+IC0KPiAtLSAKPiAyLjE4LjEKPiAKCi0tIApEYW5p
ZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxv
Zy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
