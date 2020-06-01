Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 902131EA028
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 10:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5CF89FA5;
	Mon,  1 Jun 2020 08:33:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8323789E3B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 08:33:21 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id z13so7066911ljn.7
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jun 2020 01:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l6EWP19aRaD+4jQ4w5XaCMBbBuo29gOghE8kK7mZeLA=;
 b=e7cVNHhEF5oLVK6Z/774yExJ1p50RNQ+Ohpx19HwJYJ1j7M6C18K9YQ1uUP59geDXT
 A/dvTH6r93r1BYWbaL0obD+CYgR3rbGq37RYV5A0kqtOEEaeVCUk6QKfOva+4DcD2UMW
 kiXBzRuEnFIQ/BxO6mSM3tflpnxzMxxsvjtk+q8qjmN4GB50WFkeBU75qPzZ8jcvdxv7
 9kfxIC7eo78GP1R2CROPFycXwz+tWNXPsGT49reA2F5C9dhIPYKfxsq+LQFmuXDFxXOj
 njGC8gOEaAheCl7ApW8OMl5Ma5bScgS4LtSobCvZyaQ1KhKxT2pegaBlofyoappEXr+x
 X9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=l6EWP19aRaD+4jQ4w5XaCMBbBuo29gOghE8kK7mZeLA=;
 b=gRlh8w3nCwWmSqS5Y+n3CHXOz5ZYodu8yhA8B3otuvXm4qG3wYTEOuwGFoXlywBWfN
 eijlWMdEQr5y4UWwzutSLVLmrXEFcqNLGzd9ZKwjWCJ5FTu0X90u7y60eLNYn2if7Cjk
 d2MkH2r+rbBKzkxVFKMWg7Kqikybk9+h87J/chl09UjRt5DwJdhd4hE2/+nGKUL+fqTS
 FnjhMAfSzqZw6WKchPxO5eISCzXQhk3S1omA9MxBAQ1nCm6yZ0nhFxK8rwVsSz4pLMxg
 WisNjTRz9atWveWSxl+wVysB8HcOjBH+LsnZ6uM5gMz7OtX/QWqLVxc+e9XRbDdNSY5e
 C07g==
X-Gm-Message-State: AOAM530apYTuBAH3UdrZpyCz5pI5S3fijH8wXETlT7lNhojAVt1la4T6
 mU/khJdBKTra+r0dgXxIteH4bwTG8po=
X-Google-Smtp-Source: ABdhPJxcTe5+uWSaOKBKacGkZollxrVMlCckDg8YCCT9b6X/XEaFwDSZdSev/8FfZVetIHzyFraDUg==
X-Received: by 2002:a2e:140a:: with SMTP id u10mr4691553ljd.56.1591000399727; 
 Mon, 01 Jun 2020 01:33:19 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:281d:a604:434c:a58d])
 by smtp.gmail.com with ESMTPSA id f14sm3871433ljp.118.2020.06.01.01.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 01:33:19 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 5/6] dt-bindings: panel: add LOGIC Technologies panels
Date: Mon,  1 Jun 2020 10:33:08 +0200
Message-Id: <20200601083309.712606-6-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601083309.712606-1-sam@ravnborg.org>
References: <20200601083309.712606-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?S=C3=B8ren=20Andersen?= <san@skov.dk>,
 Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHN1cHBvcnQgZm9yIHRoZSBmb2xsb3dpbmcgcGFuZWxzIGZyb20gTE9HSUMgVGVjaG5vbG9n
aWVzLCBJbmM6Ci0gTFRURDgwMDQ4MDA3MC1MMlJUCi0gTFRURDgwMDQ4MDA3MC1MNldILVJUCgpU
aGUgTFRURDgwMDQ4MCBMMlJUIGlzIGRpc2NvbnRpbnVlZCwgYnV0IGl0IG1heSBiZSB1c2VkIGlu
CmV4aXN0aW5nIHByb2R1Y3RzLgoKQm90aCBwYW5lbHMgYXJlIGR1bWIgcGFuZWxzIHRoYXQgbWF0
Y2hlcyB0aGUgcGFuZWwtc2ltcGxlIGJpbmRpbmcuCgpTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJv
cmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBTw7hyZW4gQW5kZXJzZW4gPHNhbkBza292LmRrPgpD
YzogVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KQ2M6IFNhbSBSYXZu
Ym9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3BhbmVsL3BhbmVsLXNpbXBsZS55YW1sICAgICAgIHwgNCArKysrCiAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtc2ltcGxlLnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1zaW1wbGUueWFtbAppbmRl
eCA2ZmUwYWM4NjY5NmQuLmE0OTEwZDRhZjk2YiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtc2ltcGxlLnlhbWwKKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtc2lt
cGxlLnlhbWwKQEAgLTE4Myw2ICsxODMsMTAgQEAgcHJvcGVydGllczoKICAgICAgIC0gbG9naWN0
ZWNobm8sbHQxNjEwMTAtMm5ocgogICAgICAgICAjIExvZ2ljIFRlY2hub2xvZ2llcyBMVDE3MDQx
MC0yV0hDIDEwLjEiIDEyODB4ODAwIElQUyBURlQgQ2FwIFRvdWNoIE1vZC4KICAgICAgIC0gbG9n
aWN0ZWNobm8sbHQxNzA0MTAtMndoYworICAgICAgICAjIExPR0lDIFRlY2hub2xvZ2llcyBJbmMu
IExUVEQ4MDA0ODAwNzAtTDJSVCA3IiAoODAweDQ4MCkgVEZUIExDRCBwYW5lbAorICAgICAgLSBs
b2dpY3RlY2hubyxsdHRkODAwNDgwMDcwLWwycnQKKyAgICAgICAgIyBMT0dJQyBUZWNobm9sb2dp
ZXMgSW5jLiBMVFREODAwNDgwMDcwLUw2V0gtUlQgNyIgKDgwMHg0ODApIFRGVCBMQ0QgcGFuZWwK
KyAgICAgIC0gbG9naWN0ZWNobm8sbHR0ZDgwMDQ4MDA3MC1sNndoLXJ0CiAgICAgICAgICMgTWl0
c3ViaXNoaSAiQUEwNzBNQzAxIDcuMCIgV1ZHQSBURlQgTENEIHBhbmVsCiAgICAgICAtIG1pdHN1
YmlzaGksYWEwNzBtYzAxLWNhMQogICAgICAgICAjIE5FQyBMQ0QgVGVjaG5vbG9naWVzLCBMdGQu
IDEyLjEiIFdYR0EgKDEyODB4ODAwKSBMVkRTIFRGVCBMQ0QgcGFuZWwKLS0gCjIuMjUuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
