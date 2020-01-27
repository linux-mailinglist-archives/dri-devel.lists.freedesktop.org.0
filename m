Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 215BB14AC17
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 23:34:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3CE26EC0B;
	Mon, 27 Jan 2020 22:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86DF6EC09;
 Mon, 27 Jan 2020 22:34:34 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j42so13626127wrj.12;
 Mon, 27 Jan 2020 14:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hAr0lLsnamn+TWOtqM//b59aXBQhf0b+WX+RqHqqg9I=;
 b=N60jCKXxa4lYoVpyafaIvHc/D9Xn87NeGAg40q64LBdW/IIJoK98jkhBQ8YFRn5xBT
 7swEPELr21eVSzYRVKrGERIHZByHllHRwpNBueJnhR0yqfkdu941nyUsVzyevjaIesl6
 H29FpNMbaSKi+/Vpb68IPyyjxzX8bjvkSFDxwz9t9FjxadlADpf7KP9o9L9OqorlnUPO
 zFaK1WUb/Wcj3X9wn7QGGRrWI8Z6B7vlQQZqilLmtGul1L2FUagHRi4NHA14RH/T0sUa
 xwVKrFiYAkp2yrFjDeFX25JLIkzAC68cqKjSvjIawgZhe/UqkY5xkZj8sUMT+0HWl2Yu
 lW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hAr0lLsnamn+TWOtqM//b59aXBQhf0b+WX+RqHqqg9I=;
 b=dOpVDpxCrU1cwZOBhmLd52FnWkMzRxQA+CRZSZqIFGJedBY+vZUe3leEvOVALJQueL
 FrVomLTYns3a3CZV6qXVC+X+1dLDBmtheT6A9u9wzyG1b5eCxyGNfjD8SYFYBSoJq6lJ
 k0ZkSSSMKP/rAsAh0oKXZKioC5cRR39FeuJTvCiKqWVW6LKaMbFT5TFfNenQmaV3Nz59
 fbnFjcbklyA4Fo7dkx8V0gUmCKIoLH5kTW3Z+NJ0C2zUYakpcxmZuQi/ew0mLfAPjUtn
 BqUX8t3UASLRD3SatrQfAJR2WCezR1rHsrGhmqRnVs+od47XOUtK/PagF0d/SsKJqF1d
 pFfg==
X-Gm-Message-State: APjAAAVB8pSdfpNEVtDNu395sI45hcotbcAQTMgRHak4+zL8XX6Z8OlD
 SDASCM7WduljTCXsXEAnfsJTZdzTe6KLjbTCnTo=
X-Google-Smtp-Source: APXvYqwdW8L0y3X/ncIdIb+bY7xOXEfAlvxyq6PQfvKm4wcT8TfcKL7Zrd+JQX2H2hupoeTFFWgVHY3CC0fhQpfuy08=
X-Received: by 2002:adf:f2c1:: with SMTP id d1mr23891387wrp.111.1580164473320; 
 Mon, 27 Jan 2020 14:34:33 -0800 (PST)
MIME-Version: 1.0
References: <20200124200231.10517-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20200124200231.10517-1-ville.syrjala@linux.intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Jan 2020 17:34:21 -0500
Message-ID: <CADnq5_O_grxxHULror9+HYZM-Cvn5CTeLz10chpNKa_YCexzjA@mail.gmail.com>
Subject: Re: [PATCH 1/8] drm/edid: Check the number of detailed timing
 descriptors in the CEA ext block
To: Ville Syrjala <ville.syrjala@linux.intel.com>
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
Cc: Allen Chen <allen.chen@ite.com.tw>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKYW4gMjQsIDIwMjAgYXQgMzowMyBQTSBWaWxsZSBTeXJqYWxhCjx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+Cj4gQ0VBLTg2MSBzYXlzIDoKPiAiZCA9IG9m
ZnNldCBmb3IgdGhlIGJ5dGUgZm9sbG93aW5nIHRoZSByZXNlcnZlZCBkYXRhIGJsb2NrLgo+ICBJ
ZiBubyBkYXRhIGlzIHByb3ZpZGVkIGluIHRoZSByZXNlcnZlZCBkYXRhIGJsb2NrLCB0aGVuIGQ9
NC4KPiAgSWYgbm8gRFREcyBhcmUgcHJvdmlkZWQsIHRoZW4gZD0wLiIKPgo+IFNvIGxldCdzIG5v
dCBsb29rIGZvciBEVERzIHdoZW4gZD09MC4gSW4gZmFjdCBsZXQncyBqdXN0IG1ha2UgdGhhdAo+
IDw0IHNpbmNlIHRob3NlIHZhbHVlcyB3b3VsZCBqdXN0IG1lYW4gdGhhdCBoZSBEVERzIG92ZXJs
YXAgdGhlIGJsb2NrCj4gaGVhZGVyLiBBbmQgbGV0J3MgYWxzbyBjaGVjayB0aGF0IGQgaXNuJ3Qg
c28gYmlnIGFzIHRvIGRlY2xhcmUKPiB0aGUgZGVzY3JpcHRvcnMgdG8gbGl2ZSBwYXN0IHRoZSBi
bG9jayBlbmQsIGFsdGhvdWdoIHRoZSBjb2RlCj4gZG9lcyBhbHJlYWR5IHN1cnZpdmUgdGhhdCBj
YXNlIGFzIHdlJ2QganVzdCBlbmQgdXAgd2l0aCBhIG5lZ2F0aXZlCj4gbnVtYmVyIG9mIGRlc2Ny
aXB0b3JzIGFuZCB0aGUgbG9vcCB3b3VsZCBub3QgZG8gYW55dGhpbmcuCj4KPiBDYzogQWxsZW4g
Q2hlbiA8YWxsZW4uY2hlbkBpdGUuY29tLnR3Pgo+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrD
pGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CgpBY2tlZC1ieTogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJt
L2RybV9lZGlkLmMgfCA1ICsrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQu
YyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4gaW5kZXggOTk3NjlkNmM5Zjg0Li4xYjZl
NTQ0Y2Y1YzcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwo+IEBAIC0yMjAxLDEwICsyMjAxLDEzIEBAIHR5
cGVkZWYgdm9pZCBkZXRhaWxlZF9jYihzdHJ1Y3QgZGV0YWlsZWRfdGltaW5nICp0aW1pbmcsIHZv
aWQgKmNsb3N1cmUpOwo+ICBzdGF0aWMgdm9pZAo+ICBjZWFfZm9yX2VhY2hfZGV0YWlsZWRfYmxv
Y2sodTggKmV4dCwgZGV0YWlsZWRfY2IgKmNiLCB2b2lkICpjbG9zdXJlKQo+ICB7Cj4gLSAgICAg
ICBpbnQgaSwgbiA9IDA7Cj4gKyAgICAgICBpbnQgaSwgbjsKPiAgICAgICAgIHU4IGQgPSBleHRb
MHgwMl07Cj4gICAgICAgICB1OCAqZGV0X2Jhc2UgPSBleHQgKyBkOwo+Cj4gKyAgICAgICBpZiAo
ZCA8IDQgfHwgZCA+IDEyNykKPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+ICsKPiAgICAgICAg
IG4gPSAoMTI3IC0gZCkgLyAxODsKPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBuOyBpKyspCj4g
ICAgICAgICAgICAgICAgIGNiKChzdHJ1Y3QgZGV0YWlsZWRfdGltaW5nICopKGRldF9iYXNlICsg
MTggKiBpKSwgY2xvc3VyZSk7Cj4gLS0KPiAyLjI0LjEKPgo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
