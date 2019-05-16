Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA929214EF
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 09:55:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D71D898B7;
	Fri, 17 May 2019 07:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3FF8951B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 13:15:16 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id s11so1828892pfm.12
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 06:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AI8JZy9keS1o3wGiqH13yvNioRMPnmitZYzglqzVfaM=;
 b=Dl/GBV0AmKmLI580YJWq7g+AhoFfsMQujFu3WY4PDfV8sJoe3pnbhKXjqfxyyg2V4n
 yK9GsPRkXRY/tWpj30iPYl9lKCQ1+w8+L5nqkExunn2QnXBagAvHMICUnAmg1FvAv3t3
 TfLs9IjzMl1nE2r72hFHr9XInAd1zm+WvBdduZ+qoDapzXBLJtWEnmAryCRi1PD6ZJnd
 wPVZiRcRwRDFT06uAy0eiMc4xZmlzeiLO8+hDkl4M1XCA9ygdFrLaDSAcKnoL9Nmg8d2
 1MhUf4OSD4P+wAkfbGd+goGzCsFWrRB1geL7vKzPHhXg788UgQ+tMlh6eFdfOUfaivaS
 PLgQ==
X-Gm-Message-State: APjAAAU2o/p9ePlOT8UF+Edkw/imvGjDxAFJbnyVDt019wUKAaOkpLWk
 9bnCd0oflsBmGOUbYlOMXg+Izll9xiWFrG1fPF0=
X-Google-Smtp-Source: APXvYqzudyk1qALYh5US3Qa7TwBBWRQjv2nVATbz+op+71ojr+YahyEVhSZZYFuqUDeefV1vVymRSCmRg0vDR5v/Kjg=
X-Received: by 2002:a63:fd4a:: with SMTP id m10mr51120343pgj.302.1558012515963; 
 Thu, 16 May 2019 06:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <5cda6ee2.1c69fb81.2949b.d3e7@mx.google.com>
 <20190514073542.GA4969@pendragon.ideasonboard.com>
In-Reply-To: <20190514073542.GA4969@pendragon.ideasonboard.com>
From: Sabyasachi Gupta <sabyasachi.linux@gmail.com>
Date: Thu, 16 May 2019 18:45:04 +0530
Message-ID: <CAJr6mf0zy37MTuZQV2YLLQ7dY4a0r6LpSRTKByX0dBBfxuA4_g@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: Remove duplicate header
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Approved-At: Fri, 17 May 2019 07:54:52 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=AI8JZy9keS1o3wGiqH13yvNioRMPnmitZYzglqzVfaM=;
 b=PesW0sD/ciOLThNvEJ5C/W678/gfkxLY7wHxWDXM4XUpjORA7GFmWmCdTTSvPA3Z/0
 mRU2vzRtPQ8B9koGUI7hKssaUEBT9F4MR0ZH2GvgZy8EmQcnc09vQRlNg/gMzumatICh
 IAX4WvXg1JAaX1ZUyhP7NrI++OVIlOUGFAWHcmIxxNLMrBqJR49DGSbUUaTN3nVIJPic
 /+6NKGSPOtcHaLcBMAUOYaPUul/RGAKyJ/WJJfMUrYdkILEhf8MJvxTqjjvrCO0NFOFf
 3q8zPRViuBCjVBhQ95qbQdcrb6rRjoLbtwsbi5mla3krW5q7Yw9WpaK5QadmNSDB2o2y
 xh0Q==
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
Cc: architt@codeaurora.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Souptick Joarder <jrdr.linux@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMTowNSBQTSBMYXVyZW50IFBpbmNoYXJ0CjxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+Cj4gSGkgU2FieWFzYWNoaSwKPgo+
IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgo+Cj4gT24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMDE6
MDE6NDFQTSArMDUzMCwgU2FieWFzYWNoaSBHdXB0YSB3cm90ZToKPiA+IFJlbW92ZSBkcm0vZHJt
X3BhbmVsLmggd2hpY2ggaXMgaW5jbHVkZWQgbW9yZSB0aGFuIG9uY2UKPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBTYWJ5YXNhY2hpIEd1cHRhIDxzYWJ5YXNhY2hpLmxpbnV4QGdtYWlsLmNvbT4KPiA+
IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwuYyB8IDEgLQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvcGFuZWwuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwuYwo+ID4g
aW5kZXggN2NiYWJhMi4uNDAyYjMxOCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvcGFuZWwuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYW5lbC5jCj4g
PiBAQCAtMTUsNyArMTUsNiBAQAo+ID4gICNpbmNsdWRlIDxkcm0vZHJtX2NydGNfaGVscGVyLmg+
Cj4gPiAgI2luY2x1ZGUgPGRybS9kcm1fZW5jb2Rlci5oPgo+ID4gICNpbmNsdWRlIDxkcm0vZHJt
X21vZGVzZXRfaGVscGVyX3Z0YWJsZXMuaD4KPiA+IC0jaW5jbHVkZSA8ZHJtL2RybV9wYW5lbC5o
Pgo+Cj4gV2hpY2ggdHJlZSBpcyB0aGlzIGFnYWluc3QgPyBUaGUgcGF0Y2ggYXBwbGllcyBvbiBu
ZWl0aGVyIGRybS1uZXh0IG5vcgo+IGRybS1taXNjLW5leHQuCj4KSXQgaXMgYWdhaW5zdCBsaW51
eC1uZXh0IHRyZWUKPiBXaGlsZSBhdCBpdCwgY291bGQgeW91IHlvdSByZW9yZGVyIHRoZSBvdGhl
ciBoZWFkZXIgYWxwaGFiZXRpY2FsbHkgdG8KPiBtYWtlIHRoaXMga2luZCBvZiBpc3N1ZSBlYXNp
ZXIgdG8gbm90aWNlID8KPgpJdCBpcyBhbHJlYWR5IGFycmFuZ2VkIGluIGFscGhhYmV0aWNhbCBv
cmRlcgo+ID4KPiA+ICBzdHJ1Y3QgcGFuZWxfYnJpZGdlIHsKPiA+ICAgICAgIHN0cnVjdCBkcm1f
YnJpZGdlIGJyaWRnZTsKPgo+IC0tCj4gUmVnYXJkcywKPgo+IExhdXJlbnQgUGluY2hhcnQKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
