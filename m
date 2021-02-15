Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6BC31B626
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 10:06:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31AF16E151;
	Mon, 15 Feb 2021 09:06:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB446E150
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 09:06:16 +0000 (UTC)
Date: Mon, 15 Feb 2021 09:06:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1613379973;
 bh=2nAm6Q9p3kMTXLrc/9PsknifgDbenAAUOXq3KGVIrtw=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=AgihlhiMBiKpn2AUSMU4MbjjTvrJBs+g1bQ2Z7b8VBvkxoiItg9javlL+V3ZfoiJg
 IeooACpUH4OVaTrX3hHe50R7sm6h7VarQsTDXwyUY0Kv2r0T8K2L7j6BN3BGh6YmFN
 PUlSgqUWc7yVU6DKZKu3NupB73Q44cDX7zsQhs/W7NO8/2MB231MTcFGSjaHuphS36
 Lh6Fo5qoe2kWu5gZL9fnUkA5fFUgzM8+xnMEpFS/pw6coIuKaBSinCXUm/QS79liZU
 c7G7x2oaubgXNU9wYybPMmwYc+gxXHoVLzrLxg6VUtykma0fnggRK7xzshR7XzIso0
 zXx+fQn+jz0+w==
To: =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: DMA-buf and uncached system memory
Message-ID: <GUuZYSQk2hxgykDhSxfB2GWo47lQlVrKBtWMwQUG7Ar2GAag5WQDxBI0zq6nDTooPBzTktyRpnu25Ju1UKE3FYD9yHbkNMAHcmSI96hoJhA=@emersion.fr>
In-Reply-To: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: linaro-mm-sig@lists.linaro.org, "Sharma,
 Shashank" <Shashank.Sharma@amd.com>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uZGF5LCBGZWJydWFyeSAxNXRoLCAyMDIxIGF0IDk6NTggQU0sIENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cgo+IHdlIGFyZSBjdXJyZW50bHkg
d29ya2luZyBhbiBGcmVlc3luYyBhbmQgZGlyZWN0IHNjYW4gb3V0IGZyb20gc3lzdGVtCj4gbWVt
b3J5IG9uIEFNRCBBUFVzIGluIEErQSBsYXB0b3BzLgo+Cj4gT24gcHJvYmxlbSB3ZSBzdHVtYmxl
ZCBvdmVyIGlzIHRoYXQgb3VyIGRpc3BsYXkgaGFyZHdhcmUgbmVlZHMgdG8gc2Nhbgo+IG91dCBm
cm9tIHVuY2FjaGVkIHN5c3RlbSBtZW1vcnkgYW5kIHdlIGN1cnJlbnRseSBkb24ndCBoYXZlIGEg
d2F5IHRvCj4gY29tbXVuaWNhdGUgdGhhdCB0aHJvdWdoIERNQS1idWYuCj4KPiBGb3Igb3VyIHNw
ZWNpZmljIHVzZSBjYXNlIGF0IGhhbmQgd2UgYXJlIGdvaW5nIHRvIGltcGxlbWVudCBzb21ldGhp
bmcKPiBkcml2ZXIgc3BlY2lmaWMsIGJ1dCB0aGUgcXVlc3Rpb24gaXMgc2hvdWxkIHdlIGhhdmUg
c29tZXRoaW5nIG1vcmUKPiBnZW5lcmljIGZvciB0aGlzPwo+Cj4gQWZ0ZXIgYWxsIHRoZSBzeXN0
ZW0gbWVtb3J5IGFjY2VzcyBwYXR0ZXJuIGlzIGEgUENJZSBleHRlbnNpb24gYW5kIGFzCj4gc3Vj
aCBzb21ldGhpbmcgZ2VuZXJpYy4KCkludGVsIGFsc28gbmVlZHMgdW5jYWNoZWQgc3lzdGVtIG1l
bW9yeSBpZiBJJ20gbm90IG1pc3Rha2VuPwoKV2hlcmUgYXJlIHRoZSBidWZmZXJzIGFsbG9jYXRl
ZD8gSWYgR0JNLCB0aGVuIGl0IG5lZWRzIHRvIGFsbG9jYXRlIG1lbW9yeSB0aGF0CmNhbiBiZSBz
Y2FubmVkIG91dCBpZiB0aGUgVVNFX1NDQU5PVVQgZmxhZyBpcyBzZXQgb3IgaWYgYSBzY2Fub3V0
LWNhcGFibGUKbW9kaWZpZXIgaXMgcGlja2VkLgoKSWYgdGhpcyBpcyBhYm91dCBjb21tdW5pY2F0
aW5nIGJ1ZmZlciBjb25zdHJhaW50cyBiZXR3ZWVuIGRpZmZlcmVudCBjb21wb25lbnRzCm9mIHRo
ZSBzdGFjaywgdGhlcmUgd2VyZSBhIGZldyBwcm9wb3NhbHMgYWJvdXQgaXQuIFRoZSBtb3N0IHJl
Y2VudCBvbmUgaXMgWzFdLgoKU2ltb24KClsxXTogaHR0cHM6Ly94ZGMyMDIwLngub3JnL2V2ZW50
LzkvY29udHJpYnV0aW9ucy82MTUvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
