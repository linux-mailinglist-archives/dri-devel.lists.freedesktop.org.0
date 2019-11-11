Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 287E8F7A56
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 18:58:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 682736E9AF;
	Mon, 11 Nov 2019 17:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C6C6E081;
 Mon, 11 Nov 2019 17:58:04 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id i10so15638772wrs.7;
 Mon, 11 Nov 2019 09:58:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EpziU3n1BW5TLHQT8FQscf45CBaREelPg2coeu8/dVQ=;
 b=Lun47nvcvJ6ZI/zsM7iHL2R2pprBgrVv/G5Ory727mfwNwnJPO2lZkSH8lwduJleNr
 XRQBOzNLsif8fzJ8tmKClkm7thzwhHKsSox95OzCdzUoyHqRo7nYdTc991MTN7Lz7o+Z
 GY+DpiFyhLR52frBtLGi+WRlZH+xwhCrQlPogpAVTkMQw6BXGC8Av9HeREUz6Wa3/h0l
 BtDks9JBoMqXgCHEBABb3OKHV7xAaX2cTt0hI5vrB13A/cQ9QE4RCiWLtUJ2EH4wp7L3
 dA3e2+1CjkezdlBsuKUNBD+/DZ3BqtQYseImiKcMa1jYLDo81yBxN4gD1t6ftkqN23dA
 4NCQ==
X-Gm-Message-State: APjAAAV8d0YcsGdi7cYpIwGv45Ihw4VPZdnvYRoOeNq+sQjiH5hBlZ4y
 p0yMtQDyCcwGB0vYFY15sBPp0pTSV2N++dKdxSc=
X-Google-Smtp-Source: APXvYqx3ye/RxIPpV3svQCJ4zX0dnZOKXMO8w79UOdtPMbx1hABpnBd3Hy5aphbwPtqSPIfRyTOPL8O8scVa13McSKk=
X-Received: by 2002:a5d:4688:: with SMTP id u8mr21495307wrq.40.1573495082976; 
 Mon, 11 Nov 2019 09:58:02 -0800 (PST)
MIME-Version: 1.0
References: <20191109093725.42364-1-yuehaibing@huawei.com>
In-Reply-To: <20191109093725.42364-1-yuehaibing@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 11 Nov 2019 12:57:49 -0500
Message-ID: <CADnq5_PcSdTm9yKdbv=QHFtGeO58a30wZ0KxjQUNqy3Aax9thg@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: remove set but not used variable
 'ds_port'
To: YueHaibing <yuehaibing@huawei.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=EpziU3n1BW5TLHQT8FQscf45CBaREelPg2coeu8/dVQ=;
 b=ezStHSGEGwVEJrQ2BSZyBOA0qUcZhjbVVj5Hte4teiC3bJFyEKVYPUSqYfAmvOit3o
 H10Yx+EBvcTFLI/I6dWQjNkRRL2ENKHmkZKKtbx76Jd1bbCESZ1zbdQD2rDKd5xuT8Xr
 5wC36jcM9CT+skEFLwhQ4wIfnNXXpWWY4uKSh19OT5CltAqQDXqCc0dA/YLg6Tc+Ayd0
 Ra91tYwjq/vMPjRJh73oq6Hseg3C0D0XJ+oREdGO7+oQ2wxiQGdKzeZAEdrUcuDIl+vs
 xidMWt1xUfXXwU1fPF27DJYJ7OocSrxCWfbrhTwVO1wGUO3bJHweTq/as7v8twDhp2LR
 r6mw==
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
Cc: "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIHRoYW5rcyEKCkFsZXgKCk9uIFN1biwgTm92IDEwLCAyMDE5IGF0IDk6MjkgUE0g
WXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPiB3cm90ZToKPgo+IEZpeGVzIGdjYyAn
LVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZScgd2FybmluZzoKPgo+IGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2RwLmM6IEluIGZ1bmN0aW9uIGRw
X3dhX3Bvd2VyX3VwXzAwMTBGQToKPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNw
bGF5L2RjL2NvcmUvZGNfbGlua19kcC5jOjIzMjA6MzU6IHdhcm5pbmc6Cj4gIHZhcmlhYmxlIGRz
X3BvcnQgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPgo+IEl0
IGlzIG5ldmVyIHVzZWQsIHNvIGNhbiBiZSByZW1vdmVkLgo+Cj4gU2lnbmVkLW9mZi1ieTogWXVl
SGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2RwLmMgfCA0IC0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NvcmUvZGNfbGlua19kcC5jCj4gaW5kZXggNjVkZTMyZi4uYjgxNGI3NCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2RwLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2RwLmMKPiBA
QCAtMjkxMCw3ICsyOTEwLDYgQEAgc3RhdGljIHZvaWQgZHBfd2FfcG93ZXJfdXBfMDAxMEZBKHN0
cnVjdCBkY19saW5rICpsaW5rLCB1aW50OF90ICpkcGNkX2RhdGEsCj4gICAgICAgICAgICAgICAg
IGludCBsZW5ndGgpCj4gIHsKPiAgICAgICAgIGludCByZXRyeSA9IDA7Cj4gLSAgICAgICB1bmlv
biBkcF9kb3duc3RyZWFtX3BvcnRfcHJlc2VudCBkc19wb3J0ID0geyAwIH07Cj4KPiAgICAgICAg
IGlmICghbGluay0+ZHBjZF9jYXBzLmRwY2RfcmV2LnJhdykgewo+ICAgICAgICAgICAgICAgICBk
byB7Cj4gQEAgLTI5MjMsOSArMjkyMiw2IEBAIHN0YXRpYyB2b2lkIGRwX3dhX3Bvd2VyX3VwXzAw
MTBGQShzdHJ1Y3QgZGNfbGluayAqbGluaywgdWludDhfdCAqZHBjZF9kYXRhLAo+ICAgICAgICAg
ICAgICAgICB9IHdoaWxlIChyZXRyeSsrIDwgNCAmJiAhbGluay0+ZHBjZF9jYXBzLmRwY2RfcmV2
LnJhdyk7Cj4gICAgICAgICB9Cj4KPiAtICAgICAgIGRzX3BvcnQuYnl0ZSA9IGRwY2RfZGF0YVtE
UF9ET1dOU1RSRUFNUE9SVF9QUkVTRU5UIC0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBEUF9EUENEX1JFVl07Cj4gLQo+ICAgICAgICAgaWYgKGxpbmstPmRwY2RfY2Fwcy5kb25n
bGVfdHlwZSA9PSBESVNQTEFZX0RPTkdMRV9EUF9WR0FfQ09OVkVSVEVSKSB7Cj4gICAgICAgICAg
ICAgICAgIHN3aXRjaCAobGluay0+ZHBjZF9jYXBzLmJyYW5jaF9kZXZfaWQpIHsKPiAgICAgICAg
ICAgICAgICAgLyogMDAxMEZBIGFjdGl2ZSBkb25nbGVzIChEUC1WR0EsIERQLURMRFZJIGNvbnZl
cnRlcnMpIHBvd2VyIGRvd24KPiAtLQo+IDIuNy40Cj4KPgo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
