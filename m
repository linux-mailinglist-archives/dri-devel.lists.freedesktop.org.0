Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D76022A2066
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 18:37:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAAAB6EB3B;
	Sun,  1 Nov 2020 17:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E706E0CF
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Oct 2020 02:42:09 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CNNk70yFHz15NwZ;
 Sat, 31 Oct 2020 10:42:07 +0800 (CST)
Received: from [10.174.176.180] (10.174.176.180) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Sat, 31 Oct 2020 10:42:05 +0800
Subject: Re: [PATCH -next] drm/rockchip: cdn-dp: Mark
 cdn_dp_core_suspend/resume __maybe_unused
To: <hjc@rock-chips.com>, <heiko@sntech.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>
References: <20200811021225.50296-1-yuehaibing@huawei.com>
From: Yuehaibing <yuehaibing@huawei.com>
Message-ID: <4fa1e3fe-c254-6924-ed3b-a6fd4ca88e41@huawei.com>
Date: Sat, 31 Oct 2020 10:42:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200811021225.50296-1-yuehaibing@huawei.com>
X-Originating-IP: [10.174.176.180]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sun, 01 Nov 2020 17:36:56 +0000
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
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cGluZy4uLgoKT24gMjAyMC84LzExIDEwOjEyLCBZdWVIYWliaW5nIHdyb3RlOgo+IElmIENPTkZJ
R19QTSBpcyBub3Qgc2V0LCBnY2Mgd2FybnM6Cj4gCj4gZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlw
L2Nkbi1kcC1jb3JlLmM6MTEyNDoxMjoKPiAgd2FybmluZzog4oCYY2RuX2RwX3Jlc3VtZeKAmSBk
ZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtZnVuY3Rpb25dCj4gCj4gTWFyayB0aGVtIF9f
bWF5YmVfdW51c2VkIHRvIGZpeCB0aGlzLgo+IAo+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxo
dWxrY2lAaHVhd2VpLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5n
QGh1YXdlaS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9jZG4tZHAtY29y
ZS5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9jZG4tZHAt
Y29yZS5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2Nkbi1kcC1jb3JlLmMKPiBpbmRleCBh
NGE0NWRhZjkzZjIuLjQxM2IwZTkwZjEwZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
cm9ja2NoaXAvY2RuLWRwLWNvcmUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9j
ZG4tZHAtY29yZS5jCj4gQEAgLTExMDcsNyArMTEwNyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
Y29tcG9uZW50X29wcyBjZG5fZHBfY29tcG9uZW50X29wcyA9IHsKPiAgCS51bmJpbmQgPSBjZG5f
ZHBfdW5iaW5kLAo+ICB9Owo+ICAKPiAtc3RhdGljIGludCBjZG5fZHBfc3VzcGVuZChzdHJ1Y3Qg
ZGV2aWNlICpkZXYpCj4gK3N0YXRpYyBfX21heWJlX3VudXNlZCBpbnQgY2RuX2RwX3N1c3BlbmQo
c3RydWN0IGRldmljZSAqZGV2KQo+ICB7Cj4gIAlzdHJ1Y3QgY2RuX2RwX2RldmljZSAqZHAgPSBk
ZXZfZ2V0X2RydmRhdGEoZGV2KTsKPiAgCWludCByZXQgPSAwOwo+IEBAIC0xMTIxLDcgKzExMjEs
NyBAQCBzdGF0aWMgaW50IGNkbl9kcF9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgCXJl
dHVybiByZXQ7Cj4gIH0KPiAgCj4gLXN0YXRpYyBpbnQgY2RuX2RwX3Jlc3VtZShzdHJ1Y3QgZGV2
aWNlICpkZXYpCj4gK3N0YXRpYyBfX21heWJlX3VudXNlZCBpbnQgY2RuX2RwX3Jlc3VtZShzdHJ1
Y3QgZGV2aWNlICpkZXYpCj4gIHsKPiAgCXN0cnVjdCBjZG5fZHBfZGV2aWNlICpkcCA9IGRldl9n
ZXRfZHJ2ZGF0YShkZXYpOwo+ICAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
