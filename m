Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B64DBD1AFB
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 23:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F9C6E845;
	Wed,  9 Oct 2019 21:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0D66E845
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 21:33:11 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E4094FF;
 Wed,  9 Oct 2019 23:33:09 +0200 (CEST)
Date: Thu, 10 Oct 2019 00:33:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: zhengbin <zhengbin13@huawei.com>
Subject: Re: [PATCH 1/4] drm/omap: Remove set but not used variable 'plane'
Message-ID: <20191009213307.GR22998@pendragon.ideasonboard.com>
References: <1570518949-47574-1-git-send-email-zhengbin13@huawei.com>
 <1570518949-47574-2-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1570518949-47574-2-git-send-email-zhengbin13@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1570656789;
 bh=tAG6Ar2LZTD4cck0ftmxDwi5IuCYXWUSnvurUDA7d6Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NTmMWjIXe2FtIf3LzN01zijQ7qkFK3oElqegXqzfidXDSWl299FfomHNrisWcz4lW
 nlrWB8zQccU3i5ZHID0nP3aXK7ljcwRX/AjZ9Y3tfTJB8Hhtx45IqoNMqX2pv/gCuR
 WAVJEnQDF945BqjhKdfexlyXWlAbyVTNRearyJHs=
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
MDE5IGF0IDAzOjE1OjQ2UE0gKzA4MDAsIHpoZW5nYmluIHdyb3RlOgo+IEZpeGVzIGdjYyAnLVd1
bnVzZWQtYnV0LXNldC12YXJpYWJsZScgd2FybmluZzoKPiAKPiBkcml2ZXJzL2dwdS9kcm0vb21h
cGRybS9vbWFwX2ZiLmM6IEluIGZ1bmN0aW9uIG9tYXBfZnJhbWVidWZmZXJfdXBkYXRlX3NjYW5v
dXQ6Cj4gZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9mYi5jOjEzMDoxNjogd2FybmluZzog
dmFyaWFibGUgcGxhbmUgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJs
ZV0KPiAKPiBJdCBpcyBub3QgdXNlZCBzaW5jZSBjb21taXQgMmVjY2VlYjUzYjE5ICgiZHJtL29t
YXA6Cj4gTW92ZSBidWZmZXIgcGl0Y2gvb2Zmc2V0IHRvIGRybV9mcmFtZWJ1ZmZlciIpCj4gCj4g
UmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IHpoZW5nYmluIDx6aGVuZ2JpbjEzQGh1YXdlaS5jb20+CgpSZXZpZXdlZC1ieTogTGF1cmVu
dCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgoKPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9mYi5jIHwgMyAtLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9vbWFw
ZHJtL29tYXBfZmIuYyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZmIuYwo+IGluZGV4
IDFiOGI1MTAuLjAwMWY0MjUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0v
b21hcF9mYi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9mYi5jCj4gQEAg
LTEzNSw3ICsxMzUsNiBAQCB2b2lkIG9tYXBfZnJhbWVidWZmZXJfdXBkYXRlX3NjYW5vdXQoc3Ry
dWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsCj4gIHsKPiAgCXN0cnVjdCBvbWFwX2ZyYW1lYnVmZmVy
ICpvbWFwX2ZiID0gdG9fb21hcF9mcmFtZWJ1ZmZlcihmYik7Cj4gIAljb25zdCBzdHJ1Y3QgZHJt
X2Zvcm1hdF9pbmZvICpmb3JtYXQgPSBvbWFwX2ZiLT5mb3JtYXQ7Cj4gLQlzdHJ1Y3QgcGxhbmUg
KnBsYW5lID0gJm9tYXBfZmItPnBsYW5lc1swXTsKPiAgCXUzMiB4LCB5LCBvcmllbnQgPSAwOwo+
IAo+ICAJaW5mby0+Zm91cmNjID0gZmItPmZvcm1hdC0+Zm9ybWF0Owo+IEBAIC0yMDksOCArMjA4
LDYgQEAgdm9pZCBvbWFwX2ZyYW1lYnVmZmVyX3VwZGF0ZV9zY2Fub3V0KHN0cnVjdCBkcm1fZnJh
bWVidWZmZXIgKmZiLAo+ICAJaW5mby0+c2NyZWVuX3dpZHRoIC89IGZvcm1hdC0+Y3BwWzBdOwo+
IAo+ICAJaWYgKGZiLT5mb3JtYXQtPmZvcm1hdCA9PSBEUk1fRk9STUFUX05WMTIpIHsKPiAtCQlw
bGFuZSA9ICZvbWFwX2ZiLT5wbGFuZXNbMV07Cj4gLQo+ICAJCWlmIChpbmZvLT5yb3RhdGlvbl90
eXBlID09IE9NQVBfRFNTX1JPVF9USUxFUikgewo+ICAJCQlXQVJOX09OKCEob21hcF9nZW1fZmxh
Z3MoZmItPm9ialsxXSkgJiBPTUFQX0JPX1RJTEVEKSk7Cj4gIAkJCW9tYXBfZ2VtX3JvdGF0ZWRf
ZG1hX2FkZHIoZmItPm9ialsxXSwgb3JpZW50LCB4LzIsIHkvMiwKCi0tIApSZWdhcmRzLAoKTGF1
cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
