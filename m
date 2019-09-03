Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 287E8A66DC
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 12:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060B489231;
	Tue,  3 Sep 2019 10:54:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99858922A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 10:54:40 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id o9so6536219edq.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2019 03:54:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=LfolOzk1BxHRrQFKBBtT+6uQRmEmOb3P6qDOK43OCow=;
 b=dZSb7zHnjBRUnbQJeg8OtUk79zuqTWao+v33WMW2uSwlG/5rbSAUt9LQfevww2yQ/o
 Fn7dN6I26LQ4MaAS6OiL3JnPP4b3kkZTD6BZp/XFSPohx8K9jzFW5KZQ166H7t9T+9Vr
 QZ05OGkVRK6a9PcJEA4hMwlE7akOMdWHyAi9PLJYUxgRUzKo4cF+CzXv7GSc32uZgNjq
 gqxLxuar8aFjCVqSfRkcYDJacNDYsBd4FAc70aiLsiyvdS5W4+CDJPnN/VgdI70BVGBT
 NUT3IlxRY2ArJG6orRcqw8HhiNu6E6tC6OGJaX/dGtnb9OmV4mOicVwihY7oCocEZvIM
 Gs0A==
X-Gm-Message-State: APjAAAVv41UVxMsAzAHFXEqK2GYPgvBSEjUTanalmwgfFJJAvvSU8qVt
 0supvqyGfznamo/VDJJ6opGlJw==
X-Google-Smtp-Source: APXvYqxn+sgzqZEKUCgBAeWqjRi9d86KwWrO+JZVushfmeaH5LiRugOcZfrT4QxVnrLzFtceUxvihg==
X-Received: by 2002:a17:906:a957:: with SMTP id
 hh23mr19832335ejb.82.1567508079238; 
 Tue, 03 Sep 2019 03:54:39 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id u14sm3435231edy.55.2019.09.03.03.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 03:54:38 -0700 (PDT)
Date: Tue, 3 Sep 2019 12:54:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 1/6] drm: add drm_print_bits
Message-ID: <20190903105436.GU2112@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>
References: <20190903101248.12879-1-kraxel@redhat.com>
 <20190903101248.12879-2-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190903101248.12879-2-kraxel@redhat.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=LfolOzk1BxHRrQFKBBtT+6uQRmEmOb3P6qDOK43OCow=;
 b=aX3gEPe/z4TuMjilqqC8NAae5WbmK/CindbAF5loLBCRbttVeiajRY2Xs+DOm7OrLF
 n79DhqQjif/rkDQbW0w8cLEFGNSwV6/UtLlFBj9ACTBU52tywKKzmrxgi2aJCUzEw22w
 SyjbC+XrsnGLmTuOdKIJBMmPYQ/9NzPExDptE=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMTI6MTI6NDNQTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBOZXcgaGVscGVyIHRvIHByaW50IG5hbWVkIGJpdHMgb2Ygc29tZSB2YWx1ZSAodGhp
bmsgZmxhZ3MgZmllbGRzKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4
ZWxAcmVkaGF0LmNvbT4KPiAtLS0KPiAgaW5jbHVkZS9kcm0vZHJtX3ByaW50LmggICAgIHwgIDMg
KysrCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbnQuYyB8IDM2ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKykK
PiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX3ByaW50LmggYi9pbmNsdWRlL2RybS9k
cm1fcHJpbnQuaAo+IGluZGV4IGE1ZDZmMmYzZTQzMC4uODY1OGMxZGExYzdkIDEwMDY0NAo+IC0t
LSBhL2luY2x1ZGUvZHJtL2RybV9wcmludC5oCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX3ByaW50
LmgKPiBAQCAtODgsNiArODgsOSBAQCBfX3ByaW50ZigyLCAzKQo+ICB2b2lkIGRybV9wcmludGYo
c3RydWN0IGRybV9wcmludGVyICpwLCBjb25zdCBjaGFyICpmLCAuLi4pOwo+ICB2b2lkIGRybV9w
dXRzKHN0cnVjdCBkcm1fcHJpbnRlciAqcCwgY29uc3QgY2hhciAqc3RyKTsKPiAgdm9pZCBkcm1f
cHJpbnRfcmVnc2V0MzIoc3RydWN0IGRybV9wcmludGVyICpwLCBzdHJ1Y3QgZGVidWdmc19yZWdz
ZXQzMiAqcmVnc2V0KTsKPiArdm9pZCBkcm1fcHJpbnRfYml0cyhzdHJ1Y3QgZHJtX3ByaW50ZXIg
KnAsIHVuc2lnbmVkIGludCBpbmRlbnQsCj4gKwkJICAgIGNvbnN0IGNoYXIgKmxhYmVsLCB1bnNp
Z25lZCBpbnQgdmFsdWUsCj4gKwkJICAgIGNvbnN0IGNoYXIgKmJpdHNbXSwgdW5zaWduZWQgaW50
IG5iaXRzKTsKPiAgCj4gIF9fcHJpbnRmKDIsIDApCj4gIC8qKgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX3ByaW50LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW50LmMKPiBp
bmRleCBhMTdjOGExNGRiYTQuLjdmN2FiYTkyMGY1MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX3ByaW50LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW50LmMKPiBA
QCAtMTc5LDYgKzE3OSw0MiBAQCB2b2lkIGRybV9wcmludGYoc3RydWN0IGRybV9wcmludGVyICpw
LCBjb25zdCBjaGFyICpmLCAuLi4pCj4gIH0KPiAgRVhQT1JUX1NZTUJPTChkcm1fcHJpbnRmKTsK
PiAgCj4gKy8qKgo+ICsgKiBkcm1fcHJpbnRfYml0cyAtIHByaW50IGJpdHMgdG8gYSAmZHJtX3By
aW50ZXIgc3RyZWFtCj4gKyAqCj4gKyAqIFByaW50IGJpdHMgKGluIGZsYWcgZmllbGRzIGZvciBl
eGFtcGxlKSBpbiBodW1hbiByZWFkYWJsZSBmb3JtLgo+ICsgKgo+ICsgKiBAcDogdGhlICZkcm1f
cHJpbnRlcgo+ICsgKiBAaW5kZW50OiBUYWIgaW5kZW50YXRpb24gbGV2ZWwgKG1heCA1KQo+ICsg
KiBAbGFiZWw6IGZpZWxkIGxhYmVsLgo+ICsgKiBAdmFsdWU6IGZpZWxkIHZhbHVlLgo+ICsgKiBA
Yml0czogQXJyYXkgd2l0aCBiaXQgbmFtZXMuCj4gKyAqIEBuYml0czogYml0IG5hbWUgYXJyYXkg
c2l6ZS4KPiArICovCj4gK3ZvaWQgZHJtX3ByaW50X2JpdHMoc3RydWN0IGRybV9wcmludGVyICpw
LCB1bnNpZ25lZCBpbnQgaW5kZW50LAo+ICsJCSAgICBjb25zdCBjaGFyICpsYWJlbCwgdW5zaWdu
ZWQgaW50IHZhbHVlLAo+ICsJCSAgICBjb25zdCBjaGFyICpiaXRzW10sIHVuc2lnbmVkIGludCBu
Yml0cykKPiArewo+ICsJYm9vbCBmaXJzdCA9IHRydWU7Cj4gKwl1bnNpZ25lZCBpbnQgaTsKPiAr
Cj4gKwlmb3IgKGkgPSAwOyBpIDwgbmJpdHM7IGkrKykgewo+ICsJCWlmICghKHZhbHVlICYgKDEg
PDwgaSkpKQo+ICsJCQljb250aW51ZTsKPiArCQlpZiAoIWJpdHNbaV0pCgpJIHRoaW5rIHRoaXMg
c2hvdWxkIGJlIGEgV0FSTl9PTiwgaW5kaWNhdGVzIGEgcHJvZ3JhbW1pbmcgZXJyb3I/Cgo+ICsJ
CQljb250aW51ZTsKPiArCQlpZiAoZmlyc3QpIHsKPiArCQkJZmlyc3QgPSBmYWxzZTsKPiArCQkJ
ZHJtX3ByaW50Zl9pbmRlbnQocCwgaW5kZW50LCAiJXM9JXMiLAo+ICsJCQkJCSAgbGFiZWwsIGJp
dHNbaV0pOwoKSG0sIHRvIG1ha2UgdGhpcyBhIGJpdCBtb3JlIGZsZXhpYmxlIHRvIHVzZSBJJ2Qg
ZHJvcCB0aGUgbGFiZWw9IHByaW50aW5nCi4uLgoKPiArCQl9IGVsc2UKPiArCQkJZHJtX3ByaW50
ZihwLCAiLCVzIiwgYml0c1tpXSk7Cj4gKwl9Cj4gKwlpZiAoIWZpcnN0KQo+ICsJCWRybV9wcmlu
dGYocCwgIlxuIik7CgouLi4gYW5kIGFsc28gdGhlIG5ld2xpbmUuIFRoZW4geW91IGNvdWxkIGFs
c28gdXNlIHRoaXMgZm9yIGJpdC1maWVsZHMKd2hpY2gganVzdCBhIGZldyBiaXRzLiBBbHNvLCBz
aG91bGQgd2UgcHJpbnQgYW55dGhpbmcgaWYgbm8gYml0IGlzIHNldD8KCklmIHlvdSBwcmVmZXIg
dGhlIGxhYmVsPSArIFxuIHRoZW4gcGxzIGFkZCB0aGF0IHRvIHRoZSBrZXJuZWxkb2MsIHRoYXQg
aXQKcHJpbnRzIHRoaXMgYXMgYSBsaW5lIG9mIGl0cyBvd24uCi1EYW5pZWwKCj4gK30KPiArRVhQ
T1JUX1NZTUJPTChkcm1fcHJpbnRfYml0cyk7Cj4gKwo+ICB2b2lkIGRybV9kZXZfcHJpbnRrKGNv
bnN0IHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3QgY2hhciAqbGV2ZWwsCj4gIAkJICAgIGNvbnN0
IGNoYXIgKmZvcm1hdCwgLi4uKQo+ICB7Cj4gLS0gCj4gMi4xOC4xCj4gCgotLSAKRGFuaWVsIFZl
dHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3
bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
