Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 097D62934B
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 10:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444EB6E095;
	Fri, 24 May 2019 08:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CB46E095
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 08:42:32 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id d9so9106139wrx.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 01:42:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=/eh8kpJepWcHd05fTLgUlObMd6U9mhCiDLTnG3UeKcI=;
 b=Lj6l4AjslpgS4sxjRZIezEWkWQFbykRrkJtLaUSsADMwBV961nxmtSYFeYlL5PvaKK
 +koPzfiSIfIaFAFxUKzNB/uqmzudylrKth1tCMFb+Inj3MQVWTPIkW81AUExTNwsCIdt
 Cd26D1zXcyFW5OPdJGurRtJMVebYGRhV+TOEppIg0LTJm6J/v65ZyD7a0iUOU36IDt6n
 TwZjRhweTe4xNced6OoGgWcjtJ1cAYsVNsT0B8EX/8aFFX5Gl7OWECgM49oMuVetcjoS
 1LdIPcFtmRYdNJLE65W4dhsTlTjN7hTuo2gd/cl4ltl0VxYATcBCLQGLN7gvXkAAKCcs
 gRgA==
X-Gm-Message-State: APjAAAWm/df3qDXCuhmEiA9//QxYw8+NX+QREzo63chybaAFeQcv6yma
 Y8OFnbd19dYTqeVXLwgA+CC5TA==
X-Google-Smtp-Source: APXvYqyLnco13OdPHMGW6AArjIFEq6MpKQ7TUhVrVAXk43WMVF9owzwnsYDk2JrxFLeHX1Tl2OpFYw==
X-Received: by 2002:adf:b447:: with SMTP id v7mr62237424wrd.267.1558687350584; 
 Fri, 24 May 2019 01:42:30 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id r4sm1376397wrv.34.2019.05.24.01.42.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 May 2019 01:42:29 -0700 (PDT)
Subject: Re: [PATCH] drm/meson: imply dw-hdmi i2s audio for meson hdmi
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
References: <20190429102325.29022-1-jbrunet@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <5bd1ab1d-9352-8ac0-de99-e80bd23f7264@baylibre.com>
Date: Fri, 24 May 2019 10:42:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429102325.29022-1-jbrunet@baylibre.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=/eh8kpJepWcHd05fTLgUlObMd6U9mhCiDLTnG3UeKcI=;
 b=hcCGrA1n1uB8S14VInJAwo4TfTI9LyNWA8O28fqhM2rVpmLndfjfHyAF9eOJLg4LYa
 p2aocEcOyNpx3DahIxVfDTD1FKvkhKIKXeJs4ytV1va0a8SSiBiebByNvQTRM/fp49P5
 o7EPPHnTSs3+IZU/CawlaKvgk4PvxamnuGrLRyEjyi1iq9MyvecvLivGrEWhPpTAEmyk
 qX4gbw2nZB8SoNuSmspdWEyRBhnAPaIRfpSwxvkCnxJu7bsBeuzvwJQp3+Jb7X78uOF2
 8s6rOWmmA9F43XQYVHQgROZYHtvhke9mtHUXqROXtHQ+eA4Zok5h66KCbMR0E7V5Prr/
 oXYQ==
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjkvMDQvMjAxOSAxMjoyMywgSmVyb21lIEJydW5ldCB3cm90ZToKPiBJbXBseSB0aGUgaTJz
IHBhcnQgb2YgdGhlIFN5bm9wc3lzIEhETUkgZHJpdmVyIGZvciBBbWxvZ2ljIFNvQ3MuCj4gVGhp
cyB3aWxsIGVuYWJsZSB0aGUgaTJzIHBhcnQgYnkgZGVmYXVsdCB3aGVuIG1lc29uIGhkbWkgZHJp
dmVyCj4gaXMgZW5hYmxlIGJ1dCBsZXQgcGxhdGZvcm1zIG5vdCBzdXBwb3J0ZWQgYnkgdGhlIGF1
ZGlvIHN1YnN5c3RlbQo+IGRpc2FibGUgaXQgaWYgbmVjZXNzYXJ5Lgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEplcm9tZSBCcnVuZXQgPGpicnVuZXRAYmF5bGlicmUuY29tPgo+IC0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vbWVzb24vS2NvbmZpZyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lc29uL0tjb25maWcgYi9k
cml2ZXJzL2dwdS9kcm0vbWVzb24vS2NvbmZpZwo+IGluZGV4IGMyOGI2OWY0ODU1NS4uYTQ4MGU0
YTgwYmVhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9LY29uZmlnCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL21lc29uL0tjb25maWcKPiBAQCAtMTQsMyArMTQsNCBAQCBjb25m
aWcgRFJNX01FU09OX0RXX0hETUkKPiAgCWRlcGVuZHMgb24gRFJNX01FU09OCj4gIAlkZWZhdWx0
IHkgaWYgRFJNX01FU09OCj4gIAlzZWxlY3QgRFJNX0RXX0hETUkKPiArCWltcGx5IERSTV9EV19I
RE1JX0kyU19BVURJTwo+IAoKUmV2aWV3ZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25n
QGJheWxpYnJlLmNvbT4KCkFuZCBhcHBseWluZyB0byBkcm0tbWlzYy1uZXh0CgpUaGFua3MsCk5l
aWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
