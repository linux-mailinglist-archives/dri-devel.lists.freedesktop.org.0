Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECB523BC3F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 16:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F6C6E0C4;
	Tue,  4 Aug 2020 14:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8DF96E0C4
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 14:35:03 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4E68522D08
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 14:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596551703;
 bh=msyy9aG35H4DSGIygANUzGiwZ9bmaHBVupY0hOPK2nA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=INn72nCnUGfrwDf/6D76PRUMF4gh/ThIG+NjSmuyJEdM2wunn48TfTl7XUWx5gt4/
 G12DNFSI9KhHI6U2jb50EL35hvUSFb9I+5ZtGF7XWjcPOgvVR0rhI0QOE0Ic0RsVuW
 6zf43KDoWpiNSUXYFszZaAyXWhVUfEgU2maMm2pY=
Received: by mail-ed1-f50.google.com with SMTP id o18so15624687eds.10
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 07:35:03 -0700 (PDT)
X-Gm-Message-State: AOAM5319Zxfy1Guu5ydYhoGJ5bLSsGiCvG8OmWTapXjzacE7md7d1Nq4
 kFHv8uPFl5OOMXsNL28MvB8e8mMQyxl4mQKrhw==
X-Google-Smtp-Source: ABdhPJxtAkBWkUbp57xqa5KFEP+7l8fLYyFpHi+fJGBL3okYbOQpXuKQ7hFcornheF7wFTIcTsqN1xDf/iN0Ar3JdVQ=
X-Received: by 2002:a05:6402:38c:: with SMTP id
 o12mr21504828edv.271.1596551701677; 
 Tue, 04 Aug 2020 07:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200804105849.70876-1-linux@fw-web.de>
 <20200804105849.70876-2-linux@fw-web.de>
In-Reply-To: <20200804105849.70876-2-linux@fw-web.de>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 4 Aug 2020 22:34:50 +0800
X-Gmail-Original-Message-ID: <CAAOTY_94Kt3Z4FhB+1Chca-tanzY1Xwun8D2ZQ09Y7p7+Jw40Q@mail.gmail.com>
Message-ID: <CAAOTY_94Kt3Z4FhB+1Chca-tanzY1Xwun8D2ZQ09Y7p7+Jw40Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] drm: mediatek: add ddp routing for mt7623
To: Frank Wunderlich <linux@fw-web.de>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEZyYW5rOgoKRnJhbmsgV3VuZGVybGljaCA8bGludXhAZnctd2ViLmRlPiDmlrwgMjAyMOW5
tDjmnIg05pelIOmAseS6jCDkuIvljYg3OjAw5a+r6YGT77yaCj4KPiBGcm9tOiBGcmFuayBXdW5k
ZXJsaWNoIDxmcmFuay13QHB1YmxpYy1maWxlcy5kZT4KPgo+IG9uIEJQaS1SMi9tdDc2MjMgbWFp
bi1wYXRoIGhhdmUgdG8gYmUgcm91dGVkIHRvIERQSTAgKGhkbWkpIGluc3RlYWQgb2YgRFNJMAo+
IHVzaW5nIGNvbXBhdGlibGUgIm10NzYyMy1tbXN5cyIgYWxyZWFkeSBkZWZpbmVkIGluIGR0cwo+
Cj4gU2lnbmVkLW9mZi1ieTogRnJhbmsgV3VuZGVybGljaCA8ZnJhbmstd0BwdWJsaWMtZmlsZXMu
ZGU+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jIHwgMjUg
KysrKysrKysrKysrKysrKysrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2
LmMKPiBpbmRleCA2YmQzNjk0MzRkOWQuLjllNDE4YjgzYmU0OCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4gQEAgLTc0LDcgKzc0LDIwIEBAIHN0YXRpYyBjb25z
dCBlbnVtIG10a19kZHBfY29tcF9pZCBtdDI3MDFfbXRrX2RkcF9leHRbXSA9IHsKPiAgICAgICAg
IEREUF9DT01QT05FTlRfRFBJMCwKPiAgfTsKPgo+IC1zdGF0aWMgY29uc3QgZW51bSBtdGtfZGRw
X2NvbXBfaWQgbXQyNzEyX210a19kZHBfbWFpbltdID0gewo+ICtzdGF0aWMgY29uc3QgZW51bSBt
dGtfZGRwX2NvbXBfaWQgbXQ3NjIzX210a19kZHBfbWFpbltdID0gewo+ICsgICAgICAgRERQX0NP
TVBPTkVOVF9PVkwwLAo+ICsgICAgICAgRERQX0NPTVBPTkVOVF9SRE1BMCwKPiArICAgICAgIERE
UF9DT01QT05FTlRfQ09MT1IwLAo+ICsgICAgICAgRERQX0NPTVBPTkVOVF9CTFMsCj4gKyAgICAg
ICBERFBfQ09NUE9ORU5UX0RQSTAsCj4gK307Cj4gKwo+ICtzdGF0aWMgY29uc3QgZW51bSBtdGtf
ZGRwX2NvbXBfaWQgbXQ3NjIzX210a19kZHBfZXh0W10gPSB7Cj4gKyAgICAgICBERFBfQ09NUE9O
RU5UX1JETUExLAo+ICsgICAgICAgRERQX0NPTVBPTkVOVF9EU0kwLAo+ICt9Owo+ICsKPiArc3Rh
dGljIGVudW0gbXRrX2RkcF9jb21wX2lkIG10MjcxMl9tdGtfZGRwX21haW5bXSA9IHsKCldoeSBk
byB5b3UgcmVtb3ZlICdjb25zdCc/Cgo+ICAgICAgICAgRERQX0NPTVBPTkVOVF9PVkwwLAo+ICAg
ICAgICAgRERQX0NPTVBPTkVOVF9DT0xPUjAsCj4gICAgICAgICBERFBfQ09NUE9ORU5UX0FBTDAs
Cj4gQEAgLTEyNyw2ICsxNDAsMTQgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfbW1zeXNfZHJp
dmVyX2RhdGEgbXQyNzAxX21tc3lzX2RyaXZlcl9kYXRhID0gewo+ICAgICAgICAgLnNoYWRvd19y
ZWdpc3RlciA9IHRydWUsCj4gIH07Cj4KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfbW1zeXNf
ZHJpdmVyX2RhdGEgbXQ3NjIzX21tc3lzX2RyaXZlcl9kYXRhID0gewo+ICsgICAgICAgLm1haW5f
cGF0aCA9IG10NzYyM19tdGtfZGRwX21haW4sCj4gKyAgICAgICAubWFpbl9sZW4gPSBBUlJBWV9T
SVpFKG10NzYyM19tdGtfZGRwX21haW4pLAo+ICsgICAgICAgLmV4dF9wYXRoID0gbXQ3NjIzX210
a19kZHBfZXh0LAo+ICsgICAgICAgLmV4dF9sZW4gPSBBUlJBWV9TSVpFKG10NzYyM19tdGtfZGRw
X2V4dCksCj4gKyAgICAgICAuc2hhZG93X3JlZ2lzdGVyID0gdHJ1ZSwKPiArfTsKPiArCj4gIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX21tc3lzX2RyaXZlcl9kYXRhIG10MjcxMl9tbXN5c19kcml2
ZXJfZGF0YSA9IHsKPiAgICAgICAgIC5tYWluX3BhdGggPSBtdDI3MTJfbXRrX2RkcF9tYWluLAo+
ICAgICAgICAgLm1haW5fbGVuID0gQVJSQVlfU0laRShtdDI3MTJfbXRrX2RkcF9tYWluKSwKPiBA
QCAtNDIyLDYgKzQ0Myw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a19k
ZHBfY29tcF9kdF9pZHNbXSA9IHsKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQg
bXRrX2RybV9vZl9pZHNbXSA9IHsKPiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWss
bXQyNzAxLW1tc3lzIiwKPiAgICAgICAgICAgLmRhdGEgPSAmbXQyNzAxX21tc3lzX2RyaXZlcl9k
YXRhfSwKPiArICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ3NjIzLW1tc3lzIiwK
PiArICAgICAgICAgLmRhdGEgPSAmbXQ3NjIzX21tc3lzX2RyaXZlcl9kYXRhfSwKPiAgICAgICAg
IHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQyNzEyLW1tc3lzIiwKPiAgICAgICAgICAgLmRh
dGEgPSAmbXQyNzEyX21tc3lzX2RyaXZlcl9kYXRhfSwKPiAgICAgICAgIHsgLmNvbXBhdGlibGUg
PSAibWVkaWF0ZWssbXQ4MTczLW1tc3lzIiwKPiAtLQo+IDIuMjUuMQo+Cj4KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdAo+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
