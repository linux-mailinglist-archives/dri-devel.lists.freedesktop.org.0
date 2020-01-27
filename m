Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D98914A6FB
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 16:13:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9879E6EBDA;
	Mon, 27 Jan 2020 15:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A94A6EBDA
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 15:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AvcaQHsGf9q8P8sr76j5zYnoRvlA6Weltg5yBROc9io=; b=jmNKNB2jUmpStk2+x6J2mw3h3z
 ifM19Ka74VaAik4/+Bm71A0xaC7h06D4VcvrdDd9HJzKc8/KsLaMV7ajTTQsViXBb3Juab5+vZ6LP
 y+tlRh+2GBofOMtOrQ56Jc7y0BmqyQCi2pi9tgIkS07ek3CC6a3+NWdgZoQUt8ubwVbJ6RM5EW1AZ
 MetEEI9wWbYDvgY3hWRcb59oX3rg0JeBKtcKLMpK3qV0sYOcax0mxX/Y+Uy45+pG9K+0yyg6VQ0JQ
 yvuYi0khvPgxi+ECTbmACGc3fjYonc5m0CCQEGDIPmSsltDv2iupDRXdqGXgFlWS0M/awPBwNT1ZV
 m2qQ1eEA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:62464
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1iw64h-0004LR-Ao; Mon, 27 Jan 2020 16:13:15 +0100
Subject: Re: [PATCH v4 3/3] drm/tinydrm: add support for tft displays based on
 ilitek,ili9486
To: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
References: <cover.1580134320.git.kamlesh.gurudasani@gmail.com>
 <eb5672abbdb89d7018793c76d7193bfb78a2ea88.1580134320.git.kamlesh.gurudasani@gmail.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <79733e99-2c47-05e2-dbe8-5116001f44b4@tronnes.org>
Date: Mon, 27 Jan 2020 16:13:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <eb5672abbdb89d7018793c76d7193bfb78a2ea88.1580134320.git.kamlesh.gurudasani@gmail.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMjcuMDEuMjAyMCAxNS4yNiwgc2tyZXYgS2FtbGVzaCBHdXJ1ZGFzYW5pOgo+IFRoaXMg
YWRkcyBzdXBwb3J0IGZvdCBpbGl0ZWssaWxpOTQ4NiBiYXNlZCBkaXNwbGF5cyB3aXRoIHNoaWZ0
IHJlZ2lzdGVyCj4gaW4gZnJvbnQgb2YgY29udHJvbGxlci4KPiBPenptYWtlcixQaXNjcmVlbiBh
bmQgV2F2ZXNoYXJlLHJwaS1sY2QtMzUgYXJlIHN1Y2ggZGlzcGxheXMuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogS2FtbGVzaCBHdXJ1ZGFzYW5pIDxrYW1sZXNoLmd1cnVkYXNhbmlAZ21haWwuY29tPgo+
IC0tLQoKUmV2aWV3ZWQtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgoK
V2hlbiB5b3UgcmVzZW5kIGl0J3MgaW1wb3J0YW50IHRoYXQgeW91IGFkZCBhbnkgci1iJ3Mgb3Ig
YWNrJ3MgeW91J3ZlCmFscmVhZHkgcmVjZWl2ZWQuIFRoaXMgcHJldmVudHMgZG91YmxlIHdvcmsg
KHNvbWUgcmV2aWV3IGEgbG9hZCBvZgpwYXRjaGVzIGFuZCBjYW4ndCBiZSBleHBlY3RlZCB0byBy
ZW1lbWJlciB0aGVtIGFsbCkgYW5kIGl0IGhlbHBzIHRoZQptYWludGFpbmVyIGdldHRpbmcgY29u
ZmlkZW5jZSB0aGF0IHRoZSBwYXRjaCBpcyBzb2xpZCB3aGVuIG90aGVycyBoYXZlCmxvb2tlZCBh
dCBpdC4KCk5vIG5lZWQgdG8gcmVzZW5kIGFnYWluIGp1c3QgZm9yIHRoaXMsIGJ1dCBpZiB5b3Ug
bmVlZCBhbm90aGVyIHJlc3BpbiwKcmVtZW1iZXIgdG8gYWRkIG15IHItYi4KCk5vcmFsZi4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
