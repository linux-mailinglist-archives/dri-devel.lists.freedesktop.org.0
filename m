Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC0F11417D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 14:32:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F726E0FE;
	Thu,  5 Dec 2019 13:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A0C6E0FE
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 13:32:38 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id t12so2301478vso.13
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2019 05:32:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nElSbxWs2Royy3BcwzZg3sXW+bCh22pujqdesZt/GBg=;
 b=sUNUdvDTRf2V9rHqEU42iK6Dg+LVBe0XOpIVySeb1CPxVrjgdoXS6VQj4lvfJPPQyE
 H81BZxZMf1WQHZ0Selrueymh3bOOKh5c/+uocffBnGX3zF/M5FMOsd93pPhhP3CtaKOJ
 TG5FP0mHaK4JH180GhqLEVOKrUeyRa6lRZIDMoSjnZQvoxg0QHIz3uWJrrZ0R6C06nfL
 rgVXST37tfACZSZmhy6KEiM6ABvGFPi2qPAAklatUy4nWcHDiSOgPyCwAyQI7ME2p51t
 6XctG8hzBO1/+sLtfQl8G/664drF389qvkCK04yVvSLrUpf0rg5J6Qt6HxLHUlMPx9i0
 MwKQ==
X-Gm-Message-State: APjAAAWNEQ6VVmDfNsQKHrlZo1g7riRNFaIHm5TE2NW6KIqyeTTAYCy/
 xLTMBJ48GjZ7c1kKOGGeeTI6caD8XuIQb51gMxw=
X-Google-Smtp-Source: APXvYqxSBvklQse//WBRtPjsMQxsgt43znKKqUwcOrxs9wEqdI/FY0HGBIMBgCa1JxQbUbymTkjXcvdr1qJLoC/4xU8=
X-Received: by 2002:a67:f102:: with SMTP id n2mr5472159vsk.138.1575552757101; 
 Thu, 05 Dec 2019 05:32:37 -0800 (PST)
MIME-Version: 1.0
References: <20191204132430.16874-1-tzimmermann@suse.de>
In-Reply-To: <20191204132430.16874-1-tzimmermann@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 5 Dec 2019 13:31:31 +0000
Message-ID: <CACvgo51shrUnq_gM60ex9kGkZGyfCYoZxkzJsL9EcQXUg9_0xQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] drm/udl: Prepare damage handler for simple-pipe KMS
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=nElSbxWs2Royy3BcwzZg3sXW+bCh22pujqdesZt/GBg=;
 b=HhZ37ivysVD2PYsBn8u9IBSB6eYQSEkg8JdSv3zUQxIfP79VP6D0XyQb82b4yJZWzI
 /MORf8zwQw6H0KXGB8HH6vd3d3bR6/gKb4PAIEh06oTSzdPUWzcz1wkOdha0+Fzlv6qe
 HdxK7u8BSsGNs9ErbM/pzys7xgCQalw95ekadAdD6UfB8I14W2y6R+GV+bFcXgMDutAU
 whHYTt+RKK5o1YMqZPSFh6y05smtW8R4qJaOuAsnQ9XuCuJG/AP5Qwb74uNzzE+uh34g
 PTAuTHsmEiCxHWin7owp1rkEh6SEM/Vx4WTzGnJaM4vi4H0TA46MhiEIvFfXdWQWiPd8
 UOeg==
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCA0IERlYyAyMDE5IGF0IDEzOjI0LCBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT4gd3JvdGU6Cj4KPiBVZGwncyBkYW1hZ2UtaGFuZGxpbmcgY29kZSByZXF1aXJl
cyBjbGVhbiB1cCBiZWZvcmUgc3dpdGNoaW5nIHRoZSBkcml2ZXIKPiB0byBzaW1wbGUtcGlwZSBo
ZWxwZXJzLiBQYXRjaGVzIDEsIDIgYW5kIDcgcmVtb3ZlIHVudXNlZCBzdGF0ZSB2YXJpYWJsZXMK
PiBhbmQgc3RhdGlzdGljcy4gUGF0Y2hlcyAzIHRvIDUgcmVvcmdhbml6ZXMgdGhlIGRhbWFnZSBo
YW5kbGVyIHRvIGJlIG1vcmUKPiByZWFkYWJsZS4gUGF0Y2ggNiBtb3ZlcyBkbWEtYnVmIGJlZ2lu
L2VuZCBjYWxscyBpbnRvIHRoZSBkYW1hZ2UgaGFuZGxlciwKPiBzbyBpdCB3aWxsIHJ1biBkdXJp
bmcgcGFnZS1mbGlwIGFuZG1vZGVzZXQgb3BlcmF0aW9ucy4KPgo+IFRoZSBwYXRjaHNldCBoYXMg
YmVlbiB0ZXN0ZWQgYnkgcnVubmluZyBmYmRldiBjb25zb2xlIGVtdWxhdGlvbiwgWDExLCBhbmQK
PiBXZXN0b24gd2l0aCBhIERpc3BsYXlMaW5rIGFkYXB0ZXIuCj4KPiBUaG9tYXMgWmltbWVybWFu
biAoNyk6Cj4gICBkcm0vdWRsOiBSZW1vdmUgdW51c2VkIHN0YXRpc3RpY3MgY291bnRlcnMKPiAg
IGRybS91ZGw6IERvbid0IHRyYWNrIG51bWJlciBvZiBpZGVudGljYWwgYW5kIHNlbnQgcGl4ZWxz
IHBlciBsaW5lCj4gICBkcm0vdWRsOiBWbWFwIGZyYW1lYnVmZmVyIGFmdGVyIGFsbCB0ZXN0cyBz
dWNjZWVkZWQgaW4gZGFtYWdlIGhhbmRsaW5nCj4gICBkcm0vdWRsOiBNb3ZlIGNsaXAtcmVjdGFu
Z2xlIGNvZGUgb3V0IG9mIHVkbF9oYW5kbGVfZGFtYWdlKCkKPiAgIGRybS91ZGw6IE1vdmUgbG9n
LWNwcCBjb2RlIG91dCBvZiB1ZGxfZGFtYWdlX2hhbmRsZXIoKQo+ICAgZHJtL3VkbDogQmVnaW4v
ZW5kIGFjY2VzcyB0byBpbXBvcnRlZCBidWZmZXJzIGluIGRhbWFnZS1oYW5kbGVyCj4gICBkcm0v
dWRsOiBSZW1vdmUgZmllbGQgbG9zdF9waXhlbHMgZnJvbSBzdHJ1Y3QgdWRsX2RldmljZQo+ClRo
ZXJlJ3MgYSBidWdmaXggcmVxdWVzdCBpbiA2LzcuCgpSZWdhcmRsZXNzIGlmIHlvdSBzcXVhc2gg
aXQgaW4gb3IgY2hvb3NlIHRvIGtlZXAgaXQgc2VwYXJhdGUsIHRoZSBzZXJpZXMgaXM6ClJldmll
d2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgoKVGhhbmtz
CkVtaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
