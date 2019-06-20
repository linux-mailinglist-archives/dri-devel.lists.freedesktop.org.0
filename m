Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B424D01F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 16:14:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442426E415;
	Thu, 20 Jun 2019 14:14:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796F76E415
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 14:14:53 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id w9so7024494wmd.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 07:14:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q7jwy11egcagMy56Q4RINT2g2musC3c1RDt03S0pqMw=;
 b=LAIy1QFo+rluX0CwMTpCsEY6jWOKJVKbERbfTe2V4UpL+ybGx8+AJ/ZjKXdfEX6Gr1
 TkEkGs3JiBHQVH4elAJ0jCjsjMLKEXOeexPrHLdKtkrfvv+FCD/3frwg/Clyj0v6xNts
 yO5ihgQ3r0waApraryZii94eWP4lIXOiEorL821hjoIE++SHB9GWluBv4c1pS2YncbVe
 ZdjtU4sBTCZaPJbb9GbTqNUroIZqMYa/LjeMzcU7EUeCXgDmngYoLZk94CDpcrqK/Ts6
 FqR6fKR+q6B7MDi1pmpJfsQXg2OZT91SmTQQBw0O7Dj3bIGtqZurP9LAYuePJwoAxNoE
 Jwgg==
X-Gm-Message-State: APjAAAXFqHe5s04pezVQwMM14EgDTzuidnQXWL/zHE+16Q6qxNbhOk9T
 qSl+evxPaoJF7lXu+UB8seVimYcmYrnncA==
X-Google-Smtp-Source: APXvYqxqRzpBmVz3KREIxv39cWfG4a3RC5ziRat7SYUIceIqSEakc4dzRiKMDbxzzUKSp3YUpe4/Zw==
X-Received: by 2002:a1c:b189:: with SMTP id a131mr3171175wmf.7.1561040091892; 
 Thu, 20 Jun 2019 07:14:51 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.googlemail.com with ESMTPSA id w67sm6122260wma.24.2019.06.20.07.14.50
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2019 07:14:51 -0700 (PDT)
Subject: Re: [PATCH v1] backlight: pwm_bl: convert to use SPDX identifier
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20190619135927.29745-1-andriy.shevchenko@linux.intel.com>
From: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <a0644417-0870-6af2-8604-89e08fd2035e@linaro.org>
Date: Thu, 20 Jun 2019 15:14:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190619135927.29745-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=q7jwy11egcagMy56Q4RINT2g2musC3c1RDt03S0pqMw=;
 b=BUFHXEjNT/ht/oD46jTldLitbupFR43nppBZONHwvlp7cGnP3fUkMtUCZHgqRi3sQc
 A0/HPMnKwmhbiiMBmdAoaghUd/x5xsY0zmJu3b9mSANPn5RLLF0gW4nE0PI4GSXYQuDf
 VcXAFQsL5kK5c6RgQnxzMkG4pSSvlWWE7+o32thwh+xbIB0dLtTXny4HcCaT164g1mQ4
 N7P4C3eVGast8z86KNzln9nyx/+oyQpD98c07+e5lIbi1fFzCd+uiCTU9VY0Opbh53KL
 D/KAQ8Au98hHRVLfrP405jzqvmWtgCXhhEQYSLY6pvoZHQcL++FOTtT3pf6RS4g8Y99I
 Cmfg==
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTkvMDYvMjAxOSAxNDo1OSwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+IFJlZHVjZSBzaXpl
IG9mIGR1cGxpY2F0ZWQgY29tbWVudHMgYnkgc3dpdGNoaW5nIHRvIHVzZSBTUERYIGlkZW50aWZp
ZXIuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4gCj4gV2hpbGUgaGVyZSwgY29ycmVjdCBN
T0RVTEVfTElDRU5TRSgpIHN0cmluZyB0byBiZSBhbGlnbmVkIHdpdGggbGljZW5zZSB0ZXh0Lgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGlu
dXguaW50ZWwuY29tPgoKQWNrZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29u
QGxpbmFyby5vcmc+CgoKPiAtLS0KPiAgIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5j
IHwgMTEgKysrLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDgg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3
bV9ibC5jIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMKPiBpbmRleCBmYjQ1Zjg2
NmI5MjMuLjFmN2Y4ZDVjMGJmMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdo
dC9wd21fYmwuYwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jCj4gQEAg
LTEsMTMgKzEsOCBAQAo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ICAg
LyoKPiAtICogbGludXgvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMKPiAtICoKPiAt
ICogc2ltcGxlIFBXTSBiYXNlZCBiYWNrbGlnaHQgY29udHJvbCwgYm9hcmQgY29kZSBoYXMgdG8g
c2V0dXAKPiArICogU2ltcGxlIFBXTSBiYXNlZCBiYWNrbGlnaHQgY29udHJvbCwgYm9hcmQgY29k
ZSBoYXMgdG8gc2V0dXAKPiAgICAqIDEpIHBpbiBjb25maWd1cmF0aW9uIHNvIFBXTSB3YXZlZm9y
bXMgY2FuIG91dHB1dAo+ICAgICogMikgcGxhdGZvcm1fZGF0YSBiZWluZyBjb3JyZWN0bHkgY29u
ZmlndXJlZAo+IC0gKgo+IC0gKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNh
biByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQo+IC0gKiBpdCB1bmRlciB0aGUgdGVybXMg
b2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIHZlcnNpb24gMiBhcwo+IC0gKiBwdWJs
aXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbi4KPiAgICAqLwo+ICAgCj4gICAj
aW5jbHVkZSA8bGludXgvZGVsYXkuaD4KPiBAQCAtNzA4LDUgKzcwMyw1IEBAIHN0YXRpYyBzdHJ1
Y3QgcGxhdGZvcm1fZHJpdmVyIHB3bV9iYWNrbGlnaHRfZHJpdmVyID0gewo+ICAgbW9kdWxlX3Bs
YXRmb3JtX2RyaXZlcihwd21fYmFja2xpZ2h0X2RyaXZlcik7Cj4gICAKPiAgIE1PRFVMRV9ERVND
UklQVElPTigiUFdNIGJhc2VkIEJhY2tsaWdodCBEcml2ZXIiKTsKPiAtTU9EVUxFX0xJQ0VOU0Uo
IkdQTCIpOwo+ICtNT0RVTEVfTElDRU5TRSgiR1BMIHYyIik7Cj4gICBNT0RVTEVfQUxJQVMoInBs
YXRmb3JtOnB3bS1iYWNrbGlnaHQiKTsKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
