Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6319C57815F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 13:57:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CDE7B00C1;
	Mon, 18 Jul 2022 11:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m151.mail.126.com (unknown [220.181.15.1])
 by gabe.freedesktop.org (Postfix) with ESMTP id 048D3B00C1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 11:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=N7Xce
 WnldKlXp9bvogAYt07FOx3BXQLDF2k/7MLJ6w8=; b=Jxz6XGgjZowzKxbw42jwf
 TZbQGxsj2qTqe0EWZOVP5TJ2Y2SmxIwaDBsnBi/a75gZDjpxpOJ0NXJjCzjPy6Jb
 X+5Y9bYlhAYntaoyVgkQ+P3CqDJjDAMK37LlH6cAQHwUC6Hzzts4AwHq0cGrlVzO
 st3TEAxn1sYXnMsW3tyIGA=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr1
 (Coremail) ; Mon, 18 Jul 2022 19:56:09 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date: Mon, 18 Jul 2022 19:56:09 +0800 (CST)
From: "Liang He" <windhl@126.com>
To: "Robert Foss" <robert.foss@linaro.org>
Subject: Re:Re: [PATCH] drm:bridge:analogix: Fix refcount bugs in
 anx7625_parse_dt()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <CAG3jFysYDVh2wk4VXePfZ_pwPvoa0EgP3Lv3pXXF6eu8W-Yt1g@mail.gmail.com>
References: <20220707012330.305646-1-windhl@126.com>
 <CAG3jFysYDVh2wk4VXePfZ_pwPvoa0EgP3Lv3pXXF6eu8W-Yt1g@mail.gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <1b561938.37f8.182112a6d7d.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AcqowAAXKbFaStViWfgiAA--.60127W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3BtCF1pED8W4lgACsq
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

CkF0IDIwMjItMDctMTggMTk6NTQ6MTgsICJSb2JlcnQgRm9zcyIgPHJvYmVydC5mb3NzQGxpbmFy
by5vcmc+IHdyb3RlOgo+SGV5IExpYW5nLAo+Cj4KPk9uIFRodSwgNyBKdWwgMjAyMiBhdCAwMzoy
NSwgTGlhbmcgSGUgPHdpbmRobEAxMjYuY29tPiB3cm90ZToKPj4KPj4gVGhlcmUgYXJlIHR3byBy
ZWZjb3VudCBidWdzIGluIHRoaXMgZnVuY2lvbjoKPj4KPj4gQlVHLTE6ICdwZGF0YS0+bWlwaV9o
b3N0X25vZGUnIHdpbGwgYmUgYXNzaWduZWQgYSBuZXcgcmVmZXJlbmNlIHdpdGgKPj4gb2ZfZ3Jh
cGhfZ2V0X3JlbW90ZV9ub2RlKCkgd2hpY2ggd2lsbCBpbmNyZWFzZSB0aGUgcmVmY291bnQgb2Yg
dGhlCj4+IG9iamVjdCwgY29ycmVzcG9uZGluZ2x5LCB3ZSBzaG91bGQgY2FsbCBvZl9ub2RlX3B1
dCgpIGZvciB0aGUgb2xkCj4+IHJlZmVyZW5jZSBzdG9yZWQgaW4gdGhlICdwZGF0YS0+bWlwaV9o
b3N0X25vZGUnLgo+Pgo+PiBCVUctMjogb2ZfZ3JhcGhfZ2V0X2VuZHBvaW50X2J5X3JlZ3MoKSB3
aWxsIGFsc28gaW5jcmVhc2UgdGhlIHJlZmNvdW50Cj4+IG9mIHRoZSBvYmplY3QgYW5kIGl0cyBu
ZXcgcmVmZXJlbmNlIHdpbGwgYmUgYXNzaWduZWQgdG8gbG9jYWwgJ2VwMCcsIHNvCj4+IHRoZXJl
IHNob3VsZCBiZSBhIG9mX25vZGVfcHV0KCkgd2hlbiAnZXAwJyBpcyBub3QgdXNlZCBhbnltb3Jl
Lgo+Pgo+PiBGaXhlczogOGJkZmM1ZGFlNGUzICgiZHJtL2JyaWRnZTogYW54NzYyNTogQWRkIGFu
eDc2MjUgTUlQSSBEU0kvRFBJIHRvIERQIikKPj4gRml4ZXM6IGZkMDMxMGI2ZmU3ZCAoImRybS9i
cmlkZ2U6IGFueDc2MjU6IGFkZCBNSVBJIERQSSBpbnB1dCBmZWF0dXJlIikKPj4gU2lnbmVkLW9m
Zi1ieTogTGlhbmcgSGUgPHdpbmRobEAxMjYuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvYW5hbG9naXgvYW54NzYyNS5jIHwgMiArKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9h
bmFsb2dpeC9hbng3NjI1LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FueDc2
MjUuYwo+PiBpbmRleCA1M2E1ZGE2YzQ5ZGQuLmYzOWI5YmUxOWVhZiAxMDA2NDQKPj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbng3NjI1LmMKPj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbng3NjI1LmMKPj4gQEAgLTE2MjQsNiArMTYyNCw3
IEBAIHN0YXRpYyBpbnQgYW54NzYyNV9wYXJzZV9kdChzdHJ1Y3QgZGV2aWNlICpkZXYsCj4+ICAg
ICAgICAgYW54NzYyNV9nZXRfc3dpbmdfc2V0dGluZyhkZXYsIHBkYXRhKTsKPj4KPj4gICAgICAg
ICBwZGF0YS0+aXNfZHBpID0gMTsgLyogZGVmYXVsdCBkcGkgbW9kZSAqLwo+PiArICAgICAgIG9m
X25vZGVfcHV0KHBkYXRhLT5taXBpX2hvc3Rfbm9kZSk7Cj4+ICAgICAgICAgcGRhdGEtPm1pcGlf
aG9zdF9ub2RlID0gb2ZfZ3JhcGhfZ2V0X3JlbW90ZV9ub2RlKG5wLCAwLCAwKTsKPj4gICAgICAg
ICBpZiAoIXBkYXRhLT5taXBpX2hvc3Rfbm9kZSkgewo+PiAgICAgICAgICAgICAgICAgRFJNX0RF
Vl9FUlJPUihkZXYsICJmYWlsIHRvIGdldCBpbnRlcm5hbCBwYW5lbC5cbiIpOwo+PiBAQCAtMTYz
OCw2ICsxNjM5LDcgQEAgc3RhdGljIGludCBhbng3NjI1X3BhcnNlX2R0KHN0cnVjdCBkZXZpY2Ug
KmRldiwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgYnVzX3R5cGUgPSAwOwo+Pgo+PiAgICAg
ICAgICAgICAgICAgbWlwaV9sYW5lcyA9IG9mX3Byb3BlcnR5X2NvdW50X3UzMl9lbGVtcyhlcDAs
ICJkYXRhLWxhbmVzIik7Cj4+ICsgICAgICAgICAgICAgICBvZl9ub2RlX3B1dChlcDApOwo+PiAg
ICAgICAgIH0KPj4KPj4gICAgICAgICBpZiAoYnVzX3R5cGUgPT0gVjRMMl9GV05PREVfQlVTX1RZ
UEVfUEFSQUxMRUwpIC8qIGJ1cyB0eXBlIGlzIFBhcmFsbGVsKERTSSkgKi8KPj4gLS0KPj4gMi4y
NS4xCj4+Cj4KPlRoaXMgcGF0Y2ggZG9lcyBub3QgYXBwbHkgb24gZHJtLW1pc2MtbmV4dCwgY291
bGQgeW91IHBsZWFzZSByZWJhc2UgaXQKPmFuZCBzZW5kIGEgdjI/Cj4KPlJvYi4KClRoYW5rcyBm
b3IgeW91ciByZXBseS4KCkkgd2lsbCByZWJhc2UgaXQgc29vbi4KCkxpYW5nCg==
