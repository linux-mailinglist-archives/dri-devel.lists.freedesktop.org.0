Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 961D7D6865
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 19:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61ED76E575;
	Mon, 14 Oct 2019 17:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126026E575
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 17:24:52 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id h7so3566195ybp.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 10:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9bItvDSfbUsGhJswtzc99Hv7SGEwqL2WVtPMge+nuj8=;
 b=c0Yl1ttBWRaPwLFWnsb1fk2s2AnHK4yFfRDSoNBYzS8BI6wRLfpcTdZJ1yZIISGY3z
 LhRYnTO8hNoa1Wa7VuH1StOdsli0Hk+yTY4Ki2Y5ealfEv2QDZUu7SI8rxJYn7GQKBuE
 glLggzyeJdlXQt/fSxcjUVAO757EK2CMUlvQ3DRObjeutMouYKG65Flku93Z2mNByAm+
 68bp+c4TCGYMe9nIg/Qjpx2nTwu2r7EYiy3xiUwn02m6sojfzMcMx+dWLbw3+SQNA8ww
 HBJ9n3+4cavooKOlmBQgdIv1ryG7k4VJ5TaooPlZSXIk7bwWcpGAFXkFO/rLuem1qwHf
 +nIA==
X-Gm-Message-State: APjAAAVbCVLf4CZQ5CXsGBDM5TN0zBtyGeOyc84YRw+RKKGsWJGIjdjL
 zMAndVDMP3ZhKmEnQbAvwCofuuH4hY75RLLEvh4/dg==
X-Google-Smtp-Source: APXvYqzB4zzkOE4i6QIC5XrmCSDNAgopQj1flwi6e5XwJDEcgzOgZP4uJU4RwXKlJHcUAR/TstlAmokX+NlbIZ6pO9k=
X-Received: by 2002:a25:d610:: with SMTP id n16mr20533403ybg.486.1571073891004; 
 Mon, 14 Oct 2019 10:24:51 -0700 (PDT)
MIME-Version: 1.0
References: <20191014125302.21479-1-anders.roxell@linaro.org>
In-Reply-To: <20191014125302.21479-1-anders.roxell@linaro.org>
From: Sean Paul <sean@poorly.run>
Date: Mon, 14 Oct 2019 13:24:14 -0400
Message-ID: <CAMavQKKYzj_jbP2UTMe1O6K5GYxxM1buB=iWC8vFZU5e0vTGGA@mail.gmail.com>
Subject: Re: [PATCH] drm/dp-mst: remove unused variable
To: Anders Roxell <anders.roxell@linaro.org>,
 Manasi Navare <manasi.d.navare@intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9bItvDSfbUsGhJswtzc99Hv7SGEwqL2WVtPMge+nuj8=;
 b=ZdR7ZoWpTjUK/j/uIvcYxf8AsCcxUN5J75ACgNQc+j+DUc6RjjZSMYsGtv9DWU1tu+
 lMQ9QGm9fH8BnO1gvS5egsNQgkrYm16hoNSRbAxYmrK/k6aCUYBw0msI/NEVNAUQhI51
 nBsK7ZayQ4iZgYNy9foFBnwqOVPfMhAoKPnLGmSCz7qNtQLojlfZ8rNA3eXiE56WahVE
 qf+vNcHJ5BiiytaxK+cwUrdRvsbLr0zRQOWVEFpA0E9GEn6UxrMipdUfHzzfQYmKwF2U
 FmstD00eybdMC+4+nSNwloJ8OlNmWtonMauOhCToYkn2Ogct4DHlwPTCjpFHE676KaF8
 jgGw==
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
Cc: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgODo1MyBBTSBBbmRlcnMgUm94ZWxsIDxhbmRlcnMucm94
ZWxsQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gVGhlIHZhcmlhYmxlICdkZXYnIGlzIG5vIGxvbmdl
ciB1c2VkIGFuZCB0aGUgY29tcGlsZXIgcmlnaHRseSBjb21wbGFpbnMKPiB0aGF0IGl0IHNob3Vs
ZCBiZSByZW1vdmVkLgo+Cj4gLi4vZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3ku
YzogSW4gZnVuY3Rpb24g4oCYZHJtX2F0b21pY19nZXRfbXN0X3RvcG9sb2d5X3N0YXRl4oCZOgo+
IC4uL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmM6NDE4NzoyMTogd2Fybmlu
ZzogdW51c2VkIHZhcmlhYmxlIOKAmGRlduKAmSBbLVd1bnVzZWQtdmFyaWFibGVdCj4gICBzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2ID0gbWdyLT5kZXY7Cj4gICAgICAgICAgICAgICAgICAgICAgXn5+
Cj4KPiBSZXdvcmsgdG8gcmVtb3ZlIHRoZSB1bnVzZWQgdmFyaWFibGUuCj4KPiBGaXhlczogODNm
YTk4NDJhZmU3ICgiZHJtL2RwLW1zdDogRHJvcCBjb25uZWN0aW9uX211dGV4IGNoZWNrIikKPiBT
aWduZWQtb2ZmLWJ5OiBBbmRlcnMgUm94ZWxsIDxhbmRlcnMucm94ZWxsQGxpbmFyby5vcmc+CgpI
aSBBbmRlcnMsClRoYW5rIHlvdSBmb3IgeW91ciBwYXRjaCEgTWFuYXNpIGhhcyBhbHJlYWR5IHBv
c3RlZCBhIHBhdGNoIGZvciB0aGlzOgpodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcv
cGF0Y2gvMzM1MzU4LwoKSXQncyByZXZpZXdlZCwgc28gd2UncmUganVzdCB3YWl0aW5nIGZvciBp
dCB0byBsYW5kLgoKU2VhbgoKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3Rv
cG9sb2d5LmMgfCAyIC0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gaW5kZXggOTM2NGU0ZjQyOTc1Li45Y2Nj
YzVlNjMzMDkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xv
Z3kuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiBAQCAt
NDE4NCw4ICs0MTg0LDYgQEAgRVhQT1JUX1NZTUJPTChkcm1fZHBfbXN0X3RvcG9sb2d5X3N0YXRl
X2Z1bmNzKTsKPiAgc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfc3RhdGUgKmRybV9hdG9taWNf
Z2V0X21zdF90b3BvbG9neV9zdGF0ZShzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUsCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1ncikKPiAgewo+IC0g
ICAgICAgc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IG1nci0+ZGV2Owo+IC0KPiAgICAgICAgIHJl
dHVybiB0b19kcF9tc3RfdG9wb2xvZ3lfc3RhdGUoZHJtX2F0b21pY19nZXRfcHJpdmF0ZV9vYmpf
c3RhdGUoc3RhdGUsICZtZ3ItPmJhc2UpKTsKPiAgfQo+ICBFWFBPUlRfU1lNQk9MKGRybV9hdG9t
aWNfZ2V0X21zdF90b3BvbG9neV9zdGF0ZSk7Cj4gLS0KPiAyLjIwLjEKPgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
