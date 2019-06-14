Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B49A0464E4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 18:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F35F89B84;
	Fri, 14 Jun 2019 16:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F9A89B84
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 16:47:06 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id p144so2058938qke.11
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 09:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IOo1pvRWjmacOSCq3ogqjxZuWWdGzC13ArgyKbSDaEM=;
 b=IQ5YS7ea4vUcHViHLIgJm8NWsA5UvdV0r8DVI8osuxZ0YcUQ7W9LegsmBj1e5C03oi
 M7aYQrqWDHuBJVFgFGSbEycGwVfrCqh2bM5GnJ4cbo5HaFUQkeegZro0qP8fwhVFdFAX
 snwAqTNlqK3edMw+tBGvbjv9eQZYXeN23s1UzkjzAaRrh+xdf8XBTyFEppvktOFF68wp
 JT7fZE1/U/jYRWYcwQCr8cn8430ego4/MZYgralUZrCADVY37yxILHwYwjIt1RqSHZye
 iGrg4B9Ex8uq1ihX2Uvh21MYbPFnfX43so/E0JHmBtPwaohp8kZrcKN0uJm5GNyilEi8
 b7OQ==
X-Gm-Message-State: APjAAAWo0fBQNZHsew2+1RDFesYmsuAIw4mjbVJiewtKh8PjX53eEcdW
 yAyiX/ULjCIWjLOQFdN9mw==
X-Google-Smtp-Source: APXvYqwI93cayeCpqkq1zgPJZnyXYH8EbxpzVgERa0diD8d8GwuLWqKf0sVGvoLXazEVSJSYS9lgBg==
X-Received: by 2002:a37:d8e:: with SMTP id 136mr63465224qkn.259.1560530825285; 
 Fri, 14 Jun 2019 09:47:05 -0700 (PDT)
Received: from localhost ([64.188.179.243])
 by smtp.gmail.com with ESMTPSA id j184sm1878283qkc.65.2019.06.14.09.47.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 09:47:04 -0700 (PDT)
Date: Fri, 14 Jun 2019 10:47:02 -0600
From: Rob Herring <robh@kernel.org>
To: Justin Swartz <justin.swartz@risingedge.co.za>
Subject: Re: [PATCH] drm/rockchip: dw_hdmi: add basic rk3228 support
Message-ID: <20190614164702.GA20322@bogus>
References: <20190522224631.25164-1-justin.swartz@risingedge.co.za>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190522224631.25164-1-justin.swartz@risingedge.co.za>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Justin Swartz <justin.swartz@risingedge.co.za>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMiBNYXkgMjAxOSAyMjo0NjoyOSArMDAwMCwgSnVzdGluIFN3YXJ0eiB3cm90ZToK
PiBMaWtlIHRoZSBSSzMzMjgsIFJLMzIyeCBTb0NzIG9mZmVyIGEgU3lub3BzaXMgRGVzaWduV2Fy
ZSBIRE1JIHRyYW5zbWl0dGVyCj4gYW5kIGFuIElubm9zaWxpY29uIEhETUkgUEhZLgo+IAo+IEFk
ZCBhIG5ldyBkd19oZG1pX3BsYXRfZGF0YSBzdHJ1Y3QsIHJrMzIyOF9oZG1pX2Rydl9kYXRhLgo+
IEFzc2lnbiBhIHNldCBvZiBtb3N0bHkgZ2VuZXJpYyByazMyMjhfaGRtaV9waHlfb3BzIGZ1bmN0
aW9ucy4KPiBBZGQgZHdfaGRtaV9yazMyMjhfc2V0dXBfaHBkKCkgdG8gZW5hYmxlIHRoZSBIRE1J
IEhQRCBhbmQgRERDIGxpbmVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1c3RpbiBTd2FydHogPGp1
c3Rpbi5zd2FydHpAcmlzaW5nZWRnZS5jby56YT4KPiAtLS0KPiAgLi4uL2JpbmRpbmdzL2Rpc3Bs
YXkvcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC50eHQgfCAgMSArCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLmMgICAgICAgIHwgNTMgKysrKysrKysrKysrKysr
KysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDU0IGluc2VydGlvbnMoKykKPiAKClJldmlld2Vk
LWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
