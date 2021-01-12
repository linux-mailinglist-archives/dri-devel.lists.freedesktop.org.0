Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDB92F3C6B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 23:38:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F8089A4B;
	Tue, 12 Jan 2021 22:38:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92118899B3;
 Tue, 12 Jan 2021 22:38:06 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id r9so31279otk.11;
 Tue, 12 Jan 2021 14:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wxsYVjMKSLjVspkXPLIbzpTupJ3YZOSiw7PZpIiWQyM=;
 b=XLp8nCeLhFAtOZUatvwUYUb2gGmH6kNqezId++H9o7h9c5xR1L1kDzh00wyaV1jxo3
 k8HYjeEjs2yDERvrCnLt0ed6MzB/ex+h1pntaW8zhhZhZA1/QvhDCTjj6Xg1IKnYtelu
 hWLNYpUBdS1wGRc0tQ/hrDZ1hZzlTCvSVZY1yt3SZ0QWQMDvpALYuJBea+/D8NTWX9Qs
 9W/8QXIcBQ+Q2jk2XIwFZnV7gqegGaAWG91W2QUdlK/PUn+6ta7XAhq5QTE8Rzy92vkr
 QuqG+aKRmHN/Gc1zptJXy0pafxCLIOwp2sfHs1nIN85xsLfEXO5Mi6VGwmcHlxK1lXNY
 Ozjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wxsYVjMKSLjVspkXPLIbzpTupJ3YZOSiw7PZpIiWQyM=;
 b=XgjPT9hFOMoWmE5TlB9BUyc3p1fr6BhI/RgDD19gEVx9oIycH9CskC7OL9qDNekbIc
 0ioL+NJDYk/hW53qhN4hD1AJCLjhUtKofkuvSw+Y3vyMPzoXfKYhD3E9aePsRHfdJIS5
 uzz24meoezXaf3AEtve9ogNkrXTUM54qjk5R4tXBRD0EdIHgv9XFjC5bt3kmre+ycZjh
 zQ6liX9ILbaIcq4hun6etaiPAQp/xGWPD0R5jXRuw6epWxqX+IPwh9kiIOCsWA+Gi/A1
 3bF5gQxjneQ/5g8FeVT34Bymhq9bALVrlTMamLwBKuDzT/z2OQpBH+H0NLDgq7uNqbFT
 h0QA==
X-Gm-Message-State: AOAM532j8GEpYYH3zjoCz4ZBG1S1Jm0ZJ8uTJmUM+Zr8buTzYwfKX5pj
 2FGhGkz/s/Yf7ajQMHP+tvtoE2o1B0HyYa+nsAQXoY5I
X-Google-Smtp-Source: ABdhPJywXV/9ak613noS3mM30Z7CXwul6zSJF1SGnNPGOBR+bqpNNou96ebtx8C72ZXa9t5wEsC2NrucI3llN93ClkQ=
X-Received: by 2002:a9d:75d4:: with SMTP id c20mr1058349otl.311.1610491085959; 
 Tue, 12 Jan 2021 14:38:05 -0800 (PST)
MIME-Version: 1.0
References: <20210111191926.3688443-1-lee.jones@linaro.org>
 <20210111191926.3688443-36-lee.jones@linaro.org>
In-Reply-To: <20210111191926.3688443-36-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Jan 2021 17:37:52 -0500
Message-ID: <CADnq5_NtBq+_g7pTxQ3GJHhjg5qKG147sPFKzwb_RhCuatO-hg@mail.gmail.com>
Subject: Re: [PATCH 35/40] drm/amd/display/dc/dce60/dce60_timing_generator:
 Make 'dce60_configure_crc' invoked by reference static
To: Lee Jones <lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, Mauro Rossi <issor.oruam@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKYW4gMTEsIDIwMjEgYXQgMjoyMCBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMv
ZGNlNjAvZGNlNjBfdGltaW5nX2dlbmVyYXRvci5jOjE5Mjo2OiB3YXJuaW5nOiBubyBwcmV2aW91
cyBwcm90b3R5cGUgZm9yIOKAmGRjZTYwX2NvbmZpZ3VyZV9jcmPigJkgWy1XbWlzc2luZy1wcm90
b3R5cGVzXQo+Cj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgo+
IENjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+
IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IE1hdXJvIFJvc3NpIDxp
c3Nvci5vcnVhbUBnbWFpbC5jb20+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBM
ZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZC4gIFRoYW5rcyEKCkFsZXgK
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2U2MC9kY2U2MF90aW1p
bmdfZ2VuZXJhdG9yLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNlNjAvZGNlNjBfdGltaW5nX2dlbmVyYXRvci5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjZTYwL2RjZTYwX3RpbWluZ19nZW5lcmF0b3IuYwo+IGluZGV4IGZj
MWFmMGZmMGNhNGMuLmMxYTg1ZWUzNzRkOWQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjZTYwL2RjZTYwX3RpbWluZ19nZW5lcmF0b3IuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2U2MC9kY2U2MF90aW1pbmdfZ2VuZXJhdG9y
LmMKPiBAQCAtMTg5LDggKzE4OSw4IEBAIHN0YXRpYyBib29sIGRjZTYwX2lzX3RnX2VuYWJsZWQo
c3RydWN0IHRpbWluZ19nZW5lcmF0b3IgKnRnKQo+ICAgICAgICAgcmV0dXJuIGZpZWxkID09IDE7
Cj4gIH0KPgo+IC1ib29sIGRjZTYwX2NvbmZpZ3VyZV9jcmMoc3RydWN0IHRpbWluZ19nZW5lcmF0
b3IgKnRnLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGNyY19wYXJh
bXMgKnBhcmFtcykKPiArc3RhdGljIGJvb2wgZGNlNjBfY29uZmlndXJlX2NyYyhzdHJ1Y3QgdGlt
aW5nX2dlbmVyYXRvciAqdGcsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25z
dCBzdHJ1Y3QgY3JjX3BhcmFtcyAqcGFyYW1zKQo+ICB7Cj4gICAgICAgICAvKiBDYW5ub3QgY29u
ZmlndXJlIGNyYyBvbiBhIENSVEMgdGhhdCBpcyBkaXNhYmxlZCAqLwo+ICAgICAgICAgaWYgKCFk
Y2U2MF9pc190Z19lbmFibGVkKHRnKSkKPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0
Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
