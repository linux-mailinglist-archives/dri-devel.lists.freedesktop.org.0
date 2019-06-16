Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 549C2474CF
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 15:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9B98917E;
	Sun, 16 Jun 2019 13:41:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3DC689142
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 13:41:36 +0000 (UTC)
Received: from ip5f5a6320.dynamic.kabel-deutschland.de ([95.90.99.32]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1hcVPP-0006LO-9I; Sun, 16 Jun 2019 15:41:23 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/2] drm/rockchip: Properly adjust to a true clock in
 adjusted_mode
Date: Sun, 16 Jun 2019 15:41:22 +0200
Message-ID: <2111307.tjTOxoAehH@diego>
In-Reply-To: <20190614224730.98622-1-dianders@chromium.org>
References: <20190614224730.98622-1-dianders@chromium.org>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, urjaman@gmail.com,
 linux-rockchip@lists.infradead.org, seanpaul@chromium.org,
 Yakir Yang <ykk@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gU2Ftc3RhZywgMTUuIEp1bmkgMjAxOSwgMDA6NDc6MjkgQ0VTVCBzY2hyaWViIERvdWdsYXMg
QW5kZXJzb246Cj4gV2hlbiBmaXhpbmcgdXAgdGhlIGNsb2NrIGluIHZvcF9jcnRjX21vZGVfZml4
dXAoKSB3ZSdyZSBub3QgZG9pbmcgaXQKPiBxdWl0ZSBjb3JyZWN0bHkuICBTcGVjaWZpY2FsbHkg
aWYgd2UndmUgZ290IHRoZSB0cnVlIGNsb2NrIDI2NjY2NjY2NyBIeiwKPiB3ZSdsbCBwZXJmb3Jt
IHRoaXMgY2FsY3VsYXRpb246Cj4gICAgMjY2NjY2NjY3IC8gMTAwMCA9PiAyNjY2NjYKPiAKPiBM
YXRlciB3aGVuIHdlIHRyeSB0byBzZXQgdGhlIGNsb2NrIHdlJ2xsIGRvIGNsa19zZXRfcmF0ZSgy
NjY2NjYgKgo+IDEwMDApLiAgVGhlIGNvbW1vbiBjbG9jayBmcmFtZXdvcmsgd29uJ3QgYWN0dWFs
bHkgcGljayB0aGUgcHJvcGVyIGNsb2NrCj4gaW4gdGhpcyBjYXNlIHNpbmNlIGl0IGFsd2F5cyB3
YW50cyBjbG9ja3MgPD0gdGhlIHNwZWNpZmllZCBvbmUuCj4gCj4gTGV0J3Mgc29sdmUgdGhpcyBi
eSB1c2luZyBESVZfUk9VTkRfVVAuCj4gCj4gRml4ZXM6IGI1OWI4ZGUzMTQ5NyAoImRybS9yb2Nr
Y2hpcDogcmV0dXJuIGEgdHJ1ZSBjbG9jayByYXRlIHRvIGFkanVzdGVkX21vZGUiKQo+IFNpZ25l
ZC1vZmYtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KPiBTaWdu
ZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KPiBSZXZpZXdlZC1i
eTogWWFraXIgWWFuZyA8eWtrQHJvY2stY2hpcHMuY29tPgoKSSBnYXZlIGJvdGggcGF0Y2hlcyBh
IHRlc3RydW4gb24gcmszMjg4LCByazMzMjggYW5kIHJrMzM5OSBhbmQKYXBwbGllZCB0aGVtIHRv
IGRybS1taXNjLW5leHQgdGhlcmVhZnRlcgoKClRoYW5rcwpIZWlrbwoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
