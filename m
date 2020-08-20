Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C4724C886
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 01:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E066E1A4;
	Thu, 20 Aug 2020 23:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8A66E1A4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 23:28:12 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4287D2184D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 23:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597966092;
 bh=y1Wgqh1GAoyYsV2k+q2fc4yzCIr9vvCD20G5Zf/a4wU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TfZ+2cwjuT/n2Iv8QQEjGOa3CPaMieV05fFA+Oi7nEB4k7Hb4LDkEK0Db8aE1f2ym
 ewjv5j0/yOOFYVtyDctGcmmJZ5HDkRDAnaJv6cIFaTwzVq3yUI3TnvOzrRJi80NIqR
 XCd7dRHy3CdaiJfllFYq7XcfZHl1rNBSnSEkYv0Y=
Received: by mail-ed1-f52.google.com with SMTP id w2so2709848edv.7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 16:28:12 -0700 (PDT)
X-Gm-Message-State: AOAM533UX3V/yYgI7LRozzL2+Og+qhAExCyCKUI4+UmOUstoZlM32zP9
 M6RitXZ3xxxB1XWbUb998M8dSkAqba23na8nKw==
X-Google-Smtp-Source: ABdhPJwuSJgrsrEJbwW4ZqpZR1tI1e3gpAbID/lO2xREIPczRxBkfkEvXEqYrYh6exUoPX+WCswHFsJtNmhFGKdT6SM=
X-Received: by 2002:a50:d2c7:: with SMTP id q7mr239405edg.61.1597966090804;
 Thu, 20 Aug 2020 16:28:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200819154421.7013-1-chunkuang.hu@kernel.org>
 <20200819154421.7013-3-chunkuang.hu@kernel.org>
 <eec33300-f921-03d1-5bcf-788e4e2ce342@infradead.org>
In-Reply-To: <eec33300-f921-03d1-5bcf-788e4e2ce342@infradead.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 21 Aug 2020 07:27:58 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-RZptS25adw7qoqZ-+dkK0vd+D_rd6KqChfm9ryF2RAw@mail.gmail.com>
Message-ID: <CAAOTY_-RZptS25adw7qoqZ-+dkK0vd+D_rd6KqChfm9ryF2RAw@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] drm/mediatek: Separate mtk_hdmi_phy to an
 independent module
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFJhbmR5OgoKUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+IOaWvCAyMDIw
5bm0OOaciDE55pelIOmAseS4iSDkuIvljYgxMTo1OOWvq+mBk++8mgo+Cj4gT24gOC8xOS8yMCA4
OjQ0IEFNLCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL0tjb25maWcK
PiA+IGluZGV4IGFhNzRhYWMzY2JjYy4uY2EzY2Q4NzFhMzUwIDEwMDY0NAo+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL0tjb25maWcKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9LY29uZmlnCj4gPiBAQCAtMjQsNiArMjQsMTMgQEAgY29uZmlnIERSTV9NRURJQVRF
S19IRE1JCj4gPiAgICAgICB0cmlzdGF0ZSAiRFJNIEhETUkgU3VwcG9ydCBmb3IgTWVkaWF0ZWsg
U29DcyIKPiA+ICAgICAgIGRlcGVuZHMgb24gRFJNX01FRElBVEVLCj4gPiAgICAgICBzZWxlY3Qg
U05EX1NPQ19IRE1JX0NPREVDIGlmIFNORF9TT0MKPiA+IC0gICAgIHNlbGVjdCBHRU5FUklDX1BI
WQo+ID4gKyAgICAgc2VsZWN0IFBIWV9NVEtfSERNSQo+ID4gICAgICAgaGVscAo+ID4gICAgICAg
ICBEUk0vS01TIEhETUkgZHJpdmVyIGZvciBNZWRpYXRlayBTb0NzCj4gPiArCj4gPiArY29uZmln
IFBIWV9NVEtfSERNSQo+ID4gKyAgICB0cmlzdGF0ZSAiTWVkaWFUZWsgSERNSS1QSFkgRHJpdmVy
Igo+ID4gKyAgICBkZXBlbmRzIG9uIEFSQ0hfTUVESUFURUsgJiYgT0YKPiA+ICsgICAgc2VsZWN0
IEdFTkVSSUNfUEhZCj4gPiArICAgIGhlbHAKPiA+ICsgICAgICAgICAgRW5hYmxlIHRoaXMgdG8g
c3VwcG9ydCBIRE1JLVBIWQo+Cj4gUGxlYXNlIGZpeCBhbGwgb2YgdGhlc2UgbmV3bHkgYWRkZWQg
bGluZXMuCj4KPiBmcm9tIERvY3VtZW50YXRpb24vcHJvY2Vzcy9jb2Rpbmctc3R5bGUucnN0Ogo+
Cj4gTGluZXMgdW5kZXIgYSBgYGNvbmZpZ2BgIGRlZmluaXRpb24KPiBhcmUgaW5kZW50ZWQgd2l0
aCBvbmUgdGFiLCB3aGlsZSBoZWxwIHRleHQgaXMgaW5kZW50ZWQgYW4gYWRkaXRpb25hbCB0d28K
PiBzcGFjZXMuCj4KCk9LLAoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiAtLQo+IH5SYW5keQo+
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
