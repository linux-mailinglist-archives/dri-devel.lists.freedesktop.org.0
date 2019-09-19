Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A1FB7F5C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 18:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295BA6F538;
	Thu, 19 Sep 2019 16:50:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 220236F7FF;
 Thu, 19 Sep 2019 16:50:01 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f16so4772939wmb.2;
 Thu, 19 Sep 2019 09:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4LM0Yvzz4kDc9ho3QFMhZnWDRFXnLDKd2ypltfYClCA=;
 b=unNyoK9EYV+XWlNW+WDp0+C9C9jEoIu18FKOtsCSZTS2J9vWC6AcaxtRZzyhSTMuw5
 da+iKbryiJ6ybrN7lI6K4ctQxDg8tJaHVsFaXIMoP5RNspaNDrQoeId22416u5OhkyQ7
 m1n6H+yVIVffpCEIN+YADm+0IMOZLP7Dr3uHeZIKkKX4onumTCAxNBIAvcl3JBwkK36o
 jSUX39oI4Guw3IVOanm1gs3PdfzY+Rysr5TlYrZX9Z5G4VMxaOCSp2TrYWF61tNnM9SR
 mM+/3jnz7d6CGRlUwGVt5XjEaD07wuf335oquvoiNvKo0iWWx8VfqvAe6K0YUmTjjfQS
 f73Q==
X-Gm-Message-State: APjAAAWeDnX6jzozxclmRcNQo7OjP7D8y5MTv+olgOYgR4cKQx4bb1e4
 j1xD1BuFaJKWgn7n9HOPSCuDeiMaUyf4E4RH3uA=
X-Google-Smtp-Source: APXvYqxiQp41vQ3dSqfJVbSnzcBZafnBS4DTNbqx7SWWfGlzAFK+ND5rgYf9T8z46BGsmpbcCoXDBzpa+yKbWbaTrq0=
X-Received: by 2002:a05:600c:54a:: with SMTP id
 k10mr1014581wmc.127.1568911799607; 
 Thu, 19 Sep 2019 09:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190918195418.2042610-1-arnd@arndb.de>
 <73842ec4-2767-c918-6ede-d05ff653255c@amd.com>
In-Reply-To: <73842ec4-2767-c918-6ede-d05ff653255c@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 19 Sep 2019 12:49:47 -0400
Message-ID: <CADnq5_OnhBx_cCHNNQcWkd1SosSfdF9jXYpoE-iYSuZbsVOicQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: hide an unused variable
To: Harry Wentland <hwentlan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=4LM0Yvzz4kDc9ho3QFMhZnWDRFXnLDKd2ypltfYClCA=;
 b=lZfE6hm9NGJZF9rboafGqjYFm2jya+goGEzsq56iSqVmtNG6NM0I644NaQXe0NQ/TI
 1BPTxrVeVUH+78BoSVtZau4sIetT3TUBmxX+eOsNepYEK0BTS7d+i8UM1TRPeSc++35S
 kYSOcqe9uPOGqywe5O9mNDvPprMazSR1ju9/XjusfrvB+V7irqmrOp88RyDaBnx+ljrT
 dYs4zdDQIGLVR2SRIJHfB+/x/9x+UlhtEir3LgRK3Fas2+a+WfFSVEs5GLBWpNjfHQGE
 W9iouVZQG5qYgMAnjrotyqNP1Qbm8eYpLaWcf4cnEPAs5qKPwnxAqCoBImCXwY9U0NOY
 tCWQ==
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
Cc: "Zhang, Dingchen \(David\)" <Dingchen.Zhang@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "Francis, David" <David.Francis@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTksIDIwMTkgYXQgOTo0NSBBTSBIYXJyeSBXZW50bGFuZCA8aHdlbnRsYW5A
YW1kLmNvbT4gd3JvdGU6Cj4KPiBPbiAyMDE5LTA5LTE4IDM6NTMgcC5tLiwgQXJuZCBCZXJnbWFu
biB3cm90ZToKPiA+IFdpdGhvdXQgQ09ORklHX0RFQlVHX0ZTLCB3ZSBnZXQgYSB3YXJuaW5nIGZv
ciBhbiB1bnVzZWQKPiA+IHZhcmlhYmxlOgo+ID4KPiA+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1Ly4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jOjYwMjA6MzM6IGVycm9yOiB1bnVz
ZWQgdmFyaWFibGUgJ3NvdXJjZScgWy1XZXJyb3IsLVd1bnVzZWQtdmFyaWFibGVdCj4gPgo+ID4g
SGlkZSB0aGUgdmFyaWFibGUgaW4gYW4gI2lmZGVmIGxpa2UgaXRzIG9ubHkgdXNlcnMuCj4gPgo+
ID4gRml4ZXM6IDE0YjI1ODQ2MzZjNiAoImRybS9hbWQvZGlzcGxheTogYWRkIGZ1bmN0aW9uYWxp
dHkgdG8gZ3JhYiBEUFJYIENSQyBlbnRyaWVzLiIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJl
cmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+Cj4gUmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxo
YXJyeS53ZW50bGFuZEBhbWQuY29tPgo+CgpBcHBsaWVkLiAgdGhhbmtzIQoKQWxleAoKPiBIYXJy
eQo+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbS5jIHwgMiArKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmMKPiA+IGluZGV4IGUxYjA5YmI0MzJiZC4uNzQyNTJmNTdiYWZiIDEwMDY0NAo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+
ID4gQEAgLTYwMTcsNyArNjAxNyw5IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9kbV9lbmFibGVfY3J0
Y19pbnRlcnJ1cHRzKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gPiAgICAgICBzdHJ1Y3QgZHJt
X2NydGMgKmNydGM7Cj4gPiAgICAgICBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKm9sZF9jcnRjX3N0
YXRlLCAqbmV3X2NydGNfc3RhdGU7Cj4gPiAgICAgICBpbnQgaTsKPiA+ICsjaWZkZWYgQ09ORklH
X0RFQlVHX0ZTCj4gPiAgICAgICBlbnVtIGFtZGdwdV9kbV9waXBlX2NyY19zb3VyY2Ugc291cmNl
Owo+ID4gKyNlbmRpZgo+ID4KPiA+ICAgICAgIGZvcl9lYWNoX29sZG5ld19jcnRjX2luX3N0YXRl
KHN0YXRlLCBjcnRjLCBvbGRfY3J0Y19zdGF0ZSwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG5ld19jcnRjX3N0YXRlLCBpKSB7Cj4gPgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBh
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
