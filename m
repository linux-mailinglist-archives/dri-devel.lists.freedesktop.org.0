Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAA07DE53
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 16:59:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F02C6E6B9;
	Thu,  1 Aug 2019 14:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642CA8953E
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 14:59:27 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id B48CB20020;
 Thu,  1 Aug 2019 16:59:23 +0200 (CEST)
Date: Thu, 1 Aug 2019 16:59:22 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 1/2] drm: gm12u320: Some minor cleanups
Message-ID: <20190801145922.GA30758@ravnborg.org>
References: <20190730133857.30778-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190730133857.30778-1-hdegoede@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=7gkXJVJtAAAA:8
 a=SJz97ENfAAAA:8 a=20KFwNOVAAAA:8 a=MexPRQbDNVDQGgWwFxoA:9
 a=wPNLvfGTeEIA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=vFet0B0WnEQeilDPIY6i:22
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSGFucy4KCk9uIFR1ZSwgSnVsIDMwLCAyMDE5IGF0IDAzOjM4OjU2UE0gKzAyMDAsIEhhbnMg
ZGUgR29lZGUgd3JvdGU6Cj4gMyBzbWFsbCBjbGVhbnVwczoKPiAKPiAxKSBEcm9wIHVudXNlZCBE
UklWRVJfUEFUQ0hMRVZFTAo+IDIpIFdlIGRvIG5vdCBzZXQgbW9kZV9jb25maWcucHJlZmVycmVk
X2RlcHRoLCBzbyBpbnN0ZWFkIG9mIHBhc3NpbmcgdGhlCj4gICAgdW5zZXQgbW9kZV9jb25maWcu
cHJlZmVycmVkX2RlcHRoIHRvIGRybV9mYmRldl9nZW5lcmljX3NldHVwCj4gICAgc2ltcGx5IHBh
c3MgMAo+IDMpIFVzZSBfX21heWJlX3VudXNlZCBpbnN0ZWFkIG9mICNpZmRlZiBDT05GSUdfUE0g
YXJvdW5kIHRoZSBzdXNwZW5kIC8KPiAgICByZXN1bWUgZnVuY3Rpb25zCj4gCj4gQ2M6IFNhbSBS
YXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBTdWdnZXN0ZWQtYnk6IFNhbSBSYXZuYm9yZyA8
c2FtQHJhdm5ib3JnLm9yZz4KSWYgeW91IGFkZDoKU3VnZ2VzdGVkLWJ5OiBOb3JhbGYgVHLDuG5u
ZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KQW5kIGFkanVzdCB0byB0aGUgbmV3IGxvY2F0aW9uLgoK
VGhlbiB0aGlzIGlzOgpSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3Jn
PgoKPiBTaWduZWQtb2ZmLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgoK
CVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
