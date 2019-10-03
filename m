Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 465D6C9D91
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 13:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880D76E12C;
	Thu,  3 Oct 2019 11:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D952A6E12C
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 11:42:31 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id y135so7072500wmc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2019 04:42:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=cHvDsFcekIPBjH5IQouCdyPdPjje7XItWyIIEhMEyPI=;
 b=LX2+aEKEaW8kVWkk8/rOISHDvYIwys5PTpw2jYyza3dXaUdyv9bqmYEZuZXkbL8MHs
 40oI/5KwbDuZ6bE4MTkC8ib9p8k07zdWxS4n6d9Ld16YuExUZSlS1fn5Nh8WSI2GaesL
 EcuuISQ32MzCTm/cG/J2xos+lBcr8y5D6BsB4Onk9Y0eUJCQLIJZwmedfUq4EtuA6Jz7
 RvhpB6MHvH+qOAtlJA+NqNsac4hGzHpk+KTMoh4z6T/JpcQIJ7s4TveacYe/pcfO6h9g
 MP8FmRy3t6Vgfm2q04neov9ggumxTMw6jnyUqHkqED2kbFMt/t7RCQDgWLD56DilhDT9
 +JAw==
X-Gm-Message-State: APjAAAVylcLmqV8KB72eDlItkrV8ebx2A5AgICsTQuL7yAV6XL9deglS
 xK+AtZF/v1a9NSvHmCLiDB98BA==
X-Google-Smtp-Source: APXvYqw1NwetRlcDBzEKd3mk6MdQNZN+YmmIwRP4K/p2HZFkqtNAeXNCEmkgLAMiYM73jRZWrIMe1w==
X-Received: by 2002:a7b:cf12:: with SMTP id l18mr7069293wmg.25.1570102950452; 
 Thu, 03 Oct 2019 04:42:30 -0700 (PDT)
Received: from dell ([2.27.167.122])
 by smtp.gmail.com with ESMTPSA id m62sm2235472wmm.35.2019.10.03.04.42.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 03 Oct 2019 04:42:29 -0700 (PDT)
Date: Thu, 3 Oct 2019 12:42:26 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH v4 1/2] dt-bindings: backlight: lm3630a: Add enable-gpios
 to describe HWEN pin
Message-ID: <20191003114226.GD21172@dell>
References: <20190912213257.24147-1-andreas@kemnade.info>
 <20190912213257.24147-2-andreas@kemnade.info>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190912213257.24147-2-andreas@kemnade.info>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=cHvDsFcekIPBjH5IQouCdyPdPjje7XItWyIIEhMEyPI=;
 b=KUHnsWOZhhK6SSsl82Z+eu8JxSen5PB6zveEcc7ZS/DZqL2xMoZCrsOM+Cgj/s/GZU
 jm2bl+2+AgLJLDfMc0Rgk0E8CwafVlGkNSIEa2jrBFRY2tZxr5dHjI4NXYJ1BSl49Vy6
 chNXh8bWIusGKFXGeCSOxPhRTfC0FQOeSssodjmRhFw6ZuJKZ2mXORD2jeT5hi0qDFnh
 oyV4QmcBNWJvY4STPmI08IqiWkcXLqNGzrkm7U24CqRxt/ucuuBeDSqJeVkDwEPoForM
 ZhCxnXCK2QTLZbkH8OL2+8qxHL9O5N1zLJXAEMU4ZS5vjfOKggq2k2pD9y4XKySoKnoD
 /BpQ==
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 daniel.thompson@linaro.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, robh+dt@kernel.org, jacek.anaszewski@gmail.com,
 pavel@ucw.cz, linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxMiBTZXAgMjAxOSwgQW5kcmVhcyBLZW1uYWRlIHdyb3RlOgoKPiBQcm92aWRlIERU
IGRvY3VtZW50YXRpb24gZm9yIGVuYWJsZS1ncGlvcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRy
ZWFzIEtlbW5hZGUgPGFuZHJlYXNAa2VtbmFkZS5pbmZvPgo+IEFja2VkLWJ5OiBEYW5pZWwgVGhv
bXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgo+IFJldmlld2VkLWJ5OiBSb2IgSGVy
cmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IFJldmlld2VkLWJ5OiBEYW4gTXVycGh5IDxkbXVycGh5
QHRpLmNvbT4KPiAtLS0KPiBjaGFuZ2VzIGluIHYyOiBhZGRlZCBleGFtcGxlCj4gY2hhbmdlcyBp
biB2MzogYWRkZWQgQWNrZWQtYnkKPiBjaGFuZ2VzIGluIHY0OiBtb3ZlZCBlbmFibGUtZ3Bpb3Mg
dG8gdGhlIHJpZ2h0IHBvc2l0aW9uCj4gICBpbiB0aGUgZXhhbXBsZQo+ICAuLi4vYmluZGluZ3Mv
bGVkcy9iYWNrbGlnaHQvbG0zNjMwYS1iYWNrbGlnaHQueWFtbCAgICAgICAgICAgfCA1ICsrKysr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCkFwcGxpZWQsIHRoYW5rcy4KCi0t
IApMZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxp
bmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGlu
YXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
