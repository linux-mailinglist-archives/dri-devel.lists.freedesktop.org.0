Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD19CBAC8
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 14:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 660A76EB6A;
	Fri,  4 Oct 2019 12:47:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D916EB68;
 Fri,  4 Oct 2019 12:47:18 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z9so6993105wrl.11;
 Fri, 04 Oct 2019 05:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SnebWYdJq5RJ8cEGOskgzENwcS3jAgltFMpNIZXBTo4=;
 b=s8Vaal3MGQJ36G9NjVIeLL4XGCIh496Fr3GIc8fiEOrM/2tZ8lKi75fWDehU/xRTT8
 gzR8f0+GGmLQC63JAce2Yo0Lp2T4Ru7hHIhLZ9fJuV/rqw9icBCZenFv5OqWTcmdxF2D
 0mWVcPmWofG0B7mX6sP5HViMMavm54AJyhu7GD3vcz0EeqEVrYVPLa/jfviszfUnDubt
 LgzN91oyR44sg4I+KDHGmPs3rryKcCpHAa/RP0m6MNJVKLfTewzm+TPTk/BPlAvdNCyw
 UqIJTc+ZQwcOKWkCxmssOy82DvgieFlAqn6pXKwlSbFnM7yxkvt3Iz7lqZG6TROPzc3p
 LZDA==
X-Gm-Message-State: APjAAAW+boLMWWPLAGjxW4DP+4duzAV5bcrjsYmHEG8Sp/dp7CEE+UFr
 Mli6dU9dAnPoLBusXC1Y9UYr29aeespyKeWpPa4=
X-Google-Smtp-Source: APXvYqyHGplE6tzKrXPkrAcz3R4MEH3r4IEGdZQAC3Z2CzFZCEIhK4LND+A4dyFM5Qjrm3e4tXbYRQvmcyVdbJjIvsU=
X-Received: by 2002:adf:f287:: with SMTP id k7mr12034831wro.206.1570193236775; 
 Fri, 04 Oct 2019 05:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <20191003142423.v3.1.I5c52c59b731fe266252588ab2b32c0e3d4d808f1@changeid>
In-Reply-To: <20191003142423.v3.1.I5c52c59b731fe266252588ab2b32c0e3d4d808f1@changeid>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 4 Oct 2019 08:47:04 -0400
Message-ID: <CADnq5_OzUR12aLNgF1fO2JNZOwK=7z8SP8GvsWtSZo9bjnOVKg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/amd/display: fix struct init in update_bounding_box
To: Raul E Rangel <rrangel@chromium.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=SnebWYdJq5RJ8cEGOskgzENwcS3jAgltFMpNIZXBTo4=;
 b=bGrIHGsJyA0Ku8gQIGnulfy2eoAecu7Xnx4vhgTr1CTIIh2mWqpFMN+hktK7ZH/ZDF
 2vqwflC2++y0bDvYfmv+FnUKt/hfuQSamUhZxXF+viicwwhX8uIzYnfQ62rAPQ1JhGtV
 0fex/UsHZZ3DhnMk9Syvl0Dpxl4hklf22sGum4BbDlOAY5+NWdZVA2okrLswTzfyDpio
 p4N8DNu3eToUV0BaxtTy/i8jjK1GVitURbxsv8t1xGzBVoZ1ULMo80g2CwIFiV9pUSK5
 l3EBOtXK+6klcsVi4hwp0DF2MHCQ0tPwl80wQD3OPbV4GIb9qvI0B6aEM3JZ6GK7ennF
 Dh+w==
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
Cc: Charlene Liu <charlene.liu@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Nikola Cornij <nikola.cornij@amd.com>, David Airlie <airlied@linux.ie>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 hersen wu <hersenxs.wu@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMywgMjAxOSBhdCA0OjM1IFBNIFJhdWwgRSBSYW5nZWwgPHJyYW5nZWxAY2hy
b21pdW0ub3JnPiB3cm90ZToKPgo+IGRjbjIwX3Jlc291cmNlLmM6MjYzNjo5OiBlcnJvcjogbWlz
c2luZyBicmFjZXMgYXJvdW5kIGluaXRpYWxpemVyIFstV2Vycm9yPW1pc3NpbmctYnJhY2VzXQo+
ICAgc3RydWN0IF92Y3NfZHBpX3ZvbHRhZ2Vfc2NhbGluZ19zdCBjYWxjdWxhdGVkX3N0YXRlc1tN
QVhfQ0xPQ0tfTElNSVRfU1RBVEVTXSA9IHswfTsKPiAgICAgICAgICBeCj4KPiBGaXhlczogN2Vk
NGU2MzUyYzE2ZiAoImRybS9hbWQvZGlzcGxheTogQWRkIERDTjIgSFcgU2VxdWVuY2VyIGFuZCBS
ZXNvdXJjZSIpCj4KPiBTaWduZWQtb2ZmLWJ5OiBSYXVsIEUgUmFuZ2VsIDxycmFuZ2VsQGNocm9t
aXVtLm9yZz4KCkFwcGxpZWQuICB0aGFua3MhCgpBbGV4Cgo+Cj4gLS0tCj4KPiBDaGFuZ2VzIGlu
IHYzOgo+IC0gVXNlIG1lbXNldAo+Cj4gQ2hhbmdlcyBpbiB2MjoKPiAtIFVzZSB7ezB9fSBpbnN0
ZWFkIG9mIHt9Cj4KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIw
X3Jlc291cmNlLmMgfCA0ICsrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKPiBpbmRleCBiOTQ5ZTIwMmQ2Y2I3Li5mNzJjMjZh
ZTQxZGVmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24y
MC9kY24yMF9yZXNvdXJjZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKPiBAQCAtMjYzMyw3ICsyNjMzLDcgQEAgc3RhdGljIHZv
aWQgY2FwX3NvY19jbG9ja3MoCj4gIHN0YXRpYyB2b2lkIHVwZGF0ZV9ib3VuZGluZ19ib3goc3Ry
dWN0IGRjICpkYywgc3RydWN0IF92Y3NfZHBpX3NvY19ib3VuZGluZ19ib3hfc3QgKmJiLAo+ICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgcHBfc211X252X2Nsb2NrX3RhYmxlICptYXhfY2xvY2tzLCB1
bnNpZ25lZCBpbnQgKnVjbGtfc3RhdGVzLCB1bnNpZ25lZCBpbnQgbnVtX3N0YXRlcykKPiAgewo+
IC0gICAgICAgc3RydWN0IF92Y3NfZHBpX3ZvbHRhZ2Vfc2NhbGluZ19zdCBjYWxjdWxhdGVkX3N0
YXRlc1tNQVhfQ0xPQ0tfTElNSVRfU1RBVEVTXSA9IHswfTsKPiArICAgICAgIHN0cnVjdCBfdmNz
X2RwaV92b2x0YWdlX3NjYWxpbmdfc3QgY2FsY3VsYXRlZF9zdGF0ZXNbTUFYX0NMT0NLX0xJTUlU
X1NUQVRFU107Cj4gICAgICAgICBpbnQgaTsKPiAgICAgICAgIGludCBudW1fY2FsY3VsYXRlZF9z
dGF0ZXMgPSAwOwo+ICAgICAgICAgaW50IG1pbl9kY2ZjbGsgPSAwOwo+IEBAIC0yNjQxLDYgKzI2
NDEsOCBAQCBzdGF0aWMgdm9pZCB1cGRhdGVfYm91bmRpbmdfYm94KHN0cnVjdCBkYyAqZGMsIHN0
cnVjdCBfdmNzX2RwaV9zb2NfYm91bmRpbmdfYm94Xwo+ICAgICAgICAgaWYgKG51bV9zdGF0ZXMg
PT0gMCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+Cj4gKyAgICAgICBtZW1zZXQoY2FsY3Vs
YXRlZF9zdGF0ZXMsIDAsIHNpemVvZihjYWxjdWxhdGVkX3N0YXRlcykpOwo+ICsKPiAgICAgICAg
IGlmIChkYy0+YmJfb3ZlcnJpZGVzLm1pbl9kY2ZjbGtfbWh6ID4gMCkKPiAgICAgICAgICAgICAg
ICAgbWluX2RjZmNsayA9IGRjLT5iYl9vdmVycmlkZXMubWluX2RjZmNsa19taHo7Cj4gICAgICAg
ICBlbHNlCj4gLS0KPiAyLjIzLjAuNDQ0LmcxOGVlYjVhMjY1LWdvb2cKPgo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxp
c3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
