Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE35AE8D59
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 17:57:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14DB6E452;
	Tue, 29 Oct 2019 16:57:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15AB66E452
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 16:57:46 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id 94so10354337oty.8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 09:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AzR50uFmoDCtnAJJfiGxTvyuBUS+uKVO9Sccr9LgN3A=;
 b=UDVSIYIRhLphWIwb4Tnd3TO2VznZy8ziRQYDUxm+Ss8G28d8agvURWMJcE0NJ+O3Oo
 3Q9tf1KfpdCtB7RS0noxdCQxBItGYDf1DlFOWeOsUVSwHLAzS2DMdOroXO4cBlRAn8FH
 n1Bv4gI0lZz0WL8miJARmvg1Im5ETRhBTcQEUHPrIf8GD7W9Gv+7WgchatMq7ve1wlb1
 tYvzDlc3JJS6lwx5JTWx7oTzES/KZrfkQNje74cO3vYBb1roCcMxwg647Qei515kOujn
 r4QQTNf52A2nLD5nYvkWz9lmsFZpuWxZc1hdcWqtY6/YC4rVIBrUgqUXLvMS71sOrg0v
 QVZw==
X-Gm-Message-State: APjAAAUdvsKbDGpBLpVXF8EIt7SFmzBtibPmBIDlT7K6N7jhRdMRBAlk
 BmCQVQ+sSraeoirEDAwcsw==
X-Google-Smtp-Source: APXvYqyA4q27jgqbyYHzCXs5l/JuoLIkpIFSmc+fTrrf3tbcL04DsgIowaA8Q0ofDaNVgZxnpP/5Jg==
X-Received: by 2002:a05:6830:1256:: with SMTP id
 s22mr19536485otp.308.1572368265215; 
 Tue, 29 Oct 2019 09:57:45 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u1sm2055522oie.37.2019.10.29.09.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 09:57:43 -0700 (PDT)
Date: Tue, 29 Oct 2019 11:57:43 -0500
From: Rob Herring <robh@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH 3/6] ASoC: dt-bindings: mt8183: add a property
 "mediatek,hdmi-codec"
Message-ID: <20191029165743.GA11562@bogus>
References: <20191022114505.196852-1-tzungbi@google.com>
 <20191022193301.3.I37696eb1321a21846f9e5a9eb14dfac7dbe10663@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191022193301.3.I37696eb1321a21846f9e5a9eb14dfac7dbe10663@changeid>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, narmstrong@baylibre.com, allen.chen@ite.com.tw,
 dri-devel@lists.freedesktop.org, jonas@kwiboo.se, jernej.skrabec@siol.net,
 robh+dt@kernel.org, broonie@kernel.org, Laurent.pinchart@ideasonboard.com,
 tzungbi@google.com, dgreid@google.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMiBPY3QgMjAxOSAxOTo0NTowMiArMDgwMCwgVHp1bmctQmkgU2hpaCB3cm90ZToK
PiBBZGQgYW4gb3B0aW9uYWwgcHJvcGVydHkgIm1lZGlhdGVrLGhkbWktY29kZWMiLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFR6dW5nLUJpIFNoaWggPHR6dW5nYmlAZ29vZ2xlLmNvbT4KPiAtLS0KPiAg
Li4uL2JpbmRpbmdzL3NvdW5kL210ODE4My1tdDYzNTgtdHMzYTIyNy1tYXg5ODM1Ny50eHQgICAg
ICAgICAgIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCgpBY2tl
ZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
