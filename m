Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0F610DF90
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2019 23:16:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2A206E9AE;
	Sat, 30 Nov 2019 22:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CD56E9B6
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2019 22:16:34 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 71DC480615;
 Sat, 30 Nov 2019 23:16:31 +0100 (CET)
Date: Sat, 30 Nov 2019 23:16:30 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH V5 1/3] drm/panel: simple: Add Logic PD Type 28 display
 support
Message-ID: <20191130221630.GD29715@ravnborg.org>
References: <20191016135147.7743-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191016135147.7743-1-aford173@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8
 a=7gkXJVJtAAAA:8 a=JT2HSWW1Nyy1Gc0dzioA:9 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWRhbS4KCk9uIFdlZCwgT2N0IDE2LCAyMDE5IGF0IDA4OjUxOjQ1QU0gLTA1MDAsIEFkYW0g
Rm9yZCB3cm90ZToKPiBQcmV2aW91c2x5LCB0aGVyZSB3YXMgYW4gb21hcCBwYW5lbC1kcGkgZHJp
dmVyIHRoYXQgd291bGQKPiByZWFkIGdlbmVyaWMgdGltaW5ncyBmcm9tIHRoZSBkZXZpY2UgdHJl
ZSBhbmQgc2V0IHRoZSBkaXNwbGF5Cj4gdGltaW5nIGFjY29yZGluZ2x5LiAgVGhpcyBkcml2ZXIg
d2FzIHJlbW92ZWQgc28gdGhlIHNjcmVlbgo+IG5vIGxvbmdlciBmdW5jdGlvbnMuICBUaGlzIHBh
dGNoIG1vZGlmaWVzIHRoZSBwYW5lbC1zaW1wbGUKPiBmaWxlIHRvIHNldHVwIHRoZSB0aW1pbmdz
IHRvIHRoZSBzYW1lIHZhbHVlcyBwcmV2aW91c2x5IHVzZWQuCj4gCj4gRml4ZXM6IDhiZjRiMTYy
MTE3OCAoImRybS9vbWFwOiBSZW1vdmUgcGFuZWwtZHBpIGRyaXZlciIpCj4gCj4gU2lnbmVkLW9m
Zi1ieTogQWRhbSBGb3JkIDxhZm9yZDE3M0BnbWFpbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFNhbSBS
YXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiAtLS0KPiBWNTogIE5vIENoYW5nZQo+IFY0OiAg
Tm8gQ2hhbmdlCj4gVjM6ICBObyBDaGFuZ2UKPiBWMjogIE5vIENoYW5nZQoKQXBwbGllZCB0byBk
cm0tbWlzYy1uZXh0LgpTb3JyeSBmb3IgdGhlIGRlbGF5IC0gaGFzIGJlZW4gYWJzZW50IGZvciBh
IHdoaWxlLgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
