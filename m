Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3CE24C88C
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 01:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77ECA6EA6E;
	Thu, 20 Aug 2020 23:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DECBB6EA6E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 23:29:16 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 83B9B2184D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 23:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597966156;
 bh=bKIvHzrlFLAY5vwtgGAdC1wJCyUfAnJFseoDMgzigx8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=b+bEnNLE6+HsWq7x5OSDXaMkftNAz4NFkwWLXj7ccDE94t43MARMMjC3J94xYQmsA
 f6D6XYta+/yyG4M3BjviD5IKk89CnoRql9WFbfQERyU6olplbfAeu88OQp3G0va2rJ
 bGU2Yp698SHeTgNFdhjPMsDKfzOGkI9IEw9Tczno=
Received: by mail-ed1-f53.google.com with SMTP id i26so2637edv.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 16:29:16 -0700 (PDT)
X-Gm-Message-State: AOAM532nDASipzvKGQJM04cIDReq1Y9yD7kMwaYIYHMmlwGOAfIutdUD
 1PBZ6/Ouo0i98VP/w0a28xBW3LG3lJphFJhJ5Q==
X-Google-Smtp-Source: ABdhPJxnbCezgbtFQptt9Mtdn2+1CJtKJfQTBL+lG8Rgr+Qfl6BIxij5gSLnal0+cXbH0RS4NEWuTAiH8SrgPMLvX0g=
X-Received: by 2002:aa7:c606:: with SMTP id h6mr278114edq.288.1597966155156;
 Thu, 20 Aug 2020 16:29:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200819154421.7013-1-chunkuang.hu@kernel.org>
 <20200819154421.7013-4-chunkuang.hu@kernel.org>
 <919b4b36-8deb-dfbe-81fe-c12f8da65dac@infradead.org>
In-Reply-To: <919b4b36-8deb-dfbe-81fe-c12f8da65dac@infradead.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 21 Aug 2020 07:29:03 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9NOFyxGzvmHPo_6Oqm2AvZSJczC26GzZqC9EVJ=cqy7A@mail.gmail.com>
Message-ID: <CAAOTY_9NOFyxGzvmHPo_6Oqm2AvZSJczC26GzZqC9EVJ=cqy7A@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] phy: mediatek: Move mtk_hdmi_phy driver into
 drivers/phy/mediatek folder
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
5bm0OOaciDIw5pelIOmAseWbmyDkuIrljYgxMjowMOWvq+mBk++8mgo+Cj4gT24gOC8xOS8yMCA4
OjQ0IEFNLCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGh5
L21lZGlhdGVrL0tjb25maWcgYi9kcml2ZXJzL3BoeS9tZWRpYXRlay9LY29uZmlnCj4gPiBpbmRl
eCBkZWU3NTdjOTU3ZjIuLjEwZjBlYzJkNWI1NCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvcGh5
L21lZGlhdGVrL0tjb25maWcKPiA+ICsrKyBiL2RyaXZlcnMvcGh5L21lZGlhdGVrL0tjb25maWcK
PiA+IEBAIC0zNSwzICszNSwxMCBAQCBjb25maWcgUEhZX01US19YU1BIWQo+ID4gICAgICAgICBF
bmFibGUgdGhpcyB0byBzdXBwb3J0IHRoZSBTdXBlclNwZWVkUGx1cyBYUy1QSFkgdHJhbnNjZWl2
ZXIgZm9yCj4gPiAgICAgICAgIFVTQjMuMSBHRU4yIGNvbnRyb2xsZXJzIG9uIE1lZGlhVGVrIGNo
aXBzLiBUaGUgZHJpdmVyIHN1cHBvcnRzCj4gPiAgICAgICAgIG11bHRpcGxlIFVTQjIuMCwgVVNC
My4xIEdFTjIgcG9ydHMuCj4gPiArCj4gPiArY29uZmlnIFBIWV9NVEtfSERNSQo+ID4gKyAgICB0
cmlzdGF0ZSAiTWVkaWFUZWsgSERNSS1QSFkgRHJpdmVyIgo+ID4gKyAgICBkZXBlbmRzIG9uIEFS
Q0hfTUVESUFURUsgJiYgT0YKPiA+ICsgICAgc2VsZWN0IEdFTkVSSUNfUEhZCj4gPiArICAgIGhl
bHAKPiA+ICsgICAgICAgICAgRW5hYmxlIHRoaXMgdG8gc3VwcG9ydCBIRE1JLVBIWQo+Cj4gRml4
IGluZGVudGF0aW9uIGFib3ZlLgo+CgpPSywKClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+IHRoYW5r
cy4KPiAtLQo+IH5SYW5keQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
