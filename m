Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6584970963
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 21:12:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B85E89DF9;
	Mon, 22 Jul 2019 19:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2786A89DF9;
 Mon, 22 Jul 2019 19:12:24 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id n9so40629290wru.0;
 Mon, 22 Jul 2019 12:12:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E5mBJQbASIWLcBRoSyRYLQDBK0lNLjxZqisDqmDkveo=;
 b=fRy4SmWzroaFQw8t+tlTyTMbZ8SJgJHDLhVljGWwbwugM4M+ZkRK05BITMUJFciq4Z
 YDp5qII9RrjreA3bt1W0dKJ0j1UL43aI69cAI4gCicyFH3FpHcZ5DEMTHDQJLLlqecEi
 WfMlyFy0rnd70L3DbTJ1tPR+ktoFFVBo730tOs9IPj61hN0e14iA022/vmkmYUG0ffDR
 YcvKk9OW8FQqnLQ9iW6aXcb33A1VzTWCrR8zPHOfIl0QEZwXxLnVaMDpu+Iu0ocWkl/4
 9/R/590Va6TdelMUD8sGj8c7kuYkTov1Z5vsxmISJh2wyrJJvQRXgU0pmUXyuqos2uNt
 CLKQ==
X-Gm-Message-State: APjAAAU/Bfpfemiym6k3I+XHtpP0Xxm9h1oeZivw2tosUaOJUCenyI9u
 7Q3nkaNjn4t4B+/8Sr9UGQYGxNY+BJ0nUSaly4Gfhg==
X-Google-Smtp-Source: APXvYqzZuDxJEjG1iXUQjcFTW3PQBCK+hlG/4cTZn/bdmQTyxnOBEg1WLZ03tbAGunknQcHYIut1/j3bX5uPQmino88=
X-Received: by 2002:a5d:6ccd:: with SMTP id c13mr72770190wrc.4.1563822742766; 
 Mon, 22 Jul 2019 12:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190721223949.GA13591@embeddedor>
In-Reply-To: <20190721223949.GA13591@embeddedor>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 22 Jul 2019 15:12:11 -0400
Message-ID: <CADnq5_NZNA3wCq4U4jbOU7BHfYgan5m=R6MbWmJ3Xp1oYMAUog@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/gfx10: Fix missing break in switch statement
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=E5mBJQbASIWLcBRoSyRYLQDBK0lNLjxZqisDqmDkveo=;
 b=AFf6ArnNfbHJsDlo3L0mHVyYTahFZ+Hs+FvkmWx2MNN7P4WvvwCceoQAqnlZa+zHsl
 +1eAKtDu7XB2g+bho+2CuUFZsWyduG7i6PlGMeNReDIResI1pqbajCZr8oDMrjPHZu2j
 /9TCp1bmpurWvgB4YpbhTghzO8JpsXSfJkUH13NI0TPwGGIPLFrDDEQDLBtvrWM5Zf/W
 QWish7yDFa893WoQeCf+aV33tAw3tqiGaWJBW+/UkM5kCqAb2oMzd/k9Ez3rnPJxrh3u
 7BOfYuVlv7L3exMhjN1pqA0/81lKMeGXKlakc/M9cpwDJ0585ljkq12LdNCz4wiZX9ZQ
 lBEA==
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
Cc: Kees Cook <keescook@chromium.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdWwgMjEsIDIwMTkgYXQgNjozOSBQTSBHdXN0YXZvIEEuIFIuIFNpbHZhCjxndXN0
YXZvQGVtYmVkZGVkb3IuY29tPiB3cm90ZToKPgo+IEFkZCBtaXNzaW5nIGJyZWFrIHN0YXRlbWVu
dCBpbiBvcmRlciB0byBwcmV2ZW50IHRoZSBjb2RlIGZyb20gZmFsbGluZwo+IHRocm91Z2ggdG8g
Y2FzZSBBTURHUFVfSVJRX1NUQVRFX0VOQUJMRS4KPgo+IFRoaXMgYnVnIHdhcyBmb3VuZCB0aGFu
a3MgdG8gdGhlIG9uZ29pbmcgZWZmb3J0cyB0byBlbmFibGUKPiAtV2ltcGxpY2l0LWZhbGx0aHJv
dWdoLgo+Cj4gRml4ZXM6IGE2NDRkODVhNWNkNCAoImRybS9hbWRncHU6IGFkZCBnZnggdjEwIGlt
cGxlbWVudGF0aW9uICh2MTApIikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25l
ZC1vZmYtYnk6IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+CgpB
cHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3YxMF8wLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYwo+IGluZGV4IDE2NzVkNTgzN2Mz
Yy4uMzVlOGUyOTEzOWIxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dmeF92MTBfMC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8w
LmMKPiBAQCAtNDYxMSw2ICs0NjExLDcgQEAgZ2Z4X3YxMF8wX3NldF9nZnhfZW9wX2ludGVycnVw
dF9zdGF0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiAgICAgICAgICAgICAgICAgY3Bf
aW50X2NudGwgPSBSRUdfU0VUX0ZJRUxEKGNwX2ludF9jbnRsLCBDUF9JTlRfQ05UTF9SSU5HMCwK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRJTUVfU1RBTVBf
SU5UX0VOQUJMRSwgMCk7Cj4gICAgICAgICAgICAgICAgIFdSRUczMihjcF9pbnRfY250bF9yZWcs
IGNwX2ludF9jbnRsKTsKPiArICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICBjYXNlIEFN
REdQVV9JUlFfU1RBVEVfRU5BQkxFOgo+ICAgICAgICAgICAgICAgICBjcF9pbnRfY250bCA9IFJS
RUczMihjcF9pbnRfY250bF9yZWcpOwo+ICAgICAgICAgICAgICAgICBjcF9pbnRfY250bCA9IFJF
R19TRVRfRklFTEQoY3BfaW50X2NudGwsIENQX0lOVF9DTlRMX1JJTkcwLAo+IC0tCj4gMi4yMi4w
Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
