Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFCA7078A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 19:39:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266B189D58;
	Mon, 22 Jul 2019 17:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260B489D58
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 17:39:38 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id o9so75851592iom.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 10:39:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yuyB8pILujpflF/Q/M9APeaT5IXpHOGkbQKNsVipriU=;
 b=WTHwSv/2zs5EJvQiy9DN15uVPQSiDt97fJLog7zOETb0ofOtG5BJnws87skagriS5l
 Q3qjQH5Dvw0IDpGt6+zZlF+bvQkMhJf/Jcd5kB6Nhs2+4VeLd3rBUtk9VpZ7Fx8uvM3R
 eQwFjxuniLg+73A9b8SPCFXsjLgicHMmd8vmSncCeXvhMQ1l4NLCZcHPASXxTV3oYfxM
 BMUdkPMrM7dRtGdD10rIzXw/amK7cX/knhkTmOr5mAugAMB9Pm3SILYkYFCEuffmioKI
 TcsO035cusnwhn1QvMYJi2S49QVRSm8AHPvLVj1h2tuZNII90j7Jxhdav8HdZ/T2aDND
 pMCA==
X-Gm-Message-State: APjAAAUdTmlvXOcSLhRUpmsrxnCsJMixIh2RRC3qhCVM9xO7rsQTcfME
 xczch92SxKSlg03RH0echKez0go=
X-Google-Smtp-Source: APXvYqxNSkCw3W+oC2a+dAbLpos4fIcmpa8N1UVKkDaxst8+m0rwQM+coXmVvshQIkATlSLf6D7EeA==
X-Received: by 2002:a02:b713:: with SMTP id g19mr74167358jam.77.1563817177425; 
 Mon, 22 Jul 2019 10:39:37 -0700 (PDT)
Received: from localhost ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id i3sm37295539ion.9.2019.07.22.10.39.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 10:39:36 -0700 (PDT)
Date: Mon, 22 Jul 2019 11:39:36 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [v3 3/4] dt-bindings: display: panel: add auo kd101n80-45na
 panel bindings
Message-ID: <20190722173936.GA26950@bogus>
References: <20190626025400.109567-1-jitao.shi@mediatek.com>
 <20190626025400.109567-4-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626025400.109567-4-jitao.shi@mediatek.com>
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
 David Airlie <airlied@linux.ie>, stonea168@163.com,
 dri-devel@lists.freedesktop.org, yingjoe.chen@mediatek.com,
 Sam Ravnborg <sam@ravnborg.org>, Ajay Kumar <ajaykumar.rs@samsung.com>,
 Vincent Palatin <vpalatin@chromium.org>, cawa.cheng@mediatek.com,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Thierry Reding <treding@nvidia.com>, linux-pwm@vger.kernel.org,
 Jitao Shi <jitao.shi@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>,
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 linux-mediatek@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Rahul Sharma <rahul.sharma@samsung.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyNiBKdW4gMjAxOSAxMDo1Mzo1OSArMDgwMCwgSml0YW8gU2hpIHdyb3RlOgo+IEFk
ZCBkb2N1bWVudGF0aW9uIGZvciBhdW8ga2QxMDFuODAtNDVuYSBwYW5lbC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Cj4gUmV2aWV3ZWQtYnk6
IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiAtLS0KPiAgLi4uL2Rpc3BsYXkvcGFu
ZWwvYXVvLGtkMTAxbjgwLTQ1bmEudHh0ICAgICAgIHwgMzQgKysrKysrKysrKysrKysrKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYXVvLGtkMTAx
bjgwLTQ1bmEudHh0Cj4gCgpSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9y
Zz4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
