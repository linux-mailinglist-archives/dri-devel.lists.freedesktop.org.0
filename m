Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D7A70A02
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 21:45:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB1089128;
	Mon, 22 Jul 2019 19:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915AC89128;
 Mon, 22 Jul 2019 19:45:55 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p17so40610085wrf.11;
 Mon, 22 Jul 2019 12:45:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mfiBWJ6PUSyYeyNIn03p58I6uVjr4C4bhbLtUD/MF24=;
 b=iIwwBpjW2Ldt10J05wq2KA9UDhphmVZGoEOYI5GpVwNJmtae6YtCIi5jfn2Sy+GpxN
 pnHfPQ11NEp1pe2c/nqS7g9kpA1a/JukxOQBOR7VU6DuSmZnyhKO7BQFtabRYzrEBsbB
 D7gRN/mPAFRocABiROf1lNw0QpHDU/GQp2UD4xdX30DNnd6RXLgXA7fGNuA/nA8lLfg9
 DpEYU3CiQ+ctuuo7TEHu8w2BExMqNJqJGj0U1RWeETXX0yCX0xwTsYiD2srs3x2q66wc
 B1LxMfl/WzwmxL1JTCfCvi0LPpomaZ7SVYc/GvglCrCEruehYd5HoZ4WGqNAJ+Rt+sQL
 L+mw==
X-Gm-Message-State: APjAAAXZKbXEyzg6b2E8us2vDEz6RjqMGapckUcxg0PsqZwvWrxUlcEc
 y9gPH057/wvOB7A6gX/oU08N52cttQK25IUoQfV7cDEt
X-Google-Smtp-Source: APXvYqwp8BppJPcCRhriZEJumGwE1sekMMaeeLUrBRhupTfg+HZOHh6ga8vSkcu3/oGVZmLUWryumMuE+gfVQhm+pCc=
X-Received: by 2002:adf:f94a:: with SMTP id q10mr53387147wrr.341.1563824754148; 
 Mon, 22 Jul 2019 12:45:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190721214935.GA910@embeddedor>
 <CADnq5_OTmx==m+1fJbf1PxPhPM0H0O8GRjq4eWeX6sw889YPrA@mail.gmail.com>
 <181c1bc9-4cf9-057f-a6e6-e6d62ddbc347@embeddedor.com>
In-Reply-To: <181c1bc9-4cf9-057f-a6e6-e6d62ddbc347@embeddedor.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 22 Jul 2019 15:45:42 -0400
Message-ID: <CADnq5_NRDy1jpa2MGefo7KbUB2vejuLwpnJh=vsqyp56yY31Sg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: Fix missing break in switch statement
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=mfiBWJ6PUSyYeyNIn03p58I6uVjr4C4bhbLtUD/MF24=;
 b=HisDqRQ8k1WjU/x3HIxhOIEQ/GgP8RpDhBgwIc4s8Oe6o93ovR6m9/9CLIV+1e0QdW
 siJ13CO2R7iog19lIb0a1mRoaN/UAPIO477hxU4ldqAs5Ps8VZB1B15vfBVkuh4kchiI
 C2gfGJOLhK92tpsMa3qQT5cFTScaFZmSe5xTQCC7XXjwuGLQ8joydRhcGcm/rvl6GcjK
 5XLDlsW2uwaX5A2MO1y5Mn+1NqD4cNqW+lWP4weAR3yGAPCb1bxqdKoL+mHUwjP33rad
 XlEfN0KhVzezqCnwNTpyLTprCSWx6zZu0et0/K2oMSzEZTQOiSXkEWzw5Oc/KUGBxJ4B
 6vYw==
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Philip Cox <Philip.Cox@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMzoxOSBQTSBHdXN0YXZvIEEuIFIuIFNpbHZhCjxndXN0
YXZvQGVtYmVkZGVkb3IuY29tPiB3cm90ZToKPgo+Cj4KPiBPbiA3LzIyLzE5IDI6MTAgUE0sIEFs
ZXggRGV1Y2hlciB3cm90ZToKPiA+IE9uIFN1biwgSnVsIDIxLCAyMDE5IGF0IDY6MTIgUE0gR3Vz
dGF2byBBLiBSLiBTaWx2YQo+ID4gPGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+IHdyb3RlOgo+ID4+
Cj4gPj4gQWRkIG1pc3NpbmcgYnJlYWsgc3RhdGVtZW50IGluIG9yZGVyIHRvIHByZXZlbnQgdGhl
IGNvZGUgZnJvbSBmYWxsaW5nCj4gPj4gdGhyb3VnaCB0byBjYXNlIENISVBfTkFWSTEwLgo+ID4+
Cj4gPj4gVGhpcyBidWcgd2FzIGZvdW5kIHRoYW5rcyB0byB0aGUgb25nb2luZyBlZmZvcnRzIHRv
IGVuYWJsZQo+ID4+IC1XaW1wbGljaXQtZmFsbHRocm91Z2guCj4gPj4KPiA+PiBGaXhlczogMTQz
MjhhYTU4Y2U1ICgiZHJtL2FtZGtmZDogQWRkIG5hdmkxMCBzdXBwb3J0IHRvIGFtZGtmZC4gKHYz
KSIpCj4gPj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiA+PiBTaWduZWQtb2ZmLWJ5OiBH
dXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPgo+ID4KPiA+IEFwcGxp
ZWQuICBUaGFua3MhCj4gPgo+Cj4gQnkgdGhlIHdheSwgQWxleCwgSSdtIHBsYW5uaW5nIHRvIGFk
ZCB0aGVzZSBmaXhlcyB0byBteSB0cmVlLiBJIHdhbnQKPiB0byBzZW5kIGEgcHVsbC1yZXF1ZXN0
IHRvIExpbnVzIGZvciB2NS4zLXJjMiB0aGlzIGFmdGVybm9vbi4gV2Ugd2FudAo+IHRvIGhhdmUg
dGhlIC1XaW1wbGljaXQtZmFsbHRocm91Z2ggb3B0aW9uIGdsb2JhbGx5IGVuYWJsZWQgaW4gdjUu
MywKPiBhbmQgdGhlc2UgYXJlIHNvbWUgb2YgdGhlIGxhc3QgZmFsbC10aHJvdWdoIHdhcm5pbmdz
IHJlbWFpbmluZyBpbgo+IHRoZSBrZXJuZWwuCj4KPiBDYW4gSSBoYXZlIHlvdXIgQWNrIG9yIFNp
Z25lZC1vZmYtYnkgZm9yIGFsbCB0aGVzZSBkcm0gcGF0Y2hlcz8KCkkgZGlkbid0IHJlYWxpemUg
eW91IHdlcmUgc2VuZGluZyB0aGVzZSB5b3Vyc2VsZi4gSSB3YXMgZ29pbmcgdG8KaW5jbHVkZSB0
aGVtIGluIG15IHVwY29taW5nIC1maXhlcyBwdWxsLiAgRmVlbCBmcmVlIHRvIGFkZCBteSBSQiB0
bwphbGwgdGhyZWUuCgpBbGV4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
