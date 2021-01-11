Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E81EB2F1915
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 16:03:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E09CC6E0FD;
	Mon, 11 Jan 2021 15:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B856E0EC;
 Mon, 11 Jan 2021 15:02:56 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id o11so17168053ote.4;
 Mon, 11 Jan 2021 07:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PVe5tb97fQjRx5AP2dVJADvRtz8yRPWNi+Pm6+8G1wo=;
 b=F0H3K3kl/cpn0wHHpdSyz4cCvw7cdUXyaHBy2e4ADlpp0Af3OGEV/BGcujhVD/Z2DN
 V0uqIDTHXJz2OX04ol2I/b3GDVIKmSbp5qBgEVMgWCNPmOcWAX9dJsO2qez3Iqvw7OY3
 N8Eh7mVDT6QnbAgbjouS5uEdL644XdHqWfEVGmw1IjNX1OdnkdEFMttZ0ETs16HWSR5L
 ly8TkHxnyaZJ4M+T9KQLpL2wNtcmuWn4fu51+c6ukm+XyGxX6QEd+591XPBYmV8hBGUv
 2bMNDbeun1Yx2IF3oHoW7grlSuAjExgB8czlMLB5HUTa1OcXQAsBj3s2m0gOLOZy1fEl
 cKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PVe5tb97fQjRx5AP2dVJADvRtz8yRPWNi+Pm6+8G1wo=;
 b=N1vb7haMq5QhwXxHifYBWUEdsocSS70P4VPYAIbaBLBJksX4T3V4eTOqfqo1vi0Dx9
 CWzZHVA6jNdtjBimFOwACwKxVYfjBnLThvKjaCee9jWFf9kylTxHJcP70SYIGQRx4w+r
 P6VxY3/Cdy4St1NfLrnNqajGCCnVqoO4PKqh8vaEz30CSYu3zzvQiL74PvzmsvFT34ph
 FGl5dYts7VM0CHy1QBoYqLA1Fa45A4LC3W/4ZrDtTT7hFRTnLRewdYEFJKAE2t1NyPQX
 n+YJNw/EQKUfmudMHimurUTVEa9zlxgLo9d2LxXY+h+8V41GpF/dxeX9cwEyN2+BSRq3
 7MOQ==
X-Gm-Message-State: AOAM531AxsT8UFaUf3tIdNeByTFrvcQebfo//bf8i67s7Ms3sCgZDAqv
 cXyWoNs5iR/qZ7jBS6a3EKd0BF6ZbFC/25TfrC0=
X-Google-Smtp-Source: ABdhPJw/80gBo+9eanDHSCpWvC5mz8+Y5OB7KfHePHxcimAqYWEk+W7zF8OfMF6O/CgVSghONYrwFcjfecFoL/ehgXE=
X-Received: by 2002:a05:6830:1b7b:: with SMTP id
 d27mr11714457ote.132.1610377374176; 
 Mon, 11 Jan 2021 07:02:54 -0800 (PST)
MIME-Version: 1.0
References: <20210110021142.28221-1-bas@basnieuwenhuizen.nl>
In-Reply-To: <20210110021142.28221-1-bas@basnieuwenhuizen.nl>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 11 Jan 2021 10:02:43 -0500
Message-ID: <CADnq5_OVtCubsGP=-=q-hYJ3e6a3=pozi7ZhDiqdUkUKLCiwMg@mail.gmail.com>
Subject: Re: [PATCH v2] drm: Check actual format for legacy pageflip.
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Zhan Liu <zhan.liu@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBKYW4gOSwgMjAyMSBhdCA5OjExIFBNIEJhcyBOaWV1d2VuaHVpemVuCjxiYXNAYmFz
bmlldXdlbmh1aXplbi5ubD4gd3JvdGU6Cj4KPiBXaXRoIG1vZGlmaWVycyBvbmUgY2FuIGFjdHVh
bGx5IGhhdmUgZGlmZmVyZW50IGZvcm1hdF9pbmZvIHN0cnVjdHMKPiBmb3IgdGhlIHNhbWUgZm9y
bWF0LCB3aGljaCBub3cgbWF0dGVycyBmb3IgQU1ER1BVIHNpbmNlIHdlIGNvbnZlcnQKPiBpbXBs
aWNpdCBtb2RpZmllcnMgdG8gZXhwbGljaXQgbW9kaWZpZXJzIHdpdGggbXVsdGlwbGUgcGxhbmVz
Lgo+Cj4gSSBjaGVja2VkIG90aGVyIGRyaXZlcnMgYW5kIGl0IGRvZXNuJ3QgbG9vayBsaWtlIHRo
ZXkgZW5kIHVwIHRyaWdnZXJpbmcKPiB0aGlzIGNhc2Ugc28gSSB0aGluayB0aGlzIGlzIHNhZmUg
dG8gcmVsYXguCj4KPiBTaWduZWQtb2ZmLWJ5OiBCYXMgTmlldXdlbmh1aXplbiA8YmFzQGJhc25p
ZXV3ZW5odWl6ZW4ubmw+Cj4gUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+Cj4gUmV2aWV3ZWQtYnk6IFpoYW4gTGl1IDx6aGFuLmxpdUBhbWQuY29tPgo+
IEFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4g
QWNrZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBGaXhl
czogODE2ODUzZjlkYzQwICgiZHJtL2FtZC9kaXNwbGF5OiBTZXQgbmV3IGZvcm1hdCBpbmZvIGZv
ciBjb252ZXJ0ZWQgbWV0YWRhdGEuIikKCkRvIHlvdSBoYXZlIGNvbW1pdCByaWdodHMgdG8gZHJt
LW1pc2Mgb3IgZG8geW91IG5lZWQgc29tZW9uZSB0byBjb21taXQKdGhpcyBmb3IgeW91PwoKVGhh
bmtzIQoKQWxleAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jIHwgOSArKysr
KysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fcGxhbmUuYwo+IGluZGV4IGU2MjMxOTQ3Zjk4Ny4uYTBjYjc0NmJjYjBhIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fcGxhbmUuYwo+IEBAIC0xMTYzLDcgKzExNjMsMTQgQEAgaW50IGRybV9tb2RlX3Bh
Z2VfZmxpcF9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ICAgICAgICAgaWYgKHJldCkK
PiAgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4KPiAtICAgICAgIGlmIChvbGRfZmItPmZvcm1h
dCAhPSBmYi0+Zm9ybWF0KSB7Cj4gKyAgICAgICAvKgo+ICsgICAgICAgICogT25seSBjaGVjayB0
aGUgRk9VUkNDIGZvcm1hdCBjb2RlLCBleGNsdWRpbmcgbW9kaWZpZXJzLiBUaGlzIGlzCj4gKyAg
ICAgICAgKiBlbm91Z2ggZm9yIGFsbCBsZWdhY3kgZHJpdmVycy4gQXRvbWljIGRyaXZlcnMgaGF2
ZSB0aGVpciBvd24KPiArICAgICAgICAqIGNoZWNrcyBpbiB0aGVpciAtPmF0b21pY19jaGVjayBp
bXBsZW1lbnRhdGlvbiwgd2hpY2ggd2lsbAo+ICsgICAgICAgICogcmV0dXJuIC1FSU5WQUwgaWYg
YW55IGh3IG9yIGRyaXZlciBjb25zdHJhaW50IGlzIHZpb2xhdGVkIGR1ZQo+ICsgICAgICAgICog
dG8gbW9kaWZpZXIgY2hhbmdlcy4KPiArICAgICAgICAqLwo+ICsgICAgICAgaWYgKG9sZF9mYi0+
Zm9ybWF0LT5mb3JtYXQgIT0gZmItPmZvcm1hdC0+Zm9ybWF0KSB7Cj4gICAgICAgICAgICAgICAg
IERSTV9ERUJVR19LTVMoIlBhZ2UgZmxpcCBpcyBub3QgYWxsb3dlZCB0byBjaGFuZ2UgZnJhbWUg
YnVmZmVyIGZvcm1hdC5cbiIpOwo+ICAgICAgICAgICAgICAgICByZXQgPSAtRUlOVkFMOwo+ICAg
ICAgICAgICAgICAgICBnb3RvIG91dDsKPiAtLQo+IDIuMjkuMgo+Cj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
