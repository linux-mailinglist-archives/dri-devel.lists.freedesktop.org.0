Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A0896AC0
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 22:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 844546E079;
	Tue, 20 Aug 2019 20:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44216E079
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 20:38:25 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id q12so13722163wrj.12
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 13:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rg0EeSG7Bm5jsa3UW2wgdDRJHxKBoYiG0TWysIzVlWY=;
 b=rzPL0DO7joO32ZUyZjEYveCSjuOgKsF82wfVcvevHTgcQ3pqwZifkhbVpJ6zzpda0t
 6ADfT6GKrRNOxxxHp+PM6d+zQTB2L4NccHLQl9SXKBEtDs6EF1rhsKEqHyiRh2t7Z7Zb
 khOqUfSAJqO0cYNx2/pQw0onlGiqG7g7h3eXcJfG3yv7zg/ZgezpVf/8WArnpPGtbFV8
 oxQgoHJrtA1p39b8QLao6RL88m1Zp81zy5vQpQdJRDjyzRVbmzRggj5zMq70/m+VtVW0
 JquRLrsjccSGkG9Kn/A/lWK/CC2ji82pR0YD5X6NWfUrPbO2IuxPJQolth4/9wJypOm3
 KfJQ==
X-Gm-Message-State: APjAAAWfdsWjIiBukT/INxQ9eZalV47om7TOKI7Oi7FuLwyu6RuZ6AHK
 bBrJG//WKvaIxMN1bnABj/OTHyLH2sUtGMPBrJLrxg==
X-Google-Smtp-Source: APXvYqxgByFNUhdAX0A7d+Y0VGJlNmcykd/dXgmHsUVsHnRsUBq9o5uEgwus/ju2JbEFk5S8UKGnWaKoF3Bd4UsTGqw=
X-Received: by 2002:adf:ed4a:: with SMTP id u10mr11200522wro.284.1566333504347; 
 Tue, 20 Aug 2019 13:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190819230321.56480-1-john.stultz@linaro.org>
 <20190820200141.GA23191@ravnborg.org>
In-Reply-To: <20190820200141.GA23191@ravnborg.org>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 20 Aug 2019 13:38:11 -0700
Message-ID: <CALAqxLXVsqZRrxEMTrYQFpPbGNthJrQ+Gx1EP-uuGFNX0=a_+g@mail.gmail.com>
Subject: Re: [PATCH v4 00/25] drm: Kirin driver cleanups to prep for Kirin960
 support
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=rg0EeSG7Bm5jsa3UW2wgdDRJHxKBoYiG0TWysIzVlWY=;
 b=Cx1HrGAEMaeCtHiXxs+M1bsNI1pgf6amva+4Q0ItXlGMK7l9ZvDqZjPKl/NOnE3wYs
 GXgifJMddlQo+kEcK1fnvftC2NtSUTCUpLySDFjCfJdkQPGG6L+xq9L+jol+KmNwr/eB
 M39pPCpVUqB0gf2oIjHBic7F8lnYQrU+x7fWsViG1T2Xa4YAccFEmywBSbABn8bdslUK
 xRNTtjB0e4uPwB6lDYUPv0qXy7GgI2B+TwasFyY0Qo2aKioRIsIwqpkd7h/VkJ5YWV3c
 lEuMNP1NhkE7oU9adDPccG3eqV+5lh7CVZDgYZQsj7RknnI7RP1ounNNvcGpkYmikA/J
 eo+A==
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
Cc: David Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMjAsIDIwMTkgYXQgMTowMSBQTSBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+IHdyb3RlOgo+Cj4gSGkgSm9obi4KPgo+IE9uIE1vbiwgQXVnIDE5LCAyMDE5IGF0IDEx
OjAyOjU2UE0gKzAwMDAsIEpvaG4gU3R1bHR6IHdyb3RlOgo+ID4gU2VuZGluZyB0aGlzIG91dCBh
Z2FpbiwgdG8gZ2V0IGl0IGJhc2VkIG9uIGRybS1taXNjLW5leHQuCj4gPgo+ID4gVGhpcyBwYXRj
aHNldCBjb250YWlucyBvbmUgZml4IChpbiB0aGUgZnJvbnQsIHNvIGl0cyBlYXNpZXIgdG8KPiA+
IGV2ZW50dWFsbHkgYmFja3BvcnQpLCBhbmQgYSBzZXJpZXMgb2YgY2hhbmdlcyBmcm9tIFlpUGlu
ZyB0bwo+ID4gcmVmYWN0b3IgdGhlIGtpcmluIGRybSBkcml2ZXIgc28gdGhhdCBpdCBjYW4gYmUg
dXNlZCBvbiBib3RoCj4gPiBraXJpbjYyMCBiYXNlZCBkZXZpY2VzIChsaWtlIHRoZSBvcmlnaW5h
bCBIaUtleSBib2FyZCkgYXMgd2VsbAo+ID4gYXMga2lyaW45NjAgYmFzZWQgZGV2aWNlcyAobGlr
ZSB0aGUgSGlLZXk5NjAgYm9hcmQpLgo+ID4KPiA+IFRoZSBmdWxsIGtpcmluOTYwIGRybSBzdXBw
b3J0IGlzIHN0aWxsIGJlaW5nIHJlZmFjdG9yZWQsIGJ1dCBhcwo+ID4gdGhpcyBiYXNlIGtpcmlu
IHJld29yayB3YXMgZ2V0dGluZyB0byBiZSBzdWJzdGFudGlhbCwgSSB3YW50ZWQKPiA+IHRvIHNl
bmQgb3V0IHRoZSBmaXJzdCBjaHVuaywgc28gdGhhdCB0aGUgcmV2aWV3IGJ1cmRlbiB3YXNuJ3QK
PiA+IG92ZXJ3aGVsbWluZy4KPiA+Cj4gPiBUaGUgZnVsbCBIaUtleTk2MCBwYXRjaCBzdGFjayBj
YW4gYmUgZm91bmQgaGVyZToKPiA+ICAgaHR0cHM6Ly9naXQubGluYXJvLm9yZy9wZW9wbGUvam9o
bi5zdHVsdHovYW5kcm9pZC1kZXYuZ2l0L2xvZy8/aD1kZXYvaGlrZXk5NjAtbWFpbmxpbmUtV0lQ
Cj4gPgo+ID4gdGhhbmtzCj4gPiAtam9obgo+ID4KPiA+Cj4gPiBOZXcgaW4gdjQ6Cj4gPiAqIFJl
YmFzZWQgdG8gZHJtLW1pc2MtbmV4dCwgbWlub3IgdHdlYWtzIHRvIG1lcmdlIGNoYW5nZXMKPiA+
ICogRHJvcHBlZCAiZHJtOiBraXJpbjogR2V0IHJpZCBvZiBkcm1QLmggaW5jbHVkZXMiIGFzIHNp
bWlsYXIgY2hhbmdlCj4gPiAgIHdhcyBhbHJlYWR5IGluIGRybS1taXNjIG5leHQKPiA+ICogQWRk
ZWQgYWNrZWQtYnkgdGFnIGZyb20gWGlubGlhbmcKPgo+IFRoZXJlIHdhcyBzb21lIGNoZWNrcGF0
Y2ggbm9pc2VzIGluIHNvbWUgb2YgdGhlIHBhdGNoZXMgLSBwbGVhc2UgdmVyaWZ5Cj4gd2l0aCAi
LS1zdHJpY3QiLgoKQWguIEFwb2xvZ2llcy4gSSBoYWQgbm90IHJ1biB3aXRoIC0tc3RyaWN0LgoK
PiBBbmQgdGhlbiB0aGUgYnVpbGQgZmFpbGVkIGxpa2UgdGhpczoKPiAgTEQgW01dICBkcml2ZXJz
L2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluLWRybS5vCj4gYWFyY2g2NC1saW51eC1nbnUt
bGQ6IGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4vZHdfZHJtX2RzaS5vOiBpbiBmdW5j
dGlvbiBgaW5pdF9tb2R1bGUnOgo+IGR3X2RybV9kc2kuYzooLmluaXQudGV4dCsweDApOiBtdWx0
aXBsZSBkZWZpbml0aW9uIG9mIGBpbml0X21vZHVsZSc7IGRyaXZlcnMvZ3B1L2RybS9oaXNpbGlj
b24va2lyaW4va2lyaW5fZHJtX2Rydi5vOmtpcmluX2RybV9kcnYuYzooLmluaXQudGV4dCsweDAp
OiBmaXJzdCBkZWZpbmVkIGhlcmUKPiBhYXJjaDY0LWxpbnV4LWdudS1sZDogZHJpdmVycy9ncHUv
ZHJtL2hpc2lsaWNvbi9raXJpbi9kd19kcm1fZHNpLm86IGluIGZ1bmN0aW9uIGBjbGVhbnVwX21v
ZHVsZSc6Cj4gZHdfZHJtX2RzaS5jOiguZXhpdC50ZXh0KzB4MCk6IG11bHRpcGxlIGRlZmluaXRp
b24gb2YgYGNsZWFudXBfbW9kdWxlJzsgZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9r
aXJpbl9kcm1fZHJ2Lm86a2lyaW5fZHJtX2Rydi5jOiguZXhpdC50ZXh0KzB4MCk6IGZpcnN0IGRl
ZmluZWQgaGVyZQo+IG1ha2VbM106ICoqKiBbL2hvbWUvc2FtL2RybS9saW51eC5naXQvc2NyaXB0
cy9NYWtlZmlsZS5idWlsZDo0NjQ6IGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2ly
aW4tZHJtLm9dIEVycm9yIDEKPiBtYWtlWzJdOiAqKiogWy9ob21lL3NhbS9kcm0vbGludXguZ2l0
L3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6NDkwOiBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tp
cmluXSBFcnJvciAyCj4gbWFrZVsxXTogKioqIFsvaG9tZS9zYW0vZHJtL2xpbnV4LmdpdC9NYWtl
ZmlsZToxNzc2OiBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL10gRXJyb3IgMgo+IG1ha2VbMV06
IExlYXZpbmcgZGlyZWN0b3J5ICcvaG9tZS9zYW0vZHJtL2xpbnV4LmdpdC8uYnVpbGQvYXJtNjQt
YWxsbW9kY29uZmlnJwo+IG1ha2U6ICoqKiBbTWFrZWZpbGU6MTc5OiBzdWItbWFrZV0gRXJyb3Ig
Mgo+Cj4gSXQgd2FzIGEgc2ltcGxlIGFsbG1vZGNvbmZpZyBidWlsZCB3aGVyZSBJIGRpZDoKPgo+
IG1ha2UgZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi8KClllcywgSSd2ZSBub3QgdXNlZCBtb2R1
bGVzIG11Y2ggd2l0aCB0aGUgYm9hcmQuIEknbGwgZml4IHRoaXMgdXAuCgo+IFBsZWFzZSBmaXgg
YW5kIHJlc2VuZC4gSSBkaWQgbm90IGxvb2sgZnVydGhlci4KCkFwb2xvZ2llcyBhZ2FpbiwgdGhh
bmtzIHNvIG11Y2ggZm9yIGZpbmRpbmcgdGhlc2UgaXNzdWVzISBJJ2xsIGdldCBhCm5ldyBzZXJp
ZXMgdG8geW91IHNob3J0bHkgb25jZSB0aGUgaXNzdWVzIGFyZSByZXNvbHZlZCBhbmQgSSd2ZQp2
YWxpZGF0ZWQgdGhpbmdzLgoKdGhhbmtzCi1qb2huCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
