Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EFA578169
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 13:58:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46F8B03C5;
	Mon, 18 Jul 2022 11:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m151.mail.126.com (m151.mail.126.com [220.181.15.1])
 by gabe.freedesktop.org (Postfix) with ESMTP id BF2B2B03B5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 11:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=1iHKf
 KDqQqGGyQNIa0q3QOf4bZCUTZ06F8pE8B8AOkA=; b=BDf4fkvWU4tGp6LOGoVPj
 Ge3JJkkBCiZ08Vsa4pttqlA88lpDxjI6bgYnTTg7FM+dryByvS2H4HcdbOTwPsIM
 W84J/MCgK/4OnxRbn4WaHYn83rASFPBmqWYRLxGSU1dX22lS8glheN1fYCY2VFg3
 Y0nUhcRPPP2PTRcpc6jJNI=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr1
 (Coremail) ; Mon, 18 Jul 2022 19:57:50 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date: Mon, 18 Jul 2022 19:57:50 +0800 (CST)
From: "Liang He" <windhl@126.com>
To: "Robert Foss" <robert.foss@linaro.org>
Subject: Re:Re: [PATCH] drm:bridge:analogix: Fix refcount bugs in
 anx7625_parse_dt()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <CAG3jFyvXcry+gpBz=gHuWqrwHmhm=2UFiXBDfTk3s4XbgXoXbg@mail.gmail.com>
References: <20220707012330.305646-1-windhl@126.com>
 <CAG3jFysYDVh2wk4VXePfZ_pwPvoa0EgP3Lv3pXXF6eu8W-Yt1g@mail.gmail.com>
 <CAG3jFyvXcry+gpBz=gHuWqrwHmhm=2UFiXBDfTk3s4XbgXoXbg@mail.gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <4599f9c4.380a.182112bf969.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AcqowADX6LC+StVibPgiAA--.58919W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3BtCF1pED8W4lgADsr
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
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
Cc: andrzej.hajda@intel.com, jonas@kwiboo.se, airlied@linux.ie,
 narmstrong@baylibre.com, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkF0IDIwMjItMDctMTggMTk6NTU6MTYsICJSb2JlcnQgRm9zcyIgPHJvYmVydC5mb3NzQGxpbmFy
by5vcmc+IHdyb3RlOgo+T24gTW9uLCAxOCBKdWwgMjAyMiBhdCAxMzo1NCwgUm9iZXJ0IEZvc3Mg
PHJvYmVydC5mb3NzQGxpbmFyby5vcmc+IHdyb3RlOgo+Pgo+PiBIZXkgTGlhbmcsCj4+Cj4+Cj4+
IE9uIFRodSwgNyBKdWwgMjAyMiBhdCAwMzoyNSwgTGlhbmcgSGUgPHdpbmRobEAxMjYuY29tPiB3
cm90ZToKPj4gPgo+PiA+IFRoZXJlIGFyZSB0d28gcmVmY291bnQgYnVncyBpbiB0aGlzIGZ1bmNp
b246Cj4+ID4KPj4gPiBCVUctMTogJ3BkYXRhLT5taXBpX2hvc3Rfbm9kZScgd2lsbCBiZSBhc3Np
Z25lZCBhIG5ldyByZWZlcmVuY2Ugd2l0aAo+PiA+IG9mX2dyYXBoX2dldF9yZW1vdGVfbm9kZSgp
IHdoaWNoIHdpbGwgaW5jcmVhc2UgdGhlIHJlZmNvdW50IG9mIHRoZQo+PiA+IG9iamVjdCwgY29y
cmVzcG9uZGluZ2x5LCB3ZSBzaG91bGQgY2FsbCBvZl9ub2RlX3B1dCgpIGZvciB0aGUgb2xkCj4+
ID4gcmVmZXJlbmNlIHN0b3JlZCBpbiB0aGUgJ3BkYXRhLT5taXBpX2hvc3Rfbm9kZScuCj4+ID4K
Pj4gPiBCVUctMjogb2ZfZ3JhcGhfZ2V0X2VuZHBvaW50X2J5X3JlZ3MoKSB3aWxsIGFsc28gaW5j
cmVhc2UgdGhlIHJlZmNvdW50Cj4+ID4gb2YgdGhlIG9iamVjdCBhbmQgaXRzIG5ldyByZWZlcmVu
Y2Ugd2lsbCBiZSBhc3NpZ25lZCB0byBsb2NhbCAnZXAwJywgc28KPj4gPiB0aGVyZSBzaG91bGQg
YmUgYSBvZl9ub2RlX3B1dCgpIHdoZW4gJ2VwMCcgaXMgbm90IHVzZWQgYW55bW9yZS4KPj4gPgo+
PiA+IEZpeGVzOiA4YmRmYzVkYWU0ZTMgKCJkcm0vYnJpZGdlOiBhbng3NjI1OiBBZGQgYW54NzYy
NSBNSVBJIERTSS9EUEkgdG8gRFAiKQo+PiA+IEZpeGVzOiBmZDAzMTBiNmZlN2QgKCJkcm0vYnJp
ZGdlOiBhbng3NjI1OiBhZGQgTUlQSSBEUEkgaW5wdXQgZmVhdHVyZSIpCj4+ID4gU2lnbmVkLW9m
Zi1ieTogTGlhbmcgSGUgPHdpbmRobEAxMjYuY29tPgo+PiA+IC0tLQo+PiA+ICBkcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FueDc2MjUuYyB8IDIgKysKPj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQo+PiA+Cj4+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvYW5hbG9naXgvYW54NzYyNS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFs
b2dpeC9hbng3NjI1LmMKPj4gPiBpbmRleCA1M2E1ZGE2YzQ5ZGQuLmYzOWI5YmUxOWVhZiAxMDA2
NDQKPj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FueDc2MjUuYwo+
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW54NzYyNS5jCj4+ID4g
QEAgLTE2MjQsNiArMTYyNCw3IEBAIHN0YXRpYyBpbnQgYW54NzYyNV9wYXJzZV9kdChzdHJ1Y3Qg
ZGV2aWNlICpkZXYsCj4+ID4gICAgICAgICBhbng3NjI1X2dldF9zd2luZ19zZXR0aW5nKGRldiwg
cGRhdGEpOwo+PiA+Cj4+ID4gICAgICAgICBwZGF0YS0+aXNfZHBpID0gMTsgLyogZGVmYXVsdCBk
cGkgbW9kZSAqLwo+PiA+ICsgICAgICAgb2Zfbm9kZV9wdXQocGRhdGEtPm1pcGlfaG9zdF9ub2Rl
KTsKPj4gPiAgICAgICAgIHBkYXRhLT5taXBpX2hvc3Rfbm9kZSA9IG9mX2dyYXBoX2dldF9yZW1v
dGVfbm9kZShucCwgMCwgMCk7Cj4+ID4gICAgICAgICBpZiAoIXBkYXRhLT5taXBpX2hvc3Rfbm9k
ZSkgewo+PiA+ICAgICAgICAgICAgICAgICBEUk1fREVWX0VSUk9SKGRldiwgImZhaWwgdG8gZ2V0
IGludGVybmFsIHBhbmVsLlxuIik7Cj4+ID4gQEAgLTE2MzgsNiArMTYzOSw3IEBAIHN0YXRpYyBp
bnQgYW54NzYyNV9wYXJzZV9kdChzdHJ1Y3QgZGV2aWNlICpkZXYsCj4+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgYnVzX3R5cGUgPSAwOwo+PiA+Cj4+ID4gICAgICAgICAgICAgICAgIG1pcGlf
bGFuZXMgPSBvZl9wcm9wZXJ0eV9jb3VudF91MzJfZWxlbXMoZXAwLCAiZGF0YS1sYW5lcyIpOwo+
PiA+ICsgICAgICAgICAgICAgICBvZl9ub2RlX3B1dChlcDApOwo+PiA+ICAgICAgICAgfQo+PiA+
Cj4+ID4gICAgICAgICBpZiAoYnVzX3R5cGUgPT0gVjRMMl9GV05PREVfQlVTX1RZUEVfUEFSQUxM
RUwpIC8qIGJ1cyB0eXBlIGlzIFBhcmFsbGVsKERTSSkgKi8KPj4gPiAtLQo+PiA+IDIuMjUuMQo+
PiA+Cj4+Cj4+IFRoaXMgcGF0Y2ggZG9lcyBub3QgYXBwbHkgb24gZHJtLW1pc2MtbmV4dCwgY291
bGQgeW91IHBsZWFzZSByZWJhc2UgaXQKPj4gYW5kIHNlbmQgYSB2Mj8KPgo+Q2FuIHlvdSBhbHNv
IGZpeCB0aGUgdGl0bGUsIGl0IHNob3VsZCBzdGFydCB3aXRoICJkcm0vYnJpZGdlOiBhbng3NjI1
OiIKClRoYW5rcywgSSB3aWxsIGZpeCBpdCBpbiBuZXcgcGF0Y2guCg==
