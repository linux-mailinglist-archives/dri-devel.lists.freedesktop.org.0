Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4323C3640B4
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 13:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4934C88F2D;
	Mon, 19 Apr 2021 11:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70FE88F2D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 11:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618832668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y644e2+cDS7jfFg2KG/GSDehn2zis7rBbTsBszQ7ZZc=;
 b=X4dUySfFg7+YADTeFr7pfxkCN0H0vviMDYuUSxPyrGMFWpK89rYK8d0cq6c37l0LluP9cX
 Q4kalnvwiRswpATNydtIuEsn0kzi+zCnA37wRuMXjanRpopn2NKq6/Xz44z/pTTjpUTNyW
 cd8QiCPvFP4acW+CUDhlp5Pa3KnLtP4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-EHxUeDaoMtmgBhuFB51yIg-1; Mon, 19 Apr 2021 07:44:27 -0400
X-MC-Unique: EHxUeDaoMtmgBhuFB51yIg-1
Received: by mail-wr1-f69.google.com with SMTP id
 91-20020adf92e40000b029010470a9ebc4so7837208wrn.14
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 04:44:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=y644e2+cDS7jfFg2KG/GSDehn2zis7rBbTsBszQ7ZZc=;
 b=CQcoaUCOdaHqA96ozCpYpojbNO6qrSrlJHv4oIfS2aNA8NIDMEXEipQsh09XgdgMZT
 +BG69aUiTqigCHJ5fIMKpIgpgxAS06hUDy2HPg/ny5lC8RP8RSyqhJFJDQYOAF6KbKzK
 /B9+pNBs7yoFfHFDPRI5iKiW6y0LsaOsJ+zJIxs250pjkbTlLH2X7gtCYMTltPy6XHrE
 9g8Juh4MUbuGMJ9MeDxO1Fg+vZDtariZRXZ4bpwKfck7ZzgayEckUMlrkIuv4e3Hu907
 omc1P7lU2ko4c0+OXK57MoafzAO5vIl8xeU2i55h1oL+RSniBMwDPLrXz5dANhS1J++V
 nlyg==
X-Gm-Message-State: AOAM531WEHFRLzaT3iXx8+/ANx6H88JqPYzW+OfS2Y9ZKe7E4jZn4/ij
 fuRzV5SxItYWZWOsX+X4zezE0R6R+mHWLsqgzVfxYX4T5Wv8hPTEyobvS0VGhscken/LS+8vcUD
 Y4eQo2i1jL212QibyDSZPMHnoE3u5LcSrVbdimpjwoqCZ
X-Received: by 2002:a5d:58fa:: with SMTP id f26mr13544849wrd.177.1618832666331; 
 Mon, 19 Apr 2021 04:44:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjlugWDWLZH+5rQly0tRCQFzwosoMjd14Y9bJuAnMN5V/27+yHQMkQQGZjse8w/vAsAyaiT8Vc7UJvMHq5TOE=
X-Received: by 2002:a5d:58fa:: with SMTP id f26mr13544835wrd.177.1618832666229; 
 Mon, 19 Apr 2021 04:44:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-8-lee.jones@linaro.org>
In-Reply-To: <20210416143725.2769053-8-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 19 Apr 2021 13:44:15 +0200
Message-ID: <CACO55tvQ=dvDbwzWmwn7ZOwqyStEXn3=8zab6rQSiau3OkKktQ@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 07/40] drm/nouveau/nouveau_bo: Remove unused
 variables 'dev'
To: Lee Jones <lee.jones@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Jeremy Kolb <jkolb@brandeis.edu>, David Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Ben Skeggs <bskeggs@redhat.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEthcm9sIEhlcmJzdCA8a2hlcmJzdEByZWRoYXQuY29tPgoKT24gRnJpLCBB
cHIgMTYsIDIwMjEgYXQgNDozNyBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPiB3
cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMp
Ogo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYzogSW4gZnVuY3Rpb24g
4oCYbm91dmVhdV90dG1fdHRfcG9wdWxhdGXigJk6Cj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L25vdXZlYXVfYm8uYzoxMjI4OjE3OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhkZXbigJkgc2V0IGJ1
dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPiAgZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbm91dmVhdV9iby5jOiBJbiBmdW5jdGlvbiDigJhub3V2ZWF1X3R0bV90dF91bnBv
cHVsYXRl4oCZOgo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmM6MTI1Mjox
Nzogd2FybmluZzogdmFyaWFibGUg4oCYZGV24oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2Vk
LWJ1dC1zZXQtdmFyaWFibGVdCj4KPiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29t
Pgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGlu
YXJvLm9yZz4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+Cj4gQ2M6IEplcmVteSBLb2xiIDxqa29sYkBicmFuZGVpcy5lZHU+Cj4gQ2M6IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbmFyby1tbS1zaWdA
bGlzdHMubGluYXJvLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxp
bmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYyB8
IDQgLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9ub3V2ZWF1X2JvLmMKPiBpbmRleCAzZTA5ZGYwNDcyY2U0Li4zN2IzZDJjMTBmNWM1
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwo+IEBAIC0xMjU1LDcgKzEy
NTUsNiBAQCBub3V2ZWF1X3R0bV90dF9wb3B1bGF0ZShzdHJ1Y3QgdHRtX2RldmljZSAqYmRldiwK
PiAgewo+ICAgICAgICAgc3RydWN0IHR0bV90dCAqdHRtX2RtYSA9ICh2b2lkICopdHRtOwo+ICAg
ICAgICAgc3RydWN0IG5vdXZlYXVfZHJtICpkcm07Cj4gLSAgICAgICBzdHJ1Y3QgZGV2aWNlICpk
ZXY7Cj4gICAgICAgICBib29sIHNsYXZlID0gISEodHRtLT5wYWdlX2ZsYWdzICYgVFRNX1BBR0Vf
RkxBR19TRyk7Cj4KPiAgICAgICAgIGlmICh0dG1fdHRfaXNfcG9wdWxhdGVkKHR0bSkpCj4gQEAg
LTEyNjgsNyArMTI2Nyw2IEBAIG5vdXZlYXVfdHRtX3R0X3BvcHVsYXRlKHN0cnVjdCB0dG1fZGV2
aWNlICpiZGV2LAo+ICAgICAgICAgfQo+Cj4gICAgICAgICBkcm0gPSBub3V2ZWF1X2JkZXYoYmRl
dik7Cj4gLSAgICAgICBkZXYgPSBkcm0tPmRldi0+ZGV2Owo+Cj4gICAgICAgICByZXR1cm4gdHRt
X3Bvb2xfYWxsb2MoJmRybS0+dHRtLmJkZXYucG9vbCwgdHRtLCBjdHgpOwo+ICB9Cj4gQEAgLTEy
NzgsMTQgKzEyNzYsMTIgQEAgbm91dmVhdV90dG1fdHRfdW5wb3B1bGF0ZShzdHJ1Y3QgdHRtX2Rl
dmljZSAqYmRldiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB0dG1fdHQgKnR0
bSkKPiAgewo+ICAgICAgICAgc3RydWN0IG5vdXZlYXVfZHJtICpkcm07Cj4gLSAgICAgICBzdHJ1
Y3QgZGV2aWNlICpkZXY7Cj4gICAgICAgICBib29sIHNsYXZlID0gISEodHRtLT5wYWdlX2ZsYWdz
ICYgVFRNX1BBR0VfRkxBR19TRyk7Cj4KPiAgICAgICAgIGlmIChzbGF2ZSkKPiAgICAgICAgICAg
ICAgICAgcmV0dXJuOwo+Cj4gICAgICAgICBkcm0gPSBub3V2ZWF1X2JkZXYoYmRldik7Cj4gLSAg
ICAgICBkZXYgPSBkcm0tPmRldi0+ZGV2Owo+Cj4gICAgICAgICByZXR1cm4gdHRtX3Bvb2xfZnJl
ZSgmZHJtLT50dG0uYmRldi5wb29sLCB0dG0pOwo+ICB9Cj4gLS0KPiAyLjI3LjAKPgo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTm91dmVhdSBtYWls
aW5nIGxpc3QKPiBOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
