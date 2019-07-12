Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E554E674BB
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 19:51:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE106E30E;
	Fri, 12 Jul 2019 17:51:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2077D6E30D;
 Fri, 12 Jul 2019 17:51:23 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c2so7614919wrm.8;
 Fri, 12 Jul 2019 10:51:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fYa05UH7mYYSqEPDopwNxAMSVNVWoZBhWk4yJQZslm8=;
 b=V2cSPo6m/TlbeYpeMUFQlEEXCznzCuuNGY0pGtoUZR6ARcHkxt/QxrBD2XKuMNu81r
 MAoTnzqkFIb/P2RkFz6h+A0Qj4/aD1ttiYC7Tn0xMv5vGaRuUOfzkZ6E4a6T4OMcwjnK
 pKZTnybfew6CBrA0R0GIuSgEOidRAzxAb3qGzNhNu+vIq3EixUftrGpUSUWrOE99VD9F
 iWs7jWVU9qIrlLjWfY5BYdtEXzuK6QhKw3fAB+UNZayuf2M5ril/tDZcc028IaKWYIBo
 89gpmksNdHL/jcMowx5CGXknevLWKzBPXQq7zuZTDCyZKy4dQF7ja0uqe6YQ6vjRR/Oq
 77Cw==
X-Gm-Message-State: APjAAAW7HXa2yNZ8QO2CPcoIkOIt6v3s10qUDWcbi4qCq20Rj4S+Ve2y
 tlzfdvofXSfzC4Wv9XMvX3vU5W8h5Rt9fApAthY=
X-Google-Smtp-Source: APXvYqxzKqSnB6g+6t1T4eeuBWsXb+aYieIdJBcbsr58GeWc1PwO1xAStg2YUGXX0pq2k45hxpR19iL74Le3Dm4+RLM=
X-Received: by 2002:a5d:6b11:: with SMTP id v17mr12482439wrw.323.1562953881684; 
 Fri, 12 Jul 2019 10:51:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190712093720.1461418-1-arnd@arndb.de>
In-Reply-To: <20190712093720.1461418-1-arnd@arndb.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 12 Jul 2019 13:51:09 -0400
Message-ID: <CADnq5_Mm=Fj4AkFtuo+W_295q8r6DY3Sumo7gTG-McUYY=CeVg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Support clang option for stack alignment
To: Arnd Bergmann <arnd@arndb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=fYa05UH7mYYSqEPDopwNxAMSVNVWoZBhWk4yJQZslm8=;
 b=nDMX9IINQd40UuthTZ+AmI54a9XV2VKnSmT2iOJ76YzakV3CCrBZn6HHV/Iy+6D1Q2
 yV7+Gqc8jWCNxrJffxHVlnHbYfm0+u0PG4+TqxJFlurXYJ2kUoQ3OhSVNf8EgJH/rZDj
 yw2t/Z9Yy3mBhGp3urERGvBhMmnUX0z96s6JX/V0wyyOtf/gEL9qdtuq4/NK3jhHssmt
 Ch0i+abC6cTcE/uyDHf8yc7WRGouGfIUzpedzlQoiJN4R2kOY4k5Ap4YYqeImWQCmJZI
 F5Ntn4NNH4QZB3cR28U3yALBzpblBiMd3bUGbFAO5pjNEdfaL+TLvrOts+YLAh8T2ccC
 Fixw==
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>, Duke Du <Duke.Du@amd.com>,
 Charlene Liu <charlene.liu@amd.com>, Leo Li <sunpeng.li@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 clang-built-linux@googlegroups.com, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTIsIDIwMTkgYXQgNTozNyBBTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRi
LmRlPiB3cm90ZToKPgo+IEFzIHByZXZpb3VzbHkgZml4ZWQgZm9yIGRtbCBpbiBjb21taXQgNDc2
OTI3OGU1YzdmICgiYW1kZ3B1L2RjL2RtbDoKPiBTdXBwb3J0IGNsYW5nIG9wdGlvbiBmb3Igc3Rh
Y2sgYWxpZ25tZW50IikgYW5kIGNhbGNzIGluIGNvbW1pdAo+IGNjMzJhZDhmNTU5YyAoImFtZGdw
dS9kYy9jYWxjczogU3VwcG9ydCBjbGFuZyBvcHRpb24gZm9yIHN0YWNrCj4gYWxpZ25tZW50Iiks
IGRjbjIwIHVzZXMgYW4gb3B0aW9uIHRoYXQgaXMgbm90IGF2YWlsYWJsZSB3aXRoIGNsYW5nOgo+
Cj4gY2xhbmc6IGVycm9yOiB1bmtub3duIGFyZ3VtZW50OiAnLW1wcmVmZXJyZWQtc3RhY2stYm91
bmRhcnk9NCcKPiBzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjI4MTogcmVjaXBlIGZvciB0YXJnZXQg
J2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVz
b3VyY2UubycgZmFpbGVkCj4KPiBVc2UgdGhlIHNhbWUgdHJpY2sgdGhhdCB3ZSBoYXZlIGluIHRo
ZSBvdGhlciB0d28gZmlsZXMuCj4KPiBGaXhlczogN2VkNGU2MzUyYzE2ICgiZHJtL2FtZC9kaXNw
bGF5OiBBZGQgRENOMiBIVyBTZXF1ZW5jZXIgYW5kIFJlc291cmNlIikKPiBTaWduZWQtb2ZmLWJ5
OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgoKQXBwbGllZC4gIHRoYW5rcyEKCkFsZXgK
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9NYWtlZmlsZSB8
ICA4ICsrKysrKystCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kc2MvTWFrZWZp
bGUgICB8IDE2ICsrKysrKysrKysrKy0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRp
b25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY24yMC9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY24yMC9NYWtlZmlsZQo+IGluZGV4IDFiNjhkZTI3YmE3NC4uZTk3MjFhOTA2NTkyIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9NYWtlZmls
ZQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9NYWtlZmlsZQo+
IEBAIC0xMCw3ICsxMCwxMyBAQCBpZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19EU0NfU1VQUE9SVAo+
ICBEQ04yMCArPSBkY24yMF9kc2Mubwo+ICBlbmRpZgo+Cj4gLUNGTEFHU19kY24yMF9yZXNvdXJj
ZS5vIDo9IC1taGFyZC1mbG9hdCAtbXNzZSAtbXByZWZlcnJlZC1zdGFjay1ib3VuZGFyeT00Cj4g
K2lmbmVxICgkKGNhbGwgY2Mtb3B0aW9uLCAtbXByZWZlcnJlZC1zdGFjay1ib3VuZGFyeT00KSwp
Cj4gKyAgICAgICBjY19zdGFja19hbGlnbiA6PSAtbXByZWZlcnJlZC1zdGFjay1ib3VuZGFyeT00
Cj4gK2Vsc2UgaWZuZXEgKCQoY2FsbCBjYy1vcHRpb24sIC1tc3RhY2stYWxpZ25tZW50PTE2KSwp
Cj4gKyAgICAgICBjY19zdGFja19hbGlnbiA6PSAtbXN0YWNrLWFsaWdubWVudD0xNgo+ICtlbmRp
Zgo+ICsKPiArQ0ZMQUdTX2RjbjIwX3Jlc291cmNlLm8gOj0gLW1oYXJkLWZsb2F0IC1tc3NlICQo
Y2Nfc3RhY2tfYWxpZ24pCj4KPiAgQU1EX0RBTF9EQ04yMCA9ICQoYWRkcHJlZml4ICQoQU1EREFM
UEFUSCkvZGMvZGNuMjAvLCQoRENOMjApKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kc2MvTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZHNjL01ha2VmaWxlCj4gaW5kZXggYzVkNWI5NGUyNjA0Li5lMDE5Y2Q5NDQ3ZTggMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RzYy9NYWtlZmlsZQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kc2MvTWFrZWZpbGUKPiBAQCAt
MSwxMCArMSwxOCBAQAo+ICAjCj4gICMgTWFrZWZpbGUgZm9yIHRoZSAnZHNjJyBzdWItY29tcG9u
ZW50IG9mIERBTC4KPgo+IC1DRkxBR1NfcmNfY2FsYy5vIDo9IC1taGFyZC1mbG9hdCAtbXNzZSAt
bXByZWZlcnJlZC1zdGFjay1ib3VuZGFyeT00Cj4gLUNGTEFHU19yY19jYWxjX2RwaS5vIDo9IC1t
aGFyZC1mbG9hdCAtbXNzZSAtbXByZWZlcnJlZC1zdGFjay1ib3VuZGFyeT00Cj4gLUNGTEFHU19j
b2RlY19tYWluX2FtZC5vIDo9IC1taGFyZC1mbG9hdCAtbXNzZSAtbXByZWZlcnJlZC1zdGFjay1i
b3VuZGFyeT00Cj4gLUNGTEFHU19kY19kc2MubyA6PSAtbWhhcmQtZmxvYXQgLW1zc2UgLW1wcmVm
ZXJyZWQtc3RhY2stYm91bmRhcnk9NAo+ICtpZm5lcSAoJChjYWxsIGNjLW9wdGlvbiwgLW1wcmVm
ZXJyZWQtc3RhY2stYm91bmRhcnk9NCksKQo+ICsgICAgICAgY2Nfc3RhY2tfYWxpZ24gOj0gLW1w
cmVmZXJyZWQtc3RhY2stYm91bmRhcnk9NAo+ICtlbHNlIGlmbmVxICgkKGNhbGwgY2Mtb3B0aW9u
LCAtbXN0YWNrLWFsaWdubWVudD0xNiksKQo+ICsgICAgICAgY2Nfc3RhY2tfYWxpZ24gOj0gLW1z
dGFjay1hbGlnbm1lbnQ9MTYKPiArZW5kaWYKPiArCj4gK2RzY19jY2ZsYWdzIDo9IC1taGFyZC1m
bG9hdCAtbXNzZSAkKGNjX3N0YWNrX2FsaWduKQo+ICsKPiArQ0ZMQUdTX3JjX2NhbGMubyA6PSAk
KGRzY19jY2ZsYWdzKQo+ICtDRkxBR1NfcmNfY2FsY19kcGkubyA6PSAkKGRzY19jY2ZsYWdzKQo+
ICtDRkxBR1NfY29kZWNfbWFpbl9hbWQubyA6PSAkKGRzY19jY2ZsYWdzKQo+ICtDRkxBR1NfZGNf
ZHNjLm8gOj0gJChkc2NfY2NmbGFncykKPgo+ICBEU0MgPSBkY19kc2MubyByY19jYWxjLm8gcmNf
Y2FsY19kcGkubwo+Cj4gLS0KPiAyLjIwLjAKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
