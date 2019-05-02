Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 105F61173F
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 12:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB0889363;
	Thu,  2 May 2019 10:34:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC7C89363
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 10:34:00 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id q15so2066057wmf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 03:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B1jC9QCqUfkDL1SR0ZI20RcPCXgiumxHzfhWMgZGV58=;
 b=oiwvzt8d+xsZ2RMJZpH52r9fX+DLJV6oWPxaek/uSWT6/i0Je4WT17zJT1w/JP4/8j
 klC+EOBA9C0t5PNzP2hX1yMML64KlbvRx82nVoBZe5MRKJ1XkWw6vqt1wt82rrICiqUK
 x11TmLq+5TRfcwXaQBKB05bFxuFc8b/WJT5KzEzD/fpWLl5aiRCyOmq/0xl/+qqhjmZp
 uR6TwuSd1Ro/l0pz0ZJn8z+6zNMHZqXbphMn7NilKxIJq6FSVlkL5gasoRsJqJf6SYru
 EsP3JKAM/m2JX/gMnPKBnBdzC+fCTBeYDql/g/e1ZRpEoOLe85jUHI0b2xQ5oROqLRtP
 MrXQ==
X-Gm-Message-State: APjAAAXm2RZW6F/RQOS3w6Ji4f7lTmgcMr/J50EyHjE/oBPHkCZpca98
 DMFCq/7TnL5LWwi85Qaj+yULnA==
X-Google-Smtp-Source: APXvYqxU8YkY2OjY8+NsbU0iZusUsjbYPnZHso7AF7gBRcCMyf606BDRfv8SzaXmta8W20LOjHsxLw==
X-Received: by 2002:a7b:c745:: with SMTP id w5mr1726394wmk.89.1556793238968;
 Thu, 02 May 2019 03:33:58 -0700 (PDT)
Received: from holly.lan (static-84-9-17-116.vodafonexdsl.co.uk. [84.9.17.116])
 by smtp.googlemail.com with ESMTPSA id u11sm9574210wrg.35.2019.05.02.03.33.57
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 03:33:57 -0700 (PDT)
Subject: Re: [PATCH] backlight: rave-sp: don't touch initial state and
 register with correct device
To: Lucas Stach <l.stach@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
References: <20190429152919.27277-1-l.stach@pengutronix.de>
From: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <c23ecabd-c2ee-8c23-9ee3-13290bc4da35@linaro.org>
Date: Thu, 2 May 2019 11:33:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429152919.27277-1-l.stach@pengutronix.de>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B1jC9QCqUfkDL1SR0ZI20RcPCXgiumxHzfhWMgZGV58=;
 b=rEIboDpeVegqAH1F/tFG7zEcQa9Wi0zeu8rbhUOeBPsAIc4OQJBn+WG/7QUMrmfmUZ
 tqffiH3GJY0urQn6b0YplS4e23b5Cij4AydhI4hh/fcwJ1WYkFOg2pZr4Kr1tHFacg5p
 F+jAsKPFwIElXU/V/jA01QDMjSUDKXBD2ZRwrZJUxkdp0Seu8fgHHS2kzzbO1ueT7sk3
 SoUgiKSjn8fgDXXQh8rVWJHgV/JkT/FFrXWM4zUXydfDjrivM8Ukgt05Sv+qchRQNVug
 2VK79JIETEInn/cdFF2dBv7W6JmC+pctP2xa8QOB8zJpKC4WH4cdHwDXkpG2Tc+JZ3my
 N/5Q==
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
Cc: linux-fbdev@vger.kernel.org, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjkvMDQvMjAxOSAxNjoyOSwgTHVjYXMgU3RhY2ggd3JvdGU6Cj4gVGhpcyB3YXkgdGhlIGJh
Y2tsaWdodCBjYW4gYmUgcmVmZXJlbmNlZCB0aHJvdWdoIGl0cyBkZXZpY2Ugbm9kZSBhbmQKPiBl
bmFibGluZy9kaXNhYmxpbmcgY2FuIGJlIG1hbmFnZWQgdGhyb3VnaCB0aGUgcGFuZWwgZHJpdmVy
LgoKSXMgaXQgcG9zc2libGUgdG8gaW1wbGVtZW50IHNvbWV0aGluZyBzaW1pbGFyIHRvIApwd21f
YmFja2xpZ2h0X2luaXRpYWxfcG93ZXJfc3RhdGUoKSB0byBoYW5kbGUgdGhpcz8KCmJhY2tsaWdo
dCBkcml2ZXJzIGFscmVhZHkgc3VmZmVyIGZyb20gdG9vIG11Y2ggZGl2ZXJzaXR5IHNvIEkgcHJl
ZmVyIAp0aGluZ3MgbGlrZSB0aGlzIHRvIGFsaWduIGJlaGF2aW91ciB3aXRoIHRoZSAoZmFpcmx5
IGhlYXZpbHlseSB1c2VkKSBQV00gCmRyaXZlciBpZiBwb3NzaWJsZS4KCgpEYW5pZWwuCgoKPiBT
aWduZWQtb2ZmLWJ5OiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KPiAtLS0K
PiAgIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3JhdmUtc3AtYmFja2xpZ2h0LmMgfCA0ICstLS0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcmF2ZS1zcC1iYWNrbGlnaHQuYyBi
L2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3JhdmUtc3AtYmFja2xpZ2h0LmMKPiBpbmRleCA0NjJm
MTRhMWIxOWQuLmQyOTZiZmNmNDM5NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2ts
aWdodC9yYXZlLXNwLWJhY2tsaWdodC5jCj4gKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQv
cmF2ZS1zcC1iYWNrbGlnaHQuYwo+IEBAIC00OCwxNSArNDgsMTMgQEAgc3RhdGljIGludCByYXZl
X3NwX2JhY2tsaWdodF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgCXN0
cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4gICAJc3RydWN0IGJhY2tsaWdodF9kZXZp
Y2UgKmJkOwo+ICAgCj4gLQliZCA9IGRldm1fYmFja2xpZ2h0X2RldmljZV9yZWdpc3RlcihkZXYs
IHBkZXYtPm5hbWUsIGRldi0+cGFyZW50LAo+ICsJYmQgPSBkZXZtX2JhY2tsaWdodF9kZXZpY2Vf
cmVnaXN0ZXIoZGV2LCBwZGV2LT5uYW1lLCBkZXYsCj4gICAJCQkJCSAgICBkZXZfZ2V0X2RydmRh
dGEoZGV2LT5wYXJlbnQpLAo+ICAgCQkJCQkgICAgJnJhdmVfc3BfYmFja2xpZ2h0X29wcywKPiAg
IAkJCQkJICAgICZyYXZlX3NwX2JhY2tsaWdodF9wcm9wcyk7Cj4gICAJaWYgKElTX0VSUihiZCkp
Cj4gICAJCXJldHVybiBQVFJfRVJSKGJkKTsKPiAgIAo+IC0JYmFja2xpZ2h0X3VwZGF0ZV9zdGF0
dXMoYmQpOwo+IC0KPiAgIAlyZXR1cm4gMDsKPiAgIH0KPiAgIAo+IAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
