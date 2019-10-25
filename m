Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A92A3E449A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 09:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4B089CA8;
	Fri, 25 Oct 2019 07:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B3489CF3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 07:35:35 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id t16so1106893wrr.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 00:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=bdYhkIPgmROuGN/I1TGKOIOaM7yWzKPyDdVFb9E42Pw=;
 b=W1IX09XyGtaFodg8kz3ytRdFgPr2GDtyv1Z6NvVygQZ/C9FcAPx4QU4blgeGgfSmDm
 OmqxIcFVvolHN9Xn5ZqAQ8szjs9fLblPyMBX9YyJq6EnV4N1Yvb+nIJQ/yq97kvfKl59
 GQKDLIaetTa65GgjZ0oC2wL32KsS2qkWfgRw+mnk0ZtP3yggAcsp4gIyoFaYDNYcHsim
 zMF984ck8u3phRwM06mlfuHzMgW6tDW3m7Okc82B2OY4qMmik4g2GdxJ4fzNuVzJzgMd
 /2jDaIcLY+tQAPP6qURK7ERg/BFlfrAdBIcnMShHdxAyvAl96h3Ww1o+5hoe6V/zaTx6
 bzjg==
X-Gm-Message-State: APjAAAWCb52Y0qsKCmgNOoxaKUDneE/T7PPfUuyLpbwAKoV+beztXE9p
 XlHZZdjyQV+niw6+BnOLdN2BWQ==
X-Google-Smtp-Source: APXvYqwpAL6Tl0psM1D+ggxeA05vRR6v95PHa9mZoxI6r2vMVfQ720E7IDBrxITK/k3+X6ujJxDnOA==
X-Received: by 2002:adf:f746:: with SMTP id z6mr1444028wrp.238.1571988933598; 
 Fri, 25 Oct 2019 00:35:33 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id 65sm2439129wrs.9.2019.10.25.00.35.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 00:35:32 -0700 (PDT)
Date: Fri, 25 Oct 2019 09:35:31 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Bhanusree <bhanusreemahesh@gmail.com>
Subject: Re: [PATCH 2/2] drm/gpu: Fix Memory barrier without comment Issue
Message-ID: <20191025073530.GO11828@phenom.ffwll.local>
References: <1571984858-4644-1-git-send-email-bhanusreemahesh@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1571984858-4644-1-git-send-email-bhanusreemahesh@gmail.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bdYhkIPgmROuGN/I1TGKOIOaM7yWzKPyDdVFb9E42Pw=;
 b=hc1OjBih6PfykNinoKwvvofKYy5QNpeLwFe6REHyB4367GuQmqkgUFdEwFsmZq6AFv
 GWKbjANzyGYPyCkepI9/H5rDk41zad0LDFZurpxYLPy46kSwO60hivTckatgMdkzxbdK
 hjB9fdYbUXaovknBOuZ996SvuSNphXTqm6xZU=
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgMTE6NTc6MzhBTSArMDUzMCwgQmhhbnVzcmVlIHdyb3Rl
Ogo+IC1Jc3N1ZSBmb3VuZCB1c2luZyBjaGVja3BhdGNoLnBsCj4gLUluc2VydCBjb21tZW50cyBm
b3IgbWVtb3J5IGJhcnJpZXIgdXNhZ2UKPiAKPiBTaWduZWQtb2ZmLWJ5OiBCaGFudXNyZWUgPGJo
YW51c3JlZW1haGVzaEBnbWFpbC5jb20+CgpUaGFua3MgZm9yIHlvdXIgcGF0Y2gsIGFwcGxpZWQu
Ci1EYW5pZWwKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fY2FjaGUuYyB8IDggKysrKy0t
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9jYWNoZS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9jYWNoZS5jCj4gaW5kZXggMTJmOGQxYi4uMDNlMDFiMCAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2NhY2hlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nh
Y2hlLmMKPiBAQCAtMTI2LDEwICsxMjYsMTAgQEAgZHJtX2NsZmx1c2hfc2coc3RydWN0IHNnX3Rh
YmxlICpzdCkKPiAgCWlmIChzdGF0aWNfY3B1X2hhcyhYODZfRkVBVFVSRV9DTEZMVVNIKSkgewo+
ICAJCXN0cnVjdCBzZ19wYWdlX2l0ZXIgc2dfaXRlcjsKPiAgCj4gLQkJbWIoKTsKPiArCQltYigp
OyAvKkNMRkxVU0ggaXMgb3JkZXJlZCBvbmx5IGJ5IHVzaW5nIG1lbW9yeSBiYXJyaWVycyovCj4g
IAkJZm9yX2VhY2hfc2dfcGFnZShzdC0+c2dsLCAmc2dfaXRlciwgc3QtPm5lbnRzLCAwKQo+ICAJ
CQlkcm1fY2xmbHVzaF9wYWdlKHNnX3BhZ2VfaXRlcl9wYWdlKCZzZ19pdGVyKSk7Cj4gLQkJbWIo
KTsKPiArCQltYigpOyAvKk1ha2Ugc3VyZSB0aGF0IGFsbCBjYWNoZSBsaW5lIGVudHJ5IGlzIGZs
dXNoZWQqLwo+ICAKPiAgCQlyZXR1cm47Cj4gIAl9Cj4gQEAgLTE2MCwxMSArMTYwLDExIEBAIGRy
bV9jbGZsdXNoX3ZpcnRfcmFuZ2Uodm9pZCAqYWRkciwgdW5zaWduZWQgbG9uZyBsZW5ndGgpCj4g
IAkJdm9pZCAqZW5kID0gYWRkciArIGxlbmd0aDsKPiAgCj4gIAkJYWRkciA9ICh2b2lkICopKCgo
dW5zaWduZWQgbG9uZylhZGRyKSAmIC1zaXplKTsKPiAtCQltYigpOwo+ICsJCW1iKCk7IC8qQ0xG
TFVTSCBpcyBvbmx5IG9yZGVyZWQgd2l0aCBhIGZ1bGwgbWVtb3J5IGJhcnJpZXIqLwo+ICAJCWZv
ciAoOyBhZGRyIDwgZW5kOyBhZGRyICs9IHNpemUpCj4gIAkJCWNsZmx1c2hvcHQoYWRkcik7Cj4g
IAkJY2xmbHVzaG9wdChlbmQgLSAxKTsgLyogZm9yY2Ugc2VyaWFsaXNhdGlvbiAqLwo+IC0JCW1i
KCk7Cj4gKwkJbWIoKTsgLypFbnN1cmUgdGhhdCBldnJ5IGRhdGEgY2FjaGUgbGluZSBlbnRyeSBp
cyBmbHVzaGVkKi8KPiAgCQlyZXR1cm47Cj4gIAl9Cj4gIAo+IC0tIAo+IDIuNy40Cj4gCgotLSAK
RGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDov
L2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
