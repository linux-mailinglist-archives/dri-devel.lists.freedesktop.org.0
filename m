Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D9B903FE
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 16:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57FDC6E44C;
	Fri, 16 Aug 2019 14:31:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F076E44C;
 Fri, 16 Aug 2019 14:31:50 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id v19so4252405wmj.5;
 Fri, 16 Aug 2019 07:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2KH9X7wXKLaNgHTDRuB2BCoTUIbuMO+ioBBw7HzU1JY=;
 b=q1XwyHxwpb1+GyTwTmLIWjNZvK19WAim++6JRFieOcnAE5PEEpPKC4EjPwxaHudG2c
 n3RrPjfM/C/ooZ4uiA9mPd6xlPa4Yi9yoHGKNrRRUeSx5oYX5O/YlDoYY6z1fcoLJhuJ
 vVvaUFvlCgwfSy4vnnjDJMG+jMMpzOqtQdFGMD+30jVsWsDsY1qJJz3EmvzdY9qQsG1N
 QPzsptdjTy40zTYfJrVizOdjez9/2e02tQcIGGrcX8WPgBmDexs9N5rQCzTRIcybzGvd
 L48eG4XOA4cNQMu6epz/wGkRumDYaTW8nfBx2XjxdSO7MrHnIY/HNHswH6D0t9vP22v3
 5HUw==
X-Gm-Message-State: APjAAAUixUe8eMmIe9T2TIddoc+m1qjWNc/ZURpA8E47JUkbHlOaouzb
 MFoGpZA25wxeX1GtAgCvW1Y=
X-Google-Smtp-Source: APXvYqwUeQsO1Tir1acCeUF+pqGoRTuIizGwVTqI59KMXv4bOZjBPRpPwKZbNL/kgP0dRGGiI+zGDQ==
X-Received: by 2002:a1c:740b:: with SMTP id p11mr7978852wmc.6.1565965909230;
 Fri, 16 Aug 2019 07:31:49 -0700 (PDT)
Received: from Red ([2a01:cb1d:147:7200:2e56:dcff:fed2:c6d6])
 by smtp.googlemail.com with ESMTPSA id
 k124sm10940860wmk.47.2019.08.16.07.31.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Aug 2019 07:31:48 -0700 (PDT)
Date: Fri, 16 Aug 2019 16:31:46 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: bskeggs@redhat.com, airlied@linux.ie, hch@lst.de,
 m.szyprowski@samsung.com, robin.murphy@arm.com,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
Subject: Re: DMA-API: cacheline tracking ENOMEM, dma-debug disabled due to
 nouveau ?
Message-ID: <20190816143146.GB30445@Red>
References: <20190814145033.GA11190@Red>
 <20190814174927.GT7444@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814174927.GT7444@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2KH9X7wXKLaNgHTDRuB2BCoTUIbuMO+ioBBw7HzU1JY=;
 b=aOAKvEhf4eJTxcKSld4tT+33ybgVN17T/bYorvBedFN3143JLOiZGmSFFZmUYjnl2R
 ZmjW7kD/tqSTxSJekD045oAnsHHGE/wzxd3ibBgHSbBD4G7ailmdun7QlU0roREL2N42
 puNiR5ETw9wQOVpe6Mqo+x1oUp13MVT9P6m1jnGzwcPxVoe/dl2ds8g+wH5hhvtdRPid
 6OPErwSecc0kXng21CIP03S6DK1Hw73vanv14N8c4S3nZ+j9DR7q/0QqTBczWN0MsIhz
 x4vLhJPhZtg6XPzAQB5+8f8EtApLxjhTH7R06QpYALGd6QyBD3lQpkcUSmLWFu3Jzd3K
 Mx5g==
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

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDc6NDk6MjdQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBXZWQsIEF1ZyAxNCwgMjAxOSBhdCAwNDo1MDozM1BNICswMjAwLCBDb3JlbnRp
biBMYWJiZSB3cm90ZToKPiA+IEhlbGxvCj4gPiAKPiA+IFNpbmNlIGxvdCBvZiByZWxlYXNlIChh
dCBsZWFzdCBzaW5jZSA0LjE5KSwgSSBoaXQgdGhlIGZvbGxvd2luZyBlcnJvciBtZXNzYWdlOgo+
ID4gRE1BLUFQSTogY2FjaGVsaW5lIHRyYWNraW5nIEVOT01FTSwgZG1hLWRlYnVnIGRpc2FibGVk
Cj4gPiAKPiA+IEFmdGVyIGhpdHRpbmcgdGhhdCwgSSB0cnkgdG8gY2hlY2sgd2hvIGlzIGNyZWF0
aW5nIHNvIG1hbnkgRE1BIG1hcHBpbmcgYW5kIHNlZToKPiA+IGNhdCAvc3lzL2tlcm5lbC9kZWJ1
Zy9kbWEtYXBpL2R1bXAgfCBjdXQgLWQnICcgLWYyIHwgc29ydCB8IHVuaXEgLWMKPiA+ICAgICAg
IDYgYWhjaQo+ID4gICAgIDI1NyBlMTAwMGUKPiA+ICAgICAgIDYgZWhjaS1wY2kKPiA+ICAgIDU4
OTEgbm91dmVhdQo+ID4gICAgICAyNCB1aGNpX2hjZAo+ID4gCj4gPiBEb2VzIG5vdXZlYXUgaGF2
aW5nIHRoaXMgaGlnaCBudW1iZXIgb2YgRE1BIG1hcHBpbmcgaXMgbm9ybWFsID8KPiAKPiBZZWFo
IHNlZW1zIHBlcmZlY3RseSBmaW5lIGZvciBhIGdwdS4KCk5vdGUgdGhhdCBpdCBuZXZlciBnbyBk
b3duIGFuZCB3aGVuIEkgdGVybWluYXRlIG15IFggc2Vzc2lvbiwgaXQgc3RheXMgdGhlIHNhbWUu
ClNvIHdpdGhvdXQgYW55ICJyZWFsIiBHUFUgd29yaywgZG9lcyBpdCBpcyBzdGlsbCBub3JtYWwg
dG8gaGF2ZSBzbyBtYW55IGFjdGl2ZSBtYXBwaW5nID8KCkZvciBleGFtcGxlLCB3aGVuIGRvaW5n
IHNvbWUgdHJhbnNmZXIsIHRoZSBhaGNpIG1hcHBpbmcgbnVtYmVyIGNoYW5nZXMgYW5kIHRoZW4g
YWx3YXlzIGdvIGRvd24gdG8gNi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
