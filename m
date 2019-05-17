Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E94621A35
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 17:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0EDE891E3;
	Fri, 17 May 2019 15:00:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 998B7891E3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 15:00:43 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id p13so2788387uaa.11
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 08:00:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=779/Wo/qmmRaXvVI8jn/pxoDVhjOCPWuL14dKtQpsdU=;
 b=p2P6epbFd8F+axrb3N58Ejpuxk3ZlWjUgBsZ6Y/gSxOTDOirPLDDkQ26re8k5wTxBJ
 6qK7qJYUkHVSvLix6ARE/YNYJsmE6dHr40tamxiG0QVees3fzR2JIZSGjkG3V/N/SdjK
 5DdvKpzY/NB4khyFLd9qdm1yoQ/MptZFgIDZEG/+RlV2J+6AxroTL50RkN062piB9VHL
 7EXIzqp+jH795coG1RKPFqvxkfKcQ0n3p+dPNy2plzzVcbzu7+u483PfXFvSR5wgIhpd
 C17c0VA7yhVit8Hie0EjUHcfuOkqe9hiRXLZaLcoYFBJ7qgvd3lR1J1gix1zL0QFB2Lo
 hm+A==
X-Gm-Message-State: APjAAAU0EduP42cnSu6aZc5pFrfseNwmV0TikW5i0l/pgTtvRKMyD1Aj
 K3l3MWclCuzOsizcmOvhT4Z397hX5SlrtTcSq2LafQ==
X-Google-Smtp-Source: APXvYqyLf9iB7QlnKkJcvVVx4Den8dPPsaBy6TMwLbPQ5Evxle3ebT48s8dh+r4KhlvuEJo2LQ5X51QTAJNoK+0LY8g=
X-Received: by 2002:a9f:380f:: with SMTP id p15mr469431uad.4.1558105242580;
 Fri, 17 May 2019 08:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190517141214.32627-1-harry.wentland@amd.com>
In-Reply-To: <20190517141214.32627-1-harry.wentland@amd.com>
From: Sean Paul <sean@poorly.run>
Date: Fri, 17 May 2019 11:00:06 -0400
Message-ID: <CAMavQKJqsQfvp98Je2AjnTUtSaXf5FL9wrZxLo+6p7Td21bGvA@mail.gmail.com>
Subject: Re: [PATCH] drm/connector: Add doc for content_protection tri-state
To: Harry Wentland <harry.wentland@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=779/Wo/qmmRaXvVI8jn/pxoDVhjOCPWuL14dKtQpsdU=;
 b=RWmgV2An+btUS3WOifLJ97ILfHhpNmmNO951B+zLZ/J4Z4p51LISKIp74HqPG8FHh1
 2X5nyWpFEZ9schPpcLaO5h9RLUFOT+0DzT0vokT7/Eh4/G73oYBKF/7depbRoBcgmqV7
 4sVAqPYcae1aCRKkhU+irlAiZLrqyu8obGI7HVByHpE0F5ynDYdMYe1PZ3B8T2cpIl9j
 8sqP0a10P1pw3G/BNJYAdpSl3mo0sEwt7KqcHZz7OKiKk+/IO6OqKxJ76v66WxQwik8C
 4bDN8R31k7rrm1XxwXtNHXE4JwlmTMGBWV3LOQleopRN+tEIDVNrlTSHtqNhq8QDjXNe
 txKw==
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Sean Paul <seanpaul@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMTA6MTIgQU0gSGFycnkgV2VudGxhbmQgPGhhcnJ5Lndl
bnRsYW5kQGFtZC5jb20+IHdyb3RlOgo+Cj4gSXQgd2FzIHRoZXJlIGFsbCBhbG9uZyBpbiB0aGUg
cGF0Y2ggZGVzY3JpcHRpb24gd2hlbiB0aGlzIGNoYW5nZSB3YXMKPiBpbnRyb2R1Y2VkIGJ1dCBp
dCB3b3VsZCBiZSBoZWxwZnVsIHRvIGhhdmUgdGhlIHNhbWUgZG9jdW1lbnRlZCBpbiB0aGUKPiBj
b2RlLgo+Cj4gU2lnbmVkLW9mZi1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFt
ZC5jb20+Cj4gQ2M6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IENjOiBTZWFu
IFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KPiBDYzogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnBy
ZWV0Lkxha2hhQGFtZC5jb20+CgpSZXZpZXdlZC1ieTogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5y
dW4+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jIHwgOSArKysrKysr
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5l
Y3Rvci5jCj4gaW5kZXggYjM0YzNkMzhiZjE1Li5jNTNlNTFhZDNiNTkgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fY29ubmVjdG9yLmMKPiBAQCAtMTUxOSw2ICsxNTE5LDE1IEBAIEVYUE9SVF9TWU1CT0woZHJt
X2Nvbm5lY3Rvcl9hdHRhY2hfc2NhbGluZ19tb2RlX3Byb3BlcnR5KTsKPiAgICogQ29udGVudCBQ
cm90ZWN0aW9uIGlzIGludGVudGlvbmFsbHkgdmFndWUgdG8gYWxsb3cgZm9yIGRpZmZlcmVudCB1
bmRlcmx5aW5nCj4gICAqIHRlY2hub2xvZ2llcywgaG93ZXZlciBpdCBpcyBtb3N0IGltcGxlbWVu
dGVkIGJ5IEhEQ1AuCj4gICAqCj4gKyAqIFRoZSBwcm9wZXJ0eSBpcyBhIHRyaS1zdGF0ZSB3aXRo
IHRoZSBmb2xsb3dpbmcgdmFsdWVzOgo+ICsgKiAtIE9GRjogU2VsZiBleHBsYW5hdG9yeSwgbm8g
Y29udGVudCBwcm90ZWN0aW9uCj4gKyAqIC0gREVTSVJFRDogVXNlcnNwYWNlIHJlcXVlc3RzIHRo
YXQgdGhlIGRyaXZlciBlbmFibGUgcHJvdGVjdGlvbgo+ICsgKiAtIEVOQUJMRUQ6IE9uY2UgdGhl
IGRyaXZlciBoYXMgYXV0aGVudGljYXRlZCB0aGUgbGluaywgaXQgc2V0cyB0aGlzIHZhbHVlCj4g
KyAqCj4gKyAqIFRoZSBkcml2ZXIgaXMgcmVzcG9uc2libGUgZm9yIGRvd25ncmFkaW5nIEVOQUJM
RUQgdG8gREVTSVJFRCBpZiB0aGUgbGluayBiZWNvbWVzCj4gKyAqIHVucHJvdGVjdGVkLiBUaGUg
ZHJpdmVyIHNob3VsZCBhbHNvIG1haW50YWluIHRoZSBkZXNpcmVkbmVzcyBvZiBwcm90ZWN0aW9u
Cj4gKyAqIGFjcm9zcyBob3RwbHVnL2RwbXMvc3VzcGVuZC4KPiArICoKPiAgICogVGhlIGNvbnRl
bnQgcHJvdGVjdGlvbiB3aWxsIGJlIHNldCB0byAmZHJtX2Nvbm5lY3Rvcl9zdGF0ZS5jb250ZW50
X3Byb3RlY3Rpb24KPiAgICoKPiAgICogUmV0dXJuczoKPiAtLQo+IDIuMjEuMAo+Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
