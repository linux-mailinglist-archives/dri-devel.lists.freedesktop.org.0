Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4552E189F72
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 16:16:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5600E6E90F;
	Wed, 18 Mar 2020 15:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D7D6E90F
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 15:16:26 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b2so24670124wrj.10
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 08:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=dTX0UE/hGWoF0D2eXXVk3x71Y+uX2uol3znwsRdv6bc=;
 b=USpnebn9UdEbpDcc9aMRVDU21TMcFjWoGPPfyS+yh9rLtZo+bcGWHiruocp1TXHQfx
 gz/zw1WWdG4ii3J1/INBAaSyhAnFaX0VAfGO+MvUOsQTLHAbILB+XsUiflqprcN+qlyx
 sQWW2lwEn+Kl/Xx9UEs0VP0Tf5yCgTve2Kq6URgK6rb/9edmFjdB4Rg8SmKzJnPWeXn0
 xp4eAbzrx8F36r7LGfC9H+oNWA2P3qJSSdQIrwvec5S1269OCZ4XrIV1BBioQ8oAQNBc
 bittdLDyMZCHJp2mHVhT3YW2VgjDwOvBXpFkfKCpHgOiOfXT4gguU622Iy2+sWve6S+a
 j41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=dTX0UE/hGWoF0D2eXXVk3x71Y+uX2uol3znwsRdv6bc=;
 b=RI0qJAn4YuKy0ni5fEikXqPUQbVL1nO7cwmF7YhDdV5JzSW+i/M2ZiW+R6yPPgXyAQ
 YF3XrRcQ7d86icYyGw/gf9qeWxvEltO18GVGu9a+zAoD8TE4uV5qZGCtftlx+oHXMQ4E
 bobfEMEMTfSmxTn6AW99D6RfV/zXoFIyMWb2baoGW6ibmEUkZ2qUanYSW63saCkqtmMR
 ghTvJB971aBcEWH81bs9xNVVoGV4DjQMfYeXBf/NMRXoxNjPvxXefTnhjcUwDwl3TpzU
 +BdeqlFfE3EtAOCbwBkbY6+Dxwhk4wTdU6WYjSSSkjJuCL8bp7RFgck1VRlSn/ciiY/Z
 LcXg==
X-Gm-Message-State: ANhLgQ2nrYok2EmWUSN4vjYydUPM8PtECrp+BPHPsOM8HU8tWZy8JCPF
 iyuEpO96QHlGG9u8EiQ/pwL6AQ==
X-Google-Smtp-Source: ADFU+vvh1aB0uL3bJyIFhX9XnV69ve21w+9z2Lgd36rwy9liHYNDZjJOGHVpwLIEbUJT3ASkV9eNwQ==
X-Received: by 2002:a5d:6908:: with SMTP id t8mr6323782wru.92.1584544585039;
 Wed, 18 Mar 2020 08:16:25 -0700 (PDT)
Received: from dell ([2.27.167.19])
 by smtp.gmail.com with ESMTPSA id u17sm9806158wrm.43.2020.03.18.08.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 08:16:24 -0700 (PDT)
Date: Wed, 18 Mar 2020 15:17:09 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] Immutable branch between Backlight, Arm, Unicore32 and
 PWM due for the v5.7 merge window
Message-ID: <20200318151709.GA3527@dell>
References: <20200210101546.287565-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200210101546.287565-1-linus.walleij@linaro.org>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 dri-devel@lists.freedesktop.org, Guan Xuetao <gxt@pku.edu.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW5qb3khCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGJiNmQzZmIzNTRjNWVl
OGQ2YmRlMmQ1NzZlYjcyMjBlYTA5ODYyYjk6CgogIExpbnV4IDUuNi1yYzEgKDIwMjAtMDItMDkg
MTY6MDg6NDggLTA4MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoK
CiAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2xlZS9iYWNr
bGlnaHQuZ2l0IGliLWJhY2tsaWdodC1hcm0tdW5pY29yZS1wd20tdjUuNwoKZm9yIHlvdSB0byBm
ZXRjaCBjaGFuZ2VzIHVwIHRvIDI2NDRmOTEyYjQxMDEyYzFjZTVmZjliZTk5ZWZlZWM3MjE0OTFi
ODY6CgogIGJhY2tsaWdodDogcHdtX2JsOiBTd2l0Y2ggdG8gZnVsbCBHUElPIGRlc2NyaXB0b3Ig
KDIwMjAtMDMtMTggMTU6MDU6NTcgKzAwMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkltbXV0YWJsZSBicmFuY2ggYmV0
d2VlbiBCYWNrbGlnaHQsIEFybSwgVW5pY29yZTMyIGFuZCBQV00gZHVlIGZvciB0aGUgdjUuNyBt
ZXJnZSB3aW5kb3cKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KTGludXMgV2FsbGVpaiAoMSk6CiAgICAgIGJhY2tsaWdodDog
cHdtX2JsOiBTd2l0Y2ggdG8gZnVsbCBHUElPIGRlc2NyaXB0b3IKCiBhcmNoL2FybS9tYWNoLXB4
YS9jbS14MzAwLmMgICAgICAgICAgICAgICB8ICAxIC0KIGFyY2gvYXJtL21hY2gtcHhhL2NvbGli
cmktcHhhMjcwLWluY29tZS5jIHwgIDEgLQogYXJjaC9hcm0vbWFjaC1weGEvZXp4LmMgICAgICAg
ICAgICAgICAgICAgfCAgMSAtCiBhcmNoL2FybS9tYWNoLXB4YS9oeDQ3MDAuYyAgICAgICAgICAg
ICAgICB8ICAxIC0KIGFyY2gvYXJtL21hY2gtcHhhL2xwZDI3MC5jICAgICAgICAgICAgICAgIHwg
IDEgLQogYXJjaC9hcm0vbWFjaC1weGEvbWFnaWNpYW4uYyAgICAgICAgICAgICAgfCAgMSAtCiBh
cmNoL2FybS9tYWNoLXB4YS9tYWluc3RvbmUuYyAgICAgICAgICAgICB8ICAxIC0KIGFyY2gvYXJt
L21hY2gtcHhhL21pb2E3MDEuYyAgICAgICAgICAgICAgIHwgIDEgLQogYXJjaC9hcm0vbWFjaC1w
eGEvcGFsbTI3eC5jICAgICAgICAgICAgICAgfCAgMSAtCiBhcmNoL2FybS9tYWNoLXB4YS9wYWxt
dGMuYyAgICAgICAgICAgICAgICB8IDExICsrKysrKysrKystCiBhcmNoL2FybS9tYWNoLXB4YS9w
YWxtdGUyLmMgICAgICAgICAgICAgICB8ICAxIC0KIGFyY2gvYXJtL21hY2gtcHhhL3BjbTk5MC1i
YXNlYm9hcmQuYyAgICAgIHwgIDEgLQogYXJjaC9hcm0vbWFjaC1weGEvdGF2b3JldmIuYyAgICAg
ICAgICAgICAgfCAgMiAtLQogYXJjaC9hcm0vbWFjaC1weGEvdmlwZXIuYyAgICAgICAgICAgICAg
ICAgfCAgMSAtCiBhcmNoL2FybS9tYWNoLXB4YS96Mi5jICAgICAgICAgICAgICAgICAgICB8ICAy
IC0tCiBhcmNoL2FybS9tYWNoLXB4YS96eWxvbml0ZS5jICAgICAgICAgICAgICB8ICAxIC0KIGFy
Y2gvYXJtL21hY2gtczNjMjR4eC9tYWNoLWgxOTQwLmMgICAgICAgIHwgIDEgLQogYXJjaC9hcm0v
bWFjaC1zM2MyNHh4L21hY2gtcngxOTUwLmMgICAgICAgfCAgMSAtCiBhcmNoL2FybS9tYWNoLXMz
YzY0eHgvZGV2LWJhY2tsaWdodC5jICAgICB8ICAzIC0tLQogYXJjaC9hcm0vbWFjaC1zM2M2NHh4
L21hY2gtY3JhZzY0MTAuYyAgICAgfCAgMSAtCiBhcmNoL2FybS9tYWNoLXMzYzY0eHgvbWFjaC1o
bXQuYyAgICAgICAgICB8ICAxIC0KIGFyY2gvYXJtL21hY2gtczNjNjR4eC9tYWNoLXNtYXJ0cS5j
ICAgICAgIHwgIDEgLQogYXJjaC9hcm0vbWFjaC1zM2M2NHh4L21hY2gtc21kazY0MTAuYyAgICAg
fCAgMiArLQogYXJjaC91bmljb3JlMzIva2VybmVsL3B1djMtbmIwOTE2LmMgICAgICAgfCAgMSAt
CiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYyAgICAgICAgICB8IDE5IC0tLS0tLS0t
LS0tLS0tLS0tLS0KIGluY2x1ZGUvbGludXgvcHdtX2JhY2tsaWdodC5oICAgICAgICAgICAgIHwg
IDIgLS0KIDI2IGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDQ5IGRlbGV0aW9ucygt
KQogCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBM
ZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xs
b3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
