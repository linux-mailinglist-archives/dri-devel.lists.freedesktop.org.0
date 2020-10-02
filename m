Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9CE2812DE
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 14:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF086E924;
	Fri,  2 Oct 2020 12:36:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13ACF6E924
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 12:36:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 7E41B29C483
Subject: Re: [PATCH v3 0/2] Add configurable handler to execute a compound
 action
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20200818112825.6445-1-andrzej.p@collabora.com>
 <20201002123158.GA3346786@kroah.com>
 <95030036-87fe-8c61-6fc6-c60452d8ca96@collabora.com>
Message-ID: <9bd7ff2e-ddf3-f950-54ad-c143e9c60daa@collabora.com>
Date: Fri, 2 Oct 2020 14:36:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <95030036-87fe-8c61-6fc6-c60452d8ca96@collabora.com>
Content-Language: en-US
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
Cc: linux-input@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jiri Slaby <jslaby@suse.com>, kernel@collabora.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VyBkbml1IDAyLjEwLjIwMjAgb8KgMTQ6MzMsIEFuZHJ6ZWogUGlldHJhc2lld2ljeiBwaXN6ZToK
PiBXIGRuaXUgMDIuMTAuMjAyMCBvwqAxNDozMSwgR3JlZyBLcm9haC1IYXJ0bWFuIHBpc3plOgo+
PiBPbiBUdWUsIEF1ZyAxOCwgMjAyMCBhdCAwMToyODoyM1BNICswMjAwLCBBbmRyemVqIFBpZXRy
YXNpZXdpY3ogd3JvdGU6Cj4+PiBUaGlzIGlzIGEgZm9sbG93LXVwIG9mIHRoaXMgdGhyZWFkOgo+
Pj4KPj4+IGh0dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2xpbnV4LWlucHV0L21zZzY4NDQ2
Lmh0bWwKPj4KPj4gbG9yZS5rZXJuZWwub3JnIGlzIGVhc2llciB0byBwdWxsIHN0dWZmIGZyb20g
OikKPj4KPj4gQW55d2F5LCB3aGF0IGV2ZXIgaGFwcGVuZWQgdG8gdGhpcyBzZXJpZXM/wqAgSXMg
dGhlcmUgYSBuZXdlciBvbmUKPj4gc29tZXdoZXJlPwo+Pgo+PiB0aGFua3MsCj4+Cj4+IGdyZWcg
ay1oCj4+Cj4gCj4gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjAvOC8xOC80NDAKPiAKPiBBbmRy
emVqCgpTb3JyeSBhYm91dCBjb25mdXNpb24uCgpUaGlzIGlzIHRoZSBzYW1lIHRoaW5nLCBzbyB0
aGVyZSBpcyBub3RoaW5nIG5ld2VyLgoKQW5kcnplagpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
