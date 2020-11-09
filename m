Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7457F2AB1C3
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 08:31:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F84D89471;
	Mon,  9 Nov 2020 07:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4DDB89471
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 07:31:30 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 1D1D780537;
 Mon,  9 Nov 2020 08:31:29 +0100 (CET)
Date: Mon, 9 Nov 2020 08:31:27 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Alex Shi <alex.shi@linux.alibaba.com>
Subject: Re: [PATCH] video: fbdev: riva: remove some unused varibles
Message-ID: <20201109073127.GC1715181@ravnborg.org>
References: <1604822519-65607-1-git-send-email-alex.shi@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604822519-65607-1-git-send-email-alex.shi@linux.alibaba.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=IkcTkHD0fZMA:10 a=SRrdq9N9AAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=e5mUnYsNAAAA:8 a=K4B7_0IVxdEOLhH2ft8A:9 a=QEXdDO2ut3YA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWxleCwKCk9uIFN1biwgTm92IDA4LCAyMDIwIGF0IDA0OjAxOjU5UE0gKzA4MDAsIEFsZXgg
U2hpIHdyb3RlOgo+IENvdXBsZSBvZiB2YXJpYWJsZXMgYXJlIGFjdHVhbGx5IHVzZWxlc3MsIHJl
bW92ZSB0aGVtIHRvIHNhdmUgc29tZSBnY2MKPiB3YXJuaW5nOgo+IGRyaXZlcnMvdmlkZW8vZmJk
ZXYvcml2YS9yaXZhX2h3LmM6MjUwOjIxOiB3YXJuaW5nOiB2YXJpYWJsZSDigJhtbHdt4oCZIHNl
dAo+IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPiBkcml2ZXJzL3Zp
ZGVvL2ZiZGV2L3JpdmEvcml2YV9ody5jOjY2NToxNTogd2FybmluZzogdmFyaWFibGUg4oCYdnJh
d+KAmSBzZXQKPiBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4gZHJp
dmVycy92aWRlby9mYmRldi9yaXZhL3JpdmFfaHcuYzo2NjU6OTogd2FybmluZzogdmFyaWFibGUg
4oCYY3Jhd+KAmSBzZXQKPiBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVd
Cj4gZHJpdmVycy92aWRlby9mYmRldi9yaXZhL3JpdmFfaHcuYzo2NTk6NzM6IHdhcm5pbmc6IHZh
cmlhYmxlIOKAmGFsaWdu4oCZIHNldAo+IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12
YXJpYWJsZV0KPiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3JpdmEvcml2YV9ody5jOjY1OTo1MDogd2Fy
bmluZzogdmFyaWFibGUKPiDigJhjb2xvcl9rZXlfZW5hYmxl4oCZIHNldCBidXQgbm90IHVzZWQg
Wy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxleCBTaGkg
PGFsZXguc2hpQGxpbnV4LmFsaWJhYmEuY29tPgo+IENjOiBBbnRvbmlubyBEYXBsYXMgPGFkYXBs
YXNAZ21haWwuY29tPiAKPiBDYzogbGludXgtZmJkZXZAdmdlci5rZXJuZWwub3JnIAo+IENjOiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIAo+IENjOiBsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnIAoKVGhhbmtzLCBhcHBsaWVkIHRvIGRybS1taXNjLW5leHQuIFRoZSBmaXggd2ls
bCBhcHBlYXIgaW4gLW5leHQgaW4gYSB3ZWVrCm9yIHNvLgoKCVNhbQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
