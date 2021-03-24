Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC74347AF0
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 15:41:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A1286EA0F;
	Wed, 24 Mar 2021 14:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B5A6EA0F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 14:41:12 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id g8so25222806lfv.12
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 07:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qYlws7H6Jxfn/y4LVXeYz0t3nAbGfGiXv+hhlwSEdmM=;
 b=XsWZxAgOc3IKw5oLV+VZfY4JXCt3mKEVAxc/A7MMF5Cd1DYpDYyvm6y6bdBvYeA4jK
 TIhxFmxKQf9iEoKwHPQnjZyRKwOnFmKOgZN25tpOdAy+pq53KhGR6/L/4kY91Rj0N7wz
 1GJHE7y2iJ67eG3CwRm3lWyO82Fsxt0XG0PyZMSGN1SH7WmC+6RSi31Of8tk/yjq2dDT
 Fy+IIiiWHIC4sM0AUXR9eaZJhSBbgrYOqc35jNiuxfMgLI7R88gRJ1EzIv1luZQ7pRT/
 p9hQfUKKT6dw8vMbOexkD3l2d4kyOkc8aX7Cc/d+terIIOggUlBX0It7HThwdrLAf1cs
 fB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qYlws7H6Jxfn/y4LVXeYz0t3nAbGfGiXv+hhlwSEdmM=;
 b=NFmzxhEonna/aaE/vqrijEYtRYUl1qNokoWUZqS+kmGHYInvDOWx94KOT0LWceezA9
 NfI471zEBnQSoEaxxIPCwXjF3O1XtpGcMwgwSoTbJR/vF5Zygu8kWlta04fodj8pA32X
 h/QcWlLak6WQ3ysJeCHnBEwVBI5hZMli55Pu5jePIrE3fFVJRNYyDfbm2Z8DuoMwozaZ
 ELZDZfsMJp9ErDZT9vPIglzlxnn5G8tiCvmNGq33uJU1Qg8L7plhJy5DVkbWMg3sBpbG
 0I8sY5xRyTytsCH29oOujq/zAEBXLiHFxeANiUHYuYM0HNSj4u8dVwvhVv5fx7fO6bUM
 a1AA==
X-Gm-Message-State: AOAM530alGuhXHvzRu+C7xyQZ+z4g1bxLv8I9LjweV/lO/4qrrC85c0T
 1lhKDyG3iZyvxu/EEQrgVsE=
X-Google-Smtp-Source: ABdhPJx4UTSUgLO2cfpzNf2uVmX5cnFnbZ3G5cLjKVxLPhGHmHxi/QQCPnuocUeefxyCeV1Zz2uL8g==
X-Received: by 2002:ac2:4298:: with SMTP id m24mr2230404lfh.429.1616596870491; 
 Wed, 24 Mar 2021 07:41:10 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-60.dynamic.spd-mgts.ru.
 [109.252.193.60])
 by smtp.googlemail.com with ESMTPSA id l21sm249737lfc.91.2021.03.24.07.41.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 07:41:09 -0700 (PDT)
Subject: Re: [PATCH 6/9] drm/tegra: gem: Add a clarifying comment
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <cyndis@kapsi.fi>
References: <20210323155437.513497-1-thierry.reding@gmail.com>
 <20210323155437.513497-7-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <21d2e691-6404-503b-422a-be97a7b9d1b4@gmail.com>
Date: Wed, 24 Mar 2021 17:41:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210323155437.513497-7-thierry.reding@gmail.com>
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>, linux-tegra@vger.kernel.org,
 James Jones <jajones@nvidia.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjMuMDMuMjAyMSAxODo1NCwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBGcm9tOiBUaGll
cnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IAo+IENsYXJpZnkgd2hlbiBhIGZpeGVk
IElPViBhZGRyZXNzIGNhbiBiZSB1c2VkIGFuZCB3aGVuIGEgYnVmZmVyIGhhcyB0bwo+IGJlIG1h
cHBlZCBiZWZvcmUgdGhlIElPVkEgY2FuIGJlIHVzZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhp
ZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJt
L3RlZ3JhL3BsYW5lLmMgfCA4ICsrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlv
bnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3BsYW5lLmMgYi9k
cml2ZXJzL2dwdS9kcm0vdGVncmEvcGxhbmUuYwo+IGluZGV4IDE5ZTg4NDdhMTY0Yi4uNzkzZGE1
ZDY3NWQyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9wbGFuZS5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3BsYW5lLmMKPiBAQCAtMTE5LDYgKzExOSwxNCBAQCBz
dGF0aWMgaW50IHRlZ3JhX2RjX3BpbihzdHJ1Y3QgdGVncmFfZGMgKmRjLCBzdHJ1Y3QgdGVncmFf
cGxhbmVfc3RhdGUgKnN0YXRlKQo+ICAJCWRtYV9hZGRyX3QgcGh5c19hZGRyLCAqcGh5czsKPiAg
CQlzdHJ1Y3Qgc2dfdGFibGUgKnNndDsKPiAgCj4gKwkJLyoKPiArCQkgKiBJZiB3ZSdyZSBub3Qg
YXR0YWNoZWQgdG8gYSBkb21haW4sIHdlIGFscmVhZHkgc3RvcmVkIHRoZQo+ICsJCSAqIHBoeXNp
Y2FsIGFkZHJlc3Mgd2hlbiB0aGUgYnVmZmVyIHdhcyBhbGxvY2F0ZWQuIElmIHdlJ3JlCj4gKwkJ
ICogcGFydCBvZiBhIGdyb3VwIHRoYXQncyBzaGFyZWQgYmV0d2VlbiBhbGwgZGlzcGxheQo+ICsJ
CSAqIGNvbnRyb2xsZXJzLCB3ZSd2ZSBhbHNvIGFscmVhZHkgbWFwcGVkIHRoZSBmcmFtZWJ1ZmZl
cgo+ICsJCSAqIHRocm91Z2ggdGhlIFNNTVUuIEluIGJvdGggY2FzZXMgd2UgY2FuIHNob3J0LWNp
cmN1aXQgdGhlCj4gKwkJICogY29kZSBiZWxvdyBhbmQgcmV0cmlldmUgdGhlIHN0b3JlZCBJT1Yg
YWRkcmVzcy4KPiArCQkgKi8KPiAgCQlpZiAoIWRvbWFpbiB8fCBkYy0+Y2xpZW50Lmdyb3VwKQo+
ICAJCQlwaHlzID0gJnBoeXNfYWRkcjsKPiAgCQllbHNlCj4gCgpUaGlzIGNvbW1lbnQgaXMgY29y
cmVjdCwgYnV0IHRoZSBsb2dpYyBmZWVscyBhIGJpdCBsYW1lIGJlY2F1c2UgaXQKc2hvdWxkIGJl
IHdhc3RlZnVsIHRvIHJlLW1hcCBETUEgb24gZWFjaCBGQiBmbGlwLiBQZXJzb25hbGx5IEkgZG9u
J3QKY2FyZSBtdWNoIGFib3V0IHRoaXMgc2luY2Ugb2xkZXIgVGVncmFzIHVzZSBwaW5uZWQgYnVm
ZmVycyBieSBkZWZhdWx0LApidXQgdGhpcyBzaG91bGRuJ3QgYmUgZ29vZCBmb3IgVDEyNCsgdXNl
cnMuCgpQZXJoYXBzIGR1bWIgYnVmZmVycyBzaG91bGQgYmUgcGlubmVkIHRvIGRpc3BsYXkgYnkg
ZGVmYXVsdCBhbmQgdGhlbiB3ZQpzaG91bGQgZXh0ZW5kIHRoZSBUZWdyYSBVQVBJIHRvIHN1cHBv
cnQgQk8gbWFwcGluZyB0byBkaXNwbGF5IGNsaWVudCg/KS4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
