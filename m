Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCB82A91CA
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:49:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95042890F2;
	Fri,  6 Nov 2020 08:49:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95AF3890F2
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 08:49:08 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id a3so415566wrx.13
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 00:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=4gXfZMux6ogf2vVPHPrkL0rjreUZC3GES5D2UkiysIw=;
 b=C6iQhO/6iKUaCjWMaeY8SSjPW3SPed7FleZjgyiTbeenEF+cP/6d0G2NFBlmZ6O+0H
 bioL6f0N8OmX7BWLovVyNsXDaR9/nfXxEHTy5jLd7+u3mFIq7wJlEri4rU3IlV4wqgcD
 83JOnHkogW2l+61CjQQr5BNpYIV7HEgBg3nmG4Fve6ZR37i8/7lAL2dsyLsJEnNchGiC
 lCshBq71mdswYGS4ahEw8pGeUEJY4WU8A7zy3kdNr9+wSwgQY8Lul4rkCPgz4TKI8hIP
 8zA+DSnXbK0DYB4g2q+MP09tRsmr/SaiyRXr01/x6G2Ah0fUMYHNlIKbDUVPgaVw88wV
 0F4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4gXfZMux6ogf2vVPHPrkL0rjreUZC3GES5D2UkiysIw=;
 b=X9XdET2nsbv/l38vL06COSbselOU6jjVET1DElCZLlQRlXk8RMhZ6jSNF1g9kPZUiB
 uLr1ny1LZjgHnvzoboBdib9+L3hOfQcUABUkjUmCQgVFtJqkM5dohQ6A+PrAPxvUX/A1
 wmwPiPkkE9RI5uGo/7/GThgVkS8stf2MWaKkdAaPPtYAKYlXHvPfQAjF685Jv70TFa3f
 0lFIlymsUWqlfqi9z62cwbtUFoWfJYy4GlTcjA/2zPKAa4qeZEj9GDjlV+H/eAG7+DIu
 Ki1Dvg3i9bpO5qeJHEi73IbDc2rwX/S9V7q3pay00Prd3lZLeaO0iJGoEAvy0uYjokun
 pfIQ==
X-Gm-Message-State: AOAM530C/6pq6cpesv3J3d2ByEn+xG26155OTvd34ze/7Fw9fDv01B/2
 EwcWevUyb9gNN6sj/cqhf6hdtQ==
X-Google-Smtp-Source: ABdhPJxV2f1/yepdeAvjiDc4ZJvmvoXzriD7P33clmKJfkWKfm32k8/eAy9mdgUCgs52Ep3+q+DT+A==
X-Received: by 2002:a05:6000:7:: with SMTP id h7mr1443346wrx.83.1604652547314; 
 Fri, 06 Nov 2020 00:49:07 -0800 (PST)
Received: from dell ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id t11sm1163799wmf.35.2020.11.06.00.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 00:49:06 -0800 (PST)
Date: Fri, 6 Nov 2020 08:49:04 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH 03/19] gpu: drm: imx: ipuv3-plane: Mark 'crtc_state' as
 __always_unused
Message-ID: <20201106084904.GY4488@dell>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105144517.1826692-4-lee.jones@linaro.org>
 <15a4a184-74c2-e630-193a-cdea61545a03@pengutronix.de>
 <20201106074151.GU4488@dell>
 <5056c156-9f6c-8e0d-54e8-5317fdd46c12@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5056c156-9f6c-8e0d-54e8-5317fdd46c12@pengutronix.de>
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
Cc: David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAwNiBOb3YgMjAyMCwgQWhtYWQgRmF0b3VtIHdyb3RlOgoKPiBPbiAxMS82LzIwIDg6
NDEgQU0sIExlZSBKb25lcyB3cm90ZToKPiA+IE9uIFRodSwgMDUgTm92IDIwMjAsIEFobWFkIEZh
dG91bSB3cm90ZToKPiA+IAo+ID4+IEhlbGxvIExlZSwKPiA+Pgo+ID4+IE9uIDExLzUvMjAgMzo0
NSBQTSwgTGVlIEpvbmVzIHdyb3RlOgo+ID4+PiBJbiB0aGUgbWFjcm8gZm9yX2VhY2hfb2xkbmV3
X2NydGNfaW5fc3RhdGUoKSAnY3J0Y19zdGF0ZScgaXMgcHJvdmlkZWQKPiA+Pj4gYXMgYSBjb250
YWluZXIgZm9yIHN0YXRlLT5jcnRjc1tpXS5uZXdfc3RhdGUsIGJ1dCBpcyBub3QgdXRpbGlzZWQg
aW4KPiA+Pj4gdGhpcyB1c2UtY2FzZS4gIFdlIGNhbm5vdCBzaW1wbHkgZGVsZXRlIHRoZSB2YXJp
YWJsZSwgc28gaGVyZSB3ZSB0ZWxsCj4gPj4+IHRoZSBjb21waWxlciB0aGF0IHdlJ3JlIGludGVu
dGlvbmFsbHkgZGlzY2FyZGluZyB0aGUgcmVhZCB2YWx1ZS4KPiA+Pgo+ID4+IGZvcl9lYWNoX29s
ZG5ld19jcnRjX2luX3N0YXRlIGFscmVhZHkgKHZvaWQpIGNhc3RzIHRoZSBkcm1fY3J0YyBhbmQg
dGhlIG9sZAo+ID4+IGRybV9jcnRjX3N0YXRlIHRvIHNpbGVuY2UgdW51c2VkLWJ1dC1zZXQtdmFy
aWFibGUgd2FybmluZy4gU2hvdWxkIHdlIG1heWJlCj4gPj4gKHZvaWQpIGNhc3QgdGhlIG5ldyBj
cnRjX3N0YXRlIGFzIHdlbGw/Cj4gPiAKPiA+IEZyb20gd2hhdCBJIHNhdywgaXQgb25seSB2b2lk
IGNhc3RzIHRoZSBvbmVzIHdoaWNoIGFyZW4ndCBhc3NpZ25lZC4KPiAKPiBIb3cgZG8geW91IG1l
YW4/IEkgd29uZGVyIGlmCj4gCj4gICNkZWZpbmUgZm9yX2VhY2hfb2xkbmV3X2NydGNfaW5fc3Rh
dGUoX19zdGF0ZSwgY3J0Yywgb2xkX2NydGNfc3RhdGUsIG5ld19jcnRjX3N0YXRlLCBfX2kpIFwK
PiAgICAgICAgIGZvciAoKF9faSkgPSAwOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCj4gICAgICAgICAgICAgIChfX2kpIDwgKF9fc3RhdGUpLT5kZXYt
Pm1vZGVfY29uZmlnLm51bV9jcnRjOyAgICAgICAgICAgICAgXAo+ICAgICAgICAgICAgICAoX19p
KSsrKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
PiAgICAgICAgICAgICAgICAgZm9yX2VhY2hfaWYgKChfX3N0YXRlKS0+Y3J0Y3NbX19pXS5wdHIg
JiYgICAgICAgICAgICAgICBcCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoKGNydGMp
ID0gKF9fc3RhdGUpLT5jcnRjc1tfX2ldLnB0ciwgICAgICAgXAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICh2b2lkKShjcnRjKSAvKiBPbmx5IHRvIGF2b2lkIHVudXNlZC1idXQtc2V0
LXZhcmlhYmxlIHdhcm5pbmcgKi8sIFwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChv
bGRfY3J0Y19zdGF0ZSkgPSAoX19zdGF0ZSktPmNydGNzW19faV0ub2xkX3N0YXRlLCBcCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAodm9pZCkob2xkX2NydGNfc3RhdGUpIC8qIE9ubHkg
dG8gYXZvaWQgdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUgd2FybmluZyAqLywgXAo+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgKG5ld19jcnRjX3N0YXRlKSA9IChfX3N0YXRlKS0+Y3J0Y3Nb
X19pXS5uZXdfc3RhdGUsIDEpKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgKG5ld19j
cnRjX3N0YXRlKSA9IChfX3N0YXRlKS0+Y3J0Y3NbX19pXS5uZXdfc3RhdGUsIFwKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICh2b2lkKShuZXdfY3J0Y19zdGF0ZSksIDEpKQo+IAo+IHdv
dWxkbid0IGJlIGJldHRlci4KClRoYXQgYWxzbyB3b3JrcyBmb3IgbWUuICBJIGNhbiBmaXggdGhp
cyB1cC4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0g
RGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZv
ciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
