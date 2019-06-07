Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 315E8385CF
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE38A89C88;
	Fri,  7 Jun 2019 07:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F1189C88
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 07:57:32 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id p26so1733249edr.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 00:57:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=1Y0dqNgN5GRlPumwnSwim+P7xV+jz6U0uadHjVytHrk=;
 b=aFMMKKJeUGNYQkRDq4kn30ccbf1dB2pdzhwwXe0F3ynE3i3/uULqmdB8c9Ci6Fr4WG
 qEC7uMbTIWO82vLhHn2EnR97/clC/foLOqwz/kBCEZMbroXbZk0b9PPXkGkwBDKzZ35r
 bv79G31+hK6DUdlw5Wv4C6qDIBP9Lm6CeDgawJSy/uLSeOE3nrE04MH/cbddRukiweuR
 K+im7yLVZeeLMPO9w7ucX/ArKu9OZLwSXYNyv+uPLw7ajJiG9F/XimGucB4+KYVKpOgt
 P/6sRnY283QVcc7rkY4BK/ZvsC91BOzo8BHi85cAD7YNv1i8K8YsUIrb9ZrwlhKKWSYh
 wd4w==
X-Gm-Message-State: APjAAAWYfH9P2NLhVcB/gazmgqdZtYQ1wTfO+zClzrnc5PNYb85NP+jl
 7O1qEglqRL46fmyNrbZeqaTdOw==
X-Google-Smtp-Source: APXvYqxb9k77uDmPH+x6SZW7m5DzVGO6PSl0oSp7JXNVVPERM605KEjklDJiu0Eyo4Ib14+dHcCJGA==
X-Received: by 2002:a17:906:4f8f:: with SMTP id
 o15mr45250693eju.129.1559894251343; 
 Fri, 07 Jun 2019 00:57:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id f3sm241948ejc.15.2019.06.07.00.57.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 07 Jun 2019 00:57:30 -0700 (PDT)
Date: Fri, 7 Jun 2019 09:57:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH 3/8] drivers: (video|gpu): fix warning same module names
Message-ID: <20190607075728.GE21222@phenom.ffwll.local>
Mail-Followup-To: Anders Roxell <anders.roxell@linaro.org>, marex@denx.de,
 stefan@agner.ch, airlied@linux.ie, shawnguo@kernel.org,
 s.hauer@pengutronix.de, b.zolnierkie@samsung.com, andrew@lunn.ch,
 vivien.didelot@gmail.com, f.fainelli@gmail.com, a.hajda@samsung.com,
 mchehab@kernel.org, p.zabel@pengutronix.de, hkallweit1@gmail.com,
 lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20190606094712.23715-1-anders.roxell@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606094712.23715-1-anders.roxell@linaro.org>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=1Y0dqNgN5GRlPumwnSwim+P7xV+jz6U0uadHjVytHrk=;
 b=KW+UbysjArNVACv4q6+549r7+cTv3EkG+0hIgp5Gzs8ersC7PVJ/arg0EbqcKW/BDT
 7m/td0oX1nSkgEGBxV+/rFF94cYaaujJuBaZbnkb6j43aX9EoDSuUh2jbUn90a72Q1m6
 wWSpptOZ5QJhMjkYz1VNG/I1tEoevoc3dgNZE=
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
Cc: andrew@lunn.ch, linux-fbdev@vger.kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, lee.jones@linaro.org, marex@denx.de,
 f.fainelli@gmail.com, vivien.didelot@gmail.com, linux-media@vger.kernel.org,
 b.zolnierkie@samsung.com, broonie@kernel.org, dri-devel@lists.freedesktop.org,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, lgirdwood@gmail.com, shawnguo@kernel.org,
 davem@davemloft.net, hkallweit1@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMDYsIDIwMTkgYXQgMTE6NDc6MTJBTSArMDIwMCwgQW5kZXJzIFJveGVsbCB3
cm90ZToKPiBXaGVuIGJ1aWxkaW5nIHdpdGggQ09ORklHX0RSTV9NWFNGQiBhbmQgQ09ORklHX0ZC
X01YUyBlbmFibGVkIGFzCj4gbG9hZGFibGUgbW9kdWxlcywgd2Ugc2VlIHRoZSBmb2xsb3dpbmcg
d2FybmluZzoKPiAKPiB3YXJuaW5nOiBzYW1lIG1vZHVsZSBuYW1lcyBmb3VuZDoKPiAgIGRyaXZl
cnMvdmlkZW8vZmJkZXYvbXhzZmIua28KPiAgIGRyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYi5r
bwo+IAo+IFJld29yayBzbyB0aGUgbmFtZXMgbWF0Y2hlcyB0aGUgY29uZmlnIGZyYWdtZW50Lgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEFuZGVycyBSb3hlbGwgPGFuZGVycy5yb3hlbGxAbGluYXJvLm9y
Zz4KClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoK
SSdtIGFzc3VtaW5nIEJhcnQgd2lsbCBwaWNrIHRoaXMgb25lIHVwIGZvciBmYmRldi4KLURhbmll
bAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL214c2ZiL01ha2VmaWxlIHwgNCArKy0tCj4gIGRy
aXZlcnMvdmlkZW8vZmJkZXYvTWFrZWZpbGUgICB8IDMgKystCj4gIDIgZmlsZXMgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbXhzZmIvTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvTWFrZWZpbGUK
PiBpbmRleCBmZjZlMzU4MDg4ZmEuLjVkNDlkNzU0OGU2NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbXhzZmIvTWFrZWZpbGUKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvTWFr
ZWZpbGUKPiBAQCAtMSwzICsxLDMgQEAKPiAgIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vbmx5Cj4gLW14c2ZiLXkgOj0gbXhzZmJfZHJ2Lm8gbXhzZmJfY3J0Yy5vIG14c2ZiX291
dC5vCj4gLW9iai0kKENPTkZJR19EUk1fTVhTRkIpCSs9IG14c2ZiLm8KPiArZHJtLW14c2ZiLXkg
Oj0gbXhzZmJfZHJ2Lm8gbXhzZmJfY3J0Yy5vIG14c2ZiX291dC5vCj4gK29iai0kKENPTkZJR19E
Uk1fTVhTRkIpCSs9IGRybS1teHNmYi5vCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvTWFrZWZpbGUgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L01ha2VmaWxlCj4gaW5kZXggNjU1ZjI1
MzdjYWMxLi43ZWU5Njc1MjVhZjIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9N
YWtlZmlsZQo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvTWFrZWZpbGUKPiBAQCAtMTMxLDcg
KzEzMSw4IEBAIG9iai0kKENPTkZJR19GQl9WR0ExNikgICAgICAgICAgICArPSB2Z2ExNmZiLm8K
PiAgb2JqLSQoQ09ORklHX0ZCX09GKSAgICAgICAgICAgICAgICs9IG9mZmIubwo+ICBvYmotJChD
T05GSUdfRkJfTVgzKQkJICArPSBteDNmYi5vCj4gIG9iai0kKENPTkZJR19GQl9EQThYWCkJCSAg
Kz0gZGE4eHgtZmIubwo+IC1vYmotJChDT05GSUdfRkJfTVhTKQkJICArPSBteHNmYi5vCj4gK29i
ai0kKENPTkZJR19GQl9NWFMpCQkgICs9IGZiLW14cy5vCj4gK2ZiLW14cy1vYmpzCQkJICA6PSBt
eHNmYi5vCj4gIG9iai0kKENPTkZJR19GQl9TU0QxMzA3KQkgICs9IHNzZDEzMDdmYi5vCj4gIG9i
ai0kKENPTkZJR19GQl9TSU1QTEUpICAgICAgICAgICArPSBzaW1wbGVmYi5vCj4gIAo+IC0tIAo+
IDIuMjAuMQo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENv
cnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
