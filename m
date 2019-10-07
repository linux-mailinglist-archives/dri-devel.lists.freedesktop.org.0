Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D56CE8FD
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 18:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D614A6E1F8;
	Mon,  7 Oct 2019 16:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1D5890F2;
 Mon,  7 Oct 2019 16:20:26 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z9so16011092wrl.11;
 Mon, 07 Oct 2019 09:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QMT4RCk6Xgzyo4UpI8x0DW3xjXl6i4SeSRThEYjZuSk=;
 b=nlik/Wuc/LGCTOXbQG7MPsBy+N6yo3SqzaDr+dkVZfBdfQixHbzG2uPpLUrk5hOKu/
 P6tCxugWNq4NrLV9AHg4kX2fL+92XhjNgu8vhiDsLMnuSrpcsOi2H+OJydVZ2N9ZN+c1
 o5982PG9Y+7V2zKzoC09kjPMY3eA1KIYeoMFXseFYkxVEQ/Iih9Ce8tTHvEOiiOfFQSm
 8fBhQpXroPOIc8tmcSq3rshz6h52qeVXlhHT2GkPfQqfjaEgEA8r9z7Tgg3Fp+u3wEz4
 rRHR7PsoVf2FQA3RywGs0ry1RsKw5quzykclBCyL91jLzb79X9QhbPjv6G9/Ol7QDsOU
 x6+A==
X-Gm-Message-State: APjAAAWMtYv0Eg2CDuNyoDyXhiYc18YiH/txIe3tMJUhqZfJ5iO/Zrtp
 mxocO4vlec9gpyrC1i71cIBvNZZFuQDyu2QHwlI=
X-Google-Smtp-Source: APXvYqwUETfJVpAABq6pMvnJehxU9sQtYTKUU/G+RPiYTH9zF7cjJ4HUrej2xO7sJAw6eMmHoLLuykQr6vWjEbp4jvo=
X-Received: by 2002:adf:f287:: with SMTP id k7mr24288912wro.206.1570465224778; 
 Mon, 07 Oct 2019 09:20:24 -0700 (PDT)
MIME-Version: 1.0
References: <1570243476-44419-1-git-send-email-zhengbin13@huawei.com>
 <85a8ffa0-6458-32fc-41b0-6e14dcdb61d8@amd.com>
In-Reply-To: <85a8ffa0-6458-32fc-41b0-6e14dcdb61d8@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Oct 2019 12:20:12 -0400
Message-ID: <CADnq5_O8NEnbsWdCzuYvdyT42H1y-px4Jc+t=pDcrUY1s4Y61w@mail.gmail.com>
Subject: Re: [PATCH 0/5] drm/amd/display: some fixes for gcc warning
To: Harry Wentland <hwentlan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=QMT4RCk6Xgzyo4UpI8x0DW3xjXl6i4SeSRThEYjZuSk=;
 b=hibNmh58ILiIXxGxHPLeBLQx6LizPRVfkMlt3hD2sqTNfOY5nY4fQ6Cw5vc+v4C2MF
 RjKm5i5Xns17OKwpYBgZNGDjc6GiL2kExt5a9bDwaOzx8VwVAyCue1lm+203q4uciO3f
 0dTIcmEvL/jDKA+6fJgf6Afpxb60YgIq5q6VymPqIJc7JY7ZHhuZWp/UlWO/0BDXxG4P
 5LRdnFaUeZh9IJr0C9erQxkJXLs9B+j3sA4xNm9XIJ7Kl3cngmyQiT/Rnl04DYxHQ3hq
 BDKnr3GryEgXbaXkjVJG+EEn6u91lcda+gvY9CZyao2XKIDX7L9MMLsitFunPDQAkK9s
 TZVw==
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 zhengbin <zhengbin13@huawei.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIE1vbiwgT2N0IDcsIDIwMTkgYXQgMTA6MTkgQU0g
SGFycnkgV2VudGxhbmQgPGh3ZW50bGFuQGFtZC5jb20+IHdyb3RlOgo+Cj4gU2VyaWVzIGlzCj4g
UmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgo+Cj4g
SGFycnkKPgo+IE9uIDIwMTktMTAtMDQgMTA6NDQgcC5tLiwgemhlbmdiaW4gd3JvdGU6Cj4gPiB6
aGVuZ2JpbiAoNSk6Cj4gPiAgIGRybS9hbWQvZGlzcGxheTogTWFrZSBmdW5jdGlvbiB3YWl0X2Zv
cl9hbHRfbW9kZSBzdGF0aWMKPiA+ICAgZHJtL2FtZC9kaXNwbGF5OiBSZW1vdmUgc2V0IGJ1dCBu
b3QgdXNlZCB2YXJpYWJsZSAnc291cmNlX2JwcCcKPiA+ICAgZHJtL2FtZC9kaXNwbGF5OiBSZW1v
dmUgc2V0IGJ1dCBub3QgdXNlZCB2YXJpYWJsZXMKPiA+ICAgICAnaF9yYXRpb19jaHJvbWEnLCd2
X3JhdGlvX2Nocm9tYScKPiA+ICAgZHJtL2FtZC9kaXNwbGF5OiBSZW1vdmUgc2V0IGJ1dCBub3Qg
dXNlZCB2YXJpYWJsZSAncGl4ZWxfd2lkdGgnCj4gPiAgIGRybS9hbWQvZGlzcGxheTogUmVtb3Zl
IHNldCBidXQgbm90IHVzZWQgdmFyaWFibGVzICdwcF9zbXUnLCdvbGRfcGlwZScKPiA+Cj4gPiAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jICAgICAgICAgICAg
ICAgfCAgMiArLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNl
MTEwX2h3X3NlcXVlbmNlci5jIHwgMTIgLS0tLS0tLS0tLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RwcC5jICAgICAgICAgICAgfCAgNyAtLS0tLS0t
Cj4gPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2R3Yl9zY2wu
YyAgICAgICAgfCAgNCAtLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rz
Yy9yY19jYWxjLmMgICAgICAgICAgICAgICAgfCAgMyAtLS0KPiA+ICA1IGZpbGVzIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAyNyBkZWxldGlvbnMoLSkKPiA+Cj4gPiAtLQo+ID4gMi43LjQKPiA+
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQt
Z2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
