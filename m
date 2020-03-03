Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B34176E1B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 05:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 875E36E4B1;
	Tue,  3 Mar 2020 04:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4066E4B1
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 04:39:40 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id a16so757989pju.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 20:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Fsfwjx7jgGYItwF5bCeIDJyJTUNRPkOSFQYt5/XqQ6U=;
 b=HFmh7HTAS7PHa+TvciXQAcYw5whCIuhZU2zUpAkLC9ZJSjxyCGmEPDXrMVM0dfkTyv
 ETn18Etqs5FyLnJDrAVM/OwrQtNrlzIHx775yZXbREV7ssdmKxlU8CZQObyJhmBCBrLZ
 qwhlET/uk886S32xAP95UNxC5j3EejlV71gy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Fsfwjx7jgGYItwF5bCeIDJyJTUNRPkOSFQYt5/XqQ6U=;
 b=OAAdXHz2jbTVbmAI1xPDK49jdtoigYigDg0kW9QzDc/+irsmP9LsyY0YIOyIjcfmFX
 wFfacL41r7zPpvOFn0cfUo5b70OU1zh6FmDt0y1JquRQHzFCr+lKwta+OshW+qPgHJJ2
 nBWqGPHSVej7fTscb3sjAkPFedbmpuWZmXPRXfEyVP/0coKXKtdRLXAiToAAYagUL/7+
 4fHyDDKlHW59CuPxTpcwaxTzMZEGVcs/kl2ZhjKc9ScZfj3u9xFSXev0uyIti9iq20rv
 15K+Mg/n3qULiJ4XErRm9sd6LIW8puQLNjt380bnvnPotWtW8ordAu7yUFoJewCeXlTo
 fgFw==
X-Gm-Message-State: ANhLgQ15wTMg3myNP5Q9pvs1NrynY+PKF6wT8akIki7HeD6mIj53GcXp
 Qw6bJjevgc+PjXX6XOrDqY1sTA==
X-Google-Smtp-Source: ADFU+vvU6WYjtUTp1RucOTTWWsoavTwgO9nAvwOPiJV4Gr7RaT3WB98LZl3onhyoGq/qdZgd/7XeWA==
X-Received: by 2002:a17:902:7087:: with SMTP id
 z7mr2493646plk.270.1583210379715; 
 Mon, 02 Mar 2020 20:39:39 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id u126sm22329618pfu.182.2020.03.02.20.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 20:39:38 -0800 (PST)
Date: Mon, 2 Mar 2020 20:39:37 -0800
From: Kees Cook <keescook@chromium.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/edid: Distribute switch variables for initialization
Message-ID: <202003022038.07A611E@keescook>
References: <20200220062229.68762-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200220062229.68762-1-keescook@chromium.org>
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
Cc: Alexander Potapenko <glider@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBGZWIgMTksIDIwMjAgYXQgMTA6MjI6MjlQTSAtMDgwMCwgS2VlcyBDb29rIHdyb3Rl
Ogo+IFZhcmlhYmxlcyBkZWNsYXJlZCBpbiBhIHN3aXRjaCBzdGF0ZW1lbnQgYmVmb3JlIGFueSBj
YXNlIHN0YXRlbWVudHMKPiBjYW5ub3QgYmUgYXV0b21hdGljYWxseSBpbml0aWFsaXplZCB3aXRo
IGNvbXBpbGVyIGluc3RydW1lbnRhdGlvbiAoYXMKPiB0aGV5IGFyZSBub3QgcGFydCBvZiBhbnkg
ZXhlY3V0aW9uIGZsb3cpLiBXaXRoIEdDQydzIHByb3Bvc2VkIGF1dG9tYXRpYwo+IHN0YWNrIHZh
cmlhYmxlIGluaXRpYWxpemF0aW9uIGZlYXR1cmUsIHRoaXMgdHJpZ2dlcnMgYSB3YXJuaW5nIChh
bmQgdGhleQo+IGRvbid0IGdldCBpbml0aWFsaXplZCkuIENsYW5nJ3MgYXV0b21hdGljIHN0YWNr
IHZhcmlhYmxlIGluaXRpYWxpemF0aW9uCj4gKHZpYSBDT05GSUdfSU5JVF9TVEFDS19BTEw9eSkg
ZG9lc24ndCB0aHJvdyBhIHdhcm5pbmcsIGJ1dCBpdCBhbHNvCj4gZG9lc24ndCBpbml0aWFsaXpl
IHN1Y2ggdmFyaWFibGVzWzFdLiBOb3RlIHRoYXQgdGhlc2Ugd2FybmluZ3MgKG9yIHNpbGVudAo+
IHNraXBwaW5nKSBoYXBwZW4gYmVmb3JlIHRoZSBkZWFkLXN0b3JlIGVsaW1pbmF0aW9uIG9wdGlt
aXphdGlvbiBwaGFzZSwKPiBzbyBldmVuIHdoZW4gdGhlIGF1dG9tYXRpYyBpbml0aWFsaXphdGlv
bnMgYXJlIGxhdGVyIGVsaWRlZCBpbiBmYXZvciBvZgo+IGRpcmVjdCBpbml0aWFsaXphdGlvbnMs
IHRoZSB3YXJuaW5ncyByZW1haW4uCj4gCj4gVG8gYXZvaWQgdGhlc2UgcHJvYmxlbXMsIG1vdmUg
c3VjaCB2YXJpYWJsZXMgaW50byB0aGUgImNhc2UiIHdoZXJlCj4gdGhleSdyZSB1c2VkIG9yIGxp
ZnQgdGhlbSB1cCBpbnRvIHRoZSBtYWluIGZ1bmN0aW9uIGJvZHkuCj4gCj4gZHJpdmVycy9ncHUv
ZHJtL2RybV9lZGlkLmM6IEluIGZ1bmN0aW9uIOKAmGRybV9lZGlkX3RvX2VsZOKAmToKPiBkcml2
ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYzo0Mzk1Ojk6IHdhcm5pbmc6IHN0YXRlbWVudCB3aWxsIG5l
dmVyIGJlIGV4ZWN1dGVkIFstV3N3aXRjaC11bnJlYWNoYWJsZV0KPiAgNDM5NSB8ICAgICBpbnQg
c2FkX2NvdW50Owo+ICAgICAgIHwgICAgICAgICBefn5+fn5+fn4KPiAKPiBbMV0gaHR0cHM6Ly9i
dWdzLmxsdm0ub3JnL3Nob3dfYnVnLmNnaT9pZD00NDkxNgo+IAo+IFNpZ25lZC1vZmYtYnk6IEtl
ZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgoKUGluZy4gQ2FuIHNvbWVvbmUgcGljayB0
aGlzIHVwLCBwbGVhc2U/CgpUaGFua3MhCgotS2VlcwoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJt
L2RybV9lZGlkLmMgfCAgICA1ICsrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZWRpZC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKPiBpbmRleCA4MDVmYjAwNGM4ZWIu
LjI5NDFiNjViNDI3ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4gQEAgLTQzOTIsOSArNDM5Miw5IEBA
IHN0YXRpYyB2b2lkIGRybV9lZGlkX3RvX2VsZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVj
dG9yLCBzdHJ1Y3QgZWRpZCAqZWRpZCkKPiAgCQkJZGJsID0gY2VhX2RiX3BheWxvYWRfbGVuKGRi
KTsKPiAgCj4gIAkJCXN3aXRjaCAoY2VhX2RiX3RhZyhkYikpIHsKPiAtCQkJCWludCBzYWRfY291
bnQ7Cj4gKwkJCWNhc2UgQVVESU9fQkxPQ0s6IHsKPiAgCj4gLQkJCWNhc2UgQVVESU9fQkxPQ0s6
Cj4gKwkJCQlpbnQgc2FkX2NvdW50Owo+ICAJCQkJLyogQXVkaW8gRGF0YSBCbG9jaywgY29udGFp
bnMgU0FEcyAqLwo+ICAJCQkJc2FkX2NvdW50ID0gbWluKGRibCAvIDMsIDE1IC0gdG90YWxfc2Fk
X2NvdW50KTsKPiAgCQkJCWlmIChzYWRfY291bnQgPj0gMSkKPiBAQCAtNDQwMiw2ICs0NDAyLDcg
QEAgc3RhdGljIHZvaWQgZHJtX2VkaWRfdG9fZWxkKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25u
ZWN0b3IsIHN0cnVjdCBlZGlkICplZGlkKQo+ICAJCQkJCSAgICAgICAmZGJbMV0sIHNhZF9jb3Vu
dCAqIDMpOwo+ICAJCQkJdG90YWxfc2FkX2NvdW50ICs9IHNhZF9jb3VudDsKPiAgCQkJCWJyZWFr
Owo+ICsJCQl9Cj4gIAkJCWNhc2UgU1BFQUtFUl9CTE9DSzoKPiAgCQkJCS8qIFNwZWFrZXIgQWxs
b2NhdGlvbiBEYXRhIEJsb2NrICovCj4gIAkJCQlpZiAoZGJsID49IDEpCj4gCgotLSAKS2VlcyBD
b29rCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
