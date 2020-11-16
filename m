Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFAD2B51AF
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 20:57:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA8626EA4E;
	Mon, 16 Nov 2020 19:57:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28B66EA4B;
 Mon, 16 Nov 2020 19:57:07 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id d142so472625wmd.4;
 Mon, 16 Nov 2020 11:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/UCaw7X3P7z/cBmEH8BLiazMTEggP6Dng172R08XqlE=;
 b=nFLRdlWHDhI4/em2J4oMSbWjBy5R4ImhX7LV8vU1ixn1HBQXMYllhhhcwC2Vj4oH0P
 x10fZuCzUqw5PKY1YYnIwAm8BArxr2xMV9j2U3urB+JOxLRLP86eQGt1E/UJUf37VzUi
 SF3Ee5jsoxCHv0cr8mlSbPtnui98wj+jtfxyUCCvuejtaJ3yLV2ZMdviU8sWGgoQnVF4
 PTalG8ih1QEddSfnRuBn+wmZdD6o7D9YD4RfLaBhUb3nOzJqQYHlmzVzec99VnFXCKss
 SQWmL/9ANDBR+p8fyW5DW+9/hx1eHhTqUQIA55vJWUmPJ8o9/iGSJjcg4v5XJFqgWt9b
 iZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/UCaw7X3P7z/cBmEH8BLiazMTEggP6Dng172R08XqlE=;
 b=Kh+3M+r3XnrLe3Xnst62YvG4SBaq1+gf+7udOGx+jC0sS5brr1gOjVBgc657PzFSYH
 Lut1V3gOnI9vXxKYrpPDhpGDXhkVBKvIAwdc5/5Oxyyb67tYZhmokHDYTZWp9YmD9g8Q
 kAjwlohe4SjO3XRrjQnzF9cyg0Svoi+qGSqXCa+z5Xr1OgOyGPDHrxMA7OFEW8PDCUWU
 Xl4YE8JFK+m4K3NLhIgZTdUTimwFSNDe+w7lj53+7tKnV4ssP1Ad9tqPjp7lyDBeJF0B
 uVBY3E/fAiC2ylUQWz9vogt8pUlY2PM7CNMVSC10yDvYEMiz2Ri02PG2Dn/0DxRgG0Nb
 9eqw==
X-Gm-Message-State: AOAM531vKP2hb/kwMH3XBT4lSnPldu6Cm1D2wyeqWHGxAQzTcqF7HSsu
 /WFiKLc/pfniV3SKMrT7UEHwLXKejdgiqwQ3DJE=
X-Google-Smtp-Source: ABdhPJxCVpNqYs3aplYAyaOcRgyLwjP46yvCt4GGTWu8IPMC+qRBXB8iwEnsCdRX5XgAkvcTX1wkre9lWbQq4iRax/A=
X-Received: by 2002:a1c:1c3:: with SMTP id 186mr538158wmb.39.1605556626649;
 Mon, 16 Nov 2020 11:57:06 -0800 (PST)
MIME-Version: 1.0
References: <20201116173700.1830487-1-lee.jones@linaro.org>
 <20201116173700.1830487-16-lee.jones@linaro.org>
In-Reply-To: <20201116173700.1830487-16-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Nov 2020 14:56:55 -0500
Message-ID: <CADnq5_M2_Uu8Zf8OiOp8yOQmyYG0Lk=ist_CO+6u80_SOWyqjQ@mail.gmail.com>
Subject: Re: [PATCH 15/43] drm/radeon/atom: Move 'radeon_atom_hw_i2c_*()'s
 prototypes into shared header
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTYsIDIwMjAgYXQgMTI6MzcgUE0gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4gd3JvdGU6Cj4KPiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQg
d2FybmluZyhzKToKPgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2F0b21iaW9zX2kyYy5jOjEw
MDo1OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHJhZGVvbl9hdG9tX2h3
X2kyY194ZmVy4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAgMTAwIHwgaW50IHJhZGVvbl9h
dG9tX2h3X2kyY194ZmVyKHN0cnVjdCBpMmNfYWRhcHRlciAqaTJjX2FkYXAsCj4gIHwgXn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn4KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9hdG9tYmlvc19pMmMu
YzoxNTA6NTogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhyYWRlb25fYXRv
bV9od19pMmNfZnVuY+KAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gIDE1MCB8IHUzMiByYWRl
b25fYXRvbV9od19pMmNfZnVuYyhzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXApCj4gIHwgXn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn4KPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6
IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxl
eAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9hdG9tLmggICAgICAgfCA3ICsrKysr
KysKPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25faTJjLmMgfCA0IC0tLS0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9hdG9tLmggYi9kcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL2F0b20uaAo+IGluZGV4IDFiZjA2YzkxY2Q5NTkuLjVkZTA1NjNiNjNkMmUgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9hdG9tLmgKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL2F0b20uaAo+IEBAIC0xNTQsNiArMTU0LDEzIEBAIGJvb2wgYXRvbV9wYXJzZV9k
YXRhX2hlYWRlcihzdHJ1Y3QgYXRvbV9jb250ZXh0ICpjdHgsIGludCBpbmRleCwgdWludDE2X3Qg
KnNpemUsCj4gIGJvb2wgYXRvbV9wYXJzZV9jbWRfaGVhZGVyKHN0cnVjdCBhdG9tX2NvbnRleHQg
KmN0eCwgaW50IGluZGV4LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQ4X3QgKmZy
ZXYsIHVpbnQ4X3QgKmNyZXYpOwo+ICBpbnQgYXRvbV9hbGxvY2F0ZV9mYl9zY3JhdGNoKHN0cnVj
dCBhdG9tX2NvbnRleHQgKmN0eCk7Cj4gKwo+ICtzdHJ1Y3QgaTJjX21zZzsKPiArc3RydWN0IGky
Y19hZGFwdGVyOwo+ICtpbnQgcmFkZW9uX2F0b21faHdfaTJjX3hmZXIoc3RydWN0IGkyY19hZGFw
dGVyICppMmNfYWRhcCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGkyY19t
c2cgKm1zZ3MsIGludCBudW0pOwo+ICt1MzIgcmFkZW9uX2F0b21faHdfaTJjX2Z1bmMoc3RydWN0
IGkyY19hZGFwdGVyICphZGFwKTsKPiArCj4gICNpbmNsdWRlICJhdG9tLXR5cGVzLmgiCj4gICNp
bmNsdWRlICJhdG9tYmlvcy5oIgo+ICAjaW5jbHVkZSAiT2JqZWN0SUQuaCIKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25faTJjLmMgYi9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl9pMmMuYwo+IGluZGV4IGFhNjFiM2NiNDA0OWMuLmU1NDNkOTkzZjczZWUg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25faTJjLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9pMmMuYwo+IEBAIC0zNCwxMCArMzQsNiBA
QAo+ICAjaW5jbHVkZSAicmFkZW9uLmgiCj4gICNpbmNsdWRlICJhdG9tLmgiCj4KPiAtZXh0ZXJu
IGludCByYWRlb25fYXRvbV9od19pMmNfeGZlcihzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmkyY19hZGFw
LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGkyY19tc2cgKm1z
Z3MsIGludCBudW0pOwo+IC1leHRlcm4gdTMyIHJhZGVvbl9hdG9tX2h3X2kyY19mdW5jKHN0cnVj
dCBpMmNfYWRhcHRlciAqYWRhcCk7Cj4gLQo+ICBib29sIHJhZGVvbl9kZGNfcHJvYmUoc3RydWN0
IHJhZGVvbl9jb25uZWN0b3IgKnJhZGVvbl9jb25uZWN0b3IsIGJvb2wgdXNlX2F1eCkKPiAgewo+
ICAgICAgICAgdTggb3V0ID0gMHgwOwo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
