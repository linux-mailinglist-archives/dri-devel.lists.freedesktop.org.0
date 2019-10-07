Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64305CEBA0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 20:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B9956E135;
	Mon,  7 Oct 2019 18:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071E96E135
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 18:17:36 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id m13so5459104ywa.11
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2019 11:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZJ5rrIAuBUJYzOlccO9JuQTFpUp1XjhgjNVhlkVi7DA=;
 b=rBeThDE537SyV8ARoH+HqBeqQ6HJ71IKpdCbE5NKA8aLbuJlM/SXg1gA4VCszPPbNa
 RJk7mLgDfheIK5idGFMsWdeii+RkavG7kOOmk679CILoArcLFPmxUsdOK3WGCdz3NAyH
 YNeVD5aeak2+B8FlO/6xvl7kIQuiJuoiFoONCEhnXf5b+0lJNpP0m6OdL76WcXO6zmzo
 6vLp6vFUXth5KUZPceciDzuUeH5C6ehkR4wBXyTv1BsKHOmBK+AztOFyRzcxdrQZKJzl
 7xB3Gd7nIQJUOH39LMDvMDrGBfMU2jk8VcmLPijsTkCnKOvtw+TVrwDRbMb/LjzHcUAd
 NEYw==
X-Gm-Message-State: APjAAAUkx1ZVe0Q+QywA+rQboamd9RtDZv3pPIU2GBMd4ncEHCBfpJ1J
 WPPaZExDYYHGoO6edzqQwGf6pg==
X-Google-Smtp-Source: APXvYqwAzGaoO8ZGKjf7ndkcNxbjkW9IK227LK4txlraHkImGAhDbBlS61SHnKoyGBVj6DMa+WqV1g==
X-Received: by 2002:a81:9b10:: with SMTP id s16mr20589619ywg.20.1570472255999; 
 Mon, 07 Oct 2019 11:17:35 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id d188sm4086164ywa.88.2019.10.07.11.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 11:17:35 -0700 (PDT)
Date: Mon, 7 Oct 2019 14:17:35 -0400
From: Sean Paul <sean@poorly.run>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 1/2] drm_dp_cec: drop use of drmP.h
Message-ID: <20191007181735.GE126146@art_vandelay>
References: <20191007171224.1581-1-sam@ravnborg.org>
 <20191007171224.1581-2-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191007171224.1581-2-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZJ5rrIAuBUJYzOlccO9JuQTFpUp1XjhgjNVhlkVi7DA=;
 b=SFU/HCs5t2ClG/FZtohCsu9rBQFf878KCfCd1wY31bLagPfZx6CqZnug24TtZ+pdW8
 C738F6/FtkM2EHmnL5N7MTxmNW6NpnC/rbEwgQ12ylpHrPxmnzRPFAB7JenLB7u5AyRJ
 p/3VNm14BoPJ0KdYQ2fDooVSN+rkaBS2LN1S0gbhqcruUo2XzR9Z1/wJ93zTeiPaT2/m
 7c1gIGfet/0+8PGK4GrlUAfxImatU8hOEB0gw4PeNUPcsIi7DXMNIV2KjPWu5jbCOjwm
 JniTx61XaMrsTritvvSvv6ZLYV3TEz8bXc7t8eXY4GSZbjPpQVElofQBvzJC+SwN5TYr
 Tr8w==
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
Cc: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dariusz Marcinkiewicz <darekm@google.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMDcsIDIwMTkgYXQgMDc6MTI6MjNQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IGRybVAuaCBpcyBkZXByZWNhdGVkIGFuZCB3aWxsIGJlIGRlbGV0ZWQuCj4gUmVwbGFj
ZSB1c2Ugd2l0aCBwcm9wZXIgaGVhZGVyLgo+IAo+IERpdmlkZSBoZWFkZXIgaW5jbHVkZXMgaW4g
YmxvY2tzIHdoaWxlIHRvdWNoaW5nIHRoZXNlLgo+IAo+IEJ1aWxkIHRlc3RlZCB3aXRoIHZhcmlv
dXMgYXJjaHRlY3R1cmVzIGFuZCBjb25maWdzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNhbSBSYXZu
Ym9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KClJldmlld2VkLWJ5OiBTZWFuIFBhdWwgPHNlYW5AcG9v
cmx5LnJ1bj4KCj4gRml4ZXM6IGFlODViMGRmMTI0ZjY5MjggKCJkcm1fZHBfY2VjOiBhZGQgY29u
bmVjdG9yIGluZm8gc3VwcG9ydC4iKQo+IENjOiBEYXJpdXN6IE1hcmNpbmtpZXdpY3ogPGRhcmVr
bUBnb29nbGUuY29tPgo+IENjOiBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsLWNpc2NvQHhzNGFsbC5u
bD4KPiBDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiBDYzogQmVuIFNrZWdncyA8
YnNrZWdnc0ByZWRoYXQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2NlYy5j
IHwgNiArKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9jZWMuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZHBfY2VjLmMKPiBpbmRleCBiNDU3YzE2YzNhOGIuLjNhYjI2MDlm
OWVjNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2NlYy5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9kcF9jZWMuYwo+IEBAIC04LDEwICs4LDEyIEBACj4gICNpbmNs
dWRlIDxsaW51eC9rZXJuZWwuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ICAjaW5j
bHVkZSA8bGludXgvc2xhYi5oPgo+ICsKPiArI2luY2x1ZGUgPG1lZGlhL2NlYy5oPgo+ICsKPiAg
I2luY2x1ZGUgPGRybS9kcm1fY29ubmVjdG9yLmg+Cj4gKyNpbmNsdWRlIDxkcm0vZHJtX2Rldmlj
ZS5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9kcF9oZWxwZXIuaD4KPiAtI2luY2x1ZGUgPGRybS9k
cm1QLmg+Cj4gLSNpbmNsdWRlIDxtZWRpYS9jZWMuaD4KPiAgCj4gIC8qCj4gICAqIFVuZm9ydHVu
YXRlbHkgaXQgdHVybnMgb3V0IHRoYXQgd2UgaGF2ZSBhIGNoaWNrZW4tYW5kLWVnZyBzaXR1YXRp
b24KPiAtLSAKPiAyLjIwLjEKPiAKCi0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBH
b29nbGUgLyBDaHJvbWl1bSBPUwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
