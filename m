Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEFE1B0FD8
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 17:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872CD6E5B9;
	Mon, 20 Apr 2020 15:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D686E5B9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 15:21:19 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id x25so11521501wmc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 08:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=G/xNrmOfxlip1kYuKwMzJ0K+Zw7TpTWKwNC8FLYeOVE=;
 b=scR/lsr/ImzL3Xwqj5p4gcDJy46jbSvEA+k6tsVX8NbGfGf7kL1pwUz5qgUfnMOmK4
 sVlmO/s7PPlbf045xBeI1d/TB9SeihN6OvnYW0eiNx3MGrmW9uumiPeDiX6+6UUpteu1
 XEO/hQIdGxWtJj0d6atjm/Hkys8CjOMLEh0PCdoz2UjdPdUJUdwngqqFLLw1KC68Frxo
 LlY8SA26MGHXf/KuAj7nnNMtCBoaeEKmOSswZoSHWS4TJzKnGh2E1h4tHo5lwsLl9Smg
 ojJk8H0rzWjHcg61LBoGR5ubxZUn+3WUhLcU+JUSZAUK37ej3wOTunBF0T/dEsPJZ+AI
 evkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=G/xNrmOfxlip1kYuKwMzJ0K+Zw7TpTWKwNC8FLYeOVE=;
 b=jvc//P+K9eW87dyrr798En9kX7NtMow4LdwgMLe3tWsis1PGPJk6HZiv6W5KKH82m7
 sttpv5yzrV1lB5jhGHnZAlHrSH5sLmNxdChyL7CMjQhAKl3J26LeXOks+Seo+X/YBX/+
 wDVLG898XQej1cKxrZd0ixrqJp9rrb7oXKSSha5XIQRKdhgMp8jlmXQ9xMzMSaCS11se
 buialAPuviO/wH440gXtv90OJkB8Ku9yWYltANT/Lw6VsP6PDTnpupmwwIZbrZm8u6GT
 HIAhxEnRHMPGVGrj6KqWjpPFpDPCR66ra8/Oc2/4/YZgbQmPnUogaldy43UxWSI+hx7Z
 Canw==
X-Gm-Message-State: AGi0PuadalQ7b0vVu8RbJAcDK7jxgAlJ+1auQ8BridCoarQEr7UfMMBO
 eF0qsf4XYey7ZGlkjnXMEI3hsg==
X-Google-Smtp-Source: APiQypK1bWqXkN8H3kmS+x+OEHJtMNHLIBzrzFR184iWS16f3+5krcSMVxzHcjyGzFeVUFyZmgYmzA==
X-Received: by 2002:a1c:96c6:: with SMTP id
 y189mr19216914wmd.106.1587396076953; 
 Mon, 20 Apr 2020 08:21:16 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id e21sm1684652wrc.1.2020.04.20.08.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 08:21:16 -0700 (PDT)
Date: Mon, 20 Apr 2020 16:21:14 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Yan <yanaijie@huawei.com>
Subject: Re: [PATCH] backlight: qcom-wled: remove 'wled4_string_cfg' and
 'wled3_string_cfg'
Message-ID: <20200420152114.b7licril3r6itd45@holly.lan>
References: <20200417092335.14163-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200417092335.14163-1-yanaijie@huawei.com>
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
Cc: linux-fbdev@vger.kernel.org, kgunda@codeaurora.org,
 b.zolnierkie@samsung.com, jingoohan1@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 Hulk Robot <hulkci@huawei.com>, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, lee.jones@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBcHIgMTcsIDIwMjAgYXQgMDU6MjM6MzVQTSArMDgwMCwgSmFzb24gWWFuIHdyb3Rl
Ogo+IEZpeCB0aGUgZm9sbG93aW5nIGdjYyB3YXJuaW5nOgo+IAo+IGRyaXZlcnMvdmlkZW8vYmFj
a2xpZ2h0L3Fjb20td2xlZC5jOjkzOTozNDogd2FybmluZzog4oCYd2xlZDRfc3RyaW5nX2NmZ+KA
mQo+IGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCj4gIHN0
YXRpYyBjb25zdCBzdHJ1Y3Qgd2xlZF92YXJfY2ZnIHdsZWQ0X3N0cmluZ19jZmcgPSB7Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn4KPiBkcml2ZXJz
L3ZpZGVvL2JhY2tsaWdodC9xY29tLXdsZWQuYzo5MzU6MzQ6IHdhcm5pbmc6IOKAmHdsZWQzX3N0
cmluZ19jZmfigJkKPiBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFi
bGU9XQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHdsZWRfdmFyX2NmZyB3bGVkM19zdHJpbmdfY2Zn
ID0gewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+
Cj4gCj4gUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IEphc29uIFlhbiA8eWFuYWlqaWVAaHVhd2VpLmNvbT4KClJldmlld2VkLWJ5OiBE
YW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgoKCj4gLS0tCj4gIGRy
aXZlcnMvdmlkZW8vYmFja2xpZ2h0L3Fjb20td2xlZC5jIHwgOCAtLS0tLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgOCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9i
YWNrbGlnaHQvcWNvbS13bGVkLmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9xY29tLXdsZWQu
Ywo+IGluZGV4IDNkMjc2YjMwYTc4Yy4uZGY1M2ZiZDVjZDAzIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvdmlkZW8vYmFja2xpZ2h0L3Fjb20td2xlZC5jCj4gKysrIGIvZHJpdmVycy92aWRlby9iYWNr
bGlnaHQvcWNvbS13bGVkLmMKPiBAQCAtOTMyLDE0ICs5MzIsNiBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHdsZWRfdmFyX2NmZyB3bGVkNF9zdHJpbmdfaV9saW1pdF9jZmcgPSB7Cj4gIAkuc2l6ZSA9
IEFSUkFZX1NJWkUod2xlZDRfc3RyaW5nX2lfbGltaXRfdmFsdWVzKSwKPiAgfTsKPiAgCj4gLXN0
YXRpYyBjb25zdCBzdHJ1Y3Qgd2xlZF92YXJfY2ZnIHdsZWQzX3N0cmluZ19jZmcgPSB7Cj4gLQku
c2l6ZSA9IDgsCj4gLX07Cj4gLQo+IC1zdGF0aWMgY29uc3Qgc3RydWN0IHdsZWRfdmFyX2NmZyB3
bGVkNF9zdHJpbmdfY2ZnID0gewo+IC0JLnNpemUgPSAxNiwKPiAtfTsKPiAtCj4gIHN0YXRpYyB1
MzIgd2xlZF92YWx1ZXMoY29uc3Qgc3RydWN0IHdsZWRfdmFyX2NmZyAqY2ZnLCB1MzIgaWR4KQo+
ICB7Cj4gIAlpZiAoaWR4ID49IGNmZy0+c2l6ZSkKPiAtLSAKPiAyLjIxLjEKPiAKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
