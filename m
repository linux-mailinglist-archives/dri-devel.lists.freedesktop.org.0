Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC41310F220
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 22:25:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083276E33F;
	Mon,  2 Dec 2019 21:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD2F6E33F;
 Mon,  2 Dec 2019 21:25:22 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y11so1056455wrt.6;
 Mon, 02 Dec 2019 13:25:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pt+naxqw/fH0eKVqxRkMbRAo9MZMH9ZsIR8OD48HKxM=;
 b=atxW/pUSNaDAo31553jcePjvWh3YSngcT+JVj0yQ1jT68vJ1tmicGkS3MpkajjlKf5
 tiaJwkCmc5RsM0rbUFsEN4PwobNRs0IX7v0Wr8rRGQlYJ9vNQ6aCoFxPz32mzn8EuprL
 V7l4euHvvM1SwGqvDQ+FBcX6elbU7HK9tWFcyQOtsCVHEG0kXnJxtF6GuoL07Taf1A9r
 uB1LKVuV4ro1mAnNzkYedzcgVOo4j6GJNFoVjtS4aHCUyDu2+Mem4v6zi+Htrqck7yzt
 ZqxlFth++YiSaXqWmmtI0pM1/Ttx5xuYJ5wtOpkE8GWfC5lBvpfjI4uRleWGVjjRTGsw
 E83Q==
X-Gm-Message-State: APjAAAUAK71A/WuUTdbaMSELW8rvZr3/PbcRFtDdOVnQFWTQACv99yrd
 ea/eoIa6nUN2r+9AsrP3ff/8j6eFE8nxApTt1E8=
X-Google-Smtp-Source: APXvYqw2uAWmBCbxBUOEjOUQzYSJPvI9O35Octjfy7PHavXAejTiHm0aZFlhjtyVLYvd2Lo+zpwiEix23tZpnO3ryIc=
X-Received: by 2002:a5d:46c7:: with SMTP id g7mr1177443wrs.11.1575321921005;
 Mon, 02 Dec 2019 13:25:21 -0800 (PST)
MIME-Version: 1.0
References: <20191120172242.347072-1-colin.king@canonical.com>
 <9056b19a-f63c-8fc0-d2f7-6df3a20c95a7@amd.com>
In-Reply-To: <9056b19a-f63c-8fc0-d2f7-6df3a20c95a7@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 Dec 2019 16:25:09 -0500
Message-ID: <CADnq5_NLq7HJ6OAAW6yO9G6NC9Ytpd7mzG8TrRmsLsvHbO9wWg@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/display: fix double assignment to msg_id
 field
To: Harry Wentland <hwentlan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Pt+naxqw/fH0eKVqxRkMbRAo9MZMH9ZsIR8OD48HKxM=;
 b=Nk32nNfdBzkzw9m7i4o2nY+rlgd3njRYG+Y7ZLPIG7N+t6YrOFqJ3nPkrVVCxPjbAD
 YoOib11V/zdT60l2iUhNqL6Kp2xrNmT0Yb4X206a15aKTMbqVXshTBE4MMG6SHdXBuhk
 DzYirL+2o9DILOA3AKXigQG1RMoPPIf/0TEwMgs6Vu78hG7bfQnaZ9wIoCoU8tzx9lp8
 Fme8qUAk0vW1GazZUglQZXhGpfEOuOXJTWhxUjIYurf9sJCIZxoZ0L6LjtupG6Mzx5RY
 +EJpRQ6VPS3VzuL/ZlMz4GKuKO1ntU6hDPll3vS++TDRbI7X3Xc5qCph2/0BAEHQA05z
 e+vg==
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
Cc: Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin King <colin.king@canonical.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIHRoYW5rcyEKCkFsZXgKCk9uIFdlZCwgTm92IDI3LCAyMDE5IGF0IDExOjUxIEFN
IEhhcnJ5IFdlbnRsYW5kIDxod2VudGxhbkBhbWQuY29tPiB3cm90ZToKPgo+IE9uIDIwMTktMTEt
MjAgMTI6MjIgcC5tLiwgQ29saW4gS2luZyB3cm90ZToKPiA+IEZyb206IENvbGluIElhbiBLaW5n
IDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4gPgo+ID4gVGhlIG1zZ19pZCBmaWVsZCBpcyBi
ZWluZyBhc3NpZ25lZCB0d2ljZS4gRml4IHRoaXMgYnkgcmVwbGFjaW5nIHRoZSBzZWNvbmQKPiA+
IGFzc2lnbm1lbnQgd2l0aCBhbiBhc3NpZ25tZW50IHRvIG1zZ19zaXplLgo+ID4KPiA+IEFkZHJl
c3Nlcy1Db3Zlcml0eTogKCJVbnVzZWQgdmFsdWUiKQo+ID4gRml4ZXM6IDExYTAwOTY1ZDI2MSAo
ImRybS9hbWQvZGlzcGxheTogQWRkIFBTUCBibG9jayB0byB2ZXJpZnkgSERDUDIuMiBzdGVwcyIp
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwu
Y29tPgo+Cj4gUmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZD4KPgo+
IEhhcnJ5Cj4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVz
L2hkY3AvaGRjcF9wc3AuYyB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L21vZHVsZXMvaGRjcC9oZGNwX3BzcC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L21vZHVsZXMvaGRjcC9oZGNwX3BzcC5jCj4gPiBpbmRleCAyZGQ1ZmVlYzhlNmMuLjY3
OTFjNTg0NGU0MyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9t
b2R1bGVzL2hkY3AvaGRjcF9wc3AuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L21vZHVsZXMvaGRjcC9oZGNwX3BzcC5jCj4gPiBAQCAtNDIsNyArNDIsNyBAQCBzdGF0aWMg
dm9pZCBoZGNwMl9tZXNzYWdlX2luaXQoc3RydWN0IG1vZF9oZGNwICpoZGNwLAo+ID4gICAgICAg
aW4tPnByb2Nlc3MubXNnMl9kZXNjLm1zZ19pZCA9IFRBX0hEQ1BfSERDUDJfTVNHX0lEX19OVUxM
X01FU1NBR0U7Cj4gPiAgICAgICBpbi0+cHJvY2Vzcy5tc2cyX2Rlc2MubXNnX3NpemUgPSAwOwo+
ID4gICAgICAgaW4tPnByb2Nlc3MubXNnM19kZXNjLm1zZ19pZCA9IFRBX0hEQ1BfSERDUDJfTVNH
X0lEX19OVUxMX01FU1NBR0U7Cj4gPiAtICAgICBpbi0+cHJvY2Vzcy5tc2czX2Rlc2MubXNnX2lk
ID0gMDsKPiA+ICsgICAgIGluLT5wcm9jZXNzLm1zZzNfZGVzYy5tc2dfc2l6ZSA9IDA7Cj4gPiAg
fQo+ID4gIGVudW0gbW9kX2hkY3Bfc3RhdHVzIG1vZF9oZGNwX3JlbW92ZV9kaXNwbGF5X3RvcG9s
b2d5KHN0cnVjdCBtb2RfaGRjcCAqaGRjcCkKPiA+ICB7Cj4gPgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
