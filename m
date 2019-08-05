Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1905982697
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 23:09:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E7789DA9;
	Mon,  5 Aug 2019 21:09:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB2189DA9
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 21:09:41 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 20B5020B1F
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 21:09:41 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id k10so13288253qtq.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 14:09:41 -0700 (PDT)
X-Gm-Message-State: APjAAAV/T5l83aftR5ODvXKirPDAGIfgEAl5KVtnow4bzT30xlLsP0kI
 BA620nlQkH77FMEck5L5zCTAA+zf1gzEiegPmQ==
X-Google-Smtp-Source: APXvYqyfIfUNxCLM1OGPnGF8ifoJ93RQ3qvRzoIBSDmN57bp9J82CNC9s6MwsE66sdYQB8bpCylIP8u9VYRaKZGw1Rw=
X-Received: by 2002:ac8:3908:: with SMTP id s8mr107726qtb.224.1565039380360;
 Mon, 05 Aug 2019 14:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190802195727.1963-1-robh@kernel.org>
 <30a588f0-ed4f-544c-cf61-21ed5377212c@collabora.com>
In-Reply-To: <30a588f0-ed4f-544c-cf61-21ed5377212c@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 5 Aug 2019 15:09:28 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+C9uhM1MGmvWpbA7HWYhFGrpHC=6fXV1TpyNQ5Aup9Aw@mail.gmail.com>
Message-ID: <CAL_Jsq+C9uhM1MGmvWpbA7HWYhFGrpHC=6fXV1TpyNQ5Aup9Aw@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Remove completed features still in TODO
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565039381;
 bh=fCLgYQnq6sVUSVqiWAcNHsrXZtBOyphTX+gwPtqf2IE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vS6XdfOGU/wcBoALBcx76vTJnFfeV92YNKBKq4dSUyteTWItMMCIW0Uh321mXG12z
 XCsy643f0bllYXVXiiJrtWlUjCGWJAk78w1FIUALI0e+8rpi37k4OGKHIbWjZ7Z1/f
 IrVkuaMDZrh02nlePMcsEHuku9DTR7tc+dO65A18=
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgNSwgMjAxOSBhdCAxMDowNyBBTSBUb21ldSBWaXpvc28gPHRvbWV1LnZpem9z
b0Bjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+IE9uIDgvMi8xOSA5OjU3IFBNLCBSb2IgSGVycmlu
ZyB3cm90ZToKPiA+IFRoZXJlJ3MgYSBmZXcgZmVhdHVyZXMgdGhlIGRyaXZlciBzdXBwb3J0cyB3
aGljaCB3ZSBmb3Jnb3QgdG8gcmVtb3ZlLCBzbwo+ID4gcmVtb3ZlIHRoZW0gbm93Lgo+ID4KPiA+
IENjOiBUb21ldSBWaXpvc28gPHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEuY29tPgo+ID4gQ2M6IEJv
cmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgIGRyaXZl
cnMvZ3B1L2RybS9wYW5mcm9zdC9UT0RPIHwgOSAtLS0tLS0tLS0KPiA+ICAgMSBmaWxlIGNoYW5n
ZWQsIDkgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9w
YW5mcm9zdC9UT0RPIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L1RPRE8KPiA+IGluZGV4IGMy
ZTQ0YWRkMzdkOC4uMmFjOTcyYTM0NjljIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L1RPRE8KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9UT0RPCj4g
PiBAQCAtMSwxNSArMSw5IEBACj4gPiAtLSBUaGVybWFsIHN1cHBvcnQuCj4KPiBXYXMgdGhpbmtp
bmcgdGhhdCB0aGlzIGl0ZW0gcmVmZXJyZWQgdG8gY29vbGluZyBkZXZpY2Ugc3VwcG9ydCwgd2hp
Y2ggd2UKPiBkb24ndCB5ZXQgaGF2ZT8KCk9oIHJpZ2h0LiBJIHRoaW5raW5nIHRoYXQgc29tZWhv
dyB3YXMgbGVmdCBvdmVyIGZyb20gYmVmb3JlIGNvbW1pdHRpbmcKdXBzdHJlYW0uLi4gV2lsbCBk
cm9wIHRoYXQgY2hhbmdlLgoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
