Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49077F7A0B
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 18:35:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2B16E997;
	Mon, 11 Nov 2019 17:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB97C6E996;
 Mon, 11 Nov 2019 17:35:24 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id i10so15560343wrs.7;
 Mon, 11 Nov 2019 09:35:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6Hr0XZ+W95Fq8mqP7g5xaelC6Vx3m15yqOwH0Jnse00=;
 b=MwczHsIO88S1yislvKPAN/5f/6c0QQ8IgsS8/k989fmdonSD41g11ihJlPuR2ESH6S
 aqM6fkUWYog8F64nOJk+6K/gXwKYQMzsszjiZp1kK2P+w5KUIU72wmBuHhnaM9ZKkBeh
 yoZFL+4FxP2gVlSVmmOviPoQ7a6dZ9HJ2LoTKgRw5oQjsLw9tkmkJVuf2GNgcdGWGwKL
 Fr3iwM8GIsL6AVshTaNwVJRSD3sGJn4k525t+LmLj8N1ioyvtCfRPme9g2p/zTUqJfAO
 hov/7XyHaZnVJS5FA8tJ9RXuFjOGfjaq5xCGCy6jwz/M55vLXnVGa6DhpqrFodVEUUNu
 LQ9Q==
X-Gm-Message-State: APjAAAWgnlW+H759E7BIRDknZ5pDOm9W/mYVfUnaZAEvtMWjo1CZIBbS
 kxqS+f1hvRuRFPBo9enOrTqz1/UD279zckE/Do04aA==
X-Google-Smtp-Source: APXvYqweEiabjLuuO8H9HV68rYsXJ4G5OK+vh51GktRkh2PtT8iyT8F9Kc+znoIEOavWyTstNfVv2xS3Cb9ocnbXU8Q=
X-Received: by 2002:adf:fb0b:: with SMTP id c11mr22736594wrr.50.1573493723544; 
 Mon, 11 Nov 2019 09:35:23 -0800 (PST)
MIME-Version: 1.0
References: <20191109154921.223093-1-colin.king@canonical.com>
 <0700f347-8590-7ab7-411d-0ae08fe9263d@amd.com>
In-Reply-To: <0700f347-8590-7ab7-411d-0ae08fe9263d@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 11 Nov 2019 12:35:10 -0500
Message-ID: <CADnq5_MKFh3v+qnjO-bmpepTc_XTgEKTomP0PLRJu==_UBTkZA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove duplicated comparison expression
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=6Hr0XZ+W95Fq8mqP7g5xaelC6Vx3m15yqOwH0Jnse00=;
 b=e2Ew9GMfSUxRzx7YWxu6vGIT1uYNAUiOY9ivjlvAsecN6phDGzODfdsbD3pacZtgIq
 1TKhZPVClxclFXrKxi25zD6ZguKi/bxPme4O5nqEjs9Q/EuaddiWwchMpHQb4ojeFI/W
 +Z8KsqOocqbBsBqH/WUX8mpC/R2cj9PNBzLMkYizXe+M9L/QoTtzf4sJIFvMn3IUVcS8
 1EPUUP/83jBAkAMU+kWNau2TxKgnEBfFfMdmTTvesmByRZfObnz5YIBcC1VOeqr71tgR
 /dL6GhxmlSceWOMaL0mWSis4LnTwXehs8BaBwdsQw9+50FGstcjrZ07Acb24dJ41ZJhT
 i2jA==
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
Cc: Charlene Liu <Charlene.Liu@amd.com>, Leo Li <sunpeng.li@amd.com>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin King <colin.king@canonical.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIE1vbiwgTm92IDExLCAyMDE5IGF0IDg6MzggQU0g
S2F6bGF1c2thcywgTmljaG9sYXMKPG5pY2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbT4gd3JvdGU6
Cj4KPiBPbiAyMDE5LTExLTA5IDEwOjQ5IGEubS4sIENvbGluIEtpbmcgd3JvdGU6Cj4gPiBGcm9t
OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+ID4KPiA+IFRoZXJl
IGlzIGNvbXBhcmlzb24gZXhwcmVzc2lvbiB0aGF0IGlzIGR1cGxpY2F0ZWQgYW5kIGhlbmNlIG9u
ZQo+ID4gb2YgdGhlIGV4cHJlc3Npb25zIGNhbiBiZSByZW1vdmVkLiAgUmVtb3ZlIGl0Lgo+ID4K
PiA+IEFkZHJlc3Nlcy1Db3Zlcml0eTogKCJTYW1lIG9uIGJvdGggc2lkZXMiKQo+ID4gRml4ZXM6
IDEyZTJiMmQ0YzY1ZiAoImRybS9hbWQvZGlzcGxheTogYWRkIGRjYyBwcm9ncmFtbWluZyBmb3Ig
ZHVhbCBwbGFuZSIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2lu
Z0BjYW5vbmljYWwuY29tPgo+Cj4gUmV2aWV3ZWQtYnk6IE5pY2hvbGFzIEthemxhdXNrYXMgPG5p
Y2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbT4KPgo+IFRoYW5rcyEKPgo+IE5pY2hvbGFzIEthemxh
dXNrYXMKPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3Jl
L2RjLmMgfCAxIC0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKPiA+IGluZGV4IDFmZGJhMTNi
M2QwZi4uMWZhMjU1ZTA3N2QwIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2NvcmUvZGMuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NvcmUvZGMuYwo+ID4gQEAgLTE0OTEsNyArMTQ5MSw2IEBAIHN0YXRpYyBlbnVtIHN1cmZh
Y2VfdXBkYXRlX3R5cGUgZ2V0X3BsYW5lX2luZm9fdXBkYXRlX3R5cGUoY29uc3Qgc3RydWN0IGRj
X3N1cmZhCj4gPiAgICAgICB9Cj4gPgo+ID4gICAgICAgaWYgKHUtPnBsYW5lX2luZm8tPnBsYW5l
X3NpemUuc3VyZmFjZV9waXRjaCAhPSB1LT5zdXJmYWNlLT5wbGFuZV9zaXplLnN1cmZhY2VfcGl0
Y2gKPiA+IC0gICAgICAgICAgICAgICAgICAgICB8fCB1LT5wbGFuZV9pbmZvLT5wbGFuZV9zaXpl
LnN1cmZhY2VfcGl0Y2ggIT0gdS0+c3VyZmFjZS0+cGxhbmVfc2l6ZS5zdXJmYWNlX3BpdGNoCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgfHwgdS0+cGxhbmVfaW5mby0+cGxhbmVfc2l6ZS5jaHJv
bWFfcGl0Y2ggIT0gdS0+c3VyZmFjZS0+cGxhbmVfc2l6ZS5jaHJvbWFfcGl0Y2gpIHsKPiA+ICAg
ICAgICAgICAgICAgdXBkYXRlX2ZsYWdzLT5iaXRzLnBsYW5lX3NpemVfY2hhbmdlID0gMTsKPiA+
ICAgICAgICAgICAgICAgZWxldmF0ZV91cGRhdGVfdHlwZSgmdXBkYXRlX3R5cGUsIFVQREFURV9U
WVBFX01FRCk7Cj4gPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
