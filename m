Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8303F181BDD
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 15:56:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E3C6E453;
	Wed, 11 Mar 2020 14:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C096E453
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 14:56:48 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id l7so1968580lfe.13
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 07:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GmYZJWLzaweKbjA28eqXqX3ANCtVFKajYI6zqwqrpII=;
 b=Qkii8UeMpdOo0BJ7fw3IdY9x8QSyjjQbjpjamUpG9OsLids92gNKeKHMG+wU4oQ0CF
 TQaOO2JGPZlBmAFrGOZuXr3DH8hnp9e5JezreWNw0T89J0Z3Be0v+UH7QENdTpfZfkMj
 vi+o5pc4vGpgXrsjvdvvyQZf4XhLqBROpHRJIRRu0lMiu4uzF9MwLrtbfjWhzX8CuIA3
 +/7BY9v+wnpupk5EYDfICkepT4Ev8kbO2iZtGMnRLmf+u5eshIK2yP0Lmc/1Hqpd1B8C
 u8jRbBeTy1A+ZFWxDYlnMqKvvtvT2VQCHSwcgGBc3g0hTdBmFcHXjm8vFGU0QZB0pPOF
 Ft6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GmYZJWLzaweKbjA28eqXqX3ANCtVFKajYI6zqwqrpII=;
 b=b6iiFLKuOTWw+giVH1bT+qzCr68GiMv05hCFUiPUo9Ca+HxJalzZ7//BoSdIgrRGEs
 SivzbH2WwNHRTxigbGn2R/cFvGxlanGJb2BbawWro+WGkm5suW0BdqBZXcqDj1lkpd5s
 3b9FNnn9vjTXMNwhsXsNISgEw3WgO40rbkKTkWR1K1byb2o6wU46HmndbVpuvuIddSii
 JKy22nhFxMpDIZP+aFcvVbKL2/v1ymMk774cssixJmQiiMR7p++LZmNPVClGjZRsmKGE
 pUWYVKCpWw7J/V2ffrWaP0XIDo24Kons/PxWrNSIkCmq6vdZ3WTNLE1y3mxkBIzm4KhQ
 rujg==
X-Gm-Message-State: ANhLgQ0MGYeqcEEZ1P/+6X1V2c7zePUHXiTS4i3ShTGIrF5nRm9zcLXy
 5kTRNN9xHV5zaWWxl12W8y5A0zunbvg1PRMiALE=
X-Google-Smtp-Source: ADFU+vuVHFC6baj45dZucsJeqkrk7QoMGaIcgw+HFoJkhNgEJub8RfHJuLv2TbJV1kW/Iq5mg9BmpT/egzGjN9G8yic=
X-Received: by 2002:ac2:59d9:: with SMTP id x25mr1407155lfn.56.1583938606366; 
 Wed, 11 Mar 2020 07:56:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-32-ville.syrjala@linux.intel.com>
In-Reply-To: <20200302203452.17977-32-ville.syrjala@linux.intel.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 11 Mar 2020 11:56:34 -0300
Message-ID: <CAOMZO5DrOLDO8rO_Tdq2X0fJi0jVPsqHfkSzXt_dWs1VO4NcOg@mail.gmail.com>
Subject: Re: [PATCH 31/33] drm/panel-simple: Fix dotclock for XT
 VL050-8048NT-C01
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
Cc: Thierry Reding <treding@nvidia.com>, Sam Ravnborg <sam@ravnborg.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVmlsbGUsCgpPbiBNb24sIE1hciAyLCAyMDIwIGF0IDU6MzYgUE0gVmlsbGUgU3lyamFsYQo8
dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogVmlsbGUgU3ly
asOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPgo+IFRoZSBjdXJyZW50bHkg
bGlzdGVkIGRvdGNsb2NrIGRpc2FncmVlcyB3aXRoIHRoZSBjdXJyZW50bHkKPiBsaXN0ZWQgdnJl
ZnJlc2ggcmF0ZS4gQ2hhbmdlIHRoZSBkb3RjbG9jayB0byBtYXRjaCB0aGUgdnJlZnJlc2guCj4K
PiBTb21lb25lIHRlbGwgbWUgd2hpY2ggKGlmIGVpdGhlcikgb2YgdGhlIGRvdGNsb2NrIG9yIHZy
ZXJlc2ggaXMKPiBjb3JyZWN0Pwo+Cj4gQ2M6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWls
LmNvbT4KPiBDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IENjOiBUaGllcnJ5
IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrD
pGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3BhbmVsL3BhbmVsLXNpbXBsZS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBs
ZS5jCj4gaW5kZXggNWNlMTMyOGZkN2RjLi42YjQ4YzAyYWYxMTIgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4gQEAgLTMzNjgsNyArMzM2OCw3IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgcGFuZWxfZGVzYyB1cnRfdW1zaF84NTk2bWRfcGFyYWxsZWwgPSB7Cj4gIH07Cj4K
PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIHZsMDUwXzgwNDhudF9jMDFf
bW9kZSA9IHsKPiAtICAgICAgIC5jbG9jayA9IDMzMzMzLAo+ICsgICAgICAgLmNsb2NrID0gMzQ1
NDAsCgpJIGRvbid0IGhhdmUgYWNjZXNzIHRvIGhhcmR3YXJlIHRvIHRlc3QgdGhpcyBjaGFuZ2Ug
YXQgdGhlIG1vbWVudCwgYnV0Cmxvb2tpbmcgYXQgdGhlIHBhbmVsIGRhdGFzaGVldCBJIHNlZSB0
aGF0IDM0LjU0TUh6IGlzIHN0aWxsIGluc2lkZSB0aGUKdmFsaWQgcmFuZ2U6CgpSZXZpZXdlZC1i
eTogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
