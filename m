Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6C9B6733
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 17:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1AEF6F3DB;
	Wed, 18 Sep 2019 15:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034C26F3D0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 15:35:17 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id x82so75822ywd.12
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 08:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WXRR5zyqVQASQ4N9vA9Ov0ItwFdEJLRSuq1ARX/xesM=;
 b=tqDnDB3Yo1OkaCyJ5D/G5bePMHxzZjLVonmbch8h0eFfrx27WGU7UUk37/JTR9MKWz
 RaZfM3/7k2j1fCoRE+C4MMfmuSynk1azW9JQYfrX86eyUoe1H0fHQKrg9gsCyqhw2iiT
 0+Ib7bFJ5yZgW3vB+PNxEUsKWIAm+zqL6Y5UU8EQftM/eeIlm8x3nPQBU885fBb4OlvF
 ArbfhZU0KcswdE24X7RSuaVoKKhPemrA+JuY5VGfcupQdEvi3h8NSS2+Q6uXDoCK/0HC
 hLdtB9G7W/82M9mZk2cMbPR7wPzciC8SrTZCMjWUYCVVxjpFuHf+A9GM+IoY77IQ6B5b
 M+wQ==
X-Gm-Message-State: APjAAAUgs+OMKi/xWliheULXArtboCJE/QKu8Sb2ZIMWwo26SA39p+oL
 LJybH0M5+Z7Uf/pciKEoE49woA==
X-Google-Smtp-Source: APXvYqz1D2kt/w72OnVw3WwBQ3uRSgZrxojXH1V2r/86e2KhMJ6L8LT/IJavDbljbLIdEBUfDjqCbQ==
X-Received: by 2002:a81:a347:: with SMTP id a68mr3744553ywh.427.1568820917136; 
 Wed, 18 Sep 2019 08:35:17 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id i62sm1299104ywi.102.2019.09.18.08.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:35:16 -0700 (PDT)
Date: Wed, 18 Sep 2019 11:35:15 -0400
From: Sean Paul <sean@poorly.run>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v6 2/8] drm/panel: support for BOE tv101wum-nl6 wuxga dsi
 video mode panel
Message-ID: <20190918153515.GS218215@art_vandelay>
References: <20190918122422.17339-1-jitao.shi@mediatek.com>
 <20190918122422.17339-3-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190918122422.17339-3-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WXRR5zyqVQASQ4N9vA9Ov0ItwFdEJLRSuq1ARX/xesM=;
 b=dNLB2bp3hfKDZc3abQIP7Oj8s66zGdtSp4haltezOEd6bKHKjGfSMozAqh6lGbdzjr
 Ij1QeFFZcQRSypfUAksMR/Lw23q0Q055c2yADGVxFSBn7g3+840ox0TbRwukGFMqe8GU
 jLSX6NFkEzBstjyRVOvShg73Ts1xvP9nGSrwSzgp81g8YRJ5+gdnWqTRS5AEZukRyB2a
 Tr342gQGPH2Gb6+Mz0CxM7drrTwr3haV5dqeSkF0U30vLD2nPCGVlhBbJdxNCBx+6R4d
 h0bEKIsWN0WErgB+hX61fDRGmDPfOfNAzKbBgKsSX6CQE3a4pc/R22V54rnEIApO3bAS
 dCwQ==
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
Cc: srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cawa.cheng@mediatek.com,
 linux-mediatek@lists.infradead.org, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgMDg6MjQ6MTZQTSArMDgwMCwgSml0YW8gU2hpIHdyb3Rl
Ogo+IEFkZCBkcml2ZXIgZm9yIEJPRSB0djEwMXd1bS1ubDYgcGFuZWwgaXMgYSAxMC4xIiAxMjAw
eDE5MjAgcGFuZWwuCj4gCj4gU2lnbmVkLW9mZi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVk
aWF0ZWsuY29tPgo+IFJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9LY29uZmlnICAgICAgICAgICAgICAgICB8
ICAgOSArCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9NYWtlZmlsZSAgICAgICAgICAgICAgICB8
ICAgMSArCj4gIC4uLi9ncHUvZHJtL3BhbmVsL3BhbmVsLWJvZS10djEwMXd1bS1ubDYuYyAgICB8
IDcwOSArKysrKysrKysrKysrKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCA3MTkgaW5zZXJ0aW9u
cygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWJv
ZS10djEwMXd1bS1ubDYuYwo+IAovc25pcAoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3BhbmVsL3BhbmVsLWJvZS10djEwMXd1bS1ubDYuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9w
YW5lbC1ib2UtdHYxMDF3dW0tbmw2LmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAw
MDAwMDAwMDAwMC4uZTI3NTI5YjgwZDc4Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9wYW5lbC9wYW5lbC1ib2UtdHYxMDF3dW0tbmw2LmMKCi9zbmlwCgo+ICtzdGF0aWMg
aW50IGJvZV9wYW5lbF9pbml0KHN0cnVjdCBib2VfcGFuZWwgKmJvZSkKPiArewo+ICsJc3RydWN0
IG1pcGlfZHNpX2RldmljZSAqZHNpID0gYm9lLT5kc2k7Cj4gKwlzdHJ1Y3QgZHJtX3BhbmVsICpw
YW5lbCA9ICZib2UtPmJhc2U7Cj4gKwlpbnQgZXJyLCBpOwo+ICsKPiArCWlmIChib2UtPmRlc2Mt
PmluaXRfY21kcykgewo+ICsJCWNvbnN0IHN0cnVjdCBwYW5lbF9pbml0X2NtZCAqaW5pdF9jbWRz
ID0gYm9lLT5kZXNjLT5pbml0X2NtZHM7Cj4gKwo+ICsJCWZvciAoaSA9IDA7IGluaXRfY21kc1tp
XS5sZW4gIT0gMDsgaSsrKSB7Cj4gKwkJCWNvbnN0IHN0cnVjdCBwYW5lbF9pbml0X2NtZCAqY21k
ID0gJmluaXRfY21kc1tpXTsKPiArCj4gKwkJCXN3aXRjaCAoY21kLT50eXBlKSB7Cj4gKwkJCWNh
c2UgREVMQVlfQ01EOgo+ICsJCQkJbXNsZWVwKGNtZC0+ZGF0YVswXSk7Cj4gKwkJCQllcnIgPSAw
Owo+ICsJCQkJYnJlYWs7Cj4gKwo+ICsJCQljYXNlIElOSVRfRENTX0NNRDoKPiArCQkJCWVyciA9
IG1pcGlfZHNpX2Rjc193cml0ZShkc2ksIGNtZC0+ZGF0YVswXSwKPiArCQkJCQkJCSBjbWQtPmxl
biA8PSAxID8gTlVMTCA6Cj4gKwkJCQkJCQkgJmNtZC0+ZGF0YVsxXSwKPiArCQkJCQkJCSBjbWQt
PmxlbiAtIDEpOwo+ICsJCQkJYnJlYWs7Cj4gKwkJCX0KPiArCj4gKwkJCWlmIChlcnIgPCAwKSB7
CgplcnIgcG9zc2libHkgdXNlZCB1bmluaXRpYWxpemVkIGhlcmUuCgo+ICsJCQkJZGV2X2Vycihw
YW5lbC0+ZGV2LAo+ICsJCQkJCSJmYWlsZWQgdG8gd3JpdGUgY29tbWFuZCAldVxuIiwgaSk7Cj4g
KwkJCQlyZXR1cm4gZXJyOwo+ICsJCQl9Cj4gKwkJfQo+ICsJfQo+ICsJcmV0dXJuIDA7Cj4gK30K
L3NuaXAKCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCgotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21p
dW0gT1MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
