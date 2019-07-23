Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E98071F91
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD6EB6E391;
	Tue, 23 Jul 2019 18:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE556E37C;
 Tue, 23 Jul 2019 18:49:06 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id v19so39420072wmj.5;
 Tue, 23 Jul 2019 11:49:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=50RPD9GLsElecVaxEmMiICG57vQta+1Z/U/1fgFGurI=;
 b=fEoPEaNKOIqEEEA0BZgsZZAT5NDtlVUlkVBbE17fJQFU2Z3lxIWMORZBYvGB21WwI6
 kWh1yzz1+xMA9cZoBNiBYoHiC5LW7LrQLenz+GVZeH9hcxfVhqVxIaqZ5b/dMwOnpIw7
 dKjcaVIeRf5wDsYanfppFqmFQgViLiyK2jIeTd0hH8A8O1QGRTKtPrc/o8VvgERp30eV
 lDPxmcrQOMNvepYhMffM44Jebi/k0rYwNTECUhjBl1rv90XMAYYWLwkHlIMF2hAvupff
 pZPF17YoPvMo1PDWVQESVK3k3qHS+EKwkEnbdyKpYYPVK32GX9uOtRzAe3n5SmT+tun/
 VQEQ==
X-Gm-Message-State: APjAAAUSIXzAFssG45dz14y4uujy/KY3ZR0neJAXU5lIrw1bYFRIZ8j/
 vXrXgmRsdQibQh6TmF01d8ERJmqvgyHMryffB0M=
X-Google-Smtp-Source: APXvYqwfFCxzxMG4Rw0FkgyLPquRnXTJljFQ0apnOe1Uic6Ota67JuvnbXBpFbgYNAhVzHzyYRhqESyOM8sHO7spKkQ=
X-Received: by 2002:a1c:a1c5:: with SMTP id
 k188mr70227662wme.102.1563907745335; 
 Tue, 23 Jul 2019 11:49:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190723090421.27532-1-hslester96@gmail.com>
In-Reply-To: <20190723090421.27532-1-hslester96@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 23 Jul 2019 14:48:54 -0400
Message-ID: <CADnq5_P02i=5uBqTun1-CoX9hiHzYiJD3zGYGjnct+MAcpTs=w@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Use dev_get_drvdata
To: Chuhong Yuan <hslester96@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=50RPD9GLsElecVaxEmMiICG57vQta+1Z/U/1fgFGurI=;
 b=kngDeBL36QOC6g0JB7S6cR1lhpzLh4otWj87pagk/hSxoPfkAndr5cH4/zmDAli2AW
 cUoCnBxw+utC2sshc7SB2UL281hJy/Ti+dwzeOCuF40/ARDSPiEI/YDfhudVDoyhrZ0Z
 ZsPbtuXe8KQtx4Ez/0YtuX3NZBfXLXwZn7UlsTguuCPmsXA39d792G18XFG0n2yR7SNY
 BzkFr47/947Tfaz2eO/kaQsroOs1iFrBUKKai5hUv/1YCLKWHTRIBga747rT8oYtJH2E
 ChgD3vpjkhHdBdjwK158ckcINm4Zc/37GjZSN6UhYfLjv7J89ujaFKcr7u567HLut6/F
 WCnQ==
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgOTozNiBBTSBDaHVob25nIFl1YW4gPGhzbGVzdGVyOTZA
Z21haWwuY29tPiB3cm90ZToKPgo+IEluc3RlYWQgb2YgdXNpbmcgdG9fcGNpX2RldiArIHBjaV9n
ZXRfZHJ2ZGF0YSwKPiB1c2UgZGV2X2dldF9kcnZkYXRhIHRvIG1ha2UgY29kZSBzaW1wbGVyLgo+
Cj4gU2lnbmVkLW9mZi1ieTogQ2h1aG9uZyBZdWFuIDxoc2xlc3Rlcjk2QGdtYWlsLmNvbT4KCkFw
cGxpZWQuICB0aGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMyArLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4gaW5kZXggNGEyOWY3MjMzNGQwLi41MjRl
MWUxOTAxN2UgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtLmMKPiBAQCAtMjQyOCw4ICsyNDI4LDcgQEAgc3RhdGljIHNzaXplX3Qg
czNfZGVidWdfc3RvcmUoc3RydWN0IGRldmljZSAqZGV2aWNlLAo+ICB7Cj4gICAgICAgICBpbnQg
cmV0Owo+ICAgICAgICAgaW50IHMzX3N0YXRlOwo+IC0gICAgICAgc3RydWN0IHBjaV9kZXYgKnBk
ZXYgPSB0b19wY2lfZGV2KGRldmljZSk7Cj4gLSAgICAgICBzdHJ1Y3QgZHJtX2RldmljZSAqZHJt
X2RldiA9IHBjaV9nZXRfZHJ2ZGF0YShwZGV2KTsKPiArICAgICAgIHN0cnVjdCBkcm1fZGV2aWNl
ICpkcm1fZGV2ID0gZGV2X2dldF9kcnZkYXRhKGRldmljZSk7Cj4gICAgICAgICBzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiA9IGRybV9kZXYtPmRldl9wcml2YXRlOwo+Cj4gICAgICAgICByZXQg
PSBrc3RydG9pbnQoYnVmLCAwLCAmczNfc3RhdGUpOwo+IC0tCj4gMi4yMC4xCj4KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGlu
ZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
