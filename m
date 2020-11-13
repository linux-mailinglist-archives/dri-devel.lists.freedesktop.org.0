Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0EA2B3B14
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:08:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F30E289CF2;
	Mon, 16 Nov 2020 01:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs25.siol.net [185.57.226.216])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E886E5CA
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 18:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTP id D905E521624;
 Fri, 13 Nov 2020 19:02:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id ibErSGJqCdUh; Fri, 13 Nov 2020 19:02:00 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTPS id 8A966521623;
 Fri, 13 Nov 2020 19:02:00 +0100 (CET)
Received: from jernej-laptop.localnet (89-212-178-211.dynamic.t-2.net
 [89.212.178.211]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Zimbra) with ESMTPA id AE2D4521626;
 Fri, 13 Nov 2020 19:01:59 +0100 (CET)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: airlied@linux.ie, daniel@ffwll.ch,
 Xiongfeng Wang <wangxiongfeng2@huawei.com>
Subject: Re: [PATCH] drm/sun4i: dw-hdmi: fix error return code in
 sun8i_dw_hdmi_bind()
Date: Fri, 13 Nov 2020 19:01:59 +0100
Message-ID: <6119042.uhm7frSX9h@jernej-laptop>
In-Reply-To: <1605186891-47282-1-git-send-email-wangxiongfeng2@huawei.com>
References: <1605186891-47282-1-git-send-email-wangxiongfeng2@huawei.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Nov 2020 01:07:21 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, chenzhou10@huawei.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 wangxiongfeng2@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkhCgpUaGFua3MgZm9yIHRoZSBwYXRjaC4KCkRuZSDEjWV0cnRlaywgMTIuIG5vdmVtYmVyIDIw
MjAgb2IgMTQ6MTQ6NTEgQ0VUIGplIFhpb25nZmVuZyBXYW5nIG5hcGlzYWwoYSk6Cj4gRml4IHRv
IHJldHVybiBhIG5lZ2F0aXZlIGVycm9yIGNvZGUgZnJvbSB0aGUgZXJyb3IgaGFuZGxpbmcgY2Fz
ZSBpbnN0ZWFkCj4gb2YgMCBpbiBmdW5jdGlvbiBzdW44aV9kd19oZG1pX2JpbmQoKS4KPiAKPiBG
aXhlczogYjdjNzQzNmE1ZmYwICgiZHJtL3N1bjRpOiBJbXBsZW1lbnQgQTgzVCBIRE1JIGRyaXZl
ciIpCj4gUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IFhpb25nZmVuZyBXYW5nIDx3YW5neGlvbmdmZW5nMkBodWF3ZWkuY29tPgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfZHdfaGRtaS5jIHwgMSArCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vc3VuNGkvc3VuOGlfZHdfaGRtaS5jCj4gYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlf
ZHdfaGRtaS5jIGluZGV4IGQ0YzA4MDQuLmYwMTBmZTggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3N1bjRpL3N1bjhpX2R3X2hkbWkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40
aS9zdW44aV9kd19oZG1pLmMKPiBAQCAtMjA4LDYgKzIwOCw3IEBAIHN0YXRpYyBpbnQgc3VuOGlf
ZHdfaGRtaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0Cj4gZGV2aWNlICptYXN0ZXIs
IHBoeV9ub2RlID0gb2ZfcGFyc2VfcGhhbmRsZShkZXYtPm9mX25vZGUsICJwaHlzIiwgMCk7Cj4g
IAlpZiAoIXBoeV9ub2RlKSB7Cj4gIAkJZGV2X2VycihkZXYsICJDYW4ndCBmb3VuZCBQSFkgcGhh
bmRsZVxuIik7Cj4gKwkJcmV0ID0gLUVOT0RFVjsKClRoYXQgc2hvdWxkIGJlIEVJTlZBTCBiZWNh
dXNlIERUIG5vZGUgZG9lc24ndCBoYXZlIG1hbmRhdG9yeSBwcm9wZXJ0eS4KCldpdGggdGhhdCBm
aXhlZCwgeW91IGNhbiBhZGQ6ClJldmlld2VkLWJ5OiBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNr
cmFiZWNAc2lvbC5uZXQ+CgpCZXN0IHJlZ2FyZHMsCkplcm5lagoKPiAgCQlnb3RvIGVycl9kaXNh
YmxlX2Nsa190bWRzOwo+ICAJfQoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
