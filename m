Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E80102D63
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 21:18:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 917BF6E10B;
	Tue, 19 Nov 2019 20:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E3516E10B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 20:18:20 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id c19so19074497otr.11
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 12:18:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=onoq+Z2JcZ0wm7xV09BtvAAc615BtbBWD3mKE843QYY=;
 b=OihSZfWIZeFqiSfntIZj9rx5mPj/v28Mw0vHOrAK9Yf2O4JlEXAlK0cFfDGK7447nu
 wFciaCNHnFNJA+d4+j9dl1qknFAPhiSxY9uf9mgVftsQUvH4GU0rSGFtx2vDLqVd0YAd
 TuRj4M2JES/t1yAvPtGmnwG1mRcShZCC/LUzEWQ62ksyKaNQOX3bGnc4j1lT3U+yP+Nx
 AYO9RZdLzBPcMhfR+Y/6lHinKhI/6dcFnNeZwBpOlIoKrbrSX9bNBYL6G6BNlhzH3CJG
 IlILBRvBznQpG1qBXBIcFS/TFDljzw3BeFet3IezyDTGVPAiD3PRqyy/l+gNk2uO+RIM
 DloA==
X-Gm-Message-State: APjAAAVDhm9UqQLSDHv+IWvkZ7CHyaXovvjWFeSt8LiHlqpgWWgLMSed
 7zpRSKBi4kXafCazUFyXKg==
X-Google-Smtp-Source: APXvYqzk50DUwK44cVAQKNTxSjvx/DhWiu+LrLwLviaKJdBnE6+0GzA6D87C87M4wXVUnS//c5dHvg==
X-Received: by 2002:a05:6830:15a:: with SMTP id
 j26mr5085138otp.342.1574194699323; 
 Tue, 19 Nov 2019 12:18:19 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u1sm7574771otk.33.2019.11.19.12.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 12:18:18 -0800 (PST)
Date: Tue, 19 Nov 2019 14:18:17 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: pwm: Convert PWM bindings to
 json-schema
Message-ID: <20191119201817.GA17082@bogus>
References: <20191021160207.18026-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191021160207.18026-1-krzk@kernel.org>
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
 linux-pwm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, Thierry Reding <thierry.reding@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMDY6MDI6MDZQTSArMDIwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBDb252ZXJ0IGdlbmVyaWMgUFdNIGNvbnRyb2xsZXIgYmluZGluZ3MgdG8g
RFQgc2NoZW1hIGZvcm1hdCB1c2luZwo+IGpzb24tc2NoZW1hLiAgVGhlIGNvbnN1bWVyIGJpbmRp
bmdzIGFyZSBwcm92aWRlZCBieSBkdC1zY2hlbWEuCj4gCj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6
dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgo+IEFja2VkLWJ5OiBTdGVwaGVuIEJveWQg
PHNib3lkQGtlcm5lbC5vcmc+Cj4gQWNrZWQtYnk6IFBhdWwgV2FsbXNsZXkgPHBhdWwud2FsbXNs
ZXlAc2lmaXZlLmNvbT4KCkxvb2tzIGxpa2UgSSBtaXNzZWQgdGhpcyBvbmUgc29tZWhvdy4KCkkn
dmUgYXBwbGllZCB0aGUgc2VyaWVzIG5vdy4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
