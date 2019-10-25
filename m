Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF76E54BC
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 21:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB7A96EB9D;
	Fri, 25 Oct 2019 19:58:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 158C76EB9D
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 19:58:25 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id 94so2861787oty.8
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 12:58:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=d2OsTbKFKCeMTMNwxNy1n33lnkHVDqluXV6Ie7j05xw=;
 b=FYHlEgkgnA0GwFDG8cSVPMDeE0f4t6rFiOUD+jeDmPxAEH8bjwge1ozrFpjMc1TQQb
 062VtSVHqstdQlYX/tlvTaQgrNYKwkh4ZhXzvu37Wk2jdqu9Flq9aCZZdqie0r9KrivP
 jp/klS9RzZ+eVG3z1Oki39i8sBTNBULvVgnS3sOt0JHAcGfE/VG10lkUTmzlV/boTnrE
 DkAy0TQeHh3GLbHvsiOf20ryHCifThTUgN0uw92eqoR4FPP8MmeSzl6slv7UGiERkA+l
 ZpV2yNPmPETenS41B9F8zxdOJPbs9G9wbHTj4WI07nhqh1Zfubcdbu1+7ZgVvQbaX6Gm
 k7Fg==
X-Gm-Message-State: APjAAAVRAeR3fVG7SS0Z5WOWd7Pm5/4KTsz59DgcWF7K0pO0XAzrGe63
 F4BG1EoRR4R3/sYVZgM1Bg==
X-Google-Smtp-Source: APXvYqz2/zebuhop1abxkGx0qiGWyLzTDbYNwdobWl7IUSM3Pf+Ke/WEC2wEXubQeqtStaz7uTVjXw==
X-Received: by 2002:a9d:7d92:: with SMTP id j18mr4348790otn.37.1572033504276; 
 Fri, 25 Oct 2019 12:58:24 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r3sm1024476otk.31.2019.10.25.12.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 12:58:23 -0700 (PDT)
Date: Fri, 25 Oct 2019 14:58:22 -0500
From: Rob Herring <robh@kernel.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 20/21] dt-bindings: display: panel: Add the
 LTA089AC29000 variant
Message-ID: <20191025195822.GA10635@bogus>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-21-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191023154512.9762-21-boris.brezillon@collabora.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Chris Healy <cphealy@gmail.com>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMyBPY3QgMjAxOSAxNzo0NToxMSArMDIwMCwgQm9yaXMgQnJlemlsbG9uIHdyb3Rl
Ogo+IFRoZSBMVEEwODlBQzI5MDAwIGFuZCBMVDA4OUFDMjkwMDAgYXJlIG5vdCBleGFjdGx5IHRo
ZSBzYW1lLiBMZXQncyBhZGQKPiBhIG5ldyBjb21wYXRpYmxlIGZvciB0aGUgTFRBIHZhcmlhbnQu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29s
bGFib3JhLmNvbT4KPiAtLS0KPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvdG9zaGliYSxs
dDA4OWFjMjkwMDAudHh0ICAgICAgICAgIHwgNSArKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCgpBY2tlZC1ieTogUm9iIEhlcnJpbmcgPHJv
YmhAa2VybmVsLm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
