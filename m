Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCA4BDB4B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 11:42:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 373846E820;
	Wed, 25 Sep 2019 09:42:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9976E820
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 09:42:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 32CE828E2F3
Subject: Re: [PATCH] drm/rockchip: Add AFBC support
To: Brian Starkey <Brian.Starkey@arm.com>
References: <20190923122014.18229-1-andrzej.p@collabora.com>
 <20190925093913.z4vduybwcokn3awi@DESKTOP-E1NTVVP.localdomain>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <e5fdc7ff-6171-6190-1bca-9f517f69b03c@collabora.com>
Date: Wed, 25 Sep 2019 11:42:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190925093913.z4vduybwcokn3awi@DESKTOP-E1NTVVP.localdomain>
Content-Language: en-US
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
Cc: nd <nd@arm.com>, "kernel@collabora.com" <kernel@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 Maxime Ripard <mripard@kernel.org>, Ayan Halder <Ayan.Halder@arm.com>,
 Sean Paul <sean@poorly.run>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQnJpYW4sCgpXIGRuaXUgMjUuMDkuMjAxOSBvwqAxMTozOSwgQnJpYW4gU3RhcmtleSBwaXN6
ZToKPiBIaSBBbmRyemVqLAo+IAo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLCBpdCdzIG5pY2UgdG8g
c2VlIGFub3RoZXIgQUZCQyBpbXBsZW1lbnRhdGlvbgo+IGNvbWluZyBpbi4KPiAKCkkgZGlkIGEg
ZmFsc2Ugc3RhcnQsIHRob3VnaC4gQnV0IHRoZSB3b3JrIGlzIGluIHByb2dyZXNzLiBUaGFua3Mg
Zm9yIHRoZSByZXZpZXcsIAphbnl3YXkuCgo+IEZvciBmdXR1cmUgdmVyc2lvbnMsIGNvdWxkIHlv
dSBwbGVhc2UgQ2MgYXlhbi5oYWxkZXJAYXJtLmNvbT8gSXQgd291bGQKPiBoYXZlIGJlZW4gbmlj
ZSB0byBoYXZlIHNvbWVvbmUgQGFybS5jb20gb24gcGF0Y2hlcyB3aGljaCB1c2UvaW1wYWN0Cj4g
QXJtIG1vZGlmaWVycy4gU2FkbHkgSSBkb24ndCBrbm93IGhvdyB0byBtYWtlIGdldF9tYWludGFp
bmVyLnBsIGhlbHAKCk9mIGNvdXJzZS4KCkFuZHJ6ZWoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
