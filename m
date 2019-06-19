Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E34B84B5AE
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 11:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D1E96E347;
	Wed, 19 Jun 2019 09:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213AB6E347
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 09:57:14 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id r12so24107475edo.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 02:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=OYUOBbihdDezrYIpc84bsimr033/fNxizTudReyy9GE=;
 b=EZcUhhcI62KoIZ8rJlOnbFQfA8ihRVe5HJX1qV7lhCfdBoD8skBsnnkIBYnA/LjAAo
 /zfbHiVAepFsdz8JvTVo5Nhqy1yzpboH2vLKAxtqMOadPEciiL0eFXZscy1Mv0oOCJlf
 nxoWDwBywlPCJbs+vTpM+6XE3LZQGVwywJNK7zfbznYIP1r3ZleRSuacQxJgqmxtAlgc
 2UMxENCWlV8UHWtlOzYQursxJ/1kdkUqQL8LRBz5IEpQVg5NaiTxlE8zvubR9c/GmqZj
 JaL4lopD0PoJkY0GzgSC1qvqTIlCgT+3ffBmCawg71oiWzWnVWXOtO0bftRo8FYOM6JK
 wdow==
X-Gm-Message-State: APjAAAVfSKfvIehHH0zSNxqp7fZ15jTOAZvx4v08HX6ElZafuNY7/SRG
 TfsauRgluRenCnG4pCfEpuLQQg==
X-Google-Smtp-Source: APXvYqxmuZBxDErDZLmU5QeCx1tL6e44prW1irGwG0kDOxQYTRxd1JoAqkmtlD6HogrJKkLq+7r1aQ==
X-Received: by 2002:a50:b7e2:: with SMTP id i31mr83477702ede.229.1560938232780; 
 Wed, 19 Jun 2019 02:57:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id e26sm3180489eje.29.2019.06.19.02.57.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 02:57:12 -0700 (PDT)
Date: Wed, 19 Jun 2019 11:57:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 07/12] drm/virtio: remove ttm calls from in
 virtio_gpu_object_{reserve,unreserve}
Message-ID: <20190619095708.GL12905@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20190619090420.6667-1-kraxel@redhat.com>
 <20190619090420.6667-8-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619090420.6667-8-kraxel@redhat.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=OYUOBbihdDezrYIpc84bsimr033/fNxizTudReyy9GE=;
 b=VooeCWO1OpfkqLQECa5vkxYQhv9QcgV0EEz4MtAZie/DQpFAzkLReYAKFordnWIKq2
 76y1DCcwaJOZMGb2KIbmbHVmjn2ZeqGGDGzFy8n7iIGwgAGZD/4OQpNyHxlqk/saUlUA
 Iu0+x1IlzIm74/Ap43c90NeDs0k6H3Sgq2zwI=
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

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMTE6MDQ6MTVBTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBDYWxsIHJlc2VydmF0aW9uX29iamVjdF8qIGRpcmVjdGx5IGluc3RlYWQKPiBvZiB1
c2luZyB0dG1fYm9fe3Jlc2VydmUsdW5yZXNlcnZlfS4KPiAKPiB2MzogY2hlY2sgZm9yIEVJTlRS
IHRvby4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNv
bT4KPiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4K
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oIHwgNiArKystLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oIGIvZHJpdmVy
cy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oCj4gaW5kZXggMDZjYzBlOTYxZGY2Li43N2Fj
NjlhOGU2Y2MgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Ry
di5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oCj4gQEAgLTQw
Miw5ICs0MDIsOSBAQCBzdGF0aWMgaW5saW5lIGludCB2aXJ0aW9fZ3B1X29iamVjdF9yZXNlcnZl
KHN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdCAqYm8pCj4gIHsKPiAgCWludCByOwo+ICAKPiAtCXIg
PSB0dG1fYm9fcmVzZXJ2ZSgmYm8tPnRibywgdHJ1ZSwgZmFsc2UsIE5VTEwpOwo+ICsJciA9IHJl
c2VydmF0aW9uX29iamVjdF9sb2NrX2ludGVycnVwdGlibGUoYm8tPmdlbV9iYXNlLnJlc3YsIE5V
TEwpOwo+ICAJaWYgKHVubGlrZWx5KHIgIT0gMCkpIHsKPiAtCQlpZiAociAhPSAtRVJFU1RBUlRT
WVMpIHsKPiArCQlpZiAociAhPSAtRVJFU1RBUlRTWVMgJiYgciAhPSAtRUlOVFIpIHsKCllvdSBv
bmx5IG5lZWQgdG8gY2hlY2sgZm9yIEVJTlRSIEkgdGhpbmsuIHR0bV9ib19yZXNlcnYgZG9lcyB0
aGUgRUlOVkFMIC0+CkVSRVNUQVJUU1lTIHJlbWFwcGluZy4KLURhbmllbAoKPiAgCQkJc3RydWN0
IHZpcnRpb19ncHVfZGV2aWNlICpxZGV2ID0KPiAgCQkJCWJvLT5nZW1fYmFzZS5kZXYtPmRldl9w
cml2YXRlOwo+ICAJCQlkZXZfZXJyKHFkZXYtPmRldiwgIiVwIHJlc2VydmUgZmFpbGVkXG4iLCBi
byk7Cj4gQEAgLTQxNiw3ICs0MTYsNyBAQCBzdGF0aWMgaW5saW5lIGludCB2aXJ0aW9fZ3B1X29i
amVjdF9yZXNlcnZlKHN0cnVjdCB2aXJ0aW9fZ3B1X29iamVjdCAqYm8pCj4gIAo+ICBzdGF0aWMg
aW5saW5lIHZvaWQgdmlydGlvX2dwdV9vYmplY3RfdW5yZXNlcnZlKHN0cnVjdCB2aXJ0aW9fZ3B1
X29iamVjdCAqYm8pCj4gIHsKPiAtCXR0bV9ib191bnJlc2VydmUoJmJvLT50Ym8pOwo+ICsJcmVz
ZXJ2YXRpb25fb2JqZWN0X3VubG9jayhiby0+Z2VtX2Jhc2UucmVzdik7Cj4gIH0KPiAgCj4gIC8q
IHZpcmdsIGRlYnVmcyAqLwo+IC0tIAo+IDIuMTguMQo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29m
dHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
