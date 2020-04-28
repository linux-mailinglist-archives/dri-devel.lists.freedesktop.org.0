Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BDF1BBAF6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 12:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67106E34E;
	Tue, 28 Apr 2020 10:16:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1406E34E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 10:16:49 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id s10so23995706wrr.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 03:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Abo6l5Xyc1oYnHFvRioVLnD13zq9Rgb+0iUvfQi/YYI=;
 b=HitueB7/d1ualBTxbqUTESD3Pre5U2RmejIrTJWs1PwFw2iixni5EB1XiGxTaVKzLW
 pzKcn3Xj1PpcWFfa69UUG20I2QY9Hjx4EEOen2McVt74aVnKRV6y2A0PJtcfThHgcPw5
 oK6Al4D10wsEfr0T359Dyrbk2al7twmFMRjrMNXMJcGQvJbLjAnMv6uHJz+BmYR6Pd6Z
 cw5FibGDqmisikZM7Sa0cp3m2ug0YbjwqI5aKgxne7aMs3sRr2uS32gXNW8CShZwtewk
 ywABwowwP1RHJG7qay7Ymbnpc366x/+6HlMNcSPoqhESq0Z9ZEshf2vZWRjIeho4tRRk
 mThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Abo6l5Xyc1oYnHFvRioVLnD13zq9Rgb+0iUvfQi/YYI=;
 b=ZzT047Vri1IdGyG9ZWOPduTT4gqsoK42B2WbtoPLDbtnbyh0woLsNCrYWQuh2FnpSO
 O2aX8CDLNaXPWI61hEEW9mlrsfmv6bnFvhG3cn86Urn+QmA6TvawTO6NSSwDjnNeg1fR
 zfNQPgqAO9W+MlmwK6qthXswPM32Z43rFiop4Kin+DiVw4V1p2QpMWE+BJWsmd4CXH8i
 jYUbaamtRKdWe8RfP61X94IZjiU9ZBoXTxWeFVwF15ynqscLOroPKrSRzJuVfXh/uumS
 90j/md538sdzVSdF9KiBTxQn4VJv1UOwwPiuDNr3xyqNQXR5/2gWge/O7B097/Xmx+m7
 XPRA==
X-Gm-Message-State: AGi0PuYJMfHVgDMYpFTWCSG0+hB2SNl0Kksl589xf/AayShoraWzHO4G
 QOL27q9jLv++aAT/kE9Cr+JoGA==
X-Google-Smtp-Source: APiQypLQ81+f0z7kO0fvBLeVPbuFSG2xYOUnKUA0JEXxXIUa3nlA/ckSrylVIOYt6X2eEAcUV7sWRw==
X-Received: by 2002:adf:f9c6:: with SMTP id w6mr32720438wrr.341.1588069008454; 
 Tue, 28 Apr 2020 03:16:48 -0700 (PDT)
Received: from dell ([2.31.163.63])
 by smtp.gmail.com with ESMTPSA id f23sm2638156wml.4.2020.04.28.03.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 03:16:47 -0700 (PDT)
Date: Tue, 28 Apr 2020 11:16:46 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V6 1/4] backlight: qcom-wled: convert the wled bindings
 to .yaml format
Message-ID: <20200428101646.GN3559@dell>
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
cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L3Fjb20td2xlZC55YW1sCgpOZWVkcyBhIERUIEFj
ay4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBM
ZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xs
b3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
