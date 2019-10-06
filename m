Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A554BCD2FC
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2019 17:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706A46E3FC;
	Sun,  6 Oct 2019 15:47:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C2A6E0BA;
 Sun,  6 Oct 2019 15:47:40 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id r17so13043403wme.0;
 Sun, 06 Oct 2019 08:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SBpRb6qd+48zQK5uPLn0YvEluIoUY9o3FhFhGA6TXtY=;
 b=hxCP0AlhsZ0Xq4/uZ3uOzVRK+z9YLkU+bBOelgxDMwryEftK5M9QPTrK2fuYK8m6K+
 z00GPlEuErUbAO/t3PXv2zC6q2CCAH3Jk4LHMwz/av4UJJwCwxT51CxVQU6l3cc/fEVr
 ns0zNNdQyofMca91m9nEgEN4DiP7Be/f6rq3GmdK2gaqBDmJ94MOzYIHhhbAgEEMD3oY
 CsoR0ibLpHf1staoVpieb4oYn5AWt/yhwuDPnrRz3+PRBkGkn8/Bqh4cF/UnKGupN/J9
 iTWYYUcTK37aPdSBF9mDqNUEUd/QqV61pa1s7f+/VrKBLE2UUPo3mjFfm2uozt5q+k50
 y4qg==
X-Gm-Message-State: APjAAAVJxBfaalLSOIXJIRSadQTNVhzfSS4NWVQcmEsOQ6bQ58+PwKnh
 EkJyQOD1a03aUrW/RSeeY/E=
X-Google-Smtp-Source: APXvYqwiD5w33vuIYv9624AWG0k3vsCYtE8uO59mkpTJi1G/TZQDv7OS1UJvxH3zuwZ0w6XxIwuUIQ==
X-Received: by 2002:a1c:9988:: with SMTP id
 b130mr18139392wme.164.1570376858781; 
 Sun, 06 Oct 2019 08:47:38 -0700 (PDT)
Received: from kozik-lap ([194.230.155.145])
 by smtp.googlemail.com with ESMTPSA id o22sm31539882wra.96.2019.10.06.08.47.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 06 Oct 2019 08:47:38 -0700 (PDT)
Date: Sun, 6 Oct 2019 17:47:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 3/3] ARM: dts: exynos: Rename power domain nodes to
 "power-domain" in Exynos4
Message-ID: <20191006154734.GA29365@kozik-lap>
References: <20191002160632.11140-1-krzk@kernel.org>
 <20191002160632.11140-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191002160632.11140-3-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMDIsIDIwMTkgYXQgMDY6MDY6MzJQTSArMDIwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBUaGUgZGV2aWNlIG5vZGUgbmFtZSBzaG91bGQgcmVmbGVjdCBnZW5lcmlj
IGNsYXNzIG9mIGEgZGV2aWNlIHNvIHJlbmFtZQo+IHBvd2VyIGRvbWFpbiBub2RlcyB0byAicG93
ZXItZG9tYWluIi4gIE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEty
enlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KPiAtLS0KPiAgYXJjaC9hcm0vYm9v
dC9kdHMvZXh5bm9zNC5kdHNpICAgIHwgMTQgKysrKysrKy0tLS0tLS0KPiAgYXJjaC9hcm0vYm9v
dC9kdHMvZXh5bm9zNDIxMC5kdHNpIHwgIDIgKy0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9z
NDQxMi5kdHNpIHwgIDIgKy0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkg
ZGVsZXRpb25zKC0pCgpBcHBsaWVkLgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
