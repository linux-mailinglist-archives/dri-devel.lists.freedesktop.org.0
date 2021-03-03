Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2BA32B967
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 18:19:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A131089F07;
	Wed,  3 Mar 2021 17:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1576B89F07
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 17:19:33 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id b8so24258151oti.7
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 09:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MEEZCHPrREQ5j+/PgryFwsgP/VEIZMvarMnKwKn+uQM=;
 b=ZDvlp8WWBR/9ql+VsAOQLUFOrDN7IUOkU6q3KE0uOQAagdsCiR2Y6bD7Vx4CrN/ovU
 kokfXJhOaUCPyVDGW2wPPDMp19xjRobEJpy6mnRdaPXnCe0Nx2h5eGTnXs7F9gSB7pkO
 1DnP0ITxdzyYEkHHhT1Koa7BRZlTt5hEwlWuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MEEZCHPrREQ5j+/PgryFwsgP/VEIZMvarMnKwKn+uQM=;
 b=EzXX0PSEJ/+dYpi0YilyJR7Cv5iyaqfEISMIe6ZN/yPzfVXrc8D6GTQxhus6mP7vQP
 pe3HJvJQlGAk0lQyzq12/dXWaFpOwFj+jMqH78D4vqw14GaqrdaIRQoZo80J7zEQU4OP
 i9ItNjLRISMbznNEC34VqIGfAS9HkeQ3lESEq4Nb2A+Qxluds39RWhGNlFmdObQpKKeG
 kRMQXyKxCtYod4UYczQKZzOfDM2OSzhLq8mB0sbmLefHYhJwToKOratdlRmK7+XGf/yZ
 OujFRs9Y+ZA9/j+lTlnTDpMovkHvcE0q+Ey3dJifhKrJUJ6de7AQrp7ReL23t71kvIw7
 Z+RA==
X-Gm-Message-State: AOAM531/F4Yxk7ugh5d9fY06sjnpZWIIL5oohoZjdrBQ4TbyNxXqvVA8
 sbUluIGwLAlEmMa0pbt7CZTHWU8eoS+tjitkw/mx8yfLnk4=
X-Google-Smtp-Source: ABdhPJy7vnAJKFNOpXt4a+UPYmwabAEBfc9+T/A7VKEhilkdokZncso4VNdwtXy8mGCH4nyzbbKSXiE2+CKggP7BaT8=
X-Received: by 2002:a9d:6481:: with SMTP id g1mr24998otl.303.1614791972207;
 Wed, 03 Mar 2021 09:19:32 -0800 (PST)
MIME-Version: 1.0
References: <20210303155757.82497-1-christian.koenig@amd.com>
In-Reply-To: <20210303155757.82497-1-christian.koenig@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 3 Mar 2021 18:19:21 +0100
Message-ID: <CAKMK7uFgCxZeX3bPzfStdX0LMXc2MVTAZTY_jLJ66k+=Qnvgng@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: soften TTM warnings
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXIgMywgMjAyMSBhdCA0OjU3IFBNIENocmlzdGlhbiBLw7ZuaWcKPGNrb2VuaWcu
bGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPgo+IFFYTCBpbmRlZWQgdW5yZWZzIHBp
bm5lZCBCT3MgYW5kIHRoZSB3YXJuaW5ncyBhcmUgc3BhbW1pbmcgcGVvcGxlcyBsb2cgZmlsZXMu
Cj4KPiBNYWtlIHN1cmUgd2Ugd2FybiBvbmx5IG9uY2UgdW50aWwgdGhlIFFYTCBkcml2ZXIgaXMg
Zml4ZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+CgpDYW4geW91IHBscyBhZGQgRklYTUUgY29tbWVudHMgdG8gZWFjaCB0aGF0
IHF4bCBpcyBicm9rZW4gYW5kIG5lZWRzIHRvCmJlIGZpeGVkIGZpcnN0PyBBbHNvIHBsZWFzZSBh
ZGQgYSBSZWZlcmVuY2VzOiBsaW5rIHRvIHRoZSBidWcgcmVwb3J0Cm9uIGxvcmUua2VybmVsLm9y
ZyBvciB3aGVyZXZlciBpdCB3YXMuCgpXaXRoIHRoYXQ6IHItYjogbWUKLURhbmllbAoKPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyB8IDUgKysrLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+
IGluZGV4IDIwYTI1NjYwYjM1Yi4uMjQ1ZmEyYzA1OTI3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5j
Cj4gQEAgLTEzNiw3ICsxMzYsOCBAQCB2b2lkIHR0bV9ib19tb3ZlX3RvX2xydV90YWlsKHN0cnVj
dCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4gICAgICAgICBzdHJ1Y3QgdHRtX2JvX2RldmljZSAq
YmRldiA9IGJvLT5iZGV2Owo+ICAgICAgICAgc3RydWN0IHR0bV9yZXNvdXJjZV9tYW5hZ2VyICpt
YW47Cj4KPiAtICAgICAgIGRtYV9yZXN2X2Fzc2VydF9oZWxkKGJvLT5iYXNlLnJlc3YpOwo+ICsg
ICAgICAgaWYgKCFiby0+ZGVsZXRlZCkKPiArICAgICAgICAgICAgICAgZG1hX3Jlc3ZfYXNzZXJ0
X2hlbGQoYm8tPmJhc2UucmVzdik7Cj4KPiAgICAgICAgIGlmIChiby0+cGluX2NvdW50KSB7Cj4g
ICAgICAgICAgICAgICAgIHR0bV9ib19kZWxfZnJvbV9scnUoYm8pOwo+IEBAIC01MDksNyArNTEw
LDcgQEAgc3RhdGljIHZvaWQgdHRtX2JvX3JlbGVhc2Uoc3RydWN0IGtyZWYgKmtyZWYpCj4gICAg
ICAgICAgICAgICAgICAqIHNocmlua2Vycywgbm93IHRoYXQgdGhleSBhcmUgcXVldWVkIGZvcgo+
ICAgICAgICAgICAgICAgICAgKiBkZXN0cnVjdGlvbi4KPiAgICAgICAgICAgICAgICAgICovCj4g
LSAgICAgICAgICAgICAgIGlmIChXQVJOX09OKGJvLT5waW5fY291bnQpKSB7Cj4gKyAgICAgICAg
ICAgICAgIGlmIChXQVJOX09OX09OQ0UoYm8tPnBpbl9jb3VudCkpIHsKPiAgICAgICAgICAgICAg
ICAgICAgICAgICBiby0+cGluX2NvdW50ID0gMDsKPiAgICAgICAgICAgICAgICAgICAgICAgICB0
dG1fYm9fbW92ZV90b19scnVfdGFpbChibywgJmJvLT5tZW0sIE5VTEwpOwo+ICAgICAgICAgICAg
ICAgICB9Cj4gLS0KPiAyLjI1LjEKPgoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2lu
ZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
