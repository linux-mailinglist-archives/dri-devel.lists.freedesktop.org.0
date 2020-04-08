Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F55A1A2B11
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 23:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D8E56E4B7;
	Wed,  8 Apr 2020 21:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D406E4B7
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 21:25:55 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id z6so1528447wml.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 14:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ToTzdhZlf0zGKlXyl4sHFSCacp5/HrL4+KJq4UIX7a8=;
 b=YgPqb5ak91r/TCYmCNPTl0HKJYnELeSXemofTnUvxDfTyqWb2TC6X0RLbTADdlkb4X
 Wwu/tBcFsekFKrULui0nSZALY6TUR2dQGkAFS0355GRaU9G31/PtzC5R1stAhVpaZ7NO
 T9RUMRX0au0jh2J2b1YuHfzYmhOzeuNnWW2CfNCP2Oa261ZnQe1dnRc9Xo9h6yK4wbXZ
 2VF8ZQeV8Wl/LeYKqXASg3l6uFWoqQpXLAmhJbHFFbt4u3XyoLHJSW7c85ll9krfFqaG
 iP9Er9bf69wrwgEH1vTP39quhrFsyXZlwz0sP39r+wyINQgsajc5JsnygSOuOq34hR5N
 XUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ToTzdhZlf0zGKlXyl4sHFSCacp5/HrL4+KJq4UIX7a8=;
 b=hS0I9N30L+aSFcby2n9gQffCXnoHmZvOTJioaNcvGra8P909uYl9JJPN0I4pF3hx2X
 a8VzKCRm1zl9aOwW/fmd9qwSNzx8bx18ctcmn94NklMzaBnvcv5PoUA+bD8rbygehU9h
 n4gCnl1/MwQVnIB3qVgruwcI2P439Ht1Kg6MBHnizYp9VY7WvzeWP8eBH9xNP5u4EwwD
 itQ8QNqAILZN1gskOuCr7o4dFbUbLwLiUHtOvPOCGtSBNuPr/jbO+YcU3FmnYS3nDt9S
 HsIE+AiBR01ZsZL78FlsxviZL0kavlLA5OrRg4LDodSj+gHnh8b0utHtpFTgm+H1pVoi
 QDVw==
X-Gm-Message-State: AGi0PuZNG+UDcMQXUzMYeQ/AqjtX1R2/9r+WGeaIblKvymG1G3iTx9gJ
 m0Ko7RodMRxneg16vHrz6Tyo7qOdumeuiDOKb2Gchw==
X-Google-Smtp-Source: APiQypLrghX6ori9JPEhV+citH3ofJR7RIoZMjdT10ObWtXCtbfMIUIkwPDb/EyIA6qGXcuntA47mt9+Ck6j6bntfbU=
X-Received: by 2002:a1c:9d8c:: with SMTP id g134mr6781086wme.79.1586381154527; 
 Wed, 08 Apr 2020 14:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200408212407.4309-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200408212407.4309-1-chris@chris-wilson.co.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 8 Apr 2020 17:25:43 -0400
Message-ID: <CADnq5_MKZUgZh5YXoNimhGFkQqod++WkCa-Ed=o9aM9M5H08-A@mail.gmail.com>
Subject: Re: [PATCH] drm: Don't return 0 from a void drm_fbdev_generic_setup
To: Chris Wilson <chris@chris-wilson.co.uk>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBcHIgOCwgMjAyMCBhdCA1OjI0IFBNIENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMt
d2lsc29uLmNvLnVrPiB3cm90ZToKPgo+IGRybV9mYmRldl9nZW5lcmljX3NldHVwKCkgd2FzIGNo
YW5nZWQgdG8gYmUgYSB2b2lkIHJldHVybiwgYnV0IHRoZSBzdHViCj4gd2FzIGxlZnQgcmV0dXJu
aW5nIDAuCj4KPiAuL2luY2x1ZGUvZHJtL2RybV9mYl9oZWxwZXIuaDogSW4gZnVuY3Rpb24g4oCY
ZHJtX2ZiZGV2X2dlbmVyaWNfc2V0dXDigJk6Cj4gLi9pbmNsdWRlL2RybS9kcm1fZmJfaGVscGVy
Lmg6NDUwOjk6IHdhcm5pbmc6IOKAmHJldHVybuKAmSB3aXRoIGEgdmFsdWUsIGluIGZ1bmN0aW9u
IHJldHVybmluZyB2b2lkIFstV3JldHVybi10eXBlXQo+IC4vaW5jbHVkZS9kcm0vZHJtX2ZiX2hl
bHBlci5oOjQ0ODoxOiBub3RlOiBkZWNsYXJlZCBoZXJlCj4gICA0NDggfCBkcm1fZmJkZXZfZ2Vu
ZXJpY19zZXR1cChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgcHJlZmVycmVk
X2JwcCkKPgo+IEZpeGVzOiAxYWVkOTUwOWIyOWEgKCJkcm0vZmItaGVscGVyOiBSZW1vdmUgcmV0
dXJuIHZhbHVlIGZyb20gZHJtX2ZiZGV2X2dlbmVyaWNfc2V0dXAoKSIpCj4gU2lnbmVkLW9mZi1i
eTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gQ2M6IFRob21hcyBa
aW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+IENjOiBTYW0gUmF2bmJvcmcgPHNhbUBy
YXZuYm9yZy5vcmc+CgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgoKPiAtLS0KPiAgaW5jbHVkZS9kcm0vZHJtX2ZiX2hlbHBlci5oIHwgMSAtCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9k
cm0vZHJtX2ZiX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2ZiX2hlbHBlci5oCj4gaW5kZXgg
ZmIwMzdiZTgzOTk3Li4zMDZhYTNhNjBiZTkgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJt
X2ZiX2hlbHBlci5oCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2ZiX2hlbHBlci5oCj4gQEAgLTQ0
Nyw3ICs0NDcsNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZHJtX2ZiX2hlbHBlcl9vdXRwdXRfcG9s
bF9jaGFuZ2VkKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCj4gIHN0YXRpYyBpbmxpbmUgdm9pZAo+
ICBkcm1fZmJkZXZfZ2VuZXJpY19zZXR1cChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNpZ25l
ZCBpbnQgcHJlZmVycmVkX2JwcCkKPiAgewo+IC0gICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+ICAj
ZW5kaWYKPiAtLQo+IDIuMjAuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
