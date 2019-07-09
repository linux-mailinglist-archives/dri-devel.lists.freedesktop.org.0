Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1D562DC0
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 03:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78E289D40;
	Tue,  9 Jul 2019 01:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 153D189D40
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 01:57:45 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id o9so24157167iom.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 18:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZP1aQ1FRsdW6CYNzwwPiQpzEbHZzUvAyhoX9YSSaQ8E=;
 b=ZTpm9t8ysR0xhh8cTbgOKzXg02koznT/6Ax9OGFArfLsKKgdXgV9u5dCoeA6OO4qmC
 knrQGp90CpiBDSH4HK0j1Jk16fvZl7N6XsgDwS0pHYPNjp03AQha/yAvfqfutnuKXG2v
 0SbZqP9MUHKiYf160K/NS45Rz9kITzc9TCGugV34l7rwY2z+27wUvgIwk3CXkU+KUxYW
 A0ytTnhfxPu0YA+d87mjnqzo1M+lYnDAqMd5BrzDB9raUZfjC8TSgr/Olg++f4bYH9ec
 9WhodqEAc0QeRSrMgRscxWLRzpcIqW06Yu3zp9ZBdH3eYag0Uu4KDsS0mNru9pzxPkUa
 c77A==
X-Gm-Message-State: APjAAAUNdSSZTABro3jRHu/WidCQud78jtzYG8//vlqqC+OTFTmBfZqE
 0ZyKnN2UKq9cGTuZTWJrfQ==
X-Google-Smtp-Source: APXvYqy9KkVJUxhfqZmRZ3M91SDJ+27dNBdX1LPZspTOOblB090f3hd6q5gx6KxFeVB4+stJbHMfyQ==
X-Received: by 2002:a02:b10b:: with SMTP id r11mr23643555jah.140.1562637464244; 
 Mon, 08 Jul 2019 18:57:44 -0700 (PDT)
Received: from localhost ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id t14sm17885628ioi.60.2019.07.08.18.57.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 08 Jul 2019 18:57:43 -0700 (PDT)
Date: Mon, 8 Jul 2019 19:57:42 -0600
From: Rob Herring <robh@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: drm/panel: simple: add
 ortustech,com37h3m05dtc panel
Message-ID: <20190709015742.GA2590@bogus>
References: <cover.1559905870.git.hns@goldelico.com>
 <a650cb8df1bdf58ec3c8a182532692db16b77f70.1559905870.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a650cb8df1bdf58ec3c8a182532692db16b77f70.1559905870.git.hns@goldelico.com>
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
 letux-kernel@openphoenux.org, David Airlie <airlied@linux.ie>,
 marek.belisko@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com,
 Thierry Reding <thierry.reding@gmail.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAgNyBKdW4gMjAxOSAxMzoxMTowOSArMDIwMCwgIkguIE5pa29sYXVzIFNjaGFsbGVy
IiB3cm90ZToKPiBTaWduZWQtb2ZmLWJ5OiBILiBOaWtvbGF1cyBTY2hhbGxlciA8aG5zQGdvbGRl
bGljby5jb20+Cj4gLS0tCj4gIC4uLi9kaXNwbGF5L3BhbmVsL29ydHVzdGVjaCxjb20zN2gzbTA1
ZHRjLnR4dCAgICAgICAgfCAxMiArKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGlu
c2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL29ydHVzdGVjaCxjb20zN2gzbTA1ZHRjLnR4dAo+IAoK
UmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
