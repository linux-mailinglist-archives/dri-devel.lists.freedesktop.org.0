Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DFC12D796
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 10:37:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B3E16E1F2;
	Tue, 31 Dec 2019 09:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2826D89F41
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 01:26:04 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 971E09AEA5D8655BBE85;
 Tue, 31 Dec 2019 09:26:02 +0800 (CST)
Received: from [127.0.0.1] (10.57.60.129) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Tue, 31 Dec 2019
 09:25:55 +0800
Subject: Re: [PATCH] drm/hisilicon: Added three new resolutions and changed
 the alignment to 128 Bytes
To: Daniel Stone <daniel@fooishbar.org>, Tian Tao <tiantao6@hisilicon.com>
References: <1577495680-28766-1-git-send-email-tiantao6@hisilicon.com>
 <CAPj87rO-ZrCCJCza0Eeyp-JAJ6Qp8RdhJQh_1Yh_QSeK2o8_hw@mail.gmail.com>
From: "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <45055b17-041c-f726-6c5d-5769c96b92d9@huawei.com>
Date: Tue, 31 Dec 2019 09:25:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAPj87rO-ZrCCJCza0Eeyp-JAJ6Qp8RdhJQh_1Yh_QSeK2o8_hw@mail.gmail.com>
X-Originating-IP: [10.57.60.129]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 31 Dec 2019 09:37:01 +0000
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
Cc: David Airlie <airlied@linux.ie>, Chen Feng <puck.chen@hisilicon.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linuxarm@huawei.com, Xinliang
 Liu <xinliang.liu@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 tzimmermann@suse.de, Alex Deucher <alexander.deucher@amd.com>,
 tglx@linutronix.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIERhbmllbDoKClRoYW5rcyB5b3UgdmVyeSBtdWNoICxJIHdpbGwgZm9sbG93IHlvdXIgc3Vn
Z2VzdGlvbiB0byBzcGxpdCB0aGlzIHRvIAp0aHJlZSBwYXRjaGVzLgoKQmVzdArlnKggMjAxOS8x
Mi8zMCAxODoyMywgRGFuaWVsIFN0b25lIOWGmemBkzoKPiBIaSBUaWFuLAo+IAo+IE9uIFNhdCwg
MjggRGVjIDIwMTkgYXQgMDE6MTQsIFRpYW4gVGFvIDx0aWFudGFvNkBoaXNpbGljb24uY29tPiB3
cm90ZToKPj4gQEAgLTExOCwxMSArMTE5LDkgQEAgc3RhdGljIHZvaWQgaGlibWNfcGxhbmVfYXRv
bWljX3VwZGF0ZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKPj4gICAgICAgICAgd3JpdGVsKGdw
dV9hZGRyLCBwcml2LT5tbWlvICsgSElCTUNfQ1JUX0ZCX0FERFJFU1MpOwo+Pgo+PiAgICAgICAg
ICByZWcgPSBzdGF0ZS0+ZmItPndpZHRoICogKHN0YXRlLT5mYi0+Zm9ybWF0LT5jcHBbMF0pOwo+
PiAtICAgICAgIC8qIG5vdyBsaW5lX3BhZCBpcyAxNiAqLwo+PiAtICAgICAgIHJlZyA9IFBBRERJ
TkcoMTYsIHJlZyk7Cj4+Cj4+ICAgICAgICAgIGxpbmVfbCA9IHN0YXRlLT5mYi0+d2lkdGggKiBz
dGF0ZS0+ZmItPmZvcm1hdC0+Y3BwWzBdOwo+PiAtICAgICAgIGxpbmVfbCA9IFBBRERJTkcoMTYs
IGxpbmVfbCk7Cj4+ICsgICAgICAgbGluZV9sID0gUEFERElORygxMjgsIGxpbmVfbCk7Cj4gCj4g
VGhlICdsaW5lIGxlbmd0aCcgaGVyZSBpcyB0aGUgJ3N0cmlkZScgZmllbGQgb2YgdGhlIEZCLiBT
dHJpZGUgaXMgc2V0Cj4gYnkgdXNlcnNwYWNlIHdoZW4gYWxsb2NhdGluZyB0aGUgYnVmZmVyLCBh
bmQgdGhlIGtlcm5lbCBtdXN0IG5vdAo+IGF0dGVtcHQgdG8gZ3Vlc3Mgd2hhdCB1c2Vyc3BhY2Ug
c2V0Lgo+IAo+IFlvdSBzaG91bGQgdXNlIHN0YXRlLT5mYi0+c3RyaWRlc1swXSBkaXJlY3RseSBo
ZXJlLCBhbmQgaW4geW91cgo+IGF0b21pY19jaGVjaygpIGZ1bmN0aW9uLCBtYWtlIHN1cmUgdGhh
dCB0aGUgZnJhbWVidWZmZXIgc3RyaWRlIGlzCj4gY29ycmVjdGx5IGFsaWduZWQuCj4gCj4gUGxl
YXNlIHNwbGl0IHRoaXMgaW50byBhIHNlcGFyYXRlIGNoYW5nZS4gWW91ciBjb21taXQgaGFzIHRo
cmVlCj4gY2hhbmdlcyBpbiBpdCwgd2hpY2ggc2hvdWxkIGFsbCBiZSBzZXBhcmF0ZSBjb21taXRz
Ogo+ICAgICogZW5mb3JjZSAxMjgtYnl0ZSBzdHJpZGUgYWxpZ25tZW50IChpcyB0aGlzIGEgaGFy
ZHdhcmUgbGltaXQ/KQo+ICAgICogZ2V0IHRoZSBCTyBmcm9tIGRybV9mYiByYXRoZXIgdGhhbiBo
aWJtY19mYiAoY2FuIGhpYm1jX2ZiLT5vYmoKPiBqdXN0IGJlIHJlbW92ZWQgbm93PykKPiAgICAq
IGFkZCBuZXcgY2xvY2svcmVzb2x1dGlvbiBjb25maWd1cmF0aW9ucwo+IAo+IENoZWVycywKPiBE
YW5pZWwKPiAKPiAuCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
