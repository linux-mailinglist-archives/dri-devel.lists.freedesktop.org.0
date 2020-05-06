Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E501C6DFF
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 12:08:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA776E845;
	Wed,  6 May 2020 10:08:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15176E845
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 10:07:59 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k1so1487830wrx.4
 for <dri-devel@lists.freedesktop.org>; Wed, 06 May 2020 03:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=eh6CjI5qlJbfI0/vhnP4eL4p9yTZrlT7LtScBoT0wAA=;
 b=eF9rRF3kORznrWQ6Ryu3DYtV+uP9iro81Ds3jDSv9PZLgiljc8BeSRWDmWt0EHcu1v
 yc+OcrRTIVK4KIEKG2ikX9qJ8Ghwpv37guMlIDqPMIcxKbAhnIJcMNAhv9kJlNRvZg8w
 ykbxXQtCjh3XePczObskArBb5wqVbvEHrUG0+/SvqwTj6TCpkTovV4JUcDamaefrtQtY
 x4HuBqf7vxVZ800ryyJamkeyn2bNyQmHLUk6N3TcgjgX7pvosP8KzVB7qmbCZ1q3Tu6M
 /ZDNTK1t9ymxM0/a3RWi4RgJxJAv8Sh5+CWOiB44foLpnAMliiporE/qh/wlrfCK0qzO
 1PwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=eh6CjI5qlJbfI0/vhnP4eL4p9yTZrlT7LtScBoT0wAA=;
 b=dwCLP10RuxWT8vzELrp3PR7bdfC1PQAOyQKPpxDdVmNW7A3tsGtTJ3zmLRi4MttQig
 t9nN6hrtXwSfV02RuZuZfsMVlbmAhO2G9dLW6qD2en/5wEWqwBAr2mRNGaHa9dWVulXF
 VjWtvPMDTutKN5ej5h4/dXlBqDP3zjJ7xvhH75pfoim0tVkNsOcXjGtkfc3PF9kvKnXF
 2dVVlXCvQzbtxkmD2qR2qperpO6rklfPxceG/leierlYA+LmxUrvEDfU9OAC+MRsuBOa
 n1dG7oXWkEvfQFdHcbXqIqtgFEKBidyi9uawEWO95NZaX9PuFbu08o4jp5Ce0TdTbkeg
 5ijQ==
X-Gm-Message-State: AGi0PuZRBGjERCSHYaruMwbSKDh0gCdZEM0dkjcZ2VnfBUSD2TItjZMp
 ivOlWB7xM9FriYlwr73q8fgceA==
X-Google-Smtp-Source: APiQypKuj4JYfxO8nKTrw9i4Yi3jaNONI0rOK9zdGpxB6OGfTP8PMtsRVxoevWRNas/XupOIzfnd5A==
X-Received: by 2002:adf:f207:: with SMTP id p7mr8527397wro.20.1588759678524;
 Wed, 06 May 2020 03:07:58 -0700 (PDT)
Received: from dell ([2.31.163.63])
 by smtp.gmail.com with ESMTPSA id x5sm1820447wro.12.2020.05.06.03.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 03:07:57 -0700 (PDT)
Date: Wed, 6 May 2020 11:07:48 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V6 1/4] backlight: qcom-wled: convert the wled bindings
 to .yaml format
Message-ID: <20200506100748.GD823950@dell>
References: <1587656017-27911-1-git-send-email-kgunda@codeaurora.org>
 <1587656017-27911-2-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1587656017-27911-2-git-send-email-kgunda@codeaurora.org>
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, b.zolnierkie@samsung.com,
 jingoohan1@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org, jacek.anaszewski@gmail.com,
 pavel@ucw.cz, linux-arm-msm@vger.kernel.org,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
 linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMyBBcHIgMjAyMCwgS2lyYW4gR3VuZGEgd3JvdGU6Cgo+IENvbnZlcnQgdGhlIHFj
b20td2xlZCBiaW5kaW5ncyBmcm9tIC50eHQgdG8gLnlhbWwgZm9ybWF0Lgo+IEFsc28gcmVwbGFj
ZSBQTTg5NDEgdG8gV0xFRDMgYW5kIFBNSTg5OTggdG8gV0xFRDQuCj4gCj4gU2lnbmVkLW9mZi1i
eTogS2lyYW4gR3VuZGEgPGtndW5kYUBjb2RlYXVyb3JhLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBT
dWJiYXJhbWFuIE5hcmF5YW5hbXVydGh5IDxzdWJiYXJhbUBjb2RlYXVyb3JhLm9yZz4KPiBBY2tl
ZC1ieTogRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4KPiAtLS0K
PiAgLi4uL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L3Fjb20td2xlZC50eHQgICAgICAgICAgfCAx
NTQgLS0tLS0tLS0tLS0tLS0tCj4gIC4uLi9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9xY29tLXds
ZWQueWFtbCAgICAgICAgIHwgMjA4ICsrKysrKysrKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNo
YW5nZWQsIDIwOCBpbnNlcnRpb25zKCspLCAxNTQgZGVsZXRpb25zKC0pCj4gIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQv
cWNvbS13bGVkLnR4dAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L3Fjb20td2xlZC55YW1sCgpBcHBsaWVkLCB0aGFu
a3MuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNobmljYWwg
TGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9s
bG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
