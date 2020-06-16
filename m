Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEA71FC729
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 09:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC1C6E24D;
	Wed, 17 Jun 2020 07:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCBEA6E186
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 18:39:22 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id z9so24803915ljh.13
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 11:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MtGWOM3LwYRZSC8oT5V9UrxzaPqB0NOi8RwnQtCKVwE=;
 b=cvKlOlmY6qFhTxuhAy0TjCnE6xwoCKTVh05op9/hfNItaT3sl5Sm3QrNl+17SADbLD
 ppRXMV4o4SoyjpR90s6ELR2lwX6Y9n7LH7DFGidth5GXxI3YMO5LFlBEA0ysOP/vm4et
 cuwgd//3Pz76jcOhrwGZ+wdrUFPVZ7h5OTQkELv/VMgbvrAqveFXMbw4HMULJH6dfxvq
 XWvESMU+JeDaXEwz8nC0avgaBuMjS8bEECiihia1Je4FxcQotXN6D9kyooSqoL2Obzkh
 4y4TnOfBYxpfLyo3zOOl0u9YKdKvOqkt5XMqTlwNkF/tNKpC46HT/CxWuM+v0stkubus
 q/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MtGWOM3LwYRZSC8oT5V9UrxzaPqB0NOi8RwnQtCKVwE=;
 b=hCmOxa4h7stfnbt1PIz5JrVSDMV6csY3t0BzKOKULU/NIeSHq2f7KucPk6AujA93lV
 Z96QQmBk7mDWkVNXl8mOMH/cChx488epWb1vmr8hWXNPiJhgJT4qHvDiZdN+DQA013U4
 zvPvmrPSS7/wQRu7SDHFq3+AoGINiSZUVyk9GGjfuAm6aZIn9PXX+MzvCqD73Qjjybx5
 d3cG7T4Dyw9bM7bVyJ9gWDK/xMUiMeUrndCmIYitPIRstUSMrs7BWcAn7HMPnUO2irmG
 Yys8Zvq6BhPIp0y8/tWBU1vHfs9dAGCLLhGOmNAeKKk9hFNd9f5RF6WdpwQ3HUpvrdWw
 qGpQ==
X-Gm-Message-State: AOAM530B1/1Aas4Xb/V30sSkVledQ0PUZYlxHcHPaVFZn9/O8UrS1DDp
 4qr0DS5bAdVpnBX6zQK12Xw=
X-Google-Smtp-Source: ABdhPJxs8SFnjcPDXMrqy2pH8GtPbofGwiJAWirkfhiJpSSdN+3fxOuyDCOYl4VDYiQdFb0KBrbR6w==
X-Received: by 2002:a05:651c:384:: with SMTP id
 e4mr2071108ljp.410.1592332760882; 
 Tue, 16 Jun 2020 11:39:20 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id e16sm248119lfj.44.2020.06.16.11.39.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2020 11:39:20 -0700 (PDT)
Subject: Re: [PATCH v3] drm/tegra: Add zpos property for cursor planes
To: Thierry Reding <thierry.reding@gmail.com>
References: <20200616181449.3147258-1-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8e45b425-b667-433e-2074-7a058329f5c2@gmail.com>
Date: Tue, 16 Jun 2020 21:39:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200616181449.3147258-1-thierry.reding@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 17 Jun 2020 07:26:02 +0000
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTYuMDYuMjAyMCAyMToxNCwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBGcm9tOiBUaGll
cnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IAo+IEFzIG9mIGNvbW1pdCA0ZGM1NTUy
NWIwOTUgKCJkcm06IHBsYW5lOiBWZXJpZnkgdGhhdCBubyBvciBhbGwgcGxhbmVzCj4gaGF2ZSBh
IHpwb3MgcHJvcGVydHkiKSBhIHdhcm5pbmcgaXMgZW1pdHRlZCBpZiB0aGVyZSdzIGEgbWl4IG9m
IHBsYW5lcwo+IHdpdGggYW5kIHdpdGhvdXQgYSB6cG9zIHByb3BlcnR5Lgo+IAo+IE9uIFRlZ3Jh
LCBjdXJzb3IgcGxhbmVzIGFyZSBhbHdheXMgY29tcG9zaXRlZCBvbiB0b3Agb2YgYWxsIG90aGVy
Cj4gcGxhbmVzLCB3aGljaCBpcyB3aHkgdGhleSBuZXZlciBoYWQgYSB6cG9zIHByb3BlcnR5IGF0
dGFjaGVkIHRvIHRoZW0uCj4gSG93ZXZlciwgc2luY2UgdGhlIGNvbXBvc2l0aW9uIG9yZGVyIGlz
IGZpeGVkLCB0aGlzIGlzIHRyaXZpYWwgdG8KPiByZW1lZHkgYnkgc2ltcGx5IGF0dGFjaGluZyBh
biBpbW11dGFibGUgenBvcyBwcm9wZXJ0eSB0byB0aGVtLgo+IAo+IHYzOiBkbyBub3QgaGFyZGNv
ZGUgenBvcyBmb3Igb3ZlcmxheSBwbGFuZXMgdXNlZCBhcyBjdXJzb3IgKERtaXRyeSkKPiB2Mjog
aGFyZGNvZGUgY3Vyc29yIHBsYW5lIHpwb3MgdG8gMjU1IGluc3RlYWQgb2YgMCAoVmlsbGUpCj4g
Cj4gUmVwb3J0ZWQtYnk6IEpvbmF0aGFuIEh1bnRlciA8am9uYXRoYW5oQG52aWRpYS5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5j
IGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmMKPiBpbmRleCA4M2YzMWM2ZTg5MWMuLjA0ZDY4
NDhkMTlmYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5jCj4gQEAgLTk1Nyw2ICs5NTcsNyBAQCBzdGF0aWMg
c3RydWN0IGRybV9wbGFuZSAqdGVncmFfZGNfY3Vyc29yX3BsYW5lX2NyZWF0ZShzdHJ1Y3QgZHJt
X2RldmljZSAqZHJtLAo+ICAJfQo+ICAKPiAgCWRybV9wbGFuZV9oZWxwZXJfYWRkKCZwbGFuZS0+
YmFzZSwgJnRlZ3JhX2N1cnNvcl9wbGFuZV9oZWxwZXJfZnVuY3MpOwo+ICsJZHJtX3BsYW5lX2Ny
ZWF0ZV96cG9zX2ltbXV0YWJsZV9wcm9wZXJ0eSgmcGxhbmUtPmJhc2UsIDI1NSk7Cj4gIAo+ICAJ
cmV0dXJuICZwbGFuZS0+YmFzZTsKPiAgfQo+IAoKTG9va3MgbmljZSwgdGhhbmtzISBTaW5jZSB5
b3UgZHJvcHBlZCBhbGwgb3RoZXIgenBvcyBjaGFuZ2VzIGZvciBvdGhlcgpwbGFuZXMgYW5kIGdp
dmVuIHRoYXQgdGhlIG90aGVyIHBsYW5lcyBoYXZlIDI1NSBmb3IgdGhlIG1heCB6cG9zLCB3aGF0
CmFib3V0IHRvIHNldCB0aGUgY3Vyc29yJ3MgenBvcyB0byAyNTY/Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
