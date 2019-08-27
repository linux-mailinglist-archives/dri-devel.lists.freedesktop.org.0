Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B34889F009
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 18:21:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD7F89B70;
	Tue, 27 Aug 2019 16:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD8E89B70;
 Tue, 27 Aug 2019 16:20:55 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id q8so15129405oij.5;
 Tue, 27 Aug 2019 09:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/+2YwB8+Xi4YT6vhao9F9CgIDSvyioAXjISKvURBpVM=;
 b=EFzj3TCu1/cByyNUA5uiXED582CdVUW9V7UNA0FX8/230+4THipPZaQiJDXNeHA0Qn
 UbvHBw6R1AJKtNKXBH4G906EZfpJaaBwf5IROCsfJiB0neF9RY96vQ4mZ15AzyWpxdSA
 wcTD9GZfZvloESfs0ImZqiAdDp8fC0Ry0c/qGh0ZegeLUE9cNQ8M6LO+FGPSORmGLUsv
 30QR3m1KBc6Wm346cNzrosO6JsekaCf2FNgFUX5Wf44fKNy51FGwqOpjE0dExBl0FZzK
 qvtTWOnMWWYjH877JykNe0S+iHrb9GmcVStL8eEDa2hpDCInaQG9iPJoPV+KgkH7yabR
 Se+A==
X-Gm-Message-State: APjAAAXNt43j9nzHZW2o6/2Q69yschVY9crzmNhAAnSFxuWcJEPbDQpS
 zO3WZf8/i+wFlDaC0XL+OQ==
X-Google-Smtp-Source: APXvYqwVWvlJHLSHxm3WNh8/kzbvwC8YMUkeCo9ZURCfgjbx93rsP4tPShUQbsFtmuJHppSVq6yE2g==
X-Received: by 2002:aca:d650:: with SMTP id n77mr17486575oig.129.1566922854444; 
 Tue, 27 Aug 2019 09:20:54 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 20sm5759937otd.71.2019.08.27.09.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 09:20:53 -0700 (PDT)
Date: Tue, 27 Aug 2019 11:20:53 -0500
From: Rob Herring <robh@kernel.org>
To: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH 01/11] dt-bindings: drm/bridge: analogix-anx78xx: add new
 variants
Message-ID: <20190827162053.GA12094@bogus>
References: <20190815004854.19860-1-masneyb@onstation.org>
 <20190815004854.19860-2-masneyb@onstation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815004854.19860-2-masneyb@onstation.org>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 jonas@kwiboo.se, agross@kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, linux-arm-msm@vger.kernel.org,
 enric.balletbo@collabora.com, freedreno@lists.freedesktop.org, sean@poorly.run,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxNCBBdWcgMjAxOSAyMDo0ODo0NCAtMDQwMCwgQnJpYW4gTWFzbmV5IHdyb3RlOgo+
IEFkZCBzdXBwb3J0IGZvciB0aGUgYW5hbG9naXgsYW54NzgwOCwgYW5hbG9naXgsYW54NzgxMiwg
YW5kCj4gYW5hbG9naXgsYW54NzgxOCB2YXJpYW50cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCcmlh
biBNYXNuZXkgPG1hc25leWJAb25zdGF0aW9uLm9yZz4KPiAtLS0KPiAgLi4uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW54NzgxNC50eHQgICAgICAgICAgfCA2ICsrKysrLQo+
ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCgpSZXZp
ZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
