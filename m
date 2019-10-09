Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B027D1B18
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 23:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE6136E33D;
	Wed,  9 Oct 2019 21:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0AD06E33D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 21:42:02 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A5DAF4FF;
 Wed,  9 Oct 2019 23:42:00 +0200 (CEST)
Date: Thu, 10 Oct 2019 00:41:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: zhengbin <zhengbin13@huawei.com>
Subject: Re: [PATCH 4/4] drm/omap: Remove set but not used variable 'err' in
 hdmi4_audio_config
Message-ID: <20191009214159.GU22998@pendragon.ideasonboard.com>
References: <1570518949-47574-1-git-send-email-zhengbin13@huawei.com>
 <1570518949-47574-5-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1570518949-47574-5-git-send-email-zhengbin13@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1570657320;
 bh=VyomOlSOpmQPReZ3bcdXoSw0mjDLRk+NCahEK0ZgjHA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gtk0T4+bw91Bc1cNO2zT9FVi+IGLGRc4IjbqKAhG+77p44rSlNMzcV1fntF2SynW+
 +Fx2xukVMcuzyueUM/BNZizSbzyWDEWnl5N+7K93nGPR0Qsn/tX35bWHqgoHFXaJ9j
 mrZrnkFjMPOK0+cTwbKldxQS2dGFToHHWcDyaXC8=
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
Cc: airlied@linux.ie, tomi.valkeinen@ti.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgWmhlbmdiaW4sCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIFR1ZSwgT2N0IDA4LCAy
MDE5IGF0IDAzOjE1OjQ5UE0gKzA4MDAsIHpoZW5nYmluIHdyb3RlOgo+IEZpeGVzIGdjYyAnLVd1
bnVzZWQtYnV0LXNldC12YXJpYWJsZScgd2FybmluZzoKPiAKPiBkcml2ZXJzL2dwdS9kcm0vb21h
cGRybS9kc3MvaGRtaTRfY29yZS5jOiBJbiBmdW5jdGlvbiBoZG1pNF9hdWRpb19jb25maWc6Cj4g
ZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2hkbWk0X2NvcmUuYzo2ODk6Njogd2FybmluZzog
dmFyaWFibGUgZXJyIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVd
Cj4gCj4gSXQgaXMgbm90IHVzZWQgc2luY2UgY29tbWl0IGY1YmFiMjIyOTE5MCAoIk9NQVBEU1M6
Cj4gSERNSTogQWRkIE9NQVA1IEhETUkgc3VwcG9ydCIpCj4gCj4gUmVwb3J0ZWQtYnk6IEh1bGsg
Um9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgo+IFNpZ25lZC1vZmYtYnk6IHpoZW5nYmluIDx6aGVu
Z2JpbjEzQGh1YXdlaS5jb20+CgpTYW1lIGFuYWx5c2lzIGFzIGZvciBwYXRjaCAzLzQsCgpSZXZp
ZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQu
Y29tPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2hkbWk0X2NvcmUuYyB8
IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaTRfY29y
ZS5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2hkbWk0X2NvcmUuYwo+IGluZGV4IDVk
NWQ1NTguLjZmMzk4OGUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNz
L2hkbWk0X2NvcmUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9oZG1pNF9j
b3JlLmMKPiBAQCAtNjc1LDcgKzY3NSw3IEBAIGludCBoZG1pNF9hdWRpb19jb25maWcoc3RydWN0
IGhkbWlfY29yZV9kYXRhICpjb3JlLCBzdHJ1Y3QgaGRtaV93cF9kYXRhICp3cCwKPiAgCXN0cnVj
dCBoZG1pX2F1ZGlvX2Zvcm1hdCBhdWRpb19mb3JtYXQ7Cj4gIAlzdHJ1Y3QgaGRtaV9hdWRpb19k
bWEgYXVkaW9fZG1hOwo+ICAJc3RydWN0IGhkbWlfY29yZV9hdWRpb19jb25maWcgYWNvcmU7Cj4g
LQlpbnQgZXJyLCBuLCBjdHMsIGNoYW5uZWxfY291bnQ7Cj4gKwlpbnQgbiwgY3RzLCBjaGFubmVs
X2NvdW50Owo+ICAJdW5zaWduZWQgaW50IGZzX25yOwo+ICAJYm9vbCB3b3JkX2xlbmd0aF8xNmIg
PSBmYWxzZTsKPiAKPiBAQCAtNzM3LDcgKzczNyw3IEBAIGludCBoZG1pNF9hdWRpb19jb25maWco
c3RydWN0IGhkbWlfY29yZV9kYXRhICpjb3JlLCBzdHJ1Y3QgaGRtaV93cF9kYXRhICp3cCwKPiAg
CQlyZXR1cm4gLUVJTlZBTDsKPiAgCX0KPiAKPiAtCWVyciA9IGhkbWlfY29tcHV0ZV9hY3IocGNs
aywgZnNfbnIsICZuLCAmY3RzKTsKPiArCWhkbWlfY29tcHV0ZV9hY3IocGNsaywgZnNfbnIsICZu
LCAmY3RzKTsKPiAKPiAgCS8qIEF1ZGlvIGNsb2NrIHJlZ2VuZXJhdGlvbiBzZXR0aW5ncyAqLwo+
ICAJYWNvcmUubiA9IG47CgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
