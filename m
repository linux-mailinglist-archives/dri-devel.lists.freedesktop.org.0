Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C96DF10B4F8
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 19:00:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C956E3F7;
	Wed, 27 Nov 2019 18:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EFCA6E3F7
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 18:00:46 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id g7so7072194wrw.4
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 10:00:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3ZOZSGjuzwminPcDUMzMQQAJ/v0yGAVO3+XoBKIorZg=;
 b=MWsZUTW3nZvONw0cmfmFaEgLwhADAZU0kHzf2rLqrQs5F+vQqKfhU7/F26CsWnXEq1
 5f1LUffMdwmAoeFzFHNu+QBcnKoXrVwXvtuN5VW+Can/xWeUohfDfyig8gr0m7jW2FfW
 wtRrwJFKJ+62+0DVHtCIR3I7m18PWMD5hiAmlXqJF6qUDcj8M8PTJnmglrgltCZlwaez
 DwI7ni8fetL7df+mbL8rkuP+pTfLqRnix+5BAdKhM4PpLqX0Wx7/rk/OTaF6/amijhna
 zsC5XuHT05lWACovuto7hDYhZHIP/MOAkMOPZW8IX9bncUbd/jhNxg//TxiBe6+C2wnh
 rC0w==
X-Gm-Message-State: APjAAAXG5IP+N1O1l8t9z5SGI+aMgaIQ1kXoAQ9xlw5r69W2qF9nRl9d
 RRHIrw/LeJaVrPN90Ral6FMYFmvJmhI=
X-Google-Smtp-Source: APXvYqz7WDFLKVaLfe7eih18FFnTmzJKAxll8nEf1GdEAP+oWgbVsbBmfhDIAc6cY1yjLE4vdtBJOA==
X-Received: by 2002:adf:f108:: with SMTP id r8mr13133930wro.390.1574877644366; 
 Wed, 27 Nov 2019 10:00:44 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id m15sm19940165wrq.97.2019.11.27.10.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2019 10:00:43 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/todo: Add entry for fb funcs related cleanups
Date: Wed, 27 Nov 2019 19:00:35 +0100
Message-Id: <20191127180035.416209-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191127180035.416209-1-daniel.vetter@ffwll.ch>
References: <20191127180035.416209-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3ZOZSGjuzwminPcDUMzMQQAJ/v0yGAVO3+XoBKIorZg=;
 b=e73miz/9hCO/8cTztRKGo5AUCYh3Ia5sTywwyOxVOPM71RDTUFZ+bZJ8bsEfHmuVx6
 xI/YxxgF/tbIxgZFlVc1Xu+6/3gQJn9C1GV3axsI6qDQ1mEF3dnDz7E+Puxjyt5FmCGg
 32sCsyNCblUAOEnPAxjaNIb7FqcCWxwGhgt8Q=
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
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UncmUgZG9pbmcgYSBncmVhdCBqb2IgZm9yIHJlYWxseSBzaW1wbGUgZHJpdmVycyByaWdodCBu
b3csIGJ1dCBzdGlsbAphIGxvdCBvZiBib2lsZXJwbGF0ZSBmb3IgdGhlIGJpZ2dlciBvbmVzLgoK
U2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Ci0t
LQogRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QgfCAyNiArKysrKysrKysrKysrKysrKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2dwdS90b2RvLnJzdCBiL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0CmluZGV4
IDNlYzUwOTM4MWZjNS4uMmQ4NWYzNzI4NGExIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2dw
dS90b2RvLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdApAQCAtMTgyLDYgKzE4
MiwzMiBAQCBDb250YWN0OiBNYWludGFpbmVyIG9mIHRoZSBkcml2ZXIgeW91IHBsYW4gdG8gY29u
dmVydAogCiBMZXZlbDogSW50ZXJtZWRpYXRlCiAKK2RybV9mcmFtZWJ1ZmZlcl9mdW5jcyBhbmQg
ZHJtX21vZGVfY29uZmlnX2Z1bmNzLmZiX2NyZWF0ZSBjbGVhbnVwCistLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorCitBIGxv
dCBtb3JlIGRyaXZlcnMgY291bGQgYmUgc3dpdGNoZWQgb3ZlciB0byB0aGUgZHJtX2dlbV9mcmFt
ZWJ1ZmZlciBoZWxwZXJzLgorVmFyaW91cyBob2xkLXVwczoKKworLSBOZWVkIHRvIHN3aXRjaCBv
dmVyIHRvIHRoZSBnZW5lcmljIGRpcnR5IHRyYWNraW5nIGNvZGUgdXNpbmcKKyAgZHJtX2F0b21p
Y19oZWxwZXJfZGlydHlmYiBmaXJzdCAoZS5nLiBxeGwpLgorCistIE5lZWQgdG8gc3dpdGNoIHRv
IGRybV9mYmRldl9nZW5lcmljX3NldHVwKCksIG90aGVyd2lzZSBhIGxvdCBvZiB0aGUgY3VzdG9t
IGZiCisgIHNldHVwIGNvZGUgY2FuJ3QgYmUgZGVsZXRlZC4KKworLSBNYW55IGRyaXZlcnMgd3Jh
cCBkcm1fZ2VtX2ZiX2NyZWF0ZSgpIG9ubHkgdG8gY2hlY2sgZm9yIHZhbGlkIGZvcm1hdHMuIEZv
cgorICBhdG9taWMgZHJpdmVycyB3ZSBjb3VsZCBjaGVjayBmb3IgdmFsaWQgZm9ybWF0cyBieSBj
YWxsaW5nCisgIGRybV9wbGFuZV9jaGVja19waXhlbF9mb3JtYXQoKSBhZ2FpbnN0IGFsbCBwbGFu
ZXMsIGFuZCBwYXNzIGlmIGFueSBwbGFuZQorICBzdXBwb3J0cyB0aGUgZm9ybWF0LiBGb3Igbm9u
LWF0b21pYyB0aGF0J3Mgbm90IHBvc3NpYmxlIHNpbmNlIGxpa2UgdGhlIGZvcm1hdAorICBsaXN0
IGZvciB0aGUgcHJpbWFyeSBwbGFuZSBpcyBmYWtlIGFuZCB3ZSdkIHRoZXJlZm9yIHJlamVjdCB2
YWxpZCBmb3JtYXRzLgorCistIE1hbnkgZHJpdmVycyBzdWJjbGFzcyBkcm1fZnJhbWVidWZmZXIs
IHdlJ2QgbmVlZCBhIGVtYmVkZGluZyBjb21wYXRpYmxlCisgIHZlcnNpb24gb2YgdGhlIHZhcmlv
cyBkcm1fZ2VtX2ZiX2NyZWF0ZSBmdW5jdGlvbnMuIE1heWJlIGNhbGxlZAorICBkcm1fZ2VtX2Zi
X2NyZWF0ZS9fd2l0aF9kaXJ0eS9fd2l0aF9mdW5jcyBhcyBuZWVkZWQuCisKK0NvbnRhY3Q6IERh
bmllbCBWZXR0ZXIKKworTGV2ZWw6IEludGVybWVkaWF0ZQorCiBDbGVhbiB1cCBtbWFwIGZvcndh
cmRpbmcKIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogCi0tIAoyLjI0LjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
