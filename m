Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1DA18DF8F
	for <lists+dri-devel@lfdr.de>; Sat, 21 Mar 2020 11:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A0666E321;
	Sat, 21 Mar 2020 10:44:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 449 seconds by postgrey-1.36 at gabe;
 Fri, 20 Mar 2020 11:42:03 UTC
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68956EB0C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 11:42:03 +0000 (UTC)
Received: from localhost (unknown [192.168.167.209])
 by lucky1.263xmail.com (Postfix) with ESMTP id E92828F280;
 Fri, 20 Mar 2020 19:34:27 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 0
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from [172.16.12.182] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P11671T139978099107584S1584704067015399_; 
 Fri, 20 Mar 2020 19:34:27 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <0306da8995e5bcc9ca69cb97e094f8d4>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: hjc@rock-chips.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Subject: Re: [PATCHv7 6/6] drm/rockchip: Add support for afbc
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko@sntech.de>
References: <20200311145541.29186-1-andrzej.p@collabora.com>
 <20200311145541.29186-7-andrzej.p@collabora.com>
 <CACvgo51t=o2g8SENzqd+2EKbTgE++z5sna8ZFGRrCKfMW2bjyw@mail.gmail.com>
 <3d4f027e-8de3-ba7c-5654-31eda66a7681@rock-chips.com>
 <d422f838-2c93-b356-c74d-d7da80000f8d@collabora.com>
From: Sandy Huang <hjc@rock-chips.com>
Message-ID: <a095195a-7081-2dfe-a67f-7da61b8a850e@rock-chips.com>
Date: Fri, 20 Mar 2020 19:34:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <d422f838-2c93-b356-c74d-d7da80000f8d@collabora.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 21 Mar 2020 10:44:26 +0000
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
Cc: kernel@collabora.com, Mihail Atanassov <mihail.atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 James Wang <james.qian.wang@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Ayan Halder <Ayan.Halder@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5kcnplaiAsCgoK5ZyoIDIwMjAvMy8xOSDkuIvljYg1OjU0LCBBbmRyemVqIFBpZXRyYXNp
ZXdpY3og5YaZ6YGTOgo+IEhpIFNhbmR5LAo+Cj4KPiBXIGRuaXUgMTkuMDMuMjAyMCBvwqAwMzo1
NywgU2FuZHkgSHVhbmcgcGlzemU6Cj4+IEhpIEVtaWwsCj4+Cj4KPiA8c25pcD4KPgo+Pj4+IC0t
IAo+Pj4+IDIuMTcuMQo+Pj4gSGVpa28sIFNhbmR5LCBiZWluZyB0aGUgbWFpbnRhaW5lcnMgb2Yg
dGhlIFJvY2tjaGlwIGRyaXZlciwgY2FuIHlvdQo+Pj4gcmV2aWV3L2FjayB0aGlzIHBhdGNoPwo+
Pj4KPj4+IEkgYmVsaWV2ZSB0aGUgaW50ZW50aW9uIGlzIHRvIG1lcmdlIHRoZSBzZXJpZXMgdmlh
IGRybS1taXNjLiBBbmRyemVqCj4+PiBhbHJlYWR5IGhhcyBjb21taXQgYWNjZXNzLgo+Pj4KPj4+
IC1FbWlsCj4+Pgo+Pj4KPj4gVGhhbmtzIGZvciB5b3UgcGF0Y2gsIG1heWJlIHdlIG5lZWQgdG8g
Y29uc2lkZXIgdGhlIGNvbXBhdGliaWxpdHkgCj4+IHdpdGggcHgzMCBwbGF0Zm9ybSBhZmJjIGZl
YXR1cmVzLHRoZSBtYWluIGRpZmZlcmVuY2UgaXM6Cj4+Cj4+IDEuwqAgcHgzMCBzdXBwb3J0IHgg
b2Zmc2V0IGFuZCB5IG9mZnNldCBkaXNwbGF5LCBhbmQgdGhlIHN0YXRlLT5zcmMueDEgCj4+IC8g
c3RhdGUtPnNyYy55McKgIHNob3VsZCBiZSBhbGliZWduZWQgYXMgMTZwaXhlbC9saW5lOwo+Pgo+
PiAyLnB4MzAgb25seSB3aW4xIGNhbiBzdXBwb3J0IGFmYmRjIGZvcm1hdDsKPj4KPj4KPgo+IEFj
dHVhbGx5IEkgc2VudCB0aGUgcGF0Y2gsIEVtaWwga2luZGx5IGZvcndhcmRlZCBpdCB0byB5b3Uu
Cj4KPiBVbmZvcnR1bmF0ZWx5IEkgZG9uJ3QgaGF2ZSBweDMwIGhhcmR3YXJlLCBzbyBJIGNhbid0
IHRlc3QuIENhbiB3ZQo+IG1lcmdlIHRoZSBwYXRjaCBhcyBpcyAoaWYgeW91IGFyZSBvayB3aXRo
IHRoZSB3YXkgaXQgaXMgbm93KSBhbmQgdGhlbgo+IEkgd2lsbCBoZWxwIHJldmlld2luZyB0aGUg
cGF0Y2ggYWRkaW5nIHB4MzAgc3VwcG9ydCBvbiB0b3Agb2YgaXQ/Cj4KPiBSZWdhcmRzLAo+Cj4g
QW5kcnplagoKT0ssIExldCdzIGFkZCBweDMwIEFGQkMgc3VwcG9ydCBsYXRlci4KClJldmlld2Vk
LWJ5OiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgoKPgo+Cj4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
